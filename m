Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1286176lfo;
        Sun, 6 Mar 2022 23:25:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6rfbz+sDjj8Ge70mqjiAxK7vsXDWK8qWAqLrf2rh5ZsLusFqHDYn4eanmkn4ZtGqe85Gx
X-Received: by 2002:a05:622a:64a:b0:2de:ac9e:fd34 with SMTP id a10-20020a05622a064a00b002deac9efd34mr8433177qtb.280.1646637936878;
        Sun, 06 Mar 2022 23:25:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646637936; cv=none;
        d=google.com; s=arc-20160816;
        b=QfXURF0BIv1EZ7F8lB2jv3cwoHr5OAXjdzF6Ai8heUiksSLGsY0NwIxdxdI3UEnpy8
         E4GLpW2VDoAhSbaxFgREbIQ2Ba8KSjHQADNVY7NsFeOxfauM8Vu6HVW6M1PfcMiEWomG
         wcwORo7XoxhlJxUwBvOPgfgrtGynpJHoPMVIX69zFto3ATlSA4vCNqFRW+UHzLaWf3f/
         TEpbSFVRWJ3iqGRoDFvvuvPu8UTagV93MXNZR7hVckBXp70aXrjpmq+hNKFxsKNA12cm
         N9y8c8khHhODVcq/ldMMnixRkgAziKMCgP5MnwB60UM64lqCVcbEpC0RSOAVec2LuLOL
         FAAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=AVxVSxUAfICO/mSVKJy9EziZGlPSTyhjVQqH4RvNmaA=;
        b=rmbusiHVIKaNtiNGbX+qEYBytawENLnJ44OvKAqh7LuuqWTYqOzLAOPKwoduhTtkeW
         4RnkE3uoUIA4bsskDXICEANBxb1spi/9hK5gxGO/+SBQlRlRXmS2813MmGW5soM/H5Ut
         YwW7yZbyNqaZR+2H3kPDpWaLKMQQKoPR9Y/i4vOH+C2UZmHp6Hk2SY+U4BJVUA1XP4im
         C7QdYv4r3AtUu+AvEuo3uFVpvHymD2XpUYOUdBE9oGQVEjRHCdPlkrlqY+FKBPNaRCRa
         /PIeG621wRI7nPHa3ZpaJc0omr/gTDViyj/L3ZnyOMHnI7JG2VU63pjaN8G2ppk346CD
         g6wA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gm7-20020a056214268700b004356a94170csi3207751qvb.55.2022.03.06.23.25.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 06 Mar 2022 23:25:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nR7kO-0002TM-D6
	for alex.bennee@linaro.org; Mon, 07 Mar 2022 02:25:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nR7eR-0003Kw-3r; Mon, 07 Mar 2022 02:19:27 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:50240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nR7eO-00039D-VJ; Mon, 07 Mar 2022 02:19:26 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2273fX6G028989; 
 Mon, 7 Mar 2022 07:19:04 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3emhdrcc2a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Mar 2022 07:19:04 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2277IakM032424;
 Mon, 7 Mar 2022 07:19:02 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3emk62j84a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Mar 2022 07:19:02 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2277IxB547513864
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Mar 2022 07:19:00 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D5963A405B;
 Mon,  7 Mar 2022 07:18:59 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 896B6A4062;
 Mon,  7 Mar 2022 07:18:59 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  7 Mar 2022 07:18:59 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.76.59])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id BCF8C22036B;
 Mon,  7 Mar 2022 08:18:58 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 1/6] aspeed/smc: Use max number of CE instead of 'num_cs'
Date: Mon,  7 Mar 2022 08:18:51 +0100
Message-Id: <20220307071856.1410731-2-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307071856.1410731-1-clg@kaod.org>
References: <20220307071856.1410731-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xH08n26WisSW5FtoZw12EKn73q0GCco8
X-Proofpoint-GUID: xH08n26WisSW5FtoZw12EKn73q0GCco8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-07_01,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 clxscore=1034 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0
 mlxscore=0 mlxlogscore=657 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203070041
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pupxHJg8UeHH

The Aspeed SMC model uses the 'num_cs' field to allocate resources
fitting the number of devices of the machine. This is a small
optimization without real need in the controller. Simplify modelling
and use the max_peripherals field instead.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index d899be17fd71..a5d8bb717fc7 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -693,7 +693,7 @@ static void aspeed_smc_reset(DeviceState *d)
     }
=20
     /* Unselect all peripherals */
-    for (i =3D 0; i < s->num_cs; ++i) {
+    for (i =3D 0; i < asc->max_peripherals; ++i) {
         s->regs[s->r_ctrl0 + i] |=3D CTRL_CE_STOP_ACTIVE;
         qemu_set_irq(s->cs_lines[i], true);
     }
@@ -1042,7 +1042,7 @@ static void aspeed_smc_write(void *opaque, hwaddr a=
ddr, uint64_t data,
          addr < s->r_timings + asc->nregs_timings) ||
         addr =3D=3D s->r_ce_ctrl) {
         s->regs[addr] =3D value;
-    } else if (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + s->num_cs) {
+    } else if (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + asc->max_peri=
pherals) {
         int cs =3D addr - s->r_ctrl0;
         aspeed_smc_flash_update_ctrl(&s->flashes[cs], value);
     } else if (addr >=3D R_SEG_ADDR0 &&
@@ -1139,9 +1139,9 @@ static void aspeed_smc_realize(DeviceState *dev, Er=
ror **errp)
     s->spi =3D ssi_create_bus(dev, "spi");
=20
     /* Setup cs_lines for peripherals */
-    s->cs_lines =3D g_new0(qemu_irq, s->num_cs);
+    s->cs_lines =3D g_new0(qemu_irq, asc->max_peripherals);
=20
-    for (i =3D 0; i < s->num_cs; ++i) {
+    for (i =3D 0; i < asc->max_peripherals; ++i) {
         sysbus_init_irq(sbd, &s->cs_lines[i]);
     }
=20
--=20
2.34.1

