Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id hg7-20020a05600c538700b003f1940fe278sm8182665wmb.7.2023.04.24.02.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 02:22:50 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 954F61FFB8;
	Mon, 24 Apr 2023 10:22:49 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Juan Quintela <quintela@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Markus Armbruster <armbru@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	David Hildenbrand <david@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-s390x@nongnu.org,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-arm@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Kautuk Consul <kconsul@linux.vnet.ibm.com>,
	Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
Subject: [PATCH 01/18] tests/requirements.txt: bump up avocado-framework version to 101.0
Date: Mon, 24 Apr 2023 10:22:32 +0100
Message-Id: <20230424092249.58552-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230424092249.58552-1-alex.bennee@linaro.org>
References: <20230424092249.58552-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: yW502sh0vzfd

From: Kautuk Consul <kconsul@linux.vnet.ibm.com>

Avocado version 101.0 has a fix to re-compute the checksum
of an asset file if the algorithm used in the *-CHECKSUM
file isn't the same as the one being passed to it by the
avocado user (i.e. the avocado_qemu python module).
In the earlier avocado versions this fix wasn't there due
to which if the checksum wouldn't match the earlier
checksum (calculated by a different algorithm), the avocado
code would start downloading a fresh image from the internet
URL thus making the test-cases take longer to execute.

Bump up the avocado-framework version to 101.0.

Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
Tested-by: Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230417134321.3627231-2-alex.bennee@linaro.org>
Message-Id: <20230327115030.3418323-2-kconsul@linux.vnet.ibm.com>
Message-Id: <20230330101141.30199-10-alex.bennee@linaro.org>

---
v2
  - limit --max-parallel-tasks $(JOBS_OPTION:-j%=%)
---
 tests/Makefile.include | 18 +++++++++++-------
 tests/requirements.txt |  2 +-
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 9422ddaece..a4de0ad5a2 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -138,14 +138,18 @@ get-vm-image-fedora-31-%: check-venv
 # download all vm images, according to defined targets
 get-vm-images: check-venv $(patsubst %,get-vm-image-fedora-31-%, $(FEDORA_31_DOWNLOAD))
 
+JOBS_OPTION=$(lastword -j1 $(filter-out -j, $(filter -j%,$(MAKEFLAGS))))
+
 check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
-	$(call quiet-command, \
-            $(TESTS_PYTHON) -m avocado \
-            --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
-            $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
-			--filter-by-tags-include-empty-key) \
-            $(AVOCADO_CMDLINE_TAGS) \
-            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), \
+	$(call quiet-command, 							\
+            $(TESTS_PYTHON) -m avocado 						\
+            --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) 	\
+            $(if $(AVOCADO_TAGS),, 						\
+			--filter-by-tags-include-empty 				\
+			--filter-by-tags-include-empty-key) 			\
+		--max-parallel-tasks $(JOBS_OPTION:-j%=%) 			\
+            $(AVOCADO_CMDLINE_TAGS) 						\
+            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), 			\
             "AVOCADO", "tests/avocado")
 
 check-acceptance-deprecated-warning:
diff --git a/tests/requirements.txt b/tests/requirements.txt
index 0ba561b6bd..a6f73da681 100644
--- a/tests/requirements.txt
+++ b/tests/requirements.txt
@@ -2,5 +2,5 @@
 # in the tests/venv Python virtual environment. For more info,
 # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
 # Note that qemu.git/python/ is always implicitly installed.
-avocado-framework==88.1
+avocado-framework==101.0
 pycdlib==1.11.0
-- 
2.39.2
