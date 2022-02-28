Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp1573682lfq;
        Sun, 27 Feb 2022 23:13:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUjpF+SWdzaON+7xPW95coz+XTohorL655JJ8c/ge/KiNiCt4IacCW7tmYKG9guJi1ROW/
X-Received: by 2002:ac8:5bc2:0:b0:2de:adca:6624 with SMTP id b2-20020ac85bc2000000b002deadca6624mr13473166qtb.120.1646032427663;
        Sun, 27 Feb 2022 23:13:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646032427; cv=none;
        d=google.com; s=arc-20160816;
        b=G53pRNIm7slzyGzAxE0yXo06f9EgpAeAwJFaO19urN78lnZkCpfcWxVWVkwezHWdiU
         fGtUPWZSqPJdUQB42m8EXSMD37WFapl9NUqx+lMw9GC8d2SAvR67OcOpHM2DvxlmY0Ef
         I2GF6Iv+KQXeCj0JElbjEmKDxr4iFpRZlyrfxTjk5ZpburgsKi7IVhAMdYqj1qEf+RI6
         RXiWuuFcXgnGxdqLXojIMNO+mQGih+EBJCQXkGFQBi4YXfG5qztLzsaK57nMUTZjh1RW
         NRp6VGnG+J9QVtUGFze2TOua1Y2GoOtdVkgxWbZJIMqQ5QCqsuWaHorIIH7DMz3tnD8L
         ncPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:message-id:date:subject:to:from;
        bh=oPsVUnuDmx51OyWwnOtFXjdqU4oK23TK1lTw/SdN+xg=;
        b=0CowslRBNwjNTrjqvwuRsD1Qb+gbBTOpgfgUA6hEk3ECiYpIw6K3Im0iUZMHKxrzkc
         AlIh/dnl5SGK7JZDtB4UqxJw8yssBQrIgU8COoicBBz4hjvoYK9cGE57ZiA+4ManHxoJ
         TZAEBcyrnQQ/q1esO8LnvEoiqCzQi0ED0ULlXmHFWIZYkSQ0AyBxMOyipOrhNjl8nE7J
         +OxGYRfUC5F1ScKKyKnC760ex1bNzzsjnuPLosnfTn5TZHN5XXDUuzSHG4Lz+zoUnAEw
         iUNu6M9o3IOe6236/2/IW2NHdJlEGerlJCRjEBRk77EntxBbhbt7IQ+IGLKVhI0OHX6X
         2DWg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v9-20020a0cc609000000b00421b5745a5asi3110264qvi.45.2022.02.27.23.13.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 27 Feb 2022 23:13:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nOaE7-0004M9-4m
	for alex.bennee@linaro.org; Mon, 28 Feb 2022 02:13:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nOaDV-0004Jq-Sj; Mon, 28 Feb 2022 02:13:09 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:6962
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nOaDT-0004HJ-Te; Mon, 28 Feb 2022 02:13:09 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21S6fsKc009680; 
 Mon, 28 Feb 2022 07:12:49 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3egsbprktx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 07:12:48 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21S77KkR032047;
 Mon, 28 Feb 2022 07:12:47 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 3efbu8wytk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 07:12:47 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21S7CiTb43647446
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 07:12:44 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ACD0642042;
 Mon, 28 Feb 2022 07:12:44 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A62142045;
 Mon, 28 Feb 2022 07:12:44 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 28 Feb 2022 07:12:44 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.85.32])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 677722201B4;
 Mon, 28 Feb 2022 08:12:43 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 0/7] aspeed queue
Date: Mon, 28 Feb 2022 08:12:32 +0100
Message-Id: <20220228071239.404171-1-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nF-33YHDBG_wM8unUdIn7Ws6xc46LJLo
X-Proofpoint-ORIG-GUID: nF-33YHDBG_wM8unUdIn7Ws6xc46LJLo
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_02,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=526
 spamscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1034 suspectscore=0 impostorscore=0 mlxscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202280040
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PNnuQ5uQp1tX

The following changes since commit c13b8e9973635f34f3ce4356af27a311c993729c:

  Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-2=
0220216' into staging (2022-02-16 09:57:11 +0000)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20220227

for you to fetch changes up to 3671342a38f21316a2bda62e7d607bbaedd60fd8:

  aspeed/sdmc: Add trace events (2022-02-26 18:40:51 +0100)

----------------------------------------------------------------
aspeed queue:

* Removal of the swift-bmc machine
* New Secure Boot Controller model
* Improvements on the rainier machine
* Various small cleanups

----------------------------------------------------------------
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
 include/hw/misc/aspeed_sbc.h    |  32 +++++++++
 include/hw/ssi/aspeed_smc.h     |   1 +
 hw/arm/aspeed.c                 |  98 ++++++++--------------------
 hw/arm/aspeed_ast2600.c         |   9 +++
 hw/misc/aspeed_sbc.c            | 141 ++++++++++++++++++++++++++++++++++++=
++++
 hw/misc/aspeed_sdmc.c           |   2 +
 hw/ssi/aspeed_smc.c             |  11 ++++
 hw/misc/meson.build             |   1 +
 hw/misc/trace-events            |   4 ++
 13 files changed, 236 insertions(+), 79 deletions(-)
 create mode 100644 include/hw/misc/aspeed_sbc.h
 create mode 100644 hw/misc/aspeed_sbc.c
