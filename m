Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A1A8C9830C
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Sep 2026 13:32:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9Mxs-0001IU-Ov; Wed, 23 Sep 2026 09:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9Mtp-00023F-5L
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 09:20:48 -0400
Received: from mail-dl2-x0c.google.com ([2607:f8b0:4864:38::c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9Mtn-0007PW-9Z
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 09:20:36 -0400
Received: by mail-dl2-x0c.google.com with SMTP id
 a92af1059eb24-142dd04be84so991715c88.3
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 06:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790169633; x=1790774433; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=yfDI7d67qBZp7NF6DoFzOD4nojzBBuGOhVVy0hvKz60=;
 b=H1Dz4ZC7GT+5VJ3f4zZ/2YA2dVIXHRYrxdWMOO3lIUfr2Dn2w9jTKYBMB4n/nyMKgf
 MqD+SKRjxHu7CsbW50yDRJYCwaIIDXgntd27Xc+nIS2pGg30v+CK/0kVvGOkGFRLSr1k
 YSLhQIUZ0bf47uYi6RmDZqQxKBL+Sqoer6SCSSK+wob9HJAE70cyabd0RIvBYqGsyNwK
 X43vH8U2R3aHWE2n7xucgg+hiIf6OYMnubG7xPxEwReH0TfgMMgPmhQaczn4NXUpxYZ5
 kK6PMPcBGyNl8vdpqM0/3gDYo5EnhSvPJ74b0Nzs7AmxgJ3oG5iFUWt2VkOXAVOGP9+7
 JSyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790169633; x=1790774433;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=yfDI7d67qBZp7NF6DoFzOD4nojzBBuGOhVVy0hvKz60=;
 b=qBJSecQ6dr5r0uFMC6SoTqXsHHNwyOW+g09wXeqtDOzrXKootMjuEyq06xYschXcPT
 ZjnQsQptVAchkLQMi9XReK/B8zciMTFTgsKc/wWWYU6VMy9GzIPvqu1W0RWdFlkYt6Fp
 vL9tqQpgUchBBQMkN2sBgkc+//oJFQYZttO3EufASRkpibZhU2x18pbgI3mr7f/Bm9B1
 dYxpZ3OYH4qeSHdpK2Bihpp3p9FfGxmPEkkLvRgZfAy5F1PyjAH4fVW6CA+bjIgbrGFZ
 Z0eNXv0k4MTaiVYiwrDNbYX2qTblS69f5+fJbMrmdhCvI8Hj8RaKADHVnzobzuzq2MPF
 fdaA==
X-Forwarded-Encrypted: i=1;
 AKwUvByAqb18AbbMQupMG8JPuoIYjAJogiCrblK1CT3SCn35gW3/ll/2cnPcpZcCX8eZ7YYH2TOy9dTuHQ==@nongnu.org
X-Gm-Message-State: AFuF++k45G6vlIUbyFr9EHw/L2zdJ4qRFMTAmOhbQnHdn9IeWETx4R9c
 2bgILly520eFEeN5ArJ7CzmXExkhwF43GiP3DSUEihHHAxQAwwTOz4ay
X-Gm-Gg: AYBFou1weDiu0qZYDunWMww+Nhw7EMqYhyR1EZCxZ6EiJaYa/YPzWqcWiRQUqW+JVhX
 5BQ1fm1M9EcKY2GZESAdV4yBxK7s+uQSVGoGtvHgbbA8/wdXaFlxEINsRqmb/2viahvyzVJaUdF
 A7GvnEFe1WQ66c4XkaYcW3aG8BVAd8RMaGCMaAssFraKXigR1wz/omhEBp1YDYEB5Up7tJ8JZU8
 aOAaf1MwJBUNlRPS8O8CzyP4Hpbbn4gGqj0/CqlrY9z13X30ZOJNljI7z9Z7X+NfDjS2hT6P+N5
 w9rfjW7J/IWRw6iB6uTzMdiSdyAAKhD0FBWcba6sfChQPqstR31F79x/Zmg2EzWVu44pkeSGtzd
 rJqp+z8rXwied+937mfxOjfBmNj1aXhHs70UHAgki5YIQQ33FbxsKQcZbUL8yn0ht6EAEtwClZy
 XMXbhTgn512RDenxVVpZFYdiKF6RBJRJFAYzY9f/81Kwc72Xpze4Tu9IpWGO1e8MzqVs22B8VMd
 YPK+8nOcEB7/anhD1asFFDAS3RmFG2UqWupI0jjKA==
X-Received: by 2002:a05:7022:3f81:b0:144:c113:77bb with SMTP id
 a92af1059eb24-144f9179520mr3177544c88.26.1790169632575; 
 Wed, 23 Sep 2026 06:20:32 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:20:31 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, xen-devel@lists.xenproject.org,
 Chao Liu <chao.liu@processmission.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Peter Xu <peterx@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Fabiano Rosas <farosas@suse.de>, Xianglai Li <lixianglai@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bibo Mao <maobibo@loongson.cn>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 David Hildenbrand <david@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 kvm@vger.kernel.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Song Gao <17746591750@163.com>, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Brian Cain <brian.cain@oss.qualcomm.com>
Subject: [PATCH v3 021/114] hw/arm/virt: prefix ACPI helpers with arm_virt_
Date: Wed, 23 Sep 2026 21:14:55 +0800
Message-ID: <20260923131635.1894-22-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::c;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl2-x0c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

- virt_acpi_setup and virt_is_acpi_enabled are generic names also used
  by RISC-V and LoongArch virt. A combined binary cannot export two
  functions with the same C symbol.
- Rename the ARM helpers to arm_virt_acpi_setup and
  arm_virt_is_acpi_enabled. Leave the trace event virt_acpi_setup
  unchanged; it is a separate identifier.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/arm/virt-acpi-build.c |  4 ++--
 hw/arm/virt.c            | 12 ++++++------
 include/hw/arm/virt.h    |  4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index d368913e766..5737c3a8fa4 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -1559,7 +1559,7 @@ static const VMStateDescription vmstate_virt_acpi_build = {
     },
 };
 
-void virt_acpi_setup(VirtMachineState *vms)
+void arm_virt_acpi_setup(VirtMachineState *vms)
 {
     AcpiBuildTables tables;
     AcpiBuildState *build_state;
@@ -1570,7 +1570,7 @@ void virt_acpi_setup(VirtMachineState *vms)
         return;
     }
 
-    if (!virt_is_acpi_enabled(vms)) {
+    if (!arm_virt_is_acpi_enabled(vms)) {
         trace_virt_acpi_setup();
         return;
     }
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index c8ffa1ceaf4..331fae883c7 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -769,7 +769,7 @@ static void fdt_add_cpu_nodes(VirtMachineState *vms)
                     &bottom_node,
                     CPU_TOPOLOGY_LEVEL_SOCKET);
             if (cache_at_topo_level) {
-                if (bottom_node == 1 && !virt_is_acpi_enabled(vms))
+                if (bottom_node == 1 && !arm_virt_is_acpi_enabled(vms))
                     error_setg(
                         &error_fatal,
                         "Cannot share L1 at socket_id %d."
@@ -809,7 +809,7 @@ static void fdt_add_cpu_nodes(VirtMachineState *vms)
                                                         top_cluster,
                                                         bottom_cluster, cpu,
                                                         &cluster_offset);
-                if (bottom_cluster == 1 && !virt_is_acpi_enabled(vms)) {
+                if (bottom_cluster == 1 && !arm_virt_is_acpi_enabled(vms)) {
                     error_setg(&error_fatal,
                         "Cannot share L1 at socket_id %d, cluster_id %d. "
                         "DT limitation on sharing at cache level = 1.",
@@ -2036,7 +2036,7 @@ static void create_smmuv3_dev_dtb(VirtMachineState *vms, DeviceState *dev,
     hwaddr base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
     MachineState *ms = MACHINE(vms);
 
-    if (!(vms->bootinfo.firmware_loaded && virt_is_acpi_enabled(vms))) {
+    if (!(vms->bootinfo.firmware_loaded && arm_virt_is_acpi_enabled(vms))) {
         if (object_property_get_bool(OBJECT(dev), "accel", &error_abort)) {
             error_setg(errp, "SMMUv3 with accel=on not supported for DT");
             return;
@@ -2446,7 +2446,7 @@ void virt_machine_done(Notifier *notifier, void *data)
     pci_bus_add_fw_cfg_extra_pci_roots(vms->fw_cfg, vms->bus,
                                        &error_abort);
 
-    virt_acpi_setup(vms);
+    arm_virt_acpi_setup(vms);
     virt_build_smbios(vms);
 }
 
@@ -3210,7 +3210,7 @@ static void machvirt_init(MachineState *machine)
     create_pcie(vms);
     create_cxl_host_reg_region(vms);
 
-    if (aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
+    if (aarch64 && firmware_loaded && arm_virt_is_acpi_enabled(vms)) {
         vms->acpi_dev = create_acpi_ged(vms);
         vms->generic_error_notifier.notify = virt_generic_error_req;
         notifier_list_add(&acpi_generic_error_notifiers,
@@ -3560,7 +3560,7 @@ static void virt_set_oem_table_id(Object *obj, const char *value,
 }
 
 
-bool virt_is_acpi_enabled(const VirtMachineState *vms)
+bool arm_virt_is_acpi_enabled(const VirtMachineState *vms)
 {
     if (vms->acpi == ON_OFF_AUTO_OFF) {
         return false;
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 383ee320948..2ee61cc5a06 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -218,8 +218,8 @@ struct VirtMachineState {
 #define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("arm-virt")
 OBJECT_DECLARE_TYPE(VirtMachineState, VirtMachineClass, VIRT_MACHINE)
 
-void virt_acpi_setup(VirtMachineState *vms);
-bool virt_is_acpi_enabled(const VirtMachineState *vms);
+void arm_virt_acpi_setup(VirtMachineState *vms);
+bool arm_virt_is_acpi_enabled(const VirtMachineState *vms);
 
 #define CLIDR_CTYPE_NO_CACHE 0x00
 #define CLIDR_CTYPE_I_CACHE 0x01
-- 
2.52.0.windows.1


