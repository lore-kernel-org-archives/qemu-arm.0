Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2101534ejb;
        Mon, 20 Feb 2023 01:18:19 -0800 (PST)
X-Google-Smtp-Source: AK7set+NtyriJaWVC7M4HFhIg+eGneO+3NjU6a1aCgWRb6VM//YDsIDcWSjzAPHQkgGG8MJEmK5P
X-Received: by 2002:a05:6214:d89:b0:56c:21d3:3f9c with SMTP id e9-20020a0562140d8900b0056c21d33f9cmr2981168qve.47.1676884699383;
        Mon, 20 Feb 2023 01:18:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676884699; cv=none;
        d=google.com; s=arc-20160816;
        b=iem8MiDPVVdPlBPlykNMG/Mn9h51l115FJS4qgU7XaUCZ9zuzHq4SFEo3ulUOn8s1e
         d4nZz+aZQljH7TTZrrz/jgCXRwb1W4p05otfRB2Ks6rs/pX4xD65WbxX3j0ZOX3k+4j9
         FkMSurO7asYLnyCuXqicPyT28jxUbtNxwRyMMBxY47/5rVVsv0KZNTgmyX0V4CPKF0F7
         yb7EsjMN70lMkGYWSaTr51LAeRK2mxLJduoCX+8LKde4pIvosorH3a5tA8DUlxcIP9X/
         feI64X4P9FBmVyuQXKGxmadzNUtK2+Ypovavvmywxqul3D150iYoLh8Q33i6dY5c3LRj
         BNEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tVwFPC8/Cym1VDjogehpU1u1QuWz7q979OWiyNkc7u4=;
        b=F/Mb11XSHpiaZ6ZH06yQGosyN2jgNEgvK0TpgMUWjTevNmulLbDoap3StcQSDJxqgD
         3U2J772WwIwCb65g/Ns1bPxikIQ8JnEjKmdCt44OgwpYS5EUrXD6EP0W00Y4ST9kvyMy
         DvLNx31bc5gGy4ZLqtb9X8je+z+0d6W8nqR1RyvFgTUQJE/KjbiNW6dz6/HpqQbKkrOW
         bTzVAwU9YblyYnTERdY7t5eyw5Wx9tG+HILzeWpFvFdqE3H68X3/VCobvU5rQwAbqPvq
         7XfTK5vPXWH8/dbgW7wz+V484mjZMhNZx74KAsoNe/81Yb/7Q7U+2QFCfUKjacg2ASNa
         5XRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ixQoK3vR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c7-20020a0cca07000000b0056ebc773032si9089026qvk.73.2023.02.20.01.18.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 01:18:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ixQoK3vR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pU2FZ-0005aa-JF; Mon, 20 Feb 2023 04:14:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2FT-0005Yh-7G
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 04:14:16 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2FP-0003kI-TC
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 04:14:13 -0500
Received: by mail-wr1-x434.google.com with SMTP id c12so334747wrw.1
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 01:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tVwFPC8/Cym1VDjogehpU1u1QuWz7q979OWiyNkc7u4=;
 b=ixQoK3vRNaLvZtGNYpq6vHbDKkGj/0dNxU6uYwWZvItEbg6p9W3FTZXmoDwwoAFFUn
 jtbbkgjQRIcynPUQSdZT8oN8QzGxTuamy9z37kOpC8+iHtgNpRqvXlxFG77Hl+lITss2
 p330O5RlMIKwt6Akg0Y08+gtBaDn6TxtoyjqadVVA++h50YytsfFCXITKc4mWbpuJ5fj
 UrwXJcLt/DFwk0Zg1SqwaQ7CIkTWfUIE4pPMpwGYhX7l4EqxdSiay8MAAv4MT7fSLVOa
 0/je56tDs4DBt6hvjrabCPxE8W1Ub6O26DiHD7Ppfkxt0TLjqPWuHw/lz/GRCaqKo964
 WTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tVwFPC8/Cym1VDjogehpU1u1QuWz7q979OWiyNkc7u4=;
 b=B+KsafXAYcpCymG414u5J0/pKEcb6RCYiE/PAP24uZ3fgaNedRrsP/MBo/idajBrWi
 /iSIoFWIJ/LbzSXunw9ahwV/IuclcFS41f8flWOXKSRTgcJ4FYbZx5FjOkybOSb1Uwqg
 1GcErNQgWl6GOKrjApz4pcSJ3jkOkPU6/ZSsSMRSGpXXH47bc2Mq2twnIutVDgCdzOem
 gjw3Xb9xfzLSuDDELp1Oe4HB19kmO6AnDfJmavxTGqoBK/8LSddO7eXzwwWiXxhoz3Sh
 llnLnNawVtIlxcHiFryS6Qab+LApUG9NOBnbCyMw1b7btuyczdos/rW9cx9aoeGyijrM
 YH+w==
X-Gm-Message-State: AO0yUKWVY1pJ6nL88UzGd1+F2dPBu5aFgddIM8qSf7x5UNNh0nVWoVKb
 E8fCCbczD745/a7kgBWqjI6/8Q==
X-Received: by 2002:adf:dd86:0:b0:2c5:a370:df65 with SMTP id
 x6-20020adfdd86000000b002c5a370df65mr528344wrl.10.1676884450408; 
 Mon, 20 Feb 2023 01:14:10 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a5d67c3000000b002c59f186739sm1919995wrw.23.2023.02.20.01.14.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 01:14:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 02/24] hw/ide/mmio: Use CamelCase for MMIO_IDE state name
Date: Mon, 20 Feb 2023 10:13:36 +0100
Message-Id: <20230220091358.17038-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220091358.17038-1-philmd@linaro.org>
References: <20230220091358.17038-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: PL9Q0jPFJKNT

Following docs/devel/style.rst guidelines, rename MMIOIDEState
as MmioIdeState.

Having the structure name and its typedef named equally,
we can manually convert from the old DECLARE_INSTANCE_CHECKER()
macro to the more recent OBJECT_DECLARE_SIMPLE_TYPE().

Note, due to that name mismatch, this macro wasn't automatically
converted during commit 8063396bf3 ("Use OBJECT_DECLARE_SIMPLE_TYPE
when possible").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/mmio.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/hw/ide/mmio.c b/hw/ide/mmio.c
index fb2ebd4847..c33d42437f 100644
--- a/hw/ide/mmio.c
+++ b/hw/ide/mmio.c
@@ -40,11 +40,9 @@
  */
 
 #define TYPE_MMIO_IDE "mmio-ide"
-typedef struct MMIOIDEState MMIOState;
-DECLARE_INSTANCE_CHECKER(MMIOState, MMIO_IDE,
-                         TYPE_MMIO_IDE)
+OBJECT_DECLARE_SIMPLE_TYPE(MmioIdeState, MMIO_IDE)
 
-struct MMIOIDEState {
+struct MmioIdeState {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -58,7 +56,7 @@ struct MMIOIDEState {
 
 static void mmio_ide_reset(DeviceState *dev)
 {
-    MMIOState *s = MMIO_IDE(dev);
+    MmioIdeState *s = MMIO_IDE(dev);
 
     ide_bus_reset(&s->bus);
 }
@@ -66,7 +64,7 @@ static void mmio_ide_reset(DeviceState *dev)
 static uint64_t mmio_ide_read(void *opaque, hwaddr addr,
                               unsigned size)
 {
-    MMIOState *s = opaque;
+    MmioIdeState *s = opaque;
     addr >>= s->shift;
     if (addr & 7)
         return ide_ioport_read(&s->bus, addr);
@@ -77,7 +75,7 @@ static uint64_t mmio_ide_read(void *opaque, hwaddr addr,
 static void mmio_ide_write(void *opaque, hwaddr addr,
                            uint64_t val, unsigned size)
 {
-    MMIOState *s = opaque;
+    MmioIdeState *s = opaque;
     addr >>= s->shift;
     if (addr & 7)
         ide_ioport_write(&s->bus, addr, val);
@@ -94,14 +92,14 @@ static const MemoryRegionOps mmio_ide_ops = {
 static uint64_t mmio_ide_status_read(void *opaque, hwaddr addr,
                                      unsigned size)
 {
-    MMIOState *s= opaque;
+    MmioIdeState *s= opaque;
     return ide_status_read(&s->bus, 0);
 }
 
 static void mmio_ide_ctrl_write(void *opaque, hwaddr addr,
                                 uint64_t val, unsigned size)
 {
-    MMIOState *s = opaque;
+    MmioIdeState *s = opaque;
     ide_ctrl_write(&s->bus, 0, val);
 }
 
@@ -116,8 +114,8 @@ static const VMStateDescription vmstate_ide_mmio = {
     .version_id = 3,
     .minimum_version_id = 0,
     .fields = (VMStateField[]) {
-        VMSTATE_IDE_BUS(bus, MMIOState),
-        VMSTATE_IDE_DRIVES(bus.ifs, MMIOState),
+        VMSTATE_IDE_BUS(bus, MmioIdeState),
+        VMSTATE_IDE_DRIVES(bus.ifs, MmioIdeState),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -125,7 +123,7 @@ static const VMStateDescription vmstate_ide_mmio = {
 static void mmio_ide_realizefn(DeviceState *dev, Error **errp)
 {
     SysBusDevice *d = SYS_BUS_DEVICE(dev);
-    MMIOState *s = MMIO_IDE(dev);
+    MmioIdeState *s = MMIO_IDE(dev);
 
     ide_init2(&s->bus, s->irq);
 
@@ -140,14 +138,14 @@ static void mmio_ide_realizefn(DeviceState *dev, Error **errp)
 static void mmio_ide_initfn(Object *obj)
 {
     SysBusDevice *d = SYS_BUS_DEVICE(obj);
-    MMIOState *s = MMIO_IDE(obj);
+    MmioIdeState *s = MMIO_IDE(obj);
 
     ide_bus_init(&s->bus, sizeof(s->bus), DEVICE(obj), 0, 2);
     sysbus_init_irq(d, &s->irq);
 }
 
 static Property mmio_ide_properties[] = {
-    DEFINE_PROP_UINT32("shift", MMIOState, shift, 0),
+    DEFINE_PROP_UINT32("shift", MmioIdeState, shift, 0),
     DEFINE_PROP_END_OF_LIST()
 };
 
@@ -164,7 +162,7 @@ static void mmio_ide_class_init(ObjectClass *oc, void *data)
 static const TypeInfo mmio_ide_type_info = {
     .name = TYPE_MMIO_IDE,
     .parent = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(MMIOState),
+    .instance_size = sizeof(MmioIdeState),
     .instance_init = mmio_ide_initfn,
     .class_init = mmio_ide_class_init,
 };
@@ -176,7 +174,7 @@ static void mmio_ide_register_types(void)
 
 void mmio_ide_init_drives(DeviceState *dev, DriveInfo *hd0, DriveInfo *hd1)
 {
-    MMIOState *s = MMIO_IDE(dev);
+    MmioIdeState *s = MMIO_IDE(dev);
 
     if (hd0 != NULL) {
         ide_create_drive(&s->bus, 0, hd0);
-- 
2.38.1

