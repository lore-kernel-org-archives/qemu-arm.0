Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id f3-20020a056000036300b003316ddedb6esm9699177wrf.22.2023.11.20.07.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 07:08:34 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 2EFE565752;
	Mon, 20 Nov 2023 15:08:34 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-s390x@nongnu.org,
	Beraldo Leal <bleal@redhat.com>,
	qemu-arm@nongnu.org,
	devel@lists.libvirt.org,
	qemu-ppc@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Marek Vasut <marex@denx.de>,
	Thomas Huth <thuth@redhat.com>,
	Chris Wulff <crwulff@gmail.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 02/14] .gitlab-ci.d/cirrus: Upgrade macOS to 13 (Ventura)
Date: Mon, 20 Nov 2023 15:08:21 +0000
Message-Id: <20231120150833.2552739-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231120150833.2552739-1-alex.bennee@linaro.org>
References: <20231120150833.2552739-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: l5s3A38JOT4E

From: Philippe Mathieu-Daudé <philmd@linaro.org>

macOS 14 "Sonoma" was released on September 2023 [1].

According to QEMU's support policy, we stop supporting the
previous major release two years after the the new major
release has been published. Replace the macOS 12 (Monterey)
testing by macOS 13 (Ventura, released on October 2022, [2]).

Refresh the generated files by running:

  $ make lcitool-refresh

[1] https://www.apple.com/newsroom/2023/09/macos-sonoma-is-available-today/
[2] https://www.apple.com/newsroom/2022/10/macos-ventura-is-now-available/

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20231108162022.76189-1-philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/cirrus.yml                              | 6 +++---
 .gitlab-ci.d/cirrus/{macos-12.vars => macos-13.vars} | 2 +-
 tests/lcitool/refresh                                | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename .gitlab-ci.d/cirrus/{macos-12.vars => macos-13.vars} (95%)

diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
index e7f1f83c2c..07dc6edae1 100644
--- a/.gitlab-ci.d/cirrus.yml
+++ b/.gitlab-ci.d/cirrus.yml
@@ -59,13 +59,13 @@ x64-freebsd-13-build:
     INSTALL_COMMAND: pkg install -y
     TEST_TARGETS: check
 
-aarch64-macos-12-base-build:
+aarch64-macos-13-base-build:
   extends: .cirrus_build_job
   variables:
-    NAME: macos-12
+    NAME: macos-13
     CIRRUS_VM_INSTANCE_TYPE: macos_instance
     CIRRUS_VM_IMAGE_SELECTOR: image
-    CIRRUS_VM_IMAGE_NAME: ghcr.io/cirruslabs/macos-monterey-base:latest
+    CIRRUS_VM_IMAGE_NAME: ghcr.io/cirruslabs/macos-ventura-base:latest
     CIRRUS_VM_CPUS: 12
     CIRRUS_VM_RAM: 24G
     UPDATE_COMMAND: brew update
diff --git a/.gitlab-ci.d/cirrus/macos-12.vars b/.gitlab-ci.d/cirrus/macos-13.vars
similarity index 95%
rename from .gitlab-ci.d/cirrus/macos-12.vars
rename to .gitlab-ci.d/cirrus/macos-13.vars
index 5f3fb346d1..534f029956 100644
--- a/.gitlab-ci.d/cirrus/macos-12.vars
+++ b/.gitlab-ci.d/cirrus/macos-13.vars
@@ -1,6 +1,6 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool variables macos-12 qemu
+#  $ lcitool variables macos-13 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 10c54a377c..7c211eba2e 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -203,7 +203,7 @@ try:
     # Cirrus packages lists for GitLab
     #
     generate_cirrus("freebsd-13")
-    generate_cirrus("macos-12")
+    generate_cirrus("macos-13")
 
     #
     # VM packages lists
-- 
2.39.2
