Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp643132ejc;
        Thu, 25 Jan 2024 19:43:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEoQ51XJGwlu1z9y9nX8usTpu1tzG2y1reSoEASttHKBmsWfrntkYqlRSH65GtjXRvlj0Vm
X-Received: by 2002:a05:620a:4d09:b0:783:47c6:6ae9 with SMTP id wa9-20020a05620a4d0900b0078347c66ae9mr766209qkn.40.1706240584356;
        Thu, 25 Jan 2024 19:43:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706240584; cv=none;
        d=google.com; s=arc-20160816;
        b=SUS+IpwHhmav7zroTGAzT4lLMoXu4WwJq05t83V7n5nYnrpTs9o8oowZl1AEp2KfYJ
         6xabJ+ulQK5xlvXcWIEwPfewtsZb5+sMvTo+Ts9CX1umoFNQ/8rotwTbEoVEYDN8xMjv
         W/bGp83hLDvmX7UXRehY/OsjCnuzjAJxqtQskgfkhh+nu1eyQZFNnV9MAyjiskggCXnP
         hiFsgvrEUX31X5QLDgV9wasuMR8GOng76G93KmqGfVDR69pZ+elFR4vBjOTNAF+/3Nyv
         BAoOeSAAhfCj8/UmXmn5hB4KMmcppp3Zh6Lez8YlFELFyS9icxdGj8ZPG33jZEWKprMU
         zydw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=bdOR0dpBULxfyCjPLaON+5y3jVkOFN6dLUWSnr08O3o=;
        fh=xrfrdnXt6yALLaQWR1WAebrnD81q5WGqWzq5w17UyxQ=;
        b=zL+9aBrFAAwQhsghx2WnTJ5po6c8UWaWOgG6cV0giI2P9e7r2RX8ghzrUg2zlyEKPA
         t0PCHgLym9jYT8mB9RPVwy6TkMhqYQSxmd1vqrUPvSwroB2K0urEb8uFdDYyjEkITZpm
         N1JshqWmwJH4RxKQuPDOPR08KK21bGHebZ6kyiUk5F4EneZ2bkJ4724z01kbsf+asiHN
         LbWACkaRiElBfz7epacECRpvRISfX8uPbQ8Cnzll1nb5ovnlFewq2t3Cjd3PNTSPb4hv
         Gjpoj+0dIaQLgpx3CDrsyJwyb1/udZ+enecdFY4Zh3aancxRgWCimOS7PbFFjj9ecTtT
         vFFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=bRSaJAfa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id vw11-20020a05620a564b00b007833d259f47si430309qkn.644.2024.01.25.19.43.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jan 2024 19:43:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=bRSaJAfa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rTD5I-0004gu-DT; Thu, 25 Jan 2024 22:40:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rTD5G-0004d9-Tr; Thu, 25 Jan 2024 22:40:50 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rTD5F-0003OP-20; Thu, 25 Jan 2024 22:40:50 -0500
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 40Q2fu4I011287; Fri, 26 Jan 2024 03:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=bdOR0dpBULxfyCjPLaON+5y3jVkOFN6dLUWSnr08O3o=;
 b=bRSaJAfaQvkV+sgS0y9Z+PoA/GFjgaUCyrtXhht5FNFhwOj+02NdQuGd5a+kRLweuNeM
 /zxTQiF6qpsJzK4bWyHXF8Xp/w1kGts4pdtE1Z7fVa5Z1TtZL/Kvm2gERt0Im/3jdX5N
 1s7cGQnAtpeOEggdIgGEVqMen3G1MxgN5Xk6w9x2xMW0ad6aZdfYpzQXv8+iI6vjNaTB
 LmW2z1ja8uJid0lzNate3b0esrW+zyaHjUQHmcWkOMeq4vFx6xeKYndhWf+N0RgQtEph
 EiZe63vB679V30WYXzc0Lcn84B0JXVcYsNQOn/uEayQkMnQLHTrEklxE1wKrISWkRu10 Mw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vv46as3tc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 03:40:32 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40Q396e2000700;
 Fri, 26 Jan 2024 03:40:31 GMT
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vv46as3sw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 03:40:31 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 40Q1u9n3025277; Fri, 26 Jan 2024 03:40:30 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vrtqkr4ny-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 03:40:30 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 40Q3eTO921365322
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Jan 2024 03:40:29 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4288C58055;
 Fri, 26 Jan 2024 03:40:29 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F0CFF58043;
 Fri, 26 Jan 2024 03:40:28 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 26 Jan 2024 03:40:28 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 andrew@codeconstruct.com.au, joel@jms.id.au, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, lvivier@redhat.com
Cc: Ninad Palsule <ninad@linux.ibm.com>, qemu-arm@nongnu.org
Subject: [PATCH v11 00/11] Introduce model for IBM's FSI
Date: Thu, 25 Jan 2024 21:40:15 -0600
Message-Id: <20240126034026.31068-1-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UsPjgB0xrhBHZIABuMEqZDxot550JAXS
X-Proofpoint-GUID: lV_FQmBwgK39Y0pSmKTUFUrjSmlyWrhB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 mlxlogscore=394 spamscore=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401260024
Received-SPF: pass client-ip=148.163.156.1; envelope-from=ninad@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 28Tr2eFWl7aa

Hello,
 
Please review the patch-set version 11. 
I have incorporated review comments from Cedric.
v10:
  - Moved aspeed-apb2opb to hw/fsi directory
  - Split some patches.
  - Fixed crash.
  - make check
    Ok:                 319 
    Expected Fail:      0   
    Fail:               0   
    Unexpected Pass:    0   
    Skipped:            9   
    Timeout:            0   


Ninad Palsule (11):
  hw/fsi: Introduce IBM's Local bus
  hw/fsi: Introduce IBM's scratchpad device
  hw/fsi: Introduce IBM's FSI Bus
  hw/fsi: Introduce IBM's fsi-slave model
  hw/fsi: Introduce IBM's cfam
  hw/fsi: Introduce IBM's FSI master
  hw/fsi: Aspeed APB2OPB & On-chip peripheral bus
  hw/arm: Hook up FSI module in AST2600
  hw/fsi: Added qtest
  hw/fsi: Added FSI documentation
  hw/fsi: Update MAINTAINER list

 MAINTAINERS                     |   9 +
 docs/specs/fsi.rst              | 138 ++++++++++++++
 docs/specs/index.rst            |   1 +
 meson.build                     |   1 +
 hw/fsi/trace.h                  |   1 +
 include/hw/arm/aspeed_soc.h     |   4 +
 include/hw/fsi/aspeed_apb2opb.h |  46 +++++
 include/hw/fsi/cfam.h           |  34 ++++
 include/hw/fsi/fsi-master.h     |  32 ++++
 include/hw/fsi/fsi.h            |  38 ++++
 include/hw/fsi/lbus.h           |  43 +++++
 hw/arm/aspeed_ast2600.c         |  19 ++
 hw/fsi/aspeed_apb2opb.c         | 322 ++++++++++++++++++++++++++++++++
 hw/fsi/cfam.c                   | 168 +++++++++++++++++
 hw/fsi/fsi-master.c             | 170 +++++++++++++++++
 hw/fsi/fsi.c                    | 105 +++++++++++
 hw/fsi/lbus.c                   | 112 +++++++++++
 tests/qtest/aspeed-fsi-test.c   | 205 ++++++++++++++++++++
 hw/Kconfig                      |   1 +
 hw/arm/Kconfig                  |   1 +
 hw/fsi/Kconfig                  |   7 +
 hw/fsi/meson.build              |   2 +
 hw/fsi/trace-events             |  13 ++
 hw/meson.build                  |   1 +
 tests/qtest/meson.build         |   1 +
 25 files changed, 1474 insertions(+)
 create mode 100644 docs/specs/fsi.rst
 create mode 100644 hw/fsi/trace.h
 create mode 100644 include/hw/fsi/aspeed_apb2opb.h
 create mode 100644 include/hw/fsi/cfam.h
 create mode 100644 include/hw/fsi/fsi-master.h
 create mode 100644 include/hw/fsi/fsi.h
 create mode 100644 include/hw/fsi/lbus.h
 create mode 100644 hw/fsi/aspeed_apb2opb.c
 create mode 100644 hw/fsi/cfam.c
 create mode 100644 hw/fsi/fsi-master.c
 create mode 100644 hw/fsi/fsi.c
 create mode 100644 hw/fsi/lbus.c
 create mode 100644 tests/qtest/aspeed-fsi-test.c
 create mode 100644 hw/fsi/Kconfig
 create mode 100644 hw/fsi/meson.build
 create mode 100644 hw/fsi/trace-events

-- 
2.39.2

