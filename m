Received: by 2002:a17:906:bfc6:b0:9a1:fa4e:495e with SMTP id us6csp722748ejb;
        Fri, 8 Sep 2023 15:31:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2WdZd7rMrrNHdu7XDNxl58erATK65iQDaPqzuS63DWWllA/cGhFegFFmJgBdPD++4HUcD
X-Received: by 2002:a05:622a:1711:b0:412:2668:ed6e with SMTP id h17-20020a05622a171100b004122668ed6emr4598012qtk.27.1694212260287;
        Fri, 08 Sep 2023 15:31:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694212260; cv=none;
        d=google.com; s=arc-20160816;
        b=ao+6ffF+5qYZVX7InymQGuzfsrfDPb+aReLKCZOmjZF/honBrU+MIiJAHTJvL352wc
         3t0D4xeDszHetLcP1um43ZuiaFIwD/VKMt+SRstkYeTmLy82bnjthui8Weczt1qaZVsP
         aleH5Rm41jeRgp2mEMSfr5+YnN+Pr++OLR/ZgFrrmrrdAEflEQw7GWNfqVQjGw9TAcm0
         daxC5F3TtoAxgtn8eiJRVp2Idq34YMUalHhu+ZWf67MxQP6Svil/6DKXJbCfMThnmVTF
         T0MC+qy65uHTwvk78UwqnmPmIj9GEakgWh9JDl1HPHDDynUNdQ5d1EzGCYjuRZbWOtfF
         meWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=zTzs7FgZrnVLx7r2r4fWh2uHnH3HPpgZd+dC5FCXoO8=;
        fh=/Ww3feT/iFt+UtShtcSrm/ZkK0mSMJwi4QyqgqL+GT0=;
        b=zhaXq7a86DV5mat/iOw01sgiS5hTehhJvgsnc0ZAnznKvP/cQN/5zdge1IrcKWtMlv
         uiNHTIF56/1vwmFqWZlJc6rcPeVW82WD4NwDQ82Et/2WljpKj/hAd3X66/LnzKJwIVvP
         ULy9TkwavCEELtNLl3jC+WTqkN0GWiar01e95SiUg34kHDZqSZzD/7SVQHnnBF1suBhm
         1WNNfX3bZ6k7kIfgpUS5DSD8ebsOBpc6TAWPNZE3By/fUV2AGLMdUhlC1MXAqKVYq98S
         fQJDhhZnCIxhxzp06kJsoYHUmOL46BIaJlzJ+yEK0YJtpCQDIlJOinXLL0GB6k2Y5Kcg
         +PHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=efsjAVjk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6-20020ac87d86000000b0040538e3e2e4si1682580qtd.266.2023.09.08.15.31.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Sep 2023 15:31:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=efsjAVjk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qejym-0001ed-8D; Fri, 08 Sep 2023 18:29:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1qejyk-0001cC-0Z; Fri, 08 Sep 2023 18:29:30 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1qejye-0003Ff-I6; Fri, 08 Sep 2023 18:29:29 -0400
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 388M9G88012600; Fri, 8 Sep 2023 22:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=zTzs7FgZrnVLx7r2r4fWh2uHnH3HPpgZd+dC5FCXoO8=;
 b=efsjAVjkHTWBXnINtGiI/VE0isivKNiDrCH/5rBRy9AknlXZ0JY7auJXMgenHzK+uZgg
 tHFIae1IIgt1GlzOW53xnq7Difrp9yaIJOAxNpC5eMI4EnevqbdHkwNt+hkuuSMytC/h
 VkG5sAeZHtecKKSDT/UeSx7V+ZrvHKBqCmoGyzJR71p4il1gPKDIsXA31wFZuBoMF6Cm
 b30Wyc7MM4jRpkFP4Cg+CG2LHETajJ2YvIfOesXEE+PuVQ8Hi8znRFwMsLT9B02V2QmZ
 kya4ED/6Z/Qt07YyKBkVSW/ERFu5SIJljytAXbbgM+gTixx0/c9yB2JZn0jNQtW6E20m Wg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t0brr8y5g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Sep 2023 22:29:10 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 388MTAJM017793;
 Fri, 8 Sep 2023 22:29:10 GMT
Received: from ppma23.wdc07v.mail.ibm.com
 (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t0brr8y4s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Sep 2023 22:29:10 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 388L6N8T006651; Fri, 8 Sep 2023 22:29:08 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
 by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3svgvm70v2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Sep 2023 22:29:08 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com
 [10.241.53.102])
 by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 388MT8cv7996056
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 8 Sep 2023 22:29:08 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 31EF058060;
 Fri,  8 Sep 2023 22:29:08 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BEB8C58063;
 Fri,  8 Sep 2023 22:29:07 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
 by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Fri,  8 Sep 2023 22:29:07 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joel@jms.id.au, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, lvivier@redhat.com
Cc: Ninad Palsule <ninad@linux.ibm.com>, qemu-arm@nongnu.org
Subject: [PATCH v4 00/10] Introduce model for IBM's FSI
Date: Fri,  8 Sep 2023 17:28:49 -0500
Message-Id: <20230908222859.3381003-1-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: O63siYtpFJ6j-NJd-FLNzCC3yY4qyJjS
X-Proofpoint-GUID: 9_4MmRl0j0rGaN7ld-F33QT5ggU1TYPL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-08_18,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1
 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 suspectscore=0 impostorscore=0 phishscore=0 mlxscore=1 mlxlogscore=214
 clxscore=1015 spamscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309080201
Received-SPF: pass client-ip=148.163.156.1; envelope-from=ninad@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
X-TUID: UPa6uQrb+9rH

Hello,

Please review the patch-set version 4.
I have incorporated review comments from Cedric and Thomas.

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

 MAINTAINERS                        |  22 ++
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
 hw/fsi/trace-events                |   6 +
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

