Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CEC1D232C6
	for <qemu-arm@archiver.kernel.org>; Thu,  8 Jan 2026 23:05:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vdz3L-00079K-DP; Thu, 08 Jan 2026 18:04:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <csomani@redhat.com>)
 id 1vdz3K-00078y-Dw
 for qemu-arm@nongnu.org; Thu, 08 Jan 2026 18:04:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <csomani@redhat.com>)
 id 1vdz3C-0003Ti-HU
 for qemu-arm@nongnu.org; Thu, 08 Jan 2026 18:04:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767913457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=28C1ctKTrEVdRzLWw7bIF8SA92UWDtU9p/oPvVwMmW8=;
 b=UtHWKUdPi2xs6Pbtvl5pESHQXNM1Pv0ROmXgUKr7Txs3GQvWMOqg9r8svhdbLffmZNrPXm
 KAfOefd0PTDapMoXekMSrfkyW3yNovQyCwYFmQ4VGPk69wUDPns/O+kUuJcq/HOpnnv0IV
 6L0chTHi8YQ5bECJcXIGjjjqLht7NlA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-5CzEGELfPmSBB1KvPW_jmw-1; Thu, 08 Jan 2026 18:04:16 -0500
X-MC-Unique: 5CzEGELfPmSBB1KvPW_jmw-1
X-Mimecast-MFC-AGG-ID: 5CzEGELfPmSBB1KvPW_jmw_1767913456
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b2f0be2cf0so685252785a.0
 for <qemu-arm@nongnu.org>; Thu, 08 Jan 2026 15:04:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767913456; x=1768518256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=28C1ctKTrEVdRzLWw7bIF8SA92UWDtU9p/oPvVwMmW8=;
 b=m7VkL2q+HkoKqeici06ka4iVP/HA68Soe6dg9N8svlqWpfRYFWqQ6fmn6zZIBKMGWU
 3ClmXi+aobNU50LavHjuj5ew0bwkQwEKRVeSRCx67gz20/3g7LmuSilsNfrt3DhIgRxa
 UbflLkM1p5RNwj1pk0y6XaX3pP/swUCrm21dh9o4u0Mh+AbkxMI9wKWKLxCCk1tvM9xO
 qmt4r5CeGDeYVQLWEEV/3q6OYYCo7+j5URHrGlkLwDtHFvL0ZcxDtMvq34TZkDyhhhN3
 jmRXGfpliM05kQpHzpo/rXB+EmlPFdMJuVZf8KSRIUu5BdAUD4fHWzVduzvCWtUdhHsP
 UFLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNXqUkFlnTc+nAjzSEY7+keU52qTFhzSd7bBWgMHPSTh6GBEwU0ytfBuVR8G5ZH8VenbqvPwM+fA==@nongnu.org
X-Gm-Message-State: AOJu0YymER17Y1+mv6VZOADcCgJMvv9TIeth5JMKL9sSzP+QuELsd98G
 u12dIoDapXJtVt4/3sNBGWcMf6iEPUVBc5535Rk2vXVHeH1Wt3FDF857W+5FmpVzuwTkYaA/iw9
 I1gppdAWMNgpXq89qcVJy8U67ec7qjYlEDyCjS1eetNfTkW9qip1H5w==
X-Gm-Gg: AY/fxX7kOaFnhlpHtnBnheq+DzZeD3wdSKon2A0PdI8dr4zne4tXlMRXDGhBLBsllh/
 uKdikKQK2mtVwTo1FGicFeVupx/Az9myXuRCwS18G7+Q/m4gu8PohFGQy7zecazLLWMNyxeYViI
 p5CxDw4IC8vscD2kQcgWyIITqtppJZhVd72md1U5rYoUsEI6XzoFI5gf8h5Vho+v5Hw9/9ReiGq
 PqWPjILTSb1TfWz+UerY/SSoOiPhGuguWWHwsNJR1q4qSmpkXSdghIKAyVbGkPWoR/83vGUOK31
 G4gDaCMksbUTzCB8Ui5npLpg8WRdFzH8EaRaJC4aNiUbD7Uex5t2M8x34VoIZ7Eo0beCmqK7Ra/
 g0p/I26elRZKu/wvfmDrlL47Yx1FfXrFhvwHLzUg=
X-Received: by 2002:a05:620a:4089:b0:8b2:e15c:be60 with SMTP id
 af79cd13be357-8c389429edfmr1151528785a.88.1767913455806; 
 Thu, 08 Jan 2026 15:04:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEzpr1GQrEXWuyPIlt8GSQ6kEPhcXsingypDfUp1NZHGB0W62CWYumbHQlhlvJEYDaJL12rg==
X-Received: by 2002:a05:620a:4089:b0:8b2:e15c:be60 with SMTP id
 af79cd13be357-8c389429edfmr1151524285a.88.1767913455391; 
 Thu, 08 Jan 2026 15:04:15 -0800 (PST)
Received: from csomani-thinkpadp1gen7.rmtusca.csb ([47.153.136.179])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c37f51b787sm680000685a.29.2026.01.08.15.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 15:04:15 -0800 (PST)
From: Chandan Somani <csomani@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, marcandre.lureau@gmail.com,
 Chandan Somani <csomani@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <yoshinori.sato@nifty.com>, Jiri Pirko <jiri@resnulli.us>,
 Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-block@nongnu.org (open list:Block layer core),
 qemu-arm@nongnu.org (open list:Stellaris)
Subject: [PATCH v2 1/5] qdev: Free property array on release
Date: Thu,  8 Jan 2026 15:03:07 -0800
Message-ID: <20260108230311.584141-2-csomani@redhat.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260108230311.584141-1-csomani@redhat.com>
References: <20260108230311.584141-1-csomani@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5DvhBWtm0OIR4HiZ0YLByBlH90jusGD9U1_zySFp3m8_1767913456
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=csomani@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Before this patch, users of the property array would free the
array themselves in their cleanup functions. This causes
inconsistencies where some users leak the array and some free them.

This patch makes it so that the property array's release function
frees the property array (instead of just its elements). It fixes any
leaks and requires less code.

DEFINE_PROP_ARRAY leakers that are fixed in this patch:
ebpf-rss_fds in hw/net/virtio-net.c
rnmi_irqvec, rnmi_excpvec in hw/riscv/riscv_hart.c
common.display_modes in hw/display/apple-gfx-mmio.m
common.display_modes in hw/display/apple-gfx-pci.m

Signed-off-by: Chandan Somani <csomani@redhat.com>
---
 block/accounting.c                |  1 -
 hw/core/qdev-properties.c         | 21 ++++++++++-----------
 hw/input/stellaris_gamepad.c      |  8 --------
 hw/intc/arm_gicv3_common.c        |  8 --------
 hw/intc/rx_icu.c                  |  8 --------
 hw/misc/arm_sysctl.c              |  2 --
 hw/misc/mps2-scc.c                |  8 --------
 hw/net/rocker/rocker.c            |  1 -
 hw/nvram/xlnx-efuse.c             |  8 --------
 hw/nvram/xlnx-versal-efuse-ctrl.c |  8 --------
 hw/virtio/virtio-iommu-pci.c      |  8 --------
 11 files changed, 10 insertions(+), 71 deletions(-)

diff --git a/block/accounting.c b/block/accounting.c
index 0933c61f3a..5cf51f029b 100644
--- a/block/accounting.c
+++ b/block/accounting.c
@@ -73,7 +73,6 @@ bool block_acct_setup(BlockAcctStats *stats, enum OnOffAuto account_invalid,
             }
             block_acct_add_interval(stats, stats_intervals[i]);
         }
-        g_free(stats_intervals);
     }
     return true;
 }
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 05489c8fbb..c8379fda9d 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -673,10 +673,8 @@ static Property array_elem_prop(Object *obj, const Property *parent_prop,
 
 /*
  * Object property release callback for array properties: We call the
- * underlying element's property release hook for each element.
- *
- * Note that it is the responsibility of the individual device's deinit
- * to free the array proper.
+ * underlying element's property release hook for each element and free the
+ * property array.
  */
 static void release_prop_array(Object *obj, const char *name, void *opaque)
 {
@@ -686,15 +684,16 @@ static void release_prop_array(Object *obj, const char *name, void *opaque)
     char *elem = *arrayptr;
     int i;
 
-    if (!prop->arrayinfo->release) {
-        return;
+    if (prop->arrayinfo->release) {
+        for (i = 0; i < *alenptr; i++) {
+            Property elem_prop = array_elem_prop(obj, prop, name, elem);
+            prop->arrayinfo->release(obj, NULL, &elem_prop);
+            elem += prop->arrayfieldsize;
+        }
     }
 
-    for (i = 0; i < *alenptr; i++) {
-        Property elem_prop = array_elem_prop(obj, prop, name, elem);
-        prop->arrayinfo->release(obj, NULL, &elem_prop);
-        elem += prop->arrayfieldsize;
-    }
+    g_clear_pointer(arrayptr, g_free);
+    *alenptr = 0;
 }
 
 /*
diff --git a/hw/input/stellaris_gamepad.c b/hw/input/stellaris_gamepad.c
index f64f5ea9ce..42d43f9af5 100644
--- a/hw/input/stellaris_gamepad.c
+++ b/hw/input/stellaris_gamepad.c
@@ -63,13 +63,6 @@ static void stellaris_gamepad_realize(DeviceState *dev, Error **errp)
     qemu_input_handler_register(dev, &stellaris_gamepad_handler);
 }
 
-static void stellaris_gamepad_finalize(Object *obj)
-{
-    StellarisGamepad *s = STELLARIS_GAMEPAD(obj);
-
-    g_free(s->keycodes);
-}
-
 static void stellaris_gamepad_reset_enter(Object *obj, ResetType type)
 {
     StellarisGamepad *s = STELLARIS_GAMEPAD(obj);
@@ -98,7 +91,6 @@ static const TypeInfo stellaris_gamepad_info[] = {
         .name = TYPE_STELLARIS_GAMEPAD,
         .parent = TYPE_SYS_BUS_DEVICE,
         .instance_size = sizeof(StellarisGamepad),
-        .instance_finalize = stellaris_gamepad_finalize,
         .class_init = stellaris_gamepad_class_init,
     },
 };
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 0a2e5a3e2f..e5f3c3c447 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -488,13 +488,6 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
     s->itslist = g_ptr_array_new();
 }
 
-static void arm_gicv3_finalize(Object *obj)
-{
-    GICv3State *s = ARM_GICV3_COMMON(obj);
-
-    g_free(s->redist_region_count);
-}
-
 static void arm_gicv3_common_reset_hold(Object *obj, ResetType type)
 {
     GICv3State *s = ARM_GICV3_COMMON(obj);
@@ -644,7 +637,6 @@ static const TypeInfo arm_gicv3_common_type = {
     .instance_size = sizeof(GICv3State),
     .class_size = sizeof(ARMGICv3CommonClass),
     .class_init = arm_gicv3_common_class_init,
-    .instance_finalize = arm_gicv3_finalize,
     .abstract = true,
     .interfaces = (const InterfaceInfo[]) {
         { TYPE_ARM_LINUX_BOOT_IF },
diff --git a/hw/intc/rx_icu.c b/hw/intc/rx_icu.c
index 87cdc6cbde..992b069ae2 100644
--- a/hw/intc/rx_icu.c
+++ b/hw/intc/rx_icu.c
@@ -334,13 +334,6 @@ static void rxicu_init(Object *obj)
     sysbus_init_irq(d, &icu->_swi);
 }
 
-static void rxicu_fini(Object *obj)
-{
-    RXICUState *icu = RX_ICU(obj);
-    g_free(icu->map);
-    g_free(icu->init_sense);
-}
-
 static const VMStateDescription vmstate_rxicu = {
     .name = "rx-icu",
     .version_id = 1,
@@ -382,7 +375,6 @@ static const TypeInfo rxicu_info = {
     .parent = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(RXICUState),
     .instance_init = rxicu_init,
-    .instance_finalize = rxicu_fini,
     .class_init = rxicu_class_init,
 };
 
diff --git a/hw/misc/arm_sysctl.c b/hw/misc/arm_sysctl.c
index 2a317ac7f5..7b320f89c1 100644
--- a/hw/misc/arm_sysctl.c
+++ b/hw/misc/arm_sysctl.c
@@ -618,9 +618,7 @@ static void arm_sysctl_finalize(Object *obj)
 {
     arm_sysctl_state *s = ARM_SYSCTL(obj);
 
-    g_free(s->db_voltage);
     g_free(s->db_clock);
-    g_free(s->db_clock_reset);
 }
 
 static const Property arm_sysctl_properties[] = {
diff --git a/hw/misc/mps2-scc.c b/hw/misc/mps2-scc.c
index 350bba3dab..7877b31479 100644
--- a/hw/misc/mps2-scc.c
+++ b/hw/misc/mps2-scc.c
@@ -405,13 +405,6 @@ static void mps2_scc_realize(DeviceState *dev, Error **errp)
     s->oscclk = g_new0(uint32_t, s->num_oscclk);
 }
 
-static void mps2_scc_finalize(Object *obj)
-{
-    MPS2SCC *s = MPS2_SCC(obj);
-
-    g_free(s->oscclk_reset);
-}
-
 static bool cfg7_needed(void *opaque)
 {
     MPS2SCC *s = opaque;
@@ -489,7 +482,6 @@ static const TypeInfo mps2_scc_info = {
     .parent = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(MPS2SCC),
     .instance_init = mps2_scc_init,
-    .instance_finalize = mps2_scc_finalize,
     .class_init = mps2_scc_class_init,
 };
 
diff --git a/hw/net/rocker/rocker.c b/hw/net/rocker/rocker.c
index 3eb7b44511..4a7056bd45 100644
--- a/hw/net/rocker/rocker.c
+++ b/hw/net/rocker/rocker.c
@@ -1429,7 +1429,6 @@ static void pci_rocker_uninit(PCIDevice *dev)
             world_free(r->worlds[i]);
         }
     }
-    g_free(r->fp_ports_peers);
 }
 
 static void rocker_reset(DeviceState *dev)
diff --git a/hw/nvram/xlnx-efuse.c b/hw/nvram/xlnx-efuse.c
index facbef3fc4..5531ffe550 100644
--- a/hw/nvram/xlnx-efuse.c
+++ b/hw/nvram/xlnx-efuse.c
@@ -224,13 +224,6 @@ static void efuse_realize(DeviceState *dev, Error **errp)
     }
 }
 
-static void efuse_finalize(Object *obj)
-{
-    XlnxEFuse *s = XLNX_EFUSE(obj);
-
-    g_free(s->ro_bits);
-}
-
 static void efuse_prop_set_drive(Object *obj, Visitor *v, const char *name,
                                  void *opaque, Error **errp)
 {
@@ -288,7 +281,6 @@ static const TypeInfo efuse_info = {
     .name          = TYPE_XLNX_EFUSE,
     .parent        = TYPE_DEVICE,
     .instance_size = sizeof(XlnxEFuse),
-    .instance_finalize = efuse_finalize,
     .class_init    = efuse_class_init,
 };
 
diff --git a/hw/nvram/xlnx-versal-efuse-ctrl.c b/hw/nvram/xlnx-versal-efuse-ctrl.c
index b7dc0e49e5..69acdfa304 100644
--- a/hw/nvram/xlnx-versal-efuse-ctrl.c
+++ b/hw/nvram/xlnx-versal-efuse-ctrl.c
@@ -724,13 +724,6 @@ static void efuse_ctrl_init(Object *obj)
     sysbus_init_irq(sbd, &s->irq_efuse_imr);
 }
 
-static void efuse_ctrl_finalize(Object *obj)
-{
-    XlnxVersalEFuseCtrl *s = XLNX_VERSAL_EFUSE_CTRL(obj);
-
-    g_free(s->extra_pg0_lock_spec);
-}
-
 static const VMStateDescription vmstate_efuse_ctrl = {
     .name = TYPE_XLNX_VERSAL_EFUSE_CTRL,
     .version_id = 1,
@@ -767,7 +760,6 @@ static const TypeInfo efuse_ctrl_info = {
     .instance_size = sizeof(XlnxVersalEFuseCtrl),
     .class_init    = efuse_ctrl_class_init,
     .instance_init = efuse_ctrl_init,
-    .instance_finalize = efuse_ctrl_finalize,
 };
 
 static void efuse_ctrl_register_types(void)
diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
index f5f6ce7359..7b5ffddc1e 100644
--- a/hw/virtio/virtio-iommu-pci.c
+++ b/hw/virtio/virtio-iommu-pci.c
@@ -94,18 +94,10 @@ static void virtio_iommu_pci_instance_init(Object *obj)
                                 TYPE_VIRTIO_IOMMU);
 }
 
-static void virtio_iommu_pci_instance_finalize(Object *obj)
-{
-    VirtIOIOMMUPCI *dev = VIRTIO_IOMMU_PCI(obj);
-
-    g_free(dev->vdev.prop_resv_regions);
-}
-
 static const VirtioPCIDeviceTypeInfo virtio_iommu_pci_info = {
     .generic_name  = TYPE_VIRTIO_IOMMU_PCI,
     .instance_size = sizeof(VirtIOIOMMUPCI),
     .instance_init = virtio_iommu_pci_instance_init,
-    .instance_finalize = virtio_iommu_pci_instance_finalize,
     .class_init    = virtio_iommu_pci_class_init,
 };
 
-- 
2.51.1


