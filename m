Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47E8CD98ED
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Jun 2026 16:34:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1waFgB-0006hH-UX; Thu, 18 Jun 2026 12:33:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1waFg3-0006cu-Rg
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 12:33:15 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1waFg1-0006L0-FR
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 12:33:15 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-4633193af19so929140f8f.2
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2026 09:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781800392; x=1782405192; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4hX01wxKGw3BuQr74QeKdveuBzAtu1koRwZnMOTRaN4=;
 b=an3QwisRzIbc1VaBEx51sXKZ9JLQZF02z04heHTaRzdh93XAvLV08+Rn8WQgc0l863
 aHQ9SJXYNOhdDPX9geO9DziO2hyZz2StSwyP8XexQolMT03UZaW+KLNOaFAeXsKybBsH
 FxhLcl5Ykr0S+cX1c84FUj/b6+SNdEZsCMZ+PS4hcfn6xSzLmH/HQOQ3LMX9dT2ASxnM
 E0fZE62GUy8ynd//FTzLmikVEan9g2zdzmKdDlG74/p8stGyOJvMiwAjFRk/nSGrVdus
 3FKddB6/G2R4jpMocXgl9g5FMBhw5u7FFz4PZvqQhdXoEds8elH8eQI5xpIv/2hZCY6e
 OJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781800392; x=1782405192;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4hX01wxKGw3BuQr74QeKdveuBzAtu1koRwZnMOTRaN4=;
 b=kNL3rwk11AZGhc/hEgeUdmmWFwFFgqrnz5p2pWE1ZDKlZyU9rTEuKMul8LRtcL/Rxl
 zKGOfjncyXUSiSwgLiOWYVuf8Ib+LG72uGj/1B3OLLtBdDnBoBfGpK3eolOCwk3iu7A+
 r8DNn8R7gheNRp2DAv3ZF9WFHiqMykNChYxzN/OI1Gr3M4dHp/ywxIndHA1xmsemqV9W
 +RFDjubIVdKZ/0PK3K6bpTUfjQvPVDRsG+yWZXNcaR3csNWQqrVgVh7x7YCiP0ZbTN/B
 QwmrQPCPk9EymLeO7QqgYkdaVl86dXzBkGYI6VDdAWfgrkC6g0xRbTY+pEivEnhthdW4
 Cb/g==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Zg6QrZbhXlV4aziAI7JiyQcZE27j2NtbVV7mqlIYnEr2sVzpRpVRpEbnyCyAa8e+Oa70atEiJpQ==@nongnu.org
X-Gm-Message-State: AOJu0YzUL/MumzW2xzMh0nmhK8QbhpvfnIHyB/M5TPDANnFuxQHeL8J8
 Vj3QmncLn+n+iBNsCERyOwsPF5eau71XQs7VDV6eL8DrVffBrOvdQNtWX5xArhIcmss=
X-Gm-Gg: AfdE7cm62UlEM0CIfpOVXmjFps1haz4Sq0VIEl1+rxDcnAfdrhAPu8DK47bGnwonOtQ
 L13XlJcev0g+BNl1+gO9/uqzOnTopYLphVo8YzMkOGpI37vwdraI/wtTjtkeZnm+7guak9iRnNt
 nbYMyVYKthythkLPppiKOK8htkiujb3HXNLmpLcPHFOS4+Ilq4HtdZdIA/vfYyc3b9iX7L7s+v3
 JA6sWY6usplQcYjTU8/7suStvUceYQTyj0XSxFqIZ9SCeOpMi9q3e+0mgcFO78yffd/sf4/lN0g
 NIRmbXHuHLwMKTBB/dkHhkHBI1WhgEpkDAxZFcQa4ck/qWljX4dPwK8UVCh4gsykqui5h5gIYvJ
 9xeawWDDas8O7/m5IwyApqJwTJttrYzythGSNz4XQsJe7eViNYuYqiw9GPp/DKUY2Ttzeoin/jY
 EzBRSyrDDF6xA+jQ==
X-Received: by 2002:a05:6000:1865:b0:461:9fc7:7d01 with SMTP id
 ffacd0b85a97d-46501685f0emr358890f8f.23.1781800391974; 
 Thu, 18 Jun 2026 09:33:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a10:d582:31e:0:b52:6a9:569d:e33e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4650bc426e1sm26942f8f.29.2026.06.18.09.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2026 09:33:11 -0700 (PDT)
From: Jim MacArthur <jim.macarthur@linaro.org>
Date: Thu, 18 Jun 2026 17:33:04 +0100
Subject: [PATCH v3 1/6] target/arm/tcg/cpu64.c: Extra test for GPC3.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-jmac-gpc3b-v3-1-353e546067e7@linaro.org>
References: <20260618-jmac-gpc3b-v3-0-353e546067e7@linaro.org>
In-Reply-To: <20260618-jmac-gpc3b-v3-0-353e546067e7@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Jim MacArthur <jim.macarthur@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
---
 target/arm/cpu-features.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 9e70d30964..26099f4c83 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1159,6 +1159,11 @@ static inline bool isar_feature_aa64_rme_gpc2(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64PFR0, RME) >= 2;
 }
 
+static inline bool isar_feature_aa64_rme_gpc3(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64PFR0, RME) >= 3;
+}
+
 static inline bool isar_feature_aa64_dit(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64PFR0, DIT) != 0;

-- 
2.43.0


