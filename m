Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3588757wrg;
        Mon, 10 Jun 2019 13:54:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxbgjC6pe3uRhtIC3fK9pptx4VopnH/PnLhJ58xBKRioips7Y/+2lzLfb8cG40kEs6d7Oof
X-Received: by 2002:a1f:30d4:: with SMTP id w203mr11987214vkw.0.1560200054918;
        Mon, 10 Jun 2019 13:54:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560200054; cv=none;
        d=google.com; s=arc-20160816;
        b=hEuZGzzqCE1g/Ui3XPWf5lm5/uzKYgpUzdPnf3GEdod3kzD30xzIqQOOKRtYJVPyEv
         2LOB4J7q4F13g/W0I8HfEPCn52x9i5bzjYtLMnxQnv493qDil/7NDx1NsIGAPvJ2uxcc
         gALWktF0TGEwlag8phXI/AI2/iwhZE9A6xACwiV9L9KyX7C5+a3O52Lr50Dhgqr1sC0V
         C7C0nLHMK5OYW/k7PsjxDFTPbgyh/JsdhPagUOtwyLh/oYGX8wkz6FQ5PWfNzwi7FZ82
         XtESjY1mcWeVcm+qCTZx074CAnFfEelVN27RtYKjjEw92z615KPy2/Y6KqnC/tfmMjst
         nhxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:message-id:mime-version:references
         :in-reply-to:date:to:from;
        bh=iZyBrB2mjl5CDkgESEb+dw8MrHikdBIQun3w0Ru80Pc=;
        b=I+1tGA4V2G26YyMkoRcO2eJqkDc3OHJHFUnEglhOdBgo8qCjnW4T5k88auqdqvTbz1
         xen8ON7bFAkpbaL2HaGbEdt44C/QkQrNu9BNJeC4j+OuDjS26wNpdAp+i7vPfAOfbRMr
         N0ownPJqrgXz8r+wbTEPEq1+08++MuPkSF1E8xWgr3tjGXsw945wrqXIjzT725tHgudr
         N6gvzy3Ckio727raN/Vp34JWWsUoQtbLEM18FFRsRfGEeKhLO7PD46Wi/k9LuvaexYjF
         NFDt7TILtMlGuYwFR+A+ABUExD5QZpGtutT+UeIP5GRjJ36lQqCIeM+PuTbRunuVbnkS
         JBvA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o125si1828866vsd.140.2019.06.10.13.54.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Jun 2019 13:54:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:49646 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1haRJ0-0001jb-F8
	for alex.bennee@linaro.org; Mon, 10 Jun 2019 16:54:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51859)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <anoo@linux.ibm.com>) id 1haRIV-0001jG-7K
 for qemu-arm@nongnu.org; Mon, 10 Jun 2019 16:53:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <anoo@linux.ibm.com>) id 1haRIT-0004c7-VA
 for qemu-arm@nongnu.org; Mon, 10 Jun 2019 16:53:43 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:55072
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <anoo@linux.ibm.com>) id 1haRIQ-0004VM-TJ
 for qemu-arm@nongnu.org; Mon, 10 Jun 2019 16:53:39 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5AKqCVf112544
 for <qemu-arm@nongnu.org>; Mon, 10 Jun 2019 16:53:34 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t1xmer193-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 10 Jun 2019 16:53:33 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-arm@nongnu.org> from <anoo@linux.ibm.com>;
 Mon, 10 Jun 2019 21:53:33 +0100
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 10 Jun 2019 21:53:29 +0100
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5AKrS0324510748
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jun 2019 20:53:28 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4648C6A051;
 Mon, 10 Jun 2019 20:53:28 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C69136A04D;
 Mon, 10 Jun 2019 20:53:27 +0000 (GMT)
Received: from habcap11p1.aus.stglabs.ibm.com (unknown [9.41.164.53])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 10 Jun 2019 20:53:27 +0000 (GMT)
From: Adriana Kobylak <anoo@linux.ibm.com>
To: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 qemu-arm@nongnu.org
Date: Mon, 10 Jun 2019 15:53:31 -0500
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cce364a3-548c-427f-addb-07e38f827e03@www.fastmail.com>
References: <cce364a3-548c-427f-addb-07e38f827e03@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
x-cbid: 19061020-0020-0000-0000-00000EF79DEF
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011243; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01216112; UDB=6.00639395; IPR=6.00997212; 
 MB=3.00027255; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-10 20:53:31
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061020-0021-0000-0000-00006631EEBB
Message-Id: <1560200011-70806-1-git-send-email-anoo@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-10_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906100139
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0b-001b2d01.pphosted.com id x5AKqCVf112544
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
Subject: [Qemu-arm] [PATCH qemu v2] aspeed: Add support for the swift-bmc
 board
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
Cc: Adriana Kobylak <anoo@us.ibm.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1TaXfyDgePXx

From: Adriana Kobylak <anoo@us.ibm.com>

The Swift board is an OpenPOWER system hosting POWER processors.
Add support for their BMC including the I2C devices as found on HW.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 33070a6..7fd0e0c 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -73,6 +73,17 @@ struct AspeedBoardState {
         SCU_AST2500_HW_STRAP_ACPI_ENABLE |                              =
\
         SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER))
=20
+/* Swift hardware value: 0xF11AD206 */
+#define SWIFT_BMC_HW_STRAP1 (                                           =
\
+        AST2500_HW_STRAP1_DEFAULTS |                                    =
\
+        SCU_AST2500_HW_STRAP_SPI_AUTOFETCH_ENABLE |                     =
\
+        SCU_AST2500_HW_STRAP_GPIO_STRAP_ENABLE |                        =
\
+        SCU_AST2500_HW_STRAP_UART_DEBUG |                               =
\
+        SCU_AST2500_HW_STRAP_DDR4_ENABLE |                              =
\
+        SCU_H_PLL_BYPASS_EN |                                           =
\
+        SCU_AST2500_HW_STRAP_ACPI_ENABLE |                              =
\
+        SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER))
+
 /* Witherspoon hardware value: 0xF10AD216 (but use romulus definition) *=
/
 #define WITHERSPOON_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
=20
@@ -287,6 +298,35 @@ static void romulus_bmc_i2c_init(AspeedBoardState *b=
mc)
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), "ds1338"=
, 0x32);
 }
=20
+static void swift_bmc_i2c_init(AspeedBoardState *bmc)
+{
+    AspeedSoCState *soc =3D &bmc->soc;
+
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 3), "pca9552"=
, 0x60);
+
+    /* The swift board expects a TMP275 but a TMP105 is compatible */
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 7), "tmp105",=
 0x48);
+    /* The swift board expects a pca9551 but a pca9552 is compatible */
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 7), "pca9552"=
, 0x60);
+
+    /* The swift board expects an Epson RX8900 RTC but a ds1338 is compa=
tible */
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 8), "ds1338",=
 0x32);
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 8), "pca9552"=
, 0x60);
+
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 9), "tmp423",=
 0x4c);
+    /* The swift board expects a pca9539 but a pca9552 is compatible */
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 9), "pca9552"=
, 0x74);
+
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 10), "tmp423"=
, 0x4c);
+    /* The swift board expects a pca9539 but a pca9552 is compatible */
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 10), "pca9552=
",
+                     0x74);
+
+    /* The swift board expects a TMP275 but a TMP105 is compatible */
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 12), "tmp105"=
, 0x48);
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 12), "tmp105"=
, 0x4a);
+}
+
 static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc)
 {
     AspeedSoCState *soc =3D &bmc->soc;
@@ -378,6 +418,16 @@ static const AspeedBoardConfig aspeed_boards[] =3D {
         .i2c_init  =3D romulus_bmc_i2c_init,
         .ram       =3D 512 * MiB,
     }, {
+        .name      =3D MACHINE_TYPE_NAME("swift-bmc"),
+        .desc      =3D "OpenPOWER Swift BMC (ARM1176)",
+        .soc_name  =3D "ast2500-a1",
+        .hw_strap1 =3D SWIFT_BMC_HW_STRAP1,
+        .fmc_model =3D "mx66l1g45g",
+        .spi_model =3D "mx66l1g45g",
+        .num_cs    =3D 2,
+        .i2c_init  =3D swift_bmc_i2c_init,
+        .ram       =3D 512 * MiB,
+    }, {
         .name      =3D MACHINE_TYPE_NAME("witherspoon-bmc"),
         .desc      =3D "OpenPOWER Witherspoon BMC (ARM1176)",
         .soc_name  =3D "ast2500-a1",
--=20
1.8.3.1

