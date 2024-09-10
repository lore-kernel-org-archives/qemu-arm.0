Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25835a76sm487586366b.39.2024.09.10.07.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 07:07:36 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 69F825FA11;
	Tue, 10 Sep 2024 15:07:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
	Zhao Liu <zhao1.liu@intel.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Beraldo Leal <bleal@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	devel@lists.libvirt.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Gustavo Romero <gustavo.romero@linaro.org>
Subject: [PATCH 08/26] tests/tcg/aarch64: Improve linker script organization
Date: Tue, 10 Sep 2024 15:07:15 +0100
Message-Id: <20240910140733.4007719-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910140733.4007719-1-alex.bennee@linaro.org>
References: <20240910140733.4007719-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: w+Je69AANRsC

From: Gustavo Romero <gustavo.romero@linaro.org>

Improve kernel.ld linker script organization by using MEMORY command.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Message-Id: <20240906143316.657436-5-gustavo.romero@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/aarch64/system/kernel.ld | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

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
