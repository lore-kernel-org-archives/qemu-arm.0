Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1105109wrg;
        Mon, 3 Jun 2019 13:56:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxUIu1xG/GowanjW9N+Ww4rtXtZilY3ZNUXGCBOIN6vvcTYSyx3K7D9S5XdXnv8cL3FQptb
X-Received: by 2002:a0c:d40d:: with SMTP id t13mr4844212qvh.175.1559595365027;
        Mon, 03 Jun 2019 13:56:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559595365; cv=none;
        d=google.com; s=arc-20160816;
        b=DTk/8ptJrstR5SSADavqsUMMVVDTtzTQiwXH26mrlGdNo/2dPjnekFA5AWuxTuHeW7
         8dyfy7kzHV+N0cfsDMJlkri8y9Lyu1TLhJAy4pSrk9paRyYk/oAjKp/nPrxm8gd6NdxY
         VC4bCtfxbGpz3RwnsHZ5Hd0sIocnfpmNP4foXJY/6PKW463iPevOGqZD2nRs5VUZ5Clf
         +y7/IxX/UnKwfHKweS2WUn2ua65owJoqZNJl8gLEV8kKdS2IBva8mHJElhd66ExPuGWd
         iU/W54C5Z2yEGuTBMyncvM1dkkXP7c/s2QuZG+YD42XEfHay+/DdLEJxkPQI7kpzBYyC
         SG4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:message-id:mime-version:date:to:from;
        bh=wuKROIMdKxoCMQxFJZBQ3mAmN0q6a32/bZLk0mJy5T4=;
        b=H8ofTy4WgBXwHSxeKcGxUugpwd1GgUkZ+Ywuu7NWABgEg7aF6wCU/jxtK704Peqp2N
         YGpIt5MbdffyLFEIHHn4+7oZyTnt+MABTQKMlgXc2ApHf7N7Li/rv8n8xhoooz2kPJO3
         q7mOVaP+eeyLadGCM7+6nABokcxjFjXogmxQKuvvrgBxP5F2VFZaPUWiW5GRPTM2GUFt
         Mg6726E0+y3V4Mrlcjo/ukS9thrJgeMuRlAN+hA4FieBVA3QeTrNmcQXyLkimg+thIji
         WPFtbFYogrmrEg+1eFD3YTFAk3kmqbpr87fbGrD9CF4qimsyZ1TaSpkE42754EEuYIIY
         +ECw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c1si2317401qtc.157.2019.06.03.13.56.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Jun 2019 13:56:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([127.0.0.1]:40811 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hXtzw-0006wV-6m
	for alex.bennee@linaro.org; Mon, 03 Jun 2019 16:56:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42520)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anoo@linux.ibm.com>) id 1hXsML-0005dX-Gf
	for qemu-arm@nongnu.org; Mon, 03 Jun 2019 15:11:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anoo@linux.ibm.com>) id 1hXsMK-0001RV-Ee
	for qemu-arm@nongnu.org; Mon, 03 Jun 2019 15:11:05 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41260)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <anoo@linux.ibm.com>) id 1hXsMK-0001Oc-4Y
	for qemu-arm@nongnu.org; Mon, 03 Jun 2019 15:11:04 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x53J7Zb9004160
	for <qemu-arm@nongnu.org>; Mon, 3 Jun 2019 15:11:02 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2sw92s931w-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <qemu-arm@nongnu.org>; Mon, 03 Jun 2019 15:11:01 -0400
Received: from localhost
	by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-arm@nongnu.org> from <anoo@linux.ibm.com>;
	Mon, 3 Jun 2019 20:11:00 +0100
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
	by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Mon, 3 Jun 2019 20:10:58 +0100
Received: from b03ledav004.gho.boulder.ibm.com
	(b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x53JAvgM25756064
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 3 Jun 2019 19:10:57 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9D7FE7805F;
	Mon,  3 Jun 2019 19:10:57 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 264817805C;
	Mon,  3 Jun 2019 19:10:57 +0000 (GMT)
Received: from habcap11p1.aus.stglabs.ibm.com (unknown [9.41.164.53])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Mon,  3 Jun 2019 19:10:56 +0000 (GMT)
From: Adriana Kobylak <anoo@linux.ibm.com>
To: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
	qemu-arm@nongnu.org
Date: Mon,  3 Jun 2019 14:10:55 -0500
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
x-cbid: 19060319-0036-0000-0000-00000AC65D99
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011209; HX=3.00000242; KW=3.00000007;
	PH=3.00000004; SC=3.00000286; SDB=6.01212763; UDB=6.00637359;
	IPR=6.00993823; 
	MB=3.00027167; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-03 19:11:00
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060319-0037-0000-0000-00004C0E0A8E
Message-Id: <1559589055-71202-1-git-send-email-anoo@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-06-03_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1906030129
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0a-001b2d01.pphosted.com id x53J7Zb9004160
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
X-Mailman-Approved-At: Mon, 03 Jun 2019 16:55:50 -0400
Subject: [Qemu-arm] [PATCH qemu] aspeed: Add support for the swift-bmc board
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Adriana Kobylak <anoo@us.ibm.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kfjwrNdLK5ZE

From: Adriana Kobylak <anoo@us.ibm.com>

The Swift board is an OpenPOWER system hosting POWER processors.
Add support for their BMC including the I2C devices as found on HW.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 33070a6..cd95b3c 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -73,6 +73,9 @@ struct AspeedBoardState {
         SCU_AST2500_HW_STRAP_ACPI_ENABLE |                              =
\
         SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER))
=20
+/* TODO: Swift hardware value: ? (use romulus definition for now) */
+#define SWIFT_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
+
 /* Witherspoon hardware value: 0xF10AD216 (but use romulus definition) *=
/
 #define WITHERSPOON_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
=20
@@ -287,6 +290,35 @@ static void romulus_bmc_i2c_init(AspeedBoardState *b=
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
@@ -378,6 +410,16 @@ static const AspeedBoardConfig aspeed_boards[] =3D {
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

