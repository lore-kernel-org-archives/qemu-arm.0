Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62686C531F9
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Jul 2026 15:36:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wo0si-0002et-El; Sun, 26 Jul 2026 11:35:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wo0s0-0001s4-R5
 for qemu-arm@nongnu.org; Sun, 26 Jul 2026 11:34:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wo0rx-0003Xd-Jd
 for qemu-arm@nongnu.org; Sun, 26 Jul 2026 11:34:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1785080065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DWqDgY6YptJE+OeZiINF/nTpYHVswL+HXXlWl6zC+ZM=;
 b=IhQLe2p/2JzEKfL45VL39mjcD0xrbRkM1t15lQaFjdwrFGN5KCAvPkP+IghNbomDodHXv4
 30HZ9s0TW6O6wdl7yG6OOSdDK78pey28gA1CfBStPoA8QEM6S4sGZamMu0DqxRpPT9R8LJ
 4kAA2AqS/qr6Y/Z+i+dczHkbQ6sHgRA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-126-gtxqsPlHNEeHQJGt6T9sZQ-1; Sun,
 26 Jul 2026 11:34:21 -0400
X-MC-Unique: gtxqsPlHNEeHQJGt6T9sZQ-1
X-Mimecast-MFC-AGG-ID: gtxqsPlHNEeHQJGt6T9sZQ_1785080059
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B34AB1955F73; Sun, 26 Jul 2026 15:34:19 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.63])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 5179D180044F; Sun, 26 Jul 2026 15:34:11 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev, peter.maydell@linaro.org,
 shaju.abraham@nutanix.com, khushit.shah@nutanix.com,
 yangjinqian1@huawei.com, cohuck@redhat.com, richard.henderson@linaro.org,
 sebott@redhat.com, skolothumtho@nvidia.com, philmd@oss.qualcomm.com
Cc: maz@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
 armbru@redhat.com, berrange@redhat.com, abologna@redhat.com,
 jdenemar@redhat.com
Subject: [RFC PATCH v7 09/18] target/arm/cpu_idregs: generate tables for Arm64
 ID registers and fields
Date: Sun, 26 Jul 2026 17:29:47 +0200
Message-ID: <20260726153221.24773-10-eric.auger@redhat.com>
In-Reply-To: <20260726153221.24773-1-eric.auger@redhat.com>
References: <20260726153221.24773-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: 9zVitj2gVHP_KIozomkFnRHXQVTVWuMkBwb2CNTC5wI_1785080059
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.58,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Shaju Abraham <shaju.abraham@nutanix.com>

Include cpu-idregs.h.inc multiple times with different definitions for the
X-macros. This will generate tables for all Arm64 ID registers and their
fields. Additionally, initialize the tables with all architecturally defined
values. These tables will be consumed by the property layer in future
patches.

Co-authored-by: Khushit Shah <khushit.shah@nutanix.com>
Signed-off-by: Shaju Abraham <shaju.abraham@nutanix.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v5 -> v6
- restored support of enum values
---
 target/arm/cpu-idregs.c | 96 +++++++++++++++++++++++++++++++++++++++++
 target/arm/meson.build  |  1 +
 2 files changed, 97 insertions(+)
 create mode 100644 target/arm/cpu-idregs.c

diff --git a/target/arm/cpu-idregs.c b/target/arm/cpu-idregs.c
new file mode 100644
index 0000000000..c41d0ab0c4
--- /dev/null
+++ b/target/arm/cpu-idregs.c
@@ -0,0 +1,96 @@
+/*
+ *   ARM ID register field table.
+ *
+ *   Builds the per-id-register field descriptor arrays and the global
+ *   arm_idregs[] table.
+ *
+ *  SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+#include "cpu.h"
+#include "cpu-idregs.h"
+
+/*
+ * Generate an array of architecturely defined values for each field
+ * associated with enum values
+ */
+
+#define IDREG_START(reg)
+#define IDREG_END(reg)
+#define IDREG_FIELD(reg, field, shift, length)
+#define IDREG_FIELD_START(reg, field, shift, length) \
+    static const ArmIdRegArchVal reg##_##field##_arch_vals[] = {
+#define IDREG_FIELD_ARCH_VAL(v) { (v), "" },
+#define IDREG_FIELD_END(reg, field) \
+    };
+
+#include "cpu-idregs.h.inc"
+
+#undef IDREG_START
+#undef IDREG_END
+#undef IDREG_FIELD
+#undef IDREG_FIELD_START
+#undef IDREG_FIELD_END
+#undef IDREG_FIELD_ARCH_VAL
+
+/* generate an array of per-register ArmIdRegField[] descriptors */
+
+#define IDREG_START(reg) \
+    static ARM64SysRegField reg##_fields[] = {
+
+#define IDREG_END(reg) \
+    };
+
+#define IDREG_FIELD_START(reg, field, _shift, _length)  \
+    {                                                                 \
+        .name = #field, \
+        .index = reg##_IDX, \
+        .shift = (_shift),                                            \
+        .length = (_length),                                          \
+        .arch_vals = (ArmIdRegArchVal *)reg##_##field##_arch_vals,    \
+        .arch_vals_count = ARRAY_SIZE(reg##_##field##_arch_vals),     \
+    },
+
+#define IDREG_FIELD(reg, field, _shift, _length) \
+    { \
+        .name = #field, \
+        .index = reg##_IDX, \
+        .shift = (_shift), \
+        .length = (_length), \
+    },
+
+#define IDREG_FIELD_ARCH_VAL(v)
+
+#define IDREG_FIELD_END(reg, field)
+
+#include "cpu-idregs.h.inc"
+
+#undef IDREG_START
+#undef IDREG_END
+#undef IDREG_FIELD
+#undef IDREG_FIELD_START
+#undef IDREG_FIELD_END
+#undef IDREG_FIELD_ARCH_VAL
+
+/* generate an array of top level ID registers */
+
+#define IDREG_END(reg)
+#define IDREG_FIELD(reg, field, shift, length)
+#define IDREG_FIELD_START(reg, field, shift, length)
+#define IDREG_FIELD_ARCH_VAL(v)
+#define IDREG_FIELD_END(reg, field)
+
+#define IDREG_START(reg) \
+    [reg##_IDX] = { \
+        .name = #reg, \
+        .index = reg##_IDX, \
+        .fields = reg##_fields, \
+        .fields_count = ARRAY_SIZE(reg##_fields), \
+    },
+
+ARM64SysReg arm64_id_regs[NUM_ID_IDX] = {
+#include "cpu-idregs.h.inc"
+};
+
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 4412fde065..ed8535192c 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -30,6 +30,7 @@ arm_common_user_system_ss.add(when: 'TARGET_AARCH64', if_true: files(
 
 arm_common_system_ss.add(files(
   'arm-qmp-cmds.c',
+  'cpu-idregs.c',
 ))
 arm_system_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'))
 arm_system_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
-- 
2.53.0


