Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp539590lfq;
        Fri, 18 Feb 2022 00:23:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy2nR5M7oCygMCfyGpxr4pHrF6HQMbYYDXCcku0O6GU8DeCkyo/nkpce2robzz0eAvfgxmo
X-Received: by 2002:a05:622a:174e:b0:2b2:e5e1:4159 with SMTP id l14-20020a05622a174e00b002b2e5e14159mr5709317qtk.120.1645172639479;
        Fri, 18 Feb 2022 00:23:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645172639; cv=none;
        d=google.com; s=arc-20160816;
        b=0IGyO1ud5NMbppu8Ya7Q8ovakfXhMuNvucUD67nEPDcXKiztSb3SGeIQeyhXESEaaf
         wSLvc7/qa5v+JrP4p3hib7Ph5uEmTCYdQT/fxGi44yvHNaYNcoBFykNeaXmwWC1u6a+C
         Hn71OAfsWi0ysmuv7ughG3yspnmBwcH3ncuUASTi7XTcN1hqeE7hNTC3eh/6JzZZv+0u
         o0xu6GyLeGzqSUAvbTdL3VQ5vXZXb8SocLIqsV6HENwvvEN9rX2hcdJPP30Rzdc5FIWN
         4oot5VF6E7ge8xW8VeTMacG/nTj5iLun6avNO2Eau/zvLFHJH+uuFXMhgdeYuZchWHZG
         xwXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=ECkbTN4Si9di6p0Y/ER7iYxG9350SmqjTgmXUeliLcE=;
        b=WT+u9PzGZMtL51jF42vhlpLm5tpo3RSLIJH1npBiyBzlwkRbmgJNh9Nu0S34upWaJE
         8jayaD7niEPvSUop4vo4nwLvGBVapHlzGh7SWUvmaJAbN7kOz0L1t0brabVVYuw6bctL
         DIgMiLPYbNC2V2YlRx45iJGW/6mSNxOGrchpkGLAjrjbRdHXTwS93wyFta7UQjrRFWoL
         xzHLmyq0Ekc47HXqwm2VDKSgrc/oEFUjE2gVvMkb5KpvHMOTzh3fZ8zmlqN7o4SqoUBm
         pimiTpUMSQqSVD4E+AvlTfdIGtRstv3aldXRnzTz7HIKdqHKblaIRLFxoQgTiPJJMenI
         q6gA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id az34si10137075qkb.687.2022.02.18.00.23.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Feb 2022 00:23:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nKyYY-0004fG-Ux
	for alex.bennee@linaro.org; Fri, 18 Feb 2022 03:23:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nKyTO-00074j-7s; Fri, 18 Feb 2022 03:18:38 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:4870
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nKyTM-0000Yu-DV; Fri, 18 Feb 2022 03:18:37 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21I6bEmu023322; 
 Fri, 18 Feb 2022 08:18:24 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ea54xk6n0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 08:18:24 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21I8DsvK012480;
 Fri, 18 Feb 2022 08:18:22 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3e64harcjn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 08:18:22 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21I87q6u48300456
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 08:07:52 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 365AD4C040;
 Fri, 18 Feb 2022 08:18:20 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBB6B4C04E;
 Fri, 18 Feb 2022 08:18:19 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 18 Feb 2022 08:18:19 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.94])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id CE70C2201E5;
 Fri, 18 Feb 2022 09:18:18 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 3/7] aspeed: rainier: Add i2c LED devices
Date: Fri, 18 Feb 2022 09:18:11 +0100
Message-Id: <20220218081815.641169-4-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218081815.641169-1-clg@kaod.org>
References: <20220218081815.641169-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: S-YL80JNbyHk63HujJhgTymUA5h5UiNZ
X-Proofpoint-ORIG-GUID: S-YL80JNbyHk63HujJhgTymUA5h5UiNZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-18_03,2022-02-17_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1034 priorityscore=1501
 phishscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=788 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202180051
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZBr4ty20KNGP

From: Joel Stanley <joel@jms.id.au>

This helps quieten booting the current Rainier kernel.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index faf7a9fd6863..7590b36bb017 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -712,6 +712,8 @@ static void rainier_bmc_i2c_init(AspeedMachineState *=
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
@@ -724,11 +726,14 @@ static void rainier_bmc_i2c_init(AspeedMachineState=
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
@@ -747,7 +752,12 @@ static void rainier_bmc_i2c_init(AspeedMachineState =
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
@@ -762,6 +772,7 @@ static void rainier_bmc_i2c_init(AspeedMachineState *=
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
@@ -783,13 +794,17 @@ static void rainier_bmc_i2c_init(AspeedMachineState=
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

