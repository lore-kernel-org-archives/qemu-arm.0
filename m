Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733c2c7d3esm16607686a12.73.2024.05.21.05.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 05:53:15 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 0ED4A5FA1B;
	Tue, 21 May 2024 13:53:15 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Beraldo Leal <bleal@redhat.com>,
	qemu-s390x@nongnu.org,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Joel Stanley <joel@jms.id.au>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Thomas Huth <thuth@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 3/4] tests/vm: update centos.aarch64 image to 9
Date: Tue, 21 May 2024 13:53:13 +0100
Message-Id: <20240521125314.1255403-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240521125314.1255403-1-alex.bennee@linaro.org>
References: <20240521125314.1255403-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: BrvK3jPhfosj

As Centos Stream 8 goes out of support we need to update. To do this
powertools is replaced by crb and we don't over specify the python3 we
want.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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
