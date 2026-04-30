Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6227AFF887E
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 00:26:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIF9r-0006d9-Kd; Wed, 29 Apr 2026 20:21:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIF9d-0006Rd-8f
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:21:23 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIF9a-0006HL-Pi
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:21:20 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-83178c0f29cso252470b3a.0
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 17:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777508476; x=1778113276; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l1WOBWWcejd4Njf8YCai59IybtK3LPcoz1EYaWphZqM=;
 b=bh8jZectGnzuw6SYS2izxM3PLcfC6dztcO+y3NBxd8c80vjg2fI+n40lBiriFUz+a+
 1tP5jfSfDucxKBrRn2zt9ULPHiTQAFN3yk1sT92cYC0+IyDO/QSAuMlw+a2BgUc1SppX
 ZBD1G0ivXCDRHnfmM6SPWJobFtRsc11JpmSxa1u2NTDjy/34zpNE398aELWN0pPtD8jd
 Y8+K4ol/SINLWShXE1YHucU+2fZhi3i+FVDSVNDiXtHnv0kVUxKUO6PzCYBfgB7/0Vdi
 gWdh7gz1s467jcwI+FT6ZyLCOHqd657M8Yr/IL1OGXrb0iocQfTqVXPOsBnt7KSLyGhb
 SNMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777508476; x=1778113276;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=l1WOBWWcejd4Njf8YCai59IybtK3LPcoz1EYaWphZqM=;
 b=Vjwp0QQCY4xGxDAtBTuMLs50X0BcQZ7N3izMEHX7gXldrc8+TlU5c97dYgS4EdtKri
 ISpdaZ1Nl6PMfKMffsIGC/AXG17pf6pbA98a+4KDY7597fjdanEeWUVMbUmJ4dw5jd8S
 onkjhkjseTntYfWa3dsAM1+mdH61CEq+4Dxb+o/hnOf7QUxGfR+tFsDn1z/WBnExNrHa
 9VfZndiBzcS/w/4U7sK+xcLiq9kOODSxa+GqVXtC8ByeiXKdICAMsUCT7tR7meMHO0V4
 wBY9ZQMPiWi/HOCMLaZFLWpXrMgG/kkOukgu1iTbIFZh1qvxaAGRGRiWlZKdJYDE7qVR
 Gu4w==
X-Gm-Message-State: AOJu0YxQoJMXMV/poRNR+KKxb5vNAMTz0aIYrY2fVP8YIruODIiynUMw
 03Ga2vkcAge1hn0tgnbERxivft+P8avhwRfYM2ssoHiaXcLCup5348W2s68Cldt4rwwCRMje5IG
 YRFYTsSI=
X-Gm-Gg: AeBDieuP1voWQLg6Hn69bdSh1WkcpGIrh3W+5X/APLdcObuljUgQ6I+T++D3qec99Gi
 RsjYpIcTnbLr6FgQK73hYNu4rCYWLwDiQlv7nlgXGZ9ZFZ44+CbFUzqvOEbvzDQjylN6duOuW7U
 5Bj7JX2nmyPjwl8SwJZXQROT+2WPbXMfF24XBh27jx28aN3dujXb2en9qY/WH8r+qlHx6VcZW4J
 bG0/eD6z53WPsNTRbELKrBm6ujCoQManDbu+v7HbnhXV0lQr7pQKbMEbM26s42Rxkulq1S4VBGE
 RbtBs4MuYy7BZiRNvmunL2CcJLQkFu01ykZzhifGOVRm4R6Ew6QFfG6Cc+mujfRNZ0KTg4k49ut
 K4X5DSQVyycbPrGuUG4pG8e99bO0gsUhSWcNWj5EmF3YsaB/VZG+wtKD0jJPjmuPoFz9UlGzdRO
 RUN4oxyLY6yAbG3XU7MbBY0OIZErK90DAFL6T5xZbY
X-Received: by 2002:a05:6a00:22cc:b0:82f:280a:d888 with SMTP id
 d2e1a72fcca58-834fdb2b63dmr913671b3a.12.1777508476492; 
 Wed, 29 Apr 2026 17:21:16 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-834ed5cd3b8sm3461727b3a.16.2026.04.29.17.21.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2026 17:21:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 11/47] target/arm: Clear FPMR on ResetSVEState
Date: Thu, 30 Apr 2026 10:20:10 +1000
Message-ID: <20260430002046.59739-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430002046.59739-1-richard.henderson@linaro.org>
References: <20260430002046.59739-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

FPMR is cleared when entering or exiting Streaming Mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7a17fd39e5..6263a3cb3b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4836,6 +4836,7 @@ static void arm_reset_sve_state(CPUARMState *env)
     /* Recall that FFR is stored as pregs[16]. */
     memset(env->vfp.pregs, 0, sizeof(env->vfp.pregs));
     vfp_set_fpsr(env, 0x0800009f);
+    env->vfp.fpmr = 0;
 }
 
 void aarch64_set_svcr(CPUARMState *env, uint64_t new, uint64_t mask)
-- 
2.43.0


