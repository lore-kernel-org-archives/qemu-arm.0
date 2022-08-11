Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp652232ejf;
        Thu, 11 Aug 2022 10:18:56 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4NxydlfZKaibrzI/AUzgOiE8k6uJwboMDZPCTwB1uJd4CAWx5yG1MniN3Wr6OuAS7H+vYX
X-Received: by 2002:a0c:df0c:0:b0:479:5f05:dd26 with SMTP id g12-20020a0cdf0c000000b004795f05dd26mr23918qvl.41.1660238335973;
        Thu, 11 Aug 2022 10:18:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660238335; cv=none;
        d=google.com; s=arc-20160816;
        b=N26ML8Fv+taBfox7q07AKhBT4LrLN+3BYRhL4Ahm0ost1FEhRTV0SVR4X/WMCHt9Sx
         PkBmiXbvm84fdV7zBl9b/qfIL6LXH4PzIT/wcj6b1hVDTDyFGyuSa5GJKN14U+Hp8X/K
         wkHiNQTVpaUSq3Ky50b3ZVlC35ewEMyvO2FuTRnaIUInOM7d0dCU3vtSGBz9QTy5YjZi
         L4dIcoKPokaogKIsZJNHhHFdhModAPpsxj1EkUyKdwU0nyluNBGNjzlgLpHqrcl1JV1w
         YzCAN7kkJroilEHRwNPu1Lpetrbfs/B8PNLtBWJREZQ4ufeMizF2VOfmsQ2QGssRDBvQ
         4QBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=nkPgesIJ7tHWPAYMw0IGC2hbyuZcRqrKpcJIVrclGtI=;
        b=CejCJZSQIuPMBBM7nJ9EDenceeJgTdsxxruFgruwCqtTMOCUOnr0w2YP5qEEBYgZkq
         YZW8lAtjRYNvajwZPh2wBIwccHeUs7f9yTUT+zXusqfCmXkr7BKlIOCQtBxrxBGoSAEw
         6hckwgE37hgV9Pwzbd/1Z/t0YrniAx3ncAxCJGw9VEjZVGHvzC92QcuvILh3xmJpKj7M
         +i5t82aEHoUY/OxwIe0M3n8TefrKERiE9o9YGlShL4FNNdIGSZNOyng3XO+6+BQK9BBe
         jExKDS9RPeLTy1osTYiqZVQV0gShdU5/x6YhNfFmMBA8cndqxgwZI7U0vSXPtWvOLywv
         2hUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qp1YDNqm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r16-20020ac85210000000b003435c985624si23326qtn.250.2022.08.11.10.18.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Aug 2022 10:18:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qp1YDNqm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oMBpf-000185-84
	for alex.bennee@linaro.org; Thu, 11 Aug 2022 13:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBnJ-0006qC-JL
 for qemu-arm@nongnu.org; Thu, 11 Aug 2022 13:16:29 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBnG-0000u7-1B
 for qemu-arm@nongnu.org; Thu, 11 Aug 2022 13:16:28 -0400
Received: by mail-wr1-x435.google.com with SMTP id l22so22056013wrz.7
 for <qemu-arm@nongnu.org>; Thu, 11 Aug 2022 10:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=nkPgesIJ7tHWPAYMw0IGC2hbyuZcRqrKpcJIVrclGtI=;
 b=Qp1YDNqmw/vQSXL7KvulLGtEMi7O/ciUVbm5gTwIjEE4yH0ugw/VyyHh42KNGA6l1m
 AVUP7bp7mjSVDL8LdvwPdQRDuEsRNRzr2KcDddEZeKos6V49xbXBPKIwh76dfmcsd89H
 KUKy0vkmUuycTOfLiS7+pYC0Hoi73O9R6dW/Go5nA87Npq0wAAejYyezes3iTaLr8vhj
 a1/HeYXc+frzZMDJg7IGlgOcIniqh17IKSPSKILixDt68TKD5NspZlrcjnS2kY9HTdnj
 A7cBVmu1pC5S1prNTcQy4gxElXGMhKR2fU/rwfqf5YOdlhlf708cIUWtGrnHypIGUWnk
 uDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=nkPgesIJ7tHWPAYMw0IGC2hbyuZcRqrKpcJIVrclGtI=;
 b=LcTok9RZ2UGVs4LxmGZcIMQ0i5gJPViTQK7CASQm7pXlBaaWxL/OaM90z9yyU59stm
 G95dDGwv2fiXWinp69PTwxAIni9jSgAg2J9VYGpus9p+ntvqlc7W+fMm8cmVkT3A9hS/
 RxWgNttpcynOeI+GyI7e+kCguH4OH9NDbKDPShN7iaELiOASSNENv6MSYvStyLMPNu2p
 33keVzUA7p0DFPmqR3Uk0fhoIWYRlDs/ecCB5cXa3yhgEi53tNgvwf2HGOfCO59bD7/E
 xUrqhbVhGyuG+Z10S3JioSF73ZpHXstseGb6GS8Y8wxb9bYrztFzMSHFRjCB1LmGE7HZ
 QQ4Q==
X-Gm-Message-State: ACgBeo2Shzznr2bk2ZU2xfNALqDSnbiH0KMVr5BPuF205cY7pm8OJJK4
 hAaSoQk9lgEuQSPvUkpaZpm7v7/czFUE6w==
X-Received: by 2002:a5d:4907:0:b0:21f:bc42:989 with SMTP id
 x7-20020a5d4907000000b0021fbc420989mr7445wrq.375.1660238184570; 
 Thu, 11 Aug 2022 10:16:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a05600c4e0100b003a2f6367049sm6633918wmq.48.2022.08.11.10.16.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 10:16:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 04/10] target/arm: Ignore PMCR.D when PMCR.LC is set
Date: Thu, 11 Aug 2022 18:16:13 +0100
Message-Id: <20220811171619.1154755-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220811171619.1154755-1-peter.maydell@linaro.org>
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
X-TUID: u+ATt7AA0KHE

The architecture requires that if PMCR.LC is set (for a 64-bit cycle
counter) then PMCR.D (which enables the clock divider so the counter
ticks every 64 cycles rather than every cycle) should be ignored.  We
were always honouring PMCR.D; fix the bug so we correctly ignore it
in this situation.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7a367371921..41def52cf7b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1172,6 +1172,17 @@ static void pmu_update_irq(CPUARMState *env)
             (env->cp15.c9_pminten & env->cp15.c9_pmovsr));
 }
 
+static bool pmccntr_clockdiv_enabled(CPUARMState *env)
+{
+    /*
+     * Return true if the clock divider is enabled and the cycle counter
+     * is supposed to tick only once every 64 clock cycles. This is
+     * controlled by PMCR.D, but if PMCR.LC is set to enable the long
+     * (64-bit) cycle counter PMCR.D has no effect.
+     */
+    return (env->cp15.c9_pmcr & (PMCRD | PMCRLC)) == PMCRD;
+}
+
 /*
  * Ensure c15_ccnt is the guest-visible count so that operations such as
  * enabling/disabling the counter or filtering, modifying the count itself,
@@ -1184,8 +1195,7 @@ static void pmccntr_op_start(CPUARMState *env)
 
     if (pmu_counter_enabled(env, 31)) {
         uint64_t eff_cycles = cycles;
-        if (env->cp15.c9_pmcr & PMCRD) {
-            /* Increment once every 64 processor clock cycles */
+        if (pmccntr_clockdiv_enabled(env)) {
             eff_cycles /= 64;
         }
 
@@ -1228,8 +1238,7 @@ static void pmccntr_op_finish(CPUARMState *env)
 #endif
 
         uint64_t prev_cycles = env->cp15.c15_ccnt_delta;
-        if (env->cp15.c9_pmcr & PMCRD) {
-            /* Increment once every 64 processor clock cycles */
+        if (pmccntr_clockdiv_enabled(env)) {
             prev_cycles /= 64;
         }
         env->cp15.c15_ccnt_delta = prev_cycles - env->cp15.c15_ccnt;
-- 
2.25.1

