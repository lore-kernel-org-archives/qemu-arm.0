Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp2108013ejc;
        Wed, 27 Sep 2023 13:35:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETT6OH/RC5d+HNmu9neoqupyEmdaU2089EX9SVrB+aqNfswWi6MY6obsekGJ9CdMD6772S
X-Received: by 2002:a05:622a:1ba7:b0:418:4db:afa1 with SMTP id bp39-20020a05622a1ba700b0041804dbafa1mr2903712qtb.63.1695846910585;
        Wed, 27 Sep 2023 13:35:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695846910; cv=none;
        d=google.com; s=arc-20160816;
        b=yoO3809gvPX3MSGxDyJ9MlMhCL8uFRmSzJm30lkffoRD1VtwUU+hjE+7EaxV2AfOSa
         GmcrSaHhf1KsUz2ZrOZWB8Xbc24ot0HCrZDBKgqruZmOSF0IxrKShYxggjseHei6DMO9
         xSFXxVz+PNnr/B3Gsdai2tSv5BPhLGzlJ0kZ81mpJjJTUQRkKX5FpVTyBGZAWfRzQ6s1
         voLpFcKLCEUO4bP4/7E529yIYEjkDqetTkiayN6nzbZ/etk/Z2wntlaOZkzGhg10Owr4
         +jlzQAagVnDiO6IyU6jy1W1kCuyR0iZ33je0ZmWGllnH28zrKhdVKEvohvmHH/h5HWJ2
         90aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=py/zBKPR46GPd1vseACG9HFcy+/81tVqMNVXJHl2gEM=;
        fh=z1KdWiyy8wraXUx7ouD6CbiYRDoSKNlzOStkMl49TkY=;
        b=VsOurgUkXi4vx91JIhvmYoPDcqd5I7xXbq698Pf1KschxbwQBPi7FVLFZlEy79rLkl
         8sG8aUtgmDP7OQBOnTgRuTYZyIOlWQ5Xx27Q8fJMHxoLIwh4iXfisGR4+fD/9SZnWOKo
         KGnkP7dRNAmRplrjkiQjh8TYh4HqLDznqHCnaxxC0zKU+QgKZDyhEi6jU3exh87e0po1
         kskpEL/tm1RrQpK2BY6kDFTsIwwsBXtDBHJXU3AKTF7FYAZEFOR4xmGAajQ8dxvJU2vk
         Mh7/nQG8SXWaOFktvcunDdNtTCZWwlQJ3nakm4DtDwXHQ8mnEZMdmrAnKiH/xeI1YgrJ
         dhAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=EKzWEEU+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b16-20020ac87fd0000000b00417b42a9c52si4611140qtk.6.2023.09.27.13.35.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Sep 2023 13:35:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=EKzWEEU+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qlbEi-00074n-4d; Wed, 27 Sep 2023 16:34:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mglenn@mamboa4.aus.stglabs.ibm.com>)
 id 1qlbEf-00074P-Pu
 for qemu-devel@nongnu.org; Wed, 27 Sep 2023 16:34:17 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mglenn@mamboa4.aus.stglabs.ibm.com>)
 id 1qlbEd-0001No-Fb
 for qemu-devel@nongnu.org; Wed, 27 Sep 2023 16:34:17 -0400
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38RJodk2019176; Wed, 27 Sep 2023 20:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=py/zBKPR46GPd1vseACG9HFcy+/81tVqMNVXJHl2gEM=;
 b=EKzWEEU+UGEFBS7KvMOgY2qOfr3UhLItSPONjayT/08TE/whP8m4FdOeFnpoTiBP9wpH
 g96EkbcLha6DAfJI9nky339nZhJg17jUQUnnY2i5cfvHJb/ovvf0OUmu0/u09DV8+p4c
 4VssBKs6jUlKdoT2IoAo/OH1sGG2eZ1MRwrxCGtSL714zRnKy4Hhz3NPzaR8WICiy3Yt
 OrwX6OoTJMb4Lw+iXgp6OErD2jmbTSicwfHo+WR3LBH9geRIO4UH2Snep/xmxj3GsIWx
 CVLqGk+enggUrJh3CoujUy5s/C5sQON+BXOXpMtOTFcj4iWRwEogTFY5haEMWyJjLXHJ Hw== 
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tcnreux0r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Sep 2023 20:33:40 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 38RJcblR030746; Wed, 27 Sep 2023 20:32:54 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tacjk60mw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Sep 2023 20:32:54 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com
 [10.241.53.103])
 by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 38RKWswF21037674
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Sep 2023 20:32:54 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E8D8B58052;
 Wed, 27 Sep 2023 20:32:53 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D7B2A5805A;
 Wed, 27 Sep 2023 20:32:53 +0000 (GMT)
Received: from mamboa4.aus.stglabs.ibm.com (unknown [9.3.84.87])
 by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Wed, 27 Sep 2023 20:32:53 +0000 (GMT)
Received: from mamboa4.aus.stglabs.ibm.com (localhost [127.0.0.1])
 by mamboa4.aus.stglabs.ibm.com (Postfix) with ESMTPS id 32F2C16A0816;
 Wed, 27 Sep 2023 15:32:53 -0500 (CDT)
Received: (from mglenn@localhost)
 by mamboa4.aus.stglabs.ibm.com (8.15.2/8.15.2/Submit) id 38RKWqHN3287675;
 Wed, 27 Sep 2023 15:32:52 -0500
From: Glenn Miles <milesg@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Cc: Glenn Miles <milesg@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 andrew@codeconstruct.com.au, Joel Stanley <joel@jms.id.au>
Subject: [PATCH] misc/pca9552: Fix inverted input status
Date: Wed, 27 Sep 2023 15:32:21 -0500
Message-Id: <20230927203221.3286895-1-milesg@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mjXrXOV9o0WrQX9kORj6bKQPIi7sXuXV
X-Proofpoint-ORIG-GUID: mjXrXOV9o0WrQX9kORj6bKQPIi7sXuXV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_13,2023-09-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1011 adultscore=0
 phishscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309270175
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=mglenn@mamboa4.aus.stglabs.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
X-TUID: WENBtO7LYwlk

The pca9552 INPUT0 and INPUT1 registers are supposed to
hold the logical values of the LED pins.  A logical 0
should be seen in the INPUT0/1 registers for a pin when
its corresponding LSn bits are set to 0, which is also
the state needed for turning on an LED in a typical
usage scenario.  Existing code was doing the opposite
and setting INPUT0/1 bit to a 1 when the LSn bit was
set to 0, so this commit fixes that.

Signed-off-by: Glenn Miles <milesg@linux.vnet.ibm.com>
---
 hw/misc/pca9552.c          | 13 +++++++++----
 tests/qtest/pca9552-test.c |  6 +++---
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
index fff19e369a..ad811fb249 100644
--- a/hw/misc/pca9552.c
+++ b/hw/misc/pca9552.c
@@ -112,13 +112,18 @@ static void pca955x_update_pin_input(PCA955xState *s)
 
         switch (config) {
         case PCA9552_LED_ON:
-            qemu_set_irq(s->gpio[i], 1);
-            s->regs[input_reg] |= 1 << input_shift;
-            break;
-        case PCA9552_LED_OFF:
+            /* Pin is set to 0V to turn on LED */
             qemu_set_irq(s->gpio[i], 0);
             s->regs[input_reg] &= ~(1 << input_shift);
             break;
+        case PCA9552_LED_OFF:
+            /*
+             * Pin is set to Hi-Z to turn off LED and
+             * pullup sets it to a logical 1.
+             */
+            qemu_set_irq(s->gpio[i], 1);
+            s->regs[input_reg] |= 1 << input_shift;
+            break;
         case PCA9552_LED_PWM0:
         case PCA9552_LED_PWM1:
             /* TODO */
diff --git a/tests/qtest/pca9552-test.c b/tests/qtest/pca9552-test.c
index d80ed93cd3..ccca2b3d91 100644
--- a/tests/qtest/pca9552-test.c
+++ b/tests/qtest/pca9552-test.c
@@ -60,7 +60,7 @@ static void send_and_receive(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_cmphex(value, ==, 0x55);
 
     value = i2c_get8(i2cdev, PCA9552_INPUT0);
-    g_assert_cmphex(value, ==, 0x0);
+    g_assert_cmphex(value, ==, 0xFF);
 
     pca9552_init(i2cdev);
 
@@ -68,13 +68,13 @@ static void send_and_receive(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_cmphex(value, ==, 0x54);
 
     value = i2c_get8(i2cdev, PCA9552_INPUT0);
-    g_assert_cmphex(value, ==, 0x01);
+    g_assert_cmphex(value, ==, 0xFE);
 
     value = i2c_get8(i2cdev, PCA9552_LS3);
     g_assert_cmphex(value, ==, 0x54);
 
     value = i2c_get8(i2cdev, PCA9552_INPUT1);
-    g_assert_cmphex(value, ==, 0x10);
+    g_assert_cmphex(value, ==, 0xEF);
 }
 
 static void pca9552_register_nodes(void)
-- 
2.31.1

