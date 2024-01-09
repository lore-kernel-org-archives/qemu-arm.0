Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp672681ejs;
        Tue, 9 Jan 2024 14:25:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHHjb2Xa1vrMtPNF7lfr+5Vhni7S1v4WJcDdBcEsFHalwOJaUWchhDM1ojZij3uEf7sFV8T
X-Received: by 2002:a05:622a:286:b0:429:ad2f:59dc with SMTP id z6-20020a05622a028600b00429ad2f59dcmr149599qtw.48.1704839106682;
        Tue, 09 Jan 2024 14:25:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704839106; cv=none;
        d=google.com; s=arc-20160816;
        b=RpZCWVh88yFFEsWfKQRs5l5rOcv1BfSA2SXTUVukDVvth9C5hF7HrAPxeTlF76qxUt
         h5GQEY5/45pds1UFgo2n3dLUccgv/ACS+p/4paiJmFa4tp4AiIPU5kmoa0DolTJ+6reh
         bYcVDk3nRMIQmgKNU09NJSNxtOnG39CG20sUkIXYMtvKCJOUsLzsUaREoFJq30um5AQO
         2SesF3SSUG+1PYxV4AG8viVF2jMgVAtrR8re6k4FK5mmJULJcLXZKIyUWNPlZ5soTDke
         FxMADof0oQ2Q/ubf52KEZJhXGUssw096bHTR04GpJ5Zej8F25Zrk+YSU13+ZXQ7XQSTp
         zISQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CTdm+FVycph91yJXZydhBK1mM2a0J0Ea8io97hvoaFQ=;
        fh=xrfrdnXt6yALLaQWR1WAebrnD81q5WGqWzq5w17UyxQ=;
        b=Bd10C4Flh8gKrylWdzVLFwBGqCMpooOHqutaZJsqY88iuixMz6/AexXlRB/Xh9lUl1
         ItpinOnAqncse4QOQ8ELCnyauUnU/V0js9wqyynUIygJ2hmoBUtTJTQ0kjcpvXxgHrLj
         CcjUpJdvA8odoBADbnTvLG/heW6YK6uYBV0u/inN+R7ga5IGQIL0esu+yJqIVIV5B2Bj
         Om7SWa5WKJfTQ4ht1U3Xmd74EgImcPFW2dNQq9W91GOPFSwpooZ4ljAvi5nhVH9RpYmG
         Y3P1K/S3X+v5jedAhyIAEm+YNdtiPGQLGYFU07O9y/xeAxmuvKMGVW0Lijz/Fm1UVfwy
         OvyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=tdiDN01U;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 12-20020ac84e8c000000b00429ae5dfee8si1176639qtp.694.2024.01.09.14.25.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jan 2024 14:25:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=tdiDN01U;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rNKVw-0006ZX-It; Tue, 09 Jan 2024 17:24:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rNKVt-0006W9-8e; Tue, 09 Jan 2024 17:24:01 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rNKVq-0002DL-WC; Tue, 09 Jan 2024 17:24:00 -0500
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 409MEIFx030256; Tue, 9 Jan 2024 22:23:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=CTdm+FVycph91yJXZydhBK1mM2a0J0Ea8io97hvoaFQ=;
 b=tdiDN01U5XW+W2U0iXygS/Ps87A/WqrM2p8Xu+tCH0wz7Q1Yq+ODqQprTmXAZC3vA7+S
 t4lSovv+GMoT+lTH0hVD0KN8BPe8d12EFPt7J0pKofHuEuFq+LWBvBbGIHSOFPUOgebA
 wDeS5kp+Poua54GhOciGp+0obiFB+522lRBcaFvMTuTmeLd9bs+88weqf1oRQ29+QJDf
 xrtdabtCZfIyfVjabdF/N8WyawBaDFrpL3uDu2Non1+Kte++S1kkPaz16zIB2S/tU0wL
 iwXtQd/83b2jVCTtHSNgYlHVcdMOuEXD8hLjWMCjDqjzECTjIPf59ZCPrs4L1A+UwDld yQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vhd6haew1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Jan 2024 22:23:42 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 409Lr94Y022213;
 Tue, 9 Jan 2024 22:23:42 GMT
Received: from ppma12.dal12v.mail.ibm.com
 (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vhd6haeve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Jan 2024 22:23:42 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
 by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 409LRDMH027872; Tue, 9 Jan 2024 22:23:41 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
 by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vgwfsnh5c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Jan 2024 22:23:41 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com
 [10.241.53.101])
 by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 409MNePU29885164
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Jan 2024 22:23:40 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BAF9158051;
 Tue,  9 Jan 2024 22:23:40 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5FFCC5805C;
 Tue,  9 Jan 2024 22:23:40 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
 by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Tue,  9 Jan 2024 22:23:40 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 andrew@codeconstruct.com.au, joel@jms.id.au, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, lvivier@redhat.com
Cc: Ninad Palsule <ninad@linux.ibm.com>, qemu-arm@nongnu.org
Subject: [PATCH v9 10/10] hw/fsi: Update MAINTAINER list
Date: Tue,  9 Jan 2024 16:23:33 -0600
Message-Id: <20240109222333.1225031-11-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240109222333.1225031-1-ninad@linux.ibm.com>
References: <20240109222333.1225031-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: phrgwRaOKO3FPRnV-zK_sKFdLw2HGK-N
X-Proofpoint-ORIG-GUID: 7CuIOBSW9JP8UwGjR4yftgA5zVru6kQ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-09_11,2024-01-09_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 mlxlogscore=846 spamscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401090179
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
X-TUID: JoNKpd1c/1yp

Added maintainer for IBM FSI model

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 00ec1f7eca..79f97a3fb9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3569,6 +3569,14 @@ F: tests/qtest/adm1272-test.c
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

