Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B153CD5BAC
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 18:09:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ7pa-0005TO-IE; Thu, 21 May 2026 14:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ7pN-00055K-EE
 for qemu-arm@nongnu.org; Thu, 21 May 2026 14:09:01 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ7pL-0002sS-4h
 for qemu-arm@nongnu.org; Thu, 21 May 2026 14:09:00 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-488ab2db91aso67686255e9.3
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 11:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779386937; x=1779991737; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hTMtQIl81FhHhQ92f8dO1f1utzKZ2skRlj6T2ncqBcs=;
 b=zciE1MpnrnjL1QdZFIj2r4ED5EgIiLVZwLeUgzhTsTIfWBTnsBCMl3sOc0NxMKNS6Z
 Up51b8WQbbehaOuVXKuyRccX6kyx5/zqHsXX6f2aJ0hK8DwdbHSPayige411HupBruCf
 rP9BZ4G6qZjtwxy46sQVMlfYxKk8VkxJykjqf9m3u7Bo+O7oHwHR08ViwV38YViORJ3q
 K5ZbZFOFbFYJouN740Z6awbmaS+vfqcfqcPbDDwjz0CEU5pwVDreAEOjudzgk519CS7R
 MIHDmMH1Gq8OHgqYzDIG8XSqj4/Ut8C5zyP6Z0GEfMamD2RGVeEa4DVQlZFjCEte5SZt
 vMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779386937; x=1779991737;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hTMtQIl81FhHhQ92f8dO1f1utzKZ2skRlj6T2ncqBcs=;
 b=oTMseSI0gx/zW6M5qlNK2geYipG6hooyuuu0hGI9SJcdn63uQFB+BtbBHoOJ6KkAzf
 REAySPHDKCsOkbVPSvA7X+5eHd8xo/kYXmVm1BFi3yug9qX2sq/od1HBlX6Y/TSec7fy
 wqsJTcGPbEGipJ3mEgo/Fz5zcoy7k0tqre0TwOzDJ2C5Bwgqb35rU/BP7ufwzfSO/lzc
 CrayS32EEDl3yyJSQINgd5fAmuBOEpRBrRcgqeUEx9Qet4WkEOKyOP8pAsjzEYHfU74e
 Vp1AL3e1QpYw+Q/VNkGjZYZkCY4Kk5q0q8VZWWbJdL0weHzqL9KnIBdxWO+17DJM4m4o
 AXWw==
X-Gm-Message-State: AOJu0YyoLxNkyZfy2Mrymu27iPpNHvISLL21O6zJpu4H+qurxoEJmUwa
 j77YAth0io4QLBRAxfnNlY+nXCPRH/uduBi3PdlRMWRBAI+vrl/9iGITJhcdMfFrpLHZOLIiOmp
 ayXHm
X-Gm-Gg: Acq92OFB+DBnC14YEdmpUg3oiiLBdHZpd11hXGsNYCppVjgX9zWa/CBW3kOCXhmjaTq
 671m5GzuHxDxMe6bde/aRIisyFX33Hj31+eGuzyE+2zNeEt+YVgPiA/xA7Qf9o7DAk6vqJE7KPJ
 7nsSJqWPUTfCW5r22WKPQKnc5TP6voShlTylaot9WCr7piLLPFyroKoSMQFlB9kOgi5wtoK+qd0
 zy8jxmm/Qd1BbILCLx9qCLFJz0xmzJ1cw892IxUxqWbfDI17fNDa+YNjHiT576CLDGSNmSTCAum
 WkEu1VVR10MPb4JVYfLLnnD7mESm3FB2Dnm86xOqFB8d+9UgcnmQ1W/M2K7MsS3KpyfyWo6PdEp
 aHB3RhIe3hyrXWjICxWJ3gUev+7YGJ3NVyv2VDOcASV5BZW6KgIl27KYxUxzhugMD10RLtx7eP9
 OjHxd1Q3M8p9U/f6RL8/n7/OhmGjkoz/PJYt/DBYyIYzRXWLk7XOrvBisSNu8DONER9VMf6ReBk
 oWjeUxDHBwermLFoXBB1OWZ8O9Qu1s=
X-Received: by 2002:a05:600c:a414:b0:48f:e518:d110 with SMTP id
 5b1f17b1804b1-490360ebc07mr46826345e9.32.1779386936634; 
 Thu, 21 May 2026 11:08:56 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490417499f3sm2298025e9.5.2026.05.21.11.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 11:08:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] target/arm: SME BFCVT,
 BFCVTN have "Alternate BFloat16 behaviors"
Date: Thu, 21 May 2026 19:08:54 +0100
Message-ID: <20260521180854.1744788-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

The Arm ARM A1.5.10 notes that some instructions have "Alternate
Bfloat16 behaviors" when FPCR.AH == 1.  We implement these using the
FPST_AH and FPST_AH_F16 fp_status words.  The list includes the SME
BFVCT (single-precision to BFloat16) and BFCVTN, but we forgot to
make those use FPST_AH_F16 when we implemented them. (We get the
ASIMD and SVE insns on the list right.)

Add the missing logic to select the right FPST.

Cc: qemu-stable@nongnu.org
Fixes: 465d36db0e1 ("target/arm: Implement SME2 BFCVT, BFCVTN, FCVT, FCVTN")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
(There will be a minor conflict with the rename of BFCVT to
BFCVT_hs in RTH's FP8 series.)
---
 target/arm/tcg/translate-sme.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 08254b088e..8e56dedaa3 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1419,9 +1419,9 @@ static bool do_zz_fpst(DisasContext *s, arg_zz_n *a, int data,
 }
 
 TRANS_FEAT(BFCVT, aa64_sme2, do_zz_fpst, a, 0,
-           FPST_A64, gen_helper_sme2_bfcvt)
+           s->fpcr_ah ? FPST_AH : FPST_A64, gen_helper_sme2_bfcvt)
 TRANS_FEAT(BFCVTN, aa64_sme2, do_zz_fpst, a, 0,
-           FPST_A64, gen_helper_sme2_bfcvtn)
+           s->fpcr_ah ? FPST_AH : FPST_A64, gen_helper_sme2_bfcvtn)
 TRANS_FEAT(FCVT_n, aa64_sme2, do_zz_fpst, a, 0,
            FPST_A64, gen_helper_sme2_fcvt_n)
 TRANS_FEAT(FCVTN, aa64_sme2, do_zz_fpst, a, 0,
-- 
2.43.0


