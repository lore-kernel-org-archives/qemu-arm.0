Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1649444ejb;
        Fri, 24 May 2024 05:09:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUC2iMb7pJf23kWVRyKP/oeo51EDD5D87VLHvB9c60ZuZ18Uuio0ZiRN1KZoziDgrcjPh/TCEq7oCZhPVfoIGOG+nBMPsPL
X-Google-Smtp-Source: AGHT+IFyAj0K0v38OpzN9Y8sKSj7AFUu05tMTo+uO0mqkolmDEX5546LG6Ipzfan4ZnCq/ZRKhu3
X-Received: by 2002:a05:6870:61c8:b0:24c:63b2:8a18 with SMTP id 586e51a60fabf-24ca113a555mr1998865fac.7.1716552578605;
        Fri, 24 May 2024 05:09:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716552578; cv=none;
        d=google.com; s=arc-20160816;
        b=qn+or0rauRBZgjbWo8OBVUbmGxzk5uDT9LhLeTPimyLVUnymyy4ylZFMDx3AVMzn3G
         Vf++RsFvTPOwGA7suwVYv5dE34RbuUMfwC4XyX403Ly+vhwKfq2gVK2BEustGZBgQW81
         t0P9iY1tWW3r2oxn9f9dHDpCVbJdx8i6gCa0eHlbDEIjooABUyWKcPxLV3h3SDpZVpSy
         fD3pcfSvlbgqlOivMknmKMlNEvGOUirR1uWZwrTE69YotsUG3PvtCGRXvRdWzRjY0v3m
         NjzL9k4vOjOcAedDMW4E/t91tJz8nMATJWV2LtHxQQvcQYFXJR9PajChEvvnGBAqTuRg
         va+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=BjvxBg66/fynTWN4L7/dDPcD/UDFX5YMkKyDaGBrMGM=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=LQlCtxWpVbPdcfWzM8PdXqSYgXziYTo1ODa/Jrt97OcYxRpSSalJ21b0PChhFv/1z2
         qBEjP9+YI5UIZgzAfNjhbVwi3W4I3gQIcKDXohlkKQ2lxePMynBOUEZ+o9l2cn+1kUDv
         X2+t5PPOqkJIELqWW6eMsvLmrbGGQTYjBUzz625AsZN7/BOsCVqIJOiz18lFoKJGg47z
         XJVO+SDx8nQ/f9W+Go8JZfOo7GiLkdx90qHb61ebBM6PRUpZYzmGE3uWW2FnpiWbgrUL
         cLDcDCRNx/TKkqDknvFdx1akf7LIPm81MPHuz/+kmvy+CeqHHFpTKqI6PJMRgchU3a9D
         cF/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb18b1e4bsi16977871cf.471.2024.05.24.05.09.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2024 05:09:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sATj9-0002lQ-PA; Fri, 24 May 2024 08:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1sATj7-0002kh-AF; Fri, 24 May 2024 08:08:49 -0400
Received: from dedi548.your-server.de ([85.10.215.148])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1sATj4-0006ZQ-LZ; Fri, 24 May 2024 08:08:49 -0400
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by dedi548.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96.2) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1sATj0-000J11-03; Fri, 24 May 2024 14:08:42 +0200
Received: from [82.100.198.138] (helo=mail.embedded-brains.de)
 by sslproxy02.your-server.de with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1sATj0-000C5h-2H; Fri, 24 May 2024 14:08:42 +0200
Received: from localhost (localhost [127.0.0.1])
 by mail.embedded-brains.de (Postfix) with ESMTP id 974D54801F2;
 Fri, 24 May 2024 14:08:41 +0200 (CEST)
Received: from mail.embedded-brains.de ([127.0.0.1])
 by localhost (zimbra.eb.localhost [127.0.0.1]) (amavis, port 10032)
 with ESMTP id vWXQ3figPuJE; Fri, 24 May 2024 14:08:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.embedded-brains.de (Postfix) with ESMTP id 4DD474801F8;
 Fri, 24 May 2024 14:08:41 +0200 (CEST)
X-Virus-Scanned: amavis at zimbra.eb.localhost
Received: from mail.embedded-brains.de ([127.0.0.1])
 by localhost (zimbra.eb.localhost [127.0.0.1]) (amavis, port 10026)
 with ESMTP id oY3qNgFyYF-h; Fri, 24 May 2024 14:08:41 +0200 (CEST)
Received: from zimbra.eb.localhost (unknown [192.168.96.242])
 by mail.embedded-brains.de (Postfix) with ESMTPSA id 123E3480197;
 Fri, 24 May 2024 14:08:41 +0200 (CEST)
From: Sebastian Huber <sebastian.huber@embedded-brains.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 1/2] hw/arm/xilinx_zynq: Add cache controller
Date: Fri, 24 May 2024 14:08:36 +0200
Message-Id: <20240524120837.10057-2-sebastian.huber@embedded-brains.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240524120837.10057-1-sebastian.huber@embedded-brains.de>
References: <20240524120837.10057-1-sebastian.huber@embedded-brains.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Authenticated-Sender: smtp-embedded@poldi-networks.de
X-Virus-Scanned: Clear (ClamAV 1.0.3/27285/Fri May 24 10:30:55 2024)
Received-SPF: pass client-ip=85.10.215.148;
 envelope-from=sebastian.huber@embedded-brains.de; helo=dedi548.your-server.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2gHSgRN3f6CB

The Zynq 7000 SoCs contain a CoreLink L2C-310 cache controller.  Add the
corresponding Qemu device to the xilinx-zynq-a9 machine.

Signed-off-by: Sebastian Huber <sebastian.huber@embedded-brains.de>
---
 hw/arm/Kconfig       | 1 +
 hw/arm/xilinx_zynq.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 8b97683a45..1ad60da7aa 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -370,6 +370,7 @@ config ZYNQ
     select A9MPCORE
     select CADENCE # UART
     select PFLASH_CFI02
+    select PL310 # cache controller
     select PL330
     select SDHCI
     select SSI_M25P80
diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index fc3abcbe88..0abb62f131 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -241,6 +241,7 @@ static void zynq_init(MachineState *machine)
     busdev =3D SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(busdev, &error_fatal);
     sysbus_mmio_map(busdev, 0, MPCORE_PERIPHBASE);
+    sysbus_create_varargs("l2x0", MPCORE_PERIPHBASE + 0x2000, NULL);
     sysbus_connect_irq(busdev, 0,
                        qdev_get_gpio_in(DEVICE(cpu), ARM_CPU_IRQ));
     sysbus_connect_irq(busdev, 1,
--=20
2.35.3

