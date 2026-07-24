Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B26C531D0
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Jul 2026 03:08:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wn6Ey-0003k4-F3; Thu, 23 Jul 2026 23:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wn6Ew-0003im-6N
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 23:06:22 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wn6Eu-00084I-IU
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 23:06:21 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-38a0c7e841fso1612626a91.2
 for <qemu-arm@nongnu.org>; Thu, 23 Jul 2026 20:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784862379; x=1785467179; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3WcfI2C0vXZJuLurguA9t32KpNa1EGPqApO8Jkm91qs=;
 b=ILtOwBNFjYntx7mCY7aT5dkYim+lA0eNB6lHGkDwIOPcpnUSoHZmWOeCAUKYyQfVLz
 aqQtihhDHARoT04vGPMbkvqyeKL4V9+q5++PrDo93S4E9eqnn3GaT038s6w4jeduZip3
 Ma7x8TwNTb+PRLtmjQeF18ns4emJcgaDF/qkCZMp6pnFfq2GHcHy3JsN++2pLe8+KhhT
 WOo6TLXPK5JzuWPsWTklKyfzwTFzA1fjiqnokCN1kjmXKeI2r4M8YfV6ZSC9ZoEHEWvm
 y2n1IZuMkllfk3stm2y28+G33YLbCiy7i3NN3HCiNORwurwjNY11yn7VKln6mV1IZ5iB
 W2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784862379; x=1785467179;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=3WcfI2C0vXZJuLurguA9t32KpNa1EGPqApO8Jkm91qs=;
 b=ktRAgAYvfCRf5lDTkgIiyZYqQH69ewfJUMJaS4cIu9Gl+YC5SzAVyMFSUqJ4f4Jh38
 tFdqHGi0OUuv/vSWtFGKm4XxTl03Z8U+IHCg64BOeiMf/NZR5hh9oVEhfutWf7gk2dRr
 G0r+PZoSuxHPSxizhYcaWyIJROLV0AGQ39m3pJcSVcdoN8V7dsyW1m022nWkzUSlExvU
 0ZsXHr+HNNNlMf/1lTmLI9m6bBTZDF/l80Q7FjmeeoRsaIHxSd+FBMj6SeuYNBVFsiUj
 J27ED62oDj7ihMyjKGA1u3rGHiwj2BQ0le/TFgQ12az2Fmo01Et1zbKxXSUG4DKp5gk5
 4R2g==
X-Gm-Message-State: AOJu0YxWPsbSFAH6vtk7FYAjzmDoqRdrVGtrNMJvMOQUbpvtXQjpZ8XY
 siwgQuql6eegWnJiBbpUIGxHj2utlQibQekrH1m6OSGqNTFIn6Opi3YQhISBtyKgG8C/zHhxgbT
 FKrzB
X-Gm-Gg: AR+sD13KFkzP/29DL7vImn/HHPQARia3Yrsjyp/QhDdqrPz0xeuSqHHSSPCvrmlHj4l
 XV9pAcy2MY06Bt+EQzEwet5H8kWNmyf7JHgC0Fcb7zhehw85sBS4CNTo1dCmGofCbVVuWkts2Gk
 fnU0UUVXQP4zp/Pdepy6jHF5DQJJMeo6hZ2X0kItUuH6BiaoZhg8qzV6WEoJAjvab7OZPWBQTdp
 ogUGb+r2cPOHTz7jaRISRc7ZjkUQo3qujF+5iPWIsDE4u+l6xGiroS3KozI+wkjn3WLmTRVLAIu
 C1zXaXgVa5WZP7++83jd3yeIRtpTb5kn7Rn9/ZkzOeEuZJg5IvBKUN//TPNhv5UJtv4InCKzNfM
 CSpKaL1tJlzFjMgOvc+1Xu4ewWjmV3Xhn13ZODPX77JwE4s7Yz2Lb7/7pWtNlhG5u6ZoAKfg8tg
 XQEYtBt+pNxlACtTlVVJ0XlgZt1wzkzgdntA==
X-Received: by 2002:a17:90b:3cc4:b0:381:e74f:8a6a with SMTP id
 98e67ed59e1d1-38ec65793a6mr5539371a91.16.1784862379178; 
 Thu, 23 Jul 2026 20:06:19 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38f03ad0e0csm750777a91.7.2026.07.23.20.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2026 20:06:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 2/6] target/arm: Add FGWTE3_EL3 bit definitions
Date: Thu, 23 Jul 2026 20:06:12 -0700
Message-ID: <20260724030616.76180-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724030616.76180-1-richard.henderson@linaro.org>
References: <20260724030616.76180-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 34592679e4..2c9927b1d9 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -689,6 +689,30 @@ FIELD(HDFGWTR_EL2, NBRBCTL, 60, 1)
 FIELD(HDFGWTR_EL2, NBRBDATA, 61, 1)
 FIELD(HDFGWTR_EL2, NPMSNEVFR_EL1, 62, 1)
 
+FIELD(FGWTE3_EL3, ACTLR_EL3, 0, 1)
+FIELD(FGWTE3_EL3, AFSR0_EL3, 1, 1)
+FIELD(FGWTE3_EL3, AFSR1_EL3, 2, 1)
+FIELD(FGWTE3_EL3, AMAIR_EL3, 3, 1)
+FIELD(FGWTE3_EL3, AMAIR2_EL3, 4, 1)
+FIELD(FGWTE3_EL3, GCSCR_EL3, 5, 1)
+FIELD(FGWTE3_EL3, GCSPR_EL3, 6, 1)
+FIELD(FGWTE3_EL3, GPCCR_EL3, 7, 1)
+FIELD(FGWTE3_EL3, GPTBR_EL3, 8, 1)
+FIELD(FGWTE3_EL3, MAIR_EL3, 9, 1)
+FIELD(FGWTE3_EL3, MAIR2_EL3, 10, 1)
+FIELD(FGWTE3_EL3, MDCR_EL3, 11, 1)
+FIELD(FGWTE3_EL3, MECID_RL_A_EL3, 12, 1)
+FIELD(FGWTE3_EL3, MPAM3_EL3, 13, 1)
+FIELD(FGWTE3_EL3, PIR_EL3, 14, 1)
+FIELD(FGWTE3_EL3, SCTLR_EL3, 15, 1)
+FIELD(FGWTE3_EL3, SCTLR2_EL3, 16, 1)
+FIELD(FGWTE3_EL3, SPMROOTCR_EL3, 17, 1)
+FIELD(FGWTE3_EL3, TCR_EL3, 18, 1)
+FIELD(FGWTE3_EL3, TPIDR_EL3, 19, 1)
+FIELD(FGWTE3_EL3, TTBR0_EL3, 20, 1)
+FIELD(FGWTE3_EL3, VBAR_EL3, 21, 1)
+FIELD(FGWTE3_EL3, GPCBW_EL3, 22, 1)
+
 FIELD(FGT, NXS, 13, 1) /* Honour HCR_EL2.FGTnXS to suppress FGT */
 /* Which fine-grained trap bit register to check, if any */
 FIELD(FGT, TYPE, 10, 3)
-- 
2.43.0


