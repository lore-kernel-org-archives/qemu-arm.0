Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5785233bb04sm8555012a12.12.2024.05.29.09.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 09:09:36 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 688095F8E7;
	Wed, 29 May 2024 17:09:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	John Snow <jsnow@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	qemu-arm@nongnu.org,
	Cleber Rosa <crosa@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-s390x@nongnu.org,
	Radoslaw Biernacki <rad@semihalf.com>
Subject: [PATCH 04/10] tests/vm: remove plain centos image
Date: Wed, 29 May 2024 17:09:28 +0100
Message-Id: <20240529160934.982373-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240529160934.982373-1-alex.bennee@linaro.org>
References: <20240529160934.982373-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: RUGc7YajAa6u

This isn't really used and we have lighter weight docker containers
for testing this stuff directly.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20240521125314.1255403-5-alex.bennee@linaro.org>
---
 tests/vm/Makefile.include |  1 -
 tests/vm/centos           | 51 ---------------------------------------
 2 files changed, 52 deletions(-)
 delete mode 100755 tests/vm/centos

diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
index ac56824a87..13ed80f72d 100644
--- a/tests/vm/Makefile.include
+++ b/tests/vm/Makefile.include
@@ -45,7 +45,6 @@ vm-help vm-test:
 	@echo "  vm-build-netbsd                 - Build QEMU in NetBSD VM"
 	@echo "  vm-build-openbsd                - Build QEMU in OpenBSD VM"
 ifneq ($(GENISOIMAGE),)
-	@echo "  vm-build-centos                 - Build QEMU in CentOS VM, with Docker"
 ifneq ($(EFI_AARCH64),)
 	@echo "  vm-build-ubuntu.aarch64         - Build QEMU in ubuntu aarch64 VM"
 	@echo "  vm-build-centos.aarch64         - Build QEMU in CentOS aarch64 VM"
diff --git a/tests/vm/centos b/tests/vm/centos
deleted file mode 100755
index d25c8f8b5b..0000000000
--- a/tests/vm/centos
+++ /dev/null
@@ -1,51 +0,0 @@
-#!/usr/bin/env python3
-#
-# CentOS 8 Stream image
-#
-# Copyright 2018, 2022 Red Hat Inc.
-#
-# Authors:
-#  Fam Zheng <famz@redhat.com>
-#
-# This code is licensed under the GPL version 2 or later.  See
-# the COPYING file in the top-level directory.
-#
-
-import os
-import sys
-import subprocess
-import basevm
-import time
-
-class CentosVM(basevm.BaseVM):
-    name = "centos"
-    arch = "x86_64"
-    BUILD_SCRIPT = """
-        set -e;
-        cd $(mktemp -d);
-        export SRC_ARCHIVE=/dev/vdb;
-        sudo chmod a+r $SRC_ARCHIVE;
-        tar -xf $SRC_ARCHIVE;
-        make docker-test-block@centos9 {verbose} J={jobs} NETWORK=1;
-        make docker-test-quick@centos9 {verbose} J={jobs} NETWORK=1;
-    """
-
-    def build_image(self, img):
-        cimg = self._download_with_cache("https://cloud.centos.org/centos/8-stream/x86_64/images/CentOS-Stream-GenericCloud-8-20220125.1.x86_64.qcow2")
-        img_tmp = img + ".tmp"
-        subprocess.check_call(['cp', '-f', cimg, img_tmp])
-        self.exec_qemu_img("resize", img_tmp, "50G")
-        self.boot(img_tmp, extra_args = ["-cdrom", self.gen_cloud_init_iso()])
-        self.wait_ssh()
-        self.ssh_root_check("touch /etc/cloud/cloud-init.disabled")
-        self.ssh_root_check("dnf update -y")
-        self.ssh_root_check("dnf install -y dnf-plugins-core")
-        self.ssh_root_check("dnf config-manager --set-enabled powertools")
-        self.ssh_root_check("dnf install -y podman make ninja-build git python3")
-        self.ssh_root("poweroff")
-        self.wait()
-        os.rename(img_tmp, img)
-        return 0
-
-if __name__ == "__main__":
-    sys.exit(basevm.main(CentosVM))
-- 
2.39.2
