Received: by 2002:a17:906:c785:b0:9bd:85f7:2662 with SMTP id cw5csp510214ejb;
        Thu, 26 Oct 2023 09:49:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4jZaDqOB+euJtj2lorMZqNGe65nnph4D2RDFyjpHKPd1mSL8zsX3wks8XNdEd4uyFvtfU
X-Received: by 2002:a81:65c5:0:b0:59b:fda7:9d7f with SMTP id z188-20020a8165c5000000b0059bfda79d7fmr19712565ywb.49.1698338988849;
        Thu, 26 Oct 2023 09:49:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698338988; cv=none;
        d=google.com; s=arc-20160816;
        b=fySZ6aAk9i6KwlouWi2nigujA7eqFyjUT11bgi/HD32v+MTL8T0yLdhLTZjsjYDpFt
         5y9cNMs8+RRjtJvYX+JfYVb1Au6Z8o3GnbKEAZxG6vFXTWLTNfJ1bYh7dtnEclgJKILa
         L7couAY4/M/w8hY0/4fhRBNp7uYd8IVQU5yQJn/9cW+wuoqaPzogf01ZpmiEstxmkM+S
         L/I2JzgV+ZKqdsfmrWbnwxVd1ND+BvgmsAvr2TOcmkqbAFqT9QcpsFonVBDNXTlIA+at
         ZCSIj7rH5qFVQf37BP3dLVeBrIR2/7LD9rG44l23S9fuGwS514y8F1AhWPGa0z9ZIBOl
         fMFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=CW0KuUXzxBAPcvNGKAqK533IbICvXmkP0poadc0jLbk=;
        fh=xrfrdnXt6yALLaQWR1WAebrnD81q5WGqWzq5w17UyxQ=;
        b=Mc+aemCiB0QNb/srdjr728JCeYgIs3bI1oFpRnsj3W0u2gmYtBVS2lVylMPeRANmPG
         4p4/yrBtu5ja5GCKeAVKnSQI1ci4EXXsPy7/QbtMaay4ZSibgsY7iq3DAvbCP/CxNrqZ
         2zfEJ5k6ldQ5g6LQHuv4unwdiJgKp969AdFKVtrkUvL5AP9RHTJkg13H0h5KKI57fSOi
         tUWppo/MQXGMomsdRJoH1/6WMYkC+m4BqsN2eswH/3q98dgxqKvXBfoV2YR0czIHqhGV
         BLz2Aonk6xhL1W21pLKWLMQtoFJXUsAguxJLK8NsMdr4OsXRdM5YZ5FRwXMZDahPxbcd
         Jx4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=gWHFtpzf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h3-20020a815303000000b005a7c656c841si14629415ywb.204.2023.10.26.09.49.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Oct 2023 09:49:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=gWHFtpzf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qw3Y5-0002ND-Op; Thu, 26 Oct 2023 12:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1qw3Wh-0000i0-91; Thu, 26 Oct 2023 12:48:08 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1qw3Wc-0007oe-5J; Thu, 26 Oct 2023 12:48:05 -0400
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39QGitlR011071; Thu, 26 Oct 2023 16:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=CW0KuUXzxBAPcvNGKAqK533IbICvXmkP0poadc0jLbk=;
 b=gWHFtpzfWRlm/DSHaKWNYiyIsUszHT1+ikwvpRL9FKpBYqoDUA8EB30SAodUHE3ST5nL
 NqPs6xvMzJi27kM/u1TDh/D2ZXiEc8d/+Imc3Lkfa4kT58jDkiLn3nHmo36RFIlGRIUo
 aEoc/tP5QvTeugwakImyA6dz3cGyVCbM8e0OUGI3+3KsjGpAkAhmTmlBCNVHaun5Dj66
 auwDNe7Ec5bMZ4ub1pBS9HT42HHTf97ANOMwdxv+BDoSVksUQRr6QaR/WTynGnDn4CuJ
 xrZS9uYisUBLblepKHCemqREK8qaGV9CFzB+BS9A4SP5f/5i8KbfIYeNTYg8V1Q1yYLQ Kw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tyuw8g2y1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Oct 2023 16:47:46 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39QGj1BF011319;
 Thu, 26 Oct 2023 16:47:45 GMT
Received: from ppma21.wdc07v.mail.ibm.com
 (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tyuw8g2xn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Oct 2023 16:47:45 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 39QEbI9U026847; Thu, 26 Oct 2023 16:47:44 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
 by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tvsyp7cfa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Oct 2023 16:47:44 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 39QGliEQ16384696
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Oct 2023 16:47:44 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 696045805D;
 Thu, 26 Oct 2023 16:47:44 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C92B58043;
 Thu, 26 Oct 2023 16:47:43 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 26 Oct 2023 16:47:43 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 andrew@codeconstruct.com.au, joel@jms.id.au, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, lvivier@redhat.com
Cc: Ninad Palsule <ninad@linux.ibm.com>, qemu-arm@nongnu.org
Subject: [PATCH v7 00/10] Introduce model for IBM's FSI
Date: Thu, 26 Oct 2023 11:47:31 -0500
Message-Id: <20231026164741.1184058-1-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bsMQKpFeZiQ4yTY0xIg_sJTH7JJvSRWa
X-Proofpoint-ORIG-GUID: TcRWpdaeRKBqAtd3rJjNayuAJ4Xl_NOl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-26_15,2023-10-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1
 lowpriorityscore=0
 priorityscore=1501 mlxscore=1 impostorscore=0 malwarescore=0
 mlxlogscore=225 clxscore=1015 bulkscore=0 adultscore=0 spamscore=1
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2310170001 definitions=main-2310260145
Received-SPF: pass client-ip=148.163.158.5; envelope-from=ninad@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: JQEOASgiAPoK

Hello,

Please review the patch-set version 7.
I have incorporated review comments from Cedric, Philippe and Thomas.

Ninad Palsule (10):
  hw/fsi: Introduce IBM's Local bus
  hw/fsi: Introduce IBM's scratchpad
  hw/fsi: Introduce IBM's cfam,fsi-slave
  hw/fsi: Introduce IBM's FSI
  hw/fsi: IBM's On-chip Peripheral Bus
  hw/fsi: Aspeed APB2OPB interface
  hw/arm: Hook up FSI module in AST2600
  hw/fsi: Added qtest
  hw/fsi: Added FSI documentation
  hw/fsi: Update MAINTAINER list

 MAINTAINERS                        |   8 +
 docs/specs/fsi.rst                 | 138 +++++++++++++++
 docs/specs/index.rst               |   1 +
 meson.build                        |   1 +
 hw/fsi/trace.h                     |   1 +
 include/hw/arm/aspeed_soc.h        |   4 +
 include/hw/fsi/aspeed-apb2opb.h    |  33 ++++
 include/hw/fsi/cfam.h              |  34 ++++
 include/hw/fsi/engine-scratchpad.h |  27 +++
 include/hw/fsi/fsi-master.h        |  30 ++++
 include/hw/fsi/fsi-slave.h         |  29 +++
 include/hw/fsi/fsi.h               |  36 ++++
 include/hw/fsi/lbus.h              |  43 +++++
 include/hw/fsi/opb.h               |  33 ++++
 hw/arm/aspeed_ast2600.c            |  19 ++
 hw/fsi/aspeed-apb2opb.c            | 272 +++++++++++++++++++++++++++++
 hw/fsi/cfam.c                      | 173 ++++++++++++++++++
 hw/fsi/engine-scratchpad.c         |  93 ++++++++++
 hw/fsi/fsi-master.c                | 161 +++++++++++++++++
 hw/fsi/fsi-slave.c                 |  78 +++++++++
 hw/fsi/fsi.c                       |  25 +++
 hw/fsi/lbus.c                      |  74 ++++++++
 hw/fsi/opb.c                       |  74 ++++++++
 tests/qtest/aspeed-fsi-test.c      | 205 ++++++++++++++++++++++
 hw/Kconfig                         |   1 +
 hw/arm/Kconfig                     |   1 +
 hw/fsi/Kconfig                     |  23 +++
 hw/fsi/meson.build                 |   6 +
 hw/fsi/trace-events                |  13 ++
 hw/meson.build                     |   1 +
 tests/qtest/meson.build            |   1 +
 31 files changed, 1638 insertions(+)
 create mode 100644 docs/specs/fsi.rst
 create mode 100644 hw/fsi/trace.h
 create mode 100644 include/hw/fsi/aspeed-apb2opb.h
 create mode 100644 include/hw/fsi/cfam.h
 create mode 100644 include/hw/fsi/engine-scratchpad.h
 create mode 100644 include/hw/fsi/fsi-master.h
 create mode 100644 include/hw/fsi/fsi-slave.h
 create mode 100644 include/hw/fsi/fsi.h
 create mode 100644 include/hw/fsi/lbus.h
 create mode 100644 include/hw/fsi/opb.h
 create mode 100644 hw/fsi/aspeed-apb2opb.c
 create mode 100644 hw/fsi/cfam.c
 create mode 100644 hw/fsi/engine-scratchpad.c
 create mode 100644 hw/fsi/fsi-master.c
 create mode 100644 hw/fsi/fsi-slave.c
 create mode 100644 hw/fsi/fsi.c
 create mode 100644 hw/fsi/lbus.c
 create mode 100644 hw/fsi/opb.c
 create mode 100644 tests/qtest/aspeed-fsi-test.c
 create mode 100644 hw/fsi/Kconfig
 create mode 100644 hw/fsi/meson.build
 create mode 100644 hw/fsi/trace-events

-- 
2.39.2

