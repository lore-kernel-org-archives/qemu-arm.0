Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp537541lfq;
        Fri, 18 Feb 2022 00:19:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyFK2LFgSddFafkcLMxdL+junb5oQMqRa/6RjMXNSZ+9CyEDQZxlfT7aP03+8u0qUtbrAun
X-Received: by 2002:ac8:7dd2:0:b0:2d2:7d5b:cabe with SMTP id c18-20020ac87dd2000000b002d27d5bcabemr5725874qte.105.1645172369320;
        Fri, 18 Feb 2022 00:19:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645172369; cv=none;
        d=google.com; s=arc-20160816;
        b=T6iTbT4NONKbE+XS3LPrv0SHY9f9LDhVk4Njk+UyIPo64zYS3HARglvtSeCTgewjra
         4DLWVzndKBCqGcLTGNLgcl3EKXPtJay+jDPAi4cWd9xl0nnhgSLjADoYWWHjmyHIUzV2
         sqeQ67mA476lGL+moyipvn8ZFI91KUKOcq23VesXlc7rPPf5CQZ4/M9GT7ZxgeibtPHx
         lmZB2SkjbbjeAKTr9olFj4TOxMEcBN8VwciiIKn//MzW0YKukx5K0cQkxHv+/cSyTs9S
         n9VkqcnET+cbWOBPIbWJxlwGGQpv5CfTJ0g6ZDTVdQzFJqGa/Mp45xWmJRydo6WQKzjp
         hicw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=H6f+SRalOxcEDJfPK92UiflCqikhMYxaFy7ygQQaMDU=;
        b=vlO4E76zLnYE2CkLOZdc2kNvLN1MnUhPCrnLXfMPKiyRWJrI3m2ovqNctalh4TjNsx
         V711qb+BoyKgA1qpJuG1SGMkqA6V2iCT09lkiSRpBPVXEXZ5JYf85m0J03kag5vxRpik
         BPGLFn+FJ9mdXs7GZZAEH+Dxoc6DbQmiA2KpivmHx7HizmuAzz9O/gJBdZeI7frNCWa8
         3NC4BbsoGvJHikb0HNlFsLWjYizxPMGeDBgh56h7eQwY445JcRjXsjJ6fK4NOKZTVrly
         GJReqU1F9P8vrTrT9xpNru/r5d+YZIhn3CuSj8kwUBpHZGv73s0yCE1+QjKW74kI4fmC
         cfWg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q6si5490779qvx.401.2022.02.18.00.19.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Feb 2022 00:19:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nKyUC-0007Df-Q9
	for alex.bennee@linaro.org; Fri, 18 Feb 2022 03:19:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nKyTP-00077A-Cc; Fri, 18 Feb 2022 03:18:39 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:13762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nKyTM-0000Yo-EX; Fri, 18 Feb 2022 03:18:39 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21I7g3YH024543; 
 Fri, 18 Feb 2022 08:18:22 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ea79q8qk8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 08:18:22 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21I8Dr2L019900;
 Fri, 18 Feb 2022 08:18:20 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3e645kghgd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 08:18:20 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21I87oXd49086930
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 08:07:50 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C74B911C04C;
 Fri, 18 Feb 2022 08:18:17 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8480F11C04A;
 Fri, 18 Feb 2022 08:18:17 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 18 Feb 2022 08:18:17 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.94])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id C28E922016E;
 Fri, 18 Feb 2022 09:18:16 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 0/7] aspeed extensions
Date: Fri, 18 Feb 2022 09:18:08 +0100
Message-Id: <20220218081815.641169-1-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kbipi0aUa-9YEQdLzeAw6VvkoXBuYga-
X-Proofpoint-ORIG-GUID: kbipi0aUa-9YEQdLzeAw6VvkoXBuYga-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-18_02,2022-02-17_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=342 spamscore=0
 clxscore=1034 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202180051
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
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qfB5Qkr3O7uE

Hi,

Here is a set of extensions for the Aspeed machines, the most
important ones being the removal of a deprecated machine and a simple
model for the Secure Boot Controller, both from Joel.

Thanks,

C.=20

Changes in v2:

 - new create_pca9552() helper (Philippe)
 - fixed typos
 - fixed removal of the swift machine

C=C3=A9dric Le Goater (3):
  aspeed: Introduce a create_pca9552() helper
  aspeed/smc: Add an address mask on segment registers
  aspeed/sdmc: Add trace events

Joel Stanley (4):
  arm: Remove swift-bmc machine
  ast2600: Add Secure Boot Controller model
  aspeed: rainier: Add i2c LED devices
  aspeed: rainier: Add strap values taken from hardware

 docs/about/deprecated.rst       |   7 --
 docs/about/removed-features.rst |   5 ++
 docs/system/arm/aspeed.rst      |   1 -
 include/hw/arm/aspeed_soc.h     |   3 +
 include/hw/misc/aspeed_sbc.h    |  32 ++++++++
 include/hw/ssi/aspeed_smc.h     |   1 +
 hw/arm/aspeed.c                 |  98 ++++++----------------
 hw/arm/aspeed_ast2600.c         |   9 ++
 hw/misc/aspeed_sbc.c            | 141 ++++++++++++++++++++++++++++++++
 hw/misc/aspeed_sdmc.c           |   2 +
 hw/ssi/aspeed_smc.c             |  11 +++
 hw/misc/meson.build             |   1 +
 hw/misc/trace-events            |   4 +
 13 files changed, 236 insertions(+), 79 deletions(-)
 create mode 100644 include/hw/misc/aspeed_sbc.h
 create mode 100644 hw/misc/aspeed_sbc.c

--=20
2.34.1

