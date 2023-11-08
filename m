Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp1043891ejv;
        Wed, 8 Nov 2023 06:53:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/EG9QSEGFGI/XcXuLlzRCzWWKc98iZ79J9rlgF02gbcDpMTLun6p8xFPIjUow+AbnBuwW
X-Received: by 2002:a05:600c:3513:b0:405:82c0:d9f3 with SMTP id h19-20020a05600c351300b0040582c0d9f3mr1957280wmq.30.1699455215629;
        Wed, 08 Nov 2023 06:53:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699455215; cv=none;
        d=google.com; s=arc-20160816;
        b=Qiu9jNxJxEyU5aDpN7oAOQFj95us00edAhkYq18NKlbf2h3n0zcN0/jWI9fMu4B5xd
         /YxYH0O0e+aNnVguGlPqpgD5cL4f15UtKR+Nn5mSyjAjIEVDgXpUPBEUat8o149Nf//z
         MgeHhsvUU/1u5g9vvzgmOPeymrmSeC6IDJjeddBO5SMU1POC7QHchUy3ml4t3OHwuM1/
         6s06WFjX2uI5Z806cLm7WNtlZIsM1f2g6wNHaFXBoanvhbLD2Tw5Tvj9iH9x/q+MfUTB
         TlxVwWhWXzowPnVKejRSaYEvzmmooGnq96QVgI0VREHjaPym8iNwjr6iBJckPwxII7/i
         9Akw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NVFDT+R54Bka3Z7J05tSdo0rO45X1nMnKArEtpE1spQ=;
        fh=OVkFVJuMUg9q4Kx7dkC+KxU7Oz3EsIEY+aUQ9DXP/MI=;
        b=MVMKtYlOC1Y5tHSucXZQ/rr3Pd3leES/1JGoDuZYmzM8BeYah9nZYnTJb4zj7gdYtU
         T4gs45HB5xGWXVz7loQUr+D+OBg932G9jnQ8Shtj/+mIFz4hOmTprClDAzWLO5Y5R7e4
         Txp6dCCxnrwYtbHl2HSxTZ58HwBjO+JyUXUQqYL+Ad7+Nu6UOb5SqgcY1+aVmY/9FVE3
         6+3tlBjJlUdPbUGRiPh7dz4DJFJTz8D0wLHFjZWx/OZaY3zaJ/Eu2PTVV5Zi2qr7y4/p
         4sQ7vuwL41GwdBC1JTVEUhjs0vRshHgCN5ziNCsi/CUli/Q+7+fQ/84hsh/twyEaKHku
         lOUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QeK9is+Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r23-20020a05600c321700b0040501c11b72si10082917wmp.113.2023.11.08.06.53.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Nov 2023 06:53:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QeK9is+Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r0jvM-0001Sg-Ku; Wed, 08 Nov 2023 09:52:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0jvK-0001SK-ND
 for qemu-arm@nongnu.org; Wed, 08 Nov 2023 09:52:54 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0jvJ-0002FU-3L
 for qemu-arm@nongnu.org; Wed, 08 Nov 2023 09:52:54 -0500
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-99bdeae1d0aso1100593966b.1
 for <qemu-arm@nongnu.org>; Wed, 08 Nov 2023 06:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699455172; x=1700059972; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NVFDT+R54Bka3Z7J05tSdo0rO45X1nMnKArEtpE1spQ=;
 b=QeK9is+Zc7cAbTsHAnGrdr9wOp1AtUbUenY3Js1Qg4nbzxxScPAaRm729pYhDrQjt0
 Cq1OD48tizbalsmHeT/Urx1A8hNpHliGzEZwFNtqVAjXO8eRtWvAd06IozEZE1jMvy2M
 QlKTQa1+rA0/LTJYCVKVAptxlm/rCf0S/7R649kegvsd398txZCaVpT8dLPCYkRJCjA8
 bweXTsQSS4AS6p7WKmllNunG4Z4PcRXQeS8g8p0drejTob3IfAY7eEzSVMR7fKfpHYeT
 5PX8nyj0rO3H3sgTq6sIVM/qQP8fvJ3LP4yz5XLb8u8pUBVnsB6XIhcJgDRcgF4TEJo0
 QMgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699455172; x=1700059972;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NVFDT+R54Bka3Z7J05tSdo0rO45X1nMnKArEtpE1spQ=;
 b=CIh20btuRPmfeLBn19/WzXRT0z616Mruy5oM/K/NyMysXSWkMHFM6dSNmGru/416rr
 2tB10x3LzE46j2AxLVO4hAg/u37YSg3jK4HSLAkm77o+8zIDcIzoTQMpdYhTfX7pduPC
 d0NLdBbVeRVuQVOjt/j0k9+xiSp+U4+bS+0RHetERjkcyDNfq1JyT+JXFAO5YlpthQom
 a/BvLaRHWcAB4eECmWhcQd4Uwa9AJLoO1kXdRq+5fZ3rtUvJA/awaV3UlpTFRWSMda5b
 RZ3GFvCty06BAdQ/Oi+Ra2ctVsjTNzzCvvFqu6FPJdrj2YH4ItTSU9q8esZkkaX6X5Pv
 htOQ==
X-Gm-Message-State: AOJu0YzmfLEM51aoavY3WmRi8dGWyWKG0kGXvDYZRPLbEDyfma/jc/Rv
 keX5h/66SrDCfIIi0SjRb3cMcQC6IVk72nUV+Ek=
X-Received: by 2002:a17:907:e88:b0:9ae:588e:142 with SMTP id
 ho8-20020a1709070e8800b009ae588e0142mr1794162ejc.67.1699455171905; 
 Wed, 08 Nov 2023 06:52:51 -0800 (PST)
Received: from m1x-phil.lan ([176.187.199.60])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a1709064f0f00b0099bcf9c2ec6sm1163516eju.75.2023.11.08.06.52.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 08 Nov 2023 06:52:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 11/35 2/2] tcg/arm: Support TCG_COND_TST{EQ,NE}
Date: Wed,  8 Nov 2023 15:52:43 +0100
Message-ID: <20231108145244.72421-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231028194522.245170-12-richard.henderson@linaro.org>
References: <20231028194522.245170-12-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62a.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wJY/vk+ufhCj

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20231028194522.245170-12-richard.henderson@linaro.org>
[PMD: Split from bigger patch, part 2/2]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 66d71af8bf..0fc7273b16 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1194,7 +1194,27 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
 static TCGCond tcg_out_cmp(TCGContext *s, TCGCond cond, TCGReg a,
                            TCGArg b, int b_const)
 {
-    tcg_out_dat_rIN(s, COND_AL, ARITH_CMP, ARITH_CMN, 0, a, b, b_const);
+    if (!is_tst_cond(cond)) {
+        tcg_out_dat_rIN(s, COND_AL, ARITH_CMP, ARITH_CMN, 0, a, b, b_const);
+        return cond;
+    }
+
+    cond = tcg_tst_eqne_cond(cond);
+    if (b_const) {
+        int imm12 = encode_imm(b);
+
+        /*
+         * The compare constraints allow rIN, but TST does not support N.
+         * Be prepared to load the constant into a scratch register.
+         */
+        if (imm12 >= 0) {
+            tcg_out_dat_imm(s, COND_AL, ARITH_TST, 0, a, imm12);
+            return cond;
+        }
+        tcg_out_movi32(s, COND_AL, TCG_REG_TMP, b);
+        b = TCG_REG_TMP;
+    }
+    tcg_out_dat_reg(s, COND_AL, ARITH_TST, 0, a, b, SHIFT_IMM_LSL(0));
     return cond;
 }
 
@@ -1225,6 +1245,13 @@ static TCGCond tcg_out_cmp2(TCGContext *s, const TCGArg *args,
         tcg_out_dat_rI(s, COND_EQ, ARITH_CMP, 0, al, bl, const_bl);
         return cond;
 
+    case TCG_COND_TSTEQ:
+    case TCG_COND_TSTNE:
+        /* Similar, but with TST instead of CMP. */
+        tcg_out_dat_rI(s, COND_AL, ARITH_TST, 0, ah, bh, const_bh);
+        tcg_out_dat_rI(s, COND_EQ, ARITH_TST, 0, al, bl, const_bl);
+        return tcg_tst_eqne_cond(cond);
+
     case TCG_COND_LT:
     case TCG_COND_GE:
         /* We perform a double-word subtraction and examine the result.
-- 
2.41.0

