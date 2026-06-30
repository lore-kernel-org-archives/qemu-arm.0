Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910ABC43327
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Jun 2026 13:18:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1weYLO-0007d9-10; Tue, 30 Jun 2026 09:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1weYLJ-0007bA-0M
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 09:17:37 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1weYLH-0005tF-3Q
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 09:17:36 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-697edb1bf6eso6545943a12.1
 for <qemu-arm@nongnu.org>; Tue, 30 Jun 2026 06:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782825453; x=1783430253; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YbhxeHWJTF/ACgNqo0DBl2wV+Ij7LlkdakxCcJrLBrs=;
 b=M5jZDyCKxFXWSBknXyq2Mf+sON56eOBJ9B9a9WUi06+rLc0EL6zc0QO/6KgvYWDOfl
 8F741aGCdo1PWl0SvaY9wCZIhcOtpy04l9c98Z+sTLje3FVTas/W6xhWE4l2nvEc9AFX
 dby8zm+g9lu0E45t98/dv7KUuDJA2PTkqf2l880mzljWr4l8+6Zmsh5MpY7gkjcSv0VG
 TaKZM2pkIPNkjrOPkfhYQQGQ/xJl8KmgqPM//12b4/MJWxkQJlDV1Erf+DO2mnzoKsdr
 xMi33F7blxmUryjY/OaEcDKlBT5mTFM/5gsBAZ6q8MthyVSWVHor5RqYNdDbFU57nJIv
 wo4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782825453; x=1783430253;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YbhxeHWJTF/ACgNqo0DBl2wV+Ij7LlkdakxCcJrLBrs=;
 b=EsDCJqTW6174HwLcFD84KtzbfsS5Dzk1LcrEcmjjn7maTbishxPBQmyg8x4SZYKees
 CI9b4RXTZneQKmRvjh3wiCoCQ9ypGot9Q+8zC7UswNr5IbtliwGda1P2TkZ8bWNADl1q
 pfn8cLOtiuHrJiA0fyTcRnDsDfpjYaJjmGhX9ClYxQt9t5FVpG6vUrD1kYqWiz//pNVr
 OOi0X63C2124lgBHPbRAIaqZa+5qh0HWCOjXsGNTHCuoC8bYk0j8iRHNZFuZde5TiFdB
 xFoKUgGXdj1z5b4sTKc1Wnhr0o+g1waZnMvI2or9q7gf9Di5Cm37oWt75ziowFAnVlFm
 xclQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpDAVdbG5nfr1TKkWe/yj89cdheXwDUENuSlOuY6s+G01iD4BNMw5Y0DNQJclZPBYF4b/6BO5yPew==@nongnu.org
X-Gm-Message-State: AOJu0YyCXxWVbVOkpB9mM76ApZw+3WiCPbPHRWyHylYYGIaFCvHAHx/5
 85ZiJNNHyQSeS/70Koa3BvZvC2Px/YdFpLKVGX+8bqfkkf3SXLB/ez0eAo63h5bLzKE=
X-Gm-Gg: AfdE7ckewMUQPbGdilHYkn8YEwfoUjmnj3H2Ot6tG+TrapcdUMEyPGhGolgAHmyx1wd
 dDCovixhECcLOdHvTbHn4eDx3wNLrLh723ZqqChin28KuGOAYNZ5hU/jnfT99KiZHjarUm227eG
 jDqucxJCYdHA6eim1zt/Ie2mOVrkItCTI4FosZj49PifB94TDuOgk+MyjJFPH5bZaxWKt3dlnzq
 x87AehUOLiU/HEqre6wwBcoS1+kAtJDTL3FkZy9XUUeYkMc9f6znHtpTuuH3OSJU+pSGrFKnX8c
 IZOX4c/vwCBZbQs/l7g1eo1YQpoLkqVrYG/0Vp+3jBKVc5Xduq2kmNDujjFgh2gTrJUQUv2SgrZ
 oNYfD4Bd8/nBpPzTK9g+ExfOsHT0Qq2pA395omgepn3tBB1W60S3MAHCXqObZaVNNjR5KTZUuoR
 dXp1JUhoYDS2fLx6E=
X-Received: by 2002:a05:6402:370f:b0:698:57cf:469f with SMTP id
 4fb4d7f45d1cf-698878605d8mr457108a12.27.1782825453504; 
 Tue, 30 Jun 2026 06:17:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a10:d582:31e:0:a648:9a45:1aff:ca47])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6987c3a42f6sm1201535a12.6.2026.06.30.06.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 06:17:33 -0700 (PDT)
From: Jim MacArthur <jim.macarthur@linaro.org>
Date: Tue, 30 Jun 2026 14:16:35 +0100
Subject: [PATCH v3 4/6] linux-user/aarch64/elfload.c: Add FPRCVT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-jmac-fprcvt-v3-4-f4840d5e0a7f@linaro.org>
References: <20260630-jmac-fprcvt-v3-0-f4840d5e0a7f@linaro.org>
In-Reply-To: <20260630-jmac-fprcvt-v3-0-f4840d5e0a7f@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Alex Bennee <alex.bennee@linaro.org>, 
 Jim MacArthur <jim.macarthur@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=jim.macarthur@linaro.org; helo=mail-ed1-x529.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
---
 linux-user/aarch64/elfload.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/aarch64/elfload.c b/linux-user/aarch64/elfload.c
index 4887a3a7b7..4487d047bb 100644
--- a/linux-user/aarch64/elfload.c
+++ b/linux-user/aarch64/elfload.c
@@ -173,6 +173,7 @@ abi_ulong get_elf_hwcap(CPUState *cs)
     GET_FEATURE_ID(aa64_cmpbr, ARM_HWCAP_A64_CMPBR);
     GET_FEATURE_ID(aa64_f8mm8, ARM_HWCAP_A64_F8MM8);
     GET_FEATURE_ID(aa64_f8mm4, ARM_HWCAP_A64_F8MM4);
+    GET_FEATURE_ID(aa64_fprcvt, ARM_HWCAP_A64_FPRCVT);
 
     return hwcaps;
 }

-- 
2.43.0


