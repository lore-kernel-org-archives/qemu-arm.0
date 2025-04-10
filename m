Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp8125519njd;
        Wed, 9 Apr 2025 19:41:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWqnOz3rgUvq0C5dOddNaerblu7O7xzEElFSRNo3Y1ucv6BXYzom2fXGHVeCK8AaHbKCjruNw/29M/c+w==@linaro.org
X-Google-Smtp-Source: AGHT+IGnaIBvee52hN+MEosvAjPwA+CsZoggjMCV9hDKGTIICiwCJ7wvYHkHI5v50BYS4RpCRtF/
X-Received: by 2002:a05:620a:19a7:b0:7c3:cd78:df43 with SMTP id af79cd13be357-7c7a76d0f60mr154383285a.58.1744252863415;
        Wed, 09 Apr 2025 19:41:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744252863; cv=none;
        d=google.com; s=arc-20240605;
        b=AwXNAT+yPKRj5h7x90zNZ7Vt6suveL3pPYU4eEt60FRE+EGy+SmhjRDxFEK5E2r7iT
         A2RZYb3JI/dfKSOHdC0yAsVhlGW792zIPH/f5w6BH5i0v/O8yYxZffX/rqni0Mb7//th
         UWZe4kOd5VNwghsQUhwaLWXxI3EzHv+hHEQ4hzL6ngl0ScxdA3076qgybv+9aSA4ibIg
         s85wsvo4AW74/DyGAblqV8HNH2F0y+zQOupVJ6TL6BiaP7UH9vvQVJmRpy81bgGex/9H
         BBdwQ+VGaEnyahqQKawm0PZ+pdxFIeSenBBtsmwuwz1cXCaH3kbKQj7fSFxLr/pnwgQd
         E9bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=uub180QPJTmkwEoENx1zMhvdmX3t2SEoJpjuNOM6BzY=;
        fh=9slMQvAVAaDbZF94sUZsatNqTIKawFKtbOHuc7HAk0w=;
        b=U1DfWdo27mDpbUGWS96PAPdhrQC5DnhQFaoG12ncAvwUUXSmTg1JQ68joKzh74s0sv
         nKPsFXPA8ZmWxfMWpdlYEZMvDzDgvuW+vV406JWHShvbYp6VoC59+ryFvoFIfBSklHol
         KC7TlCFTfksM4vNYildyo1OAYYKBui0GjenHFA++ndT0w7hRn5iZeSXVyz2i367/6Iac
         ImubSW1Vo5a+pZ9QvppsmZANlNAW8PQ2xF2lpDxW6wdOqcDCdnKfoIToGgsyn8Zoegs7
         d6WnZDP/mJTAbaPPtC/HUM75oPamizCcTftn0jpwbSxUtCt7lEq4UcEUWwtdu9eX7Dro
         3LQA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c7a89f66c6si22670285a.313.2025.04.09.19.41.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Apr 2025 19:41:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u2hpH-0001dH-JO; Wed, 09 Apr 2025 22:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u2hp5-0001bU-4O; Wed, 09 Apr 2025 22:39:23 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u2hp2-00033O-4w; Wed, 09 Apr 2025 22:39:21 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 10 Apr
 2025 10:38:58 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 10 Apr 2025 10:38:58 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <nabihestefan@google.com>
Subject: [PATCH v2 05/10] hw/arm/aspeed: Enable vbootrom support by default on
 AST2700 EVB machines
Date: Thu, 10 Apr 2025 10:38:49 +0800
Message-ID: <20250410023856.500258-6-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410023856.500258-1-jamin_lin@aspeedtech.com>
References: <20250410023856.500258-1-jamin_lin@aspeedtech.com>
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
X-TUID: YFN2Lq4fRvJa

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

