Received: by 2002:ac2:446b:0:0:0:0:0 with SMTP id y11csp908372lfl;
        Wed, 16 Feb 2022 01:29:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx8r7/MffmqTVaFSemEW4MDykZTqcTDbxYOcpBZkIx0RXS0J0f7ubGBIxdPI68gDduKYhj8
X-Received: by 2002:a05:6214:5296:b0:42c:9ca9:14f7 with SMTP id kj22-20020a056214529600b0042c9ca914f7mr1129470qvb.44.1645003740681;
        Wed, 16 Feb 2022 01:29:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645003740; cv=none;
        d=google.com; s=arc-20160816;
        b=AZvY+EuHmldn07aSH4owYIrTksnGvCPFctcZkwzte9juSNtzO6k+Y9fQ84IBg/qd2i
         1uCcLjul3HpNbKbxGQZn8suamzPvKHVO0dUsElYezpmkHKYc6Z+LHSY0U94AJLgi/DG0
         82/adzlWJOhwFj7VJej+0d7ucvBniFNNjD+h46agBd0+A1/zYEhVurmTwlRR3W2e3ng4
         Oj2bOZ+uzUZ9IeX13IKt885U8GSdRfjMhl5f+CeV28azJPtDOe/s64BhuDznyFr/oAxp
         PQWgNXXGNOQUox0B2cBpT4hnxx4946tXQdq5kFFicPxcSbBHJPshsvQ3wFADfG4AdifQ
         7fwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=SkBRdJtrqlQ/MqGU440QXYXXt2/yTqtxnR7M+yWkNF8=;
        b=KaDSLcaHt7NnwH+4NRchbp1CL5iPU1K/1MVHraa9f/1X220D9Lk3mxuQe+7s3DfQgV
         JdsUPxz4gUxGzdsZjwNZ53NGKuMdzTMTz0SSjjGNFdrlpxJhoWsecu2g7vrw73z96cRv
         +SKKQJJqD6yXfWDDDVhHNv8ANuyXEaFhTQmjPz8p1iZO9gWV3kwsY265OQtLKaVJvn2l
         2guzFvYxaUyIiXfhXkevXRuV3nb0GEp++F1aWUDBY+csKy5McMpERnGgsGApprIJS9D2
         rFoNiZKni5NnzE836Yhai0+bVYOc1EhyQ7GVoccKnbMkwfXT+ZqX7WJI9Hsp7gVTwQvw
         Vd0A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h68si998443qkf.96.2022.02.16.01.29.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Feb 2022 01:29:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nKGcO-0003WT-6K
	for alex.bennee@linaro.org; Wed, 16 Feb 2022 04:29:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nKGV9-0003V2-2c; Wed, 16 Feb 2022 04:21:31 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:15458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nKGV6-00009b-MR; Wed, 16 Feb 2022 04:21:30 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21G97vHr010805; 
 Wed, 16 Feb 2022 09:21:18 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8wkygyvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 09:21:17 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21G9IgNh024708;
 Wed, 16 Feb 2022 09:21:16 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3e64ha6hf5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 09:21:16 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21G9LDXw33685908
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Feb 2022 09:21:14 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D4BBAAE05A;
 Wed, 16 Feb 2022 09:21:13 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D6F6AE058;
 Wed, 16 Feb 2022 09:21:13 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 16 Feb 2022 09:21:13 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.91.22])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id B726E220032;
 Wed, 16 Feb 2022 10:21:12 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 0/6] aspeed extensions
Date: Wed, 16 Feb 2022 10:21:05 +0100
Message-Id: <20220216092111.237896-1-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TkF-5i9iMTJKuuivEHXt2ySWWc22PYRJ
X-Proofpoint-GUID: TkF-5i9iMTJKuuivEHXt2ySWWc22PYRJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_04,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 clxscore=1034 adultscore=0 mlxscore=0
 mlxlogscore=421 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202160051
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lf57q7K5PG/v

Hi,

Here is a set of extensions for the Aspeed machines, the most
important ones being the removal of a deprecated machine and a simple
model for the Secure Boot Controller, both from Joel.

Thanks,

C.=20

C=C3=A9dric Le Goater (2):
  aspeed/smc: Add an address mask on segment registers
  aspeed/sdmc: Add trace events

Joel Stanley (4):
  arm: Remove swift-bmc machine
  ast2600: Add Secure Boot Controller model
  aspeed: rainier: Add i2c LED devices
  aspeed: rainier: Add strap values taken from hardware

 docs/about/deprecated.rst    |   7 --
 docs/system/arm/aspeed.rst   |   1 -
 include/hw/arm/aspeed_soc.h  |   3 +
 include/hw/misc/aspeed_sbc.h |  33 ++++++++
 include/hw/ssi/aspeed_smc.h  |   1 +
 hw/arm/aspeed.c              |  72 +++++-------------
 hw/arm/aspeed_ast2600.c      |   9 +++
 hw/misc/aspeed_sbc.c         | 141 +++++++++++++++++++++++++++++++++++
 hw/misc/aspeed_sdmc.c        |   2 +
 hw/ssi/aspeed_smc.c          |  11 +++
 hw/misc/meson.build          |   1 +
 hw/misc/trace-events         |   4 +
 12 files changed, 222 insertions(+), 63 deletions(-)
 create mode 100644 include/hw/misc/aspeed_sbc.h
 create mode 100644 hw/misc/aspeed_sbc.c

--=20
2.34.1

