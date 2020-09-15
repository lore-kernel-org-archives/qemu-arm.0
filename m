Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2877596lfq;
        Mon, 14 Sep 2020 22:49:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTZVNswd25IikCIQfnwJ9yDBeVSsycW4T7L2SwixS9Yh97Y0XMBzrVMk7lWcmzWVUDJ/a8
X-Received: by 2002:a37:b4e:: with SMTP id 75mr15118942qkl.137.1600148963891;
        Mon, 14 Sep 2020 22:49:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600148963; cv=none;
        d=google.com; s=arc-20160816;
        b=WUt1HBPJ6i8xcfgWbrAIp1Nq8wrKslbPI+cs73h66KXfhY65Pl32ciGdil4a1Sfu3P
         tvL9N5DUB/2ed3RnRVkmvrMopXyV9j9vU0KKpYnpk5OY5qior5U4jqjlyffG30zRFs0p
         6RbdUU2Gn9UXcAAZVH76Vc9nAOoydIuj5+KRGCLyb0NtT008Nj4tpNTuhCSxeZ+bL/tf
         lZ7/2MA9i7Zb8LKtikPtqMuElQb1x64+aVi5ABaKgT3cxQNs64Sr94KUhDa3AiWyqf5W
         G3D7S2NqWm6EK2PCGE4H1Ec2wfuxocOihtdqZR2fHO4WO8JE7aD/bX58A+jP5j+A5q91
         5pLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=w4LtmgU8lWUBGuekPIHSQEzfqaUb8iEj2adOoklUKk8=;
        b=x5QpesqXZVXCUetC+3DQtod4p62bR52+FmY7Thy+vvuSuy6pbi3Mkk0Vw2Q7cOykHo
         NHntc15w09fBfLdjV9PBHHhm4Fh1jYiANBnp7ZXJNi25UnlYP59dhfgoXWDGLldTs/1k
         C5xfsoqwwhriXb/OG4bJJ6TNOUU6lz3w5yMhj4rNkCqoExmzmxryi9qA3tDDXw+ce4tm
         vHJFvbGfY3YC6tMDUQXQS5kkBGqE6dum16wcKj4OYoPcgUZtlrJiRRbv85U4SnMkK+XB
         /mxK7R9R1OaR8g4Tgrzy6zQSGcvuAhmPLWXJN1YaCdu2wuVeNVo664uelH4DXKP5Egw2
         inrw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bn5si8434721qvb.108.2020.09.14.22.49.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Sep 2020 22:49:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kI3qF-0006ln-Bg
	for alex.bennee@linaro.org; Tue, 15 Sep 2020 01:49:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kI3q9-0006lb-7V; Tue, 15 Sep 2020 01:49:17 -0400
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:57063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kI3q6-00014d-Mv; Tue, 15 Sep 2020 01:49:16 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.109])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id DF66061A6974;
 Tue, 15 Sep 2020 07:49:02 +0200 (CEST)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 15 Sep
 2020 07:49:01 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006628f802f-45f1-44ca-bf65-d8dde91bcc08,
 9746AEA542B49782F630A24C3A5DB92DD62FF7A2) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2] hw/arm/aspeed: Add machine properties to define the flash
 models
Date: Tue, 15 Sep 2020 07:48:59 +0200
Message-ID: <20200915054859.2338477-1-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: cfde7c95-1dd1-4537-8a96-84e3f0337c8d
X-Ovh-Tracer-Id: 6182879341085952873
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrudeijedgleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffogggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedvuedtvdeikeekuefhkedujeejgffggffhtefglefgveevfeeghfdvgedtleevnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/15 01:49:04
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?=E9=83=81=E9=9B=B7?= <yulei.sh@bytedance.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NMrB+/aB29mU

Some machines don't have much differences a part from the flash model
being used. Introduce new machine properties to change them from the
command line.

For instance, to start the ast2500-evb machine with a different FMC
chip and a 64M SPI chip, use :

  -M ast2500-evb,fmc-model=mx25l25635e,spi-model=mx66u51235f

Cc: 郁雷 <yulei.sh@bytedance.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Message-Id: <20200910200715.1920318-1-clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 docs/system/arm/aspeed.rst | 18 +++++++++++++++
 hw/arm/aspeed.c            | 45 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 61 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 45f891eb3cad..2d33d023453e 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -83,3 +83,21 @@ The image should be attached as an MTD drive. Run :
 
   $ qemu-system-arm -M romulus-bmc -nic user \
 	-drive file=flash-romulus,format=raw,if=mtd -nographic
+
+Options specific to Aspeed machines are :
+
+ * ``execute-in-place`` which emulates the boot from the CE0 flash
+   device by using the FMC controller to load the instructions, and
+   not simply from RAM. This takes a little longer.
+
+ * ``fmc-model`` to change the FMC Flash model. FW needs support for
+   the chip model to boot.
+
+ * ``spi-model`` to change the SPI Flash model.
+
+For instance, to start the ``ast2500-evb`` machine with a different
+FMC chip and a bigger (64M) SPI chip, use :
+
+.. code-block:: bash
+
+  -M ast2500-evb,fmc-model=mx25l25635e,spi-model=mx66u51235f
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 8bfb1c79ddc5..bdb981d2f878 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -41,6 +41,8 @@ struct AspeedMachineState {
     MemoryRegion ram_container;
     MemoryRegion max_ram;
     bool mmio_exec;
+    char *fmc_model;
+    char *spi_model;
 };
 
 /* Palmetto hardware value: 0x120CE416 */
@@ -332,8 +334,10 @@ static void aspeed_machine_init(MachineState *machine)
                           "max_ram", max_ram_size  - ram_size);
     memory_region_add_subregion(&bmc->ram_container, ram_size, &bmc->max_ram);
 
-    aspeed_board_init_flashes(&bmc->soc.fmc, amc->fmc_model);
-    aspeed_board_init_flashes(&bmc->soc.spi[0], amc->spi_model);
+    aspeed_board_init_flashes(&bmc->soc.fmc, bmc->fmc_model ?
+                              bmc->fmc_model : amc->fmc_model);
+    aspeed_board_init_flashes(&bmc->soc.spi[0], bmc->spi_model ?
+                              bmc->spi_model : amc->spi_model);
 
     /* Install first FMC flash content as a boot rom. */
     if (drive0) {
@@ -570,6 +574,34 @@ static void aspeed_machine_instance_init(Object *obj)
     ASPEED_MACHINE(obj)->mmio_exec = false;
 }
 
+static char *aspeed_get_fmc_model(Object *obj, Error **errp)
+{
+    AspeedMachineState *bmc = ASPEED_MACHINE(obj);
+    return g_strdup(bmc->fmc_model);
+}
+
+static void aspeed_set_fmc_model(Object *obj, const char *value, Error **errp)
+{
+    AspeedMachineState *bmc = ASPEED_MACHINE(obj);
+
+    g_free(bmc->fmc_model);
+    bmc->fmc_model = g_strdup(value);
+}
+
+static char *aspeed_get_spi_model(Object *obj, Error **errp)
+{
+    AspeedMachineState *bmc = ASPEED_MACHINE(obj);
+    return g_strdup(bmc->spi_model);
+}
+
+static void aspeed_set_spi_model(Object *obj, const char *value, Error **errp)
+{
+    AspeedMachineState *bmc = ASPEED_MACHINE(obj);
+
+    g_free(bmc->spi_model);
+    bmc->spi_model = g_strdup(value);
+}
+
 static void aspeed_machine_class_props_init(ObjectClass *oc)
 {
     object_class_property_add_bool(oc, "execute-in-place",
@@ -577,6 +609,15 @@ static void aspeed_machine_class_props_init(ObjectClass *oc)
                                    aspeed_set_mmio_exec);
     object_class_property_set_description(oc, "execute-in-place",
                            "boot directly from CE0 flash device");
+
+    object_class_property_add_str(oc, "fmc-model", aspeed_get_fmc_model,
+                                   aspeed_set_fmc_model);
+    object_class_property_set_description(oc, "fmc-model",
+                                          "Change the FMC Flash model");
+    object_class_property_add_str(oc, "spi-model", aspeed_get_spi_model,
+                                   aspeed_set_spi_model);
+    object_class_property_set_description(oc, "spi-model",
+                                          "Change the SPI Flash model");
 }
 
 static int aspeed_soc_num_cpus(const char *soc_name)
-- 
2.25.4

