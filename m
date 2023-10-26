Received: by 2002:a17:906:c785:b0:9bd:85f7:2662 with SMTP id cw5csp510151ejb;
        Thu, 26 Oct 2023 09:49:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZc9XIXe7SmCRMRSrYJAxJlxxICoSENNVykNH8wgPva3enfkJVM22cc9MUJoVwI3HD6Wsl
X-Received: by 2002:a05:620a:2d82:b0:775:6a23:5389 with SMTP id tr2-20020a05620a2d8200b007756a235389mr16969384qkn.40.1698338981536;
        Thu, 26 Oct 2023 09:49:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698338981; cv=none;
        d=google.com; s=arc-20160816;
        b=rRPXK3Ulz5LDoZy51EubZL15AxyU8I7HNN5PLIzgdJ+kic68DOTgXNPTLs6vIaxZk/
         F7FZUkPC7PNMvTwHRmdijIlY+P5zOjQ6q9ECgWj3MwTvaT1Accseu9pbqHQgV+GCyi+m
         GR6n31aVzOHBmRat3F5AjpX33JODlrIi8bZKHymW7VpuJH7K71kr+yjs/efQXZTDThew
         lAm4Oc40fK/kMaZbl5Beyww0Npuoefq2xMGTglN27OYuXySCPLXbfwxhKkZH2ZzC699Y
         jVaRie2jYOR5Ub6OZLL6DSXhOLQHXOsahZCzOLDUBooihfPKIULIce+zUwr7IGZl2NxM
         fw3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rz6WuVxXPb9mQTlExG4yoBPS/yZU7G+aTeV3NsHIZ4M=;
        fh=xrfrdnXt6yALLaQWR1WAebrnD81q5WGqWzq5w17UyxQ=;
        b=pGBo4oDQ+epNfQXTsWnpPwWJ8PTR6Mrl1gPwtvR6bg5pcavt/XOdna1HcRUCU6AdgF
         IvSO9Tyx+XTegXUBnxSblQtfx+1r6nlLeY5VieDBszJ/4GJGJTbnnZ8LKoj9OmVwIvaZ
         XBNXZN466Q401nJdHbmPxgdAWwU4RV8dBdM3LAH24rd7DykJNVv3RRKFWaez/z1o3Qf+
         uZMbOuEjFT7+BCtwT8QIVdpVecsKOLZRfjBQxsM8YQGAFDfnYKYScNvEHrlstX2vEm3y
         5KLlvVjYIoo+UO+ylOqsNuWexIPA6FRLlc6ht3cma5w9imKEfGmmVVPpI9xERvsYT8el
         ux9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="napF3T3/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q13-20020a05620a0d8d00b00773de1dd8a5si9605735qkl.728.2023.10.26.09.49.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Oct 2023 09:49:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="napF3T3/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qw3Xv-0002Cb-B4; Thu, 26 Oct 2023 12:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1qw3Wp-0000ue-Jp; Thu, 26 Oct 2023 12:48:17 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1qw3Wl-0007qP-6A; Thu, 26 Oct 2023 12:48:12 -0400
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39QGfRBl029274; Thu, 26 Oct 2023 16:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=rz6WuVxXPb9mQTlExG4yoBPS/yZU7G+aTeV3NsHIZ4M=;
 b=napF3T3/wtW67kduW7wxAJMVc9OWgx1EYIYbnLKOPq3GvJ7TtozAYCj1rJGxQQnoBahp
 utPDHzRW9i9+SCkOW5kFCRfOXWpsTlbEls2sf+SQRKL3KnVyvpJlP2kthxF4tlyDGANd
 Kt18RxtKbkVTYAmvNJdQqTPvRq7RN6Y/mUW4LcRcw1KWhIEyGhJbF9URZfQFsjJ7smuV
 JHBYq3b0kH+SIjctKnSX291gk56U3oxSv0PvCzVbbTEAWIpPE5x0NqxA56QBfqu1/1Z0
 myfckgIWD5l4CHDaTywZ2xA3iNnFqHIdDGhIYfK5Gp4C0gt/X3BTEIPWuV3YKoGhwXCP 2w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tyuun07hf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Oct 2023 16:47:56 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39QGfV1u029394;
 Thu, 26 Oct 2023 16:47:55 GMT
Received: from ppma21.wdc07v.mail.ibm.com
 (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tyuun07h3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Oct 2023 16:47:55 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 39QEbI9V026847; Thu, 26 Oct 2023 16:47:54 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
 by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tvsyp7cg2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Oct 2023 16:47:54 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 39QGlsx122282966
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Oct 2023 16:47:54 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE3E258065;
 Thu, 26 Oct 2023 16:47:53 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2607D5805F;
 Thu, 26 Oct 2023 16:47:53 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 26 Oct 2023 16:47:53 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 andrew@codeconstruct.com.au, joel@jms.id.au, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, lvivier@redhat.com
Cc: Ninad Palsule <ninad@linux.ibm.com>, qemu-arm@nongnu.org
Subject: [PATCH v7 10/10] hw/fsi: Update MAINTAINER list
Date: Thu, 26 Oct 2023 11:47:41 -0500
Message-Id: <20231026164741.1184058-11-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231026164741.1184058-1-ninad@linux.ibm.com>
References: <20231026164741.1184058-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SEhRyZSQlmZwZalnhnaQZaMaJwfqA66B
X-Proofpoint-ORIG-GUID: CNLsz4Sn43Y_VQcrsyYcYo4_0wDv_3T-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-26_14,2023-10-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=921 clxscore=1015
 adultscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 phishscore=0
 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310260145
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
X-TUID: 14V1YJFyG74v

Added maintainer for IBM FSI model

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
V4:
  - Added separate commit for MAINTAINER change.

V5:
  - Use * instead of listing all files in dir
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d36aa44661..cce7875fb0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3502,6 +3502,14 @@ F: tests/qtest/adm1272-test.c
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

