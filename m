Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp652915lfr;
        Wed, 7 Apr 2021 10:18:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrWQYlvGSz1n0w39PioIK0qT4ysr5NwRDgDw0mHJQrvFRFPN+j7cKkuPoCd2616QILkKus
X-Received: by 2002:a6b:b216:: with SMTP id b22mr3392482iof.154.1617815925827;
        Wed, 07 Apr 2021 10:18:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617815925; cv=none;
        d=google.com; s=arc-20160816;
        b=R1LmVoSqzn/y0qQw1Rpm4227AKl53pAgW8rgNiebltAm+08EMFRY/6xZsqODdl5+9a
         DX6GG5VNqhBvGx5822I3CDbJRO51c+mlRCCFIDtJ9fR6rzlzS9ozun57YaS+LxIRz1/N
         o6qCwLqlS4dxFgFtJScY9O4gIRSEHwlWGXIPctZXjkd7cqTPYOag9VqqlChbnmSWdOM2
         DPNNv3zNRjmvDA5mGKZ6Gpn4xxQmWN8JvniX5CAijhLDl7lfi6eW7nmOLDq8PH8t64UP
         QimdhapS3Li/ZYk2fJhDUag5D1ZA4lraniLQNCCX+B42kKzD02rTMvk107leQQH3pPaT
         fphw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=9o4DuKG3syjEU1eEQICiHC1uv4eBayTd+bEclH+kHPE=;
        b=FOVMKd7uYGWFwtbLZc+Ib6ek2jg3jpU+J+QWqJpOQnp+agEBUFgVTHO4DyRYxYwNXi
         EyHlKBUTUu2JUdhtIxhwiIP8fwmPrfBYSIheO+idNK4N1DH6Aeiu4QXsGj389NvUtF1h
         /MCPo7MpGpxiA+eMVIQVMWkNo4u41zj4OsFz9fYoyyigsgUZr7AVsd55p0TMpH4W0J+h
         pCsnLVcHkYDmJdijxfJ5OPtUMmj6bACQifwJQYR87t91WUIZZ2S0K5Apmi2UBlscUkj0
         PGxiHA9eWPYoLOzngXDSYwtNFyksfojsF0xItxRRUSXUifjlJwKGDV6HY7C/H732HwBe
         ZTaw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d18si15597071ios.101.2021.04.07.10.18.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Apr 2021 10:18:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUBpF-00014N-2w
	for alex.bennee@linaro.org; Wed, 07 Apr 2021 13:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lUBng-0007SW-IG; Wed, 07 Apr 2021 13:17:08 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lUBnc-0006gn-TR; Wed, 07 Apr 2021 13:17:08 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 137H3LQt072099; Wed, 7 Apr 2021 13:16:46 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37rw6kgn0m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 13:16:46 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 137HD83e029748;
 Wed, 7 Apr 2021 17:16:44 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 37rvbqgwc2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 17:16:44 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 137HGg0F63635890
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Apr 2021 17:16:42 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B1D311C04C;
 Wed,  7 Apr 2021 17:16:42 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D3F0911C04A;
 Wed,  7 Apr 2021 17:16:41 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  7 Apr 2021 17:16:41 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.229])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 39B68220190;
 Wed,  7 Apr 2021 19:16:41 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 01/24] aspeed/smc: Use the RAM memory region for DMAs
Date: Wed,  7 Apr 2021 19:16:14 +0200
Message-Id: <20210407171637.777743-2-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210407171637.777743-1-clg@kaod.org>
References: <20210407171637.777743-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YsvJYSNmCVCT_L6pmrrVp0WQMB2q2ZAC
X-Proofpoint-ORIG-GUID: YsvJYSNmCVCT_L6pmrrVp0WQMB2q2ZAC
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-07_09:2021-04-07,
 2021-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 mlxlogscore=548
 clxscore=1034 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104070116
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z4cc+Rz03NCU

Instead of passing the memory address space region, simply use the RAM
memory region instead. This simplifies RAM accesses.

Fixes: c4e1f0b48322 ("aspeed/smc: Add support for DMAs")
Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c     | 2 +-
 hw/ssi/aspeed_smc.c | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index a17b75f4940a..1cf5a15c8098 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -327,7 +327,7 @@ static void aspeed_machine_init(MachineState *machine=
)
     object_property_set_int(OBJECT(&bmc->soc), "num-cs", amc->num_cs,
                             &error_abort);
     object_property_set_link(OBJECT(&bmc->soc), "dram",
-                             OBJECT(&bmc->ram_container), &error_abort);
+                             OBJECT(machine->ram), &error_abort);
     if (machine->kernel_filename) {
         /*
          * When booting with a -kernel command line there is no u-boot
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 16addee4dc8d..6f72fb028e59 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -178,8 +178,7 @@
  *   0: 4 bytes
  *   0x7FFFFF: 32M bytes
  */
-#define DMA_DRAM_ADDR(s, val)   ((s)->sdram_base | \
-                                 ((val) & (s)->ctrl->dma_dram_mask))
+#define DMA_DRAM_ADDR(s, val)   ((val) & (s)->ctrl->dma_dram_mask)
 #define DMA_FLASH_ADDR(s, val)  ((s)->ctrl->flash_window_base | \
                                 ((val) & (s)->ctrl->dma_flash_mask))
 #define DMA_LENGTH(val)         ((val) & 0x01FFFFFC)
--=20
2.26.3

