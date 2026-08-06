Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD79CC5AC7C
	for <qemu-arm@archiver.kernel.org>; Thu,  6 Aug 2026 17:27:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ws1sF-0001Ul-To; Thu, 06 Aug 2026 13:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ws1sC-0001Tw-Fu
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 13:27:16 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ws1sB-0000cf-0C
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 13:27:16 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-848743155bcso1273872b3a.0
 for <qemu-arm@nongnu.org>; Thu, 06 Aug 2026 10:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786037234; x=1786642034; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Z6ub//obFB4vLVAkp2vNNEIQLfeC5Ua8cnJJmMnxkLg=;
 b=j0hYh1HkfjT2fBX0vgmwzInWMrzLC52YAczfdwIZ2pzhrbjiatCEVFCAmYTGsiRr5i
 LLIqzELcb0ORJ0fcjKqOqM6blhB3O5UrTu7H6Ip8Tca9RRv/SDRT8QL4pfZdB3cL3b+k
 +l+jc32f5VRpf6/Cx+uUzxrBSehXrF1CIyJi+d9vGB+Zxs7Jg6LCMubKR3/FX0Q3/xYt
 3m8lilqwTMHg6B9UofjAFxLJkDv0pm5ktyuda6ziUb2xJhkIvTwDlv+u8Qi01P4n82PC
 6h4NYgTj4xcwQsMa6Qm89v3KZKnIhrM+x7q4vwowDBVk/mQOCVkWTSCUnEAwFHQnytx6
 2Cog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786037234; x=1786642034;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Z6ub//obFB4vLVAkp2vNNEIQLfeC5Ua8cnJJmMnxkLg=;
 b=UqRI5wRCpznOM0MWgD4Vl/BWVAGsTC9yU/opnEOFmk3rvxuKCPb0Jxkbx80A3iACCD
 IaP/wB0hlJTWkdgPXz8pcVYExnIbMq4imE+HMwKbR2DSzyTlUjR9lIY1+EqnGObRQhYS
 cnqJSVkP0RSeP4xNyv7krNhSLj5/GUCCdIvWn6Gewg7w4qOY1OmcdS0jMhGochFefhop
 +aXJsS7WsEMe0xjmDjZ4qgDJ5i7l85RrHChvFDuzof8SmCekt8uCXF6vFaVjJodCx7v+
 YYdip/xkqB9548CUknvN0XMqLoeHSOkbiK+xsOu7vNqnlzya5F1t2GODkZ2tXHjQF/8N
 QkBQ==
X-Gm-Message-State: AOJu0YzJHc1xxIE0W8iQuAc2EbR8dLmTrr9RVxHzvoUMvNxVVtnqI4Wc
 qt1NGV4sgDNQ/r4pIorcpg6giWXD45ZOoJwKB3USZZXXoCOdeMdwbOrxX4dgaeK+UI8=
X-Gm-Gg: AR+sD11e0rPKH3/wU5hwcTfS/6Wva6mNglWCON4KES+Trz/Bd3QfMD7hGKmpP2T8fK5
 rvatYqOiqwDqu0qIkqiY1DqgQmkGtRhR5EZd7dqx1bMLq+qZ3IX5HxyL3JO2Tew78RS5vuR10OP
 MlBtsyrXCoitvPVLETCV/rLi7LSjVQcC0MpUGtfRwHHTPIcolccTGFFO0d/D3mqC7Y1MNeD9fxC
 8uGzbCM9uZX91c0Z+RVrgPu72zsf8JEKsbz/9IV74i5Ryfh6fUN+BlOzO1ixjMORxb5Wv8vAUqw
 cPUIo6H/8624nWoDO8qrCbuSdFEKDf4BsOnh9gEmtJHp71fL3/obDJhwisSlP6tPrsZutyzuNQO
 NjeSmw89YcB+EOJ+MlK1E8m4kzsnUViwinkKx2sECj81TJ0iuPnfkXN/ZRfLrolVgfFj+fmldqo
 bAzsyrs50AoQGckChKuQpXpLD9VarbbOLREzSsQtCXNHTmarOum70tPbWAF5XuJeBd1fTMa64n/
 iAKmhE/A9vDOUP3+pKyakkCRaNmfqls
X-Received: by 2002:a05:6a00:b8d:b0:848:2c5e:305e with SMTP id
 d2e1a72fcca58-84f4fd9f762mr3542187b3a.6.1786037233617; 
 Thu, 06 Aug 2026 10:27:13 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84f45389e68sm1803272b3a.4.2026.08.06.10.27.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2026 10:27:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 2/6] target/arm: Add FGWTE3_EL3 bit definitions
Date: Thu,  6 Aug 2026 10:27:05 -0700
Message-ID: <20260806172709.333300-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806172709.333300-1-richard.henderson@linaro.org>
References: <20260806172709.333300-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


