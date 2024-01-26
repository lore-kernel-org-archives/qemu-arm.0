Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp793740ejc;
        Fri, 26 Jan 2024 02:51:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIxf8M/Q/NeCL7WM2wafw5mvbpK2k4vM/ks+AdvKSLHo4sL1O5aDG3mo0h9JVP2GRtkBm5
X-Received: by 2002:a05:6214:21e9:b0:685:1ece:9585 with SMTP id p9-20020a05621421e900b006851ece9585mr1808969qvj.39.1706266273873;
        Fri, 26 Jan 2024 02:51:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706266273; cv=none;
        d=google.com; s=arc-20160816;
        b=I6Jq90AKCboywFPlfTcOb1sQlbSIPn2+TqJ9Y4qaocD6fcREjpbWaDpuXlLObAt+z5
         yNMcZM0e610RIN8U3P8r7aAfHpAgenv+kpscwJBA7aOxie5AHWXZfTfwwPNhtN9dcn6L
         moB1uFKPZIyMBuJdNasVXApjPNSawpfpl7Fw0chnRqphfXyUQzrRx+JHd25RlmjGdpxe
         tcUGSERElKeOgUoHMIn/MFIqBnZIW5IRg2X+huI3LsdLx0e8yU+NBJmWuLHwAgkPMtTz
         83pgMn8UmeYSX8DLh8T6KYoJsdDFV3cQPie/gg/piLQjUMAAXQgpjfmeQ7rc67iOEwtu
         Qdug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=aKyfy/Fj0al5vSZsw6TwiwX3q61IhE59c2bMNfzF9gg=;
        fh=xrfrdnXt6yALLaQWR1WAebrnD81q5WGqWzq5w17UyxQ=;
        b=MmXj/lviapUpwOVVeaKRkdCUbj1K3ABC3awrn6e7Lmxu6BOFESowtuW6pCWXptZR+S
         hoAKnYZ5YvCglrOisfAWuZK+dyRZ8nIXgcfkYwZu5lc1LEvjE7dzM6m4bUHr2NIHIUy3
         Ol6isTF1mLsZA7qDXQzhFydkN/EbpDWV9XpSlKgFbMU3M1IeOHnkTLQ0Z1iK/onjuzQe
         WcLTIX+kJWUSPiNcrMmpFP6A6F90BkPqb+Ls8QEe55miS0mi3XyzZcs8FRNFlOqKEUKY
         IR54DFlA3te5llY6eRktfrFkpzkhqNIq3OCrIPhWyHhB5T4OH1AJhpqn7XFLffiUMifH
         PXtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=eI9N5UyY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z1-20020a0ce601000000b0068c36441386si71723qvm.468.2024.01.26.02.51.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 02:51:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=eI9N5UyY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTJnY-0004ne-Fd; Fri, 26 Jan 2024 05:51:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rTJn3-0004Zq-2k; Fri, 26 Jan 2024 05:50:31 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rTJn0-0006BW-LI; Fri, 26 Jan 2024 05:50:28 -0500
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 40Q8HEDw004368; Fri, 26 Jan 2024 10:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=aKyfy/Fj0al5vSZsw6TwiwX3q61IhE59c2bMNfzF9gg=;
 b=eI9N5UyYGmfunx3/EuZlDRigRSZJKyTkzkwIKFVTHG8reMFyWowHW481PTyO2moaAUkS
 9GcoR1ujb8Hq1ftTIv05x44+4kOjhckamtPqqZY/2h1B5KdfZSjCZEKtPDJH6t8AdebZ
 l+YzENAn8kM8Le7YD4uN2YPgoZepqz80Mcefn1LiEkDCRdaFGlStOT8Ul9q6l25brolj
 qHiT0WXC1DPo/hFQkpLwbEa9UC26Jc57pHY1shVi/5dPamlX0MtFLWCEFTLFWOQVXxX5
 311bPDTp7LxBrIlRQtf3A0AVpZecUXCSdEaBjm5RbJT1Mhx/PxgtQ4CfZjw9tcg1SuVD qw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vv93dk4ew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 10:50:12 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40QAXPRP024173;
 Fri, 26 Jan 2024 10:50:12 GMT
Received: from ppma11.dal12v.mail.ibm.com
 (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vv93dk4ek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 10:50:12 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
 by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 40Q9jExu028239; Fri, 26 Jan 2024 10:50:11 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
 by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vru731t20-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 10:50:11 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 40QAoAMY13697788
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Jan 2024 10:50:10 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44D7F58053;
 Fri, 26 Jan 2024 10:50:10 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 771D65805F;
 Fri, 26 Jan 2024 10:50:09 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 26 Jan 2024 10:50:09 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 andrew@codeconstruct.com.au, joel@jms.id.au, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, lvivier@redhat.com
Cc: Ninad Palsule <ninad@linux.ibm.com>, qemu-arm@nongnu.org
Subject: [PATCH v12 11/11] hw/fsi: Update MAINTAINER list
Date: Fri, 26 Jan 2024 04:49:56 -0600
Message-Id: <20240126104956.74126-12-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240126104956.74126-1-ninad@linux.ibm.com>
References: <20240126104956.74126-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ox0iGRAR0pvZRG8LjaK4R9tg_O8prVBk
X-Proofpoint-GUID: YZo57P5Xu1egry7CZDc_37VZg3PGcgET
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 spamscore=0 bulkscore=0 mlxscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 mlxlogscore=939
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401260078
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
X-TUID: uekkb2ZyDORu

Added maintainer for IBM FSI model

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
v11:
 - Added Cedric as reviewer.
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index dfaca8323e..39deb8ee1f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3585,6 +3585,15 @@ F: tests/qtest/adm1272-test.c
 F: tests/qtest/max34451-test.c
 F: tests/qtest/isl_pmbus_vr-test.c
 
+FSI
+M: Ninad Palsule <ninad@linux.ibm.com>
+R: Cédric Le Goater <clg@kaod.org>
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

