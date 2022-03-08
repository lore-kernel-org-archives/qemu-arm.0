Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2295697lfo;
        Tue, 8 Mar 2022 04:22:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+tiUlmRTGxjCunBKuvHqd4zUPUTUeshMCnmA5r639AkNiaP4FgnHVweFRhLxiSUuzIPkI
X-Received: by 2002:a81:f0f:0:b0:2dc:5846:1ab3 with SMTP id 15-20020a810f0f000000b002dc58461ab3mr12881374ywp.216.1646742164379;
        Tue, 08 Mar 2022 04:22:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646742164; cv=none;
        d=google.com; s=arc-20160816;
        b=AL/ZXUGXGDOVNcPGDFjU/Le59BTTvKspYTrKTOw8ANYvLGotW2/5WTqMPtc7YBBoA4
         z1pAJUW8zYjWMVkAy/0CRFWJuIrqDvBfiDuLkopwpECQA8/s4CqJhqWW31lb+w/KMLXk
         aq7PGmjjmIy7pcq2U60z9UEsXVYhiZ3slEfmRr6UxTkPwzh68WU+Dm1cOW+L5GlA+m9F
         KHjNxypaVe0LmnSZfUmVZajxUuzwT1w02auyLsTS+9fQipXPurK0i6eqL9nlVy8t/XxK
         C4jHIj12T37N/fYP4rIhZhvyixUsSOaDqdek6fZWgDkZDacoU07dKEsR9AxmfNMdTtdU
         VaRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=TJI0CU95aP21V6mooCaEEMWiSMVSh/EXkDSLu0H0jNs=;
        b=OgsSZfi9L//E6B0S3o69bXgarxoKObHbVHQSjMRLlJptiXC9z948GQ1Hgj6gHd91C/
         vXvAWaQefklB5xshCZwBkXTdS/cJNGaS7LwyllFCS0jBMuSqLmjkrVXyZA5VEgyNPYiD
         pPnroN9by4eV4dq5OnxkXO5QjpF2lXlWu8HAVrj2Tt2at9mWil+ky4ToW58p/2kvlAOx
         EOdHuTeccnZVXsCWY91dPZSSQ7M6n/WCvDcV94fuVI5+ucxMnKF/XR7mMpwkrhQxRA/5
         j8sFj3Me2TOnI4Pe8UzkG7xDJ8BZgyuwn7FbvRKLQPbXHCOjINMs/CewnkB1WiQafbzl
         IPFg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14-20020a250b0e000000b006289ddd363dsi11752072ybl.540.2022.03.08.04.22.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Mar 2022 04:22:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRYrS-0000Hh-5L
	for alex.bennee@linaro.org; Tue, 08 Mar 2022 07:22:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nRYqy-0000DZ-SL; Tue, 08 Mar 2022 07:22:12 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:7396
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nRYqw-0006DT-6t; Tue, 08 Mar 2022 07:22:12 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22897c2N017293; 
 Tue, 8 Mar 2022 12:22:01 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ep0scff59-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Mar 2022 12:22:00 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 228C9DPj019251;
 Tue, 8 Mar 2022 12:21:59 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3eky4hygra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Mar 2022 12:21:59 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 228CLues55902574
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Mar 2022 12:21:57 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA99411C04A;
 Tue,  8 Mar 2022 12:21:56 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98D0411C04C;
 Tue,  8 Mar 2022 12:21:56 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  8 Mar 2022 12:21:56 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.238])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id D87E32201DC;
 Tue,  8 Mar 2022 13:21:55 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 04/11] aspeed/smc: Remove 'num_cs' field
Date: Tue,  8 Mar 2022 13:21:42 +0100
Message-Id: <20220308122149.1602798-5-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220308122149.1602798-1-clg@kaod.org>
References: <20220308122149.1602798-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: MFoqVuTS9R5tJedCZwzWQ7I6K4VMcpDw
X-Proofpoint-GUID: MFoqVuTS9R5tJedCZwzWQ7I6K4VMcpDw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-08_03,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 clxscore=1034 bulkscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=946 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203080063
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2hgNq+By5ysY

It is not used anymore.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220307071856.1410731-4-clg@kaod.org>
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
index 65588017659c..90504ee44408 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -343,8 +343,6 @@ static void aspeed_machine_init(MachineState *machine=
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

