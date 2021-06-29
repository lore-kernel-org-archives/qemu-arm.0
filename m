Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4999834lfg;
        Tue, 29 Jun 2021 07:34:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKSFl4kBPXvumndDA6XdAnJDcFXj+CIyF0fQxHJ8LOERF5MB6ygIdBuhCLQbnVZM8t/4o3
X-Received: by 2002:a25:d88a:: with SMTP id p132mr3862510ybg.409.1624977247799;
        Tue, 29 Jun 2021 07:34:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624977247; cv=none;
        d=google.com; s=arc-20160816;
        b=DgQrRIoLIs4d0gKZl1oyIIkCungmIAS+rlX+CayRdH+GBjtiY4nu/JCVxN7+EqdFkM
         I1zNxTABjxDJ2fOFVn2cRzL5xOXS2LyWsCXQCODAY2YXrKKo95NtC+BC3ERShoRuCUdA
         G8RNTQoiODlwRoBLXN4MtaZJs3pbDfibOY5JYPDCscylTHA6/0XnRhmXSZd8dEV2MF/1
         tZE278bmQBzIdiWSCSxHxQocf9CrJ8elmtQV6ej7+76hTI8qmXClIrt2MmbrpNFJi1Vl
         +Xdj2WSM4xRsYHh03Koa4q4oQcFAS+/CLLwQZP+Br4ejNYVbdsz+tgtud8CQD44z3qAH
         dmSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=3V7Z5GRJ/pb1gg4Cjz4N+Yq7pKp6BHcZbcUaVuvfdMM=;
        b=DgYA3GNLt+63ySJSmuDr8RlKx/d/euUc8cECV7GhpEFoP3e9yineoUJpb4mRdQRZFM
         XgVSYJb4389xnvynI0RBLt2FOPxxjHTP8mS9x5oCTYAhkDaj3NwFcRl+50gYrybCguEa
         Y+vi37lAPSOJh46LYitkYhgQrFLa2WzxFmwTWiUfsljRlNl+DeoepjPWkkizSJ1OHpuL
         cVM8qX+SB2vgtRa10V4I7nx5n4hIX5YghIaVufN+KPiMxzyAViSEEaNhHYiS2CHe5xT0
         Uw86P1/d5cR9UOgeCHum4mFLVjK/BC2yxvDZRshvuJK7IV9QMr3GRTNtCsbmlliY6ODh
         apxw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q20si4196389ybg.420.2021.06.29.07.34.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Jun 2021 07:34:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lyEoR-0000eT-5V
	for alex.bennee@linaro.org; Tue, 29 Jun 2021 10:34:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lyEef-0006ip-Bf; Tue, 29 Jun 2021 10:24:02 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:32658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lyEec-0005wG-Fl; Tue, 29 Jun 2021 10:24:00 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15TE3ptX051963; Tue, 29 Jun 2021 10:23:44 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39g4v1gr90-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Jun 2021 10:23:43 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15TEF8rs013009;
 Tue, 29 Jun 2021 14:23:41 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06fra.de.ibm.com with ESMTP id 39dugh8pt1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Jun 2021 14:23:41 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15TENdd633423758
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Jun 2021 14:23:39 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 175F45217C;
 Tue, 29 Jun 2021 14:23:39 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id C59245215B;
 Tue, 29 Jun 2021 14:23:38 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.54.151])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id EF78122007E;
 Tue, 29 Jun 2021 16:23:37 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 0/4] Aspeed: I2C extensions
Date: Tue, 29 Jun 2021 16:23:32 +0200
Message-Id: <20210629142336.750058-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0sCPDCOhgeQjsY3NmXzvMR3nR5ZfCfHx
X-Proofpoint-GUID: 0sCPDCOhgeQjsY3NmXzvMR3nR5ZfCfHx
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-29_06:2021-06-28,
 2021-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1034 suspectscore=0 mlxlogscore=614 spamscore=0
 phishscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106290095
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
X-TUID: 02uogKbMuE51

Hello,

Here is a small series of patches I have been collecting from Joel. It
populates the Aspeed machines with more I2C devices and adds a minimal
model for the DPS310 sensor model.

The AST2600 SoC revision is updated to A3 and the A1 is dropped as it
didn't seem useful to keep multiple revision of a SoC.

If all is fine, I will send a pull request with these patches.

Thanks,

C.=20

Joel Stanley (4):
  arm/aspeed: rainier: Add i2c eeproms and muxes
  aspeed: Emulate the AST2600A3
  hw/misc: Add Infineon DPS310 sensor model
  arm/aspeed: Add DPS310 to Witherspoon and Rainier

 include/hw/misc/aspeed_scu.h |   2 +
 hw/arm/aspeed.c              |  54 ++++++++-
 hw/arm/aspeed_ast2600.c      |   6 +-
 hw/misc/aspeed_scu.c         |  36 ++++--
 hw/misc/dps310.c             | 227 +++++++++++++++++++++++++++++++++++
 hw/arm/Kconfig               |   1 +
 hw/misc/Kconfig              |   4 +
 hw/misc/meson.build          |   1 +
 8 files changed, 316 insertions(+), 15 deletions(-)
 create mode 100644 hw/misc/dps310.c

--=20
2.31.1

