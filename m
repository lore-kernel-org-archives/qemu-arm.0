Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp5010774lfg;
        Tue, 29 Jun 2021 07:47:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcdKw74BM8sk1XX1bFVkgvHaYNabQpsED18sav9xB/THf84pJadiRcZFJZjTBmpdp4MgbT
X-Received: by 2002:a5b:188:: with SMTP id r8mr11953823ybl.467.1624978066065;
        Tue, 29 Jun 2021 07:47:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624978066; cv=none;
        d=google.com; s=arc-20160816;
        b=vGiN48zhKChVyn8vHTPcIrch2GBTrku15uCdW8EnJZoy+ItGMHusduf4aJVsylDuar
         5G7dKG74qfwQu/NLnM0trzD9a3UPuGNY4aME/YWmZVtTEmLOq309L0QsNheBdXo3mTfD
         d9GpnEyPR5HYLu6/UAAPnGspQCN2lYYC/9KxUKOcljBEKbPlJQka2/FhF929PkTzhAoN
         Ucx9xp18MBBG1B+NHxvdzgo7dfJwImTOQ+zx6u0U7SnEZezMnnEzYZMT7kt0LWFp/wbf
         uipuwmezQbmEUf2WqR56OrjcMLhh/HOxoIY2SPXB8JMHP3ZprJO62FxL/uqZu/VbXfR4
         WlPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=rpWsxbH9NOObXAvG2V/jw5WGa2cZph5RwtNnF0ARRjY=;
        b=x5WGAMvL1XbgJOnaAYXNJd33MERrYyhv/nIIZHALLbGzA0aJ8F3i7zmnmAUoEtZnHK
         veVZbatksxO1iTYiuU8XmhhGySXvlMY1pDjdu8nXjWpNYqFTMBdnn+dkUvghrutX/mDL
         L+XNnBro2C/UWch+7BjoydOZ73mZMtAaChxL9YkJcEUek7kKEDANv3LvM0UfIk8irwA0
         4qFpjRc2WCZGiye89ePwpu93kY+HLkhAf5bQ94HE/Q3Cf3WUBj0QqT9kHNq0NO+MKBIj
         9m+nmeYO2xC0B1jM0GEJQwGGfxWukvuugMNmJmQ6jtbSe6RkLFcjiaonNAmAPDchXZB2
         DBlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d39si22724442yba.221.2021.06.29.07.47.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Jun 2021 07:47:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lyF1d-0006qh-Er
	for alex.bennee@linaro.org; Tue, 29 Jun 2021 10:47:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lyEef-0006j8-Gh; Tue, 29 Jun 2021 10:24:02 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:30195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lyEed-0005wF-GC; Tue, 29 Jun 2021 10:24:01 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15TEM88n046611; Tue, 29 Jun 2021 10:23:46 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39g57jr1qs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Jun 2021 10:23:46 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15TENdNj021262;
 Tue, 29 Jun 2021 14:23:44 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 39duv8hb4x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Jun 2021 14:23:44 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 15TEM66R30474560
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Jun 2021 14:22:06 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4608D11C0B5;
 Tue, 29 Jun 2021 14:23:42 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F36E911C0A6;
 Tue, 29 Jun 2021 14:23:41 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 29 Jun 2021 14:23:41 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.54.151])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id F3C8822007E;
 Tue, 29 Jun 2021 16:23:40 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 4/4] arm/aspeed: Add DPS310 to Witherspoon and Rainier
Date: Tue, 29 Jun 2021 16:23:36 +0200
Message-Id: <20210629142336.750058-5-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210629142336.750058-1-clg@kaod.org>
References: <20210629142336.750058-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: agcLS3DEOC-MQPtbWegifkL89ArqRWO3
X-Proofpoint-GUID: agcLS3DEOC-MQPtbWegifkL89ArqRWO3
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-29_06:2021-06-28,
 2021-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1034
 lowpriorityscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=986
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106290095
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qkQ1v8ZM2Ocz

From: Joel Stanley <joel@jms.id.au>

Witherspoon uses the DPS310 as a temperature sensor. Rainier uses it as
a temperature and humidity sensor.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20210616073358.750472-3-joel@jms.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index aac52a8cc2fd..0f291dc7be15 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -602,7 +602,6 @@ static void witherspoon_bmc_i2c_init(AspeedMachineSta=
te *bmc)
=20
     /* Bus 3: TODO bmp280@77 */
     /* Bus 3: TODO max31785@52 */
-    /* Bus 3: TODO dps310@76 */
     dev =3D DEVICE(i2c_slave_new(TYPE_PCA9552, 0x60));
     qdev_prop_set_string(dev, "description", "pca1");
     i2c_slave_realize_and_unref(I2C_SLAVE(dev),
@@ -617,6 +616,7 @@ static void witherspoon_bmc_i2c_init(AspeedMachineSta=
te *bmc)
         qdev_connect_gpio_out(dev, pca1_leds[i].gpio_id,
                               qdev_get_gpio_in(DEVICE(led), 0));
     }
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 3), "dps310", =
0x76);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), "tmp423", =
0x4c);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5), "tmp423", =
0x4c);
=20
@@ -725,9 +725,9 @@ static void rainier_bmc_i2c_init(AspeedMachineState *=
bmc)
     aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 2), 0x50, 64 * KiB);
     aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 3), 0x51, 64 * KiB);
=20
-    /* Bus 7: TODO dps310@76 */
     /* Bus 7: TODO max31785@52 */
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "pca9552",=
 0x61);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "dps310", =
0x76);
     /* Bus 7: TODO si7021-a20@20 */
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), TYPE_TMP10=
5,
                      0x48);
--=20
2.31.1

