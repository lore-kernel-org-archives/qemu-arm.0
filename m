Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id f20-20020a7bcd14000000b003fe2b6d64c8sm5144804wmj.21.2023.09.14.08.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 08:54:25 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 1DCB11FFC1;
	Thu, 14 Sep 2023 16:54:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	John Snow <jsnow@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 6/9] gitlab: make Cirrus CI timeout explicit
Date: Thu, 14 Sep 2023 16:54:19 +0100
Message-Id: <20230914155422.426639-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914155422.426639-1-alex.bennee@linaro.org>
References: <20230914155422.426639-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: WSBkiAnjPMUR

From: Daniel P. Berrangé <berrange@redhat.com>

On the GitLab side we're invoking the Cirrus CI job using the
cirrus-run tool which speaks to the Cirrus REST API. Cirrus
sometimes tasks 5-10 minutes to actually schedule the task,
and thus the execution time of 'cirrus-run' inside GitLab will
be slightly longer than the execution time of the Cirrus CI
task.

Setting the timeout in the GitLab CI job should thus be done
in relation to the timeout set for the Cirrus CI job. While
Cirrus CI defaults to 60 minutes, it is better to set this
explicitly, and make the relationship between the jobs
explicit

Signed-off-by: "Daniel P. Berrangé" <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230912184130.3056054-4-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/cirrus.yml       | 3 +++
 .gitlab-ci.d/cirrus/build.yml | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
index 41d64d6680..816d89cc2a 100644
--- a/.gitlab-ci.d/cirrus.yml
+++ b/.gitlab-ci.d/cirrus.yml
@@ -15,6 +15,9 @@
   stage: build
   image: registry.gitlab.com/libvirt/libvirt-ci/cirrus-run:master
   needs: []
+  # 20 mins larger than "timeout_in" in cirrus/build.yml
+  # as there's often a 5-10 minute delay before Cirrus CI
+  # actually starts the task
   timeout: 80m
   allow_failure: true
   script:
diff --git a/.gitlab-ci.d/cirrus/build.yml b/.gitlab-ci.d/cirrus/build.yml
index a9444902ec..29d55c4aa3 100644
--- a/.gitlab-ci.d/cirrus/build.yml
+++ b/.gitlab-ci.d/cirrus/build.yml
@@ -16,6 +16,8 @@ env:
   TEST_TARGETS: "@TEST_TARGETS@"
 
 build_task:
+  # A little shorter than GitLab timeout in ../cirrus.yml
+  timeout_in: 60m
   install_script:
     - @UPDATE_COMMAND@
     - @INSTALL_COMMAND@ @PKGS@
-- 
2.39.2
