Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2231363ejb;
        Tue, 24 Oct 2023 11:13:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGixGpV5vEfdOS6NNWv9ZsCclr3Xkb+XmfFLbo8hrrWAelMYEg+qxGfZri3Cvmlt1dG0Tg1
X-Received: by 2002:a05:620a:1991:b0:775:cf6d:a468 with SMTP id bm17-20020a05620a199100b00775cf6da468mr15253859qkb.49.1698171194367;
        Tue, 24 Oct 2023 11:13:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698171194; cv=none;
        d=google.com; s=arc-20160816;
        b=U/wxoG4Ttr6dcAPD4m2RL+t/X0ZpwN8zr/gmkP/tKzKLikx2a9xFUo6VdgnZf3QYK0
         ZqU+NOUTn3MMOySrjno7I7XwwNC1Y+6e3spy52nYNMbIg+EVEF4IGqbHKPn4qlMzQ8Cb
         ISMzpACY/+tAPCf8EDqgo789ufSjZW2OEP7dcW5oifDV547+LnRunIxwffvtkNB+CYIN
         M4ZP8C0X4GKlvh4vxWnQdJr14pzL+v0eTWe0aNDmcbHnpF3iskQdFjhm2tdNMVV2xbcD
         Fd7ATqNnzPn7JvzZldsJyYOxT1tFv1L2tpbfostomX9uWMeoZuBFbMiUd6KMa45zaGqV
         PfLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FFQEgEx8YbJquu2Ao4GeuWhl7D5qeAnDI6t7HoXxWHE=;
        fh=NAal76Z/q7FBYhiEiWbymNk3zrFoOu+wgUVBjeRKdu0=;
        b=T2Pp8j9tiMWXfeXbc7ClHVxsGJvqHQHPNDVf4Gk9kwbGVj97DJyVgVZXupVNcflEis
         q7Ex2/qMtzWZRRccMGVekprTJQ4akt9fsdWI5yRquaaT60iHkvrD4cPzrYuy/m6H1/S8
         NOFPj6FyIHUesIT4afRbLk6kZ2WEzoJy7jF8xSfo2YN8InA4t3wJtNEjmNf05wh+ee/r
         Pbgl2xXyu1bSoyqB15hpLEwJzKUrK4+V0kf0jUnse5Ttbt+/nDHcsqPS0s7W8FcwpKbn
         r/KyvsMr82mu/BaEbEx2vGFK+tVoGKUlDD55zZ7/osqY9q7dxU1lIUXqui/Q5xlm2F+P
         zQ2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=ix9lIdVK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id de39-20020a05620a372700b0077892b417desi8055584qkb.333.2023.10.24.11.13.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 11:13:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=ix9lIdVK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qvLtE-00047q-Fx; Tue, 24 Oct 2023 14:12:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <milesg@linux.vnet.ibm.com>)
 id 1qvLtB-0003ez-9y; Tue, 24 Oct 2023 14:12:25 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <milesg@linux.vnet.ibm.com>)
 id 1qvLt8-0005My-OD; Tue, 24 Oct 2023 14:12:24 -0400
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39OIAiOj011831; Tue, 24 Oct 2023 18:12:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=FFQEgEx8YbJquu2Ao4GeuWhl7D5qeAnDI6t7HoXxWHE=;
 b=ix9lIdVKCEA8qaqPhcu86B69z7MYLunfCEj2fpvXwUiPIs09chrOK27LZfr8aIjyBeH8
 Q7Xf7LkeXC3wvttDmzcNErQam6iELnmoN/Ur5kbQkvLwm6clsraHIa14kR6/MfaRbMps
 NEifeLqSAC3zocOBetlCpNpKDTSNyv+UYfamGaYTsy75+J5mjLGoie7L91yJanVPnFyp
 G3rP3M7FTHWWFdrO/vQUgyO5SpwAl1uPqNkb0fhjQbW0oYmS9aHKsPL2KGfl8upRGU9h
 d2XzeVoqXP1zirzIZ80vAqioPahTmlt+A8zS5c2iVShDMNu8+gZy5enwHSg4g4dXhzfX rg== 
Received: from ppma21.wdc07v.mail.ibm.com
 (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3txjyer19m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Oct 2023 18:12:12 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 39OGS6mq026883; Tue, 24 Oct 2023 18:12:11 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
 by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tvsynsaav-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Oct 2023 18:12:11 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com
 [10.241.53.102])
 by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 39OICBud21758578
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Oct 2023 18:12:11 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38FC85803F;
 Tue, 24 Oct 2023 18:12:11 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC59C58056;
 Tue, 24 Oct 2023 18:12:10 +0000 (GMT)
Received: from mamboa4.aus.stglabs.ibm.com (unknown [9.3.84.87])
 by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 24 Oct 2023 18:12:10 +0000 (GMT)
From: Glenn Miles <milesg@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Cc: Glenn Miles <milesg@linux.vnet.ibm.com>, qemu-arm@nongnu.org, clg@kaod.org,
 andrew@codeconstruct.com.au, joel@jms.id.au, philmd@linaro.org
Subject: [PATCH v3 2/2] misc/pca9552: Let external devices set pca9552 inputs
Date: Tue, 24 Oct 2023 13:11:44 -0500
Message-Id: <20231024181144.4045056-3-milesg@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20231024181144.4045056-1-milesg@linux.vnet.ibm.com>
References: <20231024181144.4045056-1-milesg@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6udSF4Cx3YIrBwUseUyIwQn48sKCw80v
X-Proofpoint-GUID: 6udSF4Cx3YIrBwUseUyIwQn48sKCw80v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-24_17,2023-10-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 mlxlogscore=999 impostorscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310240155
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=milesg@linux.vnet.ibm.com; helo=mx0b-001b2d01.pphosted.com
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
X-TUID: FhMlHGcwb/vb

Allow external devices to drive pca9552 input pins by adding
input GPIO's to the model.  This allows a device to connect
its output GPIO's to the pca9552 input GPIO's.

In order for an external device to set the state of a pca9552
pin, the pin must first be configured for high impedance (LED
is off).  If the pca9552 pin is configured to drive the pin low
(LED is on), then external input will be ignored.

Here is a table describing the logical state of a pca9552 pin
given the state being driven by the pca9552 and an external device:

                   PCA9552
                   Configured
                   State

                  | Hi-Z | Low |
            ------+------+-----+
  External   Hi-Z |  Hi  | Low |
  Device    ------+------+-----+
  State      Low  |  Low | Low |
            ------+------+-----+

Signed-off-by: Glenn Miles <milesg@linux.vnet.ibm.com>
---
Changes from v2:
    - Squashed changes to only update output GPIO if state changed
    - Used Andrew's suggestion to simplify code

 hw/misc/pca9552.c         | 50 +++++++++++++++++++++++++++++++++------
 include/hw/misc/pca9552.h |  3 ++-
 2 files changed, 45 insertions(+), 8 deletions(-)

diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
index 445f56a9e8..fe876471c8 100644
--- a/hw/misc/pca9552.c
+++ b/hw/misc/pca9552.c
@@ -44,6 +44,8 @@ DECLARE_CLASS_CHECKERS(PCA955xClass, PCA955X,
 #define PCA9552_LED_OFF  0x1
 #define PCA9552_LED_PWM0 0x2
 #define PCA9552_LED_PWM1 0x3
+#define PCA9552_PIN_LOW  0x0
+#define PCA9552_PIN_HIZ  0x1
 
 static const char *led_state[] = {"on", "off", "pwm0", "pwm1"};
 
@@ -110,22 +112,27 @@ static void pca955x_update_pin_input(PCA955xState *s)
 
     for (i = 0; i < k->pin_count; i++) {
         uint8_t input_reg = PCA9552_INPUT0 + (i / 8);
-        uint8_t input_shift = (i % 8);
+        uint8_t bit_mask = 1 << (i % 8);
         uint8_t config = pca955x_pin_get_config(s, i);
+        uint8_t old_value = s->regs[input_reg] & bit_mask;
+        uint8_t new_value;
 
         switch (config) {
         case PCA9552_LED_ON:
             /* Pin is set to 0V to turn on LED */
-            qemu_set_irq(s->gpio[i], 0);
-            s->regs[input_reg] &= ~(1 << input_shift);
+            s->regs[input_reg] &= ~bit_mask;
             break;
         case PCA9552_LED_OFF:
             /*
              * Pin is set to Hi-Z to turn off LED and
-             * pullup sets it to a logical 1.
+             * pullup sets it to a logical 1 unless
+             * external device drives it low.
              */
-            qemu_set_irq(s->gpio[i], 1);
-            s->regs[input_reg] |= 1 << input_shift;
+            if (s->ext_state[i] == PCA9552_PIN_LOW) {
+                s->regs[input_reg] &= ~bit_mask;
+            } else {
+                s->regs[input_reg] |=  bit_mask;
+            }
             break;
         case PCA9552_LED_PWM0:
         case PCA9552_LED_PWM1:
@@ -133,6 +140,12 @@ static void pca955x_update_pin_input(PCA955xState *s)
         default:
             break;
         }
+
+        /* update irq state only if pin state changed */
+        new_value = s->regs[input_reg] & bit_mask;
+        if (new_value != old_value) {
+            qemu_set_irq(s->gpio_out[i], !!new_value);
+        }
     }
 }
 
@@ -340,6 +353,7 @@ static const VMStateDescription pca9552_vmstate = {
         VMSTATE_UINT8(len, PCA955xState),
         VMSTATE_UINT8(pointer, PCA955xState),
         VMSTATE_UINT8_ARRAY(regs, PCA955xState, PCA955X_NR_REGS),
+        VMSTATE_UINT8_ARRAY(ext_state, PCA955xState, PCA955X_PIN_COUNT_MAX),
         VMSTATE_I2C_SLAVE(i2c, PCA955xState),
         VMSTATE_END_OF_LIST()
     }
@@ -358,6 +372,7 @@ static void pca9552_reset(DeviceState *dev)
     s->regs[PCA9552_LS2] = 0x55;
     s->regs[PCA9552_LS3] = 0x55;
 
+    memset(s->ext_state, PCA9552_PIN_HIZ, PCA955X_PIN_COUNT_MAX);
     pca955x_update_pin_input(s);
 
     s->pointer = 0xFF;
@@ -380,6 +395,26 @@ static void pca955x_initfn(Object *obj)
     }
 }
 
+static void pca955x_set_ext_state(PCA955xState *s, int pin, int level)
+{
+    if (s->ext_state[pin] != level) {
+        uint16_t pins_status = pca955x_pins_get_status(s);
+        s->ext_state[pin] = level;
+        pca955x_update_pin_input(s);
+        pca955x_display_pins_status(s, pins_status);
+    }
+}
+
+static void pca955x_gpio_in_handler(void *opaque, int pin, int level)
+{
+
+    PCA955xState *s = PCA955X(opaque);
+    PCA955xClass *k = PCA955X_GET_CLASS(s);
+
+    assert((pin >= 0) && (pin < k->pin_count));
+    pca955x_set_ext_state(s, pin, level);
+}
+
 static void pca955x_realize(DeviceState *dev, Error **errp)
 {
     PCA955xClass *k = PCA955X_GET_CLASS(dev);
@@ -389,7 +424,8 @@ static void pca955x_realize(DeviceState *dev, Error **errp)
         s->description = g_strdup("pca-unspecified");
     }
 
-    qdev_init_gpio_out(dev, s->gpio, k->pin_count);
+    qdev_init_gpio_out(dev, s->gpio_out, k->pin_count);
+    qdev_init_gpio_in(dev, pca955x_gpio_in_handler, k->pin_count);
 }
 
 static Property pca955x_properties[] = {
diff --git a/include/hw/misc/pca9552.h b/include/hw/misc/pca9552.h
index b6f4e264fe..c36525f0c3 100644
--- a/include/hw/misc/pca9552.h
+++ b/include/hw/misc/pca9552.h
@@ -30,7 +30,8 @@ struct PCA955xState {
     uint8_t pointer;
 
     uint8_t regs[PCA955X_NR_REGS];
-    qemu_irq gpio[PCA955X_PIN_COUNT_MAX];
+    qemu_irq gpio_out[PCA955X_PIN_COUNT_MAX];
+    uint8_t ext_state[PCA955X_PIN_COUNT_MAX];
     char *description; /* For debugging purpose only */
 };
 
-- 
2.31.1

