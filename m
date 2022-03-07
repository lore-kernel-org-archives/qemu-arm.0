Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1766903lfo;
        Mon, 7 Mar 2022 12:11:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxu6I5UAXHliFD9d32sOOPVe+csNA93FpsqxSqTRAcwTGhi63IX3X098wJ2xdfYSmT3/Nw1
X-Received: by 2002:a81:6a02:0:b0:2dc:2e6d:6c31 with SMTP id f2-20020a816a02000000b002dc2e6d6c31mr9870833ywc.221.1646683879279;
        Mon, 07 Mar 2022 12:11:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646683879; cv=none;
        d=google.com; s=arc-20160816;
        b=PwIbC9cww/YuTtERzvvR4elt987JHpJOqjGeO8lnUbTvxponCZ5xZvPGarTb3wyOz1
         Or+1fwg9JzFJMEeTko8/bXrd45IAC1n2Yykh9cUUAdPWrX1R/Jkw66Vy6E8C9+y1CEso
         /LdfZ+rxjErKIMAZHzrVzOepktV3UnrxWtRJB4lKqsDEeVGh5D0Hj5n2GPQhFq92UDv2
         GRc85QSy4JEJQVp3I7kG6dnWMFZUiU0k8qjsoys3KSBihkKybz3YPZnPq/WSyZ14oIn0
         5oaJZSs3GQwdlRNzJEkrDMirjKfgFcJ7c9hS6lMb6iBqqB1PcDF5x7a+yEUPlXEDGHkP
         KFgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :from:subject:references:mime-version:message-id:in-reply-to:date
         :dkim-signature;
        bh=NI9wq2DideEAjgeOyBrnujlyjn4IddOI7Xe9VuBweBw=;
        b=jjDNIfaUuy124ECy+TU3zM7hD3nBVnFT0sgAgmxX1q1KYboupdyYWrIplVEZA/iy/m
         h7AjBTChNnRsRAKQE8reV4mVUIPGXN/XHzvBw6CUDelxZSK1DDqDkpoLD6XoPAumw1tb
         ahvpVb/B2MlGr3RZ2l4lXoTyWWW0IgnG8uyum+PatjQu3NN1ymp5Tpt3Ra+iAMZOVONf
         A2YfC6KrlaUt8E5p8KKhx0dZDXcheTPmezH4vjGJQ+ywoEi4JtZlAwfwXZvCabHXAPf5
         a/4vjJkUZiN6K9bkdZ2UPR5QhPrSoKzmqJiRJm9f8EN+XW1GrvUs2EbNBHKesUAWsHOK
         L6/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=RQIzzO8i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e185-20020a0dc2c2000000b002d6e13d55e4si10573395ywd.207.2022.03.07.12.11.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Mar 2022 12:11:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=RQIzzO8i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:45604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRJhO-0004hm-Mq
	for alex.bennee@linaro.org; Mon, 07 Mar 2022 15:11:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <36mUmYgYKCGcYNYZXWLTTLQJ.HTRVJRZ-FWRSTSLSZ.TWL@flex--titusr.bounces.google.com>)
 id 1nRJdO-0007e9-4b
 for qemu-arm@nongnu.org; Mon, 07 Mar 2022 15:07:10 -0500
Received: from [2607:f8b0:4864:20::b4a] (port=42547
 helo=mail-yb1-xb4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <36mUmYgYKCGcYNYZXWLTTLQJ.HTRVJRZ-FWRSTSLSZ.TWL@flex--titusr.bounces.google.com>)
 id 1nRJdM-0006CQ-BG
 for qemu-arm@nongnu.org; Mon, 07 Mar 2022 15:07:09 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 x1-20020a25a001000000b0061c64ee0196so14542328ybh.9
 for <qemu-arm@nongnu.org>; Mon, 07 Mar 2022 12:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=NI9wq2DideEAjgeOyBrnujlyjn4IddOI7Xe9VuBweBw=;
 b=RQIzzO8iPUWP/TXt0c8Fa21Y7fMOdwGlGN57KbdgVzeNNc3pzmtIb3UTUONT7my5bQ
 JXe+LnSB6PC2k1OskXTr989HL95BE+r7BBcJ4P5G7udfMnUAsxM6IwYw/Br1euBV/3WF
 aWtwXbIIuSPEf6TDnV2Lsqanu2XJJNIygjXMzVSns4zI/anfz2hKsL1JrYNzKdvTmGxC
 IC4pDOTfqWe2Kzok6BeXZPEHP/8knrHEXzE8zqeqwrXahXxoq7i0JzvUUELlptSz2JxV
 MyXkMy5kxOuNBs0xYI1jqcOx8zVITOz/ohTWt521vneUaPOIzdWE7dASM70U7g5IAmeS
 RV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=NI9wq2DideEAjgeOyBrnujlyjn4IddOI7Xe9VuBweBw=;
 b=mmAKdxMKueeJMBW1CzsB/Co3nhMCXOWrjMwy+4lSvCkWwhHrSb+DiANS6SpJkvQzpi
 uL5UMt8KoS7ExaiOxf42JbkQ8re4gX7X9J3c1ErGidBiQZ+E/wLjo0+eaLZJ/e8iTQqA
 29Mc/JrvlA0BjwrwckAeATwpOVkIEgwqJBtzmfBLklnTZJ9U3VWgxL0Jr7aci/cdnC3s
 J+VH1mattXa2RpwTlQPe6+BeAxp0C+TxADXUxojr5JLPVGsU5KeLTXbrpC2wW3IUFJqv
 6yIanulGczLtlj1+rEZUiA0W+1kfhEm1VcLkD3zf1fn5SrCZYOKrC0g3wa4m7R9+7GLX
 AjtA==
X-Gm-Message-State: AOAM533inHLTGvWxeOVA9pr/WWz28bTJK0buxesDQGBKXOCoVeLH++BT
 /6pbNRy+A791bfD1RmMGoQ3p9lfbdp8=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3c4a:fc8b:1418:53ce])
 (user=titusr job=sendgmr) by 2002:a25:e307:0:b0:628:a6d3:1f6b with SMTP id
 z7-20020a25e307000000b00628a6d31f6bmr9251261ybd.338.1646683626935; Mon, 07
 Mar 2022 12:07:06 -0800 (PST)
Date: Mon,  7 Mar 2022 12:06:05 -0800
In-Reply-To: <20220307200605.4001451-1-titusr@google.com>
Message-Id: <20220307200605.4001451-10-titusr@google.com>
Mime-Version: 1.0
References: <20220307200605.4001451-1-titusr@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v4 9/9] hw/sensor: add Renesas raa228000 device
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>, 
 "=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <f4bug@amsat.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=36mUmYgYKCGcYNYZXWLTTLQJ.HTRVJRZ-FWRSTSLSZ.TWL@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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
X-TUID: SGDA8aX4Cpyq

Signed-off-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 hw/sensor/isl_pmbus_vr.c         | 50 ++++++++++++++++++++++
 include/hw/sensor/isl_pmbus_vr.h |  1 +
 tests/qtest/isl_pmbus_vr-test.c  | 72 ++++++++++++++++++++++++++++++++
 3 files changed, 123 insertions(+)

diff --git a/hw/sensor/isl_pmbus_vr.c b/hw/sensor/isl_pmbus_vr.c
index 53187d619a..e11e028884 100644
--- a/hw/sensor/isl_pmbus_vr.c
+++ b/hw/sensor/isl_pmbus_vr.c
@@ -89,6 +89,24 @@ static void isl_pmbus_vr_exit_reset(Object *obj)
     }
 }
=20
+/* The raa228000 uses different direct mode coefficents from most isl devi=
ces */
+static void raa228000_exit_reset(Object *obj)
+{
+    PMBusDevice *pmdev =3D PMBUS_DEVICE(obj);
+
+    isl_pmbus_vr_exit_reset(obj);
+
+    pmdev->pages[0].read_iout =3D 0;
+    pmdev->pages[0].read_pout =3D 0;
+    pmdev->pages[0].read_vout =3D 0;
+    pmdev->pages[0].read_vin =3D 0;
+    pmdev->pages[0].read_iin =3D 0;
+    pmdev->pages[0].read_pin =3D 0;
+    pmdev->pages[0].read_temperature_1 =3D 0;
+    pmdev->pages[0].read_temperature_2 =3D 0;
+    pmdev->pages[0].read_temperature_3 =3D 0;
+}
+
 static void isl_pmbus_vr_add_props(Object *obj, uint64_t *flags, uint8_t p=
ages)
 {
     PMBusDevice *pmdev =3D PMBUS_DEVICE(obj);
@@ -177,6 +195,20 @@ static void raa22xx_init(Object *obj)
     isl_pmbus_vr_add_props(obj, flags, ARRAY_SIZE(flags));
 }
=20
+static void raa228000_init(Object *obj)
+{
+    PMBusDevice *pmdev =3D PMBUS_DEVICE(obj);
+    uint64_t flags[1];
+
+    flags[0] =3D PB_HAS_VIN | PB_HAS_VOUT | PB_HAS_VOUT_MODE |
+               PB_HAS_VOUT_RATING | PB_HAS_VOUT_MARGIN | PB_HAS_IIN |
+               PB_HAS_IOUT | PB_HAS_PIN | PB_HAS_POUT | PB_HAS_TEMPERATURE=
 |
+               PB_HAS_TEMP2 | PB_HAS_TEMP3 | PB_HAS_STATUS_MFR_SPECIFIC;
+
+    pmbus_page_config(pmdev, 0, flags[0]);
+    isl_pmbus_vr_add_props(obj, flags, 1);
+}
+
 static void isl_pmbus_vr_class_init(ObjectClass *klass, void *data,
                                     uint8_t pages)
 {
@@ -195,6 +227,15 @@ static void isl69260_class_init(ObjectClass *klass, vo=
id *data)
     isl_pmbus_vr_class_init(klass, data, 2);
 }
=20
+static void raa228000_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc =3D RESETTABLE_CLASS(klass);
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    dc->desc =3D "Renesas 228000 Digital Multiphase Voltage Regulator";
+    rc->phases.exit =3D raa228000_exit_reset;
+    isl_pmbus_vr_class_init(klass, data, 1);
+}
+
 static void raa229004_class_init(ObjectClass *klass, void *data)
 {
     ResettableClass *rc =3D RESETTABLE_CLASS(klass);
@@ -220,9 +261,18 @@ static const TypeInfo raa229004_info =3D {
     .class_init =3D raa229004_class_init,
 };
=20
+static const TypeInfo raa228000_info =3D {
+    .name =3D TYPE_RAA228000,
+    .parent =3D TYPE_PMBUS_DEVICE,
+    .instance_size =3D sizeof(ISLState),
+    .instance_init =3D raa228000_init,
+    .class_init =3D raa228000_class_init,
+};
+
 static void isl_pmbus_vr_register_types(void)
 {
     type_register_static(&isl69260_info);
+    type_register_static(&raa228000_info);
     type_register_static(&raa229004_info);
 }
=20
diff --git a/include/hw/sensor/isl_pmbus_vr.h b/include/hw/sensor/isl_pmbus=
_vr.h
index 233916f70a..3e47ff7e48 100644
--- a/include/hw/sensor/isl_pmbus_vr.h
+++ b/include/hw/sensor/isl_pmbus_vr.h
@@ -13,6 +13,7 @@
 #include "qom/object.h"
=20
 #define TYPE_ISL69260   "isl69260"
+#define TYPE_RAA228000  "raa228000"
 #define TYPE_RAA229004  "raa229004"
=20
 struct ISLState {
diff --git a/tests/qtest/isl_pmbus_vr-test.c b/tests/qtest/isl_pmbus_vr-tes=
t.c
index dc0ccae2aa..5553ea410a 100644
--- a/tests/qtest/isl_pmbus_vr-test.c
+++ b/tests/qtest/isl_pmbus_vr-test.c
@@ -150,6 +150,70 @@ static void test_defaults(void *obj, void *data, QGues=
tAllocator *alloc)
     g_assert_cmphex(i2c_value, =3D=3D, ISL_REVISION_DEFAULT);
 }
=20
+static void raa228000_test_defaults(void *obj, void *data,
+                                    QGuestAllocator *alloc)
+{
+    uint16_t value, i2c_value;
+    QI2CDevice *i2cdev =3D (QI2CDevice *)obj;
+
+    value =3D qmp_isl_pmbus_vr_get(TEST_ID, "vout[0]");
+    g_assert_cmpuint(value, =3D=3D, 0);
+
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_READ_IOUT);
+    g_assert_cmpuint(i2c_value, =3D=3D, 0);
+
+    value =3D qmp_isl_pmbus_vr_get(TEST_ID, "pout[0]");
+    g_assert_cmpuint(value, =3D=3D, 0);
+
+    i2c_value =3D i2c_get8(i2cdev, PMBUS_CAPABILITY);
+    g_assert_cmphex(i2c_value, =3D=3D, ISL_CAPABILITY_DEFAULT);
+
+    i2c_value =3D i2c_get8(i2cdev, PMBUS_OPERATION);
+    g_assert_cmphex(i2c_value, =3D=3D, ISL_OPERATION_DEFAULT);
+
+    i2c_value =3D i2c_get8(i2cdev, PMBUS_ON_OFF_CONFIG);
+    g_assert_cmphex(i2c_value, =3D=3D, ISL_ON_OFF_CONFIG_DEFAULT);
+
+    i2c_value =3D i2c_get8(i2cdev, PMBUS_VOUT_MODE);
+    g_assert_cmphex(i2c_value, =3D=3D, ISL_VOUT_MODE_DEFAULT);
+
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_COMMAND);
+    g_assert_cmphex(i2c_value, =3D=3D, ISL_VOUT_COMMAND_DEFAULT);
+
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_MAX);
+    g_assert_cmphex(i2c_value, =3D=3D, ISL_VOUT_MAX_DEFAULT);
+
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_MARGIN_HIGH);
+    g_assert_cmphex(i2c_value, =3D=3D, ISL_VOUT_MARGIN_HIGH_DEFAULT);
+
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_MARGIN_LOW);
+    g_assert_cmphex(i2c_value, =3D=3D, ISL_VOUT_MARGIN_LOW_DEFAULT);
+
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_TRANSITION_RAT=
E);
+    g_assert_cmphex(i2c_value, =3D=3D, ISL_VOUT_TRANSITION_RATE_DEFAULT);
+
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VOUT_OV_FAULT_LIMIT=
);
+    g_assert_cmphex(i2c_value, =3D=3D, ISL_VOUT_OV_FAULT_LIMIT_DEFAULT);
+
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_OT_FAULT_LIMIT);
+    g_assert_cmphex(i2c_value, =3D=3D, ISL_OT_FAULT_LIMIT_DEFAULT);
+
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_OT_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, =3D=3D, ISL_OT_WARN_LIMIT_DEFAULT);
+
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VIN_OV_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, =3D=3D, ISL_VIN_OV_WARN_LIMIT_DEFAULT);
+
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_VIN_UV_WARN_LIMIT);
+    g_assert_cmphex(i2c_value, =3D=3D, ISL_VIN_UV_WARN_LIMIT_DEFAULT);
+
+    i2c_value =3D isl_pmbus_vr_i2c_get16(i2cdev, PMBUS_IIN_OC_FAULT_LIMIT)=
;
+    g_assert_cmphex(i2c_value, =3D=3D, ISL_IIN_OC_FAULT_LIMIT_DEFAULT);
+
+    i2c_value =3D i2c_get8(i2cdev, PMBUS_REVISION);
+    g_assert_cmphex(i2c_value, =3D=3D, ISL_REVISION_DEFAULT);
+}
+
 /* test qmp access */
 static void test_tx_rx(void *obj, void *data, QGuestAllocator *alloc)
 {
@@ -398,5 +462,13 @@ static void isl_pmbus_vr_register_nodes(void)
     qos_add_test("test_rw_regs", "raa229004", test_rw_regs, NULL);
     qos_add_test("test_pages_rw", "raa229004", test_pages_rw, NULL);
     qos_add_test("test_ov_faults", "raa229004", test_voltage_faults, NULL)=
;
+
+    qos_node_create_driver("raa228000", i2c_device_create);
+    qos_node_consumes("raa228000", "i2c-bus", &opts);
+
+    qos_add_test("test_defaults", "raa228000", raa228000_test_defaults, NU=
LL);
+    qos_add_test("test_tx_rx", "raa228000", test_tx_rx, NULL);
+    qos_add_test("test_rw_regs", "raa228000", test_rw_regs, NULL);
+    qos_add_test("test_ov_faults", "raa228000", test_voltage_faults, NULL)=
;
 }
 libqos_init(isl_pmbus_vr_register_nodes);
--=20
2.35.1.616.g0bdcbb4464-goog

