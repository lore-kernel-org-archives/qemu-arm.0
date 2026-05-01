Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F755CD3423
	for <qemu-arm@archiver.kernel.org>; Fri,  1 May 2026 16:27:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIqhp-0007hy-2S; Fri, 01 May 2026 12:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wIqhl-0007fS-Ia
 for qemu-arm@nongnu.org; Fri, 01 May 2026 12:27:06 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wIqhk-00088y-0Y
 for qemu-arm@nongnu.org; Fri, 01 May 2026 12:27:05 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-48984d29fe3so30661605e9.0
 for <qemu-arm@nongnu.org>; Fri, 01 May 2026 09:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777652822; x=1778257622; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=r/XvK7vLIANXLNEYBnV3CyH3GLQskKOmAzyK3K6rMN8=;
 b=oaFbASJEzkjYPRdnbcDIRevCkQ2mo+5+AQ5VoxGOHurEvwfz45QCaHn0eZWGnapeis
 JCPUVqmpBp6/Z2CNBM6BKXLgLoU/skRn/LwbRMnKXLZlFrQ8z87kakfvO2SaNU77DFar
 TZ6nMsSFwuV7UsZCyDvavK6tFk/EbNjiJS5gF+uBZYMQm7wgdTEkBkoUvJ41Lwl24o2Q
 3lzCflH5IRpAqwV47svNEV3wqySgvcYEVFkC6yB5jKpZZKyp62bEnHV77ljM9+1Ws8GO
 EDD/3d/eNTNc82WLB3Nolm3D5ca/yX7ibau80/kEkHiYvSX6kcPUVAGVT5GD0ws0n8qB
 11HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777652822; x=1778257622;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r/XvK7vLIANXLNEYBnV3CyH3GLQskKOmAzyK3K6rMN8=;
 b=BznevwKzx5vd45djNRZ209iHYcpBrGAy7msrFmivCJ3QB7qpAapHSlomCr7TvWFCiJ
 /kFkgpOdLlHp0T1dxdsBuuatRnfQL+UUZTh0IZHI4BEMX1UdMvHdkp7AlcluIQ/yCndR
 /+PrkPXvviw7MS2HhPTKtJ9qen5l+gYn4QyUfSMhzaEkZ3gM9Mnix+NnEfHN/AJSVfBx
 tLlsEDcxAvHPUvwqLifdj1CDiibr/cLMOb3A33LQeMJ93ngYieTF7icrSHuM0OwCFVYU
 6yZ5KlPXjWl7GzrM8UyMCdAwQpp4YTJDd5sxqnQ/pv9IPZMxgPDHKxNQqLew/1zPEMVu
 0FcQ==
X-Gm-Message-State: AOJu0YzigJ5gJ0vj8wC6UX0vot5mpFw3SL5VIyPNcFObAVjhAb4gSkuv
 NFdHGk7AgfXNOq0xJ9dI/QUpSOzxPCU32keaad8CGD2X7LKwEF4BOivqjTq08988PZohZVKzb+q
 CRq1l
X-Gm-Gg: AeBDievGjWwj3RY2iDAQvwiq0RbVv8SJbP5IXvW66ogxZwEN8QDfm73naCC6W0o3enp
 35jnzLB4Cyr2YcazQjpx/WfiI+CepM5uNE8LZSw2p+feRvmpojTCMIdYrRfNeaGFcSIt+GU2Cp6
 e4psEMCjfEbD5ZUN8WUEPwDJkMfptb//vG8UAljMIVWjxSwH+gjcvqVRZCDECgy8FgJmM3LXOq7
 6o+OTVMobC1XwKba1w/MLD21lontYg/iS/DR9tYdOXDBDU7snoDUs/R3Xo7ElZuQR/WNO2Mu4C/
 iGycvHDgc+Gcyd1iv9oeJHhyQc4R+z+WubgI26ZvTDGucIGAbb4wx65NSIsL57q+rDHkesFhuoM
 dMYc2pRBWikGBONOD95rHSQ4j/0x1oCfJLcoQFQmL3g2S7YM06q5gt1c2QlST8GhY7qDmG5frJb
 /a7mj69Zu9t6W2d4JOdP8QH/xqg1qsLj8RnfgQjbuyv88zqxA+GRB8gaaKUs9Lb1KY16R6rkuBX
 yyvwJKyRwhGR4f48JMTKVmlKQUzPCumpE1HbYS1hg==
X-Received: by 2002:a05:600c:1907:b0:488:c683:be89 with SMTP id
 5b1f17b1804b1-48a83d6ee9dmr133144235e9.9.1777652821930; 
 Fri, 01 May 2026 09:27:01 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8feb6647sm16297535e9.16.2026.05.01.09.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2026 09:27:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] hw/misc/bcm2835_rng: Specify valid memory access sizes
Date: Fri,  1 May 2026 17:27:00 +0100
Message-ID: <20260501162700.4092512-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

The BCM2835 RNG has 32-bit registers only; specify this in
the MemoryRegionOps so wrong-sized accesses are rejected rather
than getting to the assertions in the read and write functions.

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3394
Fixes: 54a5ba13a9f ("target-arm: Implement BCM2835 hardware RNG")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/bcm2835_rng.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/misc/bcm2835_rng.c b/hw/misc/bcm2835_rng.c
index e4d2c224c8..bd4acade5b 100644
--- a/hw/misc/bcm2835_rng.c
+++ b/hw/misc/bcm2835_rng.c
@@ -93,6 +93,8 @@ static const MemoryRegionOps bcm2835_rng_ops = {
     .read = bcm2835_rng_read,
     .write = bcm2835_rng_write,
     .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
 };
 
 static const VMStateDescription vmstate_bcm2835_rng = {
-- 
2.43.0


