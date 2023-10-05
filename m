Received: by 2002:a17:906:14cc:b0:9b2:89ee:1eb8 with SMTP id y12csp571939ejc;
        Thu, 5 Oct 2023 13:43:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERlTr1md01NZ3MJeF1rdX4PBNEwqLSxo++Vfc2xW097Po8JvW87PEcWjpmYAaCnDBN8j3K
X-Received: by 2002:a0c:cc02:0:b0:65b:2738:9bb4 with SMTP id r2-20020a0ccc02000000b0065b27389bb4mr5670447qvk.23.1696538596851;
        Thu, 05 Oct 2023 13:43:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696538596; cv=none;
        d=google.com; s=arc-20160816;
        b=hfCisnitybJ6vrwRM8DE0qKvpnxvB8uTL57Ci3V/1vOB6J8IvnPBW2GldO7jb0fY5D
         AG2DVm+I+ve0JvCK61ZFAjzSIJUasp4lqpTeUOKiD45haQRYre1vdiOYJts923hVbVQ6
         iwuwgWx7xkH2ltY4Ye/OiGym5pJ8uX8loHQ1xua4ryRTpb84nUwjdEUhVTlNI+W4gbn0
         oK0fbxqIbUOYTgRzIv9sysBEdy8e8B2OkNcTGlrQoje64pO+m2PYF7PkEl00GZqZx2YK
         xfjTX7dztj+FEu/1k+6T6TiVy5xoQs3BGo+p/lz9B7BVFYoKM6KRUQEDCiu2S4JWRRWi
         8SlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=qBTyIjkX0FsTY0uSX1euWarZaz2rnIXwWz2NVHKjHdA=;
        fh=z1KdWiyy8wraXUx7ouD6CbiYRDoSKNlzOStkMl49TkY=;
        b=ExfIS+85+j/MjxUWpsBlt4F0Mv/GOdvhMViCZfZrUSrqsPt0dqemKwcyZCWBIIJhMx
         TVpqIibSSed32wHJHVsss5J+UXCYVmGpo9yewBkp3t5m2wKwMJxFks5hGSPUC47hn25e
         lurxgGE/+cbrZu4vqZBPRiwje8axaQYwDEVOJ5xqmEv4ldKXUAmVMUQX+Kojp+QLUivr
         asiQCBFCq2nWozaG2y0wFMlCoyryv+LUmqvVENUlLYfJ2Pu43NB99/wenzhdd9dCruYX
         QFlQ0qRxuvcgovVBAMhSjHe4VmPyC3PHWvde8zMTNxbchZR/LVCsrjdv06YG9GvoqAUr
         36Dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=YCb1epPQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id tn24-20020a05620a3c1800b00775a1063051si1428249qkn.501.2023.10.05.13.43.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Oct 2023 13:43:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=YCb1epPQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qoVBc-0004XR-1N; Thu, 05 Oct 2023 16:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mglenn@mamboa4.aus.stglabs.ibm.com>)
 id 1qoVBY-0004RG-21
 for qemu-devel@nongnu.org; Thu, 05 Oct 2023 16:43:05 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mglenn@mamboa4.aus.stglabs.ibm.com>)
 id 1qoVBW-0006Se-F2
 for qemu-devel@nongnu.org; Thu, 05 Oct 2023 16:43:03 -0400
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 395KYNlq020124; Thu, 5 Oct 2023 20:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=qBTyIjkX0FsTY0uSX1euWarZaz2rnIXwWz2NVHKjHdA=;
 b=YCb1epPQkNsFaCPcJ+U4skHnJeslcQ6T/jWCRYTf2f8EeG00OLYEyq32KvQoWoTMSwyT
 VX8f7vRamg9yQ5/cfLzp3jGCFq6yjhTeCiGfjiu5dLZHkR3Z4GGTQy85B+dSch546iGU
 dnM7iX4OgsYXOs+qojColrtGKSY3rsho7qzbdKMdUP2FAyKr7oRJ7XLHXPARtpdF5k3A
 fEJwYqjf3M2SYEF5cpzj3npDA8Sm3EMeR2MZDE4haVKEycvMPfgTRMxFhN/enuA12CC5
 bOaXGt+59KcmT0IMBtkMd7AF7nHK8rX1vUYf6NGcqRtwRJZRxsFALcgYvjuOa2zNVexl aw== 
Received: from ppma23.wdc07v.mail.ibm.com
 (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tj438gbgp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Oct 2023 20:42:32 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 395KKsOh007437; Thu, 5 Oct 2023 20:42:32 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
 by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3teygmbaag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Oct 2023 20:42:32 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com
 [10.241.53.104])
 by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 395KgV0i21824216
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Oct 2023 20:42:31 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B4A15806B;
 Thu,  5 Oct 2023 20:42:31 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8AFA358069;
 Thu,  5 Oct 2023 20:42:31 +0000 (GMT)
Received: from mamboa4.aus.stglabs.ibm.com (unknown [9.3.84.87])
 by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Thu,  5 Oct 2023 20:42:31 +0000 (GMT)
Received: from mamboa4.aus.stglabs.ibm.com (localhost [127.0.0.1])
 by mamboa4.aus.stglabs.ibm.com (Postfix) with ESMTPS id 0A3EC16A0848;
 Thu,  5 Oct 2023 15:42:31 -0500 (CDT)
Received: (from mglenn@localhost)
 by mamboa4.aus.stglabs.ibm.com (8.15.2/8.15.2/Submit) id 395KgUVc3523027;
 Thu, 5 Oct 2023 15:42:30 -0500
From: Glenn Miles <milesg@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Cc: Glenn Miles <milesg@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 andrew@codeconstruct.com.au, Joel Stanley <joel@jms.id.au>
Subject: [PATCH] misc/pca9552: Fix for pca9552 not getting reset
Date: Thu,  5 Oct 2023 15:42:26 -0500
Message-Id: <20231005204226.3522978-1-milesg@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FTW6Xi2ZC-RLBRWD0VS8NW3z8OKTedXy
X-Proofpoint-ORIG-GUID: FTW6Xi2ZC-RLBRWD0VS8NW3z8OKTedXy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-05_15,2023-10-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0
 impostorscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310050157
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=mglenn@mamboa4.aus.stglabs.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
X-TUID: 3xMAYMDGVtwt

Testing of the pca9552 device on the powernv platform
showed that the reset method was not being called when
an instance of the device was realized.  This was causing
the INPUT0/INPUT1 POR values to be incorrect.

Fixed by calling pca9552_reset from within the
pca9552_realize method.

Signed-off-by: Glenn Miles <milesg@linux.vnet.ibm.com>
---
 hw/misc/pca9552.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
index f28b5ecd7e..4e198af137 100644
--- a/hw/misc/pca9552.c
+++ b/hw/misc/pca9552.c
@@ -418,6 +418,12 @@ static void pca955x_realize(DeviceState *dev, Error **errp)
     qdev_init_gpio_in(dev, pca955x_gpio_in_handler, k->pin_count);
 }
 
+static void pca9552_realize(DeviceState *dev, Error **errp)
+{
+    pca955x_realize(dev, errp);
+    pca9552_reset(dev);
+}
+
 static Property pca955x_properties[] = {
     DEFINE_PROP_STRING("description", PCA955xState, description),
     DEFINE_PROP_END_OF_LIST(),
@@ -450,7 +456,7 @@ static void pca9552_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
     PCA955xClass *pc = PCA955X_CLASS(oc);
 
-    dc->reset = pca9552_reset;
+    dc->realize = pca9552_realize;
     dc->vmsd = &pca9552_vmstate;
     pc->max_reg = PCA9552_LS3;
     pc->pin_count = 16;
-- 
2.31.1

