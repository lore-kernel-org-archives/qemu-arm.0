Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1613437lfb;
        Fri, 3 Sep 2021 12:54:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzd3GN/YMLM6Ssf5DhU/ghXM/QFZ+uKzbfCui97mtSm1TBmf2yJaTs6u5ghB/lAzwF7hFze
X-Received: by 2002:a92:902:: with SMTP id y2mr428112ilg.304.1630698842209;
        Fri, 03 Sep 2021 12:54:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630698842; cv=none;
        d=google.com; s=arc-20160816;
        b=QupPSyI9Je4oFvSyRDXnoTlfo5Rh269HfQe91utkc26QFKbfK48+M23T3hTyg2n0Nr
         j9TWevqkpFjs/jOljy7YC23gIY8rXyYXpPi9yGEvyeQr2vkRZeDwb4TEQ+FHhNJdZ62e
         DoTcGMCFpMjqtkNALcecAw3LMWfVpbeCHcYmbiIOqv1D7IC1hPYS5bGaX1wmEQ3UpVKj
         rNat5RWz4OZq5Uc2AKPJu92CiweDUq2p3gAJ8DlsznvAwx1id+s14KepD9XEgjC7vLS/
         RcbwU0Z4OJILXuH6AHqniCNCyMrMdV6ZyG6ngC757DfZC6RZ7Kz3XgtqIt0R6lSEnV/O
         7GtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=P+JJJI6Uo0xcSiTF9pukvXb6emPW4eZTsVjWSO5AR0Y=;
        b=WnQiEbPXbI9PbR/1I3ggUpXRAVJdLE2MJ99v/2JZL3ySakGJQ6Xa2ys4K+P4QfNIT8
         omERJzmbdC3YB8KY3MMuVcJ0KfYPPmvh4T/JMKhtdwm6IPB7wDoqAG2qUzp2dFY6ydye
         KWJWvGgeTk0BZQbwSySJJAXDAdMDVFbKjl6y8iPQu3mm1ibYFNqT7+NKbZ4u8vQvzkAA
         NipUELst2I3PhVsg+tkbhaSClP9nhnXpDhbSnG5S4IRP/KcYP78n86m6324BZ1i3r4SI
         jVhfa9ue2nPOWbZlaoGC3rA4AGmT/0vXlwym3foPIHkZHefuE4AyE7K+PaEa/uYArO4d
         eAlA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b16si271060ilf.63.2021.09.03.12.54.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 12:54:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMFGD-0003Xg-Bn
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 15:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mMF4A-0004JU-5u
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 15:41:34 -0400
Received: from 3.mo552.mail-out.ovh.net ([178.33.254.192]:59999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mMF40-0002Ix-7X
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 15:41:33 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.47])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id F40BE20249;
 Fri,  3 Sep 2021 19:41:14 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 3 Sep
 2021 21:41:14 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00547082b93-92d3-4655-8541-d5afd614c562,
 15E2C03324B5D6AD2543493448FEC157D625CB40) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 10/14] hw/misc: Add Infineon DPS310 sensor model
Date: Fri, 3 Sep 2021 21:41:04 +0200
Message-ID: <20210903194108.131403-11-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903194108.131403-1-clg@kaod.org>
References: <20210903194108.131403-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 43602553-a897-420c-8fba-12be606ce0b7
X-Ovh-Tracer-Id: 8816359223656549158
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvjedgudefkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedtledttedvgfehkeefuddugeektdelgffhfeekudeiheeigfethfethfekvdevveenucffohhmrghinhepihhnfhhinhgvohhnrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.33.254.192; envelope-from=clg@kaod.org;
 helo=3.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u5Oy3G6oD5/t

From: Joel Stanley <joel@jms.id.au>

This contains some hardcoded register values that were obtained from the
hardware after reading the temperature.

It does enough to test the Linux kernel driver. The FIFO mode, IRQs and
operation modes other than the default as used by Linux are not modelled.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Message-Id: <20210616073358.750472-2-joel@jms.id.au>
[ clg: - Fixed sequential reading
       - Reworked regs_reset_state array
       - Moved model under hw/sensor/ ]
Message-Id: <20210629142336.750058-4-clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/sensor/dps310.c    | 225 ++++++++++++++++++++++++++++++++++++++++++
 hw/arm/Kconfig        |   1 +
 hw/sensor/Kconfig     |   4 +
 hw/sensor/meson.build |   1 +
 4 files changed, 231 insertions(+)
 create mode 100644 hw/sensor/dps310.c

diff --git a/hw/sensor/dps310.c b/hw/sensor/dps310.c
new file mode 100644
index 000000000000..d60a18ac41bb
--- /dev/null
+++ b/hw/sensor/dps310.c
@@ -0,0 +1,225 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2017-2021 Joel Stanley <joel@jms.id.au>, IBM Corporation
+ *
+ * Infineon DPS310 temperature and humidity sensor
+ *
+ * https://www.infineon.com/cms/en/product/sensor/pressure-sensors/pressure-sensors-for-iot/dps310/
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "hw/hw.h"
+#include "hw/i2c/i2c.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "migration/vmstate.h"
+
+#define NUM_REGISTERS   0x33
+
+typedef struct DPS310State {
+    /*< private >*/
+    I2CSlave i2c;
+
+    /*< public >*/
+    uint8_t regs[NUM_REGISTERS];
+
+    uint8_t len;
+    uint8_t pointer;
+
+} DPS310State;
+
+#define TYPE_DPS310 "dps310"
+#define DPS310(obj) OBJECT_CHECK(DPS310State, (obj), TYPE_DPS310)
+
+#define DPS310_PRS_B2           0x00
+#define DPS310_PRS_B1           0x01
+#define DPS310_PRS_B0           0x02
+#define DPS310_TMP_B2           0x03
+#define DPS310_TMP_B1           0x04
+#define DPS310_TMP_B0           0x05
+#define DPS310_PRS_CFG          0x06
+#define DPS310_TMP_CFG          0x07
+#define  DPS310_TMP_RATE_BITS   (0x70)
+#define DPS310_MEAS_CFG         0x08
+#define  DPS310_MEAS_CTRL_BITS  (0x07)
+#define   DPS310_PRESSURE_EN    BIT(0)
+#define   DPS310_TEMP_EN        BIT(1)
+#define   DPS310_BACKGROUND     BIT(2)
+#define  DPS310_PRS_RDY         BIT(4)
+#define  DPS310_TMP_RDY         BIT(5)
+#define  DPS310_SENSOR_RDY      BIT(6)
+#define  DPS310_COEF_RDY        BIT(7)
+#define DPS310_CFG_REG          0x09
+#define DPS310_RESET            0x0c
+#define  DPS310_RESET_MAGIC     (BIT(0) | BIT(3))
+#define DPS310_COEF_BASE        0x10
+#define DPS310_COEF_LAST        0x21
+#define DPS310_COEF_SRC         0x28
+
+static void dps310_reset(DeviceState *dev)
+{
+    DPS310State *s = DPS310(dev);
+
+    static const uint8_t regs_reset_state[sizeof(s->regs)] = {
+        0xfe, 0x2f, 0xee, 0x02, 0x69, 0xa6, 0x00, 0x80, 0xc7, 0x00, 0x00, 0x00,
+        0x00, 0x10, 0x00, 0x00, 0x0e, 0x1e, 0xdd, 0x13, 0xca, 0x5f, 0x21, 0x52,
+        0xf9, 0xc6, 0x04, 0xd1, 0xdb, 0x47, 0x00, 0x5b, 0xfb, 0x3a, 0x00, 0x00,
+        0x20, 0x49, 0x4e, 0xa5, 0x90, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+        0x60, 0x15, 0x02
+    };
+
+    memcpy(s->regs, regs_reset_state, sizeof(s->regs));
+    s->pointer = 0;
+
+    /* TODO: assert these after some timeout ? */
+    s->regs[DPS310_MEAS_CFG] = DPS310_COEF_RDY | DPS310_SENSOR_RDY
+        | DPS310_TMP_RDY | DPS310_PRS_RDY;
+}
+
+static uint8_t dps310_read(DPS310State *s, uint8_t reg)
+{
+    if (reg >= sizeof(s->regs)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: register 0x%02x out of bounds\n",
+                      __func__, s->pointer);
+        return 0xFF;
+    }
+
+    switch (reg) {
+    case DPS310_PRS_B2:
+    case DPS310_PRS_B1:
+    case DPS310_PRS_B0:
+    case DPS310_TMP_B2:
+    case DPS310_TMP_B1:
+    case DPS310_TMP_B0:
+    case DPS310_PRS_CFG:
+    case DPS310_TMP_CFG:
+    case DPS310_MEAS_CFG:
+    case DPS310_CFG_REG:
+    case DPS310_COEF_BASE...DPS310_COEF_LAST:
+    case DPS310_COEF_SRC:
+    case 0x32: /* Undocumented register to indicate workaround not required */
+        return s->regs[reg];
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: register 0x%02x unimplemented\n",
+                      __func__, reg);
+        return 0xFF;
+    }
+}
+
+static void dps310_write(DPS310State *s, uint8_t reg, uint8_t data)
+{
+    if (reg >= sizeof(s->regs)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: register %d out of bounds\n",
+                      __func__, s->pointer);
+        return;
+    }
+
+    switch (reg) {
+    case DPS310_RESET:
+        if (data == DPS310_RESET_MAGIC) {
+            device_cold_reset(DEVICE(s));
+        }
+        break;
+    case DPS310_PRS_CFG:
+    case DPS310_TMP_CFG:
+    case DPS310_MEAS_CFG:
+    case DPS310_CFG_REG:
+        s->regs[reg] = data;
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: register 0x%02x unimplemented\n",
+                      __func__, reg);
+        return;
+    }
+}
+
+static uint8_t dps310_rx(I2CSlave *i2c)
+{
+    DPS310State *s = DPS310(i2c);
+
+    if (s->len == 1) {
+        return dps310_read(s, s->pointer++);
+    } else {
+        return 0xFF;
+    }
+}
+
+static int dps310_tx(I2CSlave *i2c, uint8_t data)
+{
+    DPS310State *s = DPS310(i2c);
+
+    if (s->len == 0) {
+        /*
+         * first byte is the register pointer for a read or write
+         * operation
+         */
+        s->pointer = data;
+        s->len++;
+    } else if (s->len == 1) {
+        dps310_write(s, s->pointer++, data);
+    }
+
+    return 0;
+}
+
+static int dps310_event(I2CSlave *i2c, enum i2c_event event)
+{
+    DPS310State *s = DPS310(i2c);
+
+    switch (event) {
+    case I2C_START_SEND:
+        s->pointer = 0xFF;
+        s->len = 0;
+        break;
+    case I2C_START_RECV:
+        if (s->len != 1) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid recv sequence\n",
+                          __func__);
+        }
+        break;
+    default:
+        break;
+    }
+
+    return 0;
+}
+
+static const VMStateDescription vmstate_dps310 = {
+    .name = "DPS310",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8(len, DPS310State),
+        VMSTATE_UINT8_ARRAY(regs, DPS310State, NUM_REGISTERS),
+        VMSTATE_UINT8(pointer, DPS310State),
+        VMSTATE_I2C_SLAVE(i2c, DPS310State),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void dps310_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
+
+    k->event = dps310_event;
+    k->recv = dps310_rx;
+    k->send = dps310_tx;
+    dc->reset = dps310_reset;
+    dc->vmsd = &vmstate_dps310;
+}
+
+static const TypeInfo dps310_info = {
+    .name          = TYPE_DPS310,
+    .parent        = TYPE_I2C_SLAVE,
+    .instance_size = sizeof(DPS310State),
+    .class_init    = dps310_class_init,
+};
+
+static void dps310_register_types(void)
+{
+    type_register_static(&dps310_info);
+}
+
+type_init(dps310_register_types)
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 78fdd1b93503..18832abf7d13 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -428,6 +428,7 @@ config ASPEED_SOC
     select DS1338
     select FTGMAC100
     select I2C
+    select DPS310
     select PCA9552
     select SERIAL
     select SMBUS_EEPROM
diff --git a/hw/sensor/Kconfig b/hw/sensor/Kconfig
index a2b55a4fdb2e..9c8a049b0686 100644
--- a/hw/sensor/Kconfig
+++ b/hw/sensor/Kconfig
@@ -6,6 +6,10 @@ config TMP421
     bool
     depends on I2C
 
+config DPS310
+    bool
+    depends on I2C
+
 config EMC141X
     bool
     depends on I2C
diff --git a/hw/sensor/meson.build b/hw/sensor/meson.build
index 034e3e0207bc..059c4ca935b7 100644
--- a/hw/sensor/meson.build
+++ b/hw/sensor/meson.build
@@ -1,5 +1,6 @@
 softmmu_ss.add(when: 'CONFIG_TMP105', if_true: files('tmp105.c'))
 softmmu_ss.add(when: 'CONFIG_TMP421', if_true: files('tmp421.c'))
+softmmu_ss.add(when: 'CONFIG_DPS310', if_true: files('dps310.c'))
 softmmu_ss.add(when: 'CONFIG_EMC141X', if_true: files('emc141x.c'))
 softmmu_ss.add(when: 'CONFIG_ADM1272', if_true: files('adm1272.c'))
 softmmu_ss.add(when: 'CONFIG_MAX34451', if_true: files('max34451.c'))
-- 
2.31.1

