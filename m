Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp770878njb;
        Fri, 6 Dec 2024 03:23:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWEzoO36xxf+e9H0ewbG6Q6mV73UgT6hPplrvznQhcjgl8EX/g9cvfGrmRinGfsfhCgpeiwRwnYgQziug==@linaro.org
X-Google-Smtp-Source: AGHT+IFwy8VOG3YLQyh6j0NbQv9jCQ32ynCW35MNAfcSa1cFIqVIcAO/xWAN9Bo6DEIJdgavz+HM
X-Received: by 2002:a05:622a:1494:b0:466:a3d2:ae44 with SMTP id d75a77b69052e-46734ca3e6fmr42282791cf.2.1733484231410;
        Fri, 06 Dec 2024 03:23:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733484231; cv=none;
        d=google.com; s=arc-20240605;
        b=eMT9khOMVg0THnyF5XiiGeXDYvQEkwn9vriyC4M1PVHvg13RMtjE7YbmAfVvHue/Qh
         oclJXBa9Ox+4iId2ENRyUhBN8A73Te6CsWJYnVYxA3hBujBTZmpkcHYOVT80h/qDvtSp
         aa88PeILgYEuaG8tmKpkHqZTFE82CvJotz1Kam1rEMnAyc/3yVJPGiWR0E/gIb2wkKMD
         8aJ6DQSI1BdeOQZpi1N+qunRQLHpujYkE7jpUr6zci8l/nTFb3X5BKrIf+q82IPYDVSx
         E8BWj8pg63Krx3Ei4kv5xD86wVErOMdLRZymbxXrlt4uK0XbQMyuHtJ7O3OPwcVSkbDH
         040w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=deHT9KFNSb9UoJgsypIWs/wdH54gBPOkPmXGG5yU7us=;
        fh=ou9WwAWkFbBDtrYluijzdFLlSJKncehGww8dMC2w/x0=;
        b=VA2ee6juQ6Tk+S5/7O3jJjk2rfWyxEPDUGWXT4FtNfqf0q1vvZzpxHkbfNYl2nR+z5
         Nfj7lgbjNihxRJS0QtkLhIK+n6o8BkWIPGEQBi+uvqcJgReaiL8pW5cB+YsS0EA4WpF6
         Lqi8IFVWoN0Z18H5E98bJvzjB8XR+bIVZ/+OFY8BDiwY4St9bGaaspMFk47nA5tEVplY
         PgSEkuWH5fgIKzCVAWOfx5eyLXnCw8ajmgukihW4C+Ujz18N9Iuuq0zihWVaC8X7obmj
         LRc42XnD1PtWDDUmmoFiVlRugfNrj6Oj2380Idow+dMWUz03UPYJVCkpuafKAitdXD0B
         /VNg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="MmAr+/fU";
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-467296b3c07si46757101cf.113.2024.12.06.03.23.51
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 03:23:51 -0800 (PST)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="MmAr+/fU";
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733484231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=deHT9KFNSb9UoJgsypIWs/wdH54gBPOkPmXGG5yU7us=;
	b=MmAr+/fUdTQ27yyEjENKUUtI3M20DYMzOqzTOOeHeF0Y6n1Ud4Lcl7oyVtTsG6z2ezi29M
	YM3+uax70JE8fbu9AIT/P/kUvmP8bC5YZmG7J1bA33U3z6dN97bbKPis7MXkBZhN8J9MtD
	GKgilYt3jeIM0xdKa9rGJtMEpgNI4pI=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-528-ZY7CdZ0UOUKNi-AHsyd5Rg-1; Fri,
 06 Dec 2024 06:23:47 -0500
X-MC-Unique: ZY7CdZ0UOUKNi-AHsyd5Rg-1
X-Mimecast-MFC-AGG-ID: ZY7CdZ0UOUKNi-AHsyd5Rg
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ABDA31954ADC;
	Fri,  6 Dec 2024 11:23:45 +0000 (UTC)
Received: from gondolin.str.redhat.com (dhcp-192-244.str.redhat.com [10.33.192.244])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F19C219560A2;
	Fri,  6 Dec 2024 11:23:39 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvmarm@lists.linux.dev,
	peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	sebott@redhat.com,
	shameerali.kolothum.thodi@huawei.com,
	armbru@redhat.com,
	berrange@redhat.com,
	abologna@redhat.com,
	jdenemar@redhat.com
Cc: shahuang@redhat.com,
	mark.rutland@arm.com,
	philmd@linaro.org,
	pbonzini@redhat.com,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH RFCv2 13/20] arm/cpu: Add infra to handle generated ID register definitions
Date: Fri,  6 Dec 2024 12:22:06 +0100
Message-ID: <20241206112213.88394-14-cohuck@redhat.com>
In-Reply-To: <20241206112213.88394-1-cohuck@redhat.com>
References: <20241206112213.88394-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: lS74/OXSrq5X

From: Eric Auger <eric.auger@redhat.com>

The known ID regs are described in a new initialization function
dubbed initialize_cpu_sysreg_properties(). That code will be
automatically generated from linux arch/arm64/tools/sysreg. For the
time being let's just describe a single id reg, CTR_EL0. In this
description we only care about non RES/RAZ fields, ie. named fields.

The registers are populated in a 3x8x8 array and their fields are
added in a sorted list.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/arm/cpu-custom.h            | 58 ++++++++++++++++++++++++++++++
 target/arm/cpu-sysreg-properties.c | 41 +++++++++++++++++++++
 target/arm/cpu64.c                 |  2 ++
 target/arm/meson.build             |  1 +
 4 files changed, 102 insertions(+)
 create mode 100644 target/arm/cpu-custom.h
 create mode 100644 target/arm/cpu-sysreg-properties.c

diff --git a/target/arm/cpu-custom.h b/target/arm/cpu-custom.h
new file mode 100644
index 000000000000..1952095bf7b8
--- /dev/null
+++ b/target/arm/cpu-custom.h
@@ -0,0 +1,58 @@
+#ifndef ARM_CPU_CUSTOM_H
+#define ARM_CPU_CUSTOM_H
+
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+#include "cpu.h"
+#include "cpu-sysregs.h"
+
+typedef struct ARM64SysRegField {
+    const char *name; /* name of the field, for instance CTR_EL0_IDC */
+    int index;
+    int lower;
+    int upper;
+} ARM64SysRegField;
+
+typedef struct ARM64SysReg {
+    const char *name;   /* name of the sysreg, for instance CTR_EL0 */
+    ARMSysReg *sysreg;
+    int index;
+    GList *fields; /* list of named fields, excluding RES* */
+} ARM64SysReg;
+
+void initialize_cpu_sysreg_properties(void);
+
+/*
+ * List of exposed ID regs (automatically populated from linux
+ * arch/arm64/tools/sysreg)
+ */
+extern ARM64SysReg arm64_id_regs[NR_ID_REGS];
+
+/* Allocate a new field and insert it at the head of the @reg list */
+static inline GList *arm64_sysreg_add_field(ARM64SysReg *reg, const char *name,
+                                     uint8_t min, uint8_t max) {
+
+     ARM64SysRegField *field = g_new0(ARM64SysRegField, 1);
+
+     field->name = name;
+     field->lower = min;
+     field->upper = max;
+     field->index = reg->index;
+
+     reg->fields = g_list_append(reg->fields, field);
+     return reg->fields;
+}
+
+static inline ARM64SysReg *
+arm64_sysreg_get(int op0, int op1, int crn, int crm, int op2)
+{
+        uint64_t index = ARM_FEATURE_ID_RANGE_IDX(op0, op1, crn, crm, op2);
+        ARM64SysReg *reg = &arm64_id_regs[index];
+
+        reg->index = index;
+        reg->sysreg = g_new(ARMSysReg, 1);
+        *reg->sysreg = sys_reg(op0, op1, crn, crm, op2);
+        return reg;
+}
+
+#endif
diff --git a/target/arm/cpu-sysreg-properties.c b/target/arm/cpu-sysreg-properties.c
new file mode 100644
index 000000000000..7e6b9f526d32
--- /dev/null
+++ b/target/arm/cpu-sysreg-properties.c
@@ -0,0 +1,41 @@
+/*
+ * QEMU ARM CPU SYSREG PROPERTIES
+ * to be generated from linux sysreg
+ *
+ * Copyright (c) Red Hat, Inc. 2024
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see
+ * <http://www.gnu.org/licenses/gpl-2.0.html>
+ */
+
+#include "cpu-custom.h"
+
+ARM64SysReg arm64_id_regs[NR_ID_REGS];
+
+void initialize_cpu_sysreg_properties(void)
+{
+    memset(arm64_id_regs, 0, sizeof(ARM64SysReg) * NR_ID_REGS);
+    /* CTR_EL0 */
+    ARM64SysReg *CTR_EL0 = arm64_sysreg_get(3, 3, 0, 0, 1);
+    CTR_EL0->name = "CTR_EL0";
+    arm64_sysreg_add_field(CTR_EL0, "TMinline", 32, 37);
+    arm64_sysreg_add_field(CTR_EL0, "DIC", 29, 29);
+    arm64_sysreg_add_field(CTR_EL0, "IDC", 28, 28);
+    arm64_sysreg_add_field(CTR_EL0, "CWG", 24, 27);
+    arm64_sysreg_add_field(CTR_EL0, "ERG", 20, 23);
+    arm64_sysreg_add_field(CTR_EL0, "DMinLine", 16, 19);
+    arm64_sysreg_add_field(CTR_EL0, "L1Ip", 14, 15);
+    arm64_sysreg_add_field(CTR_EL0, "IminLine", 0, 3);
+}
+
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index efc930ff8367..29558cda8186 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -35,6 +35,7 @@
 #include "internals.h"
 #include "cpu-features.h"
 #include "cpregs.h"
+#include "cpu-custom.h"
 
 void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
 {
@@ -851,6 +852,7 @@ static void aarch64_cpu_register_types(void)
 {
     size_t i;
 
+    initialize_cpu_sysreg_properties();
     type_register_static(&aarch64_cpu_type_info);
 
     for (i = 0; i < ARRAY_SIZE(aarch64_cpus); ++i) {
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 2e10464dbb6b..9c7a04ee1b26 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -14,6 +14,7 @@ arm_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'cpu64.c',
   'gdbstub64.c',
+  'cpu-sysreg-properties.c',
 ))
 
 arm_system_ss = ss.source_set()
-- 
2.47.0
