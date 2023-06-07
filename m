Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp391100ejb;
        Wed, 7 Jun 2023 09:49:30 -0700 (PDT)
X-Received: by 2002:a17:902:bc8c:b0:1ac:9cad:1845 with SMTP id bb12-20020a170902bc8c00b001ac9cad1845mr2075179plb.18.1686156570166;
        Wed, 07 Jun 2023 09:49:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686156570; cv=none;
        d=google.com; s=arc-20160816;
        b=Ts4e2jhQCTuum7QhkJP4d6QsUHS64CPWvoyhXQ/4+DKCEuOK/fQMc7ue8G0N9wdu/q
         j2WkgyqOJ00CIhMf4fL5xGL8qrc78H5YS7kpbv38BLn0aRjkH0Q7IWMaLXAtDEnmWG63
         y0YT04lYsjldQQIp0GMqxoVomfu3+hrn1H3pficPpiZ4nmw7nEWA0JRU0vaS073OiEXZ
         T0zrBVwtZXfL/Wlskg1AlPeNf73eVru6brKu3Klx416Iy1cHIyfEg5t5pg0am+/ABPJL
         ixYlEF0iQhQ0xEQY0gU48BgNOVzzU3QWsjIR00SOVe+4TEG7dB+/B8hO+0LKCw7D4awC
         ub/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=O3WaGEYLWcPiIzw6vB3RZqhbnQGY0LswNykwJliRoIg=;
        b=Bd7Za0n7yATCMcnBlOm5BqgI3EoG6dOYj9Wp7OsjfbJQk/4rSDeAPw9kCUtxU4AAzL
         VgBjgRizoV4/HBzKTn99sDXliD5GmoJBqqFeGmaTxWDouLgo+mdrvgxK612Fe4/c/WUp
         Koed5xixKLuq4A95/ayNRDj5ahW1wGNL+179eOKDu2i8mFNdcMz3XALH8hdmNeHuXcJR
         5MRYm+oRU+RosCSpTNHolLph6iGYM537UlFHJwCp0JN73J4qxENH+dDcW1KjYmn2B2QA
         Eom2gOVpA8qdGWH048bGl30Mf8W7iEZcTVHW+mdDck0hFLmpfh0RH9hojWhCosakj/AK
         811w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=YYFcplg8;
       spf=pass (google.com: domain of fufuyqqqqqq@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=fufuyqqqqqq@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <fufuyqqqqqq@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o22-20020a17090a9f9600b0024e52f605cfsor3235158pjp.1.2023.06.07.09.49.29
        (Google Transport Security);
        Wed, 07 Jun 2023 09:49:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of fufuyqqqqqq@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=YYFcplg8;
       spf=pass (google.com: domain of fufuyqqqqqq@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=fufuyqqqqqq@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686156569; x=1688748569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O3WaGEYLWcPiIzw6vB3RZqhbnQGY0LswNykwJliRoIg=;
        b=YYFcplg8tBZDSGn1Fl/Y1zYh7DNtnWYcFnj2LW1iuNiovSTRSQ8P3MkwEPjLHm4Hzp
         6pdtmgy6EiRwu76gSzaQmWU/bR9h0tf6LgMvz/qBn4Kojxf+pI5Q+JIzjqPjatFT4VvF
         HaG9IolWXaqzSHCnKP9rRZto+Va9Q53OtYk+3uCnf/zqf3hkrjI5ont7IaRPmVKgLSqU
         ffk+sFMZLJ31EIO9e5oueB/3wuzLEAgAD3TG2pj7g9t2P6LCPaUB0Ip5hty6OVSYaANX
         rSPiFMeVbBj6s+WDAfTvN+tnCeCqXRYFqW2jaiPFsUFMHUFH7fBfW7VS22QZF5lDreUr
         uDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686156569; x=1688748569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O3WaGEYLWcPiIzw6vB3RZqhbnQGY0LswNykwJliRoIg=;
        b=B9AtaUbrn1SCltTPv0qkAa01V5MH4EZy1vyaDbJbxpWqMEAF8TD7c46fIhC7fqFAT8
         AW6DPt4LvO5pz2N/xR52aP4sWearvcpF+5Ogc09W1ozJZhQaDodmbUKa7WRhkJT2vLjl
         PSmKPyIBt/8suO07n4Qf02QtfiuWaTbvqan5Rzaoi1U+b3wSTE79AztDdooX/vEla4w0
         Ydzu9DxzVsiurjguusgPXrRZDU8EdQEsJyx4uKzJ7da9DKErRJmpWcBsLxWoQhT2I1Ee
         F0nYtz9+OoYAvrDbmHbiv9AQj9KhccJIRZGVGzm8nwPUC7USAZQ/Uw1ytvXc6AvQ0GIw
         TU2A==
X-Gm-Message-State: AC+VfDxdyVyKpHBQOdGnr6GdSpit99CS4cH4s24uASqE9/NxuHdaZtL6
	+gH1xdGyR94P+DbFtLShIwPx3hVqQq7SiEUxlow=
X-Google-Smtp-Source: ACHHUZ4hKpxnZf9pvcR+5WsqUFOIufUqlmCx6NIb0JCO3OX+ITK7s9LgZVri/XviOSo/UFP0ldRRFA==
X-Received: by 2002:a17:90a:ca06:b0:259:ae4d:3377 with SMTP id x6-20020a17090aca0600b00259ae4d3377mr1730686pjt.27.1686156569266;
        Wed, 07 Jun 2023 09:49:29 -0700 (PDT)
Return-Path: <fufuyqqqqqq@gmail.com>
Received: from localhost.localdomain ([223.104.40.226])
        by smtp.gmail.com with ESMTPSA id 30-20020a17090a001e00b00250bf8495b3sm1671808pja.39.2023.06.07.09.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 09:49:28 -0700 (PDT)
From: Yeqi Fu <fufuyqqqqqq@gmail.com>
To: alex.bennee@linaro.org
Cc: richard.henderson@linaro.org,
	qemu-devel@nongnu.org,
	Yeqi Fu <fufuyqqqqqq@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [RFC v2 5/6] target/arm: Add native library calls
Date: Thu,  8 Jun 2023 00:47:49 +0800
Message-Id: <20230607164750.829586-6-fufuyqqqqqq@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230607164750.829586-1-fufuyqqqqqq@gmail.com>
References: <20230607164750.829586-1-fufuyqqqqqq@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: jKN/HTrKnFoh

Signed-off-by: Yeqi Fu <fufuyqqqqqq@gmail.com>
---
 target/arm/helper.c            | 47 ++++++++++++++++++++++++++++++++++
 target/arm/helper.h            |  6 +++++
 target/arm/tcg/translate-a64.c | 22 ++++++++++++++++
 target/arm/tcg/translate.c     | 25 +++++++++++++++++-
 target/arm/tcg/translate.h     | 19 ++++++++++++++
 5 files changed, 118 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0b7fd2e7e6..03fbc3724b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -25,6 +25,7 @@
 #include "sysemu/tcg.h"
 #include "qapi/error.h"
 #include "qemu/guest-random.h"
+#include "exec/cpu_ldst.h"
 #ifdef CONFIG_TCG
 #include "semihosting/common-semi.h"
 #endif
@@ -12045,3 +12046,49 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
     }
 }
 #endif
+
+#if defined(CONFIG_USER_ONLY)  && defined(CONFIG_USER_NATIVE_CALL)
+
+#define NATIVE_FN_W_3W()           \
+    target_ulong arg0, arg1, arg2; \
+    arg0 = env->regs[0];           \
+    arg1 = env->regs[1];           \
+    arg2 = env->regs[2];
+
+void helper_native_memcpy(CPUARMState *env)
+{
+    CPUState *cs = env_cpu(env);
+    NATIVE_FN_W_3W();
+    void *ret;
+    void *dest = g2h(cs, arg0);
+    void *src = g2h(cs, arg1);
+    size_t n = (size_t)arg2;
+    ret = memcpy(dest, src, n);
+    env->regs[0] = (target_ulong)h2g(ret);
+}
+
+void helper_native_memcmp(CPUARMState *env)
+{
+    CPUState *cs = env_cpu(env);
+    NATIVE_FN_W_3W();
+    int ret;
+    void *s1 = g2h(cs, arg0);
+    void *s2 = g2h(cs, arg1);
+    size_t n = (size_t)arg2;
+    ret = memcmp(s1, s2, n);
+    env->regs[0] = ret;
+}
+
+void helper_native_memset(CPUARMState *env)
+{
+    CPUState *cs = env_cpu(env);
+    NATIVE_FN_W_3W();
+    void *ret;
+    void *s = g2h(cs, arg0);
+    int c = (int)arg1;
+    size_t n = (size_t)arg2;
+    ret = memset(s, c, n);
+    env->regs[0] = (target_ulong)h2g(ret);
+}
+
+#endif
diff --git a/target/arm/helper.h b/target/arm/helper.h
index 3335c2b10b..57144bf6fb 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -1038,6 +1038,12 @@ DEF_HELPER_FLAGS_5(gvec_uclamp_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(gvec_uclamp_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+#if defined(CONFIG_USER_ONLY)  && defined(CONFIG_USER_NATIVE_CALL)
+DEF_HELPER_1(native_memcpy, void, env)
+DEF_HELPER_1(native_memcmp, void, env)
+DEF_HELPER_1(native_memset, void, env)
+#endif
+
 #ifdef TARGET_AARCH64
 #include "tcg/helper-a64.h"
 #include "tcg/helper-sve.h"
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 741a608739..04421af6c6 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -35,6 +35,7 @@
 #include "cpregs.h"
 #include "translate-a64.h"
 #include "qemu/atomic128.h"
+#include "native/native-func.h"
 
 static TCGv_i64 cpu_X[32];
 static TCGv_i64 cpu_pc;
@@ -2291,6 +2292,9 @@ static void disas_exc(DisasContext *s, uint32_t insn)
             if (s->fgt_svc) {
                 gen_exception_insn_el(s, 0, EXCP_UDEF, syndrome, 2);
                 break;
+            } else if (native_bypass() && imm16 == 0xff) {
+                s->native_call_status = true;
+                break;
             }
             gen_ss_advance(s);
             gen_exception_insn(s, 4, EXCP_SWI, syndrome);
@@ -14203,6 +14207,24 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     s->fp_access_checked = false;
     s->sve_access_checked = false;
 
+    if (native_bypass() && s->native_call_status) {
+        switch (insn) {
+        case NATIVE_MEMCPY:
+            gen_helper_native_memcpy(cpu_env);
+            break;
+        case NATIVE_MEMCMP:
+            gen_helper_native_memcmp(cpu_env);
+            break;
+        case NATIVE_MEMSET:
+            gen_helper_native_memset(cpu_env);
+            break;
+        default:
+            unallocated_encoding(s);
+        }
+        s->native_call_status = false;
+        return;
+    }
+
     if (s->pstate_il) {
         /*
          * Illegal execution state. This has priority over BTI
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 7468476724..83ce0f7437 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -34,7 +34,7 @@
 #include "exec/helper-gen.h"
 #include "exec/log.h"
 #include "cpregs.h"
-
+#include "native/native-func.h"
 
 #define ENABLE_ARCH_4T    arm_dc_feature(s, ARM_FEATURE_V4T)
 #define ENABLE_ARCH_5     arm_dc_feature(s, ARM_FEATURE_V5)
@@ -58,6 +58,10 @@ TCGv_i32 cpu_CF, cpu_NF, cpu_VF, cpu_ZF;
 TCGv_i64 cpu_exclusive_addr;
 TCGv_i64 cpu_exclusive_val;
 
+#if defined(CONFIG_USER_ONLY) && !defined(TARGET_AARCH64)  \
+    && defined(CONFIG_USER_NATIVE_CALL)
+#endif
+
 #include "exec/gen-icount.h"
 
 static const char * const regnames[] =
@@ -8576,6 +8580,8 @@ static bool trans_SVC(DisasContext *s, arg_SVC *a)
         if (s->fgt_svc) {
             uint32_t syndrome = syn_aa32_svc(a->imm, s->thumb);
             gen_exception_insn_el(s, 0, EXCP_UDEF, syndrome, 2);
+        } else if (native_bypass() && a->imm == 0xff) {
+            s->native_call_status = true;
         } else {
             gen_update_pc(s, curr_insn_len(s));
             s->svc_imm = a->imm;
@@ -9372,6 +9378,23 @@ static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     insn = arm_ldl_code(env, &dc->base, pc, dc->sctlr_b);
     dc->insn = insn;
     dc->base.pc_next = pc + 4;
+    if (native_bypass() && dc->native_call_status) {
+        switch (insn) {
+        case NATIVE_MEMCPY:
+            gen_helper_native_memcpy(cpu_env);
+            break;
+        case NATIVE_MEMCMP:
+            gen_helper_native_memcmp(cpu_env);
+            break;
+        case NATIVE_MEMSET:
+            gen_helper_native_memset(cpu_env);
+            break;
+        default:
+            unallocated_encoding(dc);
+        }
+        dc->native_call_status = false;
+        return;
+    }
     disas_arm_insn(dc, insn);
 
     arm_post_translate_insn(dc);
diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index a9d1f4adc2..19c4f7af7f 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -149,6 +149,13 @@ typedef struct DisasContext {
     int c15_cpar;
     /* TCG op of the current insn_start.  */
     TCGOp *insn_start;
+    /*
+     * Indicate whether the next instruction is a native function call (true)
+     * or not (false).
+     */
+#if defined(CONFIG_USER_ONLY)  && defined(CONFIG_USER_NATIVE_CALL)
+    bool native_call_status;
+#endif
 } DisasContext;
 
 typedef struct DisasCompare {
@@ -657,3 +664,15 @@ static inline void gen_restore_rmode(TCGv_i32 old, TCGv_ptr fpst)
     }
 
 #endif /* TARGET_ARM_TRANSLATE_H */
+
+/*
+ * Check if the native bypass feature is enabled.
+ */
+static inline bool native_bypass(void)
+{
+#if defined(CONFIG_USER_ONLY) && defined(CONFIG_USER_NATIVE_CALL)
+    return true;
+#else
+    return false;
+#endif
+}
-- 
2.34.1
