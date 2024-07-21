Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1307838njc;
        Sun, 21 Jul 2024 01:16:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX2cg33gzBCmLEelbCvoca/razkmw+ZYJ1MB2FylSuDzFkrmkXvTDZS0plQDND14NMqNQ2NmsBL3aNFgaqf4YRuEki64lf+
X-Google-Smtp-Source: AGHT+IGx3irYDFTQmmHjyC2/YMjDdwYWltW4Kr3YBXKXcynHo4UDo6MOHUOJYdsB0KkyJvX1gqzo
X-Received: by 2002:a05:620a:2697:b0:79f:c0d:782b with SMTP id af79cd13be357-7a1a1344679mr660667985a.39.1721549800013;
        Sun, 21 Jul 2024 01:16:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721549799; cv=none;
        d=google.com; s=arc-20160816;
        b=dQaYxFRZZMhbI9ebY36cgWJPqgbAXwCakizSpBN79BBz7K3M6IkRAx1flPLhEv2r5a
         p62ePjZDpHQTT6q/XMghXZgZnLRG6Fo4Be7balXZDhU8omtcGRQGk7l4Yz+3uiCjIbhT
         dz1M9JM8QU2yCj7fjZSzODsiGHX9EEOrxAN+U1pKDN0VMIEJjo/RcavOoAn/8ZWm0Pzx
         gs7XMKcjY4Z+1EziUMPkHWsGZup0HV8s6Rq6wlz1SkuVcCqs2k7ZY02tlG+yCnRFF/WN
         4pph82gPCMsENguFyXmNPz44x8xZ3ndju2UmIaCG3cIKb8/Kkr3qRM4jsryVHAKYeZkY
         GJ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ld0mU1zmiPSrHJAQyXj4+k8X2eRovAVJJwSTO8zI9kc=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=NTZRhulo+H7PvwbWJmWzQskms3UZRyAXZOi99eyxTM7jB3nZ9I1IXsARGMmSynHtXu
         y2rUAPcIcm2be4ANAcCTVfl+Q25l82mEv/yNnWWkSuHhmw/j1LXeUoNeI0nJA/JeEYBS
         AS9//NJwIkhYgeSMQWHhzKDy/I+9LazIKmJzXYyq5DuVLbQXjkCvWvDKIQGubY7m0WYe
         xT0g52SaT/wRk5McMkCnkchHqcSc9+wpNnhCrDsZwyuG9g+v2IViBPG4ypk0fNHSJWy6
         deMa6JFPdvn4cEgeQRdNR56kR3q3PhpVBtogJ7uSRkZnYm1sKN4MVn/GTD2aOz7TUrtl
         WDHw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ss1eZULG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a198f9773dsi542087485a.36.2024.07.21.01.16.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Jul 2024 01:16:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ss1eZULG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sVRiX-0001RX-DB; Sun, 21 Jul 2024 04:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sVRiS-000168-2o
 for qemu-arm@nongnu.org; Sun, 21 Jul 2024 04:14:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sVRiQ-0001X9-Ap
 for qemu-arm@nongnu.org; Sun, 21 Jul 2024 04:14:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721549685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ld0mU1zmiPSrHJAQyXj4+k8X2eRovAVJJwSTO8zI9kc=;
 b=Ss1eZULGwyKL0O68IRQ2N1+ogxJrPeNDCL3xFzDTIu6zVrgTyBu37xHD1hEf+qCAqCOXWH
 SuqysVQ224vhAY0+BFxyN+sFsZYCwD6+7cdqbEh+keNtfa7xETFx0OxqQBggRS/irS6jwS
 pbBKez9GLZCym1H5FIrWAbMuUtihz40=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-440-tlfKSuTBMgSgx9k1I7RP0Q-1; Sun,
 21 Jul 2024 04:14:43 -0400
X-MC-Unique: tlfKSuTBMgSgx9k1I7RP0Q-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 92DA51955F3B; Sun, 21 Jul 2024 08:14:42 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.37])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 234661955D4D; Sun, 21 Jul 2024 08:14:40 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 14/15] hw/i2c/aspeed: rename the I2C class pool attribute to
 share_pool
Date: Sun, 21 Jul 2024 10:14:00 +0200
Message-ID: <20240721081401.425588-15-clg@redhat.com>
In-Reply-To: <20240721081401.425588-1-clg@redhat.com>
References: <20240721081401.425588-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Lc8tgiBMH7yF

From: Jamin Lin <jamin_lin@aspeedtech.com>

According to the datasheet of ASPEED SOCs,
each I2C bus has their own pool buffer since AST2500.

Only AST2400 utilized a pool buffer share to all I2C bus.
And firmware required to set the offset of pool buffer
by writing "Function Control Register(I2CD 00)"

To make this model more readable, will change to introduce
a new bus pool buffer attribute in AspeedI2Cbus.
So, it does not need to calculate the pool buffer offset
for different I2C bus.

This patch rename the I2C class pool attribute to share_pool.
It make user more understand share pool and bus pool
are different.

Incrementing the version of aspeed_i2c_vmstate to 3.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 include/hw/i2c/aspeed_i2c.h |  4 ++--
 hw/i2c/aspeed_i2c.c         | 39 ++++++++++++++++++++-----------------
 2 files changed, 23 insertions(+), 20 deletions(-)

diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index 065b636d2999..fad5e9259a51 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -34,7 +34,7 @@
 OBJECT_DECLARE_TYPE(AspeedI2CState, AspeedI2CClass, ASPEED_I2C)
 
 #define ASPEED_I2C_NR_BUSSES 16
-#define ASPEED_I2C_MAX_POOL_SIZE 0x800
+#define ASPEED_I2C_SHARE_POOL_SIZE 0x800
 #define ASPEED_I2C_OLD_NUM_REG 11
 #define ASPEED_I2C_NEW_NUM_REG 22
 
@@ -257,7 +257,7 @@ struct AspeedI2CState {
     uint32_t ctrl_global;
     uint32_t new_clk_divider;
     MemoryRegion pool_iomem;
-    uint8_t pool[ASPEED_I2C_MAX_POOL_SIZE];
+    uint8_t share_pool[ASPEED_I2C_SHARE_POOL_SIZE];
 
     AspeedI2CBus busses[ASPEED_I2C_NR_BUSSES];
     MemoryRegion *dram_mr;
diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 7d5a53c4c015..b52a99896c5c 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -906,7 +906,7 @@ static const MemoryRegionOps aspeed_i2c_ctrl_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
-static uint64_t aspeed_i2c_pool_read(void *opaque, hwaddr offset,
+static uint64_t aspeed_i2c_share_pool_read(void *opaque, hwaddr offset,
                                      unsigned size)
 {
     AspeedI2CState *s = opaque;
@@ -914,26 +914,26 @@ static uint64_t aspeed_i2c_pool_read(void *opaque, hwaddr offset,
     int i;
 
     for (i = 0; i < size; i++) {
-        ret |= (uint64_t) s->pool[offset + i] << (8 * i);
+        ret |= (uint64_t) s->share_pool[offset + i] << (8 * i);
     }
 
     return ret;
 }
 
-static void aspeed_i2c_pool_write(void *opaque, hwaddr offset,
+static void aspeed_i2c_share_pool_write(void *opaque, hwaddr offset,
                                   uint64_t value, unsigned size)
 {
     AspeedI2CState *s = opaque;
     int i;
 
     for (i = 0; i < size; i++) {
-        s->pool[offset + i] = (value >> (8 * i)) & 0xFF;
+        s->share_pool[offset + i] = (value >> (8 * i)) & 0xFF;
     }
 }
 
-static const MemoryRegionOps aspeed_i2c_pool_ops = {
-    .read = aspeed_i2c_pool_read,
-    .write = aspeed_i2c_pool_write,
+static const MemoryRegionOps aspeed_i2c_share_pool_ops = {
+    .read = aspeed_i2c_share_pool_read,
+    .write = aspeed_i2c_share_pool_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
     .valid = {
         .min_access_size = 1,
@@ -953,14 +953,15 @@ static const VMStateDescription aspeed_i2c_bus_vmstate = {
 
 static const VMStateDescription aspeed_i2c_vmstate = {
     .name = TYPE_ASPEED_I2C,
-    .version_id = 2,
-    .minimum_version_id = 2,
+    .version_id = 3,
+    .minimum_version_id = 3,
     .fields = (const VMStateField[]) {
         VMSTATE_UINT32(intr_status, AspeedI2CState),
         VMSTATE_STRUCT_ARRAY(busses, AspeedI2CState,
                              ASPEED_I2C_NR_BUSSES, 1, aspeed_i2c_bus_vmstate,
                              AspeedI2CBus),
-        VMSTATE_UINT8_ARRAY(pool, AspeedI2CState, ASPEED_I2C_MAX_POOL_SIZE),
+        VMSTATE_UINT8_ARRAY(share_pool, AspeedI2CState,
+                            ASPEED_I2C_SHARE_POOL_SIZE),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -995,7 +996,7 @@ static void aspeed_i2c_instance_init(Object *obj)
  *   0x140 ... 0x17F: Device 5
  *   0x180 ... 0x1BF: Device 6
  *   0x1C0 ... 0x1FF: Device 7
- *   0x200 ... 0x2FF: Buffer Pool  (unused in linux driver)
+ *   0x200 ... 0x2FF: Buffer Pool (AST2500 unused in linux driver)
  *   0x300 ... 0x33F: Device 8
  *   0x340 ... 0x37F: Device 9
  *   0x380 ... 0x3BF: Device 10
@@ -1003,7 +1004,7 @@ static void aspeed_i2c_instance_init(Object *obj)
  *   0x400 ... 0x43F: Device 12
  *   0x440 ... 0x47F: Device 13
  *   0x480 ... 0x4BF: Device 14
- *   0x800 ... 0xFFF: Buffer Pool  (unused in linux driver)
+ *   0x800 ... 0xFFF: Buffer Pool (AST2400 unused in linux driver)
  */
 static void aspeed_i2c_realize(DeviceState *dev, Error **errp)
 {
@@ -1037,8 +1038,9 @@ static void aspeed_i2c_realize(DeviceState *dev, Error **errp)
                                     &s->busses[i].mr);
     }
 
-    memory_region_init_io(&s->pool_iomem, OBJECT(s), &aspeed_i2c_pool_ops, s,
-                          "aspeed.i2c-pool", aic->pool_size);
+    memory_region_init_io(&s->pool_iomem, OBJECT(s),
+                          &aspeed_i2c_share_pool_ops, s,
+                          "aspeed.i2c-share-pool", aic->pool_size);
     memory_region_add_subregion(&s->iomem, aic->pool_base, &s->pool_iomem);
 
     if (aic->has_dma) {
@@ -1266,8 +1268,9 @@ static qemu_irq aspeed_2400_i2c_bus_get_irq(AspeedI2CBus *bus)
 static uint8_t *aspeed_2400_i2c_bus_pool_base(AspeedI2CBus *bus)
 {
     uint8_t *pool_page =
-        &bus->controller->pool[ARRAY_FIELD_EX32(bus->regs, I2CD_FUN_CTRL,
-                                                POOL_PAGE_SEL) * 0x100];
+        &bus->controller->share_pool[ARRAY_FIELD_EX32(bus->regs,
+                                                      I2CD_FUN_CTRL,
+                                                      POOL_PAGE_SEL) * 0x100];
 
     return &pool_page[ARRAY_FIELD_EX32(bus->regs, I2CD_POOL_CTRL, OFFSET)];
 }
@@ -1302,7 +1305,7 @@ static qemu_irq aspeed_2500_i2c_bus_get_irq(AspeedI2CBus *bus)
 
 static uint8_t *aspeed_2500_i2c_bus_pool_base(AspeedI2CBus *bus)
 {
-    return &bus->controller->pool[bus->id * 0x10];
+    return &bus->controller->share_pool[bus->id * 0x10];
 }
 
 static void aspeed_2500_i2c_class_init(ObjectClass *klass, void *data)
@@ -1337,7 +1340,7 @@ static qemu_irq aspeed_2600_i2c_bus_get_irq(AspeedI2CBus *bus)
 
 static uint8_t *aspeed_2600_i2c_bus_pool_base(AspeedI2CBus *bus)
 {
-   return &bus->controller->pool[bus->id * 0x20];
+   return &bus->controller->share_pool[bus->id * 0x20];
 }
 
 static void aspeed_2600_i2c_class_init(ObjectClass *klass, void *data)
-- 
2.45.2

