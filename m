Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C96C44507
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Jul 2026 09:18:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wjZHN-0005fj-BS; Tue, 14 Jul 2026 05:18:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wjZHJ-0005Td-D1
 for qemu-arm@nongnu.org; Tue, 14 Jul 2026 05:18:14 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wjZHH-0006mP-K9
 for qemu-arm@nongnu.org; Tue, 14 Jul 2026 05:18:13 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-493f0ae9572so16492355e9.3
 for <qemu-arm@nongnu.org>; Tue, 14 Jul 2026 02:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784020690; x=1784625490; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=TjqwTNzttuduKpnWOMD/PV2scA7Ek1q2GBgBASj7HLI=;
 b=lid76FzPGiUF6VepSv+azFK5s9gKdpIrYZuSEI7mvtahhCjdfKex+Vvlo0st0Q6XkY
 YSWxqzsEc7vVnkgSGVVjer94WH++sXJnK3ovCOYYy1Xg4ECw153qNGtYbE5xi7A1htDR
 XB0kGZLWgncNiGXyNVNIYCf9+q1SvdzMgUzbFSIP2lSvVPMA52mhXHanxc34ivsnT/zH
 XUffb4g9+yvt+biR0ziUcFvkIBmslGkUz/m6UNRPX6oTN35R1JIq2yZ5yN1mjlFpzkHK
 A1eexwmVI10JMy2Zi4ZJ3oe+ieRoBi7v3JGkttCcwprJoFiu8oQyqXDpbM9NcP/6FL+d
 0Ycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784020690; x=1784625490;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=TjqwTNzttuduKpnWOMD/PV2scA7Ek1q2GBgBASj7HLI=;
 b=QMoqd7FstK9Gn7wRAhOlT6XAZCNoj91nYHCdYCDHq9pKaUKz6MBiySTqouuN7Jn4oF
 zs92UPCj0cnhFbD8ODCIKd1DGPM2nYk8avlnzB6h53kB06pnbFqcX6Uy6oktQPyhJElq
 VWwlpE3fxPp7bftARqj6K4BuVTMMs31lxWxsSzWEBycrYsUSH+72Kqj2Bd4S3t7sbOoq
 lVMWzh8VireP+JYCvOjaLuoHDeT0iyOj8nNZIsAsKpUYfm/6Huff1orKX8Eoo/Y1Paoo
 8BR6YOCyT2Bcb/0xdFz9reTmqBHLaNNGlpIvBwM5yf6QYHInoaueQ9q/OZ+uba/KEqR4
 /jxA==
X-Gm-Message-State: AOJu0YwqktqX+kFZ+5ov7C2QIIVQ1yKb7Vaa4aCiRlVJli7DNzJoFc4n
 VtMLmBZVRWOQCGS0V+7jhVNMKdfn1TMu9Aipl3pJk4whM7nvfAHTd3hd1dj+540s1O54GlTEdsE
 hC/oHql2Fcg==
X-Gm-Gg: AfdE7cmmbCHgVtFizU5UamdIwppg5kV2/Wu/ljeDw+z7Fv+yeFVRLEhKvFCICgfFeCG
 9znrVdkWIAeEK1DtBJ9kZszOCE6qFlciYX5hBMI95mQ9aFbiRRcfRbH/UQVbpzBVeDDmjJA0XLj
 wlKP10NKZNqmT/KUW2afBLNagkoaQVR2+CMWsNSmx9xiNdHNRsOE187eRzy8TTOlhdA6dfClyNj
 8VQ4RDpvdubh3ZoH+pPYK/IqYF0adrtL1Uq5HBAr7fQPvpzBjzvzFpdXPsy14pewcbhgvtxpTcq
 EWoHmVpKwNNGr+/7BnTg0JF8Wr7vhiNSvRfBWDQE14cmnvnf0+XAP3O3N4j+NLhmR1xKCJLbM4S
 oJD7lt0wFGSL9vJ/zkQ1WnhK1HtAd+8VO1iOikyPxiG/G2BJkaDx176lhOtnGjwT41GVTw6FXrA
 76oyf3cLwlGrg/rlSsV+T0Ukdbrg2lFGK4Fn5+uLYIXM6CSZCpYzb4poscnBSRHgzCX3aGlO+W2
 xKaodYy4ViEdr3AMy+NHg==
X-Received: by 2002:a05:600c:6304:b0:493:bb23:152a with SMTP id
 5b1f17b1804b1-49485739980mr47026075e9.34.1784020690020; 
 Tue, 14 Jul 2026 02:18:10 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4950a322bcbsm69927185e9.9.2026.07.14.02.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2026 02:18:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/2] target/arm: GICv5 cpuif: gicr_cdia_read() ppibit should
 be 64 bits
Date: Tue, 14 Jul 2026 10:18:05 +0100
Message-ID: <20260714091806.3568281-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714091806.3568281-1-peter.maydell@linaro.org>
References: <20260714091806.3568281-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

In gicr_cdia_read() we turn a PPI interrupt ID into a register
index and a bit mask with a 1 for the bit we want to change:

        ppireg = id / 64;
        ppibit = 1ULL << (id % 64);

However, we used the wrong type for ppibit, making it a uint32_t.  If
'id' is too large we'll shift off the end, so we won't ever update
the state of PPIs with indexes above 31.

This didn't have any visible effects because the currently allocated
architected PPIs are indexes 0..31, so you'd only see this if for
some reason a guest was manually marking as pending a PPI in 32..63.

Fix the type of ppibit to the intended 64 bit width.

Fixes: 3f79212abae89 ("target/arm: GICv5 cpuif: Implement GICR CDIA command")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/gicv5-cpuif.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index 1cdd4103d0e..8e2a08fdb6f 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -633,7 +633,8 @@ static uint64_t gicr_cdia_read(CPUARMState *env, const ARMCPRegInfo *ri)
     switch (type) {
     case GICV5_PPI:
     {
-        uint32_t ppireg, ppibit;
+        uint32_t ppireg;
+        uint64_t ppibit;
 
         assert(id < GICV5_NUM_PPIS);
         ppireg = id / 64;
-- 
2.43.0


