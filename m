Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp780976ejb;
        Thu, 19 Oct 2023 13:40:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKIX3i1DpDBA4q+KKFZmh7NUSUOTVoJtkV6cuOwWwqKp2nYZhfeY9X9vb05opPqzKmunnv
X-Received: by 2002:a25:247:0:b0:d74:62df:e802 with SMTP id 68-20020a250247000000b00d7462dfe802mr3058312ybc.0.1697748054109;
        Thu, 19 Oct 2023 13:40:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697748054; cv=none;
        d=google.com; s=arc-20160816;
        b=NNsin0ntRb7dBOJU+3KC9JzW67Tp6I/cHXX381uOXAjwhCicJK/O7T7hfJoMuLRYDK
         mMIqnAsG9vyxZ0KiN+QukRuLtYCcImIY02egI9HGqgU2/R3ldfgbNY0Lo8aMGS4WTdid
         XimoHMEgUjvQAOthHqBlFDZKDoFVhS6NSz7VkykkoBo7VMN056hXrR2hdf27RcBeRP1g
         92yLo1PnSiKfxRwz1iy8E7YadEzxHfOlYpky/tHXkJ7CS/dAlNcwIMOmFBz1tqFkD3CQ
         PHUHv8WqvWr0zBOKOO9euW45ITsLU5eWKmg5h11zq+8M9a+7RXX58IAK2o78CJc1bKtP
         6LYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=a5LHEVzHxvUX0ax01Ir97DyDzCocF/HdCNQA6bisEMU=;
        fh=z1KdWiyy8wraXUx7ouD6CbiYRDoSKNlzOStkMl49TkY=;
        b=Dk9iWcbuKE/4T2VjG0of3Bmx0ObCVK7VwGjkUeOmyiY8t2QSvvVgJtwZ6zAv4nl29B
         skhjiWV1Gc3b/z+7bXLY8EIWI1m8j7ybLN3RVxwnG3ZC3NShA4A/R53DyRIPe4Yylbe7
         P/McntufGDa+X2vLDjXuax9H1TXDJ0IY00OftU/Wkd5I2VWUPqSCV0QJL4v+UpiRY074
         mMdxL/UG6LmLAOjj7Y6VHwBwOlmQspRt+l+9ho3FUlgZJt+A63FEu54VTasT0StTEF2v
         HYXDDJVAqW3VpC5pstBf4cnsM7KIWOB91BDWchkz5fWeR9x+Aqei4JhKugP6vL/ULhXa
         8nMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="S8i/qfVo";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ld11-20020a056214418b00b0066d03d2058asi311576qvb.430.2023.10.19.13.40.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 13:40:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="S8i/qfVo";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtZoq-0000Yi-Ns; Thu, 19 Oct 2023 16:40:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <milesg@linux.vnet.ibm.com>)
 id 1qtZop-0000Xm-94; Thu, 19 Oct 2023 16:40:35 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <milesg@linux.vnet.ibm.com>)
 id 1qtZon-0008E0-Jl; Thu, 19 Oct 2023 16:40:35 -0400
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39JKIF5r011791; Thu, 19 Oct 2023 20:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=a5LHEVzHxvUX0ax01Ir97DyDzCocF/HdCNQA6bisEMU=;
 b=S8i/qfVotJl5USTexglQckza1Y4fiuKQod1eX/CaLMi2aHTzLkiihBpIzCiaA8J05u9c
 +9BOWTCp4W/+W+CGHcWJSlDDL0nnI376+EgXTpBw1NO8NMpauQG2dM/8z6AQNeyqnvh8
 /pjXT3oSTP/vluc1csTJ5lWAZrhRTh5gNNpeYMJ6+oSoLXuz+kdUzB21DDaZqDjXXcIk
 /HxJEwAnrqYrbDc7+UGsKBT6NdntxWHwYV4UPk9vlIonaPtk6GjbFzHUrqXWkCY1riVy
 mKzjXNr0cufTuDvT4zcmlRQuKY92YDbKojC2lEqZQYEgBNOwfN6NXPZoGv39+cHFWtr3 Qg== 
Received: from ppma11.dal12v.mail.ibm.com
 (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tubc88hv6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Oct 2023 20:40:18 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
 by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 39JKRrej019884; Thu, 19 Oct 2023 20:40:17 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
 by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tr8122xxv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Oct 2023 20:40:17 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 39JKeGXm6619838
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Oct 2023 20:40:16 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D52958043;
 Thu, 19 Oct 2023 20:40:16 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 094AD58053;
 Thu, 19 Oct 2023 20:40:16 +0000 (GMT)
Received: from mamboa4.aus.stglabs.ibm.com (unknown [9.3.84.87])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 19 Oct 2023 20:40:15 +0000 (GMT)
From: Glenn Miles <milesg@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Cc: Glenn Miles <milesg@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 andrew@codeconstruct.com.au, Joel Stanley <joel@jms.id.au>
Subject: [PATCH 0/2] misc/pca9552: Changes to support powernv10
Date: Thu, 19 Oct 2023 15:40:09 -0500
Message-Id: <20231019204011.3174115-1-milesg@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3s6kEOR8ItaSs-x8HWKyMdPyILEgSR2M
X-Proofpoint-ORIG-GUID: 3s6kEOR8ItaSs-x8HWKyMdPyILEgSR2M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_20,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 mlxlogscore=778 mlxscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310190176
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=milesg@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-TUID: TOlQMP/kc82h

This is a series of patches targeted at getting the pca9552
model ready for use by the powernv10 machine.

Glenn Miles (2):
  misc/pca9552: Fix inverted input status
  misc/pca9552: Let external devices set pca9552 inputs

 hw/misc/pca9552.c          | 51 +++++++++++++++++++++++++++++++++-----
 include/hw/misc/pca9552.h  |  3 ++-
 tests/qtest/pca9552-test.c |  6 ++---
 3 files changed, 50 insertions(+), 10 deletions(-)

-- 
2.31.1

