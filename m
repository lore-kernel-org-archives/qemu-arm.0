Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3828842ejb;
        Tue, 21 Feb 2023 18:37:58 -0800 (PST)
X-Google-Smtp-Source: AK7set/ZY/ondbgqzZh73u0rNrQ89Zh9AGryWn/bB/YcOtgDhjxioUhoMXVKu2ZRxbcMN8naxYf3
X-Received: by 2002:a05:622a:1196:b0:3b8:6814:ea20 with SMTP id m22-20020a05622a119600b003b86814ea20mr13060527qtk.67.1677033478783;
        Tue, 21 Feb 2023 18:37:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677033478; cv=none;
        d=google.com; s=arc-20160816;
        b=sFNgsWBHGIrULJc5iHjGIApHGBHyW2XLVKk4xTdSQu13gCO9wZS3DjRKJy/RhACN8r
         UebTOgaKTfZZFmTV3RCYpgSygJjcdhrlsigjNwWUhRObYq72gu9LvZa+1a5PYDd86Pqr
         3G2o688OVo1nr3GR2h5f6aNSLnIjywabIreOkbcFRX8Gp8+s3im7uUoaVoe3Bm8HL4LQ
         TlGRuHQv8c4T8Wbs77kj8bqwSSnbJrMxQJlTWAtOyd20EMZ3NeIblXDeePuk2oiQcheO
         9OVH1Gcrs/Fek/tRW2gLnzLay/VE05xaP767FFVV1U43wzzmbSX6iSW1Q5eKEPxIPC5c
         Hk/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Q5sZk2IQIjptsv3a3XcSVTDNnG9U0oFxOYLINCyR7ko=;
        b=DP2rVBJ+y8E7l4Q7A8T5sRfV4k4SNDgI+pLC+lYjJtln4tYZzvvZoLwpALvDAqV1C8
         bGYZdA8OLum1tpq27aXdfrFOD6XUOp6zkxNFEkUOcdRp4ILFvtrPQp1Zlczwmcv2Lvm6
         oaR/VCK2QWqTQDIxVKsMJl1MkQgqEdiuqZ5j8h5a8y/VLe7cLwtec090UMDI3+zAkysx
         MpFDjrKwPfnBeFiN4D3J4zf94qFftGz80nGFnlbR1Gwb/awNuG1HXqT1F5ZJeHqhJyRI
         XtOMKHy5hMfkXYEyn3T9vZuJFAmsXK6ur1FwXKsMp22JyHAGTkCbAStjJLhw6QFvTTeh
         hQQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xwJzYDfi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b11-20020ac87fcb000000b003bd0adc66e9si4620465qtk.244.2023.02.21.18.37.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 18:37:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xwJzYDfi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUexU-0007i8-HQ; Tue, 21 Feb 2023 21:34:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUexP-0007Ys-Bk
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:34:11 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUexL-0001hL-5L
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:34:11 -0500
Received: by mail-pj1-x1033.google.com with SMTP id u10so7261754pjc.5
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 18:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q5sZk2IQIjptsv3a3XcSVTDNnG9U0oFxOYLINCyR7ko=;
 b=xwJzYDfi8qSAHPy8IfXKGBLidXWxZ9rzcQLWq1j0CEDpTBjugcbn9jdWZorZWRkBPx
 uVP6aqME2MiKdx6ZQ501Th7FkZhcVQZnky+b6sR+R1SdhcD+BJK+QLabYablDPPuP0ik
 Htj0VQ19t1HjYNDvIvYMfr1VfTb3XO+C3JYb8Qvur9jL0U8FXTFFlTlnuL2hRJng1+0t
 yI9tTFU8AjNow2mnXDOtfKwBBDBCZJ83srQqOJ0Tqm78YD2fKAfqMQ3j5n/lvjGDUf6E
 3MUEk0eACJjdcbgE3OsUcW1a8gqKZM6BJ0SmFSEfGklG1mszSOT9VIBtUG6UxgpUxD+M
 CUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q5sZk2IQIjptsv3a3XcSVTDNnG9U0oFxOYLINCyR7ko=;
 b=H82dwe59VgLMtwX+rjmqexad9Cf6r9KDP8IplLJOlMNz8CoyaNTH1x5SwBe+R3dJwM
 ULFhKP0O08eGG7dFvwldyfyJwFY+TWJKK7A0sRM5HmlRcN1OKO8nIdpHtN0UeBDFiRMs
 wH5vrl7xLOWnz9UEmuQ7BuXDN2eMMgkiIttRagjZF20/+ZVDGrR4+/VzddmFF96duoaE
 lJ3l1JHyeU8gwmGToGwItuWxkaMlKleitT4pyNche78uI2l5bn8WX2sk8GuRvYCmUiRD
 XwWAuZsggyNVsF/f3kTiatog5V36ZS+PJTfRqYj3aauRp0subbgd2y/D3Jhs7ZL99ThK
 H5jA==
X-Gm-Message-State: AO0yUKUSDLaa7Z4Vm8jKUv41tIMca8fIDp+dmrao9R/YhETuKk3jXkFC
 i0aFQLGQCU3aQxrciyThCBh2kdCgl9yvTIeTnss=
X-Received: by 2002:a17:902:d50f:b0:19a:a9d8:e480 with SMTP id
 b15-20020a170902d50f00b0019aa9d8e480mr7726350plg.68.1677033243206; 
 Tue, 21 Feb 2023 18:34:03 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a170902e90300b00198fde9178csm10520112pld.197.2023.02.21.18.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 18:34:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 17/25] target/arm: Handle no-execute for Realm and Root
 regimes
Date: Tue, 21 Feb 2023 16:33:28 -1000
Message-Id: <20230222023336.915045-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222023336.915045-1-richard.henderson@linaro.org>
References: <20230222023336.915045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: i5EH6PVx9TnV

While Root and Realm may read and write data from other spaces,
neither may execute from other pa spaces.

This happens for Stage1 EL3, EL2, EL2&0, but stage2 EL1&0.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 52 ++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 46 insertions(+), 6 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 61c1227578..fc4c1ccf54 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -907,7 +907,7 @@ do_fault:
  * @xn:      XN (execute-never) bits
  * @s1_is_el0: true if this is S2 of an S1+2 walk for EL0
  */
-static int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0)
+static int get_S2prot_noexecute(int s2ap)
 {
     int prot = 0;
 
@@ -917,6 +917,12 @@ static int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0)
     if (s2ap & 2) {
         prot |= PAGE_WRITE;
     }
+    return prot;
+}
+
+static int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0)
+{
+    int prot = get_S2prot_noexecute(s2ap);
 
     if (cpu_isar_feature(any_tts2uxn, env_archcpu(env))) {
         switch (xn) {
@@ -982,9 +988,39 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
         }
     }
 
-    if (out_pa == ARMSS_NonSecure && in_pa == ARMSS_Secure &&
-        (env->cp15.scr_el3 & SCR_SIF)) {
-        return prot_rw;
+    if (in_pa != out_pa) {
+        switch (in_pa) {
+        case ARMSS_Root:
+            /*
+             * R_ZWRVD: permission fault for insn fetched from non-Root,
+             * I_WWBFB: SIF has no effect in EL3.
+             */
+            return prot_rw;
+        case ARMSS_Realm:
+            /*
+             * R_PKTDS: permission fault for insn fetched from non-Realm,
+             * for Realm EL2 or EL2&0.  The corresponding fault for EL1&0
+             * happens during any stage2 translation.
+             */
+            switch (mmu_idx) {
+            case ARMMMUIdx_E2:
+            case ARMMMUIdx_E20_0:
+            case ARMMMUIdx_E20_2:
+            case ARMMMUIdx_E20_2_PAN:
+                return prot_rw;
+            default:
+                break;
+            }
+            break;
+        case ARMSS_Secure:
+            if (env->cp15.scr_el3 & SCR_SIF) {
+                return prot_rw;
+            }
+            break;
+        default:
+            /* Input NonSecure must have output NonSecure. */
+            g_assert_not_reached();
+        }
     }
 
     /* TODO have_wxn should be replaced with
@@ -1561,12 +1597,16 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         /*
          * R_GYNXY: For stage2 in Realm security state, bit 55 is NS.
          * The bit remains ignored for other security states.
+         * R_YMCSL: Executing an insn fetched from non-Realm causes
+         * a stage2 permission fault.
          */
         if (out_space == ARMSS_Realm && extract64(attrs, 55, 1)) {
             out_space = ARMSS_NonSecure;
+            result->f.prot = get_S2prot_noexecute(ap);
+        } else {
+            xn = extract64(attrs, 53, 2);
+            result->f.prot = get_S2prot(env, ap, xn, s1_is_el0);
         }
-        xn = extract64(attrs, 53, 2);
-        result->f.prot = get_S2prot(env, ap, xn, s1_is_el0);
     } else {
         int nse, ns = extract32(attrs, 5, 1);
         switch (out_space) {
-- 
2.34.1

