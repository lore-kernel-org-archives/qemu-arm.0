Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp358409njc;
        Wed, 7 Aug 2024 19:51:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWxBeDQTR237ddIcVoG2tgsZ05EDuaNj0vv/fMUdbVIKk3f5e9n+k931Xhh1RxCGAFcR2jEjcNJo1IldiU3L2qtkkWnaDyY
X-Google-Smtp-Source: AGHT+IE+X42v/L5NQyjvk3S9NqoTG5hNcG+gxJFcj12eMIlvifmh86uUtbUUYjmNcavUrmbdbmQs
X-Received: by 2002:a05:6214:2d4a:b0:6b7:8be3:3da0 with SMTP id 6a1803df08f44-6bd6bcee4d7mr7147366d6.19.1723085515739;
        Wed, 07 Aug 2024 19:51:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723085515; cv=none;
        d=google.com; s=arc-20160816;
        b=q0HE5onOzhPVQeSbY5dZAX1Jtxx1743VdDXsPoU+n475CGuGonmKmWcubIVH7cJZ4P
         qSWBvH8XgPr2+1VGWq05u2b7Efea4XvKF6pjLCZ7wmpr7qyMFWj0/r6SvTD9dLyiiEnK
         UdqTEkpzCpMdqHKwmwn5v/NIeQuY+7yzRCYSMeZNQqomtwSJuUoLssDhnlem7PGelLn6
         fLda7jEggvd3FkbQmqoo+C1jlbj6ULVQFliK7vLqAs26T6gn4QQ31SFS9UabaL9eRnVq
         eA12/VEuiQH6ItQzI48ksaGa85cMrwQLkDapHdh6VaWt2GAequaWPJU5DNgLQctoX45H
         rYQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=BmN7foCqfG5eKzf0xvui74cqS5dnDD0qMqSHDTMbHds=;
        fh=sVs3p8gbptRv32z9lLYpJL2ORX7RrMh6U4eLBNuVM2U=;
        b=Uvv0yw/iJL/zc79ypHiWdg9JyhtpHkAj11Mhse/Pe3BC6zjvfuHQs76IOs04vntYfo
         6Ds+uw1UEcYrJIUNnume0CvsoUQLhnaGs0pXLP+DyZ7Wo+zEtWkv7wTieOeHDkLPi+26
         KMj2lRSRDtmaW6v12F4lKEMTAqUdl8VchP20hq4om/tPbh5MnXUPH6x8nBSZYuth6FTF
         Vz0BNptFHKqtyJB8TcbZ8rNCJURm3wYhxEaHp1LaonhOAOuS9V6pZJ1ipk388EM7dBcm
         adTW2XWhJS86N3Ajm9XYFDCJrKLQEkv7lVsNFl7hwGbyN+n5eRxazlWCDwW+j6xo53AF
         R09g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bbbb8d03e7si33632616d6.269.2024.08.07.19.51.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2024 19:51:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sbtDw-0008LI-6X; Wed, 07 Aug 2024 22:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sbtDu-0008DF-9B; Wed, 07 Aug 2024 22:49:54 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sbtDs-0008AE-R1; Wed, 07 Aug 2024 22:49:54 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 8 Aug
 2024 10:49:19 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 8 Aug 2024 10:49:19 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, "Wainer dos
 Santos Moschetta" <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC
 here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>
Subject: [PATCH v2 10/11] aspeed: add tmp105 in i2c bus 0 for AST2700
Date: Thu, 8 Aug 2024 10:49:15 +0800
Message-ID: <20240808024916.1262715-11-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240808024916.1262715-1-jamin_lin@aspeedtech.com>
References: <20240808024916.1262715-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: TrpO8R+xZyyN

ASPEED SDK add lm75 in i2c bus 0 for AST2700.
LM75 is compatible with TMP105 driver.

Introduce a new i2c init function and
add tmp105 device model in i2c bus 0.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index fd5603f7aa..3d13b16768 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1650,6 +1650,15 @@ static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
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
@@ -1664,6 +1673,7 @@ static void aspeed_machine_ast2700_evb_class_init(ObjectClass *oc, void *data)
     amc->num_cs    = 2;
     amc->macs_mask = ASPEED_MAC0_ON | ASPEED_MAC1_ON | ASPEED_MAC2_ON;
     amc->uart_default = ASPEED_DEV_UART12;
+    amc->i2c_init  = ast2700_evb_i2c_init;
     mc->default_ram_size = 1 * GiB;
     aspeed_machine_class_init_cpus_defaults(mc);
 }
-- 
2.34.1

