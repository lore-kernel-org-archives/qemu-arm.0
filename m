Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp781106ejb;
        Thu, 19 Oct 2023 13:41:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0h2j/ShMfR5cRk4olx01G9pyfXltF8e9Skv3qjuZeJXVS0dDKO6peTGzQmH6Tk9eVxTZo
X-Received: by 2002:a05:620a:4550:b0:778:8fb1:93b0 with SMTP id u16-20020a05620a455000b007788fb193b0mr4128872qkp.8.1697748070932;
        Thu, 19 Oct 2023 13:41:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697748070; cv=none;
        d=google.com; s=arc-20160816;
        b=gQzCjUOoUbNJysqhPMbV6Gz6Ic6keWc34ngigWpjEqeJLlSDPVpSg4fCDGt6sCb3Aq
         qN9fxjuEg/dhZbLNKiEeDQNIevmYWwm9qn/ehVatAkNMbQ4X0v/i9SDv0hfGX/L1rWnm
         c5thXaSfjW8ITOG5Tn3pPeKmf0CAcqsdCQheuJFVTTmIyKpaNBp3/C+xAKHoiCFUj2ws
         87U3sN09QsoT2ER/u9M1wZJc0es2sQsyFwxew9JgXX5a3ChZ1Txf3dF4+w1PkeYLzeD2
         xFG+X1pesUQu1Q/oQRyngt7n4xS7j2L5dZkuQe6Vj7fgx4AdSj+Xwmcmdzg1OtUSpiJy
         cePw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ShYhn7ZEuYPUsywe48w0fVpMWgNoHRxSd6pViMSwHUc=;
        fh=z1KdWiyy8wraXUx7ouD6CbiYRDoSKNlzOStkMl49TkY=;
        b=EtGMBpXQd3hHpfmDmiP2MaqHglsiKEWU4zkRL077q3hyxjX2R7uBFMUjBlOP+c0dhc
         drnD+BsAevOOHVRbqSthEEKsviYce4We5bx7Ss06AapBQvR81gFMjenshc39MmFLG5Iu
         qfZHC0Y9RnbjjGnmHr6/qxT6B4zYPNC0mE2AvifxUMGuPKrbbyDIelbHeoyEvn6hq/F+
         n4Wv+2mpL6eSSAjeTFdIELw9Q6bWpa01wemAYrCBRRQt4ZespzKF9DBZisDO9pPX08fk
         sF1H1h13/dSY9taSPC2Gm9wtcWSv7xf8gIAqzajaJ4l5ihevJLAveIUUjQ0eTyY3DBo/
         XkNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=YXLkQnro;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l18-20020a05620a211200b007765135d85bsi171864qkl.591.2023.10.19.13.41.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 13:41:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=YXLkQnro;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qtZos-0000bX-Ux; Thu, 19 Oct 2023 16:40:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <milesg@linux.vnet.ibm.com>)
 id 1qtZor-0000ZI-JJ; Thu, 19 Oct 2023 16:40:37 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <milesg@linux.vnet.ibm.com>)
 id 1qtZop-0008EH-Qz; Thu, 19 Oct 2023 16:40:37 -0400
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39JKbP2O007259; Thu, 19 Oct 2023 20:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ShYhn7ZEuYPUsywe48w0fVpMWgNoHRxSd6pViMSwHUc=;
 b=YXLkQnroXO9GjuhvNBZKidqsqL30P+5tGyKkhnN4hJsvfpeTxx7t6HT96moRgQdgqujS
 4G23HJ1p+fPgEBpWD99WLfHIGTNTicY8TJ9zqKwfZEod0uFd3HWv0q4IS3GUGMS1Xc53
 8jvw9r9mKt4qys+aRZCvBw5KkFBiXp7LzFL1A3VlSMuuSq6dnxCdTtxqSWNq1gsPJx3C
 9CyGx17r9z1S5Rou8UgUhescSTyM9aF3C/6/p6ITLz4UhLubuEzxchrsGKZzd7eA7T/j
 rC94dJS4xTzi9oYjKZMuz+n5LqXDpbDUI2LlPmt8R2ITdGk6FcwfiB1FWLLR9eAr7Qpl NQ== 
Received: from ppma21.wdc07v.mail.ibm.com
 (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tubnc86wh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Oct 2023 20:40:26 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 39JJ5qiu020105; Thu, 19 Oct 2023 20:40:24 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
 by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tr6ankdnq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Oct 2023 20:40:24 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 39JKeN8766912548
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Oct 2023 20:40:23 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 955BF5805D;
 Thu, 19 Oct 2023 20:40:23 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2AFC658059;
 Thu, 19 Oct 2023 20:40:23 +0000 (GMT)
Received: from mamboa4.aus.stglabs.ibm.com (unknown [9.3.84.87])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 19 Oct 2023 20:40:23 +0000 (GMT)
From: Glenn Miles <milesg@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Cc: Glenn Miles <milesg@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 andrew@codeconstruct.com.au, Joel Stanley <joel@jms.id.au>
Subject: [PATCH 1/2] misc/pca9552: Fix inverted input status
Date: Thu, 19 Oct 2023 15:40:10 -0500
Message-Id: <20231019204011.3174115-2-milesg@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20231019204011.3174115-1-milesg@linux.vnet.ibm.com>
References: <20231019204011.3174115-1-milesg@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9itgex1MsDFztEeyzfhIOl5Yo4cL-G4N
X-Proofpoint-GUID: 9itgex1MsDFztEeyzfhIOl5Yo4cL-G4N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_20,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310190176
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
X-TUID: 3Hw03Jf7KAMG

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

Changes from prior version:
    - Added comment regarding pca953X
    - Added cover letter

 hw/misc/pca9552.c          | 18 +++++++++++++-----
 tests/qtest/pca9552-test.c |  6 +++---
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
index fff19e369a..445f56a9e8 100644
--- a/hw/misc/pca9552.c
+++ b/hw/misc/pca9552.c
@@ -36,7 +36,10 @@ typedef struct PCA955xClass PCA955xClass;
 
 DECLARE_CLASS_CHECKERS(PCA955xClass, PCA955X,
                        TYPE_PCA955X)
-
+/*
+ * Note:  The LED_ON and LED_OFF configuration values for the PCA955X
+ *        chips are the reverse of the PCA953X family of chips.
+ */
 #define PCA9552_LED_ON   0x0
 #define PCA9552_LED_OFF  0x1
 #define PCA9552_LED_PWM0 0x2
@@ -112,13 +115,18 @@ static void pca955x_update_pin_input(PCA955xState *s)
 
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

