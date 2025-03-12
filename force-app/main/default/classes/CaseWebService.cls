global class CaseWebService {
    
    // Expose the method as a SOAP Web Service
    webservice static Id createCase(String subject, String status, String priority,String origin) {
        // Validate input
        if (String.isEmpty(subject) || String.isEmpty(status)) {
            throw new CalloutException('Subject and Status are required fields.');
        }

        // Create the case
        Case newCase = new Case(
            Subject = subject,
            Status = status,
            Priority = priority,
            Origin = origin
        );
        insert newCase;
        
        // Return the newly created Case ID
        return newCase.Id;
    }
}