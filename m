Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp7196775eje;
        Wed, 19 Jul 2023 08:57:49 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHUtmbUg0UNEGXHoUDgojP3SdvIiKT2MFpSMEJcYkxSIsc4LVnmCvHJfTobWEUPxr2EP+Le
X-Received: by 2002:a05:620a:1917:b0:767:a33:a9e6 with SMTP id bj23-20020a05620a191700b007670a33a9e6mr21376016qkb.52.1689782269289;
        Wed, 19 Jul 2023 08:57:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689782269; cv=none;
        d=google.com; s=arc-20160816;
        b=uNFyURwx1D3nB1Utk91MLdyexfDnxBiui1ZWeXasBtf7Ub2QeVDHghwd1htMO8pFAa
         Xv0ck46PyYiWpIaTQueVT3RSeaCvkvUhWzZ6KxEVTttNjmsXhA4Lp0NYbmO9IxiD5lTX
         m3HW61NqyrLZ1JrJgNbsgKf1CRpWkEQnSKAGsMWe33tD2fdanAG1HS2kYrxeIOmUrAmJ
         MGgUdnL0aKNm8gTQyCZq4607uU5+jMsMEhU8FCd733X6JydGDonyKOI6AG/Z50E5hhYh
         nt4snCMqUaHwTkRZsc0hk+bLijlTfLjI+G1OoY2SbRebcxU0Z6humleupDdJKgOu4BwT
         wmkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YiCD4uNJS7qGPlDJ8wSaAHyyMfjOlkg6Lkn5GrdcJ70=;
        fh=zMLmPP9ozJY0jj0bAXqZquWHP0BgmjJZ9lKiHhJNaWU=;
        b=UUPee+y60GwKIlsGUIuJjwCVV6ewLOhGQodNn78oUkk7LL7RPnkrfu51h81IArxQj1
         3G0fqEYErE1S+/bgdRIxEVgXMOHMAWRK/QFnqwTVIxeEptLWIyZD259CmVXIQUKwZRgx
         TTug4plNFcsKYguxh54/uLJxidSUQxJJbkTweQC+UwJO+ueNkUDKaSzT9eQdDzlKvSQ8
         idYsHAd4gerfnxxsioz+rgj9gVz/ZhRi4wG8EbIvS7YmMfXt52X/1TNznIuHcc13gi+f
         RZuLoMaCV9uus2whfkPLUV5/kSCvi99K9I8qvWbG+XZMWmbu5gSOwZRJ/6jbDtI8BwpF
         MLpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gD7+eh4J;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k27-20020a05620a143b00b00767d653b768si2692077qkj.607.2023.07.19.08.57.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jul 2023 08:57:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gD7+eh4J;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qM9Xz-00039G-Cz; Wed, 19 Jul 2023 11:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qM9Xq-00036Y-Mv
 for qemu-devel@nongnu.org; Wed, 19 Jul 2023 11:56:54 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qM9Xl-0007J3-88
 for qemu-devel@nongnu.org; Wed, 19 Jul 2023 11:56:54 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fc02a92dcfso66272925e9.0
 for <qemu-devel@nongnu.org>; Wed, 19 Jul 2023 08:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689782207; x=1690387007;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YiCD4uNJS7qGPlDJ8wSaAHyyMfjOlkg6Lkn5GrdcJ70=;
 b=gD7+eh4JUBLFGbkWg0JGhNFJGne2eSesOD32ofB/SgHT228XT/DDSlJeYxkGel6y1M
 tAAZr/Da9d2lJQcAPcGGMy22lDog02M3UGozKmhtsLlGAtz42DkZ4og5MR9UceR31mq0
 4C6KTOhup24ybK510uYks7WMM2mvU+gb8Yw3l+n7+OcQoFvny0ufU+KLwCgCkZY76ZGq
 gIL4Ql6d/RYY9z6SZX/P4omHQ0nSITfAwh4vC+5qMqEM6cZnvtF5oCpN9ZEr8Ud4EidH
 113lAMwBGVoMiJqiT+pBJTRcXX1OfYPqIMHwunF+t80DM1kimGAZY5xbIZ7ApSZmPTEF
 QXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689782207; x=1690387007;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YiCD4uNJS7qGPlDJ8wSaAHyyMfjOlkg6Lkn5GrdcJ70=;
 b=klKD1cLgv+w3Dl8BovXI3yTp4rho50bhvFqA9F4PRZ/+VhGZamKyMxqpwuiMNp8s+0
 x6RnI06Ut+xyIXLPmgsSwp2xbeIKQKZ1zYuPfK2RkKrzGXcrZ9gyVNi9kN3KCkFG7HKl
 7FkGzCCevbDZ6N4NY94uXC7OeOJfsEvDyQM2x7HJ+NJsnYb35oHrRR1RkwmKH4Odutxm
 w3BKJPlBqAan1JmPWGJE7GJagePlLQLc6LEXeplzC1Z3fOutUKCpTINa/6B5EZ19aCr4
 +hZuv7EtwEcjGZ6Ap510mMeUOKu6QtM0bzW2ny2sVPPqQEysgT1o30+lKx+5Iy72D92N
 ll9A==
X-Gm-Message-State: ABy/qLbI9qy4f0pT1xIgy+RORqvInmaVEyIJq0rh7QPZgWAA9U/ihCNI
 8BAi5dRNp24N5mJyYRR/m2Ztyg==
X-Received: by 2002:a05:600c:2902:b0:3f9:82f:bad1 with SMTP id
 i2-20020a05600c290200b003f9082fbad1mr4605336wmd.40.1689782207552; 
 Wed, 19 Jul 2023 08:56:47 -0700 (PDT)
Received: from localhost.localdomain ([2.219.138.198])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a1c790e000000b003fc3b03caa4sm2351006wme.0.2023.07.19.08.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 08:56:47 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 5/5] target/arm/helper: Implement CNTHCTL_EL2.CNT[VP]MASK
Date: Wed, 19 Jul 2023 16:30:19 +0100
Message-ID: <20230719153018.1456180-7-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230719153018.1456180-2-jean-philippe@linaro.org>
References: <20230719153018.1456180-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: zrQ0hFrz1tau

When FEAT_RME is implemented, these bits override the value of
CNT[VP]_CTL_EL0.IMASK in Realm and Root state.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 target/arm/helper.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2017b11795..5b173a827f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2608,6 +2608,23 @@ static uint64_t gt_get_countervalue(CPUARMState *env)
     return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) / gt_cntfrq_period_ns(cpu);
 }
 
+static bool gt_is_masked(CPUARMState *env, int timeridx)
+{
+    ARMSecuritySpace ss = arm_security_space(env);
+
+    /*
+     * If bits CNTHCTL_EL2.CNT[VP]MASK are set, they override
+     * CNT[VP]_CTL_EL0.IMASK. They are RES0 in Secure and NonSecure state.
+     */
+    if ((ss == ARMSS_Root || ss == ARMSS_Realm) &&
+        ((timeridx == GTIMER_VIRT && extract64(env->cp15.cnthctl_el2, 18, 1)) ||
+         (timeridx == GTIMER_PHYS && extract64(env->cp15.cnthctl_el2, 19, 1)))) {
+        return true;
+    }
+
+    return env->cp15.c14_timer[timeridx].ctl & 2;
+}
+
 static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
 {
     ARMGenericTimer *gt = &cpu->env.cp15.c14_timer[timeridx];
@@ -2627,7 +2644,7 @@ static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
 
         gt->ctl = deposit32(gt->ctl, 2, 1, istatus);
 
-        irqstate = (istatus && !(gt->ctl & 2));
+        irqstate = (istatus && !gt_is_masked(&cpu->env, timeridx));
         qemu_set_irq(cpu->gt_timer_outputs[timeridx], irqstate);
 
         if (istatus) {
@@ -2759,7 +2776,7 @@ static void gt_ctl_write(CPUARMState *env, const ARMCPRegInfo *ri,
          * IMASK toggled: don't need to recalculate,
          * just set the interrupt line based on ISTATUS
          */
-        int irqstate = (oldval & 4) && !(value & 2);
+        int irqstate = (oldval & 4) && !gt_is_masked(env, timeridx);
 
         trace_arm_gt_imask_toggle(timeridx, irqstate);
         qemu_set_irq(cpu->gt_timer_outputs[timeridx], irqstate);
-- 
2.41.0

