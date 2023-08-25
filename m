Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp1649582ejc;
        Fri, 25 Aug 2023 13:52:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkmK5L6b4reAIsJxREOyCR+O2l9o9ke3k+/5iBR7AphwKhBaipSWeqYDEl5oZ83ToRkPIX
X-Received: by 2002:a67:fd46:0:b0:44d:482a:5444 with SMTP id g6-20020a67fd46000000b0044d482a5444mr15645562vsr.21.1692996732486;
        Fri, 25 Aug 2023 13:52:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692996732; cv=none;
        d=google.com; s=arc-20160816;
        b=GtKyU15CiKlUdL3soBXq6wNJI/DakPXYg71hKlUGd+otBiRpCho7mbL+p1v8u/GjOL
         mjb93VvA94re3aZXmvzXOC4jGfSOXKLWA6EhLRsDCDRsqG8ojGM43/OjiAnOnKMPJvYi
         D8uGzqexhtmoYJXCGDcvZG/BCVRFMsKxi92F6hF+hn3zZ3xjeTUiTaV5KWfz3owh2S2e
         dv5+20CQL8kRvDQnHWodfR3Hxb+tRlH6Eg7Ocu9zK8pgXdjjvq92KiEMCuY7rw0THAi0
         2oZU/rKSwfx2/1HxnKBzBr50PnxLFg1YfRRRmJXomutxctbsLlmb44tKq5SxL9V64ac4
         cZUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=HAnP3FvBLp7gTJ9FVZGCJf3Fm1ThxvX0FGHizUPgrY8=;
        fh=C/KtYd05D41HubKubB0TAXx0MuCcZNJfThg2b49Vtb4=;
        b=iJdxS4/MnV/HPq/brFak/SplxhOjvD/mzKCY767nHTONE+1smJTYZ1GoCSOk3jYLQK
         K6/AxFZKHaoFppFgTpyWlzQ/Fu9hO4/a7WVwyqo0v0+Rp0G+JXNnrG6qxBgWFGK42jCk
         C5xvI4vM2bDPifiD66LHPWF3yLNI+JUvFkTOPrayJj7dYdZFprB1Pd/PTn/9oYJX2FNB
         kAmdPuwsIXsCGEtFgBPkSuK7PeJtNOHeL4GLol0mZxLpVa0p8UKwIKBFOmVISKXrpRCD
         7SZL/o7B/w0ccqdmnQhDtTiOn9VcDTVfD1MyPKf2VjN+Ff7aTipPmqFV6tIJSnwDbU7V
         ZekA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=IP21UBKF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u7-20020a05620a0c4700b0075cd143233asi127433qki.507.2023.08.25.13.52.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Aug 2023 13:52:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=IP21UBKF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qZdmd-0008Oq-9b; Fri, 25 Aug 2023 16:51:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1qZdmb-0008O8-Mv; Fri, 25 Aug 2023 16:51:53 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1qZdmZ-0006Bw-DI; Fri, 25 Aug 2023 16:51:53 -0400
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37PKpbdN007338; Fri, 25 Aug 2023 20:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=HAnP3FvBLp7gTJ9FVZGCJf3Fm1ThxvX0FGHizUPgrY8=;
 b=IP21UBKF0QL7bQPuOffbaZ1iIHt2hkV5seshCxIqB73wCBNkrUm6S1Vs/c9TiKCqP53H
 BuhJN29ULduiJSDCnZ3MM2BoLBOLZ3/M+/MlHt7Zciwt2lIoGzJ8KrYD0ziakU9lGqEe
 +1eVkBmAEx/Y5OpgR4e2syAPdhJNJcma3oaO9YRlceHhfk43jkzSr/Xy/rA/Y9IpCTkZ
 C4VM+M5DimDtHI2Pi8/LI25LqhOjdOGKKOcE36FCw9d0MHX9+NodrscNcxqhCeUOrhD4
 +qqd5UQUXoPBoiczNHhPCDbQymxTczjkLkNaFdr5g8v2NAwYyieIuN/KwXz3E7qo19wr tg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sq33j8n9v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Aug 2023 20:44:40 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37PKgAEA008708;
 Fri, 25 Aug 2023 20:44:40 GMT
Received: from ppma22.wdc07v.mail.ibm.com
 (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sq33j8n7r-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Aug 2023 20:44:40 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 37PI5301004050; Fri, 25 Aug 2023 20:30:51 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
 by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3sn21s29vf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Aug 2023 20:30:51 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 37PKUo9n34275640
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Aug 2023 20:30:50 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E53E58043;
 Fri, 25 Aug 2023 20:30:50 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 249F858059;
 Fri, 25 Aug 2023 20:30:50 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 25 Aug 2023 20:30:50 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joel@jms.id.au, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org
Cc: Ninad Palsule <ninad@linux.ibm.com>, qemu-arm@nongnu.org
Subject: [PATCH v1 0/7] Introduce model for IBM's FSP
Date: Fri, 25 Aug 2023 15:30:39 -0500
Message-Id: <20230825203046.3692467-1-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rlTm1GFnBFyvUMDM-6hvd3iYQKxhAbYI
X-Proofpoint-ORIG-GUID: CCG7jUDkgfiEMjb9I6-1IbjzkoxChejB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-25_19,2023-08-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=31
 suspectscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxlogscore=34
 mlxscore=31 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0
 spamscore=31 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308250183
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
X-TUID: HUWCpD1f33AS

Hello,

Please review the patch-set.

This is a first step towards introducing model for IBM's Flexible
Service Interface. The full functionality will be implemented over the
time.

Ninad Palsule (7):
  hw/fsi: Introduce IBM's Local bus
  hw/fsi: Introduce IBM's scratchpad
  hw/fsi: Introduce IBM's cfam,fsi-slave
  hw/fsi: Introduce IBM's FSI
  hw/fsi: IBM's On-chip Peripheral Bus
  hw/fsi: Aspeed APB2OPB interface
  hw/arm: Hook up FSI module in AST2600

 hw/Kconfig                         |   1 +
 hw/arm/Kconfig                     |   1 +
 hw/arm/aspeed_ast2600.c            |  15 ++
 hw/fsi/Kconfig                     |  23 ++
 hw/fsi/aspeed-apb2opb.c            | 346 +++++++++++++++++++++++++++++
 hw/fsi/cfam.c                      | 236 ++++++++++++++++++++
 hw/fsi/engine-scratchpad.c         | 100 +++++++++
 hw/fsi/fsi-master.c                | 202 +++++++++++++++++
 hw/fsi/fsi-slave.c                 | 109 +++++++++
 hw/fsi/fsi.c                       |  54 +++++
 hw/fsi/lbus.c                      |  94 ++++++++
 hw/fsi/meson.build                 |   6 +
 hw/fsi/opb.c                       | 194 ++++++++++++++++
 hw/fsi/trace-events                |   2 +
 hw/fsi/trace.h                     |   1 +
 hw/meson.build                     |   1 +
 include/hw/arm/aspeed_soc.h        |   4 +
 include/hw/fsi/aspeed-apb2opb.h    |  32 +++
 include/hw/fsi/bits.h              |  15 ++
 include/hw/fsi/cfam.h              |  59 +++++
 include/hw/fsi/engine-scratchpad.h |  32 +++
 include/hw/fsi/fsi-master.h        |  30 +++
 include/hw/fsi/fsi-slave.h         |  29 +++
 include/hw/fsi/fsi.h               |  35 +++
 include/hw/fsi/lbus.h              |  57 +++++
 include/hw/fsi/opb.h               |  45 ++++
 meson.build                        |   1 +
 27 files changed, 1724 insertions(+)
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
 create mode 100644 include/hw/fsi/bits.h
 create mode 100644 include/hw/fsi/cfam.h
 create mode 100644 include/hw/fsi/engine-scratchpad.h
 create mode 100644 include/hw/fsi/fsi-master.h
 create mode 100644 include/hw/fsi/fsi-slave.h
 create mode 100644 include/hw/fsi/fsi.h
 create mode 100644 include/hw/fsi/lbus.h
 create mode 100644 include/hw/fsi/opb.h

-- 
2.39.2

