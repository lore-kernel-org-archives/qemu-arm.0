Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69D9CD4F5E
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 12:30:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ2XJ-00012Z-Hc; Thu, 21 May 2026 08:30:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ2Wf-0000xr-4p
 for qemu-arm@nongnu.org; Thu, 21 May 2026 08:29:23 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ2Wc-0001cH-JT
 for qemu-arm@nongnu.org; Thu, 21 May 2026 08:29:20 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-488b150559bso46274115e9.1
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 05:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779366556; x=1779971356; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tj6Co7n4k9aSG9BmeRnqyz+yHY6OpmRBVFVuM2qxVjY=;
 b=ySdl1ZspylpRdYi3sbhGr+mUXH6hvvGjJnRuv6boPaBhINmUd5XYwTYXr0oxtpHKrJ
 U6U1+wkweBDpARi1z6bsv0Z5rpVHPjGJu5r5ChuBav5K7HuEKr2H3hmrxuv4CVI7BiZO
 VcDLatiIPiRCFEs2g5HxvK2A+48b49Y87Eo1lJLTq2rEi155EaWdSDgrqJgoIpfLWPdT
 B2zHiORlErkz3soYGKeSj4J1BZiKhlbs3beRFJdHsSUYANgvouPy4sSeT48H4UqrpxbW
 /13Rt20U+hc3sNxj2mO2EY8J9XGqdg+lTFSdneHDGjPt8Bf8EmI027GBss7fWuiu10DR
 IF0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779366556; x=1779971356;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tj6Co7n4k9aSG9BmeRnqyz+yHY6OpmRBVFVuM2qxVjY=;
 b=l1/HCcGljpCauz0ml9UJ1hlVo+L16xQkyCw/pNhH1USuIsC4vvr93PFGqM3lroX7+V
 D77Bv1pZtkAKkrTAlss9z4wAQrOgBK1nEykZKLTc3M0DAHzfcrgCFE7a+jRKVdaD/YME
 TVpxsZrW6QB0XWLfSMN5Gx1RHCFgBEHKiwI0AJckGPZHcG0jo7g/kTvAEfWHMOSrlVeC
 SfeOMzWd5Yj0chf8YmI59uw9CmWaztLf+Wf4jJuoIricCUisnzGcnHYNotn40uF8R3CV
 SNopUdGCyWcumHFsis51e24IKXNkbNFfqC9S/yISrbNpJrZE+oeClWF1bqB4wRMD2YeS
 UHIw==
X-Gm-Message-State: AOJu0Yxu2uPcVvrlVpalGZjBBAR8oVIRzvEZJhp5CHed7XXAhkk4SmM/
 dCbXThS7PVVu+TDo2wC7toilwV9Fa0ICmilsfxu8sOvjvcpjkwiLdR+WoR5ZICkp5lTPx4KvFaR
 2zB2u
X-Gm-Gg: Acq92OF+W78iDKmskd6PdbMfDfgT2cZMUbRDqxCS8epfUJhdaQLDzRZHdZPBouU7nH+
 8th1HP10NFwHfgC4td9oUpVKpoKk+qentsIsfnCsXOP9EYvORy7el2qS5of2Y5odfSfsG2I2PU+
 jsZnL6vego6kHbz+TMP9E3i8ItxiN6IofA+drA4dJY5yIpeGhue1wCPIN9cLsakzpWsaX/alN4n
 ewO2/FuZUwypwhwBg1gwCfLmK83CARanHOp2hiRP471YEqkqIi75lI/Ir59pOvTtMC9QKQdY0Sm
 q/cLV/4Uywi9hSLe4tXeKIyrUBKPbqdwiqOCF3mYrxHYXVIuN0hqS1R00GXOiyoDIG/ycFIrTBU
 LozWXvOVIhO5Wd7vYAwtwEoFcSFY9IStIrYyXY+ZN4tkQdBNzcldxR41aTALZLQZqNg7NSygOt0
 96kW1KraT5zcCqHzqfomrybPL1jnqNdSWWimEusjW8fIocYNqQxt3040ityXDqXjUiM6YqKlMfM
 1MzrdJbrGq2eGHrSh3ajmtLcyI7aPrluhznUu9aWw==
X-Received: by 2002:a05:600d:10:b0:48e:526e:101a with SMTP id
 5b1f17b1804b1-4903606b81emr33861035e9.12.1779366556052; 
 Thu, 21 May 2026 05:29:16 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49035c72c78sm22054245e9.3.2026.05.21.05.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 05:29:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Subject: [PATCH 0/3] target/arm: Fix some FEAT_AFP corner cases
Date: Thu, 21 May 2026 13:29:10 +0100
Message-ID: <20260521122913.1565011-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
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

There are a few corner cases where when we implemented FEAT_AFP we
didn't update the instructions to get the FPCR.AH = 1 handling right:
 * SVE2 FMAXP and FMINP need to do the AH=1 style max/min
 * SVE FCVTLT to halfprec needs to use the F16 FPCR
 * FLOGB needs to report when it consumed a denormal

This patchset implements fixes for these.

thanks
-- PMM

Peter Maydell (3):
  target/arm: SVE2 FMAXP, FMINP must honour AH=1
  target/arm: Use FPST_A64_F16 for SVE FCVTLT_hs
  target/arm: Set correct fp flags for FLOGB when FPCR.AH = 1

 target/arm/tcg/helper-sve-defs.h | 14 ++++++++++++++
 target/arm/tcg/sve_helper.c      | 11 +++++++++++
 target/arm/tcg/translate-sve.c   |  6 +++---
 3 files changed, 28 insertions(+), 3 deletions(-)

-- 
2.43.0


