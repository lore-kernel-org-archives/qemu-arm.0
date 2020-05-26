Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2700429lfc;
        Tue, 26 May 2020 00:08:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznVk9OcPRlw+kn0tN3P+68LlP66QBfei6W4h7Glo122t3UY2wthjQNVUbY6Jac2055O1wW
X-Received: by 2002:a25:d9d0:: with SMTP id q199mr49396743ybg.196.1590476907457;
        Tue, 26 May 2020 00:08:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590476907; cv=none;
        d=google.com; s=arc-20160816;
        b=z8I5KNjw6BXzdGko2IWdyUATtxt1OmUFvUzhHB/I60Uytzw2YgptWweNIzaa742vOm
         NlIeQ6qIjAU7Trt/V/ZnovZpuNvMeRnXnfwRdiHuHcI7dt4DN4udVMCgiHgazPPsbZJy
         1vxdfZN1S0Kxxy9v6Rq9XfyUAWIJ45bvV+N9t1RnK4IjG/dapuZoy6ERxamiPsjuPc0t
         uW5gkcOLaKMFpKQ2wSnutM3UVEZvCXCUIpOouMasWfyU8gRtImJc4L6/I+aVbC0t6A1L
         pxF1kJeaoYWIYBadcD6Mr5riGdKjvvXtoANG0ir8AO2COfxS8jMpZkjDCDeWfORHrTaN
         SBxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=UYzQmunqkkDLzkPf7Cp8cRfLaPkSsoDW171/QS0WRT4=;
        b=yY9gUwKBmpovZjqcpD9YA2twrY6EGfaa6IZVMNkKKbbWBaudXS8g833AtoM/UQ02cf
         Eqn5HrBRZ7+SFlEXwYw2OaZR3Txh5O3ivZNUOeUmSgDRRDZXpB3C1mVVs1KuPuHjpL2r
         i+ty/FfnkE45HIcBwact6/zRzdn7i/z8uhl2480wICveW6ea+jbV4tWFmJAxcvd2RwJH
         Me7Co+xIKUybc03JXvIT5WMP6I+8q2m/o++F2PcMTduORUXjyp9bDk/6TcaABSu0WDZ7
         paTg4En1KQ8mz7HN6z+TOPahtkrIT57ajcR7NxXjgVa8CcG7mMk48EzjDkiMydrDykCZ
         PPCg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k74si11924258ybk.384.2020.05.26.00.08.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 May 2020 00:08:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jdThK-0002FE-ST
	for alex.bennee@linaro.org; Tue, 26 May 2020 03:08:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jdThE-0002Ef-UA
 for qemu-arm@nongnu.org; Tue, 26 May 2020 03:08:20 -0400
Received: from 7.mo173.mail-out.ovh.net ([46.105.44.159]:46082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jdThD-0002Cm-5X
 for qemu-arm@nongnu.org; Tue, 26 May 2020 03:08:20 -0400
Received: from player157.ha.ovh.net (unknown [10.110.171.50])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id E868E140E17
 for <qemu-arm@nongnu.org>; Tue, 26 May 2020 09:08:16 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player157.ha.ovh.net (Postfix) with ESMTPSA id 5A37112B6207C;
 Tue, 26 May 2020 07:08:05 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006ec754a42-c167-4d29-935e-495ca2ff4d5d,BA58C4C231B6E713CF1CEA232D1729E48FB61414)
 smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2] arm/aspeed: Rework NIC attachment
Date: Tue, 26 May 2020 09:08:02 +0200
Message-Id: <20200526070802.160897-1-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13862079653944396561
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedruddvuddgudduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieekkeelffetgeelveevjeehteduvdeivdeljeevvdeuvedtgfeiudeiveeiudfgnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrudehjedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=46.105.44.159; envelope-from=clg@kaod.org;
 helo=7.mo173.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/26 03:08:17
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
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
X-TUID: +WCM+GOoN4dj

The number of MACs supported by an Aspeed SoC is defined by "macs_num"
under the SoC model, that is two for the AST2400 and AST2500 and four
the AST2600. The model initializes the maximum number of supported
MACs but the number of realized devices is caped by the number of
network device back-ends defined on the command line. This can leave
unrealized devices hanging around in the QOM composition tree.

Modify the machine initialization to define which MACs are attached to
a network device back-end using a bit-field property "macs-mask" and
let the SoC realize all network devices.

The default setting of "macs-mask" is "use MAC0" only, which works for
all our AST2400 and AST2500 machines. The AST2600 machines have
different configurations. The AST2600 EVB machine activates MAC1, MAC2
and MAC3 and the Tacoma BMC machine activates MAC2.

Inactive MACs will have no peer and QEMU will warn the user with :

    qemu-system-arm: warning: nic ftgmac100.0 has no peer
    qemu-system-arm: warning: nic ftgmac100.1 has no peer
    qemu-system-arm: warning: nic ftgmac100.3 has no peer

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed.h |  6 ++++++
 hw/arm/aspeed.c         | 13 +++++++++++++
 hw/arm/aspeed_ast2600.c |  3 +--
 hw/arm/aspeed_soc.c     |  3 +--
 4 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
index 18521484b90e..95b4daece86d 100644
--- a/include/hw/arm/aspeed.h
+++ b/include/hw/arm/aspeed.h
@@ -23,6 +23,11 @@ typedef struct AspeedMachine {
     bool mmio_exec;
 } AspeedMachine;
 
+#define ASPEED_MAC0_ON   (1 << 0)
+#define ASPEED_MAC1_ON   (1 << 1)
+#define ASPEED_MAC2_ON   (1 << 2)
+#define ASPEED_MAC3_ON   (1 << 3)
+
 #define ASPEED_MACHINE_CLASS(klass) \
      OBJECT_CLASS_CHECK(AspeedMachineClass, (klass), TYPE_ASPEED_MACHINE)
 #define ASPEED_MACHINE_GET_CLASS(obj) \
@@ -39,6 +44,7 @@ typedef struct AspeedMachineClass {
     const char *fmc_model;
     const char *spi_model;
     uint32_t num_cs;
+    uint32_t macs_mask;
     void (*i2c_init)(AspeedBoardState *bmc);
 } AspeedMachineClass;
 
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index fd5cc542a584..f8f3ef89d320 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -258,6 +258,7 @@ static void aspeed_machine_init(MachineState *machine)
     DriveInfo *drive0 = drive_get(IF_MTD, 0, 0);
     ram_addr_t max_ram_size;
     int i;
+    NICInfo *nd = &nd_table[0];
 
     bmc = g_new0(AspeedBoardState, 1);
 
@@ -277,6 +278,14 @@ static void aspeed_machine_init(MachineState *machine)
     object_property_set_uint(OBJECT(&bmc->soc), ram_size, "ram-size",
                              &error_fatal);
 
+    for (i = 0; i < sc->macs_num; i++) {
+        if ((amc->macs_mask & (1 << i)) && nd->used) {
+            qemu_check_nic_model(nd, TYPE_FTGMAC100);
+            qdev_set_nic_properties(DEVICE(&bmc->soc.ftgmac100[i]), nd);
+            nd++;
+        }
+    }
+
     object_property_set_int(OBJECT(&bmc->soc), amc->hw_strap1, "hw-strap1",
                             &error_abort);
     object_property_set_int(OBJECT(&bmc->soc), amc->hw_strap2, "hw-strap2",
@@ -556,12 +565,14 @@ static int aspeed_soc_num_cpus(const char *soc_name)
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
@@ -680,6 +691,7 @@ static void aspeed_machine_ast2600_evb_class_init(ObjectClass *oc, void *data)
     amc->fmc_model = "w25q512jv";
     amc->spi_model = "mx66u51235f";
     amc->num_cs    = 1;
+    amc->macs_mask  = ASPEED_MAC1_ON | ASPEED_MAC2_ON | ASPEED_MAC3_ON;
     amc->i2c_init  = ast2600_evb_i2c_init;
     mc->default_ram_size = 1 * GiB;
     mc->default_cpus = mc->min_cpus = mc->max_cpus =
@@ -698,6 +710,7 @@ static void aspeed_machine_tacoma_class_init(ObjectClass *oc, void *data)
     amc->fmc_model = "mx66l1g45g";
     amc->spi_model = "mx66l1g45g";
     amc->num_cs    = 2;
+    amc->macs_mask  = ASPEED_MAC2_ON;
     amc->i2c_init  = witherspoon_bmc_i2c_init; /* Same board layout */
     mc->default_ram_size = 1 * GiB;
     mc->default_cpus = mc->min_cpus = mc->max_cpus =
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index c6821b332257..b912d19f809f 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -461,8 +461,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     }
 
     /* Net */
-    for (i = 0; i < nb_nics && i < sc->macs_num; i++) {
-        qdev_set_nic_properties(DEVICE(&s->ftgmac100[i]), &nd_table[i]);
+    for (i = 0; i < sc->macs_num; i++) {
         object_property_set_bool(OBJECT(&s->ftgmac100[i]), true, "aspeed",
                                  &err);
         object_property_set_bool(OBJECT(&s->ftgmac100[i]), true, "realized",
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index e6f4b59134ba..3ec1257c140b 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -404,8 +404,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     }
 
     /* Net */
-    for (i = 0; i < nb_nics && i < sc->macs_num; i++) {
-        qdev_set_nic_properties(DEVICE(&s->ftgmac100[i]), &nd_table[i]);
+    for (i = 0; i < sc->macs_num; i++) {
         object_property_set_bool(OBJECT(&s->ftgmac100[i]), true, "aspeed",
                                  &err);
         object_property_set_bool(OBJECT(&s->ftgmac100[i]), true, "realized",
-- 
2.25.4

