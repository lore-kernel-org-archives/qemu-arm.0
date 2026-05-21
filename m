Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B1BCD5BAC
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 12:30:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ2Xg-0001JC-LO; Thu, 21 May 2026 08:30:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ2Wg-0000y4-MC
 for qemu-arm@nongnu.org; Thu, 21 May 2026 08:29:28 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ2We-0001ch-MW
 for qemu-arm@nongnu.org; Thu, 21 May 2026 08:29:22 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48984d29fe3so65959415e9.0
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 05:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779366559; x=1779971359; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fH5hlcFtdcnQevD+hJ39wNb6pHC99dGw7i2XR1TiCJs=;
 b=HMT0T6vUmEu5TDOCS7UZ9lnuM55eRyhXIjS1IxesuuTg/OV8l2nb/lMMnzqG46eQWp
 a+Szctsde/0LIZUrUpy7baQrJxYcKM6JL3lDPbMw+LcDVo9HlmOQ0wUTfgzmCJiL24xI
 8XX/E1m5U2VCDn/BW6XdtoAgu2E8jY51+MhsZlnjKhlUXKPV1ZRVEAGbx6nN28VsS5MT
 ixICat+zi4DKuxDfKTxr243BOv2V23ZLolwVVJcTFcmxRjJYnMYhRlf8/qgvziZiIIFn
 9N5EKGtaB4DkHCPeFpKKA5Aiupo8KLZzdYYnTxJsA0baqUFuW3uWhJT9j7BBgYdnDRao
 Se8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779366559; x=1779971359;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fH5hlcFtdcnQevD+hJ39wNb6pHC99dGw7i2XR1TiCJs=;
 b=Mb32QiksW6oERjAJVs6+hbJLHEACQU6ZiNKF9cGQSsYJ9y1Ze39gDVvvGMeleI7QkW
 0KXI4us7CVrowxYfKuMgeFYixcCeeSi+rwx5Tk9MRhFrdc1X/UnQqepq9hb/VNnUvN6E
 /zElG5PMsr753qAjA9jVkQHlf389BHgljKj9EaKkxxM5ZnuN5zO3oXKz1Ydr3YQ4MhHa
 HJiFS5y8NshtLmSR4DVLxkgzmXwC/1JlNypo/xi9uqPUY9HsiGs0d8AkhX7Usb8OEbCw
 zRwzK/ooumQ7shxnFqMx+SfnL0nOl1TWnyTyD80InlyUt7ukfqGZPp+kfLVzQITC7xst
 Q78A==
X-Gm-Message-State: AOJu0YzifaZXHIj9Nj15hXFhAdYLjDaSlm5ki3wqNPSnvgHvkZkVLR2B
 FB5OekAO6LoD3Xw9VHLzYmJFiwnCyURe8mFFJrmC4REoe86C+h3Xx/XBmO62eb0ELoPVmA0KiyK
 c9WTT
X-Gm-Gg: Acq92OHekDQ26gmJV5nRO4cn/8Mf5v99OmHyniF2w+cQDSsVR8pYB37avB1RypkfNbf
 SUfm+Fx8+Ez1srq3OyykghxcLWZvaDgWmmKTXhDKBPgH/qantEqAlXS8xE9gpEOTAkeb8eD4ZWr
 nzlpKWulkbch8gTzFy52YXzu+Sri2L7klR9jSiU3c29RJfdqS55du4PaB4Rnv5WrH+UExhH2F2m
 CvNhTFCg4hzdKqr3jdEPgRyEQQ5j3l7k0npIFET1cX1DXCUlEEkbdWsJsLI+J4Abco9M4U7+RGb
 CCxXKAICWsDEqxzY+klGW5GuAlZW5dGpY8lwxOgq1i0jZTgU4/eQMjZfv8SUpZBGx891lXAvxEw
 cpAhlObTchEGJaNTNdlBKTOfbxMBbIgwGdPI1FqDNZVrmabiYQP29fJ4lxfczvQqx4bO/UBvXlB
 VtTDu6bd76eLkr3HgL6LWYSUuQ61C+SKWSi6vDs9B5R88HPfOLA6WGQLI4yGuIs6Cd1fhe7RMH+
 aj4EJ8WyXXZQL8DeibWSDL1QKk1ZKo=
X-Received: by 2002:a05:600c:1f89:b0:488:d6eb:e63c with SMTP id
 5b1f17b1804b1-4903607fd11mr35515065e9.15.1779366559242; 
 Thu, 21 May 2026 05:29:19 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49035c72c78sm22054245e9.3.2026.05.21.05.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 05:29:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Subject: [PATCH 2/3] target/arm: Use FPST_A64_F16 for SVE FCVTLT_hs
Date: Thu, 21 May 2026 13:29:12 +0100
Message-ID: <20260521122913.1565011-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521122913.1565011-1-peter.maydell@linaro.org>
References: <20260521122913.1565011-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The SVE FCVTLT_hs operation produces a halfprec result, so we should
use the FPST_A64_F16 fpstatus for it.  Getting this wrong means we
will incorrectly set FPCR.IDC for input-denormals when FPCR.AH=1.

We missed this instruction when we updated the halfproc-to-other
conversion insns to use FPST_A64_F16 in commit e07b48995aaa
as part of implementing FEAT_AHP.

Cc: qemu-stable@nongnu.org
Fixes: e07b48995aaa ("target/arm: Use FPST_A64_F16 for halfprec-to-other conversions")a
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate-sve.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index bf9f0ae179..59b8c494a8 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -7827,7 +7827,7 @@ TRANS_FEAT(BFCVTNT, aa64_sme_sve_bf16, gen_gvec_fpst_arg_zpz,
            s->fpcr_ah ? FPST_AH : FPST_A64)
 
 TRANS_FEAT(FCVTLT_hs, aa64_sme_or_sve2, gen_gvec_fpst_arg_zpz,
-           gen_helper_sve2_fcvtlt_hs, a, 0, FPST_A64)
+           gen_helper_sve2_fcvtlt_hs, a, 0, FPST_A64_F16)
 TRANS_FEAT(FCVTLT_sd, aa64_sme_or_sve2, gen_gvec_fpst_arg_zpz,
            gen_helper_sve2_fcvtlt_sd, a, 0, FPST_A64)
 
-- 
2.43.0


