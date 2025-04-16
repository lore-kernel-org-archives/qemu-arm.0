Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3087915njc;
        Tue, 15 Apr 2025 20:45:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV3Uv9V+bFGgZAFawHPr1Wb+G544OS2qWcBZjyPF6lWiBJXA7TUwR7qbcrfBb3q7/VELjIELeyoc9rdPw==@linaro.org
X-Google-Smtp-Source: AGHT+IHXNqH1bPHSQouHhU9k+JbWFO9q0q48Rt165+lMdmP0KEBtzTkh4xOgiMCAGz0MI3IjquzS
X-Received: by 2002:a05:620a:248d:b0:7c5:55f9:4bbf with SMTP id af79cd13be357-7c918fceb1amr33226985a.7.1744775104458;
        Tue, 15 Apr 2025 20:45:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744775104; cv=none;
        d=google.com; s=arc-20240605;
        b=QywfYrubyEdGcG4BeydVMl4qYj6N3GLiyfmf1/4CzgM6bE2owC+yvrFhWtfk1TeXQc
         b98yZropNBrfdfnmnoSkuFTGG4sUhf1qBllg8nkf3FSfmm+3klN0c9B70uIhbvGB9+xu
         u/2XIr4q+xmYQNlnKSK4H4BHgGct0h/MIfKv7s77YIaHDLXXNETxFSofX4TzztVpJ69M
         FQIJxUL/znl6utET3cTCRpeSlyUa4Ez9cW46ZT875ddES6NOpRTbKF6kA0gyVQppt0Zd
         LmnboclSPYKOVAdcluuaxwthap0xjZ7a6D5ox0yIULi7qwXlNc3rK3emyrYzTtDd4sJO
         RwHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=uub180QPJTmkwEoENx1zMhvdmX3t2SEoJpjuNOM6BzY=;
        fh=9slMQvAVAaDbZF94sUZsatNqTIKawFKtbOHuc7HAk0w=;
        b=Z/fXknNKStO8jji4BjfFgYt6KN8kceMQs8K5d2HCiRN47KlBC1E+QYX3p6OhuqRPA7
         ltNkTscOrJwRvybY7p5yoXTYOU6v+UJ1z2Fd7yBIrT/sxOV3za8bn8f2NnYMqCwT1B2s
         HEteZ6/PURzGBOYA3oqFdIMs/ntEA3RaQYjkKc+AFwIO9t0NTHrir8iX4JjoLSajQc7Q
         GYp4kzPXTuHrMekgoezuUpbdrqI6cYsMirK7pn6pod1Rz1HcP2jl4zn/u0iGuVhiKfHi
         ibH5Jl3/79cw69fVP8BST2HPXKdBrhnq5WLLiBYlHmFIpgFvfyZZ6nXrWF/7Z0m4QRhM
         MAkQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c7a895c971si1145795085a.155.2025.04.15.20.45.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Apr 2025 20:45:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u4th4-0001qZ-Jf; Tue, 15 Apr 2025 23:44:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u4tgv-0001pD-Ez; Tue, 15 Apr 2025 23:44:02 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u4tgo-0006uD-G4; Tue, 15 Apr 2025 23:43:57 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 16 Apr
 2025 11:43:28 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 16 Apr 2025 11:43:28 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <nabihestefan@google.com>
Subject: [PATCH v3 03/10] hw/arm/aspeed: Add vbootrom support on AST2700 EVB
 machines
Date: Wed, 16 Apr 2025 11:43:18 +0800
Message-ID: <20250416034327.315714-4-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416034327.315714-1-jamin_lin@aspeedtech.com>
References: <20250416034327.315714-1-jamin_lin@aspeedtech.com>
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sEMxFB4d1eBd

Introduce a new "vbootrom" field in the AspeedMachineClass to indicate whether
a machine supports the virtual boot ROM region.

Set this field to true by default for the AST2700-A0 and AST2700-A1 EVB
machines.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
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

