Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1355580njf;
        Tue, 3 Sep 2024 01:37:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVfSkrTHEP6dq4V2TzvROnMJ8ygBwsNSVKYKXFmVWIAyvXephOk2F9sB0XKUFN5bg1xwZ81ZExZYjJNcA==@linaro.org
X-Google-Smtp-Source: AGHT+IGyfaKr6fAG8/LL7k4nwgtUg1a6OD7NeKcTuSE9/v6tHEOTrryhPNFfGQ7KQ7s1qb82lSec
X-Received: by 2002:a05:6902:1243:b0:e13:c773:68c2 with SMTP id 3f1490d57ef6-e1a7a19e5e3mr16704417276.51.1725352628425;
        Tue, 03 Sep 2024 01:37:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725352628; cv=none;
        d=google.com; s=arc-20160816;
        b=1LM+FnDcoe2+QxUh7Z2SXZUPd98NLdmQHHH0C0y5U5MvTvIIAPvI6J8G0yf6lbxCpu
         F4Sc9beBOQo6GdqxCOf5Szmgh/RQEyfsLPMLd0I9bVU3a9mAncwnH4p8bRB+fCDzl4ia
         mLYaPUw2qqeoM/Z9+YHHBcW+qC/xKAkkOVI+FJrVDJfeIjgyGofvzAATW64fWLwF8rFO
         +Eg065bw7hSOmKF85oG1X/sX4xeEhapoVj2ryHrlvv+Azf3Y46ho7pi0ca8v8IRxAdY4
         aSk6DPTpOH3qvPgG8fe1ExaGd1craATmILUHuMy4LyFnAPBzu8KSMAm3St49wJHABKxn
         eQZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=BmN7foCqfG5eKzf0xvui74cqS5dnDD0qMqSHDTMbHds=;
        fh=sVs3p8gbptRv32z9lLYpJL2ORX7RrMh6U4eLBNuVM2U=;
        b=uicNkaTsirSeR2jqIAffNHvoYLjnAg7hCWBDkvV+cq2sobUjp+r/WaEQRabIpVxwWY
         xrORo2h+rONyF2SYu+tVI5qpRACQnEMTDECfMEtjdsMkXOcX7gqdkRivstSngLlcoYbH
         DA1PtF0hkPCRpYQ6ea4dtGNZ7F3OlktCRjW9iCNiovhXsRlZKz8lpTSWstPvYYrWx9FS
         lg339O6Hrj12sXjY+3QGlM1ZprWKdomlJuzL8HzrbzuEhltpH+UG/dUItTaA5n5VbUdE
         hy0NU1/B3q6Lg5MXFCIzCk9tRbjOuAy8CvjECrXHd7mPZifQmdVc6h97YxtL645vAYBt
         CAuw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c350b73713si90233176d6.615.2024.09.03.01.37.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 01:37:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1slP1b-0006ea-Jd; Tue, 03 Sep 2024 04:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1slP19-0004PF-Uh; Tue, 03 Sep 2024 04:36:04 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1slP18-00084x-IA; Tue, 03 Sep 2024 04:36:03 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 3 Sep
 2024 16:35:31 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 3 Sep 2024 16:35:31 +0800
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
Subject: [PATCH v3 10/11] aspeed: Add tmp105 in i2c bus 0 for AST2700
Date: Tue, 3 Sep 2024 16:35:27 +0800
Message-ID: <20240903083528.2182190-11-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240903083528.2182190-1-jamin_lin@aspeedtech.com>
References: <20240903083528.2182190-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: ITDluamr/n4R

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

