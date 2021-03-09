Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2805728lfg;
        Tue, 9 Mar 2021 05:25:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJza5V0pHeRehmucLXa4DTbG0vyI2ALpNB4wr+ll/Y1Ty1WWlJN46g0AdCXuslKqMrrxjQS7
X-Received: by 2002:a05:6e02:1a6e:: with SMTP id w14mr23772494ilv.3.1615296321087;
        Tue, 09 Mar 2021 05:25:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615296321; cv=none;
        d=google.com; s=arc-20160816;
        b=TAmRwsv42qin1fFHq4UWL1G6Tt3b6T8NNXqX+gX46vxcZoe19NWEpZQI1XPII5TD2x
         R1or+0I2f9F3ZlpNxk4xYBfrNKCYOGBPeTy+5yb84QkR5tecuHySCtqMHJYVfI630Y88
         hzkNrE7oYn/03dhdQgsKfQ4mnqo6031Euvbv/ABZJIS6PoVb7ZKV2Kml5AzxwtPFvCap
         N/RV9yukrVfYVCcnkUQcet+usM3PNFz4ToYVXtjECyPH3cP2f+SbSyabVnY2jKHLOnqg
         gP7k6eeFG1XDugy21dVfHOuMHkBX3v8XyoECZlwzKJVUnLQTg2DdB9Kis0gvNnX9uAH0
         7rww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=AbWDEZnJjRwLmJ+zWeNL+JW6mXQc0yuliSDIlXIG6jI=;
        b=0UyyhUq3MWKWpEEDn0oaTF/LotZMNpNxQycWrk0gfKtR9YW2FTAuPbI/MDpwsWniuy
         5RuoQGSB3dDO6MO4SWG+IYHSv7SEd9jORLykB9SFVuKS6CumbA6ix5m9VN9j/3iqCOOw
         RtzBmkpaX49w8YECjl92ZGdWynOQwTnD2OU3ErfJNJJIwuHi9M5HR5DpLDrUjOKfCE6o
         RRC/apiCNneVIL6+H/jD1wGPWYRTKshw1wgq18J7TsvaPypHukR8tekOZdFHNhjn7vay
         5Nt+IE8ZUY4KStIBpZDvybOlGFOBN3Q8I24WvDmywIuvTMei51/553JXXeh3y/THJ+92
         lrBg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r1si13486301ilj.99.2021.03.09.05.25.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Mar 2021 05:25:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJcMS-0007no-E4
	for alex.bennee@linaro.org; Tue, 09 Mar 2021 08:25:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lJcEV-00025o-Oa; Tue, 09 Mar 2021 08:17:09 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:36122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lJcER-00079s-Gh; Tue, 09 Mar 2021 08:17:07 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 129D3qog087193; Tue, 9 Mar 2021 08:16:49 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 375wfksmqu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 08:16:49 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 129D8oQq007518;
 Tue, 9 Mar 2021 13:16:47 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3768t4g1q3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 13:16:47 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 129DGTbT24904152
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Mar 2021 13:16:29 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D97E1A4055;
 Tue,  9 Mar 2021 13:16:44 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9DCCEA404D;
 Tue,  9 Mar 2021 13:16:44 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  9 Mar 2021 13:16:44 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.251])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 060DE220270;
 Tue,  9 Mar 2021 14:16:43 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 3/7] hw/arm: ast2600: Force a multiple of 32 of IRQs for the GIC
Date: Tue,  9 Mar 2021 14:16:37 +0100
Message-Id: <20210309131641.2709380-4-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309131641.2709380-1-clg@kaod.org>
References: <20210309131641.2709380-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-09_11:2021-03-08,
 2021-03-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 clxscore=1034 mlxscore=0 mlxlogscore=573 spamscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103090064
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: awf1TFLJa+1t

From: Andrew Jeffery <andrew@aj.id.au>

This appears to be a requirement of the GIC model. The AST2600 allocates
197 GIC IRQs, which we will adjust shortly.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20210302014317.915120-2-andrew@aj.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_ast2600.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 49b00763864c..3d9e78fcc6b7 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -65,7 +65,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] =3D {
=20
 #define ASPEED_A7MPCORE_ADDR 0x40460000
=20
-#define ASPEED_SOC_AST2600_MAX_IRQ 128
+#define AST2600_MAX_IRQ 128
=20
 /* Shared Peripheral Interrupt values below are offset by -32 from datas=
heet */
 static const int aspeed_soc_ast2600_irqmap[] =3D {
@@ -260,7 +260,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
     object_property_set_int(OBJECT(&s->a7mpcore), "num-cpu", sc->num_cpu=
s,
                             &error_abort);
     object_property_set_int(OBJECT(&s->a7mpcore), "num-irq",
-                            ASPEED_SOC_AST2600_MAX_IRQ + GIC_INTERNAL,
+                            ROUND_UP(AST2600_MAX_IRQ + GIC_INTERNAL, 32)=
,
                             &error_abort);
=20
     sysbus_realize(SYS_BUS_DEVICE(&s->a7mpcore), &error_abort);
--=20
2.26.2

