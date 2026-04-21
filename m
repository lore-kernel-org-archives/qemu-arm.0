Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C49F8FA78
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Apr 2026 14:23:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFBzx-0006CC-7b; Tue, 21 Apr 2026 10:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wFBzv-0006Aj-UP
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 10:22:43 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wFBzs-0007OT-JG
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 10:22:43 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4891b0786beso20652525e9.1
 for <qemu-arm@nongnu.org>; Tue, 21 Apr 2026 07:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776781358; x=1777386158; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=o3zvbU/P1VBtqICRahxjL8iOuK5j880AJkIh1dca91A=;
 b=MamdK0juNjfTpqH+eqfFH36cVlWWd9DKEjGrdPptTLKX5XF4W+zkSRE0nK0mpPATdS
 bcmYhKA1IsN3t0aTkPoo18VKwT8hN0qVGOm6WswfQUhraK22wNF3p9PC717toGN0DE4t
 9sLKr4tvTJPqeKuvlX4iehXoCJcZH/AAW4ICIlipTPp64UtpLVHcRa+42o6tlCqfRg9o
 Pyd5K/efuMt98jwTE/MHTtc/FEPItqkS1Qpsg7fPfP4l6EKm6/CajU3e/M7cnY6chaTp
 8uSLidSqE+h50MDyVB8znsDAJ9igYh4vBcjNMQ1BTHZriB8FB02pUukl6FwWlTfkN9Zg
 Kpow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776781358; x=1777386158;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=o3zvbU/P1VBtqICRahxjL8iOuK5j880AJkIh1dca91A=;
 b=LfKiBZoSllGUdioJ7Wr6kFFKljQUrK13TmYXR/u5B8ZZ3KA2BX9icu5ct6IQvDmgqC
 yieS15G+9VdMMgSJ0yZAjG2kdJb9mFmzBoEuDqUgGacnApaOQrKYFKlk8pPMibon5ylX
 LT1NYauRjXstMlCI3lS4E+vmZZdkuh5r0FVe2QQNp0Lc1pc9WKuloe8JoBpLxKuyMtrK
 7iB3U/Jo8ruUNDBI6KuaDuUcmb+LCfLF8Vjs76xAeJK5XTyfMz/W3g9EfksJK8ct1aOj
 hb5BpNdnadilIzKAqgE5W/G83SpzVJl/IBz4mx5lLfjwlVZ/xKRkRTP72B8vQLHEtO5E
 VAeA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9icuMxssX/yRvV8sr3AqWbtAuom6k3thsEOOr8wAomv2Jalz7VTeRAvfnbY0oUwcrApoNUhiPkFg==@nongnu.org
X-Gm-Message-State: AOJu0YzukGZhQSx0m5dRJJTLsn793GghJ422N4gddsvaggk1Vi9aQKi4
 26dHfFg+cVU3JJL7k9ZogykBNxfrNT0KuJ5DuzOt2olzL30LyV3GxcyYouDIJfRGR5Q=
X-Gm-Gg: AeBDiestznDiXEdUVl2SmogcjN6ubAr5aRmm5aowCmzmwpVl3f4bJMB6xpcoRF913Wf
 4CEE2sG7TTU6z7PQoOr5XJu7I3TfZ5KZKYB+wJ8qt6iIlpJy96u0/+vzyVshmRmBMbXiwGdpBl5
 OV31F7Rf92l1b1XAj8zlnZPfgH4bFOExl0qltyN6VYDPh7nBl4pBrTnZqV9rGiqfdM/PJjEiAAj
 PJx577hCb9ejP25ryw1mNIX5F/38J1kH7LjEa7ny5/2Bjt76abGZCMe5OlwgQfkb7geilFrqiLi
 4V1crs35BPDXrzHO5beFbBV9V+W1ETVrLDdgypCxFNjvXYVMgXj+wvG+z8wHJW4s37h4rVqMv4y
 zdgKLD5ET3wexpOxE3G1YqSTw4XUdiMxJIPRzuCYxmFv/qnEfncHdcFQM2s+kaPYwOwnO6l14+a
 11bv/26slk2yBM12WLRs2BEKftsMfOMBKhj+BUKg==
X-Received: by 2002:a05:600c:3110:b0:487:2439:b7be with SMTP id
 5b1f17b1804b1-488fb7389dfmr280872495e9.6.1776781358387; 
 Tue, 21 Apr 2026 07:22:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a10:d582:31e:0:5364:f814:f749:9bf5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4891cca5743sm164250465e9.9.2026.04.21.07.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2026 07:22:37 -0700 (PDT)
From: Jim MacArthur <jim.macarthur@linaro.org>
Date: Tue, 21 Apr 2026 15:22:34 +0100
Subject: [PATCH v3 1/4] target/arm/cpu-features.c: New fields in AA64MMFR4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-jmac-feat_rme_gdi-v3-1-ecd20c77eae1@linaro.org>
References: <20260421-jmac-feat_rme_gdi-v3-0-ecd20c77eae1@linaro.org>
In-Reply-To: <20260421-jmac-feat_rme_gdi-v3-0-ecd20c77eae1@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Jim MacArthur <jim.macarthur@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wm1-x329.google.com
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

Added RMEGDI for FEAT_RME_GDI and other new fields.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
---
 target/arm/cpu-features.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index b683c9551a..2d1a3196b7 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -346,8 +346,16 @@ FIELD(ID_AA64MMFR3, SDERR, 52, 4)
 FIELD(ID_AA64MMFR3, ADERR, 56, 4)
 FIELD(ID_AA64MMFR3, SPEC_FPACC, 60, 4)
 
+FIELD(ID_AA64MMFR4, POPS, 0, 4)
+FIELD(ID_AA64MMFR4, EIESB, 4, 4)
 FIELD(ID_AA64MMFR4, ASID2, 8, 4)
+FIELD(ID_AA64MMFR4, HACDBS, 12, 4)
+FIELD(ID_AA64MMFR4, FGWTE3, 16, 4)
+FIELD(ID_AA64MMFR4, NV_FRAC, 20, 4)
 FIELD(ID_AA64MMFR4, E2H0, 24, 4)
+FIELD(ID_AA64MMFR4, RMEGDI, 28, 4)
+FIELD(ID_AA64MMFR4, E3DSE, 36, 4)
+FIELD(ID_AA64MMFR4, SRMASK, 44, 4)
 
 FIELD(ID_AA64DFR0, DEBUGVER, 0, 4)
 FIELD(ID_AA64DFR0, TRACEVER, 4, 4)

-- 
2.43.0


