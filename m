Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp33540njb;
        Wed, 4 Dec 2024 00:06:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV/sesO430kWKiYlF7q36ivzg8YHeQGHuZ9HYrnZs1uozW00Me2509YkujWOnKLHOcWMxNdNQTBFrCRuQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGGeQb0rz19q+byJ+z4MRo1/DQksvQghTSEiaHB+WfTljmfNvynz0/T+fT+mQv7GQjOjWER
X-Received: by 2002:a05:620a:4620:b0:7a9:c24e:4df8 with SMTP id af79cd13be357-7b6a61ac70bmr601183285a.44.1733299606305;
        Wed, 04 Dec 2024 00:06:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733299606; cv=none;
        d=google.com; s=arc-20240605;
        b=FsavQyZqJLhNwgg6DsBaKuCoMMUofI4l+w+F4xfsqT6Ph1ZZyc821QSDzGuV+3ogYU
         PtK7yE4GETl+35NK3Xvi0piNrNNUCqRx5KtGeVI+jWc8b5KmGLRMVlV0i2tln7j0E+xj
         TMMfIvSy0ahkvNs6REYrXtU+7WBUQg/vhc5D9NKS2QkyJf37qbAHQkO11Wgi6TduLoUQ
         S1hMBoJqaCuRNKC1XSwhN9mhA/VQG066E7Q/Vo5Q/GWqarCvHfBsuZLiLRioS1QQ7fSa
         AVBV8ydQwW006Io/vIKD5Ck3bHQ0GdcNtoJSWVL6jmBeEwaza/GT8HchthTt1Dq916br
         xeww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Sdj27LjMpSo7UuDMbnBHmV99BByF7NAieVVXloNuVow=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=aGmEIfE2xLlipO6fxtzUTLZRZV2jPEyj91kCuAqEO7jgrD/YN+UKiVLcoixgRD0idv
         rCSYHnCRnq/naI1ctabhjOXGEF0fanZpbDhKqdUY96quOv+fDnOx9EH+IjP21BA2yT6O
         vnDYMASZU+6IpBAhZBwpjRgCmsFGWBl2AlKIJFduJcgcm/R1xkvXLEfeBvvdZ5K/BtcA
         uEuEv2z/CKufZ2UMcte/1TUjr9M+LWJHMc/d2kiYh5D0Uqtm/fW5bh9Sx1LzZURVe0pF
         ybmE6/lSHbsKds0GKt66mDj0mZtvkyruqbm+05zRKAaYmuPEyQvxmqxZ+Z2Q3veo1t6/
         U1IA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6849c0967si1674373985a.378.2024.12.04.00.06.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2024 00:06:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIkOJ-0004DH-HG; Wed, 04 Dec 2024 03:05:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tIkOE-0004CF-24; Wed, 04 Dec 2024 03:05:43 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tIkOB-00082v-0q; Wed, 04 Dec 2024 03:05:41 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 4 Dec
 2024 16:05:24 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 4 Dec 2024 16:05:24 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v3 2/7] hw/arm/aspeed: Fix coding style
Date: Wed, 4 Dec 2024 16:05:18 +0800
Message-ID: <20241204080523.4025780-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241204080523.4025780-1-jamin_lin@aspeedtech.com>
References: <20241204080523.4025780-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sJ16wdv4s0tH

Fix coding style issues from checkpatch.pl.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed_ast2600.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index be3eb70cdd..c40d3d8443 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -541,7 +541,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
         return;
     }
-    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->gpio), 0, sc->memmap[ASPEED_DEV_GPIO]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->gpio), 0,
+                    sc->memmap[ASPEED_DEV_GPIO]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_GPIO));
 
-- 
2.34.1

