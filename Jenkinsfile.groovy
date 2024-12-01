pipeline{
    agent any
    stage{
        stage('script1'){
            steps{
                build job: 'script1'
            }
        }

    }
    stage{
        stage('script2'){
            steps{
                build job: 'script2'
            }
        }
        
    }
}