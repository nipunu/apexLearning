global class SecureCaseWebService {
    
    webservice static Id createSecureCase(String subject, String status, String priority) {
        // Check user permissions before inserting a Case
        Schema.DescribeSObjectResult caseDescribe = Case.sObjectType.getDescribe();
        if (!caseDescribe.isAccessible()) {
            throw new CalloutException('Access denied: You do not have permission to create a Case.');
        }

        // Create a new Case
        Case newCase = new Case(
            Subject = subject,
            Status = status,
            Priority = priority
        );
        insert newCase;
        return newCase.Id;
    }
}
