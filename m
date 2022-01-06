Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp1349953lfb;
        Thu, 6 Jan 2022 15:16:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzs8CS3k2kgLItYPyrj8d4bLgXHlZQZYZ+ApsUKX7xl5kBO+M8CKH2WilXWzO1wctiQt+s6
X-Received: by 2002:a25:d20a:: with SMTP id j10mr65023904ybg.517.1641510977681;
        Thu, 06 Jan 2022 15:16:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641510977; cv=none;
        d=google.com; s=arc-20160816;
        b=0YT1pHwrRzc8ekGTl2DOWh4t4PW2Z6IDMZulmB7FUQyHlC/GYVFLrdh1/ank25W7Jg
         1ljDvBybh3uZkzGrllYyx9SyCvaf9kIYrGQnfjnjhAmCAnU//hyiLbwUQbWrm9L7whlE
         KuHo8taBwZKu3k/8NTH+cQBRcIrUTkTzxByxsBSmg8ykY5+rdbrbR0Nvkil5JCglg9T7
         MGrjwvIVe+RSxgKNJ1HoZqU1F1WagZlC5uX5rOEAKN8pBtcB5cHaGAQXPoh88Rc6FnL7
         COhihXqKLbka8GNp0u+ZdV6/lF9mgL+z7J2DGJBoC32DYAWX/t0Ye2a/JXeptnDRIYXn
         Vtag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=nYWFZm+kcWsf7aAygcl1/A/lTC91XhdZMvgXx7BO+Yc=;
        b=ohq7M6zrwY7uP81L2m1Ek+0LJpGsoKLpNJMWuLO3atXNhReF8KXoc+gKWt8jS1tE8V
         Ht1UyyuNsZ2t6Nl8F+aU6FZzGWxtM3X6g/Q0AFN6sQmrqv/iEhnjr1Qz50fiCEMTrk3K
         8/DKHcyp0sGMQH2+ueH1gt7MHHWieAsye3mmW7g3wwFSqt+FCZ5MBi2NlsYuVEViD2+x
         POAsFxrt7TREY4iPcJkor5+LZD1mfV7/k0M1vR2xLRwQYKr0RY3lLqbGVyQnhCV/rY4q
         e4syNsGVqcaL0N4yd6aeAU1EIGdzxBEFTUafI6yMj0iY5wWBSqg8YbS2aE2YMdM2QgXo
         35YQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=mtB5ASu1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x61si2659586ybh.290.2022.01.06.15.16.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jan 2022 15:16:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=mtB5ASu1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:39632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n5bzV-0001f9-2I
	for alex.bennee@linaro.org; Thu, 06 Jan 2022 18:16:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3xHbXYQYKCCUUJUVTSHPPHMF.DPNRFNV-BSNOPOHOV.PSH@flex--titusr.bounces.google.com>)
 id 1n5bz4-0001dI-NT
 for qemu-arm@nongnu.org; Thu, 06 Jan 2022 18:15:51 -0500
Received: from [2607:f8b0:4864:20::84a] (port=53861
 helo=mail-qt1-x84a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3xHbXYQYKCCUUJUVTSHPPHMF.DPNRFNV-BSNOPOHOV.PSH@flex--titusr.bounces.google.com>)
 id 1n5bz2-00062P-Od
 for qemu-arm@nongnu.org; Thu, 06 Jan 2022 18:15:50 -0500
Received: by mail-qt1-x84a.google.com with SMTP id
 g16-20020ac85810000000b002b212f2662aso3221447qtg.20
 for <qemu-arm@nongnu.org>; Thu, 06 Jan 2022 15:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=nYWFZm+kcWsf7aAygcl1/A/lTC91XhdZMvgXx7BO+Yc=;
 b=mtB5ASu1153XMnbafuD8FGOMiS1F996/yI3Rl1kjkKKtyAymKYPwYDoF+Uj6ZjHnpM
 lgKqsHumFgjGmM9Jk3vAVvdIYA1r5QTN5R8w5iTcLXNl17q82aRRxuERlzaJOugRoFaM
 WmNasnsBg4OvxDa983xfevl4HKZ9i6+wBC+4hRJDRDMU6wpqT0Ij9IHbjx4He/DDT1UQ
 gzaYz1CsQEhMIQsVR9hYDtGZKKBnvRLVy05GU6L7B9iSzgo788wvryV5IvxH0QwiYPLp
 Z4PKnIx/LmUKKtNWzcVfQOIDjFok1oXQYHl4iCGEuC7eMConfUzGzg3MNBemK+qjyOQw
 8Wkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=nYWFZm+kcWsf7aAygcl1/A/lTC91XhdZMvgXx7BO+Yc=;
 b=ljGD3BX/n3CG86XW+IVHBKh+V+X5yUz9UslWYGWpMyK2yD24GUFT8ilkek3+/GpuOL
 nIdOTEeR2jSvt8zU0NW0WmzQQFEadOlwHaMvl4U5wgKqMfOxxRXdGZDCmicjmPqOTYDs
 MfE7+0pIzu+uOtuO5yIHYPZdyTPEQ9wFjMbmgnm3u/6PI7XSJsQtiO2pinSjqWOOkoXl
 Q33EOHuwLRhYNJJwHUzMkYqCi2suV7Jd1H0jBSLncJrqvnhUzC79sni7JoymWn3OYQIf
 AVO2cqVBu4JHLXvh9xzOiDt2S2Eh6mTjlUoc7ZY7vwrU8wP8DZFOfPdWJEvaAyLRlBsZ
 x9Zg==
X-Gm-Message-State: AOAM532dHBEkN51B7cC1JAHnXVdyrfjzx1nCau/VfwtPQNUdihi15KbF
 5SsCnSxQwQeg6wBNYI58HnllVahxudo=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a05:622a:1713:: with SMTP id
 h19mr54424729qtk.464.1641510596557; Thu, 06 Jan 2022 15:09:56 -0800 (PST)
Date: Thu,  6 Jan 2022 23:09:36 +0000
In-Reply-To: <20220106230936.417020-1-titusr@google.com>
Message-Id: <20220106230936.417020-6-titusr@google.com>
Mime-Version: 1.0
References: <20220106230936.417020-1-titusr@google.com>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
Subject: [PATCH 5/5] hw/misc: add Renesas raa228000 device
From: Titus Rwantare <titusr@google.com>
To: f4bug@amsat.org, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com, 
 Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::84a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::84a;
 envelope-from=3xHbXYQYKCCUUJUVTSHPPHMF.DPNRFNV-BSNOPOHOV.PSH@flex--titusr.bounces.google.com;
 helo=mail-qt1-x84a.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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
X-TUID: +DLvXHfazjX9

Signed-off-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/sensor/isl_pmbus.c         | 50 ++++++++++++++++++++++
 include/hw/sensor/isl_pmbus.h |  1 +
 tests/qtest/isl_pmbus-test.c  | 78 +++++++++++++++++++++++++++++++++--
 3 files changed, 126 insertions(+), 3 deletions(-)

diff --git a/hw/sensor/isl_pmbus.c b/hw/sensor/isl_pmbus.c
index 4ff848f663..e3b42b119e 100644
--- a/hw/sensor/isl_pmbus.c
+++ b/hw/sensor/isl_pmbus.c
@@ -89,6 +89,24 @@ static void isl_pmbus_exit_reset(Object *obj)
     }
 }
 
+/* The raa228000 uses different direct mode coefficents from most isl devices */
+static void raa228000_exit_reset(Object *obj)
+{
+    isl_pmbus_exit_reset(obj);
+
+    PMBusDevice *pmdev = PMBUS_DEVICE(obj);
+
+    pmdev->pages[0].read_vout = 0;
+    pmdev->pages[0].read_iout = 0;
+    pmdev->pages[0].read_pout = 0;
+    pmdev->pages[0].read_vin = 0;
+    pmdev->pages[0].read_iin = 0;
+    pmdev->pages[0].read_pin = 0;
+    pmdev->pages[0].read_temperature_1 = 0;
+    pmdev->pages[0].read_temperature_2 = 0;
+    pmdev->pages[0].read_temperature_3 = 0;
+}
+
 static void isl_pmbus_add_props(Object *obj, uint64_t *flags, uint8_t pages)
 {
     PMBusDevice *pmdev = PMBUS_DEVICE(obj);
@@ -177,6 +195,20 @@ static void raa22xx_init(Object *obj)
     isl_pmbus_add_props(obj, flags, 2);
 }
 
+static void raa228000_init(Object *obj)
+{
+    PMBusDevice *pmdev = PMBUS_DEVICE(obj);
+    uint64_t flags[1];
+
+    flags[0] = PB_HAS_VIN | PB_HAS_VOUT | PB_HAS_VOUT_MODE |
+               PB_HAS_VOUT_RATING | PB_HAS_VOUT_MARGIN | PB_HAS_IIN |
+               PB_HAS_IOUT | PB_HAS_PIN | PB_HAS_POUT | PB_HAS_TEMPERATURE |
+               PB_HAS_TEMP2 | PB_HAS_TEMP3 | PB_HAS_STATUS_MFR_SPECIFIC;
+
+    pmbus_page_config(pmdev, 0, flags[0]);
+    isl_pmbus_add_props(obj, flags, 1);
+}
+
 static void isl_pmbus_class_init(ObjectClass *klass, void *data, uint8_t pages)
 {
     PMBusDeviceClass *k = PMBUS_DEVICE_CLASS(klass);
@@ -194,6 +226,15 @@ static void isl69260_class_init(ObjectClass *klass, void *data)
     isl_pmbus_class_init(klass, data, 2);
 }
 
+static void raa228000_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    dc->desc = "Renesas 228000 Digital Multiphase Voltage Regulator";
+    rc->phases.exit = raa228000_exit_reset;
+    isl_pmbus_class_init(klass, data, 1);
+}
+
 static void raa229004_class_init(ObjectClass *klass, void *data)
 {
     ResettableClass *rc = RESETTABLE_CLASS(klass);
@@ -219,9 +260,18 @@ static const TypeInfo raa229004_info = {
     .class_init = raa229004_class_init,
 };
 
+static const TypeInfo raa228000_info = {
+    .name = TYPE_RAA228000,
+    .parent = TYPE_PMBUS_DEVICE,
+    .instance_size = sizeof(ISLState),
+    .instance_init = raa228000_init,
+    .class_init = raa228000_class_init,
+};
+
 static void isl_pmbus_register_types(void)
 {
     type_register_static(&isl69260_info);
+    type_register_static(&raa228000_info);
     type_register_static(&raa229004_info);
 }
 
diff --git a/include/hw/sensor/isl_pmbus.h b/include/hw/sensor/isl_pmbus.h
index a947fd3903..7ead1dc4a2 100644
--- a/include/hw/sensor/isl_pmbus.h
+++ b/include/hw/sensor/isl_pmbus.h
@@ -13,6 +13,7 @@
 #include "qom/object.h"
 
 #define TYPE_ISL69260   "isl69260"
+#define TYPE_RAA228000  "raa228000"
 #define TYPE_RAA229004  "raa229004"
 
 struct ISLState {
diff --git a/tests/qtest/isl_pmbus-test.c b/tests/qtest/isl_pmbus-test.c
index 5bdc247428..3b5fb2208d 100644
--- a/tests/qtest/isl_pmbus-test.c
+++ b/tests/qtest/isl_pmbus-test.c
@@ -149,6 +149,70 @@ static void test_defaults(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_cmphex(i2c_value, ==, ISL_REVISION_DEFAULT);
 }
 
+static void raa228000_test_defaults(void *obj, void *data,
+                                    QGuestAllocator *alloc)
+{
+    uint16_t value, i2c_value;
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    value = qmp_isl_pmbus_get(TEST_ID, "vout[0]");
+    g_assert_cmpuint(value, ==, 0);
+
+    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_READ_IOUT);
+    g_assert_cmpuint(i2c_value, ==, 0);
+
+    value = qmp_isl_pmbus_get(TEST_ID, "pout[0]");
+    g_assert_cmpuint(value, ==, 0);
+
+    i2c_value = i2c_get8(i2cdev, PMBUS_CAPABILITY);
+    g_assert_cmphex(i2c_value, ==, ISL_CAPABILITY_DEFAULT);
+
+    i2c_value = i2c_get8(i2cdev, PMBUS_OPERATION);
+    g_assert_cmphex(i2c_value, ==, ISL_OPERATION_DEFAULT);
+
+    i2c_value = i2c_get8(i2cdev, PMBUS_ON_OFF_CONFIG);
+    g_assert_cmphex(i2c_value, ==, ISL_ON_OFF_CONFIG_DEFAULT);
+
+    i2c_value = i2c_get8(i2cdev, PMBUS_VOUT_MODE);
+    g_assert_cmphex(i2c_value, ==, ISL_VOUT_MODE_DEFAULT);
+
+    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VOUT_COMMAND);
+    g_assert_cmphex(i2c_value, ==, ISL_VOUT_COMMAND_DEFAULT);
+
+    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VOUT_MAX);
+    g_assert_cmphex(i2c_value, ==, ISL_VOUT_MAX_DEFAULT);
+
+    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VOUT_MARGIN_HIGH);
+    g_assert_cmphex(i2c_value, ==, ISL_VOUT_MARGIN_HIGH_DEFAULT);
+
+    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VOUT_MARGIN_LOW);
+    g_assert_cmphex(i2c_value, ==, ISL_VOUT_MARGIN_LOW_DEFAULT);
+
+    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VOUT_TRANSITION_RATE);
+    g_assert_cmphex(i2c_value, ==, ISL_VOUT_TRANSITION_RATE_DEFAULT);
+
+    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VOUT_OV_FAULT_LIMIT);
+    g_assert_cmphex(i2c_value, ==, ISL_VOUT_OV_FAULT_LIMIT_DEFAULT);
+
+    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_OT_FAULT_LIMIT);
+    g_assert_cmphex(i2c_value, ==, ISL_OT_FAULT_LIMIT_DEFAULT);
+
+    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_OT_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, ==, ISL_OT_WARN_LIMIT_DEFAULT);
+
+    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VIN_OV_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, ==, ISL_VIN_OV_WARN_LIMIT_DEFAULT);
+
+    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_VIN_UV_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, ==, ISL_VIN_UV_WARN_LIMIT_DEFAULT);
+
+    i2c_value = isl_pmbus_i2c_get16(i2cdev, PMBUS_IIN_OC_FAULT_LIMIT);
+    g_assert_cmphex(i2c_value, ==, ISL_IIN_OC_FAULT_LIMIT_DEFAULT);
+
+    i2c_value = i2c_get8(i2cdev, PMBUS_REVISION);
+    g_assert_cmphex(i2c_value, ==, ISL_REVISION_DEFAULT);
+}
+
 /* test qmp access */
 static void test_tx_rx(void *obj, void *data, QGuestAllocator *alloc)
 {
@@ -372,17 +436,25 @@ static void isl_pmbus_register_nodes(void)
     qos_node_create_driver("isl69260", i2c_device_create);
     qos_node_consumes("isl69260", "i2c-bus", &opts);
 
-    qos_node_create_driver("raa229004", i2c_device_create);
-    qos_node_consumes("raa229004", "i2c-bus", &opts);
-
     qos_add_test("test_defaults", "isl69260", test_defaults, NULL);
     qos_add_test("test_tx_rx", "isl69260", test_tx_rx, NULL);
     qos_add_test("test_rw_regs", "isl69260", test_rw_regs, NULL);
     qos_add_test("test_ro_regs", "isl69260", test_ro_regs, NULL);
     qos_add_test("test_ov_faults", "isl69260", test_voltage_faults, NULL);
 
+    qos_node_create_driver("raa229004", i2c_device_create);
+    qos_node_consumes("raa229004", "i2c-bus", &opts);
+
     qos_add_test("test_tx_rx", "raa229004", test_tx_rx, NULL);
     qos_add_test("test_rw_regs", "raa229004", test_rw_regs, NULL);
     qos_add_test("test_ov_faults", "raa229004", test_voltage_faults, NULL);
+
+    qos_node_create_driver("raa22800", i2c_device_create);
+    qos_node_consumes("raa22800", "i2c-bus", &opts);
+
+    qos_add_test("test_defaults", "raa22800", raa228000_test_defaults, NULL);
+    qos_add_test("test_tx_rx", "raa22800", test_tx_rx, NULL);
+    qos_add_test("test_rw_regs", "raa22800", test_rw_regs, NULL);
+    qos_add_test("test_ov_faults", "raa22800", test_voltage_faults, NULL);
 }
 libqos_init(isl_pmbus_register_nodes);
-- 
2.34.1.448.ga2b2bfdf31-goog

