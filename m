Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id y18sm38214088wmi.23.2019.07.22.04.19.18
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 04:19:18 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 323001FF87;
	Mon, 22 Jul 2019 12:19:18 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH for 4.2] target/arm: generate a custom MIDR for -cpu max
Date: Mon, 22 Jul 2019 12:19:14 +0100
Message-Id: <20190722111914.28574-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 8ZcNoYl1/ovX

While most features are now detected by probing the ID_* registers
kernels can (and do) use MIDR_EL1 for working out of they have to
apply errata. This can trip up warnings in the kernel as it tries to
work out if it should apply workarounds to features that don't
actually exist in the reported CPU type.

Avoid this problem by synthesising our own MIDR value using the
reserved value of 0 for the implementer and encoding the moving feast
that is the QEMU version string into the other fields.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.h   |  6 ++++++
 target/arm/cpu64.c | 10 ++++++++++
 2 files changed, 16 insertions(+)

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
index b1bb394c6dd..c121d0b37e0 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -296,6 +296,16 @@ static void aarch64_max_initfn(Object *obj)
         uint32_t u;
         aarch64_a57_initfn(obj);
 
+        /* reset MIDR so our franken-max-cpu type isn't mistaken for a real one */
+        t = 0;
+        t = FIELD_DP64(t, MIDR_EL1, IMPLEMENTER, 0); /* Reserved for SW */
+        t = FIELD_DP64(t, MIDR_EL1, ARCHITECTURE, 0xf); /* See ID_* for details */
+        /* Encode QEMU version details */
+        t = FIELD_DP64(t, MIDR_EL1, VARIENT, QEMU_VERSION_MAJOR);
+        t = FIELD_DP64(t, MIDR_EL1, REVISION, QEMU_VERSION_MINOR);
+        t = FIELD_DP64(t, MIDR_EL1, PARTNUM, QEMU_VERSION_MICRO);
+        cpu->midr = t;
+
         t = cpu->isar.id_aa64isar0;
         t = FIELD_DP64(t, ID_AA64ISAR0, AES, 2); /* AES + PMULL */
         t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);
-- 
2.20.1
