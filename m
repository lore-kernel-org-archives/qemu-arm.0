Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2231269ejb;
        Tue, 24 Oct 2023 11:13:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHorG/6PsGDUls/oVgajPDClPPWq2/pcZv/6/8bjpkS8EU/SLGMpn5y+9Ydc2PUNscF8ilX
X-Received: by 2002:a0c:b316:0:b0:66d:5c02:316 with SMTP id s22-20020a0cb316000000b0066d5c020316mr13762749qve.21.1698171186460;
        Tue, 24 Oct 2023 11:13:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698171186; cv=none;
        d=google.com; s=arc-20160816;
        b=BDOuaIxfknGNTjO5ZcwIwpri/yFgje2yZV4cfuIuR1mbhIVRCcCLXz0bYUASPi8W89
         459NqQjtlfIm5ZpC1vfX8T+b39rutrYWI2+ORqPSmZFIeuTJbOPVs7fS+GGrnEjsPJFq
         v7xmOXwW2P2DfYiBoidgEDaDu1FL2tOXSZg0au1/EAP+kRyz2REXDlHoEQFnc3FCdVuh
         Fi7lTUQQ4q7InYVq9TPZmkSVIn1C0XWcL35r4gwn0fk1wjDbdJLiS7NZlHEavEmoQ1V0
         3SHl6qSKxDHs4fKPXnBkxg4eAX0hez6AonHKIFCSSyMNS1wXPcAnQhwQsIejovW2dt4q
         6shg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Sfuh+CNFrXdqBaUqT7Mrg7xNUSfWH8zgmZwcxQaoxqM=;
        fh=NAal76Z/q7FBYhiEiWbymNk3zrFoOu+wgUVBjeRKdu0=;
        b=ipC/n9dM4I7ya2y/tHijTm4Iim3Kq4meawt6h1jB+yXUwDalOOSiN7E+kY8qTL0xXO
         i/vQOY8xu84UhQL4OG+Cx2OC5vWg07O38f+1n1/7eqaeAjTDQxRCcRAcmBDG0D/wbt0S
         KJMwNUeR66ZJb8hozMg5UFLjdnhf0fKx5Dep/lmuAAjKv4iWD2BaJ78mF+c2aM6XKoLA
         5JNZjHnj+998nX321X1aYUu14bniOBMHLS1INdUlyVICkCoJaYXpeCsdnXf7vKB7kJdR
         +xDLJr36pLfdF0GHrQu4skjp+0HPG/EKaytCGYF0E/ifm8T535y6G5ug+iFCDIl815tJ
         E14w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=dniuWPPJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l15-20020a0ce84f000000b0066d1f749b1fsi7597921qvo.574.2023.10.24.11.13.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 11:13:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=dniuWPPJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qvLtD-0003wT-3k; Tue, 24 Oct 2023 14:12:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <milesg@linux.vnet.ibm.com>)
 id 1qvLtA-0003b0-Co; Tue, 24 Oct 2023 14:12:24 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <milesg@linux.vnet.ibm.com>)
 id 1qvLt7-0005Lk-NX; Tue, 24 Oct 2023 14:12:24 -0400
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39OIAHEf027371; Tue, 24 Oct 2023 18:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Sfuh+CNFrXdqBaUqT7Mrg7xNUSfWH8zgmZwcxQaoxqM=;
 b=dniuWPPJXX0cvuQn1JHYvlZ3oyYj5iEjwzf7NHpyqhb70+Xy11bMK7u8f15+mYIiOtUv
 5UaWKJXw5eQ6QheM3H936jGP5BfD+ImKHL61nCEvaDK4xEblGhigQOiAyOee3pnXWVsp
 0o1A7VZRHOqJW467LIo9S6FNTnz7+bq2rniut06ygnMr65cmsm+uw++jNO5I23FsDlNr
 RWdpx3Om2m1q6XlweuvV5UW9nSo7M1WuWp4557zZQs+6mlx+Ic1VrxsG9o2eL2YlUObm
 revzcu18/L1TLOedk4sLMZn94lWQMFYJy0npH8uEEFILe5ZCO771LCkiUGUXZshMWKvy Cw== 
Received: from ppma22.wdc07v.mail.ibm.com
 (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3txjy7r1ud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Oct 2023 18:12:03 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 39OFoNxt010315; Tue, 24 Oct 2023 18:12:03 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
 by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tvsbyhh20-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Oct 2023 18:12:03 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com
 [10.241.53.102])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 39OIC2Bk14942924
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Oct 2023 18:12:02 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6483958064;
 Tue, 24 Oct 2023 18:12:02 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2197F5805A;
 Tue, 24 Oct 2023 18:12:02 +0000 (GMT)
Received: from mamboa4.aus.stglabs.ibm.com (unknown [9.3.84.87])
 by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 24 Oct 2023 18:12:02 +0000 (GMT)
From: Glenn Miles <milesg@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Cc: Glenn Miles <milesg@linux.vnet.ibm.com>, qemu-arm@nongnu.org, clg@kaod.org,
 andrew@codeconstruct.com.au, joel@jms.id.au, philmd@linaro.org
Subject: [PATCH v3 0/2] misc/pca9552: Changes to support powernv10
Date: Tue, 24 Oct 2023 13:11:42 -0500
Message-Id: <20231024181144.4045056-1-milesg@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: v97t5UzEN0Buaf6hDYUxgn6KwiXfbYa7
X-Proofpoint-ORIG-GUID: v97t5UzEN0Buaf6hDYUxgn6KwiXfbYa7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-24_17,2023-10-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 mlxlogscore=861 spamscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2310170001 definitions=main-2310240155
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=milesg@linux.vnet.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-TUID: VYwhe5Dt8wAZ

This is a series of patches targeted at getting the pca9552
model ready for use by the powernv10 machine.

Changes from v2:
    - Squashed changes to only update output GPIO if state changed
    - Used Andrew's suggestion to simplify code

Glenn Miles (2):
  misc/pca9552: Fix inverted input status
  misc/pca9552: Let external devices set pca9552 inputs

 hw/misc/pca9552.c          | 58 +++++++++++++++++++++++++++++++++-----
 include/hw/misc/pca9552.h  |  3 +-
 tests/qtest/pca9552-test.c |  6 ++--
 3 files changed, 56 insertions(+), 11 deletions(-)

-- 
2.31.1

