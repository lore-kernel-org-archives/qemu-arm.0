Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp612338njb;
        Thu, 17 Oct 2024 22:34:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXr5UqilTraNfAqM+Mp+69OfQ4C1bGDxRW5vv16wyfqs4/qKdRdZ51+7qqjnHg6NLo5FFxGbM9RCrM9wg==@linaro.org
X-Google-Smtp-Source: AGHT+IFCYT4xRiih3ZT1wra4z9UiddUz5AUur4qat0p337m741XvkalJKZ3m3DewrF6ZqiDL8JF7
X-Received: by 2002:a05:620a:4622:b0:7ac:e869:b084 with SMTP id af79cd13be357-7b157be6394mr170727685a.47.1729229643182;
        Thu, 17 Oct 2024 22:34:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729229643; cv=none;
        d=google.com; s=arc-20240605;
        b=TOUAKNyi8F5+qfKrGXAwB1PX82ehXcYWWCyUQvF3OTrNlGnxywEpygVk0HIgpGgsSR
         7a++LcEVFRdW/ZAN1IjQGR+zs00yE0TG3Lr7Z81D58+YbfVEo9UBf9dw13FnVZuxtg+o
         J6/02Ws+X8eUdAYaBJ8VRezHv8/pcw9ioiJD4StuXxDupVJ2sWV7DUED5xpxHFEFYdGe
         3UoCC9vVixCMXG0SyT+ZxApmxtJ4SEk57Kkz3lWI7fe+3T6zndB318rZiKEaf4dKBl8l
         avBLQdGDGw0kZavfvW6qvbwmKfLb3SyI2TXf0/fBT4mnqhl/0p4o94ss0m9wDrCDw1HV
         QufA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Rf0c6I/4L4TRXKhkIDHLqfWZrIUGzKCKqSTAO4bgJJQ=;
        fh=RVX+uUL/oYxgKlLpNyiQfzI75/ka+93kXvmeIy2Oap4=;
        b=Os1y9GHhRT1w0+E31BoldDCujJyf75DosKTdv4M9yOhNzy64JbV2+H5VoqL0GPRKkz
         jdcjE6DMmJZjraZPTduQ2PfkyQB2gF23YlJenDoNKOkcChhGuO+pQ/sXtZRG50K2B2YQ
         ZnTt8ml1jKPWfL0myXS5g6HFhd2pjN7hy7n9rl/Kz177Tse7KPR8JIHVMQDqqbeonWyz
         gpqejK2PHFzFfNZS5jzIbq4GV6xO16mvV/GsIcAdRK4ChU55kMTNv10QfAXm9MdML8+8
         a21JzxLwAGwwOlhql0oBPpPH4GQLn0/hxN6DPUx6LP2b36HaFNHA8Qzyx0wMONOdETS7
         ERRQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b15700d1b5si103081385a.717.2024.10.17.22.34.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2024 22:34:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t1faZ-0008O9-7V; Fri, 18 Oct 2024 01:31:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t1faO-0008IH-4V; Fri, 18 Oct 2024 01:31:40 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t1faM-00089Y-IM; Fri, 18 Oct 2024 01:31:39 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 18 Oct
 2024 13:31:14 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 18 Oct 2024 13:31:14 +0800
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
Subject: [PATCH v1 05/16] hw/arm/aspeed: Correct spi_model w25q256 for
 ast1030-a1 EVB.
Date: Fri, 18 Oct 2024 13:31:01 +0800
Message-ID: <20241018053112.1886173-6-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241018053112.1886173-1-jamin_lin@aspeedtech.com>
References: <20241018053112.1886173-1-jamin_lin@aspeedtech.com>
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
X-TUID: GPrx3eKs+iJf

Currently, the default spi_model was "sst25vf032b" whose size was 4MB for
ast1030-a1 EVB. However, according to the schematic of ast1030-a1 EVB,
ASPEED shipped default flash of spi1 and spi2 were w25q256 whose size
was 32MB.

Correct spi_model default flash to w25q256 for ast1030-a1 EVB.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index cf0c6c580b..bf68224295 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1643,7 +1643,7 @@ static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
     amc->i2c_init = ast1030_evb_i2c_init;
     mc->default_ram_size = 0;
     amc->fmc_model = "sst25vf032b";
-    amc->spi_model = "sst25vf032b";
+    amc->spi_model = "w25q256";
     amc->num_cs = 2;
     amc->macs_mask = 0;
     aspeed_machine_class_init_cpus_defaults(mc);
-- 
2.34.1

