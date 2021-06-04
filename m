Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id k16sm6059847wmr.42.2021.06.04.10.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 10:12:46 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E0AC71FF9E;
	Fri,  4 Jun 2021 16:53:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 15/99] target/arm: move translate modules to tcg/
Date: Fri,  4 Jun 2021 16:51:48 +0100
Message-Id: <20210604155312.15902-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 4ZUwk2yep7OT

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/{ => tcg}/translate-a64.h    |  0
 target/arm/{ => tcg}/translate.h        |  0
 target/arm/{ => tcg}/a32-uncond.decode  |  0
 target/arm/{ => tcg}/a32.decode         |  0
 target/arm/{ => tcg}/m-nocp.decode      |  0
 target/arm/{ => tcg}/neon-dp.decode     |  0
 target/arm/{ => tcg}/neon-ls.decode     |  0
 target/arm/{ => tcg}/neon-shared.decode |  0
 target/arm/{ => tcg}/sve.decode         |  0
 target/arm/{ => tcg}/t16.decode         |  0
 target/arm/{ => tcg}/t32.decode         |  0
 target/arm/{ => tcg}/vfp-uncond.decode  |  0
 target/arm/{ => tcg}/vfp.decode         |  0
 target/arm/{ => tcg}/translate-a64.c    |  0
 target/arm/{ => tcg}/translate-m-nocp.c |  0
 target/arm/{ => tcg}/translate-neon.c   |  0
 target/arm/{ => tcg}/translate-sve.c    |  0
 target/arm/{ => tcg}/translate-vfp.c    |  0
 target/arm/{ => tcg}/translate.c        |  0
 target/arm/meson.build                  | 23 ++-------------------
 target/arm/tcg/meson.build              | 27 +++++++++++++++++++++++++
 21 files changed, 29 insertions(+), 21 deletions(-)
 rename target/arm/{ => tcg}/translate-a64.h (100%)
 rename target/arm/{ => tcg}/translate.h (100%)
 rename target/arm/{ => tcg}/a32-uncond.decode (100%)
 rename target/arm/{ => tcg}/a32.decode (100%)
 rename target/arm/{ => tcg}/m-nocp.decode (100%)
 rename target/arm/{ => tcg}/neon-dp.decode (100%)
 rename target/arm/{ => tcg}/neon-ls.decode (100%)
 rename target/arm/{ => tcg}/neon-shared.decode (100%)
 rename target/arm/{ => tcg}/sve.decode (100%)
 rename target/arm/{ => tcg}/t16.decode (100%)
 rename target/arm/{ => tcg}/t32.decode (100%)
 rename target/arm/{ => tcg}/vfp-uncond.decode (100%)
 rename target/arm/{ => tcg}/vfp.decode (100%)
 rename target/arm/{ => tcg}/translate-a64.c (100%)
 rename target/arm/{ => tcg}/translate-m-nocp.c (100%)
 rename target/arm/{ => tcg}/translate-neon.c (100%)
 rename target/arm/{ => tcg}/translate-sve.c (100%)
 rename target/arm/{ => tcg}/translate-vfp.c (100%)
 rename target/arm/{ => tcg}/translate.c (100%)
 create mode 100644 target/arm/tcg/meson.build

diff --git a/target/arm/translate-a64.h b/target/arm/tcg/translate-a64.h
similarity index 100%
rename from target/arm/translate-a64.h
rename to target/arm/tcg/translate-a64.h
diff --git a/target/arm/translate.h b/target/arm/tcg/translate.h
similarity index 100%
rename from target/arm/translate.h
rename to target/arm/tcg/translate.h
diff --git a/target/arm/a32-uncond.decode b/target/arm/tcg/a32-uncond.decode
similarity index 100%
rename from target/arm/a32-uncond.decode
rename to target/arm/tcg/a32-uncond.decode
diff --git a/target/arm/a32.decode b/target/arm/tcg/a32.decode
similarity index 100%
rename from target/arm/a32.decode
rename to target/arm/tcg/a32.decode
diff --git a/target/arm/m-nocp.decode b/target/arm/tcg/m-nocp.decode
similarity index 100%
rename from target/arm/m-nocp.decode
rename to target/arm/tcg/m-nocp.decode
diff --git a/target/arm/neon-dp.decode b/target/arm/tcg/neon-dp.decode
similarity index 100%
rename from target/arm/neon-dp.decode
rename to target/arm/tcg/neon-dp.decode
diff --git a/target/arm/neon-ls.decode b/target/arm/tcg/neon-ls.decode
similarity index 100%
rename from target/arm/neon-ls.decode
rename to target/arm/tcg/neon-ls.decode
diff --git a/target/arm/neon-shared.decode b/target/arm/tcg/neon-shared.decode
similarity index 100%
rename from target/arm/neon-shared.decode
rename to target/arm/tcg/neon-shared.decode
diff --git a/target/arm/sve.decode b/target/arm/tcg/sve.decode
similarity index 100%
rename from target/arm/sve.decode
rename to target/arm/tcg/sve.decode
diff --git a/target/arm/t16.decode b/target/arm/tcg/t16.decode
similarity index 100%
rename from target/arm/t16.decode
rename to target/arm/tcg/t16.decode
diff --git a/target/arm/t32.decode b/target/arm/tcg/t32.decode
similarity index 100%
rename from target/arm/t32.decode
rename to target/arm/tcg/t32.decode
diff --git a/target/arm/vfp-uncond.decode b/target/arm/tcg/vfp-uncond.decode
similarity index 100%
rename from target/arm/vfp-uncond.decode
rename to target/arm/tcg/vfp-uncond.decode
diff --git a/target/arm/vfp.decode b/target/arm/tcg/vfp.decode
similarity index 100%
rename from target/arm/vfp.decode
rename to target/arm/tcg/vfp.decode
diff --git a/target/arm/translate-a64.c b/target/arm/tcg/translate-a64.c
similarity index 100%
rename from target/arm/translate-a64.c
rename to target/arm/tcg/translate-a64.c
diff --git a/target/arm/translate-m-nocp.c b/target/arm/tcg/translate-m-nocp.c
similarity index 100%
rename from target/arm/translate-m-nocp.c
rename to target/arm/tcg/translate-m-nocp.c
diff --git a/target/arm/translate-neon.c b/target/arm/tcg/translate-neon.c
similarity index 100%
rename from target/arm/translate-neon.c
rename to target/arm/tcg/translate-neon.c
diff --git a/target/arm/translate-sve.c b/target/arm/tcg/translate-sve.c
similarity index 100%
rename from target/arm/translate-sve.c
rename to target/arm/tcg/translate-sve.c
diff --git a/target/arm/translate-vfp.c b/target/arm/tcg/translate-vfp.c
similarity index 100%
rename from target/arm/translate-vfp.c
rename to target/arm/tcg/translate-vfp.c
diff --git a/target/arm/translate.c b/target/arm/tcg/translate.c
similarity index 100%
rename from target/arm/translate.c
rename to target/arm/tcg/translate.c
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 6106d24665..229ec7fa11 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -1,19 +1,4 @@
-gen = [
-  decodetree.process('sve.decode', extra_args: '--decode=disas_sve'),
-  decodetree.process('neon-shared.decode', extra_args: '--decode=disas_neon_shared'),
-  decodetree.process('neon-dp.decode', extra_args: '--decode=disas_neon_dp'),
-  decodetree.process('neon-ls.decode', extra_args: '--decode=disas_neon_ls'),
-  decodetree.process('vfp.decode', extra_args: '--decode=disas_vfp'),
-  decodetree.process('vfp-uncond.decode', extra_args: '--decode=disas_vfp_uncond'),
-  decodetree.process('m-nocp.decode', extra_args: '--decode=disas_m_nocp'),
-  decodetree.process('a32.decode', extra_args: '--static-decode=disas_a32'),
-  decodetree.process('a32-uncond.decode', extra_args: '--static-decode=disas_a32_uncond'),
-  decodetree.process('t32.decode', extra_args: '--static-decode=disas_t32'),
-  decodetree.process('t16.decode', extra_args: ['-w', '16', '--static-decode=disas_t16']),
-]
-
 arm_ss = ss.source_set()
-arm_ss.add(gen)
 arm_ss.add(files(
   'cpu.c',
   'crypto_helper.c',
@@ -25,10 +10,6 @@ arm_ss.add(files(
   'neon_helper.c',
   'op_helper.c',
   'tlb_helper.c',
-  'translate.c',
-  'translate-m-nocp.c',
-  'translate-neon.c',
-  'translate-vfp.c',
   'vec_helper.c',
   'vfp_helper.c',
   'cpu_tcg.c',
@@ -44,8 +25,6 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'mte_helper.c',
   'pauth_helper.c',
   'sve_helper.c',
-  'translate-a64.c',
-  'translate-sve.c',
 ))
 
 arm_softmmu_ss = ss.source_set()
@@ -58,6 +37,8 @@ arm_softmmu_ss.add(files(
 ))
 arm_user_ss = ss.source_set()
 
+subdir('tcg')
+
 target_arch += {'arm': arm_ss}
 target_softmmu_arch += {'arm': arm_softmmu_ss}
 target_user_arch += {'arm': arm_user_ss}
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
new file mode 100644
index 0000000000..53a17ae6e6
--- /dev/null
+++ b/target/arm/tcg/meson.build
@@ -0,0 +1,27 @@
+gen = [
+  decodetree.process('sve.decode', extra_args: '--decode=disas_sve'),
+  decodetree.process('neon-shared.decode', extra_args: '--decode=disas_neon_shared'),
+  decodetree.process('neon-dp.decode', extra_args: '--decode=disas_neon_dp'),
+  decodetree.process('neon-ls.decode', extra_args: '--decode=disas_neon_ls'),
+  decodetree.process('vfp.decode', extra_args: '--decode=disas_vfp'),
+  decodetree.process('vfp-uncond.decode', extra_args: '--decode=disas_vfp_uncond'),
+  decodetree.process('m-nocp.decode', extra_args: '--decode=disas_m_nocp'),
+  decodetree.process('a32.decode', extra_args: '--static-decode=disas_a32'),
+  decodetree.process('a32-uncond.decode', extra_args: '--static-decode=disas_a32_uncond'),
+  decodetree.process('t32.decode', extra_args: '--static-decode=disas_t32'),
+  decodetree.process('t16.decode', extra_args: ['-w', '16', '--static-decode=disas_t16']),
+]
+
+arm_ss.add(gen)
+
+arm_ss.add(files(
+  'translate.c',
+  'translate-m-nocp.c',
+  'translate-neon.c',
+  'translate-vfp.c',
+))
+
+arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
+  'translate-a64.c',
+  'translate-sve.c',
+))
-- 
2.20.1
