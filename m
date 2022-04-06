Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp1042302lfu;
        Wed, 6 Apr 2022 15:35:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTWOtxuULpZgCFM1h5YzVoHsqcASxCtihAs5mqq4m46Og5iB7pjtgVT2N+1vyp1wlxO9OI
X-Received: by 2002:a81:18c7:0:b0:2eb:c207:af80 with SMTP id 190-20020a8118c7000000b002ebc207af80mr1240309ywy.428.1649284530428;
        Wed, 06 Apr 2022 15:35:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649284530; cv=none;
        d=google.com; s=arc-20160816;
        b=sb7+/KIUk+81XTKFM4xKyQT804F/1P4Qwtg2P4Uldj8ztRQxr0iZjbPJ1s3KwR9+UH
         CLOV998RG6QQPo3e8dvgb/2ORubJhrDLKAf8N0jJOul2F6DfpawTPJONUMMTe5P+mPEq
         qphXvAe/OVcTOe1Fc1RknF/OlKys2dBIXUGT07/nUj9YnWKl23jiYTyiGlyEm81y9JIi
         KdoqIDDF1xp+AF5wn8RLvczXTHIcrMfW+kwezZkNaqzT1c1cLp5Un24BxW7HhNGCJFAz
         5wHTxZl5XJxVHYjG8+A3UiLduZjM6lNJvgo6mVDq+IsCKF0C46/ZHngnp3fok/1B+n/S
         Numw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=9EB3ZPVRmttzJqZqt9T8+ZjaBj0Vj3OaCobtZzkS7JY=;
        b=0LvmognKoAuRADci9jdfroHA1tlasJMdp9TIhwW7L+xOwyzgteorhRg3ZNZcd4hssx
         6iGlTIv1ynsroCqo9DfusPg5Sz/45wmIpDDi/1N41seTqWaQAN6B7n6LGreRU8RkbRdb
         uaeEzXDs3AxjRkR9RNrWycmvLbVsiFjTcN5rNLP9ghxYATjFy3bkJau/sKSrmRuFGP/b
         XZBwGMhPQWTkUnff5K2mKR1tizePxZqVqM5l37Tzd1z5LmxutAeDH2NTq07wT5k/dC0f
         /CSU3hJB03mWX8eBZ6KL7P83lpO0uSmbynzilzjJ9RCU2lUPBAIH4twA3ui6ijdHFHwe
         OetA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=laACAI3T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f1-20020a0dc301000000b002e6b8c3298asi12157843ywd.505.2022.04.06.15.35.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Apr 2022 15:35:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=laACAI3T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:43562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncEFM-00030a-RC
	for alex.bennee@linaro.org; Wed, 06 Apr 2022 18:35:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ihVOYggKCAc31ohv0zonvvnsl.jvtxlt1-hytuvunu1.vyn@flex--wuhaotsh.bounces.google.com>)
 id 1ncEEn-0002up-V4
 for qemu-arm@nongnu.org; Wed, 06 Apr 2022 18:34:53 -0400
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049]:64397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ihVOYggKCAc31ohv0zonvvnsl.jvtxlt1-hytuvunu1.vyn@flex--wuhaotsh.bounces.google.com>)
 id 1ncEEm-0004Vu-Gh
 for qemu-arm@nongnu.org; Wed, 06 Apr 2022 18:34:53 -0400
Received: by mail-pj1-x1049.google.com with SMTP id
 n17-20020a17090ac69100b001c77ebd900fso2374937pjt.8
 for <qemu-arm@nongnu.org>; Wed, 06 Apr 2022 15:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=9EB3ZPVRmttzJqZqt9T8+ZjaBj0Vj3OaCobtZzkS7JY=;
 b=laACAI3TvU9JM0p4FrjG7/ZzLtUPln87zQ7ddXl5r6llL3idL4nD9UCzYNhbxz8ou+
 hLd8QhUM7COpNMbsS/lUhpoZuzaWa7Cxfvo8rAMJSy310wGMXviXua8qCQwNdRvMyXhN
 ZspvdU9si5qljqpptXk0aCgHWy/JK5Eis0xgPa53nOYqQSIEiQ13/IGm74hqTTAX5Lwy
 4d8FLX1Iv7MnFYNbTMyFH+JPlyC4bgj3ypleOyt64xzLV+WGArfqkIQ/wfv3NWhc3LS3
 /sBUgzpqkCRfpTbxIBO7vOg07N1NItrOu+P6KYbtOyW6iLZP+am59c2E7D3RS6LqwoEt
 oEpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=9EB3ZPVRmttzJqZqt9T8+ZjaBj0Vj3OaCobtZzkS7JY=;
 b=3z98RnHvTm9iCaCZI0vpvLz9cNiISTdevOTMbaxMlT6kfW1yl8fn4G8dzKU3JvwS36
 qT+P2/hcON9aYGg2jLg3edZ8LWBJEp1r5+Zjy48+jduFScdrdznu9XtLYLFWXCYcKVq+
 QnLAA1BGb7YUJMMVaKJG6qLgtWzAKt3dFKmtm6waXGCy/TAT7To6u0bG5l/KxWrrT+OD
 Mv5zsU4fibIr/lbCO1daLhsCqSUGh+V6YL4XGGZA0yQKnT6T8kdYkEWwgzZeFJZwpUVi
 CIHkebXbVxcqsU9onXWW0Wvdmb5+qRK1sn3OSxoXPLzXvOBgb1iyEabtRZOiwI0Qe/Wh
 gfeg==
X-Gm-Message-State: AOAM531Vi8itOoVcUh2Y9+9naVMRgmKmzqxKbFncBeX7hafUAYzf2tvL
 ITI0EY0gVvULhqf9tXuc9ZT6st0Fro+SUg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a05:6a00:21c2:b0:4fe:81f:46c7 with SMTP
 id t2-20020a056a0021c200b004fe081f46c7mr10977574pfj.5.1649284490631; Wed, 06
 Apr 2022 15:34:50 -0700 (PDT)
Date: Wed,  6 Apr 2022 15:34:40 -0700
In-Reply-To: <20220406223440.2901032-1-wuhaotsh@google.com>
Message-Id: <20220406223440.2901032-3-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220406223440.2901032-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.35.1.1094.g7c7d902a7c-goog
Subject: [PATCH 2/2] hw/arm: Use bit fields for NPCM7XX PWRON STRAPs
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, Uri.Trichter@nuvoton.com, Vishal.Soni@microsoft.com, 
 titusr@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3ihVOYggKCAc31ohv0zonvvnsl.jvtxlt1-hytuvunu1.vyn@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, UPPERCASE_50_75=0.008,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TOa5xRRUtT1k

This patch uses the defined fields to describe PWRON STRAPs for
better readability.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Patrick Venture <venture@google.com>
---
 hw/arm/npcm7xx_boards.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 0678a56156..62d4092657 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -30,11 +30,25 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/block-backend.h"
 
-#define NPCM750_EVB_POWER_ON_STRAPS 0x00001ff7
-#define QUANTA_GSJ_POWER_ON_STRAPS 0x00001fff
-#define QUANTA_GBS_POWER_ON_STRAPS 0x000017ff
-#define KUDO_BMC_POWER_ON_STRAPS 0x00001fff
-#define MORI_BMC_POWER_ON_STRAPS 0x00001fff
+#define NPCM7XX_POWER_ON_STRAPS_DEFAULT (           \
+        NPCM7XX_PWRON_STRAP_SPI0F18 |               \
+        NPCM7XX_PWRON_STRAP_SFAB |                  \
+        NPCM7XX_PWRON_STRAP_BSPA |                  \
+        NPCM7XX_PWRON_STRAP_FUP(FUP_NORM_UART2) |   \
+        NPCM7XX_PWRON_STRAP_SECEN |                 \
+        NPCM7XX_PWRON_STRAP_HIZ |                   \
+        NPCM7XX_PWRON_STRAP_ECC |                   \
+        NPCM7XX_PWRON_STRAP_RESERVE1 |              \
+        NPCM7XX_PWRON_STRAP_J2EN |                  \
+        NPCM7XX_PWRON_STRAP_CKFRQ(CKFRQ_DEFAULT))   \
+
+#define NPCM750_EVB_POWER_ON_STRAPS ( \
+        NPCM7XX_POWER_ON_STRAPS_DEFAULT & ~NPCM7XX_PWRON_STRAP_RESERVE1)
+#define QUANTA_GSJ_POWER_ON_STRAPS NPCM7XX_POWER_ON_STRAPS_DEFAULT
+#define QUANTA_GBS_POWER_ON_STRAPS ( \
+        NPCM7XX_POWER_ON_STRAPS_DEFAULT & ~NPCM7XX_PWRON_STRAP_SFAB)
+#define KUDO_BMC_POWER_ON_STRAPS NPCM7XX_POWER_ON_STRAPS_DEFAULT
+#define MORI_BMC_POWER_ON_STRAPS NPCM7XX_POWER_ON_STRAPS_DEFAULT
 
 static const char npcm7xx_default_bootrom[] = "npcm7xx_bootrom.bin";
 
-- 
2.35.1.1094.g7c7d902a7c-goog

