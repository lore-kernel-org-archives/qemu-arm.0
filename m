Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp338650lfo;
        Tue, 1 Mar 2022 17:57:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxr7MzcT8PigR7p6LakOaDh/meKQQclRbQJMmQEGxuKRuAK/adnBwNdH9FIskMw0q/R33wA
X-Received: by 2002:a25:bf90:0:b0:621:1a13:48f with SMTP id l16-20020a25bf90000000b006211a13048fmr26767787ybk.46.1646186252672;
        Tue, 01 Mar 2022 17:57:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646186252; cv=none;
        d=google.com; s=arc-20160816;
        b=KpkzlYnm70+2h2xEgJap6nGRPnsmO9JoD8QLS7i1cHniHp/K/n0ZTsHCjH+8hrqilr
         8QQ6hsDPmRKpGZm7S884UKiGZETjZ9sWUlfmw/2AobEdCDzqhUGgl8zT7oEqI3JJg3o/
         qe7w5xxPL7jp300fD8Frg+DC/J2J5k9kAcX7804yE/LjgLhMzKBhrMqAUc2gGBsXN1OH
         H9D5DHez8x5erutjKGF9QK0JnVIU6X2VHs82NDU3oNxpr8usZuLeBDJYqe6LEgfpWoGz
         PW5OtWGvnG7RX6QG/Ed8/vwlBQvvtkx7M7NRGFDVwU4u6IsfKR61NbDgxZfaDRhjODOL
         L4Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=iGy5AoMooNtuvyOeDJtUyYLQNLcqWDLIcHmLmUhSrng=;
        b=U/p3AXIzAvZ9acrRlnn9y0Qm7ACodfyAuCJFUIt3B4D3VFzX8faYfWeH5fElk44h/R
         2uOrfg1IS4nui0+zPgwPYnzhW2bkZo5nxckk5veQemroCRQagqXk7Hr6OXy2iAzzPgG1
         ttImVktH8m7HEO2G/iY0fu3e061mWOmE/xCmKh79lWh4hKe89Jb+eTHka/LQH5nukAwo
         ZFqA1smKILOriDXW2gmKoknTLuN62zvnbxyjWctJpAoa4UWRRpBjihyTv3mFTSf0Q6Bg
         5BGwWslIbHzRlz5migpE04cX3YmFbn7vyuNe8itYl99EoUz4D9AkYOwQC1NXudbE70Ir
         wK5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="emM/uglx";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h5-20020a812105000000b002dc022c4109si1754235ywh.312.2022.03.01.17.57.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Mar 2022 17:57:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="emM/uglx";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:50876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nPEF9-0007PW-Rh
	for alex.bennee@linaro.org; Tue, 01 Mar 2022 20:57:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3mc0eYgYKCsY5u5643s00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--titusr.bounces.google.com>)
 id 1nPEF4-0007Lh-OK
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 20:57:26 -0500
Received: from [2607:f8b0:4864:20::1049] (port=47020
 helo=mail-pj1-x1049.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3mc0eYgYKCsY5u5643s00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--titusr.bounces.google.com>)
 id 1nPEF2-00077t-Vl
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 20:57:26 -0500
Received: by mail-pj1-x1049.google.com with SMTP id
 m3-20020a17090a3f8300b001bd33af55f2so342681pjc.1
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 17:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=iGy5AoMooNtuvyOeDJtUyYLQNLcqWDLIcHmLmUhSrng=;
 b=emM/uglxYA8a1mQ4OM6kZupI/AnoPIzZpWwJTEQJzJVv1LXNolOhIEk+Sxikmo3ahJ
 MWNvMgk5El5OajGL3KzRwtQOFlRrfSZgaQmxSELxfbhWjFiZ/mbYB1DeTGCN8CoE6bGt
 zCpF12t3vLXh0JiQztIWntEV4nBSLEgKlxsJomCxaH4C39qF4KxHEz7L3SgZUeQjO+6k
 lstu8KVPM+kFX9ZtXvyxLgKjtqoJUEc5rlplkGex7xP9R/3c1br/bXxNAxGR5BTpgSBS
 zfZx+r+QQzbSEcZ44kqlTOv2uihPmMoojPDAJj8uRo3FSvNFdanbqcAZn8u210dycQlH
 m+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=iGy5AoMooNtuvyOeDJtUyYLQNLcqWDLIcHmLmUhSrng=;
 b=ZXxuwtw5iRmSUMmoZBfyrPoF/3brCmV/Si36UwCIN4/JSdNl/EAFehH4gYB3t5Y1Ol
 eO2hx6wXcEbnv/cG9ULMmOJBn05fbubLL21ewuE0Hc+FTnF/t45E9ywU0nzdsiF1v50g
 izA51fiWnJfrk93sQQrFCyb9dxXDZK8MLbQHcEe1aI7UGuLTg7/KZpXVuCHCEJUZ2rbn
 /dd7IQNHDOMepKermHP4BNCnliPTHszvuc3U/ss7mHNVIQIva2tUqO6lVeMkRFK0sIQ3
 MV12gAm8vFgCvmhF7135BjeUkLgBq9RIDcj7MoLq6WCMesvqGNiq3DVbfgQksw5+XbIN
 SP/A==
X-Gm-Message-State: AOAM5313zTMmynMy/wxD6QbDrUNHPvYgC3WoINEL9PqLgWax2QWcwGTg
 ruAnoDAQSPp9zSMpk9LfXnymuX1KlmM=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3a0a:5449:c096:dc84])
 (user=titusr job=sendgmr) by 2002:a63:1f42:0:b0:378:7fb4:6491 with SMTP id
 q2-20020a631f42000000b003787fb46491mr13665534pgm.478.1646185881975; Tue, 01
 Mar 2022 17:51:21 -0800 (PST)
Date: Tue,  1 Mar 2022 17:50:53 -0800
In-Reply-To: <20220302015053.1984165-1-titusr@google.com>
Message-Id: <20220302015053.1984165-10-titusr@google.com>
Mime-Version: 1.0
References: <20220302015053.1984165-1-titusr@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v3 9/9] hw/sensor: add Renesas raa228000 device
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 wuhaotsh@google.com, venture@google.com, peter.maydell@linaro.org, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1049
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3mc0eYgYKCsY5u5643s00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--titusr.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t3vJt5LLvsAA

Signed-off-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/sensor/isl_pmbus_vr.c         | 50 ++++++++++++++++++++
 include/hw/sensor/isl_pmbus_vr.h |  1 +
 tests/qtest/isl_pmbus_vr-test.c  | 78 ++++++++++++++++++++++++++++++--
 3 files changed, 126 insertions(+), 3 deletions(-)

diff --git a/hw/sensor/isl_pmbus_vr.c b/hw/sensor/isl_pmbus_vr.c
index e260faeac3..df7c003ea6 100644
--- a/hw/sensor/isl_pmbus_vr.c
+++ b/hw/sensor/isl_pmbus_vr.c
@@ -89,6 +89,24 @@ static void isl_pmbus_vr_exit_reset(Object *obj)
     }
 }
 
+/* The raa228000 uses different direct mode coefficents from most isl devices */
+static void raa228000_exit_reset(Object *obj)
+{
+    isl_pmbus_vr_exit_reset(obj);
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
 static void isl_pmbus_vr_add_props(Object *obj, uint64_t *flags, uint8_t pages)
 {
     PMBusDevice *pmdev = PMBUS_DEVICE(obj);
@@ -177,6 +195,20 @@ static void raa22xx_init(Object *obj)
     isl_pmbus_vr_add_props(obj, flags, 2);
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
+    isl_pmbus_vr_add_props(obj, flags, 1);
+}
+
 static void isl_pmbus_vr_class_init(ObjectClass *klass, void *data,
                                     uint8_t pages)
 {
@@ -195,6 +227,15 @@ static void isl69260_class_init(ObjectClass *klass, void *data)
     isl_pmbus_vr_class_init(klass, data, 2);
 }
 
+static void raa228000_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    dc->desc = "Renesas 228000 Digital Multiphase Voltage Regulator";
+    rc->phases.exit = raa228000_exit_reset;
+    isl_pmbus_vr_class_init(klass, data, 1);
+}
+
 static void raa229004_class_init(ObjectClass *klass, void *data)
 {
     ResettableClass *rc = RESETTABLE_CLASS(klass);
@@ -220,9 +261,18 @@ static const TypeInfo raa229004_info = {
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
 static void isl_pmbus_vr_register_types(void)
 {
     type_register_static(&isl69260_info);
+    type_register_static(&raa228000_info);
     type_register_static(&raa229004_info);
 }
 
diff --git a/include/hw/sensor/isl_pmbus_vr.h b/include/hw/sensor/isl_pmbus_vr.h
index 233916f70a..3e47ff7e48 100644
--- a/include/hw/sensor/isl_pmbus_vr.h
+++ b/include/hw/sensor/isl_pmbus_vr.h
@@ -13,6 +13,7 @@
 #include "qom/object.h"
 
 #define TYPE_ISL69260   "isl69260"
+#define TYPE_RAA228000  "raa228000"
 #define TYPE_RAA229004  "raa229004"
 
 struct ISLState {
diff --git a/tests/qtest/isl_pmbus_vr-test.c b/tests/qtest/isl_pmbus_vr-test.c
index a33dfb6135..5553ea410a 100644
--- a/tests/qtest/isl_pmbus_vr-test.c
+++ b/tests/qtest/isl_pmbus_vr-test.c
@@ -150,6 +150,70 @@ static void test_defaults(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_cmphex(i2c_value, ==, ISL_REVISION_DEFAULT);
 }
 
+static void raa228000_test_defaults(void *obj, void *data,
+                                    QGuestAllocator *alloc)
+{
+    uint16_t value, i2c_value;
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    value = qmp_isl_pmbus_vr_get(TEST_ID, "vout[0]");
+    g_assert_cmpuint(value, ==, 0);
+
+    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_IOUT);
+    g_assert_cmpuint(i2c_value, ==, 0);
+
+    value = qmp_isl_pmbus_vr_get(TEST_ID, "pout[0]");
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
+    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_COMMAND);
+    g_assert_cmphex(i2c_value, ==, ISL_VOUT_COMMAND_DEFAULT);
+
+    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_MAX);
+    g_assert_cmphex(i2c_value, ==, ISL_VOUT_MAX_DEFAULT);
+
+    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_MARGIN_HIGH);
+    g_assert_cmphex(i2c_value, ==, ISL_VOUT_MARGIN_HIGH_DEFAULT);
+
+    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_MARGIN_LOW);
+    g_assert_cmphex(i2c_value, ==, ISL_VOUT_MARGIN_LOW_DEFAULT);
+
+    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_TRANSITION_RATE);
+    g_assert_cmphex(i2c_value, ==, ISL_VOUT_TRANSITION_RATE_DEFAULT);
+
+    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_OV_FAULT_LIMIT);
+    g_assert_cmphex(i2c_value, ==, ISL_VOUT_OV_FAULT_LIMIT_DEFAULT);
+
+    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_OT_FAULT_LIMIT);
+    g_assert_cmphex(i2c_value, ==, ISL_OT_FAULT_LIMIT_DEFAULT);
+
+    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_OT_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, ==, ISL_OT_WARN_LIMIT_DEFAULT);
+
+    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VIN_OV_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, ==, ISL_VIN_OV_WARN_LIMIT_DEFAULT);
+
+    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VIN_UV_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, ==, ISL_VIN_UV_WARN_LIMIT_DEFAULT);
+
+    i2c_value = isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_IIN_OC_FAULT_LIMIT);
+    g_assert_cmphex(i2c_value, ==, ISL_IIN_OC_FAULT_LIMIT_DEFAULT);
+
+    i2c_value = i2c_get8(i2cdev, PMBUS_REVISION);
+    g_assert_cmphex(i2c_value, ==, ISL_REVISION_DEFAULT);
+}
+
 /* test qmp access */
 static void test_tx_rx(void *obj, void *data, QGuestAllocator *alloc)
 {
@@ -384,9 +448,6 @@ static void isl_pmbus_vr_register_nodes(void)
     qos_node_create_driver("isl69260", i2c_device_create);
     qos_node_consumes("isl69260", "i2c-bus", &opts);
 
-    qos_node_create_driver("raa229004", i2c_device_create);
-    qos_node_consumes("raa229004", "i2c-bus", &opts);
-
     qos_add_test("test_defaults", "isl69260", test_defaults, NULL);
     qos_add_test("test_tx_rx", "isl69260", test_tx_rx, NULL);
     qos_add_test("test_rw_regs", "isl69260", test_rw_regs, NULL);
@@ -394,9 +455,20 @@ static void isl_pmbus_vr_register_nodes(void)
     qos_add_test("test_ro_regs", "isl69260", test_ro_regs, NULL);
     qos_add_test("test_ov_faults", "isl69260", test_voltage_faults, NULL);
 
+    qos_node_create_driver("raa229004", i2c_device_create);
+    qos_node_consumes("raa229004", "i2c-bus", &opts);
+
     qos_add_test("test_tx_rx", "raa229004", test_tx_rx, NULL);
     qos_add_test("test_rw_regs", "raa229004", test_rw_regs, NULL);
     qos_add_test("test_pages_rw", "raa229004", test_pages_rw, NULL);
     qos_add_test("test_ov_faults", "raa229004", test_voltage_faults, NULL);
+
+    qos_node_create_driver("raa228000", i2c_device_create);
+    qos_node_consumes("raa228000", "i2c-bus", &opts);
+
+    qos_add_test("test_defaults", "raa228000", raa228000_test_defaults, NULL);
+    qos_add_test("test_tx_rx", "raa228000", test_tx_rx, NULL);
+    qos_add_test("test_rw_regs", "raa228000", test_rw_regs, NULL);
+    qos_add_test("test_ov_faults", "raa228000", test_voltage_faults, NULL);
 }
 libqos_init(isl_pmbus_vr_register_nodes);
-- 
2.35.1.616.g0bdcbb4464-goog

