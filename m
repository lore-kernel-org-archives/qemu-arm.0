Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2897166lft;
        Mon, 27 Jun 2022 21:58:15 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vSc3VRUNKbjcgs9x7zoBZCh/UjhWVOm7D0PnV1tPKSSwoos+kopgB2ExFdPgKAS8ySGooF
X-Received: by 2002:ac8:4e47:0:b0:306:6835:d452 with SMTP id e7-20020ac84e47000000b003066835d452mr11722789qtw.602.1656392295081;
        Mon, 27 Jun 2022 21:58:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656392295; cv=none;
        d=google.com; s=arc-20160816;
        b=SHk7CEfbkQTJnHGCpVbVS7rv8EbqH2EXJgAWxng0seGuSbbv3VEOmfc+JtkuddZD9Z
         tncDvVZ9kAgbdrzk7peG4w3Mhm180neyDaezSnfEGsnNzCpdpV5dV3NwvnrOAO8RqIUc
         hcl4w9koOFL/cqinW/quP4meBZtpHCe8laCVjiMQgEd4V/NMDdWop6D6pFZ269C3BNGC
         /l97aYuBijtqTIMHI4n/Epbe14hXoUk6xR/mO22nQUmMehKiN5130rhRGnt46CIKJ+q+
         6AGxdovN8AaoAcefvKFjXuN8I1mA80gntnA03/ZfWUxD5ISS3PwFilQ6t3CQ9cUMc0d7
         /SeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QMHowAe2qqOcR59WIhFIt7ar7qrWdpcyRnVo7s79wDU=;
        b=Nfe1MhGmhLYNJ2ongBK1iTGTtHbPjJADrP/Vasxr7WHZX8j8jlXw3/RTDnSFt2ZOG1
         HKLoXTOdN0o+WHxs3BP5EuS/sx7jp7JTSxL6Ichg1Y8eC7XZKgSyyrV9e9+5G2griwf9
         AKaoh8QC1g9PSMQPt4ESOnALG5PiIGUpLMoZ9YFGezr3XJiuS9K0/Y0aTX9/89Ia8zWk
         vxb3MjPNN0xdHAk6Jj4r0m7vlm0iYsKgMd6DATG0TCBuJqgwEcEABW3ezHogwBYdkk6M
         hT1O7MkVwFZJDO9B5wmD8VgosJSRS67MSKUnBZ1PLAQQ+d4TPOnmrygVwS2+zm2ZdMCF
         QVHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M2VRsroE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z21-20020ac84315000000b00317d17e53d8si5742669qtm.392.2022.06.27.21.58.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 21:58:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M2VRsroE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o63Ik-0008G2-IS
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 00:58:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62kJ-0002iB-EJ
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:22:39 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:42959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62kH-0003ut-Ni
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:22:39 -0400
Received: by mail-pg1-x532.google.com with SMTP id d129so11002530pgc.9
 for <qemu-arm@nongnu.org>; Mon, 27 Jun 2022 21:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QMHowAe2qqOcR59WIhFIt7ar7qrWdpcyRnVo7s79wDU=;
 b=M2VRsroE7qD9F2EoJaW/fOsPoy0uGgP2yzBaCecTaKYiZeb1uKLOyWq+O2N79SzT01
 h8Y/lvnnHHKqayXwDmceSGXdMmILMvadNTRZYWZa00Bv/HhkMSunNidW0HHjXk7cyt2d
 JeolNr/+F9hndx5bMvMP8VcmDAPm6EJOkhpi0JOCz/iDQ3SjXsTdWThDJQX70ajT41CE
 b+lVy9BBkKv7FY4M6ykXMTOj7tziQbPnTdF/FUmi8j3+qXXD4iIN4sVOAtMOtb/ncDlU
 CkIgjMJ4TYyyka0eYyV5vGyRPgNDDp6Pni9zPOi3kLYCalDgdZ1XNwlrCoxRA4VmMUkw
 4OVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QMHowAe2qqOcR59WIhFIt7ar7qrWdpcyRnVo7s79wDU=;
 b=cBYZoLKv/cSZvFRRD+vupGnYtYAlNGNzkZscUNU2To2N7H7XNK3CCEAo5p3dc4YGb2
 DGNa5N+hT++FcxQS1sSyGK/pTmbAp3qPQRq66rCpaWQF5DUr8GA55q0FYp+5zhCrUEPV
 tzGgt/c8pdT+depGnTHCc4L7d4d98RqFFG/rdZ5CcXRclZb7lWcu/zSyejeAM2LEUrvx
 ZM3tv06tXZaOFxpie6+SrHPgazc7flTBRerFrXv3w3DgyeHobuguE2A8tvfI7VI2LWuS
 ZkME1+CUOkzeG5oS0AMcIVHxD8P49BTVHfbkJXYkqGDudhW1BhLlLdVxt1fz5BURH4VV
 BYew==
X-Gm-Message-State: AJIora/VyV0x0F0uND+jxark+/ftXagwSdviDK/RXaOMPj/qqzSNB6nw
 kac613MTSz8k4rVGZO2bp2SYmw==
X-Received: by 2002:a63:7a49:0:b0:40c:ca38:aed7 with SMTP id
 j9-20020a637a49000000b0040cca38aed7mr15981612pgn.11.1656390156422; 
 Mon, 27 Jun 2022 21:22:36 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:22:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 31/45] target/arm: Reset streaming sve state on exception
 boundaries
Date: Tue, 28 Jun 2022 09:51:03 +0530
Message-Id: <20220628042117.368549-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rS+r7WKq6lrM

We can handle both exception entry and exception return by
hooking into aarch64_sve_change_el.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 976e414eda..2dc1f95c6d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11754,6 +11754,19 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
         return;
     }
 
+    old_a64 = old_el ? arm_el_is_aa64(env, old_el) : el0_a64;
+    new_a64 = new_el ? arm_el_is_aa64(env, new_el) : el0_a64;
+
+    /*
+     * Both AArch64.TakeException and AArch64.ExceptionReturn
+     * invoke ResetSVEState when taking an exception from, or
+     * returning to, AArch32 state when PSTATE.SM is enabled.
+     */
+    if (old_a64 != new_a64 && FIELD_EX64(env->svcr, SVCR, SM)) {
+        arm_reset_sve_state(env);
+        return;
+    }
+
     /*
      * DDI0584A.d sec 3.2: "If SVE instructions are disabled or trapped
      * at ELx, or not available because the EL is in AArch32 state, then
@@ -11766,10 +11779,8 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
      * we already have the correct register contents when encountering the
      * vq0->vq0 transition between EL0->EL1.
      */
-    old_a64 = old_el ? arm_el_is_aa64(env, old_el) : el0_a64;
     old_len = (old_a64 && !sve_exception_el(env, old_el)
                ? sve_vqm1_for_el(env, old_el) : 0);
-    new_a64 = new_el ? arm_el_is_aa64(env, new_el) : el0_a64;
     new_len = (new_a64 && !sve_exception_el(env, new_el)
                ? sve_vqm1_for_el(env, new_el) : 0);
 
-- 
2.34.1

