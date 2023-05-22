Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1290636ejb;
        Mon, 22 May 2023 08:38:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5WBeWlfGRcDotjPPWLPEKcwxvheHn/00VoZ8XSVNDSqvLVMelHJo9HwLL+WXgucByvuvlf
X-Received: by 2002:a05:622a:144:b0:3f6:b611:ea57 with SMTP id v4-20020a05622a014400b003f6b611ea57mr1819928qtw.9.1684769907509;
        Mon, 22 May 2023 08:38:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684769907; cv=none;
        d=google.com; s=arc-20160816;
        b=MXg/Tuz5MC345LiXh8eQS5s4tAJHI0s4P77ixQBe5QZ5oaaVTM1lNSb60viyNfEHiN
         bNLDmpGaA7+s5DQTRbU+wf/HeX70Rur9n3BTyJ0TVvUKvycdUGJi+9+fOOp509YR/4Gm
         2eBgQwiRy/MqBbCe6rBcSMi9bH2OzOwD9VqXl83v6PL9FqJk+y0r0ptKJ3xcJAU/Z+tt
         19DRTIQkGbnVwnFh7WMJO5iMrJOHut7wbOGTQnSHeuUGEk4/f1RgN+E8YSL2ZmAfdJQ4
         ostZngHejq4g+l3lhnHQn/HEdECYArv07uYk9n0rtGXL7PfJzsSyqxKJbvJZM8gEhsU7
         TScA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=EhmM9t4pBr5Dz96Re3yRjsOUIRQ6ACkWy+Bm4O1KfdM=;
        b=NbrfYc7P4yLHsxpwsLud8hzM/I4ZiQKovQElYSAxVZiF5Vm5aP+BJjYmb+MNC0RB1M
         RhpJ43lwMEMfpdmqEsz40JoQL2xi7d+KtScXySUJL2uiYGxcjHjNzu3yuVMxJeo26Yn3
         HlJ65wMThObqag0qTO+MzrNit/TBP1rn21LaQx+F1u/1Lisj+3kTsFv3WlPEJAUAJUTZ
         HhlK1ULnAfFTbQrfn4Z36XZr93/nvvCRVlN0TYtdCIwXAfaKUR0SY0wOdt2E8erkQGYt
         imoh0Vd0gTYtPBz4LM2l3B6uo453e7WmVlB2rK0RgdlZ5NE+p5YbhTJZtgS2FbRS4W4/
         Njkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=VA2pk68V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p15-20020a05622a048f00b003f6a0fa8714si3311213qtx.149.2023.05.22.08.38.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 May 2023 08:38:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=VA2pk68V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q17by-0000Bq-KL; Mon, 22 May 2023 11:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@us.ibm.com>)
 id 1q17bv-0008Uf-47; Mon, 22 May 2023 11:38:11 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@us.ibm.com>)
 id 1q17bq-0002Wk-Lq; Mon, 22 May 2023 11:38:10 -0400
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34MFQFGS019699; Mon, 22 May 2023 15:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=EhmM9t4pBr5Dz96Re3yRjsOUIRQ6ACkWy+Bm4O1KfdM=;
 b=VA2pk68VMITdT044LYmxlqWT2blYEF1R0BADLTw01V3v8xmC571Cgbs6kyAnth1M/HL7
 ro1nmAunzeSOLdhE6fg0jYZDcHm5RJ+W3eW8dxjb7x8VmKvDflMMDnDfTUKRSpMhflbr
 FxF5Jw/a0ZA1V/cnf2yZd4u+am0pr5T+v64pKMhIjUWhW7Sd1KUcSP1ZrJyIcbekA41q
 PROUiJYPZYwt641tH7C9csz11adg5UDgh2+NtKJnznhhmx1K6roFnaeNnKcv0O8X3WOC
 KLF7mxGygoJPDVGLPTzs1+18Em55ZFIruN+zYifnSJ9VBpJGVaP//b6uORI41zwvJX+5 RQ== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qrb1jghp5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 May 2023 15:37:49 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34MDikM1030497;
 Mon, 22 May 2023 15:37:17 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
 by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3qppe7aybv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 May 2023 15:37:17 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com
 [10.241.53.103])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 34MFbGBY37159298
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 May 2023 15:37:16 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 198EE5805A;
 Mon, 22 May 2023 15:37:16 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B22158056;
 Mon, 22 May 2023 15:37:16 +0000 (GMT)
Received: from gfwa601.aus.stglabs.ibm.com (unknown [9.3.62.226])
 by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Mon, 22 May 2023 15:37:15 +0000 (GMT)
Received: by gfwa601.aus.stglabs.ibm.com (Postfix, from userid 155676)
 id 7C7CA2ED7E5; Mon, 22 May 2023 10:37:15 -0500 (CDT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joe@jms.id.au
Cc: Ninad Palsule <ninad@linux.ibm.com>, qemu-arm@nongnu.org
Subject: [PATCH v2 0/1] Add vpd data for Rainier machine
Date: Mon, 22 May 2023 10:36:58 -0500
Message-Id: <20230522153659.3379729-1-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rs89S2QS8r5i2bQh4Puk2hepK1OCDvlm
X-Proofpoint-GUID: rs89S2QS8r5i2bQh4Puk2hepK1OCDvlm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_10,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 mlxlogscore=564 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305220130
Received-SPF: pass client-ip=148.163.158.5; envelope-from=ninad@us.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: /McIhPI31F0Y

Please review the change.
  - This drops adds VPD data for rainier machine.
  - The VPD data is added for system VPD and BMC FRU.

Ninad Palsule (1):
  Add vpd data for Rainier machine

 hw/arm/aspeed.c        |  6 ++++--
 hw/arm/aspeed_eeprom.c | 45 +++++++++++++++++++++++++++++++++++++++++-
 hw/arm/aspeed_eeprom.h |  5 +++++
 3 files changed, 53 insertions(+), 3 deletions(-)

-- 
2.37.2

