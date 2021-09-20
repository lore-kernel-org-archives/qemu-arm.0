Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp2233450lfp;
        Mon, 20 Sep 2021 09:30:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmi7EhRsEUU2JgJxSq3x6gWha3BzJEFZ142fS3xjnLxW6kYIhGYzmjQi9IGhXJiovd9WzU
X-Received: by 2002:a05:6102:1350:: with SMTP id j16mr10840935vsl.54.1632155401098;
        Mon, 20 Sep 2021 09:30:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632155401; cv=none;
        d=google.com; s=arc-20160816;
        b=LEK6NUvcQ5r1vCUKFfVYuUoBgLbeOAM3X/VDaREPP+b9RgP3Nx+fjmAZXpeX9FIezh
         rJPokZe9X8LwMgd+8EiOT9NQ4qzuOhex7vF0q5Sce8RePt2Q5sP8LrVtO8IebUsFQvv6
         JTwU6BzLWoAlHcOZo+5oONwFx00UHCbUPAfAYYclJMGumo8qI3Ii7kSnbChfSsrnhjy+
         L9Dv5WgKPlPJdGUZUlWLtIAdAnk1g4yI3C3F2u9cVkJCeFdJkeY567Vz2ZVFQuO6f/7Q
         8QC0pJx1q8V9dr8ydYtjNo6qKqUB49v498G+03xSuVeEUCvaZa3WGwKDMFh3Chyw1pwS
         j1Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=7R68UIsk3oxOp+ClUMX1wBw8IWP0IitdNhccfmwgqkg=;
        b=pZA/QW5YluHf0ogkRJ6JpVPyyWLqyBgPuAMOLVTewTpN2nLElTgD3iW2+WvR/eMdaP
         Up/0VsX5zjP4My5oB20vpsc4yGxGwEcnCWqj8zHhr38kgTxwtTNhgGnz5VVBfbf4ZoEN
         rd8swqOaqjXH80AKNm7b3ubjip2Y9jEVg0JvEhhzwpC4/hicUnjcYAtxnuPSviq7eL3E
         BjAetPOR4OVdfxNAfoZJxCbSJbEE36LdPBT3mzAqUWyEXhZOi3M0dYhyZZ11eZjHIXfx
         XdrUUgO4eqhA9o2sIelYURKEPqY0JUqZ5PUiuexz9gcPlpugmjbf7YZ6tpseZWZcSOMC
         0ceQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p17si800208vsr.58.2021.09.20.09.30.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Sep 2021 09:30:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mSMB6-000143-Bp
	for alex.bennee@linaro.org; Mon, 20 Sep 2021 12:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSM4g-0005pH-BJ
 for qemu-arm@nongnu.org; Mon, 20 Sep 2021 12:23:22 -0400
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156]:59983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSM4Y-0004B2-PV
 for qemu-arm@nongnu.org; Mon, 20 Sep 2021 12:23:22 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.59])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 5FD722090D;
 Mon, 20 Sep 2021 16:23:12 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 20 Sep
 2021 18:23:11 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00528233694-7470-4f32-b11a-305535cef115,
 C584E5EC745A9DFF7B561FC81DF43D5934FDEC9F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 03/12] aspeed/smc: Stop using the model name for the memory
 regions
Date: Mon, 20 Sep 2021 18:23:00 +0200
Message-ID: <20210920162309.1091711-4-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920162309.1091711-1-clg@kaod.org>
References: <20210920162309.1091711-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e8c2023c-d6d4-4809-9084-0729c4bde326
X-Ovh-Tracer-Id: 13073949721913887526
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudeivddgleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t67umcfHNaS2

There is no real reason to use this name. It's simply nice to have in
the monitor output but it's a burden for the following patch which
removes the AspeedSMCController structure describing the controller.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index def1cb4c74c0..612040493cf1 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -1392,20 +1392,15 @@ static const MemoryRegionOps aspeed_smc_ops = {
  */
 static void aspeed_smc_dma_setup(AspeedSMCState *s, Error **errp)
 {
-    char *name;
-
     if (!s->dram_mr) {
         error_setg(errp, TYPE_ASPEED_SMC ": 'dram' link not set");
         return;
     }
 
-    name = g_strdup_printf("%s-dma-flash", s->ctrl->name);
-    address_space_init(&s->flash_as, &s->mmio_flash, name);
-    g_free(name);
-
-    name = g_strdup_printf("%s-dma-dram", s->ctrl->name);
-    address_space_init(&s->dram_as, s->dram_mr, name);
-    g_free(name);
+    address_space_init(&s->flash_as, &s->mmio_flash,
+                       TYPE_ASPEED_SMC ".dma-flash");
+    address_space_init(&s->dram_as, s->dram_mr,
+                       TYPE_ASPEED_SMC ".dma-dram");
 }
 
 static void aspeed_smc_realize(DeviceState *dev, Error **errp)
@@ -1446,7 +1441,7 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
 
     /* The memory region for the controller registers */
     memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_smc_ops, s,
-                          s->ctrl->name, s->ctrl->nregs * 4);
+                          TYPE_ASPEED_SMC, s->ctrl->nregs * 4);
     sysbus_init_mmio(sbd, &s->mmio);
 
     /*
@@ -1454,12 +1449,12 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
      * window in which the flash modules are mapped. The size and
      * address depends on the SoC model and controller type.
      */
-    snprintf(name, sizeof(name), "%s.flash", s->ctrl->name);
-
     memory_region_init_io(&s->mmio_flash, OBJECT(s),
-                          &aspeed_smc_flash_default_ops, s, name,
+                          &aspeed_smc_flash_default_ops, s,
+                          TYPE_ASPEED_SMC ".flash",
                           s->ctrl->flash_window_size);
-    memory_region_init_alias(&s->mmio_flash_alias, OBJECT(s), name,
+    memory_region_init_alias(&s->mmio_flash_alias, OBJECT(s),
+                             TYPE_ASPEED_SMC ".flash",
                              &s->mmio_flash, 0, s->ctrl->flash_window_size);
     sysbus_init_mmio(sbd, &s->mmio_flash_alias);
 
@@ -1475,7 +1470,7 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < s->ctrl->max_peripherals; ++i) {
         AspeedSMCFlash *fl = &s->flashes[i];
 
-        snprintf(name, sizeof(name), "%s.%d", s->ctrl->name, i);
+        snprintf(name, sizeof(name), TYPE_ASPEED_SMC ".flash.%d", i);
 
         fl->id = i;
         fl->controller = s;
-- 
2.31.1

