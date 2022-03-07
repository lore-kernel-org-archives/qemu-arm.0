Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1283540lfo;
        Sun, 6 Mar 2022 23:19:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzPcOm9xC6WwRSBLmd4SEaaPi/t+2nRerYY/Q9a/+fsRJDfRC8gDvqxr3ImO5RZIWs9l9YC
X-Received: by 2002:ad4:5aef:0:b0:42c:4017:aed0 with SMTP id c15-20020ad45aef000000b0042c4017aed0mr7461919qvh.68.1646637575689;
        Sun, 06 Mar 2022 23:19:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646637575; cv=none;
        d=google.com; s=arc-20160816;
        b=aQgzzRyQEmhQg8mxRXzw97wlhjs/l2GV5Ejun4itzutaMysccG3lOwR7O14tLPy64l
         h1RwhzefDcPQpfJLcaMK+ufhUkRuEG+xGkqyCFHhnKeJyOzdU/9EYM/WuCL45UfTB2Kj
         oW1nklkdcoYf3iq1tXjjQ4ouiI22ZvlCQ0AedwOJwGWr/FNFkRVI0V+fFu03/wHuYSK0
         G+Mfogu/lYkWFV6ftRKUr8tSScF0+VfxH4PI/4sMSkVBDJ87Ray5zE3wqF4EPU0x8M+z
         AAmmjTNEN5/W7tXQMgbbQQobNo/mciQ1m85peETJhCFBPfaOXi9MDZ0SSoFywKHP+CCk
         EUkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=teXGMTeatxB/L2IifiyA46gs/ObeyeFDL3UzDmuNy+A=;
        b=p1bsJR5A/p5xeRXIfUN/Y0UUX9wR3sTmQeT342t76N2lrLnLXarLmFkWefOtgT1T5k
         dIYYaGvtkqJxz5xqx+DEmoMVueRjqkkrRs7sn/O0qUVPIfcQg3JV7OPOXQjLzgQTJX8J
         XS4nh4Id+aRZln+B17exjsTVwz48BSnfKHo58B76Y8wwRskJ8JjNIcS2xM/jiKXAr+yy
         /RkFdeRNUL2An8rQSKMxYZO1AiLDDGOxnhzYqtBUm9e8txhcYxe1dt2wYtv0WuhIvzqv
         XakmDVDmVpLwmgG7w9EkEpNomtzkILBUl2UwzpYUMTpwE+R6PR9h7F3DKCzkXEmcgr2V
         A++Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e22-20020ac845d6000000b002e029ea0d26si4875114qto.763.2022.03.06.23.19.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 06 Mar 2022 23:19:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nR7eY-0003Gf-SE
	for alex.bennee@linaro.org; Mon, 07 Mar 2022 02:19:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nR7eK-0003Cd-Dy; Mon, 07 Mar 2022 02:19:20 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:10550
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nR7eI-00036G-IX; Mon, 07 Mar 2022 02:19:20 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2275jQmP028862; 
 Mon, 7 Mar 2022 07:19:05 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3enc6c9hne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Mar 2022 07:19:05 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2277IgYE027209;
 Mon, 7 Mar 2022 07:19:03 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 3ekyg8bc88-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Mar 2022 07:19:03 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2277J17Q12845532
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Mar 2022 07:19:01 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56778A4051;
 Mon,  7 Mar 2022 07:19:01 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0AA2CA404D;
 Mon,  7 Mar 2022 07:19:01 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  7 Mar 2022 07:19:00 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.76.59])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 4071E22036B;
 Mon,  7 Mar 2022 08:19:00 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 3/6] aspeed/smc: Remove 'num_cs' field
Date: Mon,  7 Mar 2022 08:18:53 +0100
Message-Id: <20220307071856.1410731-4-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307071856.1410731-1-clg@kaod.org>
References: <20220307071856.1410731-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RHGvnbJuRfGg5qGDkw-ihomlPum3jAz5
X-Proofpoint-GUID: RHGvnbJuRfGg5qGDkw-ihomlPum3jAz5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-07_01,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 mlxlogscore=816
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 clxscore=1034
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203070041
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9OlM560dIKy0

It is not used anymore.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h | 1 -
 hw/arm/aspeed.c             | 2 --
 hw/arm/aspeed_ast2600.c     | 2 --
 hw/arm/aspeed_soc.c         | 2 --
 hw/ssi/aspeed_smc.c         | 7 -------
 5 files changed, 14 deletions(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index cad73ddc13f2..4a9354e13c7f 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -57,7 +57,6 @@ struct AspeedSMCState {
=20
     qemu_irq irq;
=20
-    uint32_t num_cs;
     qemu_irq *cs_lines;
     bool inject_failure;
=20
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index be24508a9854..8f14738676f6 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -352,8 +352,6 @@ static void aspeed_machine_init(MachineState *machine=
)
                             &error_abort);
     object_property_set_int(OBJECT(&bmc->soc), "hw-strap2", amc->hw_stra=
p2,
                             &error_abort);
-    object_property_set_int(OBJECT(&bmc->soc), "num-cs", amc->num_cs,
-                            &error_abort);
     object_property_set_link(OBJECT(&bmc->soc), "dram",
                              OBJECT(machine->ram), &error_abort);
     if (machine->kernel_filename) {
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 21cd3342c578..c1e15e37739c 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -163,7 +163,6 @@ static void aspeed_soc_ast2600_init(Object *obj)
=20
     snprintf(typename, sizeof(typename), "aspeed.fmc-%s", socname);
     object_initialize_child(obj, "fmc", &s->fmc, typename);
-    object_property_add_alias(obj, "num-cs", OBJECT(&s->fmc), "num-cs");
=20
     for (i =3D 0; i < sc->spis_num; i++) {
         snprintf(typename, sizeof(typename), "aspeed.spi%d-%s", i + 1, s=
ocname);
@@ -383,7 +382,6 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
     for (i =3D 0; i < sc->spis_num; i++) {
         object_property_set_link(OBJECT(&s->spi[i]), "dram",
                                  OBJECT(s->dram_mr), &error_abort);
-        object_property_set_int(OBJECT(&s->spi[i]), "num-cs", 1, &error_=
abort);
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->spi[i]), errp)) {
             return;
         }
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 7d53cf2f5133..58714cb2a01d 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -170,7 +170,6 @@ static void aspeed_soc_init(Object *obj)
=20
     snprintf(typename, sizeof(typename), "aspeed.fmc-%s", socname);
     object_initialize_child(obj, "fmc", &s->fmc, typename);
-    object_property_add_alias(obj, "num-cs", OBJECT(&s->fmc), "num-cs");
=20
     for (i =3D 0; i < sc->spis_num; i++) {
         snprintf(typename, sizeof(typename), "aspeed.spi%d-%s", i + 1, s=
ocname);
@@ -327,7 +326,6 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
=20
     /* SPI */
     for (i =3D 0; i < sc->spis_num; i++) {
-        object_property_set_int(OBJECT(&s->spi[i]), "num-cs", 1, &error_=
abort);
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->spi[i]), errp)) {
             return;
         }
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index a5d8bb717fc7..6859f061c8be 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -1127,12 +1127,6 @@ static void aspeed_smc_realize(DeviceState *dev, E=
rror **errp)
     s->r_timings =3D asc->r_timings;
     s->conf_enable_w0 =3D asc->conf_enable_w0;
=20
-    /* Enforce some real HW limits */
-    if (s->num_cs > asc->max_peripherals) {
-        aspeed_smc_error("num_cs cannot exceed: %d", asc->max_peripheral=
s);
-        s->num_cs =3D asc->max_peripherals;
-    }
-
     /* DMA irq. Keep it first for the initialization in the SoC */
     sysbus_init_irq(sbd, &s->irq);
=20
@@ -1211,7 +1205,6 @@ static const VMStateDescription vmstate_aspeed_smc =
=3D {
 };
=20
 static Property aspeed_smc_properties[] =3D {
-    DEFINE_PROP_UINT32("num-cs", AspeedSMCState, num_cs, 1),
     DEFINE_PROP_BOOL("inject-failure", AspeedSMCState, inject_failure, f=
alse),
     DEFINE_PROP_LINK("dram", AspeedSMCState, dram_mr,
                      TYPE_MEMORY_REGION, MemoryRegion *),
--=20
2.34.1

