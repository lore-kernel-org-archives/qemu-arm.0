Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp245598ejd;
        Tue, 16 Apr 2024 02:20:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUpwfKlGa/PN7dyWny/enCB1fR5HJILTCKQjBjL7ox3S2qOTEyICqChvUL3dvu5NrWnAtxPsjhsIuMWIq/inwQc+oLlUeWw
X-Google-Smtp-Source: AGHT+IGIeTw4lZdBDy9W2ZjixGtUZhXebbMwKVu75C825MfQ7ptHmLBP1Q0OF4/xoe9WRIKmmDhO
X-Received: by 2002:ac8:5f84:0:b0:436:f4d3:dcc4 with SMTP id j4-20020ac85f84000000b00436f4d3dcc4mr5724392qta.68.1713259230419;
        Tue, 16 Apr 2024 02:20:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713259230; cv=none;
        d=google.com; s=arc-20160816;
        b=EYGuekbAFJL/iPKDT87iP92ieDVauYc7SR5PMXUSYH5CT0Art1FsiUMmM49+5x5Rbf
         3I8ALXNr1HVOWVheYmA8n1vkUgctf0pCrDVVpejv8jnaub6P837kEOOqwnc14c/ka580
         oHEv1EjFBaNw8tcP/EDejlnK97rLfYXjQIe31lCeGuM0spbS/ilYOOb4NSx4Ie8fSTaT
         VqUav+fF2Ab7ZIFhbzMqm67Rf3yHGsjsH+RpyeOlDEiZaMwTQLH87TRR6b7KaLoHEXBI
         FfZ+IrDsarMw4slnqGhcRDI5WCkCP8JQQq8B82ujtYS/XYYM78EzY1NlbtNV22OqvDbI
         M9fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=xtoou42ri1bcWFxwekqZ4ziNtsPZaWWNKegWBArfxWU=;
        fh=4qsXPuPQQYwauqV4GBfUuJ135n2gY4LbnQu8KHliids=;
        b=tdqlatC9bUBMa5wrxvyMVZ3vipdRJ2jHMVJxhGKBU3Or/MouA1h3jsjAuJcX1CMGxx
         /KUOnSoCRHrH6JqHgLVL8pGBAeKAZN2vJak9ncdW5fhE2Sj4mQsBIOzTHAlr9ocE65rD
         X1Q1pEcYN0bdQtHQC55EBezAyGD1NJmkY88taK+BLLaWJJdwc2UHgN/LgCTrwoTVjAW+
         I8E8XZEO8sKmLxUD/EKDRWqIY5NvMLodt+UIWXKjUr9ju+2WK1UOFU2dHXfJrueMzedB
         T2QMHDl9AIV4pmxOw214ao5PT+OmiismB2/cj8MLpXGxX0R3zT/ym84pW1+kg/3IIAND
         y/Kg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z17-20020ac87f91000000b00436a015912esi9484876qtj.482.2024.04.16.02.20.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Apr 2024 02:20:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rwez9-00031O-DO; Tue, 16 Apr 2024 05:20:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1rweyd-0002fY-50; Tue, 16 Apr 2024 05:19:46 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1rweyZ-0007Zt-Ac; Tue, 16 Apr 2024 05:19:41 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 17:19:07 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 16 Apr 2024 17:19:07 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v3 06/16] aspeed/smc: correct device description
Date: Tue, 16 Apr 2024 17:18:53 +0800
Message-ID: <20240416091904.935283-7-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240416091904.935283-1-jamin_lin@aspeedtech.com>
References: <20240416091904.935283-1-jamin_lin@aspeedtech.com>
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
X-TUID: jbI0fUvNPDa5

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/ssi/aspeed_smc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 6e1a84c197..8a8d77b480 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -1448,7 +1448,7 @@ static void aspeed_2500_fmc_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     AspeedSMCClass *asc = ASPEED_SMC_CLASS(klass);
 
-    dc->desc               = "Aspeed 2600 FMC Controller";
+    dc->desc               = "Aspeed 2500 FMC Controller";
     asc->r_conf            = R_CONF;
     asc->r_ce_ctrl         = R_CE_CTRL;
     asc->r_ctrl0           = R_CTRL0;
@@ -1486,7 +1486,7 @@ static void aspeed_2500_spi1_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     AspeedSMCClass *asc = ASPEED_SMC_CLASS(klass);
 
-    dc->desc               = "Aspeed 2600 SPI1 Controller";
+    dc->desc               = "Aspeed 2500 SPI1 Controller";
     asc->r_conf            = R_CONF;
     asc->r_ce_ctrl         = R_CE_CTRL;
     asc->r_ctrl0           = R_CTRL0;
@@ -1521,7 +1521,7 @@ static void aspeed_2500_spi2_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     AspeedSMCClass *asc = ASPEED_SMC_CLASS(klass);
 
-    dc->desc               = "Aspeed 2600 SPI2 Controller";
+    dc->desc               = "Aspeed 2500 SPI2 Controller";
     asc->r_conf            = R_CONF;
     asc->r_ce_ctrl         = R_CE_CTRL;
     asc->r_ctrl0           = R_CTRL0;
-- 
2.25.1

