Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2295429lfo;
        Tue, 8 Mar 2022 04:22:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyEbV6KkBvoYWY3Tlu2/7WyLzuAABnHJYyh6f5dCaeFR5BZwwMuPcsdq8xKAmH9YbMK2cLR
X-Received: by 2002:a25:df02:0:b0:629:7c93:eb2e with SMTP id w2-20020a25df02000000b006297c93eb2emr4353359ybg.69.1646742138478;
        Tue, 08 Mar 2022 04:22:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646742138; cv=none;
        d=google.com; s=arc-20160816;
        b=ubVK5eL9exkEAQdKIhBhSHUu1Bqht/x2XfidZjvGTOw+MfHBuRK2XUPy9sijTlt/jm
         jcwl7JfhQQh7c+JJUPdPEo8O9CXugbvk2Nxiu7wiOQDsZuels8N/V5fRA85Zrxc0Ld+o
         HNV1TJCDsXIuFKayVXxTINEGCEJDR8z2rzzDPb//oe8q+OCLfAJyA0mCM3owJ8Z8XgmI
         XQ1eNEX7fwYgun89EmFiX0ogmJOR406+iMNSWsns9MswHD0D5Oh+omxlDa+j7UbX0Ppt
         DGhUnJFBNKFEyBVkfcI6CLxhDFGLLYCaV09yuDd3Q2xt3VxsUr/vR5umTcmQP5aoj3Sk
         WFVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:message-id:date:subject:to:from;
        bh=VemIxJR8tl2aXgW2VhI80V3ISWt8y2EfYVnagjIKQbY=;
        b=FU6+iQcbmO4tR1RCuP0PTtoHzMOlijMkXOD5/cr5KuiB58FU4El17uVYwLg2Ai9RTv
         Yg62+nzj+gnPPWtinjGhwYKA+e0JT0BafMsFecwGA42vkKw7SzIJ0N+Kvk8Pqkqwhzer
         wqgip9h4DSMl9egDN5fhbm4ycNUn9JIh2cILWnBycHqbOeD5PrUoVPCKUPJF+wlQR/hP
         ibWxr42h2Gb78b7yJ5QhSYSgZi7hARcF/EezcIbYDOne8G/nCGhc7xNvaL1ua9C0qmEM
         l/UP4IPMIEZejDVrZ8N6ih6uRZVBz+VZbc1JyggFc96Af19Eq6+IlK8ahAJMv0jNsOZc
         wLwA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y12-20020a05690213cc00b006292553ed8bsi4703967ybu.325.2022.03.08.04.22.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Mar 2022 04:22:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRYr3-0000EU-Sm
	for alex.bennee@linaro.org; Tue, 08 Mar 2022 07:22:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nRYqy-0000DS-NF; Tue, 08 Mar 2022 07:22:12 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:13322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nRYqw-0006DN-AQ; Tue, 08 Mar 2022 07:22:12 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 228AFuSi031528; 
 Tue, 8 Mar 2022 12:21:59 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eny189j85-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Mar 2022 12:21:59 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 228C8Bhp004875;
 Tue, 8 Mar 2022 12:21:56 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 3enpk2srsp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Mar 2022 12:21:56 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 228CLs3d40567218
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Mar 2022 12:21:54 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B88AAE056;
 Tue,  8 Mar 2022 12:21:54 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 398D6AE053;
 Tue,  8 Mar 2022 12:21:54 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  8 Mar 2022 12:21:54 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.238])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 4AA6F2201DC;
 Tue,  8 Mar 2022 13:21:53 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 00/11] aspeed queue
Date: Tue,  8 Mar 2022 13:21:38 +0100
Message-Id: <20220308122149.1602798-1-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: aSNagyiQAfnH7XlRsd2DMOL3wpTiGrfz
X-Proofpoint-ORIG-GUID: aSNagyiQAfnH7XlRsd2DMOL3wpTiGrfz
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-08_03,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 mlxlogscore=479 phishscore=0 mlxscore=0 spamscore=0
 clxscore=1034 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203080063
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 36V/jm9h9me6

The following changes since commit b49872aa8fc0f3f5a3036cc37aa2cb5c92866f33:

  Merge remote-tracking branch 'remotes/hreitz-gitlab/tags/pull-block-2022-=
03-07' into staging (2022-03-07 17:14:09 +0000)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20220308

for you to fetch changes up to 46179776c292f83848df90de60da5ae1a965ce6a:

  hw: aspeed_gpio: Cleanup stray semicolon after switch (2022-03-08 09:18:1=
1 +0100)

----------------------------------------------------------------
aspeed queue:

* Fix for a potential memory leak
* Aspeed SMC cleanups on the definition of the number of flash devices
* New bletchley-bmc machine, AST2600 based

----------------------------------------------------------------
Andrew Jeffery (1):
      hw: aspeed_gpio: Cleanup stray semicolon after switch

C=C3=A9dric Le Goater (6):
      aspeed/smc: Use max number of CE instead of 'num_cs'
      aspeed: Rework aspeed_board_init_flashes() interface
      aspeed/smc: Remove 'num_cs' field
      aspeed/smc: Rename 'max_peripherals' to 'cs_num_max'
      aspeed/smc: Let the SSI core layer define the bus name
      aspeed/smc: Fix error log

Patrick Williams (3):
      hw/block: m25p80: Add support for w25q01jvq
      hw/arm/aspeed: allow missing spi_model
      hw/arm/aspeed: add Bletchley machine type

Wentao_Liang (1):
      aspeed: Fix a potential memory leak bug in write_boot_rom()

 include/hw/ssi/aspeed_smc.h |   3 +-
 hw/arm/aspeed.c             | 100 ++++++++++++++++++++++++++++++++++++++--=
----
 hw/arm/aspeed_ast2600.c     |   2 -
 hw/arm/aspeed_soc.c         |   2 -
 hw/block/m25p80.c           |   1 +
 hw/gpio/aspeed_gpio.c       |   2 +-
 hw/ssi/aspeed_smc.c         |  53 ++++++++++-------------
 7 files changed, 114 insertions(+), 49 deletions(-)
