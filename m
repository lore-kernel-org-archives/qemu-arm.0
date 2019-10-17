Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1350473wrm;
        Thu, 17 Oct 2019 11:59:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwzMGqRCW3XSf1sbnkVmWLlSJOaStRN5fDMae4P7dyl+5/+sjfli32I8NZqUsY6/ioXl/5G
X-Received: by 2002:a05:6402:1a3b:: with SMTP id be27mr5390610edb.210.1571338750029;
        Thu, 17 Oct 2019 11:59:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571338750; cv=none;
        d=google.com; s=arc-20160816;
        b=wOoEcAHa5VkXg4X+itzFyTvMIFAX4DkHnwRf5t/CDwTUnH54n4o2V0yg7bv04o9vl+
         fcTY8dUXVOccn7d0+PMsH5h8RhVXZp88LhdETvv2ZdT8sOkpR3pguIbSH/oQCFhNuIcZ
         5qHlFZSggpNAdQLdt9XY4JTn9tWDuwpzgiW7gwyG/pz+C/gE0I9sfwVmC/YcPEMHrNSw
         /1toIUJQDR/4KHefYxkpuo/fiu2FRyc7ySgaTDtIA+OO85VB1EGNq4dYDnepZ/MXEApT
         oelmOc1f89TrfBFpAYPp8fL0HU55nsGr+PMkmP9pWtVU50h576H/snAhNrkW7kEDDPJZ
         4hdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=O5qTDR4/yunqOnDsae4ZjoUIG4TsLVXzaOK/t5hnYkI=;
        b=yOX9ejvVHCudNw5hexLMeAViDKmjtUQpD7hRMYmFFw9lGD9IYo5H6L/wOV/FTuukwB
         wnxwonzr57WedY1WACbnn4kbtj9weraMPdFD3eXLkBd9Mfce0JshdOnzGHbgWxynRrfY
         tlp+s96lEsMMZXkNYiUuDBidLEFS3nSsGPX0xDzv7QgmVHZpfbQquG6MpePelBF3CHuC
         MKT65Fd1fqpfyICovGeAKzpcwq+84AD9fRGUlKxixoI8LNx3ItDx+l6BGMmcotK81SEe
         QU/ntnCDP3WFgFY533ehPDxYXxgHLE4K6iwdrCpned9lYGh+QXWDpMG4i5QTy3WqakH3
         0MMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="L8rR/EDb";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p14si2174629eda.411.2019.10.17.11.59.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 11:59:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="L8rR/EDb";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLAzM-00014Z-Mv
	for alex.bennee@linaro.org; Thu, 17 Oct 2019 14:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35114)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLArq-000194-Rm
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 14:51:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLArp-0000rw-O6
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 14:51:22 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:43865)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLArp-0000rc-Fr
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 14:51:21 -0400
Received: by mail-pf1-x444.google.com with SMTP id a2so2205259pfo.10
 for <qemu-devel@nongnu.org>; Thu, 17 Oct 2019 11:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O5qTDR4/yunqOnDsae4ZjoUIG4TsLVXzaOK/t5hnYkI=;
 b=L8rR/EDb44Bi3pXfkhIT7iJFLS1M4qFMVTm+WsN2UrzwSR5ncosMv7Vo+AQEw6jelE
 P9eVIcrioFLljH+RUpwT3u0HJbbS7kMQGkU82k+Q5p1wZKWqTVxTX9WLWMZ5BF6YvrcT
 9sF0Jsp0OhH7iyp9kwcuDm4qluQUcrlJE3e29j9kAfpPGFzvZV4YwzBc96vSkUJhCMTg
 KYpajYdq8CKSm+8pzgs62ySjekn5mK8DSYF77UoMaSMyMtEMouADPX/j9vy+jGJliYFd
 4LcMcMwrR/giPlFSyhQVBMm+VeUByaBFDlS2IU8+HM+sA3lXlygNPuIjKB9jcp3Q0Ul/
 GXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O5qTDR4/yunqOnDsae4ZjoUIG4TsLVXzaOK/t5hnYkI=;
 b=B1XXWzESM9SsZ9CAZhvw1cmFy6fzRMfx9EpfHQxAoJfo6E80+XxfjHTJpaN74XvvKT
 y3WJUtTfxfr56eyDgb+FWEcSMjpz4dNIJyffvGQVd2Vz+eCxpfuF2XlyishXO6DCzBBy
 2rviPGC2tbwysWkIFu/0oqDTGazKG4Dp765r6nPXWGbcBXNdwgjmyjcVjoN7qyk5mrzR
 2bsz6p1+/96yL8fo2aDROVBq5mJ0Yh4LncKmIDKThO39QUvDUg9NofsmWUWa/ulJ1vCj
 qnfQXE2muoP7QzXxTEZLaBuk2sPsj3/qSvmQ833WE4Z6fUZd34meuEZsqJXenTVzJSDL
 5Ibw==
X-Gm-Message-State: APjAAAUtzbxSxiR42Swz9mHddIdLWSwlxQDNv2U5ivk1iP3ppehm0mbX
 LQ0SUR0X76Um5wUpy1kibLyXHHNyLR0=
X-Received: by 2002:a17:90a:d818:: with SMTP id
 a24mr6216664pjv.5.1571338280124; 
 Thu, 17 Oct 2019 11:51:20 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id s97sm5009256pjc.4.2019.10.17.11.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 11:51:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 06/20] target/arm: Reduce tests vs M-profile in
 cpu_get_tb_cpu_state
Date: Thu, 17 Oct 2019 11:50:56 -0700
Message-Id: <20191017185110.539-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191017185110.539-1-richard.henderson@linaro.org>
References: <20191017185110.539-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: my6QhU+xAKnQ

Hoist the computation of some TBFLAG_A32 bits that only apply to
M-profile under a single test for ARM_FEATURE_M.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 49 +++++++++++++++++++++------------------------
 1 file changed, 23 insertions(+), 26 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d4303420da..296a4b2232 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11194,6 +11194,29 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
 
         if (arm_feature(env, ARM_FEATURE_M)) {
             flags = rebuild_hflags_m32(env, fp_el, mmu_idx);
+
+            if (arm_feature(env, ARM_FEATURE_M_SECURITY) &&
+                FIELD_EX32(env->v7m.fpccr[M_REG_S], V7M_FPCCR, S)
+                != env->v7m.secure) {
+                flags = FIELD_DP32(flags, TBFLAG_A32, FPCCR_S_WRONG, 1);
+            }
+
+            if ((env->v7m.fpccr[env->v7m.secure] & R_V7M_FPCCR_ASPEN_MASK) &&
+                (!(env->v7m.control[M_REG_S] & R_V7M_CONTROL_FPCA_MASK) ||
+                 (env->v7m.secure &&
+                  !(env->v7m.control[M_REG_S] & R_V7M_CONTROL_SFPA_MASK)))) {
+                /*
+                 * ASPEN is set, but FPCA/SFPA indicate that there is no
+                 * active FP context; we must create a new FP context before
+                 * executing any FP insn.
+                 */
+                flags = FIELD_DP32(flags, TBFLAG_A32, NEW_FP_CTXT_NEEDED, 1);
+            }
+
+            bool is_secure = env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_S_MASK;
+            if (env->v7m.fpccr[is_secure] & R_V7M_FPCCR_LSPACT_MASK) {
+                flags = FIELD_DP32(flags, TBFLAG_A32, LSPACT, 1);
+            }
         } else {
             flags = rebuild_hflags_common_32(env, fp_el, mmu_idx, 0);
         }
@@ -11233,32 +11256,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
         }
     }
 
-    if (arm_feature(env, ARM_FEATURE_M_SECURITY) &&
-        FIELD_EX32(env->v7m.fpccr[M_REG_S], V7M_FPCCR, S) != env->v7m.secure) {
-        flags = FIELD_DP32(flags, TBFLAG_A32, FPCCR_S_WRONG, 1);
-    }
-
-    if (arm_feature(env, ARM_FEATURE_M) &&
-        (env->v7m.fpccr[env->v7m.secure] & R_V7M_FPCCR_ASPEN_MASK) &&
-        (!(env->v7m.control[M_REG_S] & R_V7M_CONTROL_FPCA_MASK) ||
-         (env->v7m.secure &&
-          !(env->v7m.control[M_REG_S] & R_V7M_CONTROL_SFPA_MASK)))) {
-        /*
-         * ASPEN is set, but FPCA/SFPA indicate that there is no active
-         * FP context; we must create a new FP context before executing
-         * any FP insn.
-         */
-        flags = FIELD_DP32(flags, TBFLAG_A32, NEW_FP_CTXT_NEEDED, 1);
-    }
-
-    if (arm_feature(env, ARM_FEATURE_M)) {
-        bool is_secure = env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_S_MASK;
-
-        if (env->v7m.fpccr[is_secure] & R_V7M_FPCCR_LSPACT_MASK) {
-            flags = FIELD_DP32(flags, TBFLAG_A32, LSPACT, 1);
-        }
-    }
-
     if (!arm_feature(env, ARM_FEATURE_M)) {
         int target_el = arm_debug_target_el(env);
 
-- 
2.17.1

