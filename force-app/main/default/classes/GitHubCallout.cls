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

    public static Map<String, Object> getRepositoryDetails(String owner, String repoName) {
        try {
            String endpoint = GITHUB_API_ENDPOINT + '/repos/' + owner + '/' + repoName;

            HttpRequest req = new HttpRequest();
            req.setEndpoint(endpoint);
            req.setMethod('GET');
            req.setHeader('Accept', 'application/json');

            Http http = new Http();
            HttpResponse res = http.send(req);

            if (res.getStatusCode() == 200) {
                return (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
            } else {
                System.debug('Error: ' + res.getStatusCode() + ' ' + res.getBody());
                return null;
            }
        } catch (Exception e) {
            System.debug('Exception: ' + e.getMessage());
            return null;
        }
    }
}