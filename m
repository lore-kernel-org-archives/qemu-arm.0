Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id r3sm1790121wrn.5.2019.05.09.10.05.22
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 May 2019 10:05:23 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A53D81FFA6;
	Thu,  9 May 2019 17:59:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Ed Maste <emaste@freebsd.org>,
	Fam Zheng <fam@euphon.net>
Subject: [PATCH  v1 19/23] cirrus / travis: Add gnu-sed and bash for macOS and FreeBSD
Date: Thu,  9 May 2019 17:59:07 +0100
Message-Id: <20190509165912.10512-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190509165912.10512-1-alex.bennee@linaro.org>
References: <20190509165912.10512-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ouTQvs9K9VUM

From: Thomas Huth <thuth@redhat.com>

We are going to enable the qemu-iotests during "make check" again,
and for running the iotests, we need bash and gnu-sed.

Reviewed-by: Li-Wen Hsu <lwhsu@freebsd.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20190502084506.8009-5-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .cirrus.yml | 4 ++--
 .travis.yml | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 47ef5bc6040..8326a3a4b16 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -7,7 +7,7 @@ freebsd_12_task:
     cpu: 8
     memory: 8G
   install_script: pkg install -y
-    bison curl cyrus-sasl git glib gmake gnutls
+    bash bison curl cyrus-sasl git glib gmake gnutls gsed
     nettle perl5 pixman pkgconf png usbredir
   script:
     - mkdir build
@@ -20,7 +20,7 @@ macos_task:
   osx_instance:
     image: mojave-base
   install_script:
-    - brew install pkg-config python glib pixman make sdl2
+    - brew install pkg-config python gnu-sed glib pixman make sdl2
   script:
     - ./configure --python=/usr/local/bin/python3 || { cat config.log; exit 1; }
     - gmake -j$(sysctl -n hw.ncpu)
diff --git a/.travis.yml b/.travis.yml
index 8ba571b88a8..b053a836a32 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -42,6 +42,7 @@ addons:
     packages:
       - glib
       - pixman
+      - gnu-sed
 
 
 # The channel name "irc.oftc.net#qemu" is encrypted against qemu/qemu
-- 
2.20.1
