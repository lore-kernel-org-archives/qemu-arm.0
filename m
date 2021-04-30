Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp291783lfg;
        Fri, 30 Apr 2021 09:48:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUTGL4bZjOlz6JPRJ4b/WBzL6qypTJcoXDqqigm8zKcqlSBfeEYqeRmYv/BzZDKbnnHTUr
X-Received: by 2002:a02:1c07:: with SMTP id c7mr5760321jac.111.1619801331525;
        Fri, 30 Apr 2021 09:48:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619801331; cv=none;
        d=google.com; s=arc-20160816;
        b=lj7hv3kwA9hrEVrkg3giqtmxp4GMP3KeDkjiB8ghO8obnT2HB9ZUVwfmGgz4DB/E6u
         zerwqLj3gEmMBgXBzASOGUOp8FlEDcimgqzJEG31UXiWEnLkFhUqL/+gbfVTDMyZMiOZ
         /tODrq9jaPfasLnbmd4vdAWMknJGIQ9OVqLp8a1ohmMHQOscy5u1FJjD/rx4mVJ1qz1F
         +yZ5JcVeTKGlybHbpj+5J8afLwK+3Y1YPSVZbjFtAdHeHKZv436oTRZR1P7CLJloRngZ
         Mloc+Onf41erJOykXCVRXmLky+UNbtoBpwFA7ATAzg/a1nRHfi2DvTMYdKVviL28xXdA
         Rf0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:message-id:date:subject:to:from;
        bh=mD/FRZtM7wY49CmzRKis3gq+VjOavKiUfuFtdA3xV9w=;
        b=knm2kM/qmcBTh0i2bZpYC4uYSIhidpMyxL602kFywlCSvK60H765tzW4dGYPgpKuGF
         Gtw9we3j1gKVgi7Ia9mkXgVbPNoMqxjOKrOXdDivt9NULHzZJQIKQmN178ajGqXe9LXh
         U9E1R8yWGdPImK2BQM0QRyBa1pu4L9IdnIW06iIjvCiUcG+78vJ9DF2pdXT33HD7vYoW
         cUbukiVCYDq+8Vnpc77+pAFWNnxNo/eNgx2biFt/2qnCgyHePiuYPn/M6L/ApkthdjeU
         hB+4DU7c3LfjY2yN9nJNlI6OV2wxlMJ9fkmsW1hLgPaTW4csjFOR9xXyyDBKeoJq5c9t
         Hzlw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g17si4181637ioo.77.2021.04.30.09.48.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 09:48:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcWJu-0003WS-QU
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 12:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lcW58-0000rd-Ar; Fri, 30 Apr 2021 12:33:36 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:29326
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lcW53-00071N-C5; Fri, 30 Apr 2021 12:33:34 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13UGX8PT144728; Fri, 30 Apr 2021 12:33:17 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 388k4bwvy9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 12:33:16 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13UGPVGi012315;
 Fri, 30 Apr 2021 16:33:14 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 384akhbabf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 16:33:14 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13UGXCPH12386566
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 16:33:12 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0DAD34C05C;
 Fri, 30 Apr 2021 16:33:12 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D3C3A4C058;
 Fri, 30 Apr 2021 16:33:11 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 30 Apr 2021 16:33:11 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.40.192])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 30AAE22016C;
 Fri, 30 Apr 2021 18:33:11 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/18] aspeed queue
Date: Fri, 30 Apr 2021 18:33:00 +0200
Message-Id: <20210430163309.4182922-1-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qjiYD4s_j62ZQq8vxL71IYMpNOiVWdK4
X-Proofpoint-GUID: qjiYD4s_j62ZQq8vxL71IYMpNOiVWdK4
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-30_10:2021-04-30,
 2021-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 clxscore=1034 impostorscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104300109
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jK+Gj7nZUr5X

The following changes since commit 609d7596524ab204ccd71ef42c9eee4c7c338ea4:

  Update version for v6.0.0 release (2021-04-29 18:05:29 +0100)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20210430

for you to fetch changes up to 1401dcd8aac9039797b995bfab078877a820c9c5:

  aspeed: Add support for the quanta-q7l1-bmc board (2021-04-30 10:30:42 +0=
200)

----------------------------------------------------------------
Aspeed patches :

* Fixes for the DMA space
* New model for ASPEED's Hash and Crypto Engine (Joel and Klaus)
* Acceptance tests (Joel)
* A fix for the XDMA  model
* Some extra features for the SMC controller.
* Two new boards : rainier-bmc and quanta-q7l1-bmc (Patrick)

----------------------------------------------------------------
C=C3=A9dric Le Goater (11):
      aspeed/smc: Use the RAM memory region for DMAs
      aspeed/smc: Remove unused "sdram-base" property
      aspeed/i2c: Fix DMA address mask
      aspeed/i2c: Rename DMA address space
      hw/misc/aspeed_xdma: Add AST2600 support
      aspeed/smc: Add a 'features' attribute to the object class
      aspeed/smc: Add extra controls to request DMA
      tests/qtest: Rename m25p80 test in aspeed_smc test
      aspeed: Deprecate the swift-bmc machine
      aspeed: Add support for the rainier-bmc board
      hw/block: m25p80: Add support for mt25ql02g and mt25qu02g

Joel Stanley (5):
      hw: Model ASPEED's Hash and Crypto Engine
      aspeed: Integrate HACE
      tests/qtest: Add test for Aspeed HACE
      tests/acceptance: Test ast2400 and ast2500 machines
      tests/acceptance: Test ast2600 machine

Patrick Venture (1):
      aspeed: Add support for the quanta-q7l1-bmc board

Philippe Mathieu-Daud=C3=A9 (1):
      hw/arm/aspeed: Do not sysbus-map mmio flash region directly, use alias

 docs/system/arm/aspeed.rst                       |   2 +-
 docs/system/deprecated.rst                       |   7 +
 include/hw/arm/aspeed_soc.h                      |   3 +
 include/hw/misc/aspeed_hace.h                    |  43 +++
 include/hw/misc/aspeed_xdma.h                    |  17 +-
 include/hw/ssi/aspeed_smc.h                      |   7 +-
 hw/arm/aspeed.c                                  | 146 ++++++-
 hw/arm/aspeed_ast2600.c                          |  22 +-
 hw/arm/aspeed_soc.c                              |  23 +-
 hw/block/m25p80.c                                |   2 +
 hw/i2c/aspeed_i2c.c                              |   5 +-
 hw/misc/aspeed_hace.c                            | 389 +++++++++++++++++++
 hw/misc/aspeed_xdma.c                            | 124 ++++--
 hw/ssi/aspeed_smc.c                              | 119 ++++--
 tests/qtest/aspeed_hace-test.c                   | 469 +++++++++++++++++++=
++++
 tests/qtest/{m25p80-test.c =3D> aspeed_smc-test.c} |  12 +-
 MAINTAINERS                                      |   1 +
 hw/misc/meson.build                              |   1 +
 tests/acceptance/boot_linux_console.py           |  68 ++++
 tests/qtest/meson.build                          |   5 +-
 20 files changed, 1389 insertions(+), 76 deletions(-)
 create mode 100644 include/hw/misc/aspeed_hace.h
 create mode 100644 hw/misc/aspeed_hace.c
 create mode 100644 tests/qtest/aspeed_hace-test.c
 rename tests/qtest/{m25p80-test.c =3D> aspeed_smc-test.c} (96%)
