Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d258354d1sm578640466b.13.2024.09.10.23.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 23:46:50 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id DC1115FA1C;
	Wed, 11 Sep 2024 07:46:46 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Gustavo Romero <gustavo.romero@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL 09/10] tests/tcg/aarch64: Improve linker script organization
Date: Wed, 11 Sep 2024 07:46:44 +0100
Message-Id: <20240911064645.357592-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240911064645.357592-1-alex.bennee@linaro.org>
References: <20240911064645.357592-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: vQpNmtJtilLf

From: Gustavo Romero <gustavo.romero@linaro.org>

Improve kernel.ld linker script organization by using MEMORY command.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Message-Id: <20240906143316.657436-5-gustavo.romero@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20240910173900.4154726-10-alex.bennee@linaro.org>

diff --git a/tests/tcg/aarch64/system/kernel.ld b/tests/tcg/aarch64/system/kernel.ld
index 7b3a76dcbf..5f39258d32 100644
--- a/tests/tcg/aarch64/system/kernel.ld
+++ b/tests/tcg/aarch64/system/kernel.ld
@@ -1,23 +1,23 @@
 ENTRY(__start)
 
-SECTIONS
-{
-    /* virt machine, RAM starts at 1gb */
-    . = (1 << 30);
+MEMORY {
+    /* On virt machine RAM starts at 1 GiB. */
+
+    /* Align text and rodata to the 1st 2 MiB chunk. */
+    TXT (rx) : ORIGIN = 1 << 30, LENGTH = 2M
+    /* Align r/w data to the 2nd 2 MiB chunk. */
+    DAT (rw) : ORIGIN = (1 << 30) + 2M, LENGTH = 2M
+}
+
+SECTIONS {
     .text : {
         *(.text)
-    }
-    .rodata : {
         *(.rodata)
-    }
-    /* align r/w section to next 2mb */
-    . = ALIGN(1 << 21);
+    } >TXT
     .data : {
         *(.data)
-    }
-    .bss : {
         *(.bss)
-    }
+    } >DAT
     /DISCARD/ : {
         *(.ARM.attributes)
     }
-- 
2.39.2
