Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp8020579lfc;
        Thu, 18 Feb 2021 01:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yOsJFfZzo2g8QQglvZg2aAHRWN3H1uP8oT2x1qASVNE=;
        b=HQMZlwm6VlPmweczxQ7YB6RMh7HDoA6JEOsx/IYHO2KR15Ke/K8qptYHQEAO4OCmAe
         L/KHhpR7NyqlV3lzOIsFjqS00f71vdtixLxxoePbBNWG1lxnLjTVsQ8cJlC/Qyrdh3MX
         hCxXrW69hXTThbpU8J53vKJ7bs+LBP8nR+aANlEvIkeRtCH3wp2SwDydjRhFpLkbwOD1
         03m3oyXTM9ZULyKxU6gU+6Z/0urP2lwZ8ahuan+6cJX7pbZtzUHsiI6alORbxB7+OXNZ
         oGoOU9mZ15ZC1FvkQVZH2D9yUca/O41WT2dd0sDjrc8RU4gKPhfov3A7YlbHJxHdeZO0
         B6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yOsJFfZzo2g8QQglvZg2aAHRWN3H1uP8oT2x1qASVNE=;
        b=kB8TRpZSS79ESqU1hCzjt2/92zbgRJ6WSrqw0wTdNVH7TJrM3ZR7Rircl7iWcVyKNj
         fv+JZQU4+RrfuwkD96LNdQt+VB+/PHdw5B6NK1FJxFxpsoPJMN5OmxxhYtsYli6AQF/q
         UyFIhJHBHPeThbsUVbZSgCqHhq3H1kanR4SLqmlsVeE0dHHsDVaJbywlOgZTU26IcTxK
         Vni2XGgCT3ZpmLUPGdx2N714euyqxJd8k/8zPW1jcj/jdxgiP5bOGWdI1KX3bTG9Kglt
         T94v359A0awuxu1BfOi1ArPAa4BPxCcccWrhW2gRYdxt2uzRI5Yn6s7LYsb269wXYVVT
         d+Vg==
X-Google-Smtp-Source: ABdhPJygGzYLSNDoP+jg2PeUroxVqzuLHPPwhu1LdzXZYZQ2Gi/nyRk50RUcsCxheARX7r3xyznkzw==
X-Received: by 2002:a1c:2d0b:: with SMTP id t11mr196370wmt.10.1613641636217;
        Thu, 18 Feb 2021 01:47:16 -0800 (PST)
Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id 2sm8712698wre.24.2021.02.18.01.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 01:47:16 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id DEFDE1FF99;
	Thu, 18 Feb 2021 09:47:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Michael Walle <michael@walle.cc>,
	Anthony Green <green@moxielogic.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL 10/23] exec: Move TranslationBlock typedef to qemu/typedefs.h
Date: Thu, 18 Feb 2021 09:46:53 +0000
Message-Id: <20210218094706.23038-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210218094706.23038-1-alex.bennee@linaro.org>
References: <20210218094706.23038-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: A94HUqtuewrE

From: Richard Henderson <richard.henderson@linaro.org>

This also means we don't need an extra declaration of
the structure in hw/core/cpu.h.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210208233906.479571-2-richard.henderson@linaro.org>
Message-Id: <20210213130325.14781-11-alex.bennee@linaro.org>

diff --git a/include/exec/tb-context.h b/include/exec/tb-context.h
index ec4c13b455..cc33979113 100644
--- a/include/exec/tb-context.h
+++ b/include/exec/tb-context.h
@@ -26,7 +26,6 @@
 #define CODE_GEN_HTABLE_BITS     15
 #define CODE_GEN_HTABLE_SIZE     (1 << CODE_GEN_HTABLE_BITS)
 
-typedef struct TranslationBlock TranslationBlock;
 typedef struct TBContext TBContext;
 
 struct TBContext {
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 38d813c389..c005d3dc2d 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -74,8 +74,6 @@ typedef enum MMUAccessType {
 
 typedef struct CPUWatchpoint CPUWatchpoint;
 
-struct TranslationBlock;
-
 /* see tcg-cpu-ops.h */
 struct TCGCPUOps;
 
@@ -375,7 +373,7 @@ struct CPUState {
     IcountDecr *icount_decr_ptr;
 
     /* Accessed in parallel; all accesses must be atomic */
-    struct TranslationBlock *tb_jmp_cache[TB_JMP_CACHE_SIZE];
+    TranslationBlock *tb_jmp_cache[TB_JMP_CACHE_SIZE];
 
     struct GDBRegisterState *gdb_regs;
     int gdb_num_regs;
diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index ccc97d1894..ac3bb051f2 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -30,8 +30,7 @@ struct TCGCPUOps {
      * If more state needs to be restored, the target must implement a
      * function to restore all the state, and register it here.
      */
-    void (*synchronize_from_tb)(CPUState *cpu,
-                                const struct TranslationBlock *tb);
+    void (*synchronize_from_tb)(CPUState *cpu, const TranslationBlock *tb);
     /** @cpu_exec_enter: Callback for cpu_exec preparation */
     void (*cpu_exec_enter)(CPUState *cpu);
     /** @cpu_exec_exit: Callback for cpu_exec cleanup */
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index dc39b05c30..ee60eb3de4 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -120,6 +120,7 @@ typedef struct ReservedRegion ReservedRegion;
 typedef struct SavedIOTLB SavedIOTLB;
 typedef struct SHPCDevice SHPCDevice;
 typedef struct SSIBus SSIBus;
+typedef struct TranslationBlock TranslationBlock;
 typedef struct VirtIODevice VirtIODevice;
 typedef struct Visitor Visitor;
 typedef struct VMChangeStateEntry VMChangeStateEntry;
diff --git a/target/arm/internals.h b/target/arm/internals.h
index c38d541017..05cebc8597 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -173,8 +173,7 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu);
 void arm_translate_init(void);
 
 #ifdef CONFIG_TCG
-void arm_cpu_synchronize_from_tb(CPUState *cs,
-                                 const struct TranslationBlock *tb);
+void arm_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
 #endif /* CONFIG_TCG */
 
 
diff --git a/target/cris/translate.c b/target/cris/translate.c
index c893f877ab..65c168c0c7 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -132,7 +132,7 @@ typedef struct DisasContext {
 
     int delayed_branch;
 
-    struct TranslationBlock *tb;
+    TranslationBlock *tb;
     int singlestep_enabled;
 } DisasContext;
 
diff --git a/target/lm32/translate.c b/target/lm32/translate.c
index 030b232d66..20c70d03f1 100644
--- a/target/lm32/translate.c
+++ b/target/lm32/translate.c
@@ -93,7 +93,7 @@ typedef struct DisasContext {
     unsigned int tb_flags, synced_flags; /* tb dependent flags.  */
     int is_jmp;
 
-    struct TranslationBlock *tb;
+    TranslationBlock *tb;
     int singlestep_enabled;
 
     uint32_t features;
diff --git a/target/moxie/translate.c b/target/moxie/translate.c
index d5fb27dfb8..24a742b25e 100644
--- a/target/moxie/translate.c
+++ b/target/moxie/translate.c
@@ -36,7 +36,7 @@
 
 /* This is the state at translation time.  */
 typedef struct DisasContext {
-    struct TranslationBlock *tb;
+    TranslationBlock *tb;
     target_ulong pc, saved_pc;
     uint32_t opcode;
     uint32_t fp_status;
diff --git a/target/unicore32/translate.c b/target/unicore32/translate.c
index 962f9877a0..370709c9ea 100644
--- a/target/unicore32/translate.c
+++ b/target/unicore32/translate.c
@@ -34,7 +34,7 @@ typedef struct DisasContext {
     int condjmp;
     /* The label that will be jumped to when the instruction is skipped.  */
     TCGLabel *condlabel;
-    struct TranslationBlock *tb;
+    TranslationBlock *tb;
     int singlestep_enabled;
 #ifndef CONFIG_USER_ONLY
     int user;
-- 
2.20.1
