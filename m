Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp717486lfc;
        Fri, 29 May 2020 11:00:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7Wi7CCXsig11xhursOJPeHOIEAzmUkk7Iqqz4tqAbkmCX4s+Pi3P7Bdht9yt1YlVs6NZx
X-Received: by 2002:a37:4b0c:: with SMTP id y12mr8525698qka.43.1590775233288;
        Fri, 29 May 2020 11:00:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590775233; cv=none;
        d=google.com; s=arc-20160816;
        b=POn/Xz4XighkWs41valQ7607A7fh5rcNUdaoFzkZoRTZ6ulGT0RAZ5ynXg2rtjxVcv
         sXU1mUZVe0orlY72MdGdHA2ULZxneWsE3A6XcyfLS27DIZAGAa1w6KRr9FQfzhYY6sHQ
         ZnFx60ncMo4jz1IqHp+XDmE0dW+q4zC6h4zpLlPRARS1nW8BSkHt6XpyWMENiypcoxEH
         lcm9lFyilClj7UVremR+m9yQbTW5oyCN0ZUmZDQfsETfqqy/5jEV/DiCSjUl/dZWbVpF
         N+gexbWmNZ9xggxKDf4g5YL2LM5IkmKj2SYoj+KTG8FFkFwDc4W5pnVm2aXeA4xlbBUf
         7r/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=vZEiIi0JOJ27BWfJ6Emlvc4Kwua34mngiU7R7RsZQYo=;
        b=ZnZDb1YAx/AtwrrgJC+rAi1cZwu/7/WbK5qgSZbjcgw5mCqA0d/BptugbhdcJ3DhU0
         8A3fpWpAkKidS7JY7xzpsVReWd9DqvTA2btERuBdfLGmWAlZxnvcDf4SIm2EiyHVWvGL
         vGFw3jz95P0L8a3vdBrD698zAi4yVYxY4is4/BQeFcqvvjyyjFX32h2sAQgDXqTYQi39
         y9/c+9aw7HnsEtFecRkMMX2MzoL2dF0khk/1AA5CgD5foQSerMU7CNAq+JQO/VMzlBEt
         +tlmPtG+RZZ1EyYnXcsNLo01hFFtd/we8W/Y7rxgmTmQYhqOo9q9JnZ++yZM0K3O6kCa
         I27Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b199si5500103qkg.107.2020.05.29.11.00.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 May 2020 11:00:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jejJ1-0001zB-Ef
	for alex.bennee@linaro.org; Fri, 29 May 2020 14:00:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1jejIt-0001yT-Cd; Fri, 29 May 2020 14:00:23 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:37455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1jejIr-0004pk-Mb; Fri, 29 May 2020 14:00:23 -0400
Received: from localhost.localdomain (lns-bzn-59-82-252-130-88.adsl.proxad.net
 [82.252.130.88]) (Authenticated sender: jcd@tribudubois.net)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id DBF0E200008;
 Fri, 29 May 2020 18:00:14 +0000 (UTC)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: qemu-arm@nongnu.org
Subject: [PATCH] hw/misc/imx6ul_ccm.c: Implement non writable bits in CCM
 registers
Date: Fri, 29 May 2020 20:00:05 +0200
Message-Id: <20200529180005.169036-1-jcd@tribudubois.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=217.70.178.232; envelope-from=jcd@tribudubois.net;
 helo=relay12.mail.gandi.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/29 13:07:41
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, peter.chubb@nicta.com.au, qemu-devel@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JBFty6wJCcCA

Some bits of the CCM registers are non writable.

This was left undone in the initial commit (all bits of registers were
writable).

This patch add the required code to protect non writable bits.

Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
---
 hw/misc/imx6ul_ccm.c | 81 +++++++++++++++++++++++++++++++++++++-------
 1 file changed, 68 insertions(+), 13 deletions(-)

diff --git a/hw/misc/imx6ul_ccm.c b/hw/misc/imx6ul_ccm.c
index a2fc1d0364a..ede845fde8e 100644
--- a/hw/misc/imx6ul_ccm.c
+++ b/hw/misc/imx6ul_ccm.c
@@ -19,6 +19,62 @@
 
 #include "trace.h"
 
+static const uint32_t ccm_mask[CCM_MAX] = {
+    [CCM_CCR] = 0xf01fef80,
+    [CCM_CCDR] = 0xfffeffff,
+    [CCM_CSR] = 0xffffffff,
+    [CCM_CCSR] = 0xfffffef2,
+    [CCM_CACRR] = 0xfffffff8,
+    [CCM_CBCDR] = 0xc1f8e000,
+    [CCM_CBCMR] = 0xfc03cfff,
+    [CCM_CSCMR1] = 0x80700000,
+    [CCM_CSCMR2] = 0xe01ff003,
+    [CCM_CSCDR1] = 0xfe00c780,
+    [CCM_CS1CDR] = 0xfe00fe00,
+    [CCM_CS2CDR] = 0xf8007000,
+    [CCM_CDCDR] = 0xf00fffff,
+    [CCM_CHSCCDR] = 0xfffc01ff,
+    [CCM_CSCDR2] = 0xfe0001ff,
+    [CCM_CSCDR3] = 0xffffc1ff,
+    [CCM_CDHIPR] = 0xffffffff,
+    [CCM_CTOR] = 0x00000000,
+    [CCM_CLPCR] = 0xf39ff01c,
+    [CCM_CISR] = 0xfb85ffbe,
+    [CCM_CIMR] = 0xfb85ffbf,
+    [CCM_CCOSR] = 0xfe00fe00,
+    [CCM_CGPR] = 0xfffc3fea,
+    [CCM_CCGR0] = 0x00000000,
+    [CCM_CCGR1] = 0x00000000,
+    [CCM_CCGR2] = 0x00000000,
+    [CCM_CCGR3] = 0x00000000,
+    [CCM_CCGR4] = 0x00000000,
+    [CCM_CCGR5] = 0x00000000,
+    [CCM_CCGR6] = 0x00000000,
+    [CCM_CMEOR] = 0xafffff1f,
+};
+
+static const uint32_t analog_mask[CCM_ANALOG_MAX] = {
+    [CCM_ANALOG_PLL_ARM] = 0xfff60f80,
+    [CCM_ANALOG_PLL_USB1] = 0xfffe0fbc,
+    [CCM_ANALOG_PLL_USB2] = 0xfffe0fbc,
+    [CCM_ANALOG_PLL_SYS] = 0xfffa0ffe,
+    [CCM_ANALOG_PLL_SYS_SS] = 0x00000000,
+    [CCM_ANALOG_PLL_SYS_NUM] = 0xc0000000,
+    [CCM_ANALOG_PLL_SYS_DENOM] = 0xc0000000,
+    [CCM_ANALOG_PLL_AUDIO] = 0xffe20f80,
+    [CCM_ANALOG_PLL_AUDIO_NUM] = 0xc0000000,
+    [CCM_ANALOG_PLL_AUDIO_DENOM] = 0xc0000000,
+    [CCM_ANALOG_PLL_VIDEO] = 0xffe20f80,
+    [CCM_ANALOG_PLL_VIDEO_NUM] = 0xc0000000,
+    [CCM_ANALOG_PLL_VIDEO_DENOM] = 0xc0000000,
+    [CCM_ANALOG_PLL_ENET] = 0xffc20ff0,
+    [CCM_ANALOG_PFD_480] = 0x40404040,
+    [CCM_ANALOG_PFD_528] = 0x40404040,
+    [PMU_MISC0] = 0x01fe8306,
+    [PMU_MISC1] = 0x07fcede0,
+    [PMU_MISC2] = 0x005f5f5f,
+};
+
 static const char *imx6ul_ccm_reg_name(uint32_t reg)
 {
     static char unknown[20];
@@ -596,11 +652,8 @@ static void imx6ul_ccm_write(void *opaque, hwaddr offset, uint64_t value,
 
     trace_ccm_write_reg(imx6ul_ccm_reg_name(index), (uint32_t)value);
 
-    /*
-     * We will do a better implementation later. In particular some bits
-     * cannot be written to.
-     */
-    s->ccm[index] = (uint32_t)value;
+    s->ccm[index] = (s->ccm[index] & ccm_mask[index]) |
+                           ((uint32_t)value & ~ccm_mask[index]);
 }
 
 static uint64_t imx6ul_analog_read(void *opaque, hwaddr offset, unsigned size)
@@ -737,7 +790,8 @@ static void imx6ul_analog_write(void *opaque, hwaddr offset, uint64_t value,
          * the REG_NAME register. So we change the value of the
          * REG_NAME register, setting bits passed in the value.
          */
-        s->analog[index - 1] |= value;
+        s->analog[index - 1] = s->analog[index - 1] |
+                               (value & ~analog_mask[index - 1]);
         break;
     case CCM_ANALOG_PLL_ARM_CLR:
     case CCM_ANALOG_PLL_USB1_CLR:
@@ -762,7 +816,8 @@ static void imx6ul_analog_write(void *opaque, hwaddr offset, uint64_t value,
          * the REG_NAME register. So we change the value of the
          * REG_NAME register, unsetting bits passed in the value.
          */
-        s->analog[index - 2] &= ~value;
+        s->analog[index - 2] = s->analog[index - 2] &
+                               ~(value & ~analog_mask[index - 2]);
         break;
     case CCM_ANALOG_PLL_ARM_TOG:
     case CCM_ANALOG_PLL_USB1_TOG:
@@ -787,14 +842,14 @@ static void imx6ul_analog_write(void *opaque, hwaddr offset, uint64_t value,
          * the REG_NAME register. So we change the value of the
          * REG_NAME register, toggling bits passed in the value.
          */
-        s->analog[index - 3] ^= value;
+        s->analog[index - 3] = (s->analog[index - 3] &
+                                analog_mask[index - 3]) |
+                               ((value ^ s->analog[index - 3]) &
+                                ~analog_mask[index - 3]);
         break;
     default:
-        /*
-         * We will do a better implementation later. In particular some bits
-         * cannot be written to.
-         */
-        s->analog[index] = value;
+        s->analog[index] = (s->analog[index] & analog_mask[index]) |
+                           (value & ~analog_mask[index]);
         break;
     }
 }
-- 
2.25.1

