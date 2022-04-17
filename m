Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp1270556lfk;
        Sun, 17 Apr 2022 11:00:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUKv0eImeI3SRh+rbSaArdos7BghLZw2UyxNjr5m10bXRsXR1lj9b58sucuvjMpWaUgyMA
X-Received: by 2002:a05:620a:167a:b0:69e:5d3c:a50d with SMTP id d26-20020a05620a167a00b0069e5d3ca50dmr4697259qko.781.1650218450479;
        Sun, 17 Apr 2022 11:00:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650218450; cv=none;
        d=google.com; s=arc-20160816;
        b=eiZUUepN4nN8qHsjpqa9/vjhLhL12kYCu2N4RuYt+5NJseCikm1Kcp2axnTZPlR7qR
         VcmWgig7XDtXo/gv2y9GagQfMFwpQzwhm8dbC4F7/d0E/5FuKe49bzgz7t8nr6q+AoqI
         PgGOn9pKaijA18C1G9OmZTUd85qPwIq1LgMLHg19PPRWkFGoWPUoyIrfIX1SbVDbE3sZ
         BeHYuLPwEdw67awQi8dgfvS//B5835pIfyQyHi27MBdUTLRi0UgpRwIGsdkR/T0pxmzM
         Gj5nXIckqVNDF6Hh/LVwfVXOL60HD/F0x/H6UWYTAl1a8i7GrSRAuDKXWnueRB/6TLtk
         ctgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/kQGH0Cy2HcRWOzQdszvWYCvmoLOtgBt5ZPwOUyma0Q=;
        b=x422A6Du4BUKIV6QPa4A3a9/S1tHIG63b/L9DEFq7daWfidoONaNKJOiGpq/2axAOC
         xFjTLicy/gk8NmEoIA6xhtTqmICHvwOAvCqDY5w3FAiengfg7oYItR1flW8P8icsV2bN
         +/ZyH9Q6N3eMXXjQsQlwMY5AjD/yICiInArT3i7zVZZNIsGrS37z8TcEOHIj9NA3itFN
         hpYENGcxhpG9ho8QbPtdzpMxsD6YKIQsufnv7GZoZOIxOPxhVW8/2/Ku3E8SU7vL531n
         V5ks/XpohLNgRlQ+jXsyxy8y1LOs2y6u5eZ3gUSn57aCzTA8dF7xNLTjWgYYf4ft29TF
         YfTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wQAAsmyg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2-20020a056214062200b00446109f5e36si2196277qvx.223.2022.04.17.11.00.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Apr 2022 11:00:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wQAAsmyg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ng9Cb-0006KT-TV
	for alex.bennee@linaro.org; Sun, 17 Apr 2022 14:00:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xD-0000zk-LA
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:44:55 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:39829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xA-0003MZ-Vz
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:44:55 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 mp16-20020a17090b191000b001cb5efbcab6so15506156pjb.4
 for <qemu-arm@nongnu.org>; Sun, 17 Apr 2022 10:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/kQGH0Cy2HcRWOzQdszvWYCvmoLOtgBt5ZPwOUyma0Q=;
 b=wQAAsmyg3n5S4LCPwHVToO0VZ2joUjpYmEbZ+5t0AWJ0EgNje3FkibzaA+gW4ndzCp
 EMcj8aWHiRsksbK7rsBECqUAgNUt7DHZavxlvgUWi2cuamDnuRfAQZ2wadKYkGNDE4o+
 uX9/JB/7NFYKHlD8d4kxFGGcYbDdeo1ua2n7otSJWjQE0IBfxC/woMGJHWi5iqtFqGLh
 jNYggpGlIR5kawCPT/E3aYUpJpBZNp/s4Yr9HSmzkmov03S+u5Loh1kDq9BjGVyDclgE
 cUjFYhpkSvZTXVpfBV79SMvSd7IouIHokZvdlFbGI5lxazmKjehWrbYzjKyvNpgg9r6M
 WBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/kQGH0Cy2HcRWOzQdszvWYCvmoLOtgBt5ZPwOUyma0Q=;
 b=HWzPJFwT1p71vMzdKm66S2DoHFVlEbHzSpWGp7laeExUus/NvVT/FUxVoPJJbRtNcI
 J9UBTP4rHjJd9jLUUV8Gr98r+sGIqhbG/aLlCmxNz/11TQjfkbrOYAndRu+nwQ+f9d97
 N8ssk0hOz5HYnIFxnZnNMRwUFqQblVYQsvFTgn3UvpmySsDvErhlLWxvyF/vCdToD6YE
 MmtY42O/oHHWtUDjnv5jcCF86Gio77c9Ojb4khO8eeOarBKsTb5NZcZKEwVIEau8PXr2
 6GGY6GaVKCDzsK05NVt84c0XNFSMvOCo+Ts8yxxUWzdq5CumZEbGGSCK7FFDN7NKR+JC
 zreQ==
X-Gm-Message-State: AOAM5324zQyXzac7zgXDQ9O5bNQRN9c/h/0O52/xRdS7qqbzE8xaodEe
 VW6DlUqBkDgVQ2ztn8j0/y12Tg==
X-Received: by 2002:a17:902:e0ca:b0:158:cc0a:44f7 with SMTP id
 e10-20020a170902e0ca00b00158cc0a44f7mr7343242pla.70.1650217491599; 
 Sun, 17 Apr 2022 10:44:51 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 25/60] target/arm: Reorg CPAccessResult and
 access_check_cp_reg
Date: Sun, 17 Apr 2022 10:43:51 -0700
Message-Id: <20220417174426.711829-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sW8SjBCpwr22

Rearrange the values of the enumerators of CPAccessResult
so that we may directly extract the target el. For the two
special cases in access_check_cp_reg, use CPAccessResult.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h    | 26 ++++++++++++--------
 target/arm/op_helper.c | 56 +++++++++++++++++++++---------------------
 2 files changed, 44 insertions(+), 38 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 005aa2d3a5..700fcc1478 100644
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
2.25.1

