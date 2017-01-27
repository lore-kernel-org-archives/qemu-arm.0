Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id e6sm7183648wrc.30.2017.01.27.02.43.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Jan 2017 02:43:33 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 38BDC3E376F;
	Fri, 27 Jan 2017 10:35:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: 
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM),
	qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH v8 22/25] target-arm/cpu.h: make ARM_CP defined consistent
Date: Fri, 27 Jan 2017 10:35:02 +0000
Message-Id: <20170127103505.18606-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170127103505.18606-1-alex.bennee@linaro.org>
References: <20170127103505.18606-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: yBo084cAE2AG

This is a purely mechanical change to make the ARM_CP flags neatly
align and use a consistent format so it is easier to see which bit
each flag is.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.h | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 274ef17562..f56a96c675 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1398,20 +1398,20 @@ static inline uint64_t cpreg_to_kvm_id(uint32_t cpregid)
  * need to be surrounded by gen_io_start()/gen_io_end(). In particular,
  * registers which implement clocks or timers require this.
  */
-#define ARM_CP_SPECIAL 1
-#define ARM_CP_CONST 2
-#define ARM_CP_64BIT 4
-#define ARM_CP_SUPPRESS_TB_END 8
-#define ARM_CP_OVERRIDE 16
-#define ARM_CP_ALIAS 32
-#define ARM_CP_IO 64
-#define ARM_CP_NO_RAW 128
-#define ARM_CP_NOP (ARM_CP_SPECIAL | (1 << 8))
-#define ARM_CP_WFI (ARM_CP_SPECIAL | (2 << 8))
-#define ARM_CP_NZCV (ARM_CP_SPECIAL | (3 << 8))
-#define ARM_CP_CURRENTEL (ARM_CP_SPECIAL | (4 << 8))
-#define ARM_CP_DC_ZVA (ARM_CP_SPECIAL | (5 << 8))
-#define ARM_LAST_SPECIAL ARM_CP_DC_ZVA
+#define ARM_CP_SPECIAL         (1 << 0)
+#define ARM_CP_CONST           (1 << 1)
+#define ARM_CP_64BIT           (1 << 2)
+#define ARM_CP_SUPPRESS_TB_END (1 << 3)
+#define ARM_CP_OVERRIDE        (1 << 4)
+#define ARM_CP_ALIAS           (1 << 5)
+#define ARM_CP_IO              (1 << 6)
+#define ARM_CP_NO_RAW          (1 << 7)
+#define ARM_CP_NOP             (ARM_CP_SPECIAL | (1 << 8))
+#define ARM_CP_WFI             (ARM_CP_SPECIAL | (2 << 8))
+#define ARM_CP_NZCV            (ARM_CP_SPECIAL | (3 << 8))
+#define ARM_CP_CURRENTEL       (ARM_CP_SPECIAL | (4 << 8))
+#define ARM_CP_DC_ZVA          (ARM_CP_SPECIAL | (5 << 8))
+#define ARM_LAST_SPECIAL       ARM_CP_DC_ZVA
 /* Used only as a terminator for ARMCPRegInfo lists */
 #define ARM_CP_SENTINEL 0xffff
 /* Mask of only the flag bits in a type field */
-- 
2.11.0
