Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp401792lfq;
        Fri, 8 Apr 2022 07:42:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0eEMETlgmR/oN2u8kyidNvcIeGk09HKxlaVjJrpn0VKLLjR26QSX+iVCyhvrhE/mx03Zp
X-Received: by 2002:a05:6902:1109:b0:63d:caf3:73b5 with SMTP id o9-20020a056902110900b0063dcaf373b5mr14271172ybu.413.1649428970222;
        Fri, 08 Apr 2022 07:42:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649428970; cv=none;
        d=google.com; s=arc-20160816;
        b=IP7Kvkl9GZ9roaugtJRbKxbFxKxTx6EDUfcGxVDoJhPJd0ysimETKjJYD4ZZoZ2wit
         S9UX8R9E9FFUKT51YD+FL9MOdXLKjHKXNpyb9hkkATTPDn8div2mAVzF4TJyuHBofaUd
         ihhmV59fr3+4jifpL347/rXKDgmXyrDQ0oTthTikxy8CMrqximEElUtOmyBOXbgA7Sag
         pBIjm5SucJ2w25xAb9/quFSBu3FXJs1ZZfrc8tppE/onjdl60nsIvh+tHlaSQ1a1INRx
         YHU6XHJ5YKdxiQdTsll5CYJaniytUkQdFT5WPZBAgtYEUe3BTM2rsSnvnwOMrRS14ofg
         vMxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dkdiantr7+5+MkqtF+jpkZPTMHRoOYAGUVHwgCU5zUs=;
        b=c/3INaA/PV9Ow/RCrmV6aDBKzvezQBgGZEsuCiHpEeX9r2ZgYvQiAqD9LU2HLcl7qo
         IRbQwON1yg9fKCrHApT/fsZXD9BxgGjYKsRRuxJuk0f+Nt/lxWUvwLm8sflmUK0Z58EE
         PYpt+ZNBAr19mJ1VW6FZUjBt6OzB+1W5CiKOiKdAvtloB4ZqQGtMa8p3vvp/ObOT5tUy
         5FDcpIrUwVzGHuffu5t5g2Cb0HQB6p+aIFD36BLqAP5J+HGs3PTU5KbrBSFFro3e4qIl
         wvr1Nows1xwYl9LGNUDK7/XXN8UuNaW1sR2oWHEUIZhETebXk5nSm9FwL5r+YvG1d5CY
         S1zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=awDZuFVi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 18-20020a811712000000b002e5bb9dcb49si531204ywx.466.2022.04.08.07.42.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 07:42:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=awDZuFVi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncpp3-00038h-Jo
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 10:42:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPc-0007Qz-6a
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 10:16:32 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:52938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPa-0002UJ-B7
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 10:16:31 -0400
Received: by mail-wm1-x336.google.com with SMTP id r7so5581832wmq.2
 for <qemu-arm@nongnu.org>; Fri, 08 Apr 2022 07:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dkdiantr7+5+MkqtF+jpkZPTMHRoOYAGUVHwgCU5zUs=;
 b=awDZuFViW4CzES0ipTulLrOFw5PZHjsIpQ8/O5kqBzCUjYLhz3EtP9oPtibVtZ+y8h
 Nc0vychcetchJio0VczJF9flW+jEfQCKQkr4ywJqsmgEd+aiCGDPRf1Rc0U6EbMGxFq4
 JaBf7YxEmYy0gj01ld2wLQK0cVtJR/ogN8SkPpsgfv0CL3cwKQnY64o9PhJeGX2H5Za/
 XnkpICuZueXeS/RCyD4DxTodojzo+fRoTitsI7O6qLTEmnS6q0JQgC02YE5X83qcnZgS
 OtBXo5tUYtt3xoiF8k1osau/OvdJricHKTd/Gd1YQWSJ12xR7BkKXA8RX25izOgqThMg
 GzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dkdiantr7+5+MkqtF+jpkZPTMHRoOYAGUVHwgCU5zUs=;
 b=b8Z1TeJDghBy1oESnq27L9KmnOM4Si3+0qkdlTBgAoLGYAOx0K1HvjLZRXMthYazfa
 W2o6hxAQL7U64epPaa9sJlYPBA8SIETA3POW5A0Jx80b8T9a2Wa08VGWuZ21GJaVmfeM
 VSS1zPZhFToR38fXslC3ikd/m8MZFOS2RjoUzCqdj6MYq1GwAH/WikSk/mBAANaMYIMU
 U27YbJ+v0Rj41WZlXD3L+BZpx8e3HLazW37IsT+2pl7x5jMNLvL5ZQVsii2ZXzf0op1o
 6Jebg6djwE84uupOd+P0nR3e46chAiWQVQPQk90xdnUkDFPUpdNWREPgHu7ZE7BsJJK1
 wGjw==
X-Gm-Message-State: AOAM531jE8Hq+zcprvVRNbm4Au1E17VLz0feMCA8BZwaOyp4CwxsLwNB
 IqugiLxQ/+0SEr/MtyvqT+HexvwpZMMYRw==
X-Received: by 2002:a1c:7517:0:b0:38c:8722:9bc6 with SMTP id
 o23-20020a1c7517000000b0038c87229bc6mr17170265wmc.2.1649427389031; 
 Fri, 08 Apr 2022 07:16:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 39/41] hw/arm/virt: Use VIRT_GIC_VERSION_* enum values in
 create_gic()
Date: Fri,  8 Apr 2022 15:15:48 +0100
Message-Id: <20220408141550.1271295-40-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ccoP64PGs7LM

Everywhere we need to check which GIC version we're using, we look at
vms->gic_version and use the VIRT_GIC_VERSION_* enum values, except
in create_gic(), which copies vms->gic_version into a local 'int'
variable and makes direct comparisons against values 2 and 3.

For consistency, change this function to check the GIC version
the same way we do elsewhere. This includes not implicitly relying
on the enumeration type values happening to match the integer
'revision' values the GIC device object wants.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index d2e5ecd234a..594a3d0660a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -690,14 +690,29 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
     /* We create a standalone GIC */
     SysBusDevice *gicbusdev;
     const char *gictype;
-    int type = vms->gic_version, i;
+    int i;
     unsigned int smp_cpus = ms->smp.cpus;
     uint32_t nb_redist_regions = 0;
+    int revision;
 
-    gictype = (type == 3) ? gicv3_class_name() : gic_class_name();
+    if (vms->gic_version == VIRT_GIC_VERSION_2) {
+        gictype = gic_class_name();
+    } else {
+        gictype = gicv3_class_name();
+    }
 
+    switch (vms->gic_version) {
+    case VIRT_GIC_VERSION_2:
+        revision = 2;
+        break;
+    case VIRT_GIC_VERSION_3:
+        revision = 3;
+        break;
+    default:
+        g_assert_not_reached();
+    }
     vms->gic = qdev_new(gictype);
-    qdev_prop_set_uint32(vms->gic, "revision", type);
+    qdev_prop_set_uint32(vms->gic, "revision", revision);
     qdev_prop_set_uint32(vms->gic, "num-cpu", smp_cpus);
     /* Note that the num-irq property counts both internal and external
      * interrupts; there are always 32 of the former (mandated by GIC spec).
@@ -707,7 +722,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
         qdev_prop_set_bit(vms->gic, "has-security-extensions", vms->secure);
     }
 
-    if (type == 3) {
+    if (vms->gic_version == VIRT_GIC_VERSION_3) {
         uint32_t redist0_capacity =
                     vms->memmap[VIRT_GIC_REDIST].size / GICV3_REDIST_SIZE;
         uint32_t redist0_count = MIN(smp_cpus, redist0_capacity);
@@ -742,7 +757,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
     gicbusdev = SYS_BUS_DEVICE(vms->gic);
     sysbus_realize_and_unref(gicbusdev, &error_fatal);
     sysbus_mmio_map(gicbusdev, 0, vms->memmap[VIRT_GIC_DIST].base);
-    if (type == 3) {
+    if (vms->gic_version == VIRT_GIC_VERSION_3) {
         sysbus_mmio_map(gicbusdev, 1, vms->memmap[VIRT_GIC_REDIST].base);
         if (nb_redist_regions == 2) {
             sysbus_mmio_map(gicbusdev, 2,
@@ -780,7 +795,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
                                                    ppibase + timer_irq[irq]));
         }
 
-        if (type == 3) {
+        if (vms->gic_version == VIRT_GIC_VERSION_3) {
             qemu_irq irq = qdev_get_gpio_in(vms->gic,
                                             ppibase + ARCH_GIC_MAINT_IRQ);
             qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt",
@@ -806,9 +821,9 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
 
     fdt_add_gic_node(vms);
 
-    if (type == 3 && vms->its) {
+    if (vms->gic_version == VIRT_GIC_VERSION_3 && vms->its) {
         create_its(vms);
-    } else if (type == 2) {
+    } else if (vms->gic_version == VIRT_GIC_VERSION_2) {
         create_v2m(vms);
     }
 }
-- 
2.25.1

