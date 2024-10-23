Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912d62e4sm461595266b.7.2024.10.23.04.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 04:34:07 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 283C55F8B5;
	Wed, 23 Oct 2024 12:34:07 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	devel@lists.libvirt.org,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	kvm@vger.kernel.org,
	Beraldo Leal <bleal@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 02/18] tests/docker: add NOFETCH env variable for testing
Date: Wed, 23 Oct 2024 12:33:50 +0100
Message-Id: <20241023113406.1284676-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241023113406.1284676-1-alex.bennee@linaro.org>
References: <20241023113406.1284676-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: mwy1qosou4jE

Testing non-auto built docker containers (i.e. custom built compilers)
is a bit fiddly as you couldn't continue a build with a previously
locally built container. While you can play games with REGISTRY its
simpler to allow a NOFETCH that will go through the cached build
process when you run the tests.

Message-Id: <20241022105614.839199-3-alex.bennee@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 681feae744..fead7d3abe 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -92,10 +92,10 @@ endif
 docker-image-alpine: NOUSER=1
 
 debian-toolchain-run = \
-	$(if $(NOCACHE), 						\
+	$(if $(NOCACHE)$(NOFETCH),					\
 		$(call quiet-command,					\
 			$(DOCKER_SCRIPT) build -t qemu/$1 -f $< 	\
-			$(if $V,,--quiet) --no-cache 			\
+			$(if $V,,--quiet) $(if $(NOCACHE),--no-cache)	\
 			--registry $(DOCKER_REGISTRY) --extra-files	\
 			$(DOCKER_FILES_DIR)/$1.d/build-toolchain.sh,	\
 			"BUILD", $1),				        \
@@ -177,6 +177,7 @@ docker:
 	@echo '    NETWORK=$$BACKEND     Enable virtual network interface with $$BACKEND.'
 	@echo '    NOUSER=1             Define to disable adding current user to containers passwd.'
 	@echo '    NOCACHE=1            Ignore cache when build images.'
+	@echo '    NOFETCH=1            Do not fetch from the registry.'
 	@echo '    EXECUTABLE=<path>    Include executable in image.'
 	@echo '    EXTRA_FILES="<path> [... <path>]"'
 	@echo '                         Include extra files in image.'
-- 
2.39.5
