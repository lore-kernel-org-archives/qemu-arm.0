Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5785238d355sm8603309a12.31.2024.05.29.09.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 09:09:36 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 5138D5F8E5;
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
Subject: [PATCH 03/10] tests/vm: update centos.aarch64 image to 9
Date: Wed, 29 May 2024 17:09:27 +0100
Message-Id: <20240529160934.982373-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240529160934.982373-1-alex.bennee@linaro.org>
References: <20240529160934.982373-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zVO3co/3mlNK

As Centos Stream 8 goes out of support we need to update. To do this
powertools is replaced by crb and we don't over specify the python3 we
want.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20240521125314.1255403-4-alex.bennee@linaro.org>
---
 tests/vm/centos.aarch64 | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/vm/centos.aarch64 b/tests/vm/centos.aarch64
index 3f58de1e64..fcf9e08c87 100755
--- a/tests/vm/centos.aarch64
+++ b/tests/vm/centos.aarch64
@@ -25,9 +25,9 @@ DEFAULT_CONFIG = {
     'cpu'          : "max",
     'machine'      : "virt,gic-version=max",
     'install_cmds' : (
-        "dnf config-manager --set-enabled powertools, "
+        "dnf config-manager --enable crb, "
         "dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo, "
-        "dnf install -y make ninja-build git python38 gcc gcc-c++ flex bison "\
+        "dnf install -y make ninja-build git python3 gcc gcc-c++ flex bison "\
             "glib2-devel pixman-devel zlib-devel docker-ce.aarch64, "
         "systemctl enable docker, "
     ),
@@ -38,10 +38,10 @@ DEFAULT_CONFIG = {
 
 
 class CentosAarch64VM(basevm.BaseVM):
-    name = "centos8.aarch64"
+    name = "centos9.aarch64"
     arch = "aarch64"
-    image_name = "CentOS-Stream-GenericCloud-8-20220125.1.aarch64.qcow2"
-    image_link = "https://cloud.centos.org/centos/8-stream/aarch64/images/"
+    image_name = "CentOS-Stream-GenericCloud-9-20230501.0.aarch64.qcow2"
+    image_link = "https://cloud.centos.org/centos/9-stream/aarch64/images/"
     image_link += image_name
     BUILD_SCRIPT = """
         set -e;
-- 
2.39.2
