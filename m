Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp138169ejq;
        Fri, 19 May 2023 15:23:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4M8Elk/LYjsZzyrhj8tYWKSRVCeLxqpZ3FgBZKs6MYPMjszYZr5l46gwT50MvFqySI/mIj
X-Received: by 2002:a05:6214:62a:b0:624:5119:ea10 with SMTP id a10-20020a056214062a00b006245119ea10mr212998qvx.36.1684535004758;
        Fri, 19 May 2023 15:23:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684535004; cv=none;
        d=google.com; s=arc-20160816;
        b=wwamrVg9WDSH9E64YFpVxbjufGTNaF9fGigbZeUJA50Qcfo8r9MhtzQAkYrJCOJodZ
         R+8MGy9V9XjCzAov0DeCtTqdwWdtqam8BeWUwyPb0Qmd9cYDfGfrxoJ9i0wCx9a38f+O
         OnuCVUuCdveQbBl16aG5Yg+tASV0dxGp7Ms04oJD3ZpKj2EYhlCICjlw00rHBLkQq8f0
         osUfPjHICqrxyOmU9YyOOZQMvaTtSLmGtmC14q/OdM95TzIa3fK+9/SqwZx9m20JgOcs
         l2txtR8MgysBT4o2EmUrREVIn/lgmAlnyatBZwyMz2m1C7KiSW1oRXtv2CQ5qtlU9J9L
         J1kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=skbAEA/RZf65g0pg8SgQ3wtY+XJhh5QWrFf5lMJLDs8=;
        b=p4qm8aOP/zOeNAhcmYUBtQ9uOmipH2/BOHkBoYXR91gcCIw9aUN9G4sPcE0mr1kMV9
         aY5kXK+xX5oXs0nrotx1CknWpKIKe5hfDYe/u8k81U1CrJIYRN9aSTQRoxeYPyzeyrbT
         3wDliPW+KtGe3/GSJxtZyOTxw04zvgnjLpbeItWMiLGsvpCcJBQD/Hv36Rs09pF9his3
         beki3X4ryY8/muGvvm5jQVtpYJ+yiWofGqua99HTqytAjl5eqh2RV/QgnUY0JgaOn3WJ
         huaqz7FqMrNiL40yXtI1c1df7iIMCCj2ZhSFSv9aB8hX5YmeEFPQtTU79BJP7lP1mAaA
         z80g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=sSBwqDqE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f3-20020a056214076300b0061b6a445f0esi249153qvz.106.2023.05.19.15.23.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 May 2023 15:23:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=sSBwqDqE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q08V1-0005Xn-GG; Fri, 19 May 2023 18:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@us.ibm.com>) id 1q07aa-00022x-5I
 for qemu-arm@nongnu.org; Fri, 19 May 2023 17:24:40 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@us.ibm.com>) id 1q07aY-0007fF-M8
 for qemu-arm@nongnu.org; Fri, 19 May 2023 17:24:39 -0400
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34JL7vem030528; Fri, 19 May 2023 21:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=skbAEA/RZf65g0pg8SgQ3wtY+XJhh5QWrFf5lMJLDs8=;
 b=sSBwqDqE+B6w7+KOguIJrG/Tum1aS6YxSiw+XnUob4XbnLAhNoiD2oCYAmBKzGG9qR/e
 21Wc5mmC6g1K4N1sX8+7m3Kc5ZNiuu6EVnXN22k0+yPxvtVonKsJvx9bbmaLftTsZ54y
 cBClMvxw49dFpXa1FDo1jMBeO00lCF+IK+ae4Ei26KhCej5+6jfS0+6Oj4+oVNIvPcRm
 j5mlDI6eQ0+097sKekpKYHCbxIippRp+KiJezQUcCzlVLr/xgXTZMeveJksvUNLkYSh/
 vxh0kZQWwkmwIZx6aWANaRB8nJgrstv5KverG0GtBAjgVoVQEx/f4TWKmJaxsSErbkj/ vg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qpe7c4mye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 May 2023 21:24:20 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34JJBZDV025394;
 Fri, 19 May 2023 21:24:20 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
 by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3qj266h2n2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 May 2023 21:24:20 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com
 [10.241.53.101])
 by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 34JLOIDw37028410
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 May 2023 21:24:18 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D4B25805A;
 Fri, 19 May 2023 21:24:18 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D6FB58051;
 Fri, 19 May 2023 21:24:18 +0000 (GMT)
Received: from gfwa601.aus.stglabs.ibm.com (unknown [9.3.62.226])
 by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Fri, 19 May 2023 21:24:18 +0000 (GMT)
Received: by gfwa601.aus.stglabs.ibm.com (Postfix, from userid 155676)
 id E3EDF2ED7E5; Fri, 19 May 2023 16:24:17 -0500 (CDT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au,
 qemu-arm@nongnu.org, joe@jms.id.au
Cc: Ninad Palsule <ninadpalsule@us.ibm.com>, ninad@linux.ibm.com
Subject: [PATCH v1 0/1] Add vpd data for Rainier machine
Date: Fri, 19 May 2023 16:24:11 -0500
Message-Id: <20230519212412.3362107-1-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0FJKPE7KKoWBQ_pTk-hCxBLPzQ4M1Y8b
X-Proofpoint-ORIG-GUID: 0FJKPE7KKoWBQ_pTk-hCxBLPzQ4M1Y8b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-19_16,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 mlxlogscore=625 spamscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305190182
Received-SPF: pass client-ip=148.163.156.1; envelope-from=ninad@us.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 19 May 2023 18:22:57 -0400
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
X-TUID: asQn8E6Cv07k

From: Ninad Palsule <ninadpalsule@us.ibm.com>

Please review the change for vpd data for rainier.

Ninad Palsule (1):
  Add vpd data for Rainier machine

 hw/arm/aspeed.c        |  6 ++++--
 hw/arm/aspeed_eeprom.c | 45 +++++++++++++++++++++++++++++++++++++++++-
 hw/arm/aspeed_eeprom.h |  5 +++++
 3 files changed, 53 insertions(+), 3 deletions(-)

-- 
2.37.2

