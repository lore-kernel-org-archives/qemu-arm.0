Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp280371lfm;
        Thu, 20 May 2021 08:39:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuFZiQjfUec4aW9Ckopjlrk47eresSCQqVOm30PmrASX2hsbV0ri+beGNAl1PVNNSmPgcr
X-Received: by 2002:a92:d7c3:: with SMTP id g3mr5160915ilq.114.1621525181164;
        Thu, 20 May 2021 08:39:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621525181; cv=none;
        d=google.com; s=arc-20160816;
        b=KmQQnu4tdr+2Gg+ZIkOVVkLZ+K3likDT+X3ydIZUzPfGuge0s75SxMoXaDzLh2lE9u
         +a5CpRj5lKyeJkQ9zVzurHfdF65V3muFdXhJCzIEWS0NMtVShsb38tqIKd89iwVej6Ij
         d2GgJVRe1TsVXy8vQcGaKnXPcsE+ftnYBoJLZ3wrIrguKAIY1IJMfBv3xEAaNqgo5CAC
         VRGxM7CHf8jXQern5a8ahdUXnUZku2ZRjij+trUIY9eC8PVasYMm1Qn8lVmm4jGVdvOu
         TLpClFu0X3K73T3PSr4NpNpBeayclZJMzeZ4AqfU0coTL1u262A7HhHS8ZuQap9c/zjB
         mFiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=nycRzRnC22+MMRKklZmpFxoGXgNbpGqBimi8PnwOL/E=;
        b=RsUmWHsGdVqCGO5YQsD4mO4jESBoDw8A+XUkgnXwBKWA2JsEp6Ev/hant7EQsrJVR1
         6K7nXI0A07tLKvq8wOVBG5nXbRe8c1bUE8gX9Ibgpw6DWd0eQV5KdlIKzHIV6yQiH8BS
         58JF3NgY5njvnbhZQkgrm5UhjY81ArSs+lhEIGaoslQk0yWY6qoWXYGxAizp/POh3aau
         iHyAGkuYpgVB9gQ8N6GvGEvFn4sJqSo+Q7MgtHWVQOFL8TGs6cWOlEa13rhZaMei23du
         BqEG+kMcqNIKzW/qWG6XplgvTFZMSD6/+mbjVpjD6SZ4rhEhVGwA5wOPFAUda5H5JPpI
         nJ0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AaPDH5X8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11si2484429jak.61.2021.05.20.08.39.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 May 2021 08:39:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AaPDH5X8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ljklw-00087H-Gv
	for alex.bennee@linaro.org; Thu, 20 May 2021 11:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljkbU-00085n-99
 for qemu-arm@nongnu.org; Thu, 20 May 2021 11:28:52 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:46620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljkbR-0000hU-Ur
 for qemu-arm@nongnu.org; Thu, 20 May 2021 11:28:51 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 h3-20020a05600c3503b0290176f13c7715so5482105wmq.5
 for <qemu-arm@nongnu.org>; Thu, 20 May 2021 08:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=nycRzRnC22+MMRKklZmpFxoGXgNbpGqBimi8PnwOL/E=;
 b=AaPDH5X8ibid2VkKdGpr8XjN4Mbsf0ECm3KzJ1doR2AIHpYo2t8vDOOm58xtVGln+V
 tpPV05U6xQOTafqiSzzAy1F1rfZsqN7g1/QOCxMHjtKU6RF9tp4by80HlWzHwASYMvDG
 yksU0+6gI5d+zkTxKXXsaHaQcJrqcB8e1NgxRGNdMAWTiIWRC0LSgRzvA2IhvdOSr8jI
 8S1oPwTMDh3zpPUOi888AtjU2Uz99Sn/f2BPySFHZAqTXrOt+JSbiVBNKwWqEPOqGqUM
 PVRlY34/7QNQiOAC60jqe6djMHQQLiGLD5XUV+lNUPEhlcf30Kg6PRBNEs/udtrgpvgH
 eWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nycRzRnC22+MMRKklZmpFxoGXgNbpGqBimi8PnwOL/E=;
 b=g+fvCtSaPxlpOEYj6eT9PgOxWXx/DeZ7H0SymPvlysyrk/tg2HnfeBFChB9yJDBW/x
 vrMdlIphpKV2D3qkjCIB26UB4GGkg+ZHpG3KAx+NxM2mHYamYXWQ4awwU1asw9EUR5Ql
 T2/DYgbhpA+/sgiUUGSN4wtMJNLGd5DrfDuIoujxfLdXHyZl5SdXtSVJ9GI4H4c3vpjD
 RP02PL7iXA9b7C+fnmA0G6kxVNkProfpvjCGQiro21JeDTuk/xp4kNiOOQoi9ZWoAuHB
 YXsaC2RxtftLaKxNObyLasbR7K8fHdV5XixiD3ZKO0hewmSBHfgTUt5m5doA2GgdniMm
 G12w==
X-Gm-Message-State: AOAM530/KVuQKpJK67+FIGodEp8A5Hbs0yENnwWtxgw0eeT3v2zJB6lU
 frDDuvuzENqDn8LCMnrtKOLFHfdMm1AHq1qF
X-Received: by 2002:a1c:4602:: with SMTP id t2mr4488851wma.173.1621524528475; 
 Thu, 20 May 2021 08:28:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id r2sm3916126wrv.39.2021.05.20.08.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 08:28:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 8/9] target/arm: Enable FPSCR.QC bit for MVE
Date: Thu, 20 May 2021 16:28:39 +0100
Message-Id: <20210520152840.24453-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210520152840.24453-1-peter.maydell@linaro.org>
References: <20210520152840.24453-1-peter.maydell@linaro.org>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hTyVARRAS0en

MVE has an FPSCR.QC bit similar to the A-profile Neon one;
when MVE is implemented make the bit writeable.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/vfp_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index e0886ab5a56..11e1e087e81 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -220,7 +220,8 @@ void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
                                      FPCR_LTPSIZE_LENGTH);
     }
 
-    if (arm_feature(env, ARM_FEATURE_NEON)) {
+    if (arm_feature(env, ARM_FEATURE_NEON) ||
+        cpu_isar_feature(aa32_mve, cpu)) {
         /*
          * The bit we set within fpscr_q is arbitrary; the register as a
          * whole being zero/non-zero is what counts.
-- 
2.20.1

