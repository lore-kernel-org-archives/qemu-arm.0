Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp583300lfg;
        Thu, 28 Jul 2022 16:24:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sHy4Mu5Bfexl9N/8JqC70pyR1hxKlJHr9XwWgfEblPAZASBSqp66f1HRt2LA+m4o/5djNf
X-Received: by 2002:a05:622a:1d3:b0:31f:319c:e7c1 with SMTP id t19-20020a05622a01d300b0031f319ce7c1mr1225152qtw.632.1659050670570;
        Thu, 28 Jul 2022 16:24:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659050670; cv=none;
        d=google.com; s=arc-20160816;
        b=cShQQcopt5He0X/Y3ttycuT2RplP1w11kXmqUh4YwqooznZ/Cb5OaRcQBIlmYCeRwA
         IOcSFwdyb6UfXQygCkWEBsQrOjFXF6k0Y7LwFDdK829CLt53oMa4iU1haa3L/TkkncV6
         XWc4aryiUfYn43cr3T+X5c6CZyQOXieZRnpbKTTwRljghMDTZY3tKDhzAWIXSR0B8LgY
         NE7ajMA08/FCH8qwNAOgcMLSkGz/WvGzMrhboWFPrtakAWdVMMUizzdS0ii8QZ/9wJl8
         ud8uaHCIKWJ3CNn5kD+YGoFRBdLkVIHVizQgzYMuVB3fR7p2WeOJYTfMCvVrP7nSg6t5
         1XnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HUaOApB/UPTh9XSrzMSpxLEvxtV0U/pSVmmO9j02/gU=;
        b=YOo+9izgruc2JBvH16Gf1Cj693iEn75jUcrPRLtxitS0l2VJegk1HTOd5r5qkq3UbM
         5aymeQBWjtCRKYho9ivgA086mBo9NoaqdHazIh9+d57T8K2Yeh3yMPYgw/aThXYLd3Jw
         BLv5mQomoLaZCgLH76+2MbWpqkbCtmh3MxVpceTFa3+JzupyY9neDqmzDQLuIn47ZCoD
         YIF6kwU1Pbso36jCjWYf2o+6c+99rIMG74rjMZyCyiNNKsvCzZ/PI2OBa7EtiaIY2FZG
         C43GIyIKttzA2f7esuPdxFihimq6vPo+qDRqrrw4V0XsMnS2r08lJnJoq7dkMp3YXQHh
         1pZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=evzRfeBc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gb4-20020a05622a598400b002f3c66f704csi1214593qtb.678.2022.07.28.16.24.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jul 2022 16:24:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=evzRfeBc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:34604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oHCrm-0003Db-0i
	for alex.bennee@linaro.org; Thu, 28 Jul 2022 19:24:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9208ef30ce=irischenlj@fb.com>)
 id 1oHCr7-0002V0-1Q; Thu, 28 Jul 2022 19:23:49 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:29602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9208ef30ce=irischenlj@fb.com>)
 id 1oHCr5-0002s8-6G; Thu, 28 Jul 2022 19:23:48 -0400
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26SKChBc032428;
 Thu, 28 Jul 2022 16:23:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=HUaOApB/UPTh9XSrzMSpxLEvxtV0U/pSVmmO9j02/gU=;
 b=evzRfeBcMcYRwqDql0YCwY3RMWFmCQMZH59ESw8YXa3QfDp7CxT7Vff4lR9YM7O4HnwG
 ltBBD4cNtqGfmVlqIngicpi9l9nu9fM+Frzu8nbxnsYXEd8gGfpXmoLik7FGL3qOHcZx
 Qf3LREq5FbdX4Uopz8OGIF9x+AZHdsJyOT0= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3hjw4ff763-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 28 Jul 2022 16:23:36 -0700
Received: from localhost (2620:10d:c085:108::4) by mail.thefacebook.com
 (2620:10d:c085:21d::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 28 Jul
 2022 16:23:34 -0700
From: Iris Chen <irischenlj@fb.com>
To: 
CC: <irischenlj@fb.com>, <peter@pjd.dev>, <pdel@fb.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <clg@kaod.org>,
 <patrick@stwcx.xyz>, <alistair@alistair23.me>, <kwolf@redhat.com>,
 <hreitz@redhat.com>, <peter.maydell@linaro.org>, <andrew@aj.id.au>,
 <joel@jms.id.au>, <thuth@redhat.com>, <lvivier@redhat.com>,
 <pbonzini@redhat.com>, <qemu-block@nongnu.org>, <dz4list@gmail.com>
Subject: [RFC 1/3] hw: m25p80: add prereading ability in transfer8
Date: Thu, 28 Jul 2022 16:23:20 -0700
Message-ID: <20220728232322.2921703-2-irischenlj@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220728232322.2921703-1-irischenlj@fb.com>
References: <20220728232322.2921703-1-irischenlj@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2620:10d:c085:108::4]
X-Proofpoint-ORIG-GUID: 7Srpz93pSdhwV8PtqyGqIUB33sHD5jMT
X-Proofpoint-GUID: 7Srpz93pSdhwV8PtqyGqIUB33sHD5jMT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-28_06,2022-07-28_02,2022-06-22_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=9208ef30ce=irischenlj@fb.com;
 helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6z7DtR8fTme5

With SPI-GPIO we don't have the input bits until
all 8 bits of the output have been shifted out,
so we have to prime the MISO with bogus values (0xFF).

Signed-off-by: Iris Chen <irischenlj@fb.com>
---
 hw/block/m25p80.c    | 29 ++++++++++++++++++++++++++++-
 hw/ssi/ssi.c         |  4 ----
 include/hw/ssi/ssi.h |  5 +++++
 3 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index a8d2519141..9b26bb96e5 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -1462,7 +1462,7 @@ static int m25p80_cs(SSIPeripheral *ss, bool select)
     return 0;
 }
 
-static uint32_t m25p80_transfer8(SSIPeripheral *ss, uint32_t tx)
+static uint32_t m25p80_transfer8_ex(SSIPeripheral *ss, uint32_t tx)
 {
     Flash *s = M25P80(ss);
     uint32_t r = 0;
@@ -1548,6 +1548,33 @@ static uint32_t m25p80_transfer8(SSIPeripheral *ss, uint32_t tx)
     return r;
 }
 
+/*
+ * Pre-reading logic for m25p80_transfer8:
+ * The existing SPI model assumes the output byte is fully formed,
+ * can be passed to the SPI device, and the input byte can be returned,
+ * all in one operation. With SPI-GPIO, we don't have the input byte
+ * until all 8 bits of the output have been shifted out, so we have
+ * to prime the MISO with bogus values (0xFF).
+ */
+static uint32_t m25p80_transfer8(SSIPeripheral *ss, uint32_t tx)
+{
+    Flash *s = M25P80(ss);
+    SSIBus *ssibus = (SSIBus *)qdev_get_parent_bus(DEVICE(s));
+
+    uint8_t prev_state = s->state;
+    uint32_t r = m25p80_transfer8_ex(ss, tx);
+    uint8_t curr_state = s->state;
+
+    if (ssibus->preread &&
+       /* cmd state has changed into DATA reading state */
+       (!(prev_state == STATE_READ || prev_state == STATE_READING_DATA) &&
+       (curr_state == STATE_READ || curr_state == STATE_READING_DATA))) {
+        r = m25p80_transfer8_ex(ss, 0xFF);
+    }
+
+    return r;
+}
+
 static void m25p80_write_protect_pin_irq_handler(void *opaque, int n, int level)
 {
     Flash *s = M25P80(opaque);
diff --git a/hw/ssi/ssi.c b/hw/ssi/ssi.c
index 003931fb50..21570fe25f 100644
--- a/hw/ssi/ssi.c
+++ b/hw/ssi/ssi.c
@@ -19,10 +19,6 @@
 #include "qapi/error.h"
 #include "qom/object.h"
 
-struct SSIBus {
-    BusState parent_obj;
-};
-
 #define TYPE_SSI_BUS "SSI"
 OBJECT_DECLARE_SIMPLE_TYPE(SSIBus, SSI_BUS)
 
diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
index f411858ab0..e54073d822 100644
--- a/include/hw/ssi/ssi.h
+++ b/include/hw/ssi/ssi.h
@@ -30,6 +30,11 @@ enum SSICSMode {
     SSI_CS_HIGH,
 };
 
+struct SSIBus {
+    BusState parent_obj;
+    bool preread;
+};
+
 /* Peripherals.  */
 struct SSIPeripheralClass {
     DeviceClass parent_class;
-- 
2.30.2

