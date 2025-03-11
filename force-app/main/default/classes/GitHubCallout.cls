public with sharing class GitHubCallout {
    
    private static final String GITHUB_API_ENDPOINT = 'callout:NCGitHubAPI'; // Named Credential

    /**
     * Fetches a list of repositories for the authenticated GitHub user.
     */
    public static void getUserRepositories() {
        HttpRequest request = new HttpRequest();
        request.setEndpoint(GITHUB_API_ENDPOINT + '/user/repos');
        request.setMethod('GET');

        Http http = new Http();
        HttpResponse response;
        
        try {
            response = http.send(request);
            if (response.getStatusCode() == 200) {
                System.debug('Repositories: ' + response.getBody());
            } else {
                System.debug('Error: ' + response.getStatusCode() + ' - ' + response.getBody());
            }
        } catch (Exception e) {
            System.debug('Callout Error: ' + e.getMessage());
        }
    }
}