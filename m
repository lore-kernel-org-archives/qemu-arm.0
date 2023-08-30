Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp4064208ejc;
        Tue, 29 Aug 2023 19:28:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiliyS6D5I8vRopoYIGvG1fO34+/3Vue43KTUII/K9fpCP3z8RUUzEvbJH+jU1RVITYQjN
X-Received: by 2002:a05:620a:25c6:b0:76d:7945:a974 with SMTP id y6-20020a05620a25c600b0076d7945a974mr933702qko.19.1693362498058;
        Tue, 29 Aug 2023 19:28:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693362498; cv=none;
        d=google.com; s=arc-20160816;
        b=lo9Khn7UvLYKpQxD0oCPlbXCQwMuzc1ky/y7sxGZl2yDAd6HqtsT9mCm1aevJITlGO
         UuRSNxEwJJcR1ETlayK4QN4szAOFxrT8Ytou6yh834Z9zZ+Hl5ek+UNBScHwklpeZzZH
         65Mc3z7sggDQgxXHXyPK52stDI8ju0OmqDcpRmmmL5Zqta6pQFcLkaPsi2uBrIw7mnVA
         Et5zjRp1Gij6IS7CujGhjrzWUR5ruk1IUiWyYGlRBdki/THqxnuApvoRTvbY9CQUQ8Xe
         G5AevhcQ92nRKaSZB7kD1MqJRH4sTyIVn3liKw2vonzb9w8r1+3F2HQdLzDvNmCxxioo
         4vuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=pQ1ExT2MIgXAtQr1Brbid/phfFpCNvFP/j5LDM0Gmxc=;
        fh=/Ww3feT/iFt+UtShtcSrm/ZkK0mSMJwi4QyqgqL+GT0=;
        b=Bcj6+gfFxmeTj6o6ykHwgqe7Mjbb+7/0AVVzOEkYHnMnH7yGV0DQy1stB8Ht0z/ClP
         t3uRFskr+pNCbkhoO92mt76s+1MqJwqVRKMveAthn70UcEv+ji5yP/XYOTWXsyiA7RHT
         2AVQotScyFo7fRb846GiEcbaHp/ady3/EdMoENd3rtN9BW7DyMBvks+zAtp7m3BsC2sA
         rHhybOIVPSFgZHQr4WDwtgAA3SiEpUmpNe0AcwpntAZ0VbyFbkOTgaPKRlv98LDPCsut
         8zI/ZNqhsMWmbDA+LUaJmuabB61SnzRnlzmRMqSCvZ8qCY2TdMvlmLXhmMt6iyy8hLhD
         RWww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=W1Uv8Gf6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id br40-20020a05620a462800b00767d0e9d838si6754753qkb.396.2023.08.29.19.28.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Aug 2023 19:28:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=W1Uv8Gf6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbAvL-0002lq-I4; Tue, 29 Aug 2023 22:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1qbAvE-0002dV-PH; Tue, 29 Aug 2023 22:27:09 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1qbAv5-0002Cn-78; Tue, 29 Aug 2023 22:27:05 -0400
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37U29Ebu020848; Wed, 30 Aug 2023 02:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=pQ1ExT2MIgXAtQr1Brbid/phfFpCNvFP/j5LDM0Gmxc=;
 b=W1Uv8Gf6RKBYYhvoyalSCGkWOGIW6wU39GQ0RdVKXB0MFBka7sqhCEhiud/lBYesTGgo
 i1/a+u7XUKu4hiojqdKQM0sLryrd0/C/d1v1DXiXrQwpq2fvtkRoa1kNdg+4AxlXHsta
 f/ZDh0RZZz3asD2GGJDEX4ResPZmrcgDdqd5HRMon0fXM+FbqWgmJCaHxUFJgopxAUdw
 5SEp9lIy2ubCxcHVtVr+Q+OLcIK6GNBYwwIELWj8SKR8iwYJmytCOqr1p1DWeNzFdIxt
 zIWAV3JyKTQfMnlBbSUmWpwdbrbXeAX2ggYF1gwl129bTa3JeZbhNQVeoudrgUpERMT+ wg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ssu57sxhc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Aug 2023 02:26:45 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37U2BMHL026908;
 Wed, 30 Aug 2023 02:26:44 GMT
Received: from ppma22.wdc07v.mail.ibm.com
 (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ssu57sxh2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Aug 2023 02:26:44 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 37U2NFQL020180; Wed, 30 Aug 2023 02:26:43 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
 by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3sqv3ygm72-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Aug 2023 02:26:43 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com
 [10.39.53.231])
 by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 37U2QgVP39649958
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Aug 2023 02:26:43 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4B3C58050;
 Wed, 30 Aug 2023 02:26:42 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22B2A5805F;
 Wed, 30 Aug 2023 02:26:42 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
 by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 30 Aug 2023 02:26:42 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joel@jms.id.au, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, lvivier@redhat.com
Cc: Ninad Palsule <ninad@linux.ibm.com>, qemu-arm@nongnu.org
Subject: [PATCH v3 0/8] Introduce model for IBM's FSI
Date: Tue, 29 Aug 2023 21:26:30 -0500
Message-Id: <20230830022638.4183766-1-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ngVdKeyyBXiYMDREBrqndc7_yvmqz-_7
X-Proofpoint-ORIG-GUID: J2FYX4oB9OMp0ZOW8PDIlCVaQuS_DyhA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxlogscore=328 bulkscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308300017
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: j4b9yASnb4PQ

Hello,

Please review the patch-set version 3.
I have incorporated review comments from Cedric and Thomas.

Ninad Palsule (8):
  hw/fsi: Introduce IBM's Local bus
  hw/fsi: Introduce IBM's scratchpad
  hw/fsi: Introduce IBM's cfam,fsi-slave
  hw/fsi: Introduce IBM's FSI
  hw/fsi: IBM's On-chip Peripheral Bus
  hw/fsi: Aspeed APB2OPB interface
  hw/arm: Hook up FSI module in AST2600
  hw/fsi: Documentation and testing

 MAINTAINERS                        |  20 ++
 docs/specs/fsi.rst                 | 141 ++++++++++++
 hw/Kconfig                         |   1 +
 hw/arm/Kconfig                     |   1 +
 hw/arm/aspeed_ast2600.c            |  19 ++
 hw/fsi/Kconfig                     |  23 ++
 hw/fsi/aspeed-apb2opb.c            | 352 +++++++++++++++++++++++++++++
 hw/fsi/cfam.c                      | 239 ++++++++++++++++++++
 hw/fsi/engine-scratchpad.c         | 100 ++++++++
 hw/fsi/fsi-master.c                | 201 ++++++++++++++++
 hw/fsi/fsi-slave.c                 | 109 +++++++++
 hw/fsi/fsi.c                       |  54 +++++
 hw/fsi/lbus.c                      |  94 ++++++++
 hw/fsi/meson.build                 |   6 +
 hw/fsi/opb.c                       | 194 ++++++++++++++++
 hw/fsi/trace-events                |   8 +
 hw/fsi/trace.h                     |   1 +
 hw/meson.build                     |   1 +
 include/hw/arm/aspeed_soc.h        |   4 +
 include/hw/fsi/aspeed-apb2opb.h    |  33 +++
 include/hw/fsi/cfam.h              |  61 +++++
 include/hw/fsi/engine-scratchpad.h |  33 +++
 include/hw/fsi/fsi-master.h        |  30 +++
 include/hw/fsi/fsi-slave.h         |  29 +++
 include/hw/fsi/fsi.h               |  31 +++
 include/hw/fsi/lbus.h              |  48 ++++
 include/hw/fsi/opb.h               |  43 ++++
 include/qemu/bitops.h              |   6 +
 meson.build                        |   1 +
 tests/qtest/fsi-test.c             | 210 +++++++++++++++++
 tests/qtest/meson.build            |   2 +
 31 files changed, 2095 insertions(+)
 create mode 100644 docs/specs/fsi.rst
 create mode 100644 hw/fsi/Kconfig
 create mode 100644 hw/fsi/aspeed-apb2opb.c
 create mode 100644 hw/fsi/cfam.c
 create mode 100644 hw/fsi/engine-scratchpad.c
 create mode 100644 hw/fsi/fsi-master.c
 create mode 100644 hw/fsi/fsi-slave.c
 create mode 100644 hw/fsi/fsi.c
 create mode 100644 hw/fsi/lbus.c
 create mode 100644 hw/fsi/meson.build
 create mode 100644 hw/fsi/opb.c
 create mode 100644 hw/fsi/trace-events
 create mode 100644 hw/fsi/trace.h
 create mode 100644 include/hw/fsi/aspeed-apb2opb.h
 create mode 100644 include/hw/fsi/cfam.h
 create mode 100644 include/hw/fsi/engine-scratchpad.h
 create mode 100644 include/hw/fsi/fsi-master.h
 create mode 100644 include/hw/fsi/fsi-slave.h
 create mode 100644 include/hw/fsi/fsi.h
 create mode 100644 include/hw/fsi/lbus.h
 create mode 100644 include/hw/fsi/opb.h
 create mode 100644 tests/qtest/fsi-test.c

-- 
2.39.2

