Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp106586njj;
        Tue, 29 Oct 2024 02:18:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX641PgXhbwo3DEv9eo9jMs67EHerwbB8Foom6renX6QdaW/xsJNrzxqYzGbpXBV+VwMnYy7eIo+/Ppww==@linaro.org
X-Google-Smtp-Source: AGHT+IFYu5R+8QN6xhfMUi5x43/kh4C9d36kF3Z7tm0b+nZkqoJkHMRSJnu3242KYHG/KEpBPVq6
X-Received: by 2002:a05:6214:2b96:b0:6cd:69bd:ad06 with SMTP id 6a1803df08f44-6d1858686f0mr154940976d6.50.1730193526927;
        Tue, 29 Oct 2024 02:18:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730193526; cv=none;
        d=google.com; s=arc-20240605;
        b=EjN+XPP9Qm88iHIGaNqpCrtSokMmSykw+qDfLOyKjnrCLPCceyW60fpzV8FcpULNdN
         mz1Hj/ZzLWV7kX+sHSpwlirsZ7aeXoyTKYOvgWzO5GB+yDeDoMwduYroEBWOMKiN3fKs
         ZdYrjoRGz0jomnK8ocmSoNqI4ne7mFAUrnBeX4TcSmZYb8Eh+VcsBaJgqGbXY86w6MQz
         Eajtc5DeoML4PgLKjmcv6lmD7iA9HzimlMoKU9rW+t+83WloScDffOCtrQgG3RxQKH31
         8SQsmcC94pVSBvplbT3K+irqgmOtuBkXSVFhqt1yCeNV68kxwu/LWEprcoWEZkYrLDeZ
         3y6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=UhkVrS0rS0sZ03idlQa7XgfqumOjwCDXYwep7+nV23c=;
        fh=4rHsaFhVkVMXk5u1IVZO4usPBujjRbqK1KMv0eZ+6CI=;
        b=H1dPga/Ge65/RXCR2Oh4MTKo9l3lYBBdU5km0Aw29701dhKy6bhdKexu+ZulTMgdTz
         qeO7tzlgLi05AuuvQ18UV/KKfHBQ3xfBg5D9cFLm06JpIPerXKwkauQ6ngT55VpFEXv3
         s8sUkh/D90/k+ke+lAbUtj5gme9cYYPNOlKpunfmdsYF2twvJ1YrmGxaMvEVaE7j3OQ4
         W8o56KmK9/H+y+edU7YFQwFUzny/A+0bG6sg2czVD+ZLA67pWfNAqsaKGtyfPL7m+p7e
         XRdrd5yFDR0GFZgSkVf9WYrzn5Jk5wwzlcsQxIBkyhdod7FbjTbXPQ7aMQyXNAveYQkM
         AMxQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d179908772si105963456d6.165.2024.10.29.02.18.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Oct 2024 02:18:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t5iMg-0000dX-Mb; Tue, 29 Oct 2024 05:18:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t5iMT-0000bY-Fm; Tue, 29 Oct 2024 05:18:04 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t5iMS-0003A3-1d; Tue, 29 Oct 2024 05:18:01 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 29 Oct
 2024 17:17:31 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 29 Oct 2024 17:17:31 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Bin Meng <bmeng.cn@gmail.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:SD (Secure Card)" <qemu-block@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 7/8] hw/arm/aspeed: Invert sdhci write protected pin for
 AST2600 and AST2500 EVBs
Date: Tue, 29 Oct 2024 17:17:28 +0800
Message-ID: <20241029091729.3317512-8-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029091729.3317512-1-jamin_lin@aspeedtech.com>
References: <20241029091729.3317512-1-jamin_lin@aspeedtech.com>
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
X-TUID: 6e9Y5mSGeD+6

The Write Protect pin of SDHCI model is default active low to match the SDHCI
spec. So, write enable the bit 19 should be 1 and write protected the bit 19
should be 0 at the Present State Register (0x24).

According to the design of AST2500 and AST2600 EVBs, the Write Protected pin
is active high by default. To support it, introduces a new sdhci_wp_invert
property in ASPEED MACHINE state and set it true for AST2500 and AST2600 EVBs
and set "wp_invert" property true of sdhci-generic model.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed.c         | 8 ++++++++
 include/hw/arm/aspeed.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index b4b1ce9efb..0468602d95 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -403,6 +403,12 @@ static void aspeed_machine_init(MachineState *machine)
                              OBJECT(get_system_memory()), &error_abort);
     object_property_set_link(OBJECT(bmc->soc), "dram",
                              OBJECT(machine->ram), &error_abort);
+    if (amc->sdhci_wp_invert) {
+        for (i = 0; i < bmc->soc->sdhci.num_slots; i++) {
+            object_property_set_bool(OBJECT(&bmc->soc->sdhci.slots[i]),
+                                     "wp-invert", true, &error_abort);
+        }
+    }
     if (machine->kernel_filename) {
         /*
          * When booting with a -kernel command line there is no u-boot
@@ -1308,6 +1314,7 @@ static void aspeed_machine_ast2500_evb_class_init(ObjectClass *oc, void *data)
     amc->fmc_model = "mx25l25635e";
     amc->spi_model = "mx25l25635f";
     amc->num_cs    = 1;
+    amc->sdhci_wp_invert = true;
     amc->i2c_init  = ast2500_evb_i2c_init;
     mc->default_ram_size       = 512 * MiB;
     aspeed_machine_class_init_cpus_defaults(mc);
@@ -1409,6 +1416,7 @@ static void aspeed_machine_ast2600_evb_class_init(ObjectClass *oc, void *data)
     amc->num_cs    = 1;
     amc->macs_mask = ASPEED_MAC0_ON | ASPEED_MAC1_ON | ASPEED_MAC2_ON |
                      ASPEED_MAC3_ON;
+    amc->sdhci_wp_invert = true;
     amc->i2c_init  = ast2600_evb_i2c_init;
     mc->default_ram_size = 1 * GiB;
     aspeed_machine_class_init_cpus_defaults(mc);
diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
index cbeacb214c..879bdb96ee 100644
--- a/include/hw/arm/aspeed.h
+++ b/include/hw/arm/aspeed.h
@@ -39,6 +39,7 @@ struct AspeedMachineClass {
     uint32_t macs_mask;
     void (*i2c_init)(AspeedMachineState *bmc);
     uint32_t uart_default;
+    bool sdhci_wp_invert;
 };
 
 
-- 
2.34.1

