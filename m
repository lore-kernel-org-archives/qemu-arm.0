Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp668896lfr;
        Wed, 7 Apr 2021 10:39:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2zVxLwrqPOSas5sZH2RVYGX0BhNf6q7iRKN59GD25mQw3rsnB8KsHZex5wsmmqpUJv9io
X-Received: by 2002:a05:6638:3ba:: with SMTP id z26mr4830068jap.40.1617817141925;
        Wed, 07 Apr 2021 10:39:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617817141; cv=none;
        d=google.com; s=arc-20160816;
        b=qVz/utVzeOCfA1qt51NE4xRTLIAkEC5Id0BCQAKQgEer4XI4PimyDW1sO2OY2sicFX
         ocU5LuqACXSxR+Ox4nhhHrg5fbkHfyS5UfpXZ6JEpo2E0cy6HmmrV0ioynGq3wg7X/me
         j3s+VGCIsMHmrVdm0xO6tQy9o+tO6HYpjnPvgzvppP9Mul0ogHX1PFms8bA2m8f08jNA
         YPS4DHYu/5WBIKJW929iTkRLTCqlDovfnMZaDDbwXbiLlM9XBUmPCO+tj9wMM+JgKW2o
         ninIdxVwveFPEI/dGXZWzw9v/Kprt48B918c/rLRwq0/DXADPC/z7+fyivA1yftPOwWO
         kM4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=omk6DjamTndYezI300TFI4l4tOPrPBBZMzaf2fh4X2U=;
        b=n1m14GushVSkpSRCeN+fHCQnSu6p4H8Dr8mUMeFIKGU2OcSB5eQblBocojspt0gw+v
         f2s5n/+Mb5TUumHulAC1pku7Rehw/BmIBG+WIUxA6FEUGk6b4sKHoWYOhh0dbSg3UHcN
         npe/r6uh8Iyj1z0MjMT2uxgr2Oz9SVN+sH6D2ociE74ZPN0hKazcpvI7lzP3lOplVn6q
         5swhUwNJIKuMEBaiy5qkELGAhk95NERkKdGM01YARDcOOD7C5XRYy1sqWAH/Z2ABiznD
         Ra+aWJxzAWf+OQBo+Ac1LGuTmCkfxWp1Ht1/N0HRKyXGRJkl9HiHzhzGxS5h1ijKyAUz
         EXuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11si24501656ils.61.2021.04.07.10.39.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Apr 2021 10:39:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUC8r-0000mo-6O
	for alex.bennee@linaro.org; Wed, 07 Apr 2021 13:39:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lUBnl-0007g3-Vv; Wed, 07 Apr 2021 13:17:14 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lUBng-0006nr-Sl; Wed, 07 Apr 2021 13:17:13 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 137H2xs6084023; Wed, 7 Apr 2021 13:16:56 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37rw7jr9q2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 13:16:56 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 137HD3KP008493;
 Wed, 7 Apr 2021 17:16:53 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 37rvmq8fmp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 17:16:53 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 137HGUNE11796918
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Apr 2021 17:16:30 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 585FBA4040;
 Wed,  7 Apr 2021 17:16:51 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22BB0A404D;
 Wed,  7 Apr 2021 17:16:51 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  7 Apr 2021 17:16:51 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.229])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 89FB22200C7;
 Wed,  7 Apr 2021 19:16:50 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 14/24] aspeed/smc: Add a 'features' attribute to the object
 class
Date: Wed,  7 Apr 2021 19:16:27 +0200
Message-Id: <20210407171637.777743-15-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210407171637.777743-1-clg@kaod.org>
References: <20210407171637.777743-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cabSsiowAb58-1YtsRiSES2EzH_vMW3Z
X-Proofpoint-ORIG-GUID: cabSsiowAb58-1YtsRiSES2EzH_vMW3Z
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-07_09:2021-04-07,
 2021-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 mlxscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 suspectscore=0
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
X-TUID: xY0CYmQml7GU

It will simplify extensions of the SMC model.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h |  2 +-
 hw/ssi/aspeed_smc.c         | 44 +++++++++++++++++++++----------------
 2 files changed, 26 insertions(+), 20 deletions(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 6ea2871cd899..07879fd1c4a7 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -47,7 +47,7 @@ typedef struct AspeedSMCController {
     const AspeedSegments *segments;
     hwaddr flash_window_base;
     uint32_t flash_window_size;
-    bool has_dma;
+    uint32_t features;
     hwaddr dma_flash_mask;
     hwaddr dma_dram_mask;
     uint32_t nregs;
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 50ea907aef74..4521bbd4864e 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -257,6 +257,12 @@ static uint32_t aspeed_2600_smc_segment_to_reg(const=
 AspeedSMCState *s,
                                                const AspeedSegments *seg=
);
 static void aspeed_2600_smc_reg_to_segment(const AspeedSMCState *s,
                                            uint32_t reg, AspeedSegments =
*seg);
+#define ASPEED_SMC_FEATURE_DMA       0x1
+
+static inline bool aspeed_smc_has_dma(const AspeedSMCState *s)
+{
+    return !!(s->ctrl->features & ASPEED_SMC_FEATURE_DMA);
+}
=20
 static const AspeedSMCController controllers[] =3D {
     {
@@ -271,7 +277,7 @@ static const AspeedSMCController controllers[] =3D {
         .segments          =3D aspeed_segments_legacy,
         .flash_window_base =3D ASPEED_SOC_SMC_FLASH_BASE,
         .flash_window_size =3D 0x6000000,
-        .has_dma           =3D false,
+        .features          =3D 0x0,
         .nregs             =3D ASPEED_SMC_R_SMC_MAX,
         .segment_to_reg    =3D aspeed_smc_segment_to_reg,
         .reg_to_segment    =3D aspeed_smc_reg_to_segment,
@@ -287,7 +293,7 @@ static const AspeedSMCController controllers[] =3D {
         .segments          =3D aspeed_segments_fmc,
         .flash_window_base =3D ASPEED_SOC_FMC_FLASH_BASE,
         .flash_window_size =3D 0x10000000,
-        .has_dma           =3D true,
+        .features          =3D ASPEED_SMC_FEATURE_DMA,
         .dma_flash_mask    =3D 0x0FFFFFFC,
         .dma_dram_mask     =3D 0x1FFFFFFC,
         .nregs             =3D ASPEED_SMC_R_MAX,
@@ -305,7 +311,7 @@ static const AspeedSMCController controllers[] =3D {
         .segments          =3D aspeed_segments_spi,
         .flash_window_base =3D ASPEED_SOC_SPI_FLASH_BASE,
         .flash_window_size =3D 0x10000000,
-        .has_dma           =3D false,
+        .features          =3D 0x0,
         .nregs             =3D ASPEED_SMC_R_SPI_MAX,
         .segment_to_reg    =3D aspeed_smc_segment_to_reg,
         .reg_to_segment    =3D aspeed_smc_reg_to_segment,
@@ -321,7 +327,7 @@ static const AspeedSMCController controllers[] =3D {
         .segments          =3D aspeed_segments_ast2500_fmc,
         .flash_window_base =3D ASPEED_SOC_FMC_FLASH_BASE,
         .flash_window_size =3D 0x10000000,
-        .has_dma           =3D true,
+        .features          =3D ASPEED_SMC_FEATURE_DMA,
         .dma_flash_mask    =3D 0x0FFFFFFC,
         .dma_dram_mask     =3D 0x3FFFFFFC,
         .nregs             =3D ASPEED_SMC_R_MAX,
@@ -339,7 +345,7 @@ static const AspeedSMCController controllers[] =3D {
         .segments          =3D aspeed_segments_ast2500_spi1,
         .flash_window_base =3D ASPEED_SOC_SPI_FLASH_BASE,
         .flash_window_size =3D 0x8000000,
-        .has_dma           =3D false,
+        .features          =3D 0x0,
         .nregs             =3D ASPEED_SMC_R_MAX,
         .segment_to_reg    =3D aspeed_smc_segment_to_reg,
         .reg_to_segment    =3D aspeed_smc_reg_to_segment,
@@ -355,7 +361,7 @@ static const AspeedSMCController controllers[] =3D {
         .segments          =3D aspeed_segments_ast2500_spi2,
         .flash_window_base =3D ASPEED_SOC_SPI2_FLASH_BASE,
         .flash_window_size =3D 0x8000000,
-        .has_dma           =3D false,
+        .features          =3D 0x0,
         .nregs             =3D ASPEED_SMC_R_MAX,
         .segment_to_reg    =3D aspeed_smc_segment_to_reg,
         .reg_to_segment    =3D aspeed_smc_reg_to_segment,
@@ -371,7 +377,7 @@ static const AspeedSMCController controllers[] =3D {
         .segments          =3D aspeed_segments_ast2600_fmc,
         .flash_window_base =3D ASPEED26_SOC_FMC_FLASH_BASE,
         .flash_window_size =3D 0x10000000,
-        .has_dma           =3D true,
+        .features          =3D ASPEED_SMC_FEATURE_DMA,
         .dma_flash_mask    =3D 0x0FFFFFFC,
         .dma_dram_mask     =3D 0x3FFFFFFC,
         .nregs             =3D ASPEED_SMC_R_MAX,
@@ -389,7 +395,7 @@ static const AspeedSMCController controllers[] =3D {
         .segments          =3D aspeed_segments_ast2600_spi1,
         .flash_window_base =3D ASPEED26_SOC_SPI_FLASH_BASE,
         .flash_window_size =3D 0x10000000,
-        .has_dma           =3D true,
+        .features          =3D ASPEED_SMC_FEATURE_DMA,
         .dma_flash_mask    =3D 0x0FFFFFFC,
         .dma_dram_mask     =3D 0x3FFFFFFC,
         .nregs             =3D ASPEED_SMC_R_MAX,
@@ -407,7 +413,7 @@ static const AspeedSMCController controllers[] =3D {
         .segments          =3D aspeed_segments_ast2600_spi2,
         .flash_window_base =3D ASPEED26_SOC_SPI2_FLASH_BASE,
         .flash_window_size =3D 0x10000000,
-        .has_dma           =3D true,
+        .features          =3D ASPEED_SMC_FEATURE_DMA,
         .dma_flash_mask    =3D 0x0FFFFFFC,
         .dma_dram_mask     =3D 0x3FFFFFFC,
         .nregs             =3D ASPEED_SMC_R_MAX,
@@ -997,11 +1003,11 @@ static uint64_t aspeed_smc_read(void *opaque, hwad=
dr addr, unsigned int size)
         addr =3D=3D R_CE_CMD_CTRL ||
         addr =3D=3D R_INTR_CTRL ||
         addr =3D=3D R_DUMMY_DATA ||
-        (s->ctrl->has_dma && addr =3D=3D R_DMA_CTRL) ||
-        (s->ctrl->has_dma && addr =3D=3D R_DMA_FLASH_ADDR) ||
-        (s->ctrl->has_dma && addr =3D=3D R_DMA_DRAM_ADDR) ||
-        (s->ctrl->has_dma && addr =3D=3D R_DMA_LEN) ||
-        (s->ctrl->has_dma && addr =3D=3D R_DMA_CHECKSUM) ||
+        (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_CTRL) ||
+        (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_FLASH_ADDR) ||
+        (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_DRAM_ADDR) ||
+        (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_LEN) ||
+        (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_CHECKSUM) ||
         (addr >=3D R_SEG_ADDR0 &&
          addr < R_SEG_ADDR0 + s->ctrl->max_peripherals) ||
         (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + s->ctrl->max_periph=
erals)) {
@@ -1290,13 +1296,13 @@ static void aspeed_smc_write(void *opaque, hwaddr=
 addr, uint64_t data,
         s->regs[addr] =3D value & 0xff;
     } else if (addr =3D=3D R_INTR_CTRL) {
         s->regs[addr] =3D value;
-    } else if (s->ctrl->has_dma && addr =3D=3D R_DMA_CTRL) {
+    } else if (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_CTRL) {
         aspeed_smc_dma_ctrl(s, value);
-    } else if (s->ctrl->has_dma && addr =3D=3D R_DMA_DRAM_ADDR) {
+    } else if (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_DRAM_ADDR) {
         s->regs[addr] =3D DMA_DRAM_ADDR(s, value);
-    } else if (s->ctrl->has_dma && addr =3D=3D R_DMA_FLASH_ADDR) {
+    } else if (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_FLASH_ADDR) {
         s->regs[addr] =3D DMA_FLASH_ADDR(s, value);
-    } else if (s->ctrl->has_dma && addr =3D=3D R_DMA_LEN) {
+    } else if (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_LEN) {
         s->regs[addr] =3D DMA_LENGTH(value);
     } else {
         qemu_log_mask(LOG_UNIMP, "%s: not implemented: 0x%" HWADDR_PRIx =
"\n",
@@ -1412,7 +1418,7 @@ static void aspeed_smc_realize(DeviceState *dev, Er=
ror **errp)
     }
=20
     /* DMA support */
-    if (s->ctrl->has_dma) {
+    if (aspeed_smc_has_dma(s)) {
         aspeed_smc_dma_setup(s, errp);
     }
 }
--=20
2.26.3

