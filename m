Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp4184654lfb;
        Tue, 19 May 2020 09:20:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwngmYz7vny/OmCIKmcdXdDWkp9mLSR7JAgO6uHieEeyHVt8qN4U66/AiYEvs+XQb7oGuVv
X-Received: by 2002:aed:2d02:: with SMTP id h2mr499290qtd.83.1589905229667;
        Tue, 19 May 2020 09:20:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589905229; cv=none;
        d=google.com; s=arc-20160816;
        b=vc6ePlajYhCnkw/ERgDN7r9u/rbfu+xvv3E9+DftecTXNGkF/lYK3mctu0dgP5Kn/h
         ZuS9LFy+RiYC+pI+XazN0YTtpW9VwI0xBJ2wgP82o/vKOn1HYjeM7bMhE2B0rdE0nVsJ
         PCokNIkmM8F7CdddF1lOOvAe50fj4bQDsXpY4/nChfaJDPVU88e3c0noPKEIi046MldH
         YOf8bLHdZzYWAXtVcLTp6b0RcJg+QUbVDnvLW8wcmbSOOkgtb6VE+ga5O4OFGpWhq2qV
         222uYydniAciILmLVDCFWXiw0hnieh55845cf0RmZmT+d1PkCmZA0i/kaJZco6qyBeQf
         DZ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=h6dEByxl9FFm8JrTLyVUnNfmX54oPtMcJSlqXEJnWRs=;
        b=MF7Qg9l9wwOJqr25awojTVIBEj8I3nlo0C5jncpAuYQb1GwgSiAWCogE5UaQM3I6M1
         qsXR7XqJwBQoWMiX/6tShWw5KFjV1NE0kWP+zEaLdXdeIpromIng0d27EjA7bsy4IhDD
         DW68smhclzCmjQ5BXjGqbzQ6wvdkDHzSNy6J9X0lpeVWs6KJI5NKA/ZvDbvrrOmUuz1q
         sHDGvbVrPxWp4iiAPRfzrvQD1kt4vKJzTqVjQcKdfOgV5zPYPhg79LhPh+n1Uye8LaLO
         lpKyWDNt7O4ycp5XHQFs8pZjDlvl1SggZaMnPbJ/QyhyzyZI3/TOxffVVNfJ5jMYHfUs
         FsZg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i23si174165qkl.11.2020.05.19.09.20.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 May 2020 09:20:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jb4yj-00075i-3x
	for alex.bennee@linaro.org; Tue, 19 May 2020 12:20:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jb4yT-000731-RV
 for qemu-arm@nongnu.org; Tue, 19 May 2020 12:20:13 -0400
Received: from 6.mo3.mail-out.ovh.net ([188.165.43.173]:34579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jb4yQ-0007jy-Hq
 for qemu-arm@nongnu.org; Tue, 19 May 2020 12:20:12 -0400
Received: from player696.ha.ovh.net (unknown [10.108.57.38])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id F09D5250BC2
 for <qemu-arm@nongnu.org>; Tue, 19 May 2020 18:20:07 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player696.ha.ovh.net (Postfix) with ESMTPSA id 72DC812938A03;
 Tue, 19 May 2020 16:19:59 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R00652b81922-5089-440c-ac07-4a2fd88bd71a,3DCE2E61E2D7C1BA27EF92566E0C35A5904F621F)
 smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] arm/aspeed: Rework NIC attachment
Date: Tue, 19 May 2020 18:19:57 +0200
Message-Id: <20200519161957.1056027-1-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 519884282638732049
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedruddtjedgleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeegtddutdeugeefvefhhfdvgefhjeffvedvtefhkeeiheffhfdvffelleegvdenucffohhmrghinhepohiilhgrsghsrdhorhhgnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieeliedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=188.165.43.173; envelope-from=clg@kaod.org;
 helo=6.mo3.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/19 12:20:08
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9bbq4rnqA9gy

The AST2400 and AST2500 SoCs have two MACs but only the first MAC0 is
active on the Aspeed machines using these SoCs. The AST2600 has four
MACs. The AST2600 EVB machine activates MAC1, MAC2 and MAC3 and the
Tacoma BMC machine activates MAC2.

Introduce a bit-field property "macs-mask" under the Aspeed SoC model
to link the active MACs of the machine being started with the available
network devices.

Inactive MACs will have no peer and QEMU will warn the user with :

    qemu-system-arm: warning: nic ftgmac100.0 has no peer
    qemu-system-arm: warning: nic ftgmac100.1 has no peer
    qemu-system-arm: warning: nic ftgmac100.3 has no peer

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---

 To be applied on top of patch "arm/aspeed: Compute the number of CPUs
 from the SoC definition" 
 
 http://patchwork.ozlabs.org/project/qemu-devel/patch/20200519091631.1006073-1-clg@kaod.org/
 
 include/hw/arm/aspeed.h     |  1 +
 include/hw/arm/aspeed_soc.h |  6 ++++++
 hw/arm/aspeed.c             |  6 ++++++
 hw/arm/aspeed_ast2600.c     | 11 ++++++++---
 hw/arm/aspeed_soc.c         | 10 ++++++++--
 5 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
index 18521484b90e..842dff485f5b 100644
--- a/include/hw/arm/aspeed.h
+++ b/include/hw/arm/aspeed.h
@@ -39,6 +39,7 @@ typedef struct AspeedMachineClass {
     const char *fmc_model;
     const char *spi_model;
     uint32_t num_cs;
+    uint32_t macs_mask;
     void (*i2c_init)(AspeedBoardState *bmc);
 } AspeedMachineClass;
 
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 914115f3ef77..fdb9e05bc47c 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -34,6 +34,11 @@
 #define ASPEED_CPUS_NUM  2
 #define ASPEED_MACS_NUM  4
 
+#define ASPEED_MAC0_ON   (1 << 0)
+#define ASPEED_MAC1_ON   (1 << 1)
+#define ASPEED_MAC2_ON   (1 << 2)
+#define ASPEED_MAC3_ON   (1 << 3)
+
 typedef struct AspeedSoCState {
     /*< private >*/
     DeviceState parent;
@@ -55,6 +60,7 @@ typedef struct AspeedSoCState {
     AspeedSDMCState sdmc;
     AspeedWDTState wdt[ASPEED_WDTS_NUM];
     FTGMAC100State ftgmac100[ASPEED_MACS_NUM];
+    uint32_t macs_mask;
     AspeedMiiState mii[ASPEED_MACS_NUM];
     AspeedGPIOState gpio;
     AspeedGPIOState gpio_1_8v;
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 6f8f4b88f8ab..79c683864d7e 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -283,6 +283,8 @@ static void aspeed_machine_init(MachineState *machine)
                             &error_abort);
     object_property_set_int(OBJECT(&bmc->soc), amc->num_cs, "num-cs",
                             &error_abort);
+    object_property_set_int(OBJECT(&bmc->soc), amc->macs_mask, "macs-mask",
+                            &error_abort);
     object_property_set_link(OBJECT(&bmc->soc), OBJECT(&bmc->ram_container),
                              "dram", &error_abort);
     if (machine->kernel_filename) {
@@ -556,12 +558,14 @@ static int aspeed_soc_num_cpus(const char *soc_name)
 static void aspeed_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
 
     mc->init = aspeed_machine_init;
     mc->no_floppy = 1;
     mc->no_cdrom = 1;
     mc->no_parallel = 1;
     mc->default_ram_id = "ram";
+    amc->macs_mask = ASPEED_MAC0_ON;
 
     aspeed_machine_class_props_init(oc);
 }
@@ -680,6 +684,7 @@ static void aspeed_machine_ast2600_evb_class_init(ObjectClass *oc, void *data)
     amc->fmc_model = "w25q512jv";
     amc->spi_model = "mx66u51235f";
     amc->num_cs    = 1;
+    amc->macs_mask  = ASPEED_MAC1_ON | ASPEED_MAC2_ON | ASPEED_MAC3_ON;
     amc->i2c_init  = ast2600_evb_i2c_init;
     mc->default_ram_size = 1 * GiB;
     mc->default_cpus = mc->min_cpus = mc->max_cpus =
@@ -698,6 +703,7 @@ static void aspeed_machine_tacoma_class_init(ObjectClass *oc, void *data)
     amc->fmc_model = "mx66l1g45g";
     amc->spi_model = "mx66l1g45g";
     amc->num_cs    = 2;
+    amc->macs_mask  = ASPEED_MAC2_ON;
     amc->i2c_init  = witherspoon_bmc_i2c_init; /* Same board layout */
     mc->default_ram_size = 1 * GiB;
     mc->default_cpus = mc->min_cpus = mc->max_cpus =
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 114b94f8f44d..fa85122f6d78 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -247,6 +247,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
     Error *err = NULL, *local_err = NULL;
     qemu_irq irq;
+    NICInfo *nd = &nd_table[0];
 
     /* IO space */
     create_unimplemented_device("aspeed_soc.io", sc->memmap[ASPEED_IOMEM],
@@ -462,8 +463,12 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     }
 
     /* Net */
-    for (i = 0; i < nb_nics && i < sc->macs_num; i++) {
-        qdev_set_nic_properties(DEVICE(&s->ftgmac100[i]), &nd_table[i]);
+    for (i = 0; i < sc->macs_num; i++) {
+        if ((s->macs_mask & (1 << i)) && nd->used) {
+            qemu_check_nic_model(nd, TYPE_FTGMAC100);
+            qdev_set_nic_properties(DEVICE(&s->ftgmac100[i]), nd);
+            nd++;
+        }
         object_property_set_bool(OBJECT(&s->ftgmac100[i]), true, "aspeed",
                                  &err);
         object_property_set_bool(OBJECT(&s->ftgmac100[i]), true, "realized",
@@ -471,7 +476,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
         error_propagate(&err, local_err);
         if (err) {
             error_propagate(errp, err);
-           return;
+            return;
         }
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->ftgmac100[i]), 0,
                         sc->memmap[ASPEED_ETH1 + i]);
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 984d29087dce..d2c6a5760790 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -234,6 +234,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     AspeedSoCState *s = ASPEED_SOC(dev);
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
     Error *err = NULL, *local_err = NULL;
+    NICInfo *nd = &nd_table[0];
 
     /* IO space */
     create_unimplemented_device("aspeed_soc.io", sc->memmap[ASPEED_IOMEM],
@@ -405,8 +406,12 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     }
 
     /* Net */
-    for (i = 0; i < nb_nics && i < sc->macs_num; i++) {
-        qdev_set_nic_properties(DEVICE(&s->ftgmac100[i]), &nd_table[i]);
+    for (i = 0; i < sc->macs_num; i++) {
+        if ((s->macs_mask & (1 << i)) && nd->used) {
+            qemu_check_nic_model(nd, TYPE_FTGMAC100);
+            qdev_set_nic_properties(DEVICE(&s->ftgmac100[i]), nd);
+            nd++;
+        }
         object_property_set_bool(OBJECT(&s->ftgmac100[i]), true, "aspeed",
                                  &err);
         object_property_set_bool(OBJECT(&s->ftgmac100[i]), true, "realized",
@@ -455,6 +460,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
                        aspeed_soc_get_irq(s, ASPEED_SDHCI));
 }
 static Property aspeed_soc_properties[] = {
+    DEFINE_PROP_UINT32("macs-mask", AspeedSoCState, macs_mask, 0x1),
     DEFINE_PROP_LINK("dram", AspeedSoCState, dram_mr, TYPE_MEMORY_REGION,
                      MemoryRegion *),
     DEFINE_PROP_END_OF_LIST(),
-- 
2.25.4

