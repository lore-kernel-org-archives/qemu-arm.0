Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp654832lfr;
        Wed, 7 Apr 2021 10:21:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7PNy1cu5atEEReA1cRXMNmm+tJWpXT0Uz9EdPow6dlxLxbL5apWxqqNLctdMHcS6VdTuQ
X-Received: by 2002:a92:ac0c:: with SMTP id r12mr3485106ilh.140.1617816065798;
        Wed, 07 Apr 2021 10:21:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617816065; cv=none;
        d=google.com; s=arc-20160816;
        b=ePm7zWVlL9EzRc8Bn8u1vXQaOHxUFuSGNI/bkMa663clgEEwREfHkirLTU/tPvPMum
         J3n5mq2GGJbgY9N1Idand3NAT+4A9HHBl2xT5uOxuqdH0PWm284UMvsGk82fYTu1uirj
         OY1ZfrK2NaYrfiu2ew6TBFwcsTsnsgX6+RFWkKQGOaKpCID2exvRDUH3yb2o7ikw98FX
         b/ZqQjz4rqFyM6UX+ix+do1lE2tyT3dF8WPaLS0VZghdZiFPm1lpQHJXWisCjAAL/Uxi
         XasMSOYnWPhJo5fIFaa6eVbYVh1jkNg466ZWu91E9sZm65VQe9U5CFj1huU8yU+UvgEC
         QKqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=DZSoOrv4h/N/U6sz/LuN40yQTibgNjnvnvetKgfwyUE=;
        b=M40bUq38li7YADEVNq5Ey++CB+B0ZEmknxD/daHL9DfGJjFhxNj3WRP+whAZJQlOsZ
         dmAMazcNNQPKsdXRWRHM4yu55JsztPtkKEXz8FyBjdCjRLb29xD66h9lT+lQgIf2UjGo
         hcM/gyTlHVwhDZsgYcFhsAIXyQ26vjQ05Z1ZJ697UB05YfqH6jgzpKe3evJrKJySlfta
         NXrMYMtQOiY8K7WVcgbnNEyKawEFopMnl6QTrp+x9+MuPuMuOqwQUuXeyoxcfx5dD0fX
         75BnS8M/uj+Uk4uUjXungbnymBwzxw2kngMDYtgq1vnblUhd1+75jbqG/ktRdWOof5lW
         XauA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d2si21081852iod.10.2021.04.07.10.21.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Apr 2021 10:21:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUBrV-0003xl-1s
	for alex.bennee@linaro.org; Wed, 07 Apr 2021 13:21:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lUBni-0007Xd-I3; Wed, 07 Apr 2021 13:17:10 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:6248
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lUBnf-0006iv-MN; Wed, 07 Apr 2021 13:17:10 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 137H3q0Y124916; Wed, 7 Apr 2021 13:16:46 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37rvm4rkss-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 13:16:46 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 137HEXZl002980;
 Wed, 7 Apr 2021 17:16:45 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 37rvbw8w5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 17:16:44 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 137HGgbi28508550
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Apr 2021 17:16:42 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B5ABF4C044;
 Wed,  7 Apr 2021 17:16:42 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6DCCC4C040;
 Wed,  7 Apr 2021 17:16:42 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  7 Apr 2021 17:16:42 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.229])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id C6F372200C7;
 Wed,  7 Apr 2021 19:16:41 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 02/24] aspeed/smc: Remove unused "sdram-base" property
Date: Wed,  7 Apr 2021 19:16:15 +0200
Message-Id: <20210407171637.777743-3-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210407171637.777743-1-clg@kaod.org>
References: <20210407171637.777743-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uPoGLS58xLUBTT_L_KvyfCvbdaWD9RVn
X-Proofpoint-ORIG-GUID: uPoGLS58xLUBTT_L_KvyfCvbdaWD9RVn
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-07_09:2021-04-07,
 2021-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 adultscore=0 mlxscore=0 clxscore=1034
 impostorscore=0 priorityscore=1501 mlxlogscore=930 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104070116
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8geXpzlCgclo

Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
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

