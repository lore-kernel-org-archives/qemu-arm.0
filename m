Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1247650wrm;
        Fri, 18 Oct 2019 11:08:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwalIzswQbY522uveJViYU87bah/r9okeev50M1ZSrpNLFeinIgsG0KGBsMQBYtGDALKQoi
X-Received: by 2002:a17:906:1655:: with SMTP id n21mr10097128ejd.110.1571422092782;
        Fri, 18 Oct 2019 11:08:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571422092; cv=none;
        d=google.com; s=arc-20160816;
        b=ZN0OEEBmopQuHjkTm5cTSDEBT5p3rqvbJyBd+VgSU3ZTWp+Upfw5USTV+LnvdeUZXB
         0NPfzFQcnyrv/AzgHSu3iz4pf3RWyQ83n00u2aYAQt1rtIS3fjT1BZ7A6XmmRcU+SXSA
         eODZuPW+PoS51JzyLwAh0sLr5dls45oysfVGrb4tpMeymhsH3rvAIu41crGslf9ZJJFU
         y94kcS3WQWCzoSazGqMT0+8a/gztS6ZAM53zWBQzgsRyIRglLAQS3IQtxAnseQ3vxual
         PwaHWAWFfrvTZ+425CeszKqYpEIcRYrclf+x0N+QwP8omKm2/YBOdDO6zkhpNiwSstpT
         e9NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=HNW+DKXClNFoWE5mAVnYOdmYoSifNB4F8oskeNBuM9U=;
        b=iQKWmC2wGKJA7dmlF/J5XGlFJlK6tbBKtwa+bHnuZzHTk1mcZ36Qc4vRVz12rQil8q
         uSLs6oMmSiLXyq6tjxrFc+3mglWotBhK1MEzSI6mOBgijujuWLtj789768+A02k7uC2i
         2S2okzHA3iHuKRomBB5f6a8dNd9w+7bWAlt0cXVJPncWB0PW7z5sVcQZSl2p2mLLr+BD
         1YDrjppChXNYguQKWo4Je7uMyaMjZyUMFYasmUntRB2x3ERleAjdvXy3lEUztnu+doXE
         hT4xauXgU1iYn0q2cWcQTlO4xkBgvvjJPMq2mn4LSN8Oy9+V+1kN8QqdvtWj5eZZVcIX
         tNmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X5gHWOT2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u8si4660285edb.57.2019.10.18.11.08.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 11:08:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X5gHWOT2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLWfb-0006Ll-Kz
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 14:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59291)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWIy-0006b1-BT
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:44:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWIw-0005Tz-Sb
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:44:48 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:45801)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLWIw-0005TI-MW
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:44:46 -0400
Received: by mail-pg1-x544.google.com with SMTP id r1so3739270pgj.12
 for <qemu-arm@nongnu.org>; Fri, 18 Oct 2019 10:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HNW+DKXClNFoWE5mAVnYOdmYoSifNB4F8oskeNBuM9U=;
 b=X5gHWOT202VQRwzSmAviUtQdEEfz1DuVcXPtMUdkmFhvtmwVqWeZSSA6EuKgHx/ig7
 IJPgcibeDPYPIfNviQe+aAwrVhmFYPXtVClBAy6yke4pVKHCBywOAzqCKLyLsEpbrRLZ
 aZ1pnVwGs1fMSLkP9yxe3rAjbIFEKeaTZy2bHj/6czbhpHCj1Eiqkqg2uwypAuII58jA
 sCWh9rBZiZc7XWufeR3G0fq4cG77JJk9ycnKofn2OVs/RVUzS6uXZeT0jd8NRS3MuJx/
 kKki63c8PKpmdPc8fHfzVfpxdQh7LHh6MupU11Ba1Un3ltW5wkgFa3ZqZUldEH+SaQVi
 wC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HNW+DKXClNFoWE5mAVnYOdmYoSifNB4F8oskeNBuM9U=;
 b=FNwKB5OZRZkcHREIgfGaHS8vtKTEvs1wykVomwEbKgC5vexCd7Nm36EFReurxLQcYS
 nVzAUnA5d/jhMCiJ/rcd5f8KsLxpftSKkD2HUr4JFoIYtJICuFUEq6Ng9GA1M25sFg6/
 HTLqkQXK4YTVTdjBxUzqImEZqhuOCp3uWEyRbxPkVvWVl9Xsfp7Gx4zl2wbSQivlJl9u
 fVE4uMAVjy5CrzCmYRJwmqZYUeYPt671ZYKhZ3m2ooIH1tYU8cP+4LPP564M5/g1MfSp
 LlHJrNBp+KkVS8xkFF682KDLP+hRdTZ7xDBtRuQGCsQFPBv1IT7lEHtkG2BYmavMvrkA
 28QA==
X-Gm-Message-State: APjAAAX3W2r6/hsOHh7jBYVqDYzTr9XKf36GMxmDJs3zHSiwrelcQQ02
 e4QGlnRs5DJKqGW3SUM3+T4H6Zikg44=
X-Received: by 2002:a62:ae0d:: with SMTP id q13mr8199450pff.53.1571420685722; 
 Fri, 18 Oct 2019 10:44:45 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d20sm7857534pfq.88.2019.10.18.10.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 10:44:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 11/22] target/arm: Hoist computation of TBFLAG_A32.VFPEN
Date: Fri, 18 Oct 2019 10:44:20 -0700
Message-Id: <20191018174431.1784-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018174431.1784-1-richard.henderson@linaro.org>
References: <20191018174431.1784-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zo3SI+puqlxk

There are 3 conditions that each enable this flag.  M-profile always
enables; A-profile with EL1 as AA64 always enables.  Both of these
conditions can easily be cached.  The final condition relies on the
FPEXC register which we are not prepared to cache.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    |  2 +-
 target/arm/helper.c | 14 ++++++++++----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 4d961474ce..9909ff89d4 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3192,7 +3192,7 @@ FIELD(TBFLAG_A32, XSCALE_CPAR, 4, 2)
  * the same thing as the current security state of the processor!
  */
 FIELD(TBFLAG_A32, NS, 6, 1)
-FIELD(TBFLAG_A32, VFPEN, 7, 1)          /* Not cached. */
+FIELD(TBFLAG_A32, VFPEN, 7, 1)          /* Partially cached, minus FPEXC. */
 FIELD(TBFLAG_A32, CONDEXEC, 8, 8)       /* Not cached. */
 FIELD(TBFLAG_A32, SCTLR_B, 16, 1)
 /* For M profile only, set if FPCCR.LSPACT is set */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 398e5f5d6d..89aa6fd933 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11088,6 +11088,9 @@ static uint32_t rebuild_hflags_m32(CPUARMState *env, int fp_el,
 {
     uint32_t flags = 0;
 
+    /* v8M always enables the fpu.  */
+    flags = FIELD_DP32(flags, TBFLAG_A32, VFPEN, 1);
+
     if (arm_v7m_is_handler_mode(env)) {
         flags = FIELD_DP32(flags, TBFLAG_A32, HANDLER, 1);
     }
@@ -11119,6 +11122,10 @@ static uint32_t rebuild_hflags_a32(CPUARMState *env, int fp_el,
                                    ARMMMUIdx mmu_idx)
 {
     uint32_t flags = rebuild_hflags_aprofile(env);
+
+    if (arm_el_is_aa64(env, 1)) {
+        flags = FIELD_DP32(flags, TBFLAG_A32, VFPEN, 1);
+    }
     return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
 }
 
@@ -11250,14 +11257,13 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
                 flags = FIELD_DP32(flags, TBFLAG_A32, VECSTRIDE,
                                    env->vfp.vec_stride);
             }
+            if (env->vfp.xregs[ARM_VFP_FPEXC] & (1 << 30)) {
+                flags = FIELD_DP32(flags, TBFLAG_A32, VFPEN, 1);
+            }
         }
 
         flags = FIELD_DP32(flags, TBFLAG_A32, THUMB, env->thumb);
         flags = FIELD_DP32(flags, TBFLAG_A32, CONDEXEC, env->condexec_bits);
-        if (env->vfp.xregs[ARM_VFP_FPEXC] & (1 << 30)
-            || arm_el_is_aa64(env, 1) || arm_feature(env, ARM_FEATURE_M)) {
-            flags = FIELD_DP32(flags, TBFLAG_A32, VFPEN, 1);
-        }
         pstate_for_ss = env->uncached_cpsr;
     }
 
-- 
2.17.1

