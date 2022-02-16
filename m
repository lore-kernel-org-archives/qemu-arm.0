Received: by 2002:ac2:446b:0:0:0:0:0 with SMTP id y11csp920587lfl;
        Wed, 16 Feb 2022 01:57:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRpJzXsJmcbjMYyDwbv2L1PSX4gYn0a/jU4hRQk6XE3IlK+K2K6Sj7ceNY7mHmMkOJ3xCf
X-Received: by 2002:a05:622a:152:b0:2d8:9f4e:eba5 with SMTP id v18-20020a05622a015200b002d89f4eeba5mr1298310qtw.185.1645005460251;
        Wed, 16 Feb 2022 01:57:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645005460; cv=none;
        d=google.com; s=arc-20160816;
        b=spBfScgHjL/278XAwhcUj3O6lt0GH9CTX5olaC5ntFccK0Jrl2mvxgWcaYCjTQPYN2
         ZHm7+5I77YPu7R3hJaxya/Z+l5LynIc6fEoNWIgSB1bXux/B/G8WuYO5XJSnDbJrgtwz
         kmrG1I1QWbZhJhpS8hXSmBrMg0akXPdONIcvxqHpZI9wtPddR428zgwt+zl+tIutAZQf
         hjXDWxeRUnJs0/gsOnmwi1SHxYGA4NKhFlvnrL5++VIVa+VUj8juNdnwvJyOXR3oqPmj
         yZHfXC+YhnZv59X8XnhchjWEjornWzcf8sS29cqL7Yo9u4gmAi5MO0RgAm+IUaL2BT6c
         8ndA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=SucsqN+HcyL+yKFQt/NAPWq1bC/1CM5Lz7yKMRBSfKE=;
        b=X+xIOXRoZZzNYEoAHpqzZA446jHirLd0+roG+34lCeDnKXNuTepeZntTHn7btuHSRv
         cjH07opi8+38Cyh+lGXWpx4bbOvafX00h95A3aw/tj6iTnS5n8//iGhmWRALjAaqSF9z
         EmEcdAxZeuv0e0xepV6DEBSKozHu/B8LoZpbSTpedWPK3npEm2US3Fh67bkYgwlhXxjs
         4Ly4BFW++Uft2vpWbdjekzArCkPm7IeJxiHMvjw4GQV7nhXM+fEpsKHfbuvsQGmNKr37
         AS1AdFFf1PRhX7+gJ/a1NkIbfvqZtNhoj8LxNtkX3YfWRxWVoOjgN1S4cNKQQ+qoA8hp
         /WJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10si8987347qtx.644.2022.02.16.01.57.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Feb 2022 01:57:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:32776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nKH47-0003no-MJ
	for alex.bennee@linaro.org; Wed, 16 Feb 2022 04:57:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nKGVD-0003XX-Mq; Wed, 16 Feb 2022 04:21:35 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:24982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nKGVB-0000Cm-Jq; Wed, 16 Feb 2022 04:21:35 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21G8jolr012644; 
 Wed, 16 Feb 2022 09:21:19 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8x1xruc8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 09:21:19 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21G9HotZ031032;
 Wed, 16 Feb 2022 09:21:17 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04fra.de.ibm.com with ESMTP id 3e64ha5058-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 09:21:16 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21G9LEEP39059930
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Feb 2022 09:21:14 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A4304C052;
 Wed, 16 Feb 2022 09:21:14 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 278D94C058;
 Wed, 16 Feb 2022 09:21:14 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 16 Feb 2022 09:21:14 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.91.22])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 6F1822201E5;
 Wed, 16 Feb 2022 10:21:13 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 1/6] arm: Remove swift-bmc machine
Date: Wed, 16 Feb 2022 10:21:06 +0100
Message-Id: <20220216092111.237896-2-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216092111.237896-1-clg@kaod.org>
References: <20220216092111.237896-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zIfxwoqQ6IH58OqSyumSJzifHXhyOY6F
X-Proofpoint-ORIG-GUID: zIfxwoqQ6IH58OqSyumSJzifHXhyOY6F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_04,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 mlxlogscore=938 spamscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 phishscore=0 mlxscore=0 clxscore=1034 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202160051
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
X-TUID: EWkOuMBNdzRx

From: Joel Stanley <joel@jms.id.au>

It was scheduled for removal in 7.0.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Message-Id: <20220216080947.65955-1-joel@jms.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 docs/about/deprecated.rst  |  7 -----
 docs/system/arm/aspeed.rst |  1 -
 hw/arm/aspeed.c            | 53 --------------------------------------
 3 files changed, 61 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 26d00812ba94..85773db631c1 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -315,13 +315,6 @@ Use the more generic event ``DEVICE_UNPLUG_GUEST_ERR=
OR`` instead.
 System emulator machines
 ------------------------
=20
-Aspeed ``swift-bmc`` machine (since 6.1)
-''''''''''''''''''''''''''''''''''''''''
-
-This machine is deprecated because we have enough AST2500 based OpenPOWE=
R
-machines. It can be easily replaced by the ``witherspoon-bmc`` or the
-``romulus-bmc`` machines.
-
 PPC 405 ``taihu`` machine (since 7.0)
 '''''''''''''''''''''''''''''''''''''
=20
diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index d8b102fa0ad0..60ed94f18759 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -22,7 +22,6 @@ AST2500 SoC based machines :
 - ``romulus-bmc``          OpenPOWER Romulus POWER9 BMC
 - ``witherspoon-bmc``      OpenPOWER Witherspoon POWER9 BMC
 - ``sonorapass-bmc``       OCP SonoraPass BMC
-- ``swift-bmc``            OpenPOWER Swift BMC POWER9 (to be removed in =
v7.0)
 - ``fp5280g2-bmc``         Inspur FP5280G2 BMC
 - ``g220a-bmc``            Bytedance G220A BMC
=20
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index d911dc904fb3..9789a489047b 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -544,35 +544,6 @@ static void romulus_bmc_i2c_init(AspeedMachineState =
*bmc)
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), "ds1338",=
 0x32);
 }
=20
-static void swift_bmc_i2c_init(AspeedMachineState *bmc)
-{
-    AspeedSoCState *soc =3D &bmc->soc;
-
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 3), "pca9552",=
 0x60);
-
-    /* The swift board expects a TMP275 but a TMP105 is compatible */
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "tmp105", =
0x48);
-    /* The swift board expects a pca9551 but a pca9552 is compatible */
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "pca9552",=
 0x60);
-
-    /* The swift board expects an Epson RX8900 RTC but a ds1338 is compa=
tible */
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), "ds1338", =
0x32);
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), "pca9552",=
 0x60);
-
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "tmp423", =
0x4c);
-    /* The swift board expects a pca9539 but a pca9552 is compatible */
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "pca9552",=
 0x74);
-
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 10), "tmp423",=
 0x4c);
-    /* The swift board expects a pca9539 but a pca9552 is compatible */
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 10), "pca9552"=
,
-                     0x74);
-
-    /* The swift board expects a TMP275 but a TMP105 is compatible */
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 12), "tmp105",=
 0x48);
-    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 12), "tmp105",=
 0x4a);
-}
-
 static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
 {
     AspeedSoCState *soc =3D &bmc->soc;
@@ -1102,26 +1073,6 @@ static void aspeed_machine_sonorapass_class_init(O=
bjectClass *oc, void *data)
         aspeed_soc_num_cpus(amc->soc_name);
 };
=20
-static void aspeed_machine_swift_class_init(ObjectClass *oc, void *data)
-{
-    MachineClass *mc =3D MACHINE_CLASS(oc);
-    AspeedMachineClass *amc =3D ASPEED_MACHINE_CLASS(oc);
-
-    mc->desc       =3D "OpenPOWER Swift BMC (ARM1176)";
-    amc->soc_name  =3D "ast2500-a1";
-    amc->hw_strap1 =3D SWIFT_BMC_HW_STRAP1;
-    amc->fmc_model =3D "mx66l1g45g";
-    amc->spi_model =3D "mx66l1g45g";
-    amc->num_cs    =3D 2;
-    amc->i2c_init  =3D swift_bmc_i2c_init;
-    mc->default_ram_size       =3D 512 * MiB;
-    mc->default_cpus =3D mc->min_cpus =3D mc->max_cpus =3D
-        aspeed_soc_num_cpus(amc->soc_name);
-
-    mc->deprecation_reason =3D "redundant system. Please use a similar "
-        "OpenPOWER BMC, Witherspoon or Romulus.";
-};
-
 static void aspeed_machine_witherspoon_class_init(ObjectClass *oc, void =
*data)
 {
     MachineClass *mc =3D MACHINE_CLASS(oc);
@@ -1277,10 +1228,6 @@ static const TypeInfo aspeed_machine_types[] =3D {
         .name          =3D MACHINE_TYPE_NAME("romulus-bmc"),
         .parent        =3D TYPE_ASPEED_MACHINE,
         .class_init    =3D aspeed_machine_romulus_class_init,
-    }, {
-        .name          =3D MACHINE_TYPE_NAME("swift-bmc"),
-        .parent        =3D TYPE_ASPEED_MACHINE,
-        .class_init    =3D aspeed_machine_swift_class_init,
     }, {
         .name          =3D MACHINE_TYPE_NAME("sonorapass-bmc"),
         .parent        =3D TYPE_ASPEED_MACHINE,
--=20
2.34.1

