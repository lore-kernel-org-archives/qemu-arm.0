Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1687457lfg;
        Mon, 23 Aug 2021 02:20:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3nI+ISZJ9OJ16Gs4aHPppBqQvY1/leWUld0VXoMdwRU+0ndQTHkVivBRUMYPAuBaDPURm
X-Received: by 2002:a25:accc:: with SMTP id x12mr17603838ybd.118.1629710420074;
        Mon, 23 Aug 2021 02:20:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629710420; cv=none;
        d=google.com; s=arc-20160816;
        b=IYjqVyqkdpUasIZGj+Qec1l8b1ySP3hFdb1r9WvtmJQDGLG+IUoemKo4Ds+/C40Ml/
         0IjOCe/ZirzLPo6MzkRZWEzGrOmPss6MJ+GCMQXz9TKyJdZyGo4MVoZZs76u+APVx8aB
         T7LjBmwFvEdyc1Z1maH6QM9Ji3rmsibuRn7aHysEt2bpeffJNGEuAj6idgqYIABaN9ax
         S4YKGyEcOpmBNhcpspFyUq9vinHEkASsFJUOBipP5nAj2NtpA/UHD3eHBYklFF/QQ/pc
         atEpJrCeIhd4kQf82NQf4BXMYGoJJg+L/K8mw19Or75H260LKq7EeCS0tWKQVO4OEy7L
         Bx4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:accept-language
         :message-id:date:thread-index:thread-topic:subject:to:from
         :dkim-signature:content-transfer-encoding:content-language;
        bh=Lol39a3XS1v7NMpKPcAk79Y8t+/5PeIRR0yMW0uLFeE=;
        b=QaA4YdK98E2bkzkfyegX2it4xN9gJtNOadnn7+L9Z/yCkXR3CWQyJrfsF4mC7MZnPW
         3rE2cXsz9YxM1BMUF3eqoxVqhi2We8MQGJJkGzGiCQ8ZXMFT2OoFvKOlLCRK1j+iuSMc
         UxY8nQ/i17OCjEh110nUz7QopcuifEbQGuNTwWDbpwSt7FHaANJ5LWPZq9zSsZX2Eg2K
         0L1qMtWzG6s+XdzXDA6eWZ7JxP8nrGgQpPipfJQUhZbs5YUgmxk812usNlsJC1QZ+LDG
         f4kehgXcxGI4U72K96TtenNEP4KTYsn1V067v22IDEqqn2qo0t3TNd/3X6MAJy51H5n0
         MDKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@Verisilicon.com header.s=default header.b=Q3jUorzP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=verisilicon.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u13si13529403ybc.94.2021.08.23.02.20.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 02:20:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@Verisilicon.com header.s=default header.b=Q3jUorzP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=verisilicon.com
Received: from localhost ([::1]:57748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mI67v-0002uD-FN
	for alex.bennee@linaro.org; Mon, 23 Aug 2021 05:20:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Chunming.Li@verisilicon.com>)
 id 1mI65h-00077M-Gt; Mon, 23 Aug 2021 05:18:01 -0400
Received: from [101.89.135.45] (port=44451 helo=shasxm03.verisilicon.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <Chunming.Li@verisilicon.com>)
 id 1mI65g-0004AC-1O; Mon, 23 Aug 2021 05:18:01 -0400
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; d=Verisilicon.com; s=default;
 c=simple/simple; t=1629710129; h=from:subject:to:date:message-id;
 bh=NVvIkwg/Jp9Yr4LBMczKBo9UDsiRqhicf/FqFqE3X8Y=;
 b=Q3jUorzP/WdtvWJhDzFTjbo318lO5+1TxqXrRIon5QnRh2AFg9zopbqKajsAgc5NekV0sqTZ316
 9vg2eBU3uL0o/jTfgtJ74HcXi8dYsB6EeC8LQbivwEJ+TxbxrF1eQqapqleGjlDKkeU1mgcnaQq7i
 xjYAh+6Qwvq2dkAQNbk=
Received: from SHASXM03.verisilicon.com ([fe80::938:4dda:a2f9:38aa]) by
 SHASXM06.verisilicon.com ([fe80::59a8:ce34:dc14:ddda%16]) with mapi id
 14.03.0408.000; Mon, 23 Aug 2021 17:15:29 +0800
From: "Li, Chunming" <Chunming.Li@verisilicon.com>
To: "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>
Subject: [PATCH v3 3/4] hw/arm/virt: Update SMMU v3 creation to support non
 PCI/PCIe device connection
Thread-Topic: [PATCH v3 3/4] hw/arm/virt: Update SMMU v3 creation to support
 non PCI/PCIe device connection
Thread-Index: AdeX/bEK9DmCuFqMQIm75yVIBS+ltwAAU7mw
Date: Mon, 23 Aug 2021 09:15:28 +0000
Message-ID: <49C79B700B5D8F45B8EF0861B4EF3B3B01142F9743@SHASXM03.verisilicon.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [182.148.13.223]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.100.1062-25628.004
x-tm-as-result: No--4.878000-0.000000-31
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
MIME-Version: 1.0
X-Host-Lookup-Failed: Reverse DNS lookup failed for 101.89.135.45 (deferred)
Received-SPF: pass client-ip=101.89.135.45;
 envelope-from=Chunming.Li@verisilicon.com; helo=shasxm03.verisilicon.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Liu, Renwei" <Renwei.Liu@verisilicon.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Wen,
 Jianxian" <Jianxian.Wen@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lBu1y9Y38iMR

  . Add "smmuv3_sidmap" to set non PCI/PCIe devices SID value
  . Pass non PCI/PCIe devices SID value to SMMU v3 model creation
  . Store SMMU v3 device in virtual machine then non PCI/PCIe can get its m=
emory region later

Signed-off-by: Chunming Li <chunming.li@verisilicon.com>
Signed-off-by: Renwei Liu <renwei.liu@verisilicon.com>
---
 hw/arm/virt.c         | 18 +++++++++++++++++-
 include/hw/arm/virt.h |  2 ++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 81eda46b0..c3fd30e07 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -204,6 +204,10 @@ static const char *valid_cpus[] =3D {
     ARM_CPU_TYPE_NAME("max"),
 };
=20
+static const uint16_t smmuv3_sidmap[] =3D {
+
+};
+
 static bool cpu_type_valid(const char *cpu)
 {
     int i;
@@ -1223,7 +1227,7 @@ static void create_pcie_irq_map(const MachineState *m=
s,
                            0x7           /* PCI irq */);
 }
=20
-static void create_smmu(const VirtMachineState *vms,
+static void create_smmu(VirtMachineState *vms,
                         PCIBus *bus)
 {
     char *node;
@@ -1244,6 +1248,16 @@ static void create_smmu(const VirtMachineState *vms,
=20
     object_property_set_link(OBJECT(dev), "primary-bus", OBJECT(bus),
                              &error_abort);
+
+    vms->smmuv3 =3D dev;
+
+    qdev_prop_set_uint32(dev, "len-sid-map", ARRAY_SIZE(smmuv3_sidmap));
+
+    for (i =3D 0; i < ARRAY_SIZE(smmuv3_sidmap); i++) {
+        g_autofree char *propname =3D g_strdup_printf("sid-map[%d]", i);
+        qdev_prop_set_uint16(dev, propname, smmuv3_sidmap[i]);
+    }
+
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
     for (i =3D 0; i < NUM_SMMU_IRQS; i++) {
@@ -2762,6 +2776,8 @@ static void virt_instance_init(Object *obj)
=20
     vms->irqmap =3D a15irqmap;
=20
+    vms->sidmap =3D smmuv3_sidmap;
+
     virt_flash_create(vms);
=20
     vms->oem_id =3D g_strndup(ACPI_BUILD_APPNAME6, 6);
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 9661c4669..d3402a43d 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -167,6 +167,8 @@ struct VirtMachineState {
     PCIBus *bus;
     char *oem_id;
     char *oem_table_id;
+    DeviceState *smmuv3;
+    const uint16_t *sidmap;
 };
=20
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
--
