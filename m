Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp24898njb;
        Mon, 3 Feb 2025 22:10:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUj4knKROOHrUGH5f8xsfs+P4s5MFzBOt0125mSP1zL9w2NI3pnbAXVZqKjSiljV2r1zEer2Q6q/a24LA==@linaro.org
X-Google-Smtp-Source: AGHT+IEE1E6trVWU76FoFzRyC+2cP4eSoyxzt8gRRwiMb4HETUu/d1ApY4iqwIX9EfQnZ10mRl+p
X-Received: by 2002:a05:620a:19a8:b0:7b6:c540:9531 with SMTP id af79cd13be357-7bffcce8d01mr3966142085a.18.1738649449971;
        Mon, 03 Feb 2025 22:10:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738649449; cv=none;
        d=google.com; s=arc-20240605;
        b=j7IIEgwNpnQwBIEGPtF33fgcgyGzXp+vfO3ZP9Rhr29S6/tCSfwYh/kpdxFQ6xgiPv
         l3s0AWh/B1epW3qfqjelKLQOpYuJ40qLFZUMfRirC+/HGNOy2HHOUPR2ulLGHDZaHMyt
         IANEkv9ylkNRJLnWLsAQlIQ7AfHwWicJfyy5CAE2XrHpM04xt25gNRg/KZ9Aa42+9EyD
         Ckg/f1MXXSaDiJX5Q2OtnQCjuT/VzYKNwS8eFQteic59k7i6Oyqnre5NIQb2RoyrKLOG
         nvPkbdNZIEAei5t4H2mGLzFCQrRqE7NK0HY61mNOCdAbh7V9e4i8wUOt06UxzVCrvXKP
         WGoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=pTac2OiVcbSIXmlsEiXs57LBRRW1Zq28XYHswf1g9yw=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=JaeMrTyiBeA0tBB/Waorit3xoxMIh/ISmEENQb/VyVC2173wyWxeAAREBAxCyw4SL3
         QTreTmAOq5mwSvv/SULfDm+/2Qx74hpx2ij2abT8Ms+QfVbvTaRB07MFK0fzBp06ZL3s
         2b2RbdZ3tOfzLSxAUFeGNHV3TOba67zNLQSf1xeJsdQ3axycnfA8eEUDmrKKQ3Tra+C1
         mAlpP8mjuLHNa+pigMT2OEQL1Xs4zD5VIrPhlpXzQ1PWAbVydm4or9H9kYDzxFcRnAdc
         b4cWpvTI3ETMXwfChkg5NRe9FoBK+EzkNgud/iFjnld8ppIXErEPr4VJVzjSM+ka/AeM
         jAWQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c02db62e89si193623185a.159.2025.02.03.22.10.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2025 22:10:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfC8P-0000Ce-6a; Tue, 04 Feb 2025 01:10:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tfC8M-0000AS-GS; Tue, 04 Feb 2025 01:10:07 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tfC8K-0001kX-5G; Tue, 04 Feb 2025 01:10:06 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 4 Feb
 2025 14:09:55 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 4 Feb 2025 14:09:55 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 1/1] aspeed/soc: Support Non-maskable Interrupt for AST2700
Date: Tue, 4 Feb 2025 14:09:55 +0800
Message-ID: <20250204060955.3546022-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: i4XB5qhTAB/f

QEMU supports GICv3 Non-maskable Interrupt, adds to support Non-maskable
Interrupt for AST2700.

Reference:
https://github.com/qemu/qemu/commit/b36a32ead

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed_ast27x0.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 4114e15ddd..361a054d46 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -470,6 +470,10 @@ static bool aspeed_soc_ast2700_gic_realize(DeviceState *dev, Error **errp)
                            qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
         sysbus_connect_irq(gicbusdev, i + 3 * sc->num_cpus,
                            qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
+        sysbus_connect_irq(gicbusdev, i + 4 * sc->num_cpus,
+                           qdev_get_gpio_in(cpudev, ARM_CPU_NMI));
+        sysbus_connect_irq(gicbusdev, i + 5 * sc->num_cpus,
+                           qdev_get_gpio_in(cpudev, ARM_CPU_VINMI));
     }
 
     return true;
-- 
2.25.1

