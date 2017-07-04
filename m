Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id g63sm20292382wrd.11.2017.07.04.07.48.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jul 2017 07:48:09 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id E11813E21F6;
	Tue,  4 Jul 2017 15:49:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH 03/11] README: document --static builds
Date: Tue,  4 Jul 2017 15:48:51 +0100
Message-Id: <20170704144859.17644-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170704144859.17644-1-alex.bennee@linaro.org>
References: <20170704144859.17644-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: HhciAL7kBgN+

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 README | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/README b/README
index 858a349..e0bf5c5 100644
--- a/README
+++ b/README
@@ -17,7 +17,7 @@ test blobs (which can be run anywhere), and a Linux executable
 'risu' which runs on the target architecture (ie ARM). To
 build the executable part:
 
-    [VAR=VALUE] ... ./configure
+    [VAR=VALUE] ... ./configure [--static]
     make
 
 where [VAR=VALUE] ... allows you to specify any options.
@@ -25,6 +25,10 @@ Most useful is
  CROSS_PREFIX= which specifies the cross compiler prefix; you'll
    need this if you're not building on the target system
    (Example: CROSS_PREFIX=arm-linux-gnueabihf- )
+
+Passing --static will build a statically linked binary which is useful
+if you don't want to mess around with chroot's to run the binary.
+
 For other possibilities run 'configure --help'.
 
 Building into a separate build tree from the source code is supported:
@@ -86,8 +90,14 @@ as simple as:
 
 However since you actually need to run it under qemu or similar
 you probably need an ARM chroot to run it in, and to do something
-like
- sudo chroot /srv/chroot/arm-mav /risu --host ipaddr vqshlimm.out
+like:
+
+  sudo chroot /srv/chroot/arm-mav /risu --host ipaddr vqshlimm.out
+
+If you built the binary statically you can simply run:
+
+  /path/to/qemu ./risu --host ipaddr vqshlimm.out
+
 
 When the apprentice connects to the master, they will both start
 running the binary and checking results with each other. When the
-- 
2.13.0
