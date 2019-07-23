Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id e3sm38553746wrt.93.2019.07.23.04.33.05
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 23 Jul 2019 04:33:05 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 59BBC1FF87;
	Tue, 23 Jul 2019 12:33:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for 4.2] target/arm: generate a custom MIDR for -cpu max
Date: Tue, 23 Jul 2019 12:33:01 +0100
Message-Id: <20190723113301.16867-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ss8Wnl4aXv7c

While most features are now detected by probing the ID_* registers
kernels can (and do) use MIDR_EL1 for working out of they have to
apply errata. This can trip up warnings in the kernel as it tries to
work out if it should apply workarounds to features that don't
actually exist in the reported CPU type.

Avoid this problem by synthesising our own MIDR value using the
reserved value of 0 for the implementer and telling kernels the ID
registers should tell them everything they need to know.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - don't leak QEMU version into ID reg
---
 target/arm/cpu.h   | 6 ++++++
 target/arm/cpu64.c | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7efbb488d9d..61eaef924e4 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1605,6 +1605,12 @@ FIELD(V7M_FPCCR, ASPEN, 31, 1)
 /*
  * System register ID fields.
  */
+FIELD(MIDR_EL1, REVISION, 0, 4)
+FIELD(MIDR_EL1, PARTNUM, 4, 12)
+FIELD(MIDR_EL1, ARCHITECTURE, 16, 4)
+FIELD(MIDR_EL1, VARIENT, 20, 4)
+FIELD(MIDR_EL1, IMPLEMENTER, 24, 8)
+
 FIELD(ID_ISAR0, SWAP, 0, 4)
 FIELD(ID_ISAR0, BITCOUNT, 4, 4)
 FIELD(ID_ISAR0, BITFIELD, 8, 4)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index b1bb394c6dd..e88aadfd2fd 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -296,6 +296,12 @@ static void aarch64_max_initfn(Object *obj)
         uint32_t u;
         aarch64_a57_initfn(obj);
 
+        /* reset MIDR so our franken-max-cpu type isn't mistaken for a real one */
+        t = FIELD_DP64(0, MIDR_EL1, IMPLEMENTER, 0); /* Reserved for SW */
+        t = FIELD_DP64(t, MIDR_EL1, ARCHITECTURE, 0xf); /* See ID_* for details */
+        /* the rest is enigmatically empty lest kernels assume it means something */
+        cpu->midr = t;
+
         t = cpu->isar.id_aa64isar0;
         t = FIELD_DP64(t, ID_AA64ISAR0, AES, 2); /* AES + PMULL */
         t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);
-- 
2.20.1
