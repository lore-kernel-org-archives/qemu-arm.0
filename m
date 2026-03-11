Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0426C1125839
	for <qemu-arm@archiver.kernel.org>; Wed, 11 Mar 2026 14:51:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w0KuG-0005rW-3J; Wed, 11 Mar 2026 10:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leonardi@redhat.com>)
 id 1w0JqV-00034Q-OE
 for qemu-arm@nongnu.org; Wed, 11 Mar 2026 09:43:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leonardi@redhat.com>)
 id 1w0JqT-00071o-DK
 for qemu-arm@nongnu.org; Wed, 11 Mar 2026 09:43:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773236607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9DLQCJfcLNIFBh1FAf44b3oNbNNiaQrckD7FruwOuK8=;
 b=izHkIYf3+Z+AfUnP5dARW6gwSriG+sU549qMO8cBnr4zxBJ3iB5eOjpsivZfmXynpjdhE/
 a6QiaBydEGGZM3jGFptyPVd6CGwSQO1n2KahxBu+wlzDa1DdBpY+E6E7sfGmgYbMfdheQH
 A+lJQX1hcwBFDqSA8vhWQcgXnLTotro=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-NFohPVmwPiiU2-JIjSlkkw-1; Wed, 11 Mar 2026 09:43:24 -0400
X-MC-Unique: NFohPVmwPiiU2-JIjSlkkw-1
X-Mimecast-MFC-AGG-ID: NFohPVmwPiiU2-JIjSlkkw_1773236603
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-439b20722e3so5826630f8f.0
 for <qemu-arm@nongnu.org>; Wed, 11 Mar 2026 06:43:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773236603; x=1773841403;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9DLQCJfcLNIFBh1FAf44b3oNbNNiaQrckD7FruwOuK8=;
 b=rjG4fbMmHeVC9ntR+7ocov5NA57xqNhCV7CFxlYmMw977MDAf+EMyeYoOWrl6UuqVw
 eJ/PnTclD6CFwSoY63IwhDTEODOdOPsLlsswAZAK6x3X6zb0MCkB54ByVMF06Ptk0Z6Z
 2lp3qRxwGgha9VIWqY0/uc9o7Ybva1wu1tlRODYmh4yqu4BEIblDU1syMYtIUXUL3ZLM
 spSwuEDJpbEYNs6R7qwumR+UgDt45PgqM+JRSEhBzSll0Q/qEideJ7G01mDFj1suMwfP
 +ATeZN8zQshW805xW3fdQL2SKFHhZvUgIqsin+wDtfPjpkXloPEQKH6KaUCQINu3vb7y
 Qa6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG2zFJ28DNDCs6S9ayb9ukx0xMchkUJkVCNZ8dW10zOXo7vvCSxn05aP2JEYVOt37yUVAzhyK3ZA==@nongnu.org
X-Gm-Message-State: AOJu0YyREgqCS+EN52rNyXmvfdzFKaI/EwB02XmM8qb81MvZrIqxfHAR
 kf61BwhxR1hjVK7gsU04DMAIChLLcF/sd78XEmOYkEOkI/va2XOjEVdbE0ZkxBY961JkOFyeFdG
 vh6il5rzL9RObP0BGD6QiZScfuQGL6bzJwjjbb7Xu9yj7QzJv44SosA==
X-Gm-Gg: ATEYQzwBuQB5lgGQ2lihckHRim7jaJW6kMVpP11xx5TnI+DJVqn3JMbeioZ0AVp9v4B
 HxScsnOAFJq/APSuhJ1HklTXCUqTU99P6MLI3dI9AGQnYVlsVpSsooCL3ci/H2nAt6BoIyGfk3Q
 sPDUbSawNlhadptw/c0WTLNpL0yrIEHqnZuvwsAeG/VPfxsJMiP2i6lGYsyMjLO3NubzPFAaQvj
 NyZ1x/9f8cUqObU1pEgjRpclTEdCjEvkZsxHMOIkjBpGAMItOeOWMpI/cfIq5eLs9bI8GIbfWOZ
 eKSre9tQwbWztd4e9xKvkZM2CCkE4rv1h9D5fFtAsp25AmGg9bbBicB4Zvc3Z+RJWOnvlzU543y
 eNsyjaEzOjcVAMYOeSEGbnURrd5F43I1FxLWD/MQqnF/Yeydv634GYpvzqxLK
X-Received: by 2002:a05:6000:200f:b0:439:c202:99aa with SMTP id
 ffacd0b85a97d-439f8222e99mr5261531f8f.38.1773236603050; 
 Wed, 11 Mar 2026 06:43:23 -0700 (PDT)
X-Received: by 2002:a05:6000:200f:b0:439:c202:99aa with SMTP id
 ffacd0b85a97d-439f8222e99mr5261475f8f.38.1773236602406; 
 Wed, 11 Mar 2026 06:43:22 -0700 (PDT)
Received: from lleonard-thinkpadx1carbongen13.rmtit.csb ([176.206.19.176])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fc0ba923sm1669167f8f.20.2026.03.11.06.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2026 06:43:22 -0700 (PDT)
From: Luigi Leonardi <leonardi@redhat.com>
Date: Wed, 11 Mar 2026 14:43:20 +0100
Subject: [PATCH] hw/arm/virt: add serial-debug-level property for EDK2 firmware
MIME-Version: 1.0
Message-Id: <20260311-edk2_arm_serial-v1-1-c25e237116f3@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0ND3dSUbKP4xKLceJDGxBzdVBMDIyOzVDNL09QkJaCugqLUtMwKsIn
 RsbW1APMn66NhAAAA
X-Change-ID: 20260311-edk2_arm_serial-e40226e695eb
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Oliver Steffen <osteffen@redhat.com>, qemu-arm@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, Luigi Leonardi <leonardi@redhat.com>
X-Mailer: b4 0.14.2
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nMI2lRUuULk2ceAHB4QzeDVCST1sKqO1eg-2t7dpHIo_1773236603
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leonardi@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.819, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.903,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 WEIRD_QUOTING=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 11 Mar 2026 10:51:27 -0400
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

Add a machine property to pass a debug level to EDK2 firmware via the
device tree. The value is set as an "edk2,debug-level" property on all
pl011 UART nodes.

This is to create a runtime parameter to set the verbosity of the debug
log on the serial ports in edk2. Currently, the only way to set the
verbosity is a compile-time option.

DT is used because the fw_cfg interface is not yet initialized in early
boot phases.

Corresponding edk2 PR: https://github.com/tianocore/edk2/pull/12277

Suggested-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Luigi Leonardi <leonardi@redhat.com>
---
 docs/system/arm/virt.rst |  6 ++++++
 hw/arm/virt.c            | 38 ++++++++++++++++++++++++++++++++++++++
 include/hw/arm/virt.h    |  2 ++
 3 files changed, 46 insertions(+)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index fbe3ca9e129db514aeb7b0bddd6432a818d0a09d..adba8fff2157b62957f6c8770de44faa8449b34d 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -239,6 +239,12 @@ x-oem-table-id
   Set string (up to 8 bytes) to override the default value of field OEM Table ID
   in ACPI table header.
 
+serial-debug-level
+  Set the EDK2 firmware debug level for serial port output. Valid values are
+  the debug level bitmasks defined in the EDK2
+  `DebugLib.h <https://github.com/tianocore/edk2/blob/master/MdePkg/Include/Library/DebugLib.h>`_
+  header (e.g. ``0x00400000`` for ``DEBUG_INFO``).
+
 SMMU configuration
 """"""""""""""""""
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7456614d0585af52662c4eb5bb9c4eb76e729a7b..bbea1bb84a4f7613195f5d3fac5fba31a0fb6e89 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -986,6 +986,11 @@ static void create_uart(const VirtMachineState *vms, int uart,
 
     nodename = g_strdup_printf("/pl011@%" PRIx64, base);
     qemu_fdt_add_subnode(ms->fdt, nodename);
+    if (vms->serial_debug_level_set) {
+        qemu_fdt_setprop_cell(ms->fdt, nodename, "edk2,debug-level",
+                              vms->serial_debug_level);
+    }
+
     /* Note that we can't use setprop_string because of the embedded NUL */
     qemu_fdt_setprop(ms->fdt, nodename, "compatible",
                          compat, sizeof(compat));
@@ -2869,6 +2874,31 @@ static void virt_set_dtb_randomness(Object *obj, bool value, Error **errp)
     vms->dtb_randomness = value;
 }
 
+static char *virt_get_serial_debug_level(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+    return vms->serial_debug_level_set
+        ? g_strdup_printf("0x%" PRIx32, vms->serial_debug_level)
+        : g_strdup("");
+}
+
+static void
+virt_set_serial_debug_level(Object *obj, const char *value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+    uint64_t val;
+    int ret;
+
+    ret = qemu_strtou64(value, NULL, 0, &val);
+    if (ret < 0 || val > UINT32_MAX) {
+        error_setg(errp, "invalid serial-debug-level value '%s', "
+                   "must be a uint32 value", value);
+        return;
+    }
+    vms->serial_debug_level = (uint32_t)val;
+    vms->serial_debug_level_set = true;
+}
+
 static char *virt_get_oem_id(Object *obj, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
@@ -3643,6 +3673,12 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
                                           "in ACPI table header."
                                           "The string may be up to 8 bytes in size");
 
+    object_class_property_add_str(oc, "serial-debug-level",
+                                  virt_get_serial_debug_level,
+                                  virt_set_serial_debug_level);
+    object_class_property_set_description(oc, "serial-debug-level",
+                                          "Set the EDK2 firmware debug level bitmask for "
+                                          "serial port output");
 }
 
 static void virt_instance_init(Object *obj)
@@ -3692,6 +3728,8 @@ static void virt_instance_init(Object *obj)
 
     vms->virtio_transports = NUM_VIRTIO_TRANSPORTS;
 
+    vms->serial_debug_level_set = false;
+
     virt_flash_create(vms);
 
     vms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index dba8ac7f2f49fc07a857f8af55786cb0ef960bd2..1dddfa6a11c1309f82c241cb1756a3e8f28a4ad0 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -187,6 +187,8 @@ struct VirtMachineState {
     MemoryRegion *sysmem;
     MemoryRegion *secure_sysmem;
     bool pci_preserve_config;
+    uint32_t serial_debug_level;
+    bool serial_debug_level_set;
 };
 
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)

---
base-commit: ae56950eac7b61b1abf42003329ee0f3ce111711
change-id: 20260311-edk2_arm_serial-e40226e695eb

Best regards,
-- 
Luigi Leonardi <leonardi@redhat.com>


