Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2943241njb;
        Tue, 22 Oct 2024 02:43:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXa2aAKf7qoS1Hlu0ypHWzPg9VTJbjPy8b/0rShrySq98P8kuNY6EUOEDwfSHOsMIUQsPYmom8sRZ9cJQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEwDLW7nAnYTeydlp7gIVXyTBhEIgMViYLG/do/qoFYB+rIIxQXidiKCwYxlxDklqXPn3hx
X-Received: by 2002:a05:620a:718e:b0:7b1:5f49:6c10 with SMTP id af79cd13be357-7b15f497c5amr1523988985a.63.1729590207561;
        Tue, 22 Oct 2024 02:43:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729590207; cv=none;
        d=google.com; s=arc-20240605;
        b=MYq2flujxYG0eiPDmtI1Tks12ATS35kF30aXhxfK8UXyFUS7rHiACkxGD3UB9TsCJS
         VxKAPekp8Rc9/HguRQVOCrqbdQjoDFXVNFE3bKP8ALkxmgDS0+zpN0EBB+Y+vRuMkO4U
         CfhqzFBpTWXq02MWmZs+Y/Uvdl5R/3h9o7oKQwGicw5Of6vYMh7Jowowmmyte6n1xEi4
         NMbNIeaM2xNm0auR7w1tpocQI0/ftgNtDECs6g/H9V/1TA0cPo67HLJ0qIh5PSX/NA6N
         KgOMKDfNSk/WkTPti/K1Ur/cPtU+VQTBGs5R2TTEzR4Hocy4Qok2fszkAs9LuG/eWXx7
         tS2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=3GM3QBGN0s54hEylmY7COLaKPofTJBTHUi2eVd7aot8=;
        fh=RVX+uUL/oYxgKlLpNyiQfzI75/ka+93kXvmeIy2Oap4=;
        b=a+UhPwIz2iIzX1j2Y+Cqds5+vqK7moKJ3XxEpbsOXc4RgJrF+f89JAaUAiXUP5X/Ov
         WAxFxn4efE6Wce9x2s9SYBifS+9gefYLzluAeAIFn1x3jXcEcR/cX3EQMeQ72NEl37if
         WMRvkNaDDtsSH57ws4A5QY4whKeUh8jv9Z9K0Jd+02aR8jEfwa4/HHBqGp61tFCGhBIg
         vaRyal0BuIyNNyUED/AJ3O9so6NaL76ayp7iNxqMx5rK7jVWN1Nc0N9Io/xE1Ue7KhMz
         h3W8GUB/bUr6dN/dgfVFBDaJ62gYYioNZpNYzdeYAkq37tyyD22HZGdlkxNOlwNap/j+
         u+ZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b1659cff0esi610186485a.99.2024.10.22.02.43.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2024 02:43:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t3BOl-0002vM-7h; Tue, 22 Oct 2024 05:41:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t3BOg-0002s2-3x; Tue, 22 Oct 2024 05:41:50 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t3BOe-00015E-8i; Tue, 22 Oct 2024 05:41:49 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 22 Oct
 2024 17:41:13 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 22 Oct 2024 17:41:13 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, "Kevin
 Wolf" <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>, "open list:Block layer
 core" <qemu-block@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v2 07/18] aspeed: Fix hardcode attach flash model of spi
 controllers
Date: Tue, 22 Oct 2024 17:40:59 +0800
Message-ID: <20241022094110.1574011-8-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241022094110.1574011-1-jamin_lin@aspeedtech.com>
References: <20241022094110.1574011-1-jamin_lin@aspeedtech.com>
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
X-TUID: oM7BTgt7Vfp2

It only attached flash model of fmc and spi[0] in aspeed_machine_init function.
However, AST2500 and AST2600 have one fmc and two spi(spi1 and spi2)
controllers; AST2700 have one fmc and 3 spi(spi0, spi1 and spi2) controllers.

Besides, it used hardcode to attach flash model of fmc, spi[0] and spi[1] in
aspeed_minibmc_machine_init for AST1030.

To make both functions more flexible and support all ASPEED SOCs spi
controllers, adds a for loop with sc->spis_num to attach flash model of
all supported spi controllers. The sc->spis_num is from AspeedSoCClass.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index b4b1ce9efb..7ac01a3562 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -419,9 +419,11 @@ static void aspeed_machine_init(MachineState *machine)
         aspeed_board_init_flashes(&bmc->soc->fmc,
                               bmc->fmc_model ? bmc->fmc_model : amc->fmc_model,
                               amc->num_cs, 0);
-        aspeed_board_init_flashes(&bmc->soc->spi[0],
-                              bmc->spi_model ? bmc->spi_model : amc->spi_model,
-                              1, amc->num_cs);
+        for (i = 0; i < sc->spis_num; i++) {
+            aspeed_board_init_flashes(&bmc->soc->spi[i],
+                            bmc->spi_model ? bmc->spi_model : amc->spi_model,
+                            amc->num_cs, amc->num_cs + (amc->num_cs * i));
+        }
     }
 
     if (machine->kernel_filename && sc->num_cpus > 1) {
@@ -1579,7 +1581,9 @@ static void aspeed_minibmc_machine_init(MachineState *machine)
 {
     AspeedMachineState *bmc = ASPEED_MACHINE(machine);
     AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(machine);
+    AspeedSoCClass *sc;
     Clock *sysclk;
+    int i;
 
     sysclk = clock_new(OBJECT(machine), "SYSCLK");
     clock_set_hz(sysclk, SYSCLK_FRQ);
@@ -1587,6 +1591,7 @@ static void aspeed_minibmc_machine_init(MachineState *machine)
     bmc->soc = ASPEED_SOC(object_new(amc->soc_name));
     object_property_add_child(OBJECT(machine), "soc", OBJECT(bmc->soc));
     object_unref(OBJECT(bmc->soc));
+    sc = ASPEED_SOC_GET_CLASS(bmc->soc);
     qdev_connect_clock_in(DEVICE(bmc->soc), "sysclk", sysclk);
 
     object_property_set_link(OBJECT(bmc->soc), "memory",
@@ -1599,13 +1604,11 @@ static void aspeed_minibmc_machine_init(MachineState *machine)
                               amc->num_cs,
                               0);
 
-    aspeed_board_init_flashes(&bmc->soc->spi[0],
-                              bmc->spi_model ? bmc->spi_model : amc->spi_model,
-                              amc->num_cs, amc->num_cs);
-
-    aspeed_board_init_flashes(&bmc->soc->spi[1],
+    for (i = 0; i < sc->spis_num; i++) {
+        aspeed_board_init_flashes(&bmc->soc->spi[i],
                               bmc->spi_model ? bmc->spi_model : amc->spi_model,
-                              amc->num_cs, (amc->num_cs * 2));
+                              amc->num_cs, amc->num_cs + (amc->num_cs * i));
+    }
 
     if (amc->i2c_init) {
         amc->i2c_init(bmc);
-- 
2.34.1

