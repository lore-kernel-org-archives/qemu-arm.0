Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2639875lft;
        Mon, 27 Jun 2022 12:56:01 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vOxku4oNb53CWag8qm97dJBerRRsuoCaY3KnduNtVX16ZWUo+miGH+KB91QNFxhtR+QWTm
X-Received: by 2002:a0c:e74e:0:b0:46b:55e7:3152 with SMTP id g14-20020a0ce74e000000b0046b55e73152mr10024883qvn.41.1656359761327;
        Mon, 27 Jun 2022 12:56:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656359761; cv=none;
        d=google.com; s=arc-20160816;
        b=C3D4ssV9CBZngnXFVFR9Cia3bgSHJXQrtrWbNwDexiRNfwby+hEPMSZTTAkN1JfTjF
         uwmyDB2In0ljR42aZ6IT731oa54Fx9qLo418XsHUQEjHy6HqNV9bpwZBaCZfL56UARvw
         gIYiKbmDWWgwPjOGsQWnKAS4ETTAEytfEIf7/0u6CoHFyu/+gKde8Zs+Mg8B6UdYinnk
         vkcEGWFOXTCGXrD99TPRo+CwDfp3MtSxDGwd+UKwvfLLoHFcG5WsI/4YDcnQ7aE5JYnY
         nqo2ZhWrkmvYUeeos6Tcalc7tGja1ATcSYRYfSMp6xJ22LrDWQt+2xF+V1ksMW2Abmb7
         EScA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8rr/SRIwXN18c3w8eDU8LTPgf1MtZxfK3S3aGcaNIHE=;
        b=AmdwcSaWcxIL50Dl/HjI0GP9Y+CorGZCfpX1km0aQi0Mp0Cx7qUhpVoqXKa/ZLLUfH
         qGO0k6vRZx+gk1WpGrm0a+G8cJuwXeVJVGha6S0ELb9phZ7Ur+IRXDbygPI0dUQBPVs6
         oMTkI6JxaBO3zuj0LtPh9PaP8z61zel2WDhBDPmrfFOEo0s2p4Jz7L9jGjt4rrlqP4xe
         5Fy7XLSmnxol+4wGqgatynI4kfUfRiJo4A0xBmNA0VtpoiKKc5sBeXV7sxcqxdGS9u5v
         q+FlulEKqhfbpYwMZYMDlSNxOgR9trQca/s3/+AgUwqH8HExwsusGU8+0OLpoSoI3VwT
         JDMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=azohcghH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j13-20020a05620a288d00b006aeda90e2fasi6790210qkp.203.2022.06.27.12.56.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 12:56:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=azohcghH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:59112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o5uq0-0004NF-MA
	for alex.bennee@linaro.org; Mon, 27 Jun 2022 15:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71779173e5=pdel@fb.com>)
 id 1o5upS-0004Kb-OE
 for qemu-arm@nongnu.org; Mon, 27 Jun 2022 15:55:26 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:31934
 helo=mx0a-00082601.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71779173e5=pdel@fb.com>)
 id 1o5upQ-0000bh-Sk
 for qemu-arm@nongnu.org; Mon, 27 Jun 2022 15:55:26 -0400
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.17.1.5/8.17.1.5) with ESMTP id 25RJ1QFF015418
 for <qemu-arm@nongnu.org>; Mon, 27 Jun 2022 12:55:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=facebook;
 bh=8rr/SRIwXN18c3w8eDU8LTPgf1MtZxfK3S3aGcaNIHE=;
 b=azohcghHZYbTvJRdr3UFdUOoO+QJ9nLvdSVelcy9+JqAWfqC8IgD9k/mxtFg8guQiQoT
 JJLI9fec9y6JKHWGVuKC8X2zf0Kc4esh0nqsdGBUt4uYPRHGqjB+nCwebXoC3KhlL6qU
 mfKAhPl1YHamm3SlAqNahngm9nRACwRPPCA= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0089730.ppops.net (PPS) with ESMTPS id 3gwwv756s5-14
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 27 Jun 2022 12:55:24 -0700
Received: from twshared31479.05.prn5.facebook.com (2620:10d:c085:108::4) by
 mail.thefacebook.com (2620:10d:c085:11d::4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 12:55:19 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id C07598D206E5; Mon, 27 Jun 2022 12:55:07 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <zhdaniel@fb.com>, <clg@kaod.org>, <qemu-devel@nongnu.org>, 
 <qemu-arm@nongnu.org>, <komlodi@google.com>, <titusr@google.com>,
 <andrew@aj.id.au>, <joel@jms.id.au>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH 03/14] hw/i2c/aspeed: add slave device in old register mode
Date: Mon, 27 Jun 2022 12:54:55 -0700
Message-ID: <20220627195506.403715-4-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220627195506.403715-1-pdel@fb.com>
References: <20220627195506.403715-1-pdel@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
X-Proofpoint-GUID: wSeOLfpu9PSDD7NcYl0Hn-8TjjXpD78T
X-Proofpoint-ORIG-GUID: wSeOLfpu9PSDD7NcYl0Hn-8TjjXpD78T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=71779173e5=pdel@fb.com; helo=mx0a-00082601.pphosted.com
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
X-TUID: iZDM8DRDyCvh

From: Klaus Jensen <k.jensen@samsung.com>

Add slave mode functionality for the Aspeed I2C controller in old
register mode. This is implemented by realizing an I2C slave device
owned by the I2C controller and attached to its own bus.

The I2C slave device only implements asynchronous sends on the bus, so
slaves not supporting that will not be able to communicate with it.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
[ clg: checkpatch fixes ]
Message-Id: <20220601210831.67259-6-its@irrelevant.dk>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/i2c/aspeed_i2c.c         | 89 +++++++++++++++++++++++++++++++++----
 include/hw/i2c/aspeed_i2c.h |  8 ++++
 2 files changed, 88 insertions(+), 9 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 37ae1f2e04..2cfd05cb6c 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -696,9 +696,7 @@ static void aspeed_i2c_bus_old_write(AspeedI2CBus *bu=
s, hwaddr offset,
     switch (offset) {
     case A_I2CD_FUN_CTRL:
         if (SHARED_FIELD_EX32(value, SLAVE_EN)) {
-            qemu_log_mask(LOG_UNIMP, "%s: slave mode not implemented\n",
-                          __func__);
-            break;
+            i2c_slave_set_address(bus->slave, bus->regs[R_I2CD_DEV_ADDR]=
);
         }
         bus->regs[R_I2CD_FUN_CTRL] =3D value & 0x0071C3FF;
         break;
@@ -719,12 +717,15 @@ static void aspeed_i2c_bus_old_write(AspeedI2CBus *=
bus, hwaddr offset,
             bus->controller->intr_status &=3D ~(1 << bus->id);
             qemu_irq_lower(aic->bus_get_irq(bus));
         }
-        if (handle_rx && (SHARED_ARRAY_FIELD_EX32(bus->regs, R_I2CD_CMD,
-                                                  M_RX_CMD) ||
-                      SHARED_ARRAY_FIELD_EX32(bus->regs, R_I2CD_CMD,
-                                              M_S_RX_CMD_LAST))) {
-            aspeed_i2c_handle_rx_cmd(bus);
-            aspeed_i2c_bus_raise_interrupt(bus);
+        if (handle_rx) {
+            if (SHARED_ARRAY_FIELD_EX32(bus->regs, R_I2CD_CMD, M_RX_CMD)=
 ||
+                SHARED_ARRAY_FIELD_EX32(bus->regs, R_I2CD_CMD,
+                                        M_S_RX_CMD_LAST)) {
+                aspeed_i2c_handle_rx_cmd(bus);
+                aspeed_i2c_bus_raise_interrupt(bus);
+            } else if (aspeed_i2c_get_state(bus) =3D=3D I2CD_STXD) {
+                i2c_ack(bus->bus);
+            }
         }
         break;
     case A_I2CD_DEV_ADDR:
@@ -1036,6 +1037,73 @@ static const TypeInfo aspeed_i2c_info =3D {
     .abstract   =3D true,
 };
=20
+static int aspeed_i2c_bus_slave_event(I2CSlave *slave, enum i2c_event ev=
ent)
+{
+    BusState *qbus =3D qdev_get_parent_bus(DEVICE(slave));
+    AspeedI2CBus *bus =3D ASPEED_I2C_BUS(qbus->parent);
+    uint32_t reg_intr_sts =3D aspeed_i2c_bus_intr_sts_offset(bus);
+    uint32_t reg_byte_buf =3D aspeed_i2c_bus_byte_buf_offset(bus);
+    uint32_t value;
+
+    switch (event) {
+    case I2C_START_SEND_ASYNC:
+        value =3D SHARED_ARRAY_FIELD_EX32(bus->regs, reg_byte_buf, TX_BU=
F);
+        SHARED_ARRAY_FIELD_DP32(bus->regs, reg_byte_buf, RX_BUF, value <=
< 1);
+
+        ARRAY_FIELD_DP32(bus->regs, I2CD_INTR_STS, SLAVE_ADDR_RX_MATCH, =
1);
+        SHARED_ARRAY_FIELD_DP32(bus->regs, reg_intr_sts, RX_DONE, 1);
+
+        aspeed_i2c_set_state(bus, I2CD_STXD);
+
+        break;
+
+    case I2C_FINISH:
+        SHARED_ARRAY_FIELD_DP32(bus->regs, reg_intr_sts, NORMAL_STOP, 1)=
;
+
+        aspeed_i2c_set_state(bus, I2CD_IDLE);
+
+        break;
+
+    default:
+        return -1;
+    }
+
+    aspeed_i2c_bus_raise_interrupt(bus);
+
+    return 0;
+}
+
+static void aspeed_i2c_bus_slave_send_async(I2CSlave *slave, uint8_t dat=
a)
+{
+    BusState *qbus =3D qdev_get_parent_bus(DEVICE(slave));
+    AspeedI2CBus *bus =3D ASPEED_I2C_BUS(qbus->parent);
+    uint32_t reg_intr_sts =3D aspeed_i2c_bus_intr_sts_offset(bus);
+    uint32_t reg_byte_buf =3D aspeed_i2c_bus_byte_buf_offset(bus);
+
+    SHARED_ARRAY_FIELD_DP32(bus->regs, reg_byte_buf, RX_BUF, data);
+    SHARED_ARRAY_FIELD_DP32(bus->regs, reg_intr_sts, RX_DONE, 1);
+
+    aspeed_i2c_bus_raise_interrupt(bus);
+}
+
+static void aspeed_i2c_bus_slave_class_init(ObjectClass *klass, void *da=
ta)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    I2CSlaveClass *sc =3D I2C_SLAVE_CLASS(klass);
+
+    dc->desc =3D "Aspeed I2C Bus Slave";
+
+    sc->event =3D aspeed_i2c_bus_slave_event;
+    sc->send_async =3D aspeed_i2c_bus_slave_send_async;
+}
+
+static const TypeInfo aspeed_i2c_bus_slave_info =3D {
+    .name           =3D TYPE_ASPEED_I2C_BUS_SLAVE,
+    .parent         =3D TYPE_I2C_SLAVE,
+    .instance_size  =3D sizeof(AspeedI2CBusSlave),
+    .class_init     =3D aspeed_i2c_bus_slave_class_init,
+};
+
 static void aspeed_i2c_bus_reset(DeviceState *dev)
 {
     AspeedI2CBus *s =3D ASPEED_I2C_BUS(dev);
@@ -1060,6 +1128,8 @@ static void aspeed_i2c_bus_realize(DeviceState *dev=
, Error **errp)
     sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
=20
     s->bus =3D i2c_init_bus(dev, name);
+    s->slave =3D i2c_slave_create_simple(s->bus, TYPE_ASPEED_I2C_BUS_SLA=
VE,
+                                       0xff);
=20
     memory_region_init_io(&s->mr, OBJECT(s), &aspeed_i2c_bus_ops,
                           s, name, aic->reg_size);
@@ -1219,6 +1289,7 @@ static const TypeInfo aspeed_1030_i2c_info =3D {
 static void aspeed_i2c_register_types(void)
 {
     type_register_static(&aspeed_i2c_bus_info);
+    type_register_static(&aspeed_i2c_bus_slave_info);
     type_register_static(&aspeed_i2c_info);
     type_register_static(&aspeed_2400_i2c_info);
     type_register_static(&aspeed_2500_i2c_info);
diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index 1398befc10..ba148b2f6d 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -223,6 +223,9 @@ struct AspeedI2CBus {
=20
     struct AspeedI2CState *controller;
=20
+    /* slave mode */
+    I2CSlave *slave;
+
     MemoryRegion mr;
=20
     I2CBus *bus;
@@ -249,6 +252,11 @@ struct AspeedI2CState {
     AddressSpace dram_as;
 };
=20
+#define TYPE_ASPEED_I2C_BUS_SLAVE "aspeed.i2c.slave"
+OBJECT_DECLARE_SIMPLE_TYPE(AspeedI2CBusSlave, ASPEED_I2C_BUS_SLAVE)
+struct AspeedI2CBusSlave {
+    I2CSlave i2c;
+};
=20
 struct AspeedI2CClass {
     SysBusDeviceClass parent_class;
--=20
2.30.2

