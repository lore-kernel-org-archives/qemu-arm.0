Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp665866lfr;
        Wed, 7 Apr 2021 10:35:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjP7XgnPQ30xt/HbqsLIWLS65cbp7NdieXPTnJDy1P0N0WZvWKafQTV/WwN15fjjKSKhvE
X-Received: by 2002:a05:6638:144e:: with SMTP id l14mr4598804jad.76.1617816901324;
        Wed, 07 Apr 2021 10:35:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617816901; cv=none;
        d=google.com; s=arc-20160816;
        b=c6aEdRsDB+zAvHwt8duAbs1NfEMZbbcwhZf5sikNJvyotu8lJgZx/dq9qgKSrcz0Q5
         vAtj2C9ozqdcXYHBAwn45PWIA5ajv2bbkLJ132xBe2NhTjKmegSkAJn96wnW0eJW+uio
         X/MJRTw8+We7gHKmX4DYQfN08f0ELtXtIKZKYfvR91vcOXZN2zuVPJMlr0kq+gdn1Jqi
         7+mUG946zPAFI0f49Wsw+KpYCU1gtydqGOD+/lyYCnCMtkHjneyxZh2xqNc9PRiIVgsU
         2Ddj1yABC1pQwEX/Cee3KfuKgS4W8zecW1kyGubTngM/CkzmnFnCfhMuywY/1Yr+S1N+
         2lQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=hU9pMjRw6gryaTd4yJIGpQvgObcnuOwmadI5qIDlAXU=;
        b=esYbG9sNsIx2rqMjuA0xmrd03xaPYsf+flmJivIM1O02RZXPDMjqDLGn+dwfTLIXxU
         H5YJ1CoA3VF5QI7m0MtfN8D0Ffq8F6NTOR3uysh2P8DVEMm5fuctt1aJeKvZJlP6JCo7
         R5mB8hQJwIhAM3NQVLrj4+8EOZibouA48azsRXdIrPGX+0pBfltLlosAYg3URw/bY70h
         1VUc/PtvqqwoSb9aR8iPWFhwQwSCH/XlA66M9vPpKCfiFSlA8S1V+twZwhJGTj6ZHdrF
         bz/DptffK/c9Y2SyEFJL8rMaz0R3AV/i3g4YjrKW+nGTrSo95bnDDmp8A9JSLjbPv0N9
         KGaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s17si21164737jat.66.2021.04.07.10.35.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Apr 2021 10:35:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUC4y-0004yN-J5
	for alex.bennee@linaro.org; Wed, 07 Apr 2021 13:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lUBo8-00007x-Av; Wed, 07 Apr 2021 13:17:36 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:30258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lUBo6-0006qh-40; Wed, 07 Apr 2021 13:17:35 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 137H2x4t084037; Wed, 7 Apr 2021 13:17:02 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37rw7jr9s7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 13:17:01 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 137HCddD008080;
 Wed, 7 Apr 2021 17:16:59 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 37rvmq8fmt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 17:16:59 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 137HGvsC39977386
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Apr 2021 17:16:57 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20BF5A4053;
 Wed,  7 Apr 2021 17:16:57 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DCC8CA4040;
 Wed,  7 Apr 2021 17:16:56 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  7 Apr 2021 17:16:56 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.229])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 440E92200C7;
 Wed,  7 Apr 2021 19:16:56 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 24/24] arm/aspeed: Add DPS310 to witherspoon
Date: Wed,  7 Apr 2021 19:16:37 +0200
Message-Id: <20210407171637.777743-25-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210407171637.777743-1-clg@kaod.org>
References: <20210407171637.777743-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sH2hhSQqhkOdGK9A6jT8lWukPZdVvhn8
X-Proofpoint-ORIG-GUID: sH2hhSQqhkOdGK9A6jT8lWukPZdVvhn8
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-07_09:2021-04-07,
 2021-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 mlxscore=0
 mlxlogscore=967 malwarescore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104070116
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y0l3gCscI4Tr

From: Joel Stanley <joel@jms.id.au>

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 96782269b220..c1e1434a3770 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -521,7 +521,6 @@ static void witherspoon_bmc_i2c_init(AspeedMachineSta=
te *bmc)
=20
     /* Bus 3: TODO bmp280@77 */
     /* Bus 3: TODO max31785@52 */
-    /* Bus 3: TODO dps310@76 */
     dev =3D DEVICE(i2c_slave_new(TYPE_PCA9552, 0x60));
     qdev_prop_set_string(dev, "description", "pca1");
     i2c_slave_realize_and_unref(I2C_SLAVE(dev),
@@ -536,6 +535,7 @@ static void witherspoon_bmc_i2c_init(AspeedMachineSta=
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
--=20
2.26.3

