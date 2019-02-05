Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id l20sm36878159wrb.93.2019.02.05.11.02.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Feb 2019 11:02:30 -0800 (PST)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id AD8B21FF84;
	Tue,  5 Feb 2019 19:02:24 +0000 (UTC)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 4/6] target/arm: expose remaining CPUID registers as RAZ
Date: Tue,  5 Feb 2019 19:02:22 +0000
Message-Id: <20190205190224.2198-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190205190224.2198-1-alex.bennee@linaro.org>
References: <20190205190224.2198-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: FCAMEyrcpR9J

There are a whole bunch more registers in the CPUID space which are
currently not used but are exposed as RAZ. To avoid too much
duplication we expand ARMCPRegUserSpaceInfo to understand glob
patterns so we only need one entry to tweak whole ranges of registers.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.h    |  3 +++
 target/arm/helper.c | 26 +++++++++++++++++++++++---
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 354df22102..ae8ccc7dec 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2459,6 +2459,9 @@ typedef struct ARMCPRegUserSpaceInfo {
     /* Name of register */
     const char *name;
 
+    /* Is the name actually a glob pattern */
+    bool is_glob;
+
     /* Only some bits are exported to user space */
     uint64_t exported_bits;
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index f2f868ff92..e999da165b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6103,19 +6103,27 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .fixed_bits    = 0x0000000000000011 },
             { .name = "ID_AA64PFR1_EL1",
               .exported_bits = 0x00000000000000f0 },
+            { .name = "ID_AA64PFR*_EL1_RESERVED",
+              .is_glob = true                     },
             { .name = "ID_AA64ZFR0_EL1"           },
             { .name = "ID_AA64MMFR0_EL1",
               .fixed_bits    = 0x00000000ff000000 },
             { .name = "ID_AA64MMFR1_EL1"          },
+            { .name = "ID_AA64MMFR*_EL1_RESERVED",
+              .is_glob = true                     },
             { .name = "ID_AA64DFR0_EL1",
               .fixed_bits    = 0x0000000000000006 },
             { .name = "ID_AA64DFR1_EL1"           },
-            { .name = "ID_AA64AFR0_EL1"           },
-            { .name = "ID_AA64AFR1_EL1"           },
+            { .name = "ID_AA64DFR*_EL1_RESERVED",
+              .is_glob = true                     },
+            { .name = "ID_AA64AFR*",
+              .is_glob = true                     },
             { .name = "ID_AA64ISAR0_EL1",
               .exported_bits = 0x00fffffff0fffff0 },
             { .name = "ID_AA64ISAR1_EL1",
               .exported_bits = 0x000000f0ffffffff },
+            { .name = "ID_AA64ISAR*_EL1_RESERVED",
+              .is_glob = true                     },
             REGUSERINFO_SENTINEL
         };
         modify_arm_cp_regs(v8_idregs, v8_user_idregs);
@@ -7014,8 +7022,17 @@ void modify_arm_cp_regs(ARMCPRegInfo *regs, const ARMCPRegUserSpaceInfo *mods)
     ARMCPRegInfo *r;
 
     for (m = mods; m->name; m++) {
+        GPatternSpec *pat = NULL;
+        if (m->is_glob) {
+            pat = g_pattern_spec_new(m->name);
+        }
         for (r = regs; r->type != ARM_CP_SENTINEL; r++) {
-            if (strcmp(r->name, m->name) == 0) {
+            if (pat && g_pattern_match_string(pat, r->name)) {
+                r->type = ARM_CP_CONST;
+                r->access = PL0U_R;
+                r->resetvalue = 0;
+                /* continue */
+            } else if (strcmp(r->name, m->name) == 0) {
                 r->type = ARM_CP_CONST;
                 r->access = PL0U_R;
                 r->resetvalue &= m->exported_bits;
@@ -7023,6 +7040,9 @@ void modify_arm_cp_regs(ARMCPRegInfo *regs, const ARMCPRegUserSpaceInfo *mods)
                 break;
             }
         }
+        if (pat) {
+            g_pattern_spec_free(pat);
+        }
     }
 }
 
-- 
2.20.1
