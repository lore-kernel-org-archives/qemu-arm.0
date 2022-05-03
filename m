Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1732958lfj;
        Tue, 3 May 2022 15:33:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7ImuQujyYOtf5Ybw2jHxNweypB0SaPThJO+W0m28k3ek03F4rQ45eWSn8rHaxKBCPZMqD
X-Received: by 2002:ac8:5d88:0:b0:2f3:92af:1b19 with SMTP id d8-20020ac85d88000000b002f392af1b19mr16697080qtx.538.1651617189340;
        Tue, 03 May 2022 15:33:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651617189; cv=none;
        d=google.com; s=arc-20160816;
        b=U3PK6o9l4R741KfmyhMVvRNWaWZneFp46cr/5fz7St5BEPiRvfrh6P3AMF98ZIXyOJ
         umY4KXWVoTrmNAz97udKQ/K6zsiG7AARIia7xTEwOkPClfrcwkbY0InL5WpyLh0eKmf+
         EATetWiqPs/rJYE0dyAbJVMGTk7AHTMJ71dVHvfzuI3S6id2UNiRZ+ju3fcwOwewCA2G
         K23KocFbdjUuZS7b/5T9UWIbhyHgYVQdiLukZW4waXt2ziXyhPgw2ygdoHmm7Miai3eG
         xqhXTqzq5yA5ospIiAqJeGUOb29gGrRXp5yzHGmtMzaurrtY4M1sFDyD7BVPxkGSXxrp
         hyMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:references:in-reply-to:message-id:date
         :subject:cc:to:from:dkim-signature;
        bh=78YiHJsoHbQ1w4/UuCKBUQAyohnXAN+EISqxIdNlWRo=;
        b=pg9dc8u3Z3sVijvd3v/+lvindgQQQIgnzHDAnYm+fLaLmDbsYkJl2QdfR29EBD1UgC
         mCl35yqaaUYg/cMtCMJmtgAwLQOuoUs0/bceiJ89vqxLDhbM/cvxgKMIck4V6LakvVvt
         hQ+ogqHQd2kSbPZmCVQmqN7MgfDYnbUj5U3SAPichnBQjy+0DIhaxkIvNA49b8ApSbWB
         VhizUlu9dkoi9iE2nIhzTMaJGJsmjAP1Kc2Bz8O5XAw1N0pskPOJ1bKXDKhqG1R6MWi2
         qeKtUX5B9utUh4NU25o+iDIVCXCgi+mlzigIZ/wv/qGRyaESckgNo4IVDEux9uXaZBsK
         ek5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=U92h8dB1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l4-20020a05620a28c400b0069f110527acsi9398274qkp.210.2022.05.03.15.33.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 15:33:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=U92h8dB1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:35390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nm14u-0003Vb-Q8
	for alex.bennee@linaro.org; Tue, 03 May 2022 18:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=61228a338c=pdel@fb.com>)
 id 1nlzP6-0006UF-KI
 for qemu-arm@nongnu.org; Tue, 03 May 2022 16:45:53 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:58312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=61228a338c=pdel@fb.com>)
 id 1nlzP2-0002ps-Jp
 for qemu-arm@nongnu.org; Tue, 03 May 2022 16:45:52 -0400
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 243HFnPf027096
 for <qemu-arm@nongnu.org>; Tue, 3 May 2022 13:45:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=78YiHJsoHbQ1w4/UuCKBUQAyohnXAN+EISqxIdNlWRo=;
 b=U92h8dB1shC99I0twk6amVsDcMQDMzLPhSbbNuASw/MpqDIMHjYVrhZvkHTSeLZWjNPP
 fna9ni/qeWerEraHufq3z2G0HEg5xDx18lOQuRHDERhamSS7IBlAeheRL2tFOscTYF25
 MlbAZ7KuhB0L8PkPClseHQ5FZCRJR0Kb0Xk= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3fs2mxk80v-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 03 May 2022 13:45:45 -0700
Received: from twshared31479.05.prn5.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:82::e) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 3 May 2022 13:45:44 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id 571265ACF47C; Tue,  3 May 2022 13:45:30 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <patrick@stwcx.xyz>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, <clg@kaod.org>
Subject: [PATCH 1/1] hw/arm/aspeed: Add fby35 machine type
Date: Tue, 3 May 2022 13:44:52 -0700
Message-ID: <20220503204451.1257898-2-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220503204451.1257898-1-pdel@fb.com>
References: <20220503204451.1257898-1-pdel@fb.com>
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: 6RXF7ZOXSKntW454sXkIq9-7JCaumHkY
X-Proofpoint-ORIG-GUID: 6RXF7ZOXSKntW454sXkIq9-7JCaumHkY
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-03_08,2022-05-02_03,2022-02-23_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=61228a338c=pdel@fb.com; helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wwd8gl40ixSp

Add the 'fby35-bmc' machine type based on the kernel DTS[1] and userspace
i2c setup scripts[2]. Undefined values are inherited from the AST2600-EVB.

I also added an avocado test that uses a reference image I built and
uploaded to the FB Github Releases.

[1] https://github.com/facebook/openbmc-linux/blob/412d5053258007117e94b1e3=
6015aefc1301474b/arch/arm/boot/dts/aspeed-bmc-facebook-fby35.dts
[2] https://github.com/facebook/openbmc/blob/e2294ff5d31dd65c248fe396a38528=
6d6d5c463d/meta-facebook/meta-fby35/recipes-fby35/plat-utils/files/setup-de=
v.sh

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/arm/aspeed.c                     | 63 +++++++++++++++++++++++++++++
 tests/avocado/boot_linux_console.py | 20 ++++++++-
 2 files changed, 82 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index a74c13ab0f..725c169488 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -21,6 +21,7 @@
 #include "hw/misc/led.h"
 #include "hw/qdev-properties.h"
 #include "sysemu/block-backend.h"
+#include "sysemu/reset.h"
 #include "hw/loader.h"
 #include "qemu/error-report.h"
 #include "qemu/units.h"
@@ -951,6 +952,35 @@ static void bletchley_bmc_i2c_init(AspeedMachineState =
*bmc)
     i2c_slave_create_simple(i2c[12], TYPE_PCA9552, 0x67);
 }
=20
+static void fby35_i2c_init(AspeedMachineState *bmc)
+{
+    AspeedSoCState *soc =3D &bmc->soc;
+    I2CBus *i2c[16];
+
+    for (int i =3D 0; i < 16; i++) {
+        i2c[i] =3D aspeed_i2c_get_bus(&soc->i2c, i);
+    }
+
+    i2c_slave_create_simple(i2c[2], TYPE_LM75, 0x4f);
+    i2c_slave_create_simple(i2c[8], TYPE_TMP421, 0x1f);
+    /* Hotswap controller is actually supposed to be mp5920 or ltc4282. */
+    i2c_slave_create_simple(i2c[11], "adm1272", 0x44);
+    i2c_slave_create_simple(i2c[12], TYPE_LM75, 0x4e);
+    i2c_slave_create_simple(i2c[12], TYPE_LM75, 0x4f);
+
+    aspeed_eeprom_init(i2c[4], 0x51, 128 * KiB);
+    aspeed_eeprom_init(i2c[6], 0x51, 128 * KiB);
+    aspeed_eeprom_init(i2c[8], 0x50, 32 * KiB);
+    aspeed_eeprom_init(i2c[11], 0x51, 128 * KiB);
+    aspeed_eeprom_init(i2c[11], 0x54, 128 * KiB);
+
+    /*
+     * TODO: There is a multi-master i2c connection to an AST1030 MiniBMC =
on
+     * buses 0, 1, 2, 3, and 9. Source address 0x10, target address 0x20 on
+     * each.
+     */
+}
+
 static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
 {
     return ASPEED_MACHINE(obj)->mmio_exec;
@@ -1293,6 +1323,35 @@ static void aspeed_machine_bletchley_class_init(Obje=
ctClass *oc, void *data)
         aspeed_soc_num_cpus(amc->soc_name);
 }
=20
+static void fby35_reset(MachineState *state)
+{
+    AspeedMachineState *bmc =3D ASPEED_MACHINE(state);
+    AspeedGPIOState *gpio =3D &bmc->soc.gpio;
+
+    qemu_devices_reset();
+
+    /* Board ID */
+    object_property_set_bool(OBJECT(gpio), "gpioV4", true, &error_fatal);
+    object_property_set_bool(OBJECT(gpio), "gpioV5", true, &error_fatal);
+    object_property_set_bool(OBJECT(gpio), "gpioV6", true, &error_fatal);
+    object_property_set_bool(OBJECT(gpio), "gpioV7", false, &error_fatal);
+}
+
+static void aspeed_machine_fby35_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc =3D MACHINE_CLASS(oc);
+    AspeedMachineClass *amc =3D ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       =3D "Facebook fby35 BMC (Cortex-A7)";
+    mc->reset      =3D fby35_reset;
+    amc->fmc_model =3D "mx66l1g45g";
+    amc->num_cs    =3D 2;
+    amc->macs_mask =3D ASPEED_MAC3_ON;
+    amc->i2c_init  =3D fby35_i2c_init;
+    /* FIXME: Replace this macro with something more general */
+    mc->default_ram_size =3D FUJI_BMC_RAM_SIZE;
+}
+
 #define AST1030_INTERNAL_FLASH_SIZE (1024 * 1024)
 /* Main SYSCLK frequency in Hz (200MHz) */
 #define SYSCLK_FRQ 200000000ULL
@@ -1411,6 +1470,10 @@ static const TypeInfo aspeed_machine_types[] =3D {
         .name          =3D MACHINE_TYPE_NAME("bletchley-bmc"),
         .parent        =3D TYPE_ASPEED_MACHINE,
         .class_init    =3D aspeed_machine_bletchley_class_init,
+    }, {
+        .name          =3D MACHINE_TYPE_NAME("fby35-bmc"),
+        .parent        =3D MACHINE_TYPE_NAME("ast2600-evb"),
+        .class_init    =3D aspeed_machine_fby35_class_init,
     }, {
         .name           =3D MACHINE_TYPE_NAME("ast1030-evb"),
         .parent         =3D TYPE_ASPEED_MACHINE,
diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux=
_console.py
index 45a2ceda22..8ba7dafb63 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -89,7 +89,7 @@ class BootLinuxConsole(LinuxKernelTest):
     Boots a Linux kernel and checks that the console is operational and the
     kernel command line is properly passed from QEMU to the kernel
     """
-    timeout =3D 90
+    timeout =3D 400
=20
     def test_x86_64_pc(self):
         """
@@ -1111,6 +1111,24 @@ def test_arm_ast2600_debian(self):
         self.wait_for_console_pattern("SMP: Total of 2 processors activate=
d")
         self.wait_for_console_pattern("No filesystem could mount root")
=20
+    def test_arm_ast2600_fby35(self):
+        """
+        :avocado: tags=3Darch:arm
+        :avocado: tags=3Dmachine:fby35-bmc
+        """
+        image_url =3D ('https://github.com/facebook/openbmc/releases'
+                     '/download/openbmc-e2294ff5d31d/fby35.mtd')
+        image_hash =3D ('0a3635646f38373e318811be1ec374'
+                      '3540cc456aafe87234655081684b03b713')
+        image_path =3D self.fetch_asset(image_url, asset_hash=3Dimage_hash,
+                                      algorithm=3D'sha256')
+        self.vm.set_console()
+        self.vm.add_args('-drive', f'file=3D{image_path},if=3Dmtd,format=
=3Draw',
+                         '-drive', f'file=3D{image_path},if=3Dmtd,format=
=3Draw')
+        self.vm.launch()
+        self.wait_for_console_pattern('OpenBMC Release fby35-e2294ff5d3')
+        self.wait_for_console_pattern('bmc-oob. login:')
+
     def test_m68k_mcf5208evb(self):
         """
         :avocado: tags=3Darch:m68k
--=20
2.30.2

