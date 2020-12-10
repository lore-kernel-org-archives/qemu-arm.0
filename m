Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp5873544lfb;
        Thu, 10 Dec 2020 05:00:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwoUG18YdnWUd2OC5HGx6PFhpseTio3Op8PKZv+jt5mTNsdJHphto/NagoQHtLeQVQs4Fw/
X-Received: by 2002:a25:c095:: with SMTP id c143mr3523432ybf.119.1607605243401;
        Thu, 10 Dec 2020 05:00:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607605243; cv=none;
        d=google.com; s=arc-20160816;
        b=EnOS0j52GSqJkSx5nPZ1vmtx/jlm1K8SrCxTev+A3ZddpiHr82HRjUWWK86x2xoDKe
         p9IC/+MGFeQ6U//+/nXd+MIKCb63EvViB2/oBoY8O/nTkblxufM7oUYXKCsPs5Sr3ldP
         m4SjsxFL2dk7ea7SYPz8q1X59lPiWSgjmvJ/FsRp5bP4FLul81KcOLrrPhd54UdrO9I+
         L4UP5to8ExGKXjPdH6EDragCbFclP42mpOHp+12rWv9TQ9GmAuiUKDMtvMbQSn1zs8u/
         z+y2y5SXcCOJRvTlid3Ohi+aBM+i8FKrtYZyXp3lCZbnT9JAg4ZspxPMP4DT+Asun7Oi
         OK9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=+tap3zqfLA44r78sq725zKdz5Uc9+h+tHBfSsJY0fyo=;
        b=MiadrqoVlzCYV48DIuMqx2nkHeysRCNcWfCA4ALxQGx/fz4s38+yibQf8maUjUAJhJ
         vT2yhFT0T4CYx9PsXzA1QbGSO29VaJsz0cL8qmwbHwXX/CbOXugrsP2Pg1MJZxLc47Tm
         9tfiRF6tphC3ba7i51m5NjadzQQbzECTYzSaWchQrl7i5BBgTz7guW0yEr9aCDZBaRyz
         qetRx/AqoNcdiwqELWaYajZelIUKiRneGC6IiT+XFsSgqntCk4BrCcziLA9R4ZTzq1wx
         /7A5IcMxQmxxPF6F0Na++/URqLpawyIZ3Om/FRLn3Te+jF/52veaDL5jfSPLzQvX7JIr
         xjUA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q7si4778617ybm.214.2020.12.10.05.00.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Dec 2020 05:00:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1knLYl-0001LR-6l
	for alex.bennee@linaro.org; Thu, 10 Dec 2020 08:00:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1knLQ2-0001bn-Gq; Thu, 10 Dec 2020 07:51:40 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:16582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1knLPy-0001Rl-CM; Thu, 10 Dec 2020 07:51:36 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BACXMqg163897; Thu, 10 Dec 2020 07:51:24 -0500
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35bfm3y6cg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 07:51:23 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BACXOVK028225;
 Thu, 10 Dec 2020 12:51:22 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 3581fhk0fs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 12:51:21 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BACpJwJ26542412
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Dec 2020 12:51:19 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C36CD11C052;
 Thu, 10 Dec 2020 12:51:19 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 809F111C04A;
 Thu, 10 Dec 2020 12:51:19 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 10 Dec 2020 12:51:19 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-158-23.de.ibm.com [9.145.158.23])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id B4659220156;
 Thu, 10 Dec 2020 13:51:18 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 2/5] aspeed: Add support for the g220a-bmc board
Date: Thu, 10 Dec 2020 13:51:12 +0100
Message-Id: <20201210125115.1812083-3-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201210125115.1812083-1-clg@kaod.org>
References: <20201210125115.1812083-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-10_05:2020-12-09,
 2020-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 clxscore=1034 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012100082
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 John Wang <wangzhiqiang.bj@bytedance.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eMyDkblVwKG7

From: John Wang <wangzhiqiang.bj@bytedance.com>

G220A is a 2 socket x86 motherboard supported by OpenBMC.
Strapping configuration was obtained from hardware.

Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Message-Id: <20201122105134.671-2-wangzhiqiang.bj@bytedance.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 0ef3f6b412fe..aee00ba8d682 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -121,6 +121,20 @@ struct AspeedMachineState {
         SCU_AST2500_HW_STRAP_ACPI_ENABLE |                              =
\
         SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER))
=20
+#define G220A_BMC_HW_STRAP1 (                                      \
+        SCU_AST2500_HW_STRAP_SPI_AUTOFETCH_ENABLE |                     =
\
+        SCU_AST2500_HW_STRAP_GPIO_STRAP_ENABLE |                        =
\
+        SCU_AST2500_HW_STRAP_UART_DEBUG |                               =
\
+        SCU_AST2500_HW_STRAP_RESERVED28 |                               =
\
+        SCU_AST2500_HW_STRAP_DDR4_ENABLE |                              =
\
+        SCU_HW_STRAP_2ND_BOOT_WDT |                                     =
\
+        SCU_HW_STRAP_VGA_CLASS_CODE |                                   =
\
+        SCU_HW_STRAP_LPC_RESET_PIN |                                    =
\
+        SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER) |                =
\
+        SCU_AST2500_HW_STRAP_SET_AXI_AHB_RATIO(AXI_AHB_RATIO_2_1) |     =
\
+        SCU_HW_STRAP_VGA_SIZE_SET(VGA_64M_DRAM) |                       =
\
+        SCU_AST2500_HW_STRAP_RESERVED1)
+
 /* Witherspoon hardware value: 0xF10AD216 (but use romulus definition) *=
/
 #define WITHERSPOON_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
=20
@@ -579,6 +593,30 @@ static void witherspoon_bmc_i2c_init(AspeedMachineSt=
ate *bmc)
     /* Bus 11: TODO ucd90160@64 */
 }
=20
+static void g220a_bmc_i2c_init(AspeedMachineState *bmc)
+{
+    AspeedSoCState *soc =3D &bmc->soc;
+    DeviceState *dev;
+
+    dev =3D DEVICE(i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c,=
 3),
+                                         "emc1413", 0x4c));
+    object_property_set_int(OBJECT(dev), "temperature0", 31000, &error_a=
bort);
+    object_property_set_int(OBJECT(dev), "temperature1", 28000, &error_a=
bort);
+    object_property_set_int(OBJECT(dev), "temperature2", 20000, &error_a=
bort);
+
+    dev =3D DEVICE(i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c,=
 12),
+                                         "emc1413", 0x4c));
+    object_property_set_int(OBJECT(dev), "temperature0", 31000, &error_a=
bort);
+    object_property_set_int(OBJECT(dev), "temperature1", 28000, &error_a=
bort);
+    object_property_set_int(OBJECT(dev), "temperature2", 20000, &error_a=
bort);
+
+    dev =3D DEVICE(i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c,=
 13),
+                                         "emc1413", 0x4c));
+    object_property_set_int(OBJECT(dev), "temperature0", 31000, &error_a=
bort);
+    object_property_set_int(OBJECT(dev), "temperature1", 28000, &error_a=
bort);
+    object_property_set_int(OBJECT(dev), "temperature2", 20000, &error_a=
bort);
+}
+
 static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
 {
     return ASPEED_MACHINE(obj)->mmio_exec;
@@ -818,6 +856,24 @@ static void aspeed_machine_tacoma_class_init(ObjectC=
lass *oc, void *data)
         aspeed_soc_num_cpus(amc->soc_name);
 };
=20
+static void aspeed_machine_g220a_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc =3D MACHINE_CLASS(oc);
+    AspeedMachineClass *amc =3D ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       =3D "Bytedance G220A BMC (ARM1176)";
+    amc->soc_name  =3D "ast2500-a1";
+    amc->hw_strap1 =3D G220A_BMC_HW_STRAP1;
+    amc->fmc_model =3D "n25q512a";
+    amc->spi_model =3D "mx25l25635e";
+    amc->num_cs    =3D 2;
+    amc->macs_mask  =3D ASPEED_MAC1_ON | ASPEED_MAC2_ON;
+    amc->i2c_init  =3D g220a_bmc_i2c_init;
+    mc->default_ram_size =3D 1024 * MiB;
+    mc->default_cpus =3D mc->min_cpus =3D mc->max_cpus =3D
+        aspeed_soc_num_cpus(amc->soc_name);
+};
+
 static const TypeInfo aspeed_machine_types[] =3D {
     {
         .name          =3D MACHINE_TYPE_NAME("palmetto-bmc"),
@@ -855,6 +911,10 @@ static const TypeInfo aspeed_machine_types[] =3D {
         .name          =3D MACHINE_TYPE_NAME("tacoma-bmc"),
         .parent        =3D TYPE_ASPEED_MACHINE,
         .class_init    =3D aspeed_machine_tacoma_class_init,
+    }, {
+        .name          =3D MACHINE_TYPE_NAME("g220a-bmc"),
+        .parent        =3D TYPE_ASPEED_MACHINE,
+        .class_init    =3D aspeed_machine_g220a_class_init,
     }, {
         .name          =3D TYPE_ASPEED_MACHINE,
         .parent        =3D TYPE_MACHINE,
--=20
2.26.2

