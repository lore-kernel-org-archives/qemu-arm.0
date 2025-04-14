Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp2125591njc;
        Mon, 14 Apr 2025 09:39:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUrffFp0IzvKlleJBzweLkgY21IIMTdNXuL/wxuwH3sLZgxQdizXL/tq2TRyZAQVPc4oiyrSYq9VbieWQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEA/WzAxtN5kzdH6Y1eSqfNbs7TultTHt1wODgCT5Tzamc8OJV6LAoAN1So/+nvpUNEoJBQ
X-Received: by 2002:a05:6902:1693:b0:e69:371d:68d4 with SMTP id 3f1490d57ef6-e704df6e80amr21597565276.47.1744648777492;
        Mon, 14 Apr 2025 09:39:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744648777; cv=none;
        d=google.com; s=arc-20240605;
        b=DDiAIXrLN5FktjdZmk6topAipBjsCrYhrpV8M4CRFDU5DYYdim7RTHNZKaLGnXRcAi
         xAeqlDauobk1flzsyjwkjsnKHW3b+FN9UL/m4LyfZHHsBEcyY0ISNgl0NfyBH0kYagmQ
         OFET/dJFJ5JguXFMT0xAWkOzBQ8AijCy8lzCC5l04xL/prVYMoM+kwyJyZCzoUg2sAMQ
         B1GqkwNIBbM6XgVgpWopnuoaFQ4ZhNACcp5Zuy48yA3biTBcJTvUSNDKjPHH6eQ1dR0z
         OCEm8e7ZIwyuyzybFtFXNGHqBzyFYifpsPmw3zzJpEgnFSIRp9kQR2dcNzhmG7QxxcsS
         jsWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ST/Epdwc6K7kU2DxufZKND7JF8yJCWJgqDVNPy8cEvo=;
        fh=6xsxbRFvSPtT8TG3B9HOEDad133GF2zMAz688Nd5+nE=;
        b=UzhqtcRvxqvkyFs6IKa+ycBGZu/zcKeeqatM3i0IzqT0FRKUR1cYs6CjAEVYXvJctY
         4t9Q0k0A9kX3Rzk16X+Nx67Mn01LtIkaCBAc2ohjjn4y8RLY9Um5Lb/cWGoo80uz2bbS
         uavelHDavZHD0xI0qMbwzGh4M4b61PVd9y9kVh6UYpBX7HJe0meUAp7Ytlm0jtZSMxe3
         0AfKfVAE3ubWDz7YpmTvqMqF33yXIevl9AhrdMyZpgm4rSVNatN29br7+XPOyeR/FWdG
         oZQF0nsLvlWeTQjIanhwVo9pACaR3mlzYmN96nHxFvltgV/unDXyEJ2dtAT0bOMqws20
         cMjg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="eUtmsmW/";
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e70327bf7cesi13626836276.235.2025.04.14.09.39.37
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 09:39:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="eUtmsmW/";
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744648777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ST/Epdwc6K7kU2DxufZKND7JF8yJCWJgqDVNPy8cEvo=;
	b=eUtmsmW/esMhFmdL4GghUIISk+WZrKQSlwRMg0hZ2P7WMyrITZtOOz7bOws3xll7f1YWDl
	Pqo3q7pQLpk8Wyz0fCHe84ONJO/4ia+clqSlpw3abiEGuYA2BjSQPrzP71vosaqCd87wxf
	R/h03GNq2lLr6uU+OsdR/4tA/l66lH4=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-20-amOgVnpCMKCnzCTnfgOphQ-1; Mon,
 14 Apr 2025 12:39:33 -0400
X-MC-Unique: amOgVnpCMKCnzCTnfgOphQ-1
X-Mimecast-MFC-AGG-ID: amOgVnpCMKCnzCTnfgOphQ_1744648771
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 164381956087;
	Mon, 14 Apr 2025 16:39:30 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.67.24.14])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9D4AD180AF7C;
	Mon, 14 Apr 2025 16:39:14 +0000 (UTC)
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
Cc: agraf@csgraf.de,
	shahuang@redhat.com,
	mark.rutland@arm.com,
	philmd@linaro.org,
	pbonzini@redhat.com,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v3 01/10] arm/cpu: Add infra to handle generated ID register definitions
Date: Mon, 14 Apr 2025 18:38:40 +0200
Message-ID: <20250414163849.321857-2-cohuck@redhat.com>
In-Reply-To: <20250414163849.321857-1-cohuck@redhat.com>
References: <20250414163849.321857-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: EyFAdj6V9C9l

From: Eric Auger <eric.auger@redhat.com>

The known ID regs are described in a new initialization function
dubbed initialize_cpu_sysreg_properties(). That code will be
automatically generated from linux arch/arm64/tools/sysreg. For the
time being let's just describe a single id reg, CTR_EL0. In this
description we only care about non RES/RAZ fields, ie. named fields.

The registers are populated in an array indexed by ARMIDRegisterIdx
and their fields are added in a sorted list.

[CH: adapted to reworked register storage]
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/arm/cpu-custom.h            | 60 ++++++++++++++++++++++++++++++
 target/arm/cpu-sysreg-properties.c | 41 ++++++++++++++++++++
 target/arm/cpu64.c                 |  2 +
 target/arm/meson.build             |  1 +
 4 files changed, 104 insertions(+)
 create mode 100644 target/arm/cpu-custom.h
 create mode 100644 target/arm/cpu-sysreg-properties.c

diff --git a/target/arm/cpu-custom.h b/target/arm/cpu-custom.h
new file mode 100644
index 000000000000..615347376e56
--- /dev/null
+++ b/target/arm/cpu-custom.h
@@ -0,0 +1,60 @@
+/*
+ * handle ID registers and their fields
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
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
+    ARMSysRegs sysreg;
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
+extern ARM64SysReg arm64_id_regs[NUM_ID_IDX];
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
+static inline ARM64SysReg *arm64_sysreg_get(ARMIDRegisterIdx index)
+{
+        ARM64SysReg *reg = &arm64_id_regs[index];
+
+        reg->index = index;
+        reg->sysreg = id_register_sysreg[index];
+        return reg;
+}
+
+#endif
diff --git a/target/arm/cpu-sysreg-properties.c b/target/arm/cpu-sysreg-properties.c
new file mode 100644
index 000000000000..8b7ef5badfb9
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
+ARM64SysReg arm64_id_regs[NUM_ID_IDX];
+
+void initialize_cpu_sysreg_properties(void)
+{
+    memset(arm64_id_regs, 0, sizeof(ARM64SysReg) * NUM_ID_IDX);
+    /* CTR_EL0 */
+    ARM64SysReg *CTR_EL0 = arm64_sysreg_get(CTR_EL0_IDX);
+    CTR_EL0->name = "CTR_EL0";
+    arm64_sysreg_add_field(CTR_EL0, "TminLine", 32, 37);
+    arm64_sysreg_add_field(CTR_EL0, "DIC", 29, 29);
+    arm64_sysreg_add_field(CTR_EL0, "IDC", 28, 28);
+    arm64_sysreg_add_field(CTR_EL0, "CWG", 24, 27);
+    arm64_sysreg_add_field(CTR_EL0, "ERG", 20, 23);
+    arm64_sysreg_add_field(CTR_EL0, "DminLine", 16, 19);
+    arm64_sysreg_add_field(CTR_EL0, "L1Ip", 14, 15);
+    arm64_sysreg_add_field(CTR_EL0, "IminLine", 0, 3);
+}
+
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 9769401a8585..839442745ea4 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -35,6 +35,7 @@
 #include "internals.h"
 #include "cpu-features.h"
 #include "cpregs.h"
+#include "cpu-custom.h"
 
 /* convert between <register>_IDX and SYS_<register> */
 #define DEF(NAME, OP0, OP1, CRN, CRM, OP2)      \
@@ -891,6 +892,7 @@ static void aarch64_cpu_register_types(void)
 {
     size_t i;
 
+    initialize_cpu_sysreg_properties();
     type_register_static(&aarch64_cpu_type_info);
 
     for (i = 0; i < ARRAY_SIZE(aarch64_cpus); ++i) {
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 3065081d241d..1c97c1ef7580 100644
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
2.49.0
