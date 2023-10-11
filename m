Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp174832ejc;
        Wed, 11 Oct 2023 08:37:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUW1EaiI0pu5Kgv/t4MS4WpWPnwWJ3RdCkvffub2f76jWIBZk/34eJhMlKdMbXDeGQ7/O9
X-Received: by 2002:a25:744f:0:b0:d7e:b89c:9919 with SMTP id p76-20020a25744f000000b00d7eb89c9919mr21523964ybc.1.1697038669766;
        Wed, 11 Oct 2023 08:37:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697038669; cv=none;
        d=google.com; s=arc-20160816;
        b=rPU8gk69B9Gq+1oaiMxkPrl+kJjEccWP67fPBKVZ5zcY/akCAVLBC6cw+Adk3rPaes
         5+hE/ubZW0E2GyTSgmOK7VZ5PDAEMRzjb68J6JF+pTU/Ay6s21t/5M+RO1tjccMKmMMj
         S61v3EK2i/0AQ2whKWtJVjdYQlKq4JVVB8veKqBFj3TZX+707nrXwPZdOOyvN+r5PxCn
         sd4NAXQuKWploMmve08KjHAyH/dJvDlO4S5SgfcRSojJm7tsdkzeF8ss0N7dTXh2/8/4
         fnhxPFiiS+tba5unzszJPFdJZboxfYeUTsP4P0DseLrkq68rwfrN4vX/WPpcNrkVhFeC
         Ma4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eZJBNIx/v2NIeO3m+d50h/ryzT4zEKH0dsUUisH6qb8=;
        fh=/Ww3feT/iFt+UtShtcSrm/ZkK0mSMJwi4QyqgqL+GT0=;
        b=XO230K50So0U45CfHVX1JmiUiML0beAN8nlzTov6xjWUMzJQMbmRarljZ/igyuMnvj
         U6CGYkl2Dpw97EPHFx9INJZmbYn1PMZo65/3ufZgJ+Wrp/RYaWUt5Z6znzNmkIMOR9MO
         SDiBtk1cDuHbfua3tHOZvjEUSG+99ceEj0q8BbuKmW3BgJmGrBTUPQd1osm1IB1zx2WI
         1y2lTJyulSx5J49ePdFEHsWkdzxSKApqzzWihT/HcQVWdvPqGIl1SApqNitoGe0COSeJ
         1OJ4WaRcA5Z7h79fYc2nAVZGAOXD6QolzavRooVdGUVQCXZKRGv9aZQaZpEaZJtjGjr8
         mc+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="PAk3/7YW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n9-20020a0cdc89000000b0065b159315ecsi971732qvk.519.2023.10.11.08.37.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Oct 2023 08:37:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="PAk3/7YW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qqbHL-0007rQ-Pl; Wed, 11 Oct 2023 11:37:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1qqbHJ-0007q9-RE; Wed, 11 Oct 2023 11:37:42 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1qqbHH-0001Vs-VB; Wed, 11 Oct 2023 11:37:41 -0400
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39BFWTBo012777; Wed, 11 Oct 2023 15:37:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=eZJBNIx/v2NIeO3m+d50h/ryzT4zEKH0dsUUisH6qb8=;
 b=PAk3/7YWmQP9wEQPSrF+L/aokS7qvMOoLtNbd0fEOrpltlp0tm4CAUgBbccxm5Qui+NJ
 95z2zOV1p9uWThoD5hNJhJzp4FoN4vI+2um9lO58RSvSEgoYctr/dSkN5SnpWGO9aloV
 fvNt72nnwmyv6XkbkJLAWab3AVgQW+qURWiOEcIIH8YhaUCp2GB45p/S6GQG3dUAotjx
 EOUl9S/jIoL2Tfq2d6OejuTzfKPRVpiiNnEejX6B35MZRhVxCn3QFYl+5MOCyo3FEZJ1
 FaPEGmZFMh5ftCnDKgYfjrEbqRlaOHRa0ztMzIpPov2pvW91XeeTwBE7hYlZBS77NpOf 0A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tnxee090d-21
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Oct 2023 15:37:27 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39BF2mad024892;
 Wed, 11 Oct 2023 15:14:39 GMT
Received: from ppma22.wdc07v.mail.ibm.com
 (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tnx0d0hr1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Oct 2023 15:14:39 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 39BDRwnK028191; Wed, 11 Oct 2023 15:13:47 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
 by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tkj1y93fx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Oct 2023 15:13:47 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com
 [10.241.53.104])
 by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 39BFDlaY18481694
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Oct 2023 15:13:47 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 031665805D;
 Wed, 11 Oct 2023 15:13:47 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9648058065;
 Wed, 11 Oct 2023 15:13:46 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
 by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 11 Oct 2023 15:13:46 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joel@jms.id.au, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, lvivier@redhat.com
Cc: Ninad Palsule <ninad@linux.ibm.com>, qemu-arm@nongnu.org
Subject: [PATCH v5 10/10] hw/fsi: Update MAINTAINER list
Date: Wed, 11 Oct 2023 10:13:39 -0500
Message-Id: <20231011151339.2782132-11-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011151339.2782132-1-ninad@linux.ibm.com>
References: <20231011151339.2782132-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: srqgZS_QtH5DKmfpikBMy_XY7HY9m7qJ
X-Proofpoint-ORIG-GUID: VE0A5sSTvhHi3EtLS7nTk6WH-mmFsE7I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_10,2023-10-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 mlxlogscore=933 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310110137
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
X-TUID: SevgHMHxrd/F

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
index 6111b6b4d9..c69f90b227 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3395,6 +3395,14 @@ F: tests/qtest/adm1272-test.c
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

