Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp347774lff;
        Mon, 9 Aug 2021 06:28:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWDeU3H2LbYp9SiY5dhRP4xJSogSYV3O2xMolGyCOUogG3HBjXib5lsEWuke7HbB5CDp9/
X-Received: by 2002:a67:ba0a:: with SMTP id l10mr13260579vsn.49.1628515683692;
        Mon, 09 Aug 2021 06:28:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628515683; cv=none;
        d=google.com; s=arc-20160816;
        b=rdiPkQmwg9SPm3ECIJGnvCm6P5tVjHl/4s2YGCuuqCff2Cj9cKpzLaax5mxAT2VwIF
         Hwi5ECYWyLfrWSMq/TNW58ZoJ+CfGPr5yEGBN6Mp3H5kv1XKe1MeJ5F2xww6z2ftb/40
         Pf1kRhdb6Upuzke6DaoJtURMmYzx5gYlHkQAtWJXD1FW06ID0L01K6OYJs6IEK/VZqE1
         O3coEmH6iOH6/owW+RIwmw0mF4EtJSxPspeooa2gRg4Z0E+rDFZel59abrahLj9Fcvg/
         60aE+d+7VTuLApM7Deq/zy4xgRwDMKe1eAKfzF/FQcB3tUxv9GnAmVK7YozLM+uztWam
         728Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=C4cbDd96nfYvYf/jXF/tlO/L8OQF/JIr4VktZhBAH5I=;
        b=L1jF3s10syiqqC6cUg8ZmZoOXlq7ojslwm6vzViPvFq4lDFv5Ly4R2W8+MpJ6cqsSA
         qonz+h6dL87xIcs15sUqtOeBNxx5G4GyuDd7CL4rRUR2bRJR8RdnmVg8ls5qhDkzxkb7
         pQJZ07hTM55KFgPH7Sx/9V3Th7OwWFF65a1QL2Cj7lm55trv1QYM0GPB87FNtNymGoiJ
         hG0gP21lw/eRli8PcyXuDsJFjHKjf5P/GnI+LifBuOfsY3v5suV7M0FIlqdcxmyL0WK8
         MlP+qQnFf7Za5eFUU+OX2gizS3R6oCt/G0gAWw/A2iEv1OPZuX/EXygxPuEvSpucY1qw
         ujYw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n18si837918vsv.413.2021.08.09.06.28.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Aug 2021 06:28:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mD5Jy-0001FA-UF
	for alex.bennee@linaro.org; Mon, 09 Aug 2021 09:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD58W-0004nO-D8; Mon, 09 Aug 2021 09:16:13 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:63308
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD58U-0004se-LM; Mon, 09 Aug 2021 09:16:12 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 179D4S2S118821; Mon, 9 Aug 2021 09:16:03 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3aa7n07n02-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 09:16:03 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 179Cw6c8024433;
 Mon, 9 Aug 2021 13:16:01 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3a9ht8v0cu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 13:16:01 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 179DFx3m57344454
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Aug 2021 13:15:59 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EDDEB11C050;
 Mon,  9 Aug 2021 13:15:58 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9EAF911C069;
 Mon,  9 Aug 2021 13:15:58 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  9 Aug 2021 13:15:58 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.54.114])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id BC4C2220032;
 Mon,  9 Aug 2021 15:15:57 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 00/10] Aspeed: 6.2 queue
Date: Mon,  9 Aug 2021 15:15:46 +0200
Message-Id: <20210809131556.686260-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SVPXRlk7F4WQSuVuM0cL5g7Dh8qEP7CA
X-Proofpoint-ORIG-GUID: SVPXRlk7F4WQSuVuM0cL5g7Dh8qEP7CA
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-09_04:2021-08-06,
 2021-08-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 phishscore=0 clxscore=1034 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 mlxlogscore=864 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108090099
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.398,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ICDVM0VVXQ7K

Hi,

As usual, a couple of fixes and small extensions. There is also a
minimal DPS310 sensor model, which needs a little more review.

Thanks,

C.


Andrew Jeffery (3):
  watchdog: aspeed: Sanitize control register values
  watchdog: aspeed: Fix sequential control writes
  misc/pca9552: Fix LED status register indexing in pca955x_get_led()

Guenter Roeck (1):
  hw: arm: aspeed: Enable eth0 interface for aspeed-ast2600-evb

Joel Stanley (6):
  hw: aspeed_gpio: Simplify 1.8V defines
  hw: aspeed_gpio: Clarify GPIO controller name
  arm/aspeed: rainier: Add i2c eeproms and muxes
  aspeed: Emulate the AST2600A3
  hw/misc: Add Infineon DPS310 sensor model
  arm/aspeed: Add DPS310 to Witherspoon and Rainier

 include/hw/misc/aspeed_scu.h     |   2 +
 include/hw/watchdog/wdt_aspeed.h |   1 +
 hw/arm/aspeed.c                  |  57 +++++++-
 hw/arm/aspeed_ast2600.c          |   6 +-
 hw/gpio/aspeed_gpio.c            |  97 +++++++------
 hw/misc/aspeed_scu.c             |  36 ++++-
 hw/misc/dps310.c                 | 227 +++++++++++++++++++++++++++++++
 hw/misc/pca9552.c                |   2 +-
 hw/watchdog/wdt_aspeed.c         |  26 +++-
 hw/arm/Kconfig                   |   1 +
 hw/misc/Kconfig                  |   4 +
 hw/misc/meson.build              |   1 +
 12 files changed, 392 insertions(+), 68 deletions(-)
 create mode 100644 hw/misc/dps310.c

--=20
2.31.1

