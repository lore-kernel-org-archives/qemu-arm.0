Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp79807ejb;
        Wed, 8 Feb 2023 14:44:35 -0800 (PST)
X-Google-Smtp-Source: AK7set+RCE+o8v8TZ7nM/JBo5ddRnp+3Aufj3Cz39tmMq5t5EPB7CwdA8LIDFsXrV5I/EA0drazN
X-Received: by 2002:a5d:66ce:0:b0:2bc:aa67:28fb with SMTP id k14-20020a5d66ce000000b002bcaa6728fbmr8716358wrw.49.1675896275245;
        Wed, 08 Feb 2023 14:44:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675896275; cv=none;
        d=google.com; s=arc-20160816;
        b=XedoB4s1hIpC/Q4ZdWqvaLWDyKAVj28x/SL/V4gChHxM14AIRoWA2PvIFR+fOBKM/P
         PGN8iHjJ4/3Xau4jxnR3/gBR+FjZAlGeJw4ZFCgPxgp3aObZrf9QT7Ek5DHXjPaf5w5m
         NAmQjFtQDEyLVpfxyd6zp2low43rFRAckr+ZvzxvUOJf7BBw93YLNYThOQMsPacQOg6i
         T+HCEIB5DJcT/BSYR/1Pj1oNjydA5nKMg2CTSVMCT4U8LqgJca8si+bRyrs6EiaYLEfR
         ozjlpcQVafYU6636L4FaYmcu0358jQNph7k8ziTBnr0P3Xp/6ka942p/YlPjJGXJ4Cql
         hcpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=HJtdqo5x3Q9Dj2SEUEmvGH+Sb78En/Ae2vGc0nZMPY4=;
        b=VjXrMYWJe3LfsEu8Gaw6vXweIMGoVml91gj1A/OTBHezhQRiUay5YAMXw8hycbc6Jx
         Co+U1wJV0/al5P0+g1ZnXT1mXjqJpXYZDkFdMdobyVMgRWkOxUe6niBadrPkK16TKS7r
         B3/5WLzYGM0vbOPxijcZ42KJYewJcUQg6WHqGQu2kSfR+eBytVvVg1abSmn1aW5dOyIl
         iV+wMNQQJ3LtoRY2fxSrbsouozf0WOMwxAosnjiqVhd1WCS6PzSRpIQ2lX2xjEz4vTxb
         0M87Q5bivCSNIstihU6VV37YnQ7kPW16tHRQYdyZYtJ0AU6iekm3hmLPCKerof3LPvBN
         bh9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="Vi/HZPMh";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l15-20020adff48f000000b002c3bb76ba81si18317753wro.351.2023.02.08.14.44.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Feb 2023 14:44:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="Vi/HZPMh";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPtAV-0008Qz-MM; Wed, 08 Feb 2023 17:43:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3qyXkYwYKCKwfUfgedSaaSXQ.OaYcQYg-MdYZaZSZg.adS@flex--titusr.bounces.google.com>)
 id 1pPtAU-0008QJ-BU
 for qemu-arm@nongnu.org; Wed, 08 Feb 2023 17:43:58 -0500
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3qyXkYwYKCKwfUfgedSaaSXQ.OaYcQYg-MdYZaZSZg.adS@flex--titusr.bounces.google.com>)
 id 1pPtAS-0002fg-Ix
 for qemu-arm@nongnu.org; Wed, 08 Feb 2023 17:43:58 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 200-20020a2505d1000000b0088347752c5fso137746ybf.18
 for <qemu-arm@nongnu.org>; Wed, 08 Feb 2023 14:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=HJtdqo5x3Q9Dj2SEUEmvGH+Sb78En/Ae2vGc0nZMPY4=;
 b=Vi/HZPMhPjP6z5CuNPTXCOEeSE6HwpjCUeUMf10LX/hIrpSiyVOufZwzVqlN+1G6JV
 Mb9DjjHjMFRbzac/5AjeFih2wu1ZRhdbAzK26o6FVe7b+PGwomKuIu6SrB+QxVolYkif
 HtpMNMpow1P4ApyXLWMJV6y9QCs30E0fLyB1+4Pdv7IMRyLad43Awth9toV6ExCtBztk
 /uouO0Fgp4mhxEzrozP20hw1jmC4o8P+BTawBJyDvb/iQGZUNZrMlpGDntIEsR/bviYd
 qXQjUMfr/rsRMLHZIrCWtl61KUJ9aiQRVAAG22k8a2G110oTsiyjs4/wAPkZz7YliljD
 bgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HJtdqo5x3Q9Dj2SEUEmvGH+Sb78En/Ae2vGc0nZMPY4=;
 b=WztTqYPkmq+eLuBn+tI2wIdvXPScWv7/HHJVvoeiIGLuSsRE0w4wygQbZh1C1ODxqQ
 7hRjla2Tq6fDRWCMWjUdlh6FUnKmrKTTvnrTJwwtEj+tl2Qt62Py9iExWpG3LJ9bpjvr
 ERbKy5tgnwwWe+FddWkOwas1Apu3KDvj48cjAl5GbSMneK/1CKOP/F9SXeFAE2I9OIQp
 W4SSd5DMzHSflWANEsoqyhMPR3Sm5SrIzNuHvw4T4SzPUIE/8JCWrOSAQSfSuqEP2zgb
 WMuHP9mrPH7gkHsUni4y3Mth82PB+aVSqxHdvGUoguTYFQbf//81TbZQoS0oc6QSFUml
 K+4w==
X-Gm-Message-State: AO0yUKWTgs7OgwIwpYF+rCE4lk2lBNmB4BhkHmvf/yXe4Q8/7uY6Eb+0
 DGYd3XocyMVqY/UhQRN/rDZ0ERjh1fg=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a5b:610:0:b0:8bb:87b6:f253 with SMTP id
 d16-20020a5b0610000000b008bb87b6f253mr834567ybq.499.1675896235525; Wed, 08
 Feb 2023 14:43:55 -0800 (PST)
Date: Wed,  8 Feb 2023 22:43:37 +0000
In-Reply-To: <20230208224339.270589-1-titusr@google.com>
Mime-Version: 1.0
References: <20230208224339.270589-1-titusr@google.com>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230208224339.270589-3-titusr@google.com>
Subject: [PATCH v2 2/4] hw/gpio: add PCA9538 8-bit GPIO expander
From: Titus Rwantare <titusr@google.com>
To: philmd@linaro.org, minyard@acm.org, eddie.dong@intel.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, joel@jms.id.au, 
 Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3qyXkYwYKCKwfUfgedSaaSXQ.OaYcQYg-MdYZaZSZg.adS@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: C5eLvo0nXjOE

  The 8-bit expander has different register offsets than the 16-bit one,
  making them incompatible.

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/gpio/pca_i2c_gpio.c         | 94 ++++++++++++++++++++++++++++++++++
 include/hw/gpio/pca_i2c_gpio.h |  7 +++
 2 files changed, 101 insertions(+)

diff --git a/hw/gpio/pca_i2c_gpio.c b/hw/gpio/pca_i2c_gpio.c
index 434a759453..fa69523556 100644
--- a/hw/gpio/pca_i2c_gpio.c
+++ b/hw/gpio/pca_i2c_gpio.c
@@ -143,6 +143,41 @@ static uint8_t pca6416_recv(I2CSlave *i2c)
     return data;
 }
 
+/* slave to master */
+static uint8_t pca9538_recv(I2CSlave *i2c)
+{
+    PCAGPIOState *ps = PCA_I2C_GPIO(i2c);
+    uint8_t data;
+
+    switch (ps->command) {
+    case PCA9538_INPUT_PORT:
+        data = ps->curr_input;
+        break;
+
+    case PCA9538_OUTPUT_PORT:
+        data = ps->new_output;
+        break;
+
+    case PCA9538_POLARITY_INVERSION_PORT:
+        data = ps->polarity_inv;
+        break;
+
+    case PCA9538_CONFIGURATION_PORT:
+        data = ps->config;
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: reading from unsupported register 0x%02x",
+                      __func__, ps->command);
+        data = 0xFF;
+        break;
+    }
+
+    trace_pca_i2c_recv(DEVICE(ps)->canonical_path, ps->command, data);
+    return data;
+}
+
 /* master to slave */
 static int pca6416_send(I2CSlave *i2c, uint8_t data)
 {
@@ -203,6 +238,47 @@ static int pca6416_send(I2CSlave *i2c, uint8_t data)
     return 0;
 }
 
+/* master to slave */
+static int pca9538_send(I2CSlave *i2c, uint8_t data)
+{
+    PCAGPIOState *ps = PCA_I2C_GPIO(i2c);
+    if (ps->i2c_cmd) {
+        ps->command = data;
+        ps->i2c_cmd = false;
+        return 0;
+    }
+
+    trace_pca_i2c_send(DEVICE(ps)->canonical_path, ps->command, data);
+
+    switch (ps->command) {
+    case PCA9538_INPUT_PORT:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: writing to read only reg: 0x%02x",
+                      __func__, ps->command);
+        break;
+    case PCA9538_OUTPUT_PORT:
+        ps->new_output = data;
+        break;
+
+    case PCA9538_POLARITY_INVERSION_PORT:
+        ps->polarity_inv = data;
+        break;
+
+    case PCA9538_CONFIGURATION_PORT:
+        ps->config = data;
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: writing to unsupported register\n",
+                      __func__);
+        return -1;
+    }
+
+    pca_i2c_update_irqs(ps);
+
+    return 0;
+}
+
 static int pca_i2c_event(I2CSlave *i2c, enum i2c_event event)
 {
     PCAGPIOState *ps = PCA_I2C_GPIO(i2c);
@@ -337,6 +413,19 @@ static void pca6416_gpio_class_init(ObjectClass *klass, void *data)
     k->send = pca6416_send;
 }
 
+static void pca9538_gpio_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
+    PCAGPIOClass *pc = PCA_I2C_GPIO_CLASS(klass);
+
+    dc->desc = "PCA9538 8-bit I/O expander";
+    pc->num_pins = PCA9538_NUM_PINS;
+
+    k->recv = pca9538_recv;
+    k->send = pca9538_send;
+}
+
 static void pca_i2c_gpio_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -383,6 +472,11 @@ static const TypeInfo pca_gpio_types[] = {
     .parent = TYPE_PCA_I2C_GPIO,
     .class_init = pca6416_gpio_class_init,
     },
+    {
+    .name = TYPE_PCA9538_GPIO,
+    .parent = TYPE_PCA_I2C_GPIO,
+    .class_init = pca9538_gpio_class_init,
+    },
 };
 
 DEFINE_TYPES(pca_gpio_types);
diff --git a/include/hw/gpio/pca_i2c_gpio.h b/include/hw/gpio/pca_i2c_gpio.h
index 99322959e1..3ab7d19a97 100644
--- a/include/hw/gpio/pca_i2c_gpio.h
+++ b/include/hw/gpio/pca_i2c_gpio.h
@@ -19,6 +19,7 @@
 
 #define PCA_I2C_MAX_PINS                     16
 #define PCA6416_NUM_PINS                     16
+#define PCA9538_NUM_PINS                     8
 
 typedef struct PCAGPIOClass {
     I2CSlaveClass parent;
@@ -62,8 +63,14 @@ OBJECT_DECLARE_TYPE(PCAGPIOState, PCAGPIOClass, PCA_I2C_GPIO)
 #define PCA6416_CONFIGURATION_PORT_0         0x06 /* read/write */
 #define PCA6416_CONFIGURATION_PORT_1         0x07 /* read/write */
 
+#define PCA9538_INPUT_PORT                   0x00 /* read */
+#define PCA9538_OUTPUT_PORT                  0x01 /* read/write */
+#define PCA9538_POLARITY_INVERSION_PORT      0x02 /* read/write */
+#define PCA9538_CONFIGURATION_PORT           0x03 /* read/write */
+
 #define PCA_I2C_CONFIG_DEFAULT               0
 
 #define TYPE_PCA6416_GPIO "pca6416"
+#define TYPE_PCA9538_GPIO "pca9538"
 
 #endif
-- 
2.39.1.581.gbfd45094c4-goog

