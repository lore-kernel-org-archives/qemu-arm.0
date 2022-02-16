Received: by 2002:ac2:446b:0:0:0:0:0 with SMTP id y11csp909798lfl;
        Wed, 16 Feb 2022 01:31:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzOC/5qSnu1uH2BZBQuaawNWx0xSv51Z27Xa1vmpeRhIRzYBTaZO1j+6F1RgZ49cy4P/A46
X-Received: by 2002:ac8:5dcd:0:b0:2cb:9749:c82 with SMTP id e13-20020ac85dcd000000b002cb97490c82mr1391241qtx.146.1645003918025;
        Wed, 16 Feb 2022 01:31:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645003918; cv=none;
        d=google.com; s=arc-20160816;
        b=kTY0sEPD4b9A7nORxY0e3aFJlrfv1+gN5A6/novFknih9xNg0X4su0oPPuT8lcS4Pp
         kUmrZ3yHFR0Aev7MZxmafcsmyD8F9d4DMcxhIynDXs5ap+E7baJfI7DPilSXMfASpBKG
         NwfJXS+7yGk0ShQNj9zUacTrJylnXjQk0yceco2PyPp2i8JDoDQs97sUUFB7nWOTQIcq
         yfngQtsHEXbA2+niHl4J5ty2+FgvUPEtjHM/JiL4mHhJch6Ziwy4+sQeOG8LJ0wyNffq
         LREZIJuEoC/dkDDyxJRbgNfQnoZeLuvWfrOrtcZegrinyPsSj/s9FevIgoOhxhOr/+Jj
         iYxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=EtHlIBW949QibmpCPIpeII2w6z+VsRwz7rC3Y/976i0=;
        b=xO/I6nIsj6UdNCLgMWsDPyQ5Pu/TolRurSy/Swd6KyDOqDaJdi01vEhXwy/BBiePG8
         9cwtINe85HOcHXUcxMv7zN2JDUlgU0jmFoAmuKdREI1nLV0bJgul9FXc8ASXgXQpFN/5
         L+ik2MoJzKqLcNbB19vl6EIfMmjKtCbrDR6/qIAaiOUxL0XjlNXj00jL1AaUXrM9hwsP
         xX18WuOb99nrIO8XuHlEI6wW8tkDqgd6TBGv/cQ95C7eWSmKHr0OQqnu5qhnE4CVz4Ga
         ZyldErnZEM78b1RuDwtwfNNVM7+BLGrFFUSzydqQn/FPcDzYJ84IfkDHnrNesljj1lhW
         WxxA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f20si7888047qkg.124.2022.02.16.01.31.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Feb 2022 01:31:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nKGfF-0000fq-GM
	for alex.bennee@linaro.org; Wed, 16 Feb 2022 04:31:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nKGV9-0003Ux-1p; Wed, 16 Feb 2022 04:21:31 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:63808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nKGV6-00009R-I2; Wed, 16 Feb 2022 04:21:30 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21G9Bshv020586; 
 Wed, 16 Feb 2022 09:21:21 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8xdur6fy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 09:21:20 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21G9Ii2E024728;
 Wed, 16 Feb 2022 09:21:18 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3e64ha6hfe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 09:21:18 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21G9LFKP38273334
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Feb 2022 09:21:16 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE795A4066;
 Wed, 16 Feb 2022 09:21:15 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9600CA4062;
 Wed, 16 Feb 2022 09:21:15 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 16 Feb 2022 09:21:15 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.91.22])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id DC3FD2201E5;
 Wed, 16 Feb 2022 10:21:14 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 3/6] aspeed: rainier: Add i2c LED devices
Date: Wed, 16 Feb 2022 10:21:08 +0100
Message-Id: <20220216092111.237896-4-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216092111.237896-1-clg@kaod.org>
References: <20220216092111.237896-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: B6KLMSINhrWqoAd3cLx9QsDo3Jk4sPqD
X-Proofpoint-GUID: B6KLMSINhrWqoAd3cLx9QsDo3Jk4sPqD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_04,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 mlxlogscore=754 spamscore=0 clxscore=1034 lowpriorityscore=0 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202160051
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FH2BMq/JEZBL

From: Joel Stanley <joel@jms.id.au>

This helps quieten booting the current Rainier kernel.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 9789a489047b..0e5e5c31d59c 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -723,6 +723,8 @@ static void rainier_bmc_i2c_init(AspeedMachineState *=
bmc)
=20
     aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 0), 0x51, 32 * KiB)=
;
=20
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 3), "pca9552",=
 0x61);
+
     /* The rainier expects a TMP275 but a TMP105 is compatible */
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), TYPE_TMP10=
5,
                      0x48);
@@ -735,11 +737,14 @@ static void rainier_bmc_i2c_init(AspeedMachineState=
 *bmc)
     aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
     aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
     aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 2), 0x52, 64 * KiB);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), "pca9552",=
 0x60);
=20
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5), TYPE_TMP10=
5,
                      0x48);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5), TYPE_TMP10=
5,
                      0x49);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5), "pca9552",=
 0x60);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5), "pca9552",=
 0x61);
     i2c_mux =3D i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5)=
,
                                       "pca9546", 0x70);
     aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
@@ -758,7 +763,12 @@ static void rainier_bmc_i2c_init(AspeedMachineState =
*bmc)
     aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 2), 0x50, 64 * KiB);
     aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 3), 0x51, 64 * KiB);
=20
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "pca9552",=
 0x30);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "pca9552",=
 0x31);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "pca9552",=
 0x32);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "pca9552",=
 0x33);
     /* Bus 7: TODO max31785@52 */
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "pca9552",=
 0x60);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "pca9552",=
 0x61);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "dps310", =
0x76);
     /* Bus 7: TODO si7021-a20@20 */
@@ -773,6 +783,7 @@ static void rainier_bmc_i2c_init(AspeedMachineState *=
bmc)
                      0x4a);
     aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 8), 0x50, 64 * KiB)=
;
     aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 8), 0x51, 64 * KiB)=
;
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), "pca9552",=
 0x60);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), "pca9552",=
 0x61);
     /* Bus 8: ucd90320@11 */
     /* Bus 8: ucd90320@b */
@@ -794,13 +805,17 @@ static void rainier_bmc_i2c_init(AspeedMachineState=
 *bmc)
                                       "pca9546", 0x70);
     aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
     aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), "pca9552"=
, 0x60);
=20
=20
     aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 13), 0x50, 64 * KiB=
);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 13), "pca9552"=
, 0x60);
=20
     aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 14), 0x50, 64 * KiB=
);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 14), "pca9552"=
, 0x60);
=20
     aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 15), 0x50, 64 * KiB=
);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 15), "pca9552"=
, 0x60);
 }
=20
 static void get_pca9548_channels(I2CBus *bus, uint8_t mux_addr,
--=20
2.34.1

