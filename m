Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id w25sm7457764wmk.18.2019.07.12.04.18.51
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 12 Jul 2019 04:18:54 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 009251FF87;
	Fri, 12 Jul 2019 12:18:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fam Zheng <fam@euphon.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH  v1 7/7] shippable: re-enable the windows cross builds
Date: Fri, 12 Jul 2019 12:18:49 +0100
Message-Id: <20190712111849.9006-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190712111849.9006-1-alex.bennee@linaro.org>
References: <20190712111849.9006-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: llnaZuC3Fldo

The pkg.mxe.cc repo has been restored.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .shippable.yml | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/.shippable.yml b/.shippable.yml
index f2ffef21d11..f74a3de3ffd 100644
--- a/.shippable.yml
+++ b/.shippable.yml
@@ -7,11 +7,10 @@ env:
   matrix:
     - IMAGE=debian-amd64
       TARGET_LIST=x86_64-softmmu,x86_64-linux-user
-    # currently disabled as the mxe.cc repos are down
-    # - IMAGE=debian-win32-cross
-    #   TARGET_LIST=arm-softmmu,i386-softmmu,lm32-softmmu
-    # - IMAGE=debian-win64-cross
-    #   TARGET_LIST=aarch64-softmmu,sparc64-softmmu,x86_64-softmmu
+    - IMAGE=debian-win32-cross
+      TARGET_LIST=arm-softmmu,i386-softmmu,lm32-softmmu
+    - IMAGE=debian-win64-cross
+      TARGET_LIST=aarch64-softmmu,sparc64-softmmu,x86_64-softmmu
     - IMAGE=debian-armel-cross
       TARGET_LIST=arm-softmmu,arm-linux-user,armeb-linux-user
     - IMAGE=debian-armhf-cross
-- 
2.20.1
