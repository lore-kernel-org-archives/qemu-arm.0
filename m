Received: by 2002:a05:6512:2248:0:0:0:0 with SMTP id i8csp464466lfu;
        Sat, 30 Apr 2022 22:50:32 -0700 (PDT)
X-Received: by 2002:a17:902:d70a:b0:158:7f07:e7c9 with SMTP id w10-20020a170902d70a00b001587f07e7c9mr6495863ply.109.1651384232722;
        Sat, 30 Apr 2022 22:50:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651384232; cv=none;
        d=google.com; s=arc-20160816;
        b=ogM31rg+OB9fIqgvMCwINF+yqPfIArv/2L5trKWhH/L6eFbroWUMQIsEB5AdpGCFSa
         ykAdpkJmXHCn3wQzswzxJl+nXwH0b3OeNUi0Ql9yIGhErEUhcfSMQa+AxSaMVZj2O/pS
         PHo7ZHt1HPKq3HKy8k6z05v4PHc7dbFWUWWqE1wwjIbCt0itA+Qr9MbdNnz+tOuPBPCj
         OA7/K0tN2zYEQ0PLuV4Ix/jlGadmkeFbD7q3vA9qPC3qqZlBj9gVq2Q8wqsfA/wKpfUu
         5cEVf+vKJcVfjcDAHPzZoEcbbP/n5RtxHznLhpBhAy54fIgm22HD7E0nZk5ArAyhDOA+
         LSag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=dx5oiRJc+noH6sVw0rqRTwoMiOy0KFwAAYpCE0cKydI=;
        b=tmXA53ern44dhQkVTJWMk/0jHQmklaxsyk0CTXs6Rb9QJFR7htce4u7qL24M4QLdvn
         1A1Cu6aHIOZUNF8dhDNZv9DpYH3gDMb17YYM3FlrYpoODqT8p6kruIl5GxauHK8JLOH7
         mFS7mFfyRJztZ3hAK4xjWok03qmiWlj8KOhioYzoprX+W2Hg6S/Pldwr+nENcHcykYDP
         ZcE2O7DCdF1/aWY7hCc2kErYUBtkmVJhbvt59TWLUa8vBy/iZ5+jvDEHraFIGF3BSRNT
         34y/G14UiA8TsCr2jCB4T3CNzYXuUZfRDnrpYCDCcAgsmqIwgwXVj/8cyVvleHfPtLQB
         buKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FXv2Ap61;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z12-20020a17090a540c00b001bc2568e27csor5383054pjh.0.2022.04.30.22.50.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 30 Apr 2022 22:50:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FXv2Ap61;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dx5oiRJc+noH6sVw0rqRTwoMiOy0KFwAAYpCE0cKydI=;
        b=FXv2Ap61Mj45dxmTRg+AU2WAE94b6Gx//d7KHUC4Lk7dGyPJoJ7WUGijvyxj0QJYeH
         Hv2NPLZnjSCShg30ydlkFAr8LwcYyR0JiOvj35osagvgWVX3PkcRS5/980ZKtM5vNl4O
         pRBF1rKuzVrWTYTZgtRsFU6WAjJH27EEcXtw+Tc1S5bsLebaOcjWMAOVEF6+7a+dstVd
         nb/DqCUikBQG9XHvPohbGSOCrjooSiMvM70/SfD+Omqsi05ICYPexOm0QuxUhSZJPJHj
         ItzGNptlNu6YALGyyhd8j5ZwrlrMe+dpAE1hnBNNkhW4PCDJO3Gq3fxZhPuCYAhh6te4
         Jkhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dx5oiRJc+noH6sVw0rqRTwoMiOy0KFwAAYpCE0cKydI=;
        b=1+frlQGmxtcgYKrwx1m6ebJ5L963UDmu3A/w9wkT9YPgf8r80iUgiM09UEgCQY2fH1
         g7416ntqlLtTHlK1DzeGk9p5WMQE3cxg6Qo0hJqgGhmOo9ebe3WAubUxXo6B3O/CMgYZ
         oHMZUSQ9ZtaERmph9+0zCoyEtxKjTz8HjPFJn4FrYksxjI2+LuaMko/2uGrmbaPgw8Yp
         zX2cMR4Ov4x84IXxzWNHA6avlNtLlhg590E5vRQVKfU4auRCuURQ4c36Hb56y3LYWbEB
         P5RQHstxXkce+R/IrliO5PV1suojhriJ4pkPoiV9rj4+U1Pxhu+AerGIwptsaj7T2zlO
         wZBg==
X-Gm-Message-State: AOAM532hDdIwafZM9YBuEPZkRuGXKP7V5sV+o60Xj2OKVEeEQwPHdYRL
	ZBLkbQHwuFXzKKs8xcXYhn7xTSxy
X-Google-Smtp-Source: ABdhPJwZaIgaJEjlKPGaKR1BuBhYfQdIrnXmE+nQLtm1Hc2lo0L05F+FizhZKcif1EdLEvy4l7MnpA==
X-Received: by 2002:a17:90a:e7c1:b0:1d2:b8f8:ecc1 with SMTP id kb1-20020a17090ae7c100b001d2b8f8ecc1mr12002875pjb.176.1651384232254;
        Sat, 30 Apr 2022 22:50:32 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([71.212.142.129])
        by smtp.gmail.com with ESMTPSA id cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 22:50:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 02/45] target/arm: Reorg CPAccessResult and access_check_cp_reg
Date: Sat, 30 Apr 2022 22:49:44 -0700
Message-Id: <20220501055028.646596-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: rgn8JJUGs7mZ

Rearrange the values of the enumerators of CPAccessResult
so that we may directly extract the target el. For the two
special cases in access_check_cp_reg, use CPAccessResult.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h    | 26 ++++++++++++--------
 target/arm/op_helper.c | 56 +++++++++++++++++++++---------------------
 2 files changed, 44 insertions(+), 38 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 8064c0763e..7f2c30eab1 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -167,26 +167,32 @@ static inline bool cptype_valid(int cptype)
 typedef enum CPAccessResult {
     /* Access is permitted */
     CP_ACCESS_OK = 0,
+
+    /*
+     * Combined with one of the following, the low 2 bits indicate the
+     * target exception level.  If 0, the exception is taken to the usual
+     * target EL (EL1 or PL1 if in EL0, otherwise to the current EL).
+     */
+    CP_ACCESS_EL_MASK = 3,
+
     /*
      * Access fails due to a configurable trap or enable which would
      * result in a categorized exception syndrome giving information about
      * the failing instruction (ie syndrome category 0x3, 0x4, 0x5, 0x6,
-     * 0xc or 0x18). The exception is taken to the usual target EL (EL1 or
-     * PL1 if in EL0, otherwise to the current EL).
+     * 0xc or 0x18).
      */
-    CP_ACCESS_TRAP = 1,
+    CP_ACCESS_TRAP = (1 << 2),
+    CP_ACCESS_TRAP_EL2 = CP_ACCESS_TRAP | 2,
+    CP_ACCESS_TRAP_EL3 = CP_ACCESS_TRAP | 3,
+
     /*
      * Access fails and results in an exception syndrome 0x0 ("uncategorized").
      * Note that this is not a catch-all case -- the set of cases which may
      * result in this failure is specifically defined by the architecture.
      */
-    CP_ACCESS_TRAP_UNCATEGORIZED = 2,
-    /* As CP_ACCESS_TRAP, but for traps directly to EL2 or EL3 */
-    CP_ACCESS_TRAP_EL2 = 3,
-    CP_ACCESS_TRAP_EL3 = 4,
-    /* As CP_ACCESS_UNCATEGORIZED, but for traps directly to EL2 or EL3 */
-    CP_ACCESS_TRAP_UNCATEGORIZED_EL2 = 5,
-    CP_ACCESS_TRAP_UNCATEGORIZED_EL3 = 6,
+    CP_ACCESS_TRAP_UNCATEGORIZED = (2 << 2),
+    CP_ACCESS_TRAP_UNCATEGORIZED_EL2 = CP_ACCESS_TRAP_UNCATEGORIZED | 2,
+    CP_ACCESS_TRAP_UNCATEGORIZED_EL3 = CP_ACCESS_TRAP_UNCATEGORIZED | 3,
 } CPAccessResult;
 
 typedef struct ARMCPRegInfo ARMCPRegInfo;
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 67be91c732..76499ffa14 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -632,11 +632,13 @@ void HELPER(access_check_cp_reg)(CPUARMState *env, void *rip, uint32_t syndrome,
                                  uint32_t isread)
 {
     const ARMCPRegInfo *ri = rip;
+    CPAccessResult res = CP_ACCESS_OK;
     int target_el;
 
     if (arm_feature(env, ARM_FEATURE_XSCALE) && ri->cp < 14
         && extract32(env->cp15.c15_cpar, ri->cp, 1) == 0) {
-        raise_exception(env, EXCP_UDEF, syndrome, exception_target_el(env));
+        res = CP_ACCESS_TRAP;
+        goto fail;
     }
 
     /*
@@ -655,48 +657,46 @@ void HELPER(access_check_cp_reg)(CPUARMState *env, void *rip, uint32_t syndrome,
         mask &= ~((1 << 4) | (1 << 14));
 
         if (env->cp15.hstr_el2 & mask) {
-            target_el = 2;
-            goto exept;
+            res = CP_ACCESS_TRAP_EL2;
+            goto fail;
         }
     }
 
-    if (!ri->accessfn) {
+    if (ri->accessfn) {
+        res = ri->accessfn(env, ri, isread);
+    }
+    if (likely(res == CP_ACCESS_OK)) {
         return;
     }
 
-    switch (ri->accessfn(env, ri, isread)) {
-    case CP_ACCESS_OK:
-        return;
+ fail:
+    switch (res & ~CP_ACCESS_EL_MASK) {
     case CP_ACCESS_TRAP:
-        target_el = exception_target_el(env);
-        break;
-    case CP_ACCESS_TRAP_EL2:
-        /* Requesting a trap to EL2 when we're in EL3 is
-         * a bug in the access function.
-         */
-        assert(arm_current_el(env) != 3);
-        target_el = 2;
-        break;
-    case CP_ACCESS_TRAP_EL3:
-        target_el = 3;
         break;
     case CP_ACCESS_TRAP_UNCATEGORIZED:
-        target_el = exception_target_el(env);
-        syndrome = syn_uncategorized();
-        break;
-    case CP_ACCESS_TRAP_UNCATEGORIZED_EL2:
-        target_el = 2;
-        syndrome = syn_uncategorized();
-        break;
-    case CP_ACCESS_TRAP_UNCATEGORIZED_EL3:
-        target_el = 3;
         syndrome = syn_uncategorized();
         break;
     default:
         g_assert_not_reached();
     }
 
-exept:
+    target_el = res & CP_ACCESS_EL_MASK;
+    switch (target_el) {
+    case 0:
+        target_el = exception_target_el(env);
+        break;
+    case 2:
+        assert(arm_current_el(env) != 3);
+        assert(arm_is_el2_enabled(env));
+        break;
+    case 3:
+        assert(arm_feature(env, ARM_FEATURE_EL3));
+        break;
+    default:
+        /* No "direct" traps to EL1 */
+        g_assert_not_reached();
+    }
+
     raise_exception(env, EXCP_UDEF, syndrome, target_el);
 }
 
-- 
2.34.1
