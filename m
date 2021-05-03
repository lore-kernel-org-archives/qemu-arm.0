Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp2370638lfg;
        Sun, 2 May 2021 22:37:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhSPKyzzMjc/GH+7GpugHNxbel78QtKESL2x+SSskPdv8JXNYgYJjDLm0PRM8Y0XBfO4PV
X-Received: by 2002:a05:6e02:190a:: with SMTP id w10mr14606645ilu.1.1620020273475;
        Sun, 02 May 2021 22:37:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620020273; cv=none;
        d=google.com; s=arc-20160816;
        b=qX5NqAUujTQhFD/kfsukU8FjFjoygO2NLqDAWud3zxXN/jJyHfY3CKXFn/WH48T9AN
         pta1hlEks+jTSgvKyUlp9tp0ul2+z97UF0h666SbQamDx2y2WMpeiwgtBkYnNeWX+6jt
         9jGYxR6pR+u9C499KhY3eOUyY1lLeta/29biCsbPJ3xVhJGUfGNEWElNygBx8jpHCTMa
         +EBYdx1PltRqEDSxcotVWXgKg2NeQASTjRgvBnh/KIAakmFLCiCTp6WywQDizXK2XEmw
         LKQwSAG8xCgdUAKTbVhpkykJ3Ylc+xxvsASr7TEXwYkMpxn3gibytYSUDMSFJUho4Pmx
         k0CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=1lAtnamSW+lxy86Pv0mIBtcx7YcdmWf+fo+qO9F0bJM=;
        b=p1CdKAgmTsUNOljL6ytTvzqsJWMjxiI2jXU9j0OUID4ozF1Rv3GkAdR/1qQqIPrIR0
         DdTGa2ngw0jTT/WOUzYr8Q+u0QU7kWDCW5mQrtq2rlk5VNVh9zt4Sq71lxLTb7LPY9xE
         lym68rWoJUV37FYMSbPePFdac4gIADcmZNf6ZVz1/OE/hksCl8GsMAx7pbGrVzjZQEF5
         0p8B3sqiMT4P5fu4h44XQSmb6zuw5zBWZ7ufkBPC2RKh7fTZYAKdBuhy1kwazR2a8UT0
         tqoWS4hS1mZ/TjJYQz7Wy+kfs9aeKhKtvXk9RO/CT+pu/y4dKxRNy6PZtlXlwfRusPet
         g6JA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q8si9581141ilv.144.2021.05.02.22.37.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 May 2021 22:37:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ldRHE-0004GY-Rl
	for alex.bennee@linaro.org; Mon, 03 May 2021 01:37:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ldR6K-0004qe-V6; Mon, 03 May 2021 01:26:38 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:11422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ldR6F-00069D-Ga; Mon, 03 May 2021 01:26:35 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1435FIJe068689; Mon, 3 May 2021 01:26:13 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38aav4g53y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 01:26:13 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1435IuBw025530;
 Mon, 3 May 2021 05:26:11 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 388xm8ggw9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 05:26:10 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1435Q8EN29884848
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 May 2021 05:26:08 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA991A4057;
 Mon,  3 May 2021 05:26:08 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 949F9A4040;
 Mon,  3 May 2021 05:26:08 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  3 May 2021 05:26:08 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.40.192])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id F1A1722004E;
 Mon,  3 May 2021 07:26:07 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 02/18] aspeed/smc: Remove unused "sdram-base" property
Date: Mon,  3 May 2021 07:25:44 +0200
Message-Id: <20210503052600.290483-3-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210503052600.290483-1-clg@kaod.org>
References: <20210503052600.290483-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: imLGpHOmQnu4B64K4it2k-mv57d-hDCE
X-Proofpoint-GUID: imLGpHOmQnu4B64K4it2k-mv57d-hDCE
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-03_02:2021-04-30,
 2021-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 mlxscore=0 impostorscore=0 phishscore=0 priorityscore=1501 mlxlogscore=967
 spamscore=0 malwarescore=0 clxscore=1034 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2105030033
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SSenxgC4IFZq

Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-Id: <20210407171637.777743-3-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h | 3 ---
 hw/arm/aspeed_ast2600.c     | 4 ----
 hw/arm/aspeed_soc.c         | 4 ----
 hw/ssi/aspeed_smc.c         | 1 -
 4 files changed, 12 deletions(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 16c03fe64f3b..ccd71d9b534e 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -103,9 +103,6 @@ struct AspeedSMCState {
     uint8_t r_timings;
     uint8_t conf_enable_w0;
=20
-    /* for DMA support */
-    uint64_t sdram_base;
-
     AddressSpace flash_as;
     MemoryRegion *dram_mr;
     AddressSpace dram_as;
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index bc87e754a3cc..2a1255b6a042 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -344,10 +344,6 @@ static void aspeed_soc_ast2600_realize(DeviceState *=
dev, Error **errp)
     /* FMC, The number of CS is set at the board level */
     object_property_set_link(OBJECT(&s->fmc), "dram", OBJECT(s->dram_mr)=
,
                              &error_abort);
-    if (!object_property_set_int(OBJECT(&s->fmc), "sdram-base",
-                                 sc->memmap[ASPEED_DEV_SDRAM], errp)) {
-        return;
-    }
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->fmc), errp)) {
         return;
     }
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 057d053c8478..817f3ba63dfd 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -301,10 +301,6 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
     /* FMC, The number of CS is set at the board level */
     object_property_set_link(OBJECT(&s->fmc), "dram", OBJECT(s->dram_mr)=
,
                              &error_abort);
-    if (!object_property_set_int(OBJECT(&s->fmc), "sdram-base",
-                                 sc->memmap[ASPEED_DEV_SDRAM], errp)) {
-        return;
-    }
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->fmc), errp)) {
         return;
     }
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 6f72fb028e59..884e08aca4e2 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -1431,7 +1431,6 @@ static const VMStateDescription vmstate_aspeed_smc =
=3D {
 static Property aspeed_smc_properties[] =3D {
     DEFINE_PROP_UINT32("num-cs", AspeedSMCState, num_cs, 1),
     DEFINE_PROP_BOOL("inject-failure", AspeedSMCState, inject_failure, f=
alse),
-    DEFINE_PROP_UINT64("sdram-base", AspeedSMCState, sdram_base, 0),
     DEFINE_PROP_LINK("dram", AspeedSMCState, dram_mr,
                      TYPE_MEMORY_REGION, MemoryRegion *),
     DEFINE_PROP_END_OF_LIST(),
--=20
2.26.3

