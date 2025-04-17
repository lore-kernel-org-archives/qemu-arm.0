Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp511897njk;
        Wed, 16 Apr 2025 20:14:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVqMnoi5ePs8XQ1uusU5mJuzoOXhgip8o6ZxLNrHAn8PuIr5jG8tS0Ut+iRe9BHCy04EBWjLDsOnNu3yg==@linaro.org
X-Google-Smtp-Source: AGHT+IEsUs9Gk9mkBKWgMmfK7R07/BnRvjVCeQcn8ihzara16GzdHNTbww1gyAONcm0HDTMlootk
X-Received: by 2002:a05:6214:c21:b0:6e4:2dd7:5c88 with SMTP id 6a1803df08f44-6f2b30829cemr64205516d6.38.1744859671268;
        Wed, 16 Apr 2025 20:14:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744859671; cv=none;
        d=google.com; s=arc-20240605;
        b=WAVR4X6sK1IY4i29IOeMjP/XpaAUVXDZnnoXwKXMsscj0iOCwsQ737hu8ZQgkrE+yb
         r6r8oJqhaLmKB2JqJsZSbwEA8RdZmqhGUJJEqYP6LBAWR9xhJ5MAqrPu5afEYTCqVujv
         zWfw5Thxumu+35ZWKAeZ4R73sTvRmKhnekj+BcWwJpuLOUrLFeJJtLlX4WW4z9KJFyCK
         k2bPNuq9ZfT+qyjLd2pLD02i2Tti4OhEWgkX2VFQqVdcHn6MroqvR2YdOdNsv+MFhL90
         LKK9v5urDXkHgjwpHxb7yKARffeS3hR6ElhbEHKuzbhkN6PsrrG/A+SdroSteWkXithd
         MqbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=gunqLQxrJL45Jak+Dflmnw0MCxQ8S8v4jQeOiO75FKg=;
        fh=9slMQvAVAaDbZF94sUZsatNqTIKawFKtbOHuc7HAk0w=;
        b=IIvjLcdSBbBlJeXMD0+5sERkrbsERaEs1muthxugKAt50ee7rLQXv5rWsIBwogWv4/
         R35sSxTQnFxbVikIClQq4z7rUUnbQTr4EObfYfNYoj2eNEANEjj0SxVxxLzmCuORghE9
         8anVrngO62WtdxgnLXOQG4157m5L77S3ukTR9u9NnSqV5r3DSxbG/fZBMvtfDQ/LnQ/e
         K4PmthpGRSKeNTqk5zWvCFmTeEqz88sbshAoo6RQMBTO+OQc2vWX1nBpgxmmN8MgLzJH
         LatpAKtoe9MzWVIv5XE27uAJsgVQFNwqM0kb4i+jyDKK/RDfkLSP6i3d+Wu/l3YSIvJ5
         D7lQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47ada83e0c9si22536111cf.263.2025.04.16.20.14.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Apr 2025 20:14:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u5Fft-0000rN-62; Wed, 16 Apr 2025 23:12:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u5Ffr-0000pI-VZ; Wed, 16 Apr 2025 23:12:23 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u5Ffq-0000cO-Do; Wed, 16 Apr 2025 23:12:23 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 17 Apr
 2025 11:12:10 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 17 Apr 2025 11:12:10 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <nabihestefan@google.com>
Subject: [PATCH v4 03/10] hw/arm/aspeed: Add vbootrom support on AST2700 EVB
 machines
Date: Thu, 17 Apr 2025 11:12:00 +0800
Message-ID: <20250417031209.2647703-4-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417031209.2647703-1-jamin_lin@aspeedtech.com>
References: <20250417031209.2647703-1-jamin_lin@aspeedtech.com>
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
X-TUID: h7RDXrz42xIJ

Introduce a new "vbootrom" field in the AspeedMachineClass to indicate whether
a machine supports the virtual boot ROM region.

Set this field to true by default for the AST2700-A0 and AST2700-A1 EVB
machines.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Nabih Estefan <nabihestefan@google.com>
Tested-by: Nabih Estefan <nabihestefan@google.com>
---
 include/hw/arm/aspeed.h | 1 +
 hw/arm/aspeed.c         | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
index 9cae45a1c9..973277bea6 100644
--- a/include/hw/arm/aspeed.h
+++ b/include/hw/arm/aspeed.h
@@ -40,6 +40,7 @@ struct AspeedMachineClass {
     void (*i2c_init)(AspeedMachineState *bmc);
     uint32_t uart_default;
     bool sdhci_wp_inverted;
+    bool vbootrom;
 };
 
 
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 82f42582fa..e852bbc4cb 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1689,6 +1689,7 @@ static void aspeed_machine_ast2700a0_evb_class_init(ObjectClass *oc, void *data)
     amc->macs_mask = ASPEED_MAC0_ON | ASPEED_MAC1_ON | ASPEED_MAC2_ON;
     amc->uart_default = ASPEED_DEV_UART12;
     amc->i2c_init  = ast2700_evb_i2c_init;
+    amc->vbootrom = true;
     mc->auto_create_sdcard = true;
     mc->default_ram_size = 1 * GiB;
     aspeed_machine_class_init_cpus_defaults(mc);
@@ -1709,6 +1710,7 @@ static void aspeed_machine_ast2700a1_evb_class_init(ObjectClass *oc, void *data)
     amc->macs_mask = ASPEED_MAC0_ON | ASPEED_MAC1_ON | ASPEED_MAC2_ON;
     amc->uart_default = ASPEED_DEV_UART12;
     amc->i2c_init  = ast2700_evb_i2c_init;
+    amc->vbootrom = true;
     mc->auto_create_sdcard = true;
     mc->default_ram_size = 1 * GiB;
     aspeed_machine_class_init_cpus_defaults(mc);
-- 
2.43.0

