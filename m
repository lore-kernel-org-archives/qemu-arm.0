Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp205811njc;
        Thu, 14 Nov 2024 01:50:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWIzGcaG9K1ztbl1OBaqeA88u2gTGwEnIHzuA9HiBT+EGBSroeNBYcYcdbmcil/4ZfWBTXu8wqxZDN59g==@linaro.org
X-Google-Smtp-Source: AGHT+IHMkj1WK58Gs9Hwu0LvNd9SgmZO+s+7Aljuj/0AUNKwprc7Jf9SX0VuAjxWuvlPb5ci+DbW
X-Received: by 2002:a0c:f209:0:b0:6cc:a17:ba65 with SMTP id 6a1803df08f44-6d3dd073ab3mr83106466d6.39.1731577810837;
        Thu, 14 Nov 2024 01:50:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731577810; cv=none;
        d=google.com; s=arc-20240605;
        b=Twh8HmSYTjisNnIaXFpj0l9icoYudhQkaCNlaLQ98AVaKjYxvxA6D43hrNO5drfLzJ
         8Nev3eDmwUz23B2/LBeKvUhxLrDIZvuWc60Y/CRQ7YfCI9LVq4m3xpMDEOW+h+WX40zM
         xlX+TJn/rj0VLve1mIfB/G9nttr+OAamEJcsCNyt593QyU+4PsIeomcx7TMfpATYKs9n
         20U6rsZ6j2sDBYtxrOM41NMJ95OsDkWDpvSfBMtkU6n4ATudE7opxzJXo5pw6ShQcjMa
         z1O1fzGj5cCj/qQSx/F5FV+plaI41my+t+tM3osW8a9QO1FIoJ2+4HkNcmzgDDD8PBMJ
         un7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=srwT36a1dEm+DWPAXk4bFaWJ05tOSxutZC64GkVhh0c=;
        fh=4rHsaFhVkVMXk5u1IVZO4usPBujjRbqK1KMv0eZ+6CI=;
        b=kvHLDRlEM5FHBrv8ya5bqSj2F6e4tH0GaDN11vuK/E1Uyezyx6F+W7vDbJref6p1Mn
         38+d1UW1B4zPM656pf2oBmMwtz1RN9K2ckaH61EN0houLwgE0UhQKzhlDkf6fSCrSZ/g
         KqtPiJgER0bqqJdKzXeeMaGfLx5V4htUHa4IrRspPW4mcj0rujU02gTZrzSCNANjpuhT
         8KPaLtQttBi/CgQSgTfSVY6LHUfQTM+ge1yKi+9crF1QvfAnoY7G1SB+mVGEHTqRKdZD
         61LE919YO8SyYDhjWRFh+AtRYAJAV0Pno8PzWWOGFu9qCCaguo/+MvmdoVMxuFfd8Awc
         RBTw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d3ee75e7efsi8306256d6.82.2024.11.14.01.50.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2024 01:50:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tBWTU-0002Sn-G9; Thu, 14 Nov 2024 04:49:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tBWTQ-0002Qy-Ah; Thu, 14 Nov 2024 04:49:12 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tBWTO-0000F8-N8; Thu, 14 Nov 2024 04:49:11 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 14 Nov
 2024 17:48:40 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 14 Nov 2024 17:48:40 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Bin Meng <bmeng.cn@gmail.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:SD (Secure Card)" <qemu-block@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v3 3/3] hw/arm/aspeed: Invert sdhci write protected pin for
 AST2600 EVB
Date: Thu, 14 Nov 2024 17:48:39 +0800
Message-ID: <20241114094839.4128404-4-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241114094839.4128404-1-jamin_lin@aspeedtech.com>
References: <20241114094839.4128404-1-jamin_lin@aspeedtech.com>
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
X-TUID: /N/2bdMsqDKi

The Write Protect pin of SDHCI model is default active low to match the SDHCI
spec. So, write enable the bit 19 should be 1 and write protected the bit 19
should be 0 at the Present State Register (0x24).

According to the design of AST2600 EVB, the Write Protected pin is active
high by default. To support it, introduces a new "sdhci_wp_inverted"
property in ASPEED MACHINE State and set it true for AST2600 EVB
and set "wp_inverted" property true of sdhci-generic model.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 hw/arm/aspeed.c         | 7 +++++++
 include/hw/arm/aspeed.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 6ca145362c..a58b7160cd 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -413,6 +413,12 @@ static void aspeed_machine_init(MachineState *machine)
                              OBJECT(get_system_memory()), &error_abort);
     object_property_set_link(OBJECT(bmc->soc), "dram",
                              OBJECT(machine->ram), &error_abort);
+    if (amc->sdhci_wp_inverted) {
+        for (i = 0; i < bmc->soc->sdhci.num_slots; i++) {
+            object_property_set_bool(OBJECT(&bmc->soc->sdhci.slots[i]),
+                                     "wp-inverted", true, &error_abort);
+        }
+    }
     if (machine->kernel_filename) {
         /*
          * When booting with a -kernel command line there is no u-boot
@@ -1419,6 +1425,7 @@ static void aspeed_machine_ast2600_evb_class_init(ObjectClass *oc, void *data)
     amc->num_cs    = 1;
     amc->macs_mask = ASPEED_MAC0_ON | ASPEED_MAC1_ON | ASPEED_MAC2_ON |
                      ASPEED_MAC3_ON;
+    amc->sdhci_wp_inverted = true;
     amc->i2c_init  = ast2600_evb_i2c_init;
     mc->default_ram_size = 1 * GiB;
     aspeed_machine_class_init_cpus_defaults(mc);
diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
index cbeacb214c..9cae45a1c9 100644
--- a/include/hw/arm/aspeed.h
+++ b/include/hw/arm/aspeed.h
@@ -39,6 +39,7 @@ struct AspeedMachineClass {
     uint32_t macs_mask;
     void (*i2c_init)(AspeedMachineState *bmc);
     uint32_t uart_default;
+    bool sdhci_wp_inverted;
 };
 
 
-- 
2.34.1

