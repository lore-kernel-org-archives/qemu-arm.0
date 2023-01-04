Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8305943ejb;
        Wed, 4 Jan 2023 14:01:36 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsC30ToLDRiUmyMKneoICjhiRk+EE0nwnb+BGu4yM0HbpVp3StRYUNayIK9aRRLqPswExeU
X-Received: by 2002:adf:f7d1:0:b0:273:a0d8:c9f5 with SMTP id a17-20020adff7d1000000b00273a0d8c9f5mr24539080wrq.61.1672869696471;
        Wed, 04 Jan 2023 14:01:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672869696; cv=none;
        d=google.com; s=arc-20160816;
        b=qecc3SUvANiWQbxu3JUC+faQyd3EIUGtakzcoxamoQeR0349PQvvO/1Ae3ZNfGHIyJ
         GrI1qBOruDzLzFvURSd5Obo8A3IYuFX0vNy6jtTV4m+Q/G/kU5+LrZ6KBAXQllzlDQnS
         G183V9G9RxS+TR/0JfsZshDzf0sjDnWiLZi8kiE3GXf06YYG7wm9Cc5BxWHtTHSSjfTN
         /99X5dw9FW3e6JLGpFMJYqBo+NsOFEacM0CZln6JahBt52ZD5ucFcMZ+28s0pwGSg0Jn
         wu1zXbEtTxIj0c2XXKrKieWdTCO8vImzRUE2z+NC9E8WhbOaRay9TbsbQpY8nvmVrDU8
         t5Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=GzK3pGTJKyDEl1gwCMgtKGNz2Apa9joJLmfLERsjCxM=;
        b=Y/Lf6QJouw3sDXmPKrEe1gj3CgjekYvGbw50/JbCt+8+kOsluYNUMx7kXzC2hlpMcP
         5tIrw29iM5Vyj5uuHdy3mC1/NOfF/JuC1tG7M4xyNXxYf82h0r7XrGroVEFDJtAZ3QSh
         1fvwfabKnOd4DlkMLQU6hO0f1jeLwX9LqY+7koPzyopyqtRHAxL83bUIPNgSjogX8m7X
         y5V1JoFheXBcPEd2rlmstTIX9CMLYKpJ/eSIoCWN6XTTI1Geduqnemgjc16Yf6Y28lT6
         z2cN4wqYqPLkUE12EGTvrOhdKNVJZ8XiCgB4saM9Ju6bOGkig7uncUOgP5VHMm4kKaMR
         mnOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=u4msEGIE;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id h15-20020a5d6e0f000000b002863eb04dcesi13120001wrz.952.2023.01.04.14.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 14:01:36 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=u4msEGIE;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AF1E83F16C;
	Wed,  4 Jan 2023 22:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1672869695; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GzK3pGTJKyDEl1gwCMgtKGNz2Apa9joJLmfLERsjCxM=;
	b=u4msEGIENeoOtaP6xy9KunHvDHvdojuIYwnxQK4DmUa0f/e83U5YWViKn21f48RmH4WoGO
	KVqQXDlmzyuC6PCNFLk2pAxsFlTMUWYRmxAW0Ad7kEgD4RDSoEFtt3WKhhG3WyAeZmzkZj
	CuBAHzalInMeOCS/h1QrC8iSSwY9tEU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1672869695;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GzK3pGTJKyDEl1gwCMgtKGNz2Apa9joJLmfLERsjCxM=;
	b=D5noml8cVFzROn6/nAfrTm92t6yaaoYwb5KsuxlZjaZ+Hm7vtq3F+XjJ7bIUVm6liFiXgn
	A3aEkpm4ADW21yBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F1E6F1342C;
	Wed,  4 Jan 2023 22:01:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id oG/WLTz3tWPwJAAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 04 Jan 2023 22:01:32 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alexander Graf <agraf@csgraf.de>
Subject: [RFC PATCH 17/27] target/arm: Extract cpustate list manipulation to a file
Date: Wed,  4 Jan 2023 18:58:25 -0300
Message-Id: <20230104215835.24692-18-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230104215835.24692-1-farosas@suse.de>
References: <20230104215835.24692-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Wa8Jqhuq/YYw

This code doesn't need to be buried in helper.c. Let's move it to its
own file to keep things cleaner.

Code moved verbatim.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
Extracted from:
https://lore.kernel.org/r/20210416162824.25131-15-cfontana@suse.de
[RFC v14 14/80] target/arm: split cpregs from tcg/helper.c
---
 target/arm/cpregs.h        |   5 ++
 target/arm/cpustate-list.c | 148 +++++++++++++++++++++++++++++++++++++
 target/arm/helper.c        | 136 ----------------------------------
 target/arm/meson.build     |   1 +
 4 files changed, 154 insertions(+), 136 deletions(-)
 create mode 100644 target/arm/cpustate-list.c

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 7e78c2c05c..1c35574102 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -442,6 +442,11 @@ void arm_cp_write_ignore(CPUARMState *env, const ARMCPRegInfo *ri,
 /* CPReadFn that can be used for read-as-zero behaviour */
 uint64_t arm_cp_read_zero(CPUARMState *env, const ARMCPRegInfo *ri);
 
+/*
+ * default raw read/write of coprocessor register field,
+ * behavior if no other function defined, and not const.
+ */
+uint64_t raw_read(CPUARMState *env, const ARMCPRegInfo *ri);
 /* CPWriteFn that just writes the value to ri->fieldoffset */
 void raw_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value);
 
diff --git a/target/arm/cpustate-list.c b/target/arm/cpustate-list.c
new file mode 100644
index 0000000000..9411b25b6f
--- /dev/null
+++ b/target/arm/cpustate-list.c
@@ -0,0 +1,148 @@
+/*
+ * ARM CPUState list read/write
+ *
+ * This code is licensed under the GNU GPL v2 or later.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "cpregs.h"
+
+uint64_t raw_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    assert(ri->fieldoffset);
+    if (cpreg_field_is_64bit(ri)) {
+        return CPREG_FIELD64(env, ri);
+    } else {
+        return CPREG_FIELD32(env, ri);
+    }
+}
+
+void raw_write(CPUARMState *env, const ARMCPRegInfo *ri,
+               uint64_t value)
+{
+    assert(ri->fieldoffset);
+    if (cpreg_field_is_64bit(ri)) {
+        CPREG_FIELD64(env, ri) = value;
+    } else {
+        CPREG_FIELD32(env, ri) = value;
+    }
+}
+
+const ARMCPRegInfo *get_arm_cp_reginfo(GHashTable *cpregs, uint32_t encoded_cp)
+{
+    return g_hash_table_lookup(cpregs, (gpointer)(uintptr_t)encoded_cp);
+}
+
+uint64_t read_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    /* Raw read of a coprocessor register (as needed for migration, etc). */
+    if (ri->type & ARM_CP_CONST) {
+        return ri->resetvalue;
+    } else if (ri->raw_readfn) {
+        return ri->raw_readfn(env, ri);
+    } else if (ri->readfn) {
+        return ri->readfn(env, ri);
+    } else {
+        return raw_read(env, ri);
+    }
+}
+
+static void write_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri,
+                             uint64_t v)
+{
+    /*
+     * Raw write of a coprocessor register (as needed for migration, etc).
+     * Note that constant registers are treated as write-ignored; the
+     * caller should check for success by whether a readback gives the
+     * value written.
+     */
+    if (ri->type & ARM_CP_CONST) {
+        return;
+    } else if (ri->raw_writefn) {
+        ri->raw_writefn(env, ri, v);
+    } else if (ri->writefn) {
+        ri->writefn(env, ri, v);
+    } else {
+        raw_write(env, ri, v);
+    }
+}
+
+bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync)
+{
+    /* Write the coprocessor state from cpu->env to the (index,value) list. */
+    int i;
+    bool ok = true;
+
+    for (i = 0; i < cpu->cpreg_array_len; i++) {
+        uint32_t regidx = kvm_to_cpreg_id(cpu->cpreg_indexes[i]);
+        const ARMCPRegInfo *ri;
+        uint64_t newval;
+
+        ri = get_arm_cp_reginfo(cpu->cp_regs, regidx);
+        if (!ri) {
+            ok = false;
+            continue;
+        }
+        if (ri->type & ARM_CP_NO_RAW) {
+            continue;
+        }
+
+        newval = read_raw_cp_reg(&cpu->env, ri);
+        if (kvm_sync) {
+            /*
+             * Only sync if the previous list->cpustate sync succeeded.
+             * Rather than tracking the success/failure state for every
+             * item in the list, we just recheck "does the raw write we must
+             * have made in write_list_to_cpustate() read back OK" here.
+             */
+            uint64_t oldval = cpu->cpreg_values[i];
+
+            if (oldval == newval) {
+                continue;
+            }
+
+            write_raw_cp_reg(&cpu->env, ri, oldval);
+            if (read_raw_cp_reg(&cpu->env, ri) != oldval) {
+                continue;
+            }
+
+            write_raw_cp_reg(&cpu->env, ri, newval);
+        }
+        cpu->cpreg_values[i] = newval;
+    }
+    return ok;
+}
+
+bool write_list_to_cpustate(ARMCPU *cpu)
+{
+    int i;
+    bool ok = true;
+
+    for (i = 0; i < cpu->cpreg_array_len; i++) {
+        uint32_t regidx = kvm_to_cpreg_id(cpu->cpreg_indexes[i]);
+        uint64_t v = cpu->cpreg_values[i];
+        const ARMCPRegInfo *ri;
+
+        ri = get_arm_cp_reginfo(cpu->cp_regs, regidx);
+        if (!ri) {
+            ok = false;
+            continue;
+        }
+        if (ri->type & ARM_CP_NO_RAW) {
+            continue;
+        }
+        /*
+         * Write value and confirm it reads back as written
+         * (to catch read-only registers and partially read-only
+         * registers where the incoming migration value doesn't match)
+         */
+        write_raw_cp_reg(&cpu->env, ri, v);
+        if (read_raw_cp_reg(&cpu->env, ri) != v) {
+            ok = false;
+        }
+    }
+    return ok;
+}
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 506c057675..8361c57d4c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -35,65 +35,11 @@
 
 static void switch_mode(CPUARMState *env, int mode);
 
-static uint64_t raw_read(CPUARMState *env, const ARMCPRegInfo *ri)
-{
-    assert(ri->fieldoffset);
-    if (cpreg_field_is_64bit(ri)) {
-        return CPREG_FIELD64(env, ri);
-    } else {
-        return CPREG_FIELD32(env, ri);
-    }
-}
-
-void raw_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
-{
-    assert(ri->fieldoffset);
-    if (cpreg_field_is_64bit(ri)) {
-        CPREG_FIELD64(env, ri) = value;
-    } else {
-        CPREG_FIELD32(env, ri) = value;
-    }
-}
-
 static void *raw_ptr(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     return (char *)env + ri->fieldoffset;
 }
 
-uint64_t read_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri)
-{
-    /* Raw read of a coprocessor register (as needed for migration, etc). */
-    if (ri->type & ARM_CP_CONST) {
-        return ri->resetvalue;
-    } else if (ri->raw_readfn) {
-        return ri->raw_readfn(env, ri);
-    } else if (ri->readfn) {
-        return ri->readfn(env, ri);
-    } else {
-        return raw_read(env, ri);
-    }
-}
-
-static void write_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri,
-                             uint64_t v)
-{
-    /*
-     * Raw write of a coprocessor register (as needed for migration, etc).
-     * Note that constant registers are treated as write-ignored; the
-     * caller should check for success by whether a readback gives the
-     * value written.
-     */
-    if (ri->type & ARM_CP_CONST) {
-        return;
-    } else if (ri->raw_writefn) {
-        ri->raw_writefn(env, ri, v);
-    } else if (ri->writefn) {
-        ri->writefn(env, ri, v);
-    } else {
-        raw_write(env, ri, v);
-    }
-}
-
 static bool raw_accessors_invalid(const ARMCPRegInfo *ri)
 {
    /*
@@ -116,83 +62,6 @@ static bool raw_accessors_invalid(const ARMCPRegInfo *ri)
     return true;
 }
 
-bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync)
-{
-    /* Write the coprocessor state from cpu->env to the (index,value) list. */
-    int i;
-    bool ok = true;
-
-    for (i = 0; i < cpu->cpreg_array_len; i++) {
-        uint32_t regidx = kvm_to_cpreg_id(cpu->cpreg_indexes[i]);
-        const ARMCPRegInfo *ri;
-        uint64_t newval;
-
-        ri = get_arm_cp_reginfo(cpu->cp_regs, regidx);
-        if (!ri) {
-            ok = false;
-            continue;
-        }
-        if (ri->type & ARM_CP_NO_RAW) {
-            continue;
-        }
-
-        newval = read_raw_cp_reg(&cpu->env, ri);
-        if (kvm_sync) {
-            /*
-             * Only sync if the previous list->cpustate sync succeeded.
-             * Rather than tracking the success/failure state for every
-             * item in the list, we just recheck "does the raw write we must
-             * have made in write_list_to_cpustate() read back OK" here.
-             */
-            uint64_t oldval = cpu->cpreg_values[i];
-
-            if (oldval == newval) {
-                continue;
-            }
-
-            write_raw_cp_reg(&cpu->env, ri, oldval);
-            if (read_raw_cp_reg(&cpu->env, ri) != oldval) {
-                continue;
-            }
-
-            write_raw_cp_reg(&cpu->env, ri, newval);
-        }
-        cpu->cpreg_values[i] = newval;
-    }
-    return ok;
-}
-
-bool write_list_to_cpustate(ARMCPU *cpu)
-{
-    int i;
-    bool ok = true;
-
-    for (i = 0; i < cpu->cpreg_array_len; i++) {
-        uint32_t regidx = kvm_to_cpreg_id(cpu->cpreg_indexes[i]);
-        uint64_t v = cpu->cpreg_values[i];
-        const ARMCPRegInfo *ri;
-
-        ri = get_arm_cp_reginfo(cpu->cp_regs, regidx);
-        if (!ri) {
-            ok = false;
-            continue;
-        }
-        if (ri->type & ARM_CP_NO_RAW) {
-            continue;
-        }
-        /*
-         * Write value and confirm it reads back as written
-         * (to catch read-only registers and partially read-only
-         * registers where the incoming migration value doesn't match)
-         */
-        write_raw_cp_reg(&cpu->env, ri, v);
-        if (read_raw_cp_reg(&cpu->env, ri) != v) {
-            ok = false;
-        }
-    }
-    return ok;
-}
-
 static void add_cpreg_to_list(gpointer key, gpointer opaque)
 {
     ARMCPU *cpu = opaque;
@@ -9048,11 +8917,6 @@ void modify_arm_cp_regs_with_len(ARMCPRegInfo *regs, size_t regs_len,
     }
 }
 
-const ARMCPRegInfo *get_arm_cp_reginfo(GHashTable *cpregs, uint32_t encoded_cp)
-{
-    return g_hash_table_lookup(cpregs, (gpointer)(uintptr_t)encoded_cp);
-}
-
 void arm_cp_write_ignore(CPUARMState *env, const ARMCPRegInfo *ri,
                          uint64_t value)
 {
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 68a87dff0a..a42970fab8 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -1,6 +1,7 @@
 arm_ss = ss.source_set()
 arm_ss.add(files(
   'cpu.c',
+  'cpustate-list.c',
   'gdbstub.c',
   'helper.c',
   'vfp_helper.c',
-- 
2.35.3
