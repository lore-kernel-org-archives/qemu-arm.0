Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp2273440ejt;
        Tue, 28 Nov 2023 16:00:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFey2u3ziQLLFrQmW2RH3D9bsadoy367mqbqH5meMwGQKrxz2bVAfKJgiDwGQEbsCIYJp3B
X-Received: by 2002:a67:b44c:0:b0:462:f1f8:85df with SMTP id c12-20020a67b44c000000b00462f1f885dfmr11167310vsm.23.1701216056337;
        Tue, 28 Nov 2023 16:00:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701216056; cv=none;
        d=google.com; s=arc-20160816;
        b=QYcfBrZbN9jTP+GbFTbgejFgcu8Q1jFt3dojwpSM7lm4JkJB8cWcFUMdsWOGs6GaMD
         s8NOjiGssBmKNZhJrWpB8gUY3xB1RQhm5GCYyw6aU0schk+FdSnUwb4+CCugvBP/57kb
         dt1ZNgCzwHp3hPQNE4n7dCE1RFYPRdA2vC1Mo5WB+tzpsoxsViOAPSzi/hTcpjY/nOpQ
         0qgmx/kQgydCa335Z1vn9K9XxP1sUkGV26k3RdzFyiw17cR5n3eqRDapasxJ5MomKRtL
         vQlEPJlmGvCmUa+Xq6l4wijUBSN6ukLWz4VQrBbYCao+Jl615jFVXH6Zhqd7py6qUtei
         Wz3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JF0MrLLgX/CILgM/wD6QKyW/tfq06FKOKua6P4qi7zw=;
        fh=xrfrdnXt6yALLaQWR1WAebrnD81q5WGqWzq5w17UyxQ=;
        b=A2G4BZHW3ESp5TkLr4mBMah3avWsXtglLfelv9nihERyF6gSAJ1U9FOvzumxMX3RfF
         m3BAo6OiEO/08svYJGSbADFd77hV8ZBXkifi5oEXcIPWL5j2NKg60cy8sPKJe7D5FJ/1
         KZ99C9jMRyqG9cVmKf3m4/SK1btQM9CLJwv1c4ogQ+SQJAy2K0lWxbo5yJoBwFvvUe8E
         c0mMGyyBR8IVUqF2u+ToaaqL3JAv0o2R6/27FinzoFYMbU3HovXcKzR5W6F5PproeXBy
         xMwivelu5Z8s+N2TN3qX+2ap8bzrSD3KHaNVdlW73Ot45L6kVqiVDcWk2VvETm3hCvCb
         p0mA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=N4aupKDc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c21-20020a67e915000000b0045fba817d92si3847160vso.124.2023.11.28.16.00.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Nov 2023 16:00:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=N4aupKDc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r880W-0006fC-4u; Tue, 28 Nov 2023 19:00:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1r87zx-0006Dv-MW; Tue, 28 Nov 2023 19:00:14 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1r87zu-0000au-Nl; Tue, 28 Nov 2023 19:00:13 -0500
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3ASNekDa003463; Wed, 29 Nov 2023 00:00:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=JF0MrLLgX/CILgM/wD6QKyW/tfq06FKOKua6P4qi7zw=;
 b=N4aupKDcSr6J6QuKG/vSFAKgposzToVAQ5lHcvKBFxTw/MuCglPl7/ruXR6FnRmPXYjP
 p/OFAguU4IHDhSj39OH1HbuPLgjtTtl8jMlH8qZNQTwBom6o10miZ+9UVs0nNDdp2tTW
 57rDZLC1SWQBg51XvQV1Vh8BpXYuyoIpUGc8x6y5RzoJP5Uje28TOrWHJ0yVbtAn/4LS
 KftHbEyxIrj3VNhpv5UDoDo3lxiz+JPA44BI5uEE82NIJqzyA1uOLoCcWq2LQwRTm1hq
 z3a8U1Qfl6dpsgaZNoB958ME0fJ/dU5eAvMyT1yjmxwWWM5lB0UlPEZRo5Xnvv/W5CpT Tw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3unskn90vn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Nov 2023 00:00:00 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3ASNeqKd004316;
 Tue, 28 Nov 2023 23:59:59 GMT
Received: from ppma12.dal12v.mail.ibm.com
 (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3unskn90r5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Nov 2023 23:59:59 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
 by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 3ASMrCOD031065; Tue, 28 Nov 2023 23:57:07 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
 by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uku8t3xqf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Nov 2023 23:57:07 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3ASNv6Xb22217240
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Nov 2023 23:57:07 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AA4A45805F;
 Tue, 28 Nov 2023 23:57:06 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62E235805D;
 Tue, 28 Nov 2023 23:57:06 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 28 Nov 2023 23:57:06 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 andrew@codeconstruct.com.au, joel@jms.id.au, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, lvivier@redhat.com
Cc: Ninad Palsule <ninad@linux.ibm.com>, qemu-arm@nongnu.org
Subject: [PATCH v8 10/10] hw/fsi: Update MAINTAINER list
Date: Tue, 28 Nov 2023 17:57:00 -0600
Message-Id: <20231128235700.599584-11-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231128235700.599584-1-ninad@linux.ibm.com>
References: <20231128235700.599584-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BIwJvhgwF9gR7LCuVTQwxmfipKI2xhjV
X-Proofpoint-ORIG-GUID: MYwYVV3jA9XiUz0Mzb-FXeTU04NzRWeh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_25,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=862 suspectscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311280188
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
X-TUID: 1omOc86LiB2b

Added maintainer for IBM FSI model

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 695e0bd34f..0536b585fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3558,6 +3558,14 @@ F: tests/qtest/adm1272-test.c
 F: tests/qtest/max34451-test.c
 F: tests/qtest/isl_pmbus_vr-test.c
 
+FSI
+M: Ninad Palsule <ninad@linux.ibm.com>
+S: Maintained
+F: hw/fsi/*
+F: include/hw/fsi/*
+F: docs/specs/fsi.rst
+F: tests/qtest/fsi-test.c
+
 Firmware schema specifications
 M: Philippe Mathieu-Daudé <philmd@linaro.org>
 R: Daniel P. Berrange <berrange@redhat.com>
-- 
2.39.2

