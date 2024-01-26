Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp876924ejc;
        Fri, 26 Jan 2024 05:33:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+bK9rfg4xEfXXdXJgvbwyV8bOPZ6P12D9yaCBnSmfYCxpNNSoeaZN4blqrGbtIge7pBqp
X-Received: by 2002:a05:622a:24b:b0:42a:7169:4359 with SMTP id c11-20020a05622a024b00b0042a71694359mr2524693qtx.66.1706275993371;
        Fri, 26 Jan 2024 05:33:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706275993; cv=none;
        d=google.com; s=arc-20160816;
        b=YLPty3WQ89c0ka0pr/Nj8lzeLeIPnl2o62nre0eoaDs8+VUJ4OFW8wD2fSocDK5QcS
         3MmNsOdpKhkOtOnJxdJWQgbLzQ2w3Ujxljt21hU3BiSOxGHne5hx0YJhDCFtolJkShJC
         QIOAt5S7T1jNT848svqctNMAuAJdrOrztID+IDWJRFRrHf1Oh0t5RutzO71XPb/1seDt
         WgJFezmfHVm35rUTRfqMm2fwmCUJgYy73j5ln2TZW3KJgz96ouNpofmR8K2C2HHqOoE8
         EgJX27QY3Zcbdgorj/Sd8Bn9ANT9PateZGnt8ujAFS0QvdbgK/H0EFqloP5/nJ3PQjxU
         TjOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=9D25eCE6OjsqpFMSAcIqOWGsmbhZ7nRgxuYpmTvUa7o=;
        fh=P8iU9h9QL5MVD5FNMLApbGIr2HIUMfQ4K17hbdoLV+0=;
        b=WXAYY0mmNDaMg3qu7qMbHQ4RdIlRI1ggaqZMUpNKJ1aKkVD2maG3kNCVTcn/HnKGZ0
         ipa4ttCfdbaQUbb/YFsBc0eFrh8bR0tjzJKvHvEuOt1O+8x8QS3JIWb3VfY2o6wypU30
         yfSq6iQa8Q1ieeUV88wESv88R793rL/GJPbxs000WCi8qeaDLCt6cy1XWbH+YREQaphr
         RnwIfGOTwHo7cO/LuxLSLT+p6VS+NwStpoWVb2FF+5t3bxo9Ov3aDGwYbGlG05GsBhRJ
         TjqSoR/UToMYyZymtmhcPvtrkNbOqX7amrDY6Qx5bLZOdw8tIoeYx2oXIVGOJMl5Ywv7
         nhOg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e6-20020ac85dc6000000b0042a1c512c64si1264300qtx.225.2024.01.26.05.33.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 05:33:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rTMK0-0002uD-Fu; Fri, 26 Jan 2024 08:32:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5gEp=JE=kaod.org=clg@ozlabs.org>)
 id 1rTMJw-0002iQ-D3; Fri, 26 Jan 2024 08:32:36 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5gEp=JE=kaod.org=clg@ozlabs.org>)
 id 1rTMJu-0007zT-DO; Fri, 26 Jan 2024 08:32:35 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TLzC36c0Bz4wbp;
 Sat, 27 Jan 2024 00:32:31 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TLzC2144Wz4wx5;
 Sat, 27 Jan 2024 00:32:29 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Gavin Shan <gshan@redhat.com>
Subject: [PULL 03/17] hw/arm/aspeed: Set default CPU count using
 aspeed_soc_num_cpus()
Date: Fri, 26 Jan 2024 14:32:02 +0100
Message-ID: <20240126133217.996306-4-clg@kaod.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126133217.996306-1-clg@kaod.org>
References: <20240126133217.996306-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=5gEp=JE=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3UQ0R4dBb0rS

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Since commit b7f1a0cb76 ("arm/aspeed: Compute the number
of CPUs from the SoC definition") Aspeed machines use the
aspeed_soc_num_cpus() helper to set the number of CPUs.

Use it for the ast1030-evb (commit 356b230ed1 "aspeed/soc:
Add AST1030 support") and supermicrox11-bmc (commit 40a38df55e
"hw/arm/aspeed: Add board model for Supermicro X11 BMC") machines.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 4bc292ff84fc..5b01a4dd28f8 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1212,6 +1212,8 @@ static void aspeed_machine_supermicrox11_bmc_class_init(ObjectClass *oc,
     amc->macs_mask = ASPEED_MAC0_ON | ASPEED_MAC1_ON;
     amc->i2c_init  = palmetto_bmc_i2c_init;
     mc->default_ram_size = 256 * MiB;
+    mc->default_cpus = mc->min_cpus = mc->max_cpus =
+        aspeed_soc_num_cpus(amc->soc_name);
 }
 
 static void aspeed_machine_supermicro_x11spi_bmc_class_init(ObjectClass *oc,
@@ -1586,11 +1588,12 @@ static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
     mc->init = aspeed_minibmc_machine_init;
     amc->i2c_init = ast1030_evb_i2c_init;
     mc->default_ram_size = 0;
-    mc->default_cpus = mc->min_cpus = mc->max_cpus = 1;
     amc->fmc_model = "sst25vf032b";
     amc->spi_model = "sst25vf032b";
     amc->num_cs = 2;
     amc->macs_mask = 0;
+    mc->default_cpus = mc->min_cpus = mc->max_cpus =
+        aspeed_soc_num_cpus(amc->soc_name);
 }
 
 static void aspeed_machine_qcom_dc_scm_v1_class_init(ObjectClass *oc,
-- 
2.43.0

