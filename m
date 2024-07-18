Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp1260714njk;
        Wed, 17 Jul 2024 23:51:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXmvwNQBR77Mqn1/bxd2SFxQGwDGYCafHXR4l3yf+G5eSZRKwoialdKLnRWVftswOhtHDmu8qpAb/uES/BIII8rFyGXl1Hv
X-Google-Smtp-Source: AGHT+IEF08gkVuuKf4VbYEDHpk2OsQAYO3KSJJGMDgCJEhQ7RugcrQkLkE4iIGeOJkCO/0o8bC8Z
X-Received: by 2002:ad4:5aed:0:b0:6b2:c94d:a02f with SMTP id 6a1803df08f44-6b78ca23012mr53367216d6.13.1721285502941;
        Wed, 17 Jul 2024 23:51:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721285502; cv=none;
        d=google.com; s=arc-20160816;
        b=ZtYCXGkjEMoYYje+8H7J61CDV580htVESz5R2/+X5/QRkKld6eqC8bLDY8E9T5NvMP
         gVe6FJ/BMx82X4b4H09ycfw2czMqSBNX4aFq4jgdSLWY8aOfKAxYObWb/GT8VgYBqejL
         pyTMfAV3LfObbeIUhc2qDZQPnwmnDdZKo22T/Hc/vonsvD3/5/tsSX2MiQZyA2scXrt6
         1WIl8npy4jJbBM5+FPAHP7aAe9/kPcLnv8cxuzMPbbFGep6+eAJwQ4/HhN/f4e/ZG5zr
         KvhG1cxSiagAWDYSxGMQ+1glN7lc9AzXss0zf9i9uNwhuZTkDZxQb+vKj9dkdDtFF7ie
         yt+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=T9kqk/fGFNS8QiWXDQNAw1bU79RDZXVLIXHWQZDCRX8=;
        fh=cqT0Sm0iQHqDiDEsJ3ixFD44Q88e2AVQBWE8a4yA5Ck=;
        b=k951vRL9zrojslt9M/OjqC2cPqFVnGBPw2e2w1xiLAyxrqMi2W4QqcnqxnDhEG1D5g
         0k4/xm0rqCMjjJZIlEsgQKDe7YjqiFMqMOGxsXcpuz96gi8zbq44k/SYfitO6br48mMi
         hZgKtTvqfoX+HHyiEqI/pnFcTNuNuGfbSr9hsG41A4HTPcz/wcoWsjKTmt1q+vb2ReZB
         QHvaDBFnTSOXl+/gHeYwCn0DBBJRzxicKu1s3qsjOejEdx+HW9SZyUMvCM/uSFg1P6Yq
         +g1ggoo+oNMW2wImfUYtgSL1d2gjiKEbFxXK/3jwEsMGH4AL3w1UgN3EYMgxJie9Dh2+
         bxQA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b79c929c61si13642336d6.482.2024.07.17.23.51.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jul 2024 23:51:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sUKzB-0001k3-3I; Thu, 18 Jul 2024 02:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sUKz9-0001OS-3z; Thu, 18 Jul 2024 02:51:27 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sUKz7-0004VA-Fx; Thu, 18 Jul 2024 02:51:26 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 18 Jul
 2024 14:50:18 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 18 Jul 2024 14:50:18 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, "open
 list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 15/15] aspeed: add tmp105 in i2c bus 0 for AST2700
Date: Thu, 18 Jul 2024 14:49:25 +0800
Message-ID: <20240718064925.1846074-16-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240718064925.1846074-1-jamin_lin@aspeedtech.com>
References: <20240718064925.1846074-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: clpkfEQEhAN1

ASPEED SDK add lm75 in i2c bus 0 for AST2700.
LM75 is compatible with TMP105 driver.

Introduce a new i2c init function and
add tmp105 device model in i2c bus 0.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index f8766ea462..ed98758708 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1604,6 +1604,15 @@ static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
 }
 
 #ifdef TARGET_AARCH64
+static void ast2700_evb_i2c_init(AspeedMachineState *bmc)
+{
+    AspeedSoCState *soc = bmc->soc;
+
+    /* LM75 is compatible with TMP105 driver */
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 0),
+                            TYPE_TMP105, 0x4d);
+}
+
 static void aspeed_machine_ast2700_evb_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -1618,6 +1627,7 @@ static void aspeed_machine_ast2700_evb_class_init(ObjectClass *oc, void *data)
     amc->num_cs    = 2;
     amc->macs_mask = ASPEED_MAC0_ON | ASPEED_MAC1_ON | ASPEED_MAC2_ON;
     amc->uart_default = ASPEED_DEV_UART12;
+    amc->i2c_init  = ast2700_evb_i2c_init;
     mc->default_ram_size = 1 * GiB;
     aspeed_machine_class_init_cpus_defaults(mc);
 }
-- 
2.34.1

