Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp378667ejb;
        Mon, 13 Mar 2023 08:11:15 -0700 (PDT)
X-Google-Smtp-Source: AK7set8qfzTD/f8CcsjvDE3Rfz469X2OJpPQofh+QgOKyh7tOjdYUVqfK7JN3wQUDX8okDb9urwE
X-Received: by 2002:a05:600c:458e:b0:3eb:37ce:4c3d with SMTP id r14-20020a05600c458e00b003eb37ce4c3dmr10685027wmo.38.1678720275480;
        Mon, 13 Mar 2023 08:11:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678720275; cv=none;
        d=google.com; s=arc-20160816;
        b=024iaMxprmrCWInD3+iseHqkx7Jv0RAo4ejwSZx86QGYBfa6R2pD6eWnE9VmukrDUg
         fWei1LxBx+/9AgjbTGa0cRySD6QWVzFQVt9WXmvYKCfXNZW0fSJEecfo6sgiC6plb64m
         DXaSIIUdt5fu6TMQQFuDR83orjESqfte2NfJE+WVpq/GmDzSyx4Xghy7M9Q/HP2vQEKj
         QMtpXboO3DRiIS7O5UAWU80EXEVrVOZ0Q6AXpv8ivJcZVrM8Yn6Mx0KGkTEyeLz2sPTa
         2oOkkiLMWR2kRqjpFAmpXT8lIO0FmVknpxAMhbLY9cYJDXKqyfiSpDY4lP++dJrJ+pps
         E6cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=LJhCgLXvPMG6BXpC3z1pCms9e1fZH2LNIgtTChv1jE4=;
        b=TsCNyBmOblOfHcOIeCZNOf2aV8hfERcsamBABz6x2JBSYaa5mgvJdufE2FcBrtuAQD
         UlgEVNWWcWVn7GhkhCiunzoSYaGRgN9+2BF+vF2ZLPxCnE1Yt6EbnjjgFEMY+HjKxKxZ
         SuftDNUxA5apk1vJMfGQYStHit65eU5Wu2IHEbG9VpaZRWbqkeJeheuooBbvviSCqUjw
         L6cHKHcpf59yVIJtZPSLc1kSJji2aNlGeYckTfU9aAt02w7nipwiOTmL5cE/1iiuE1su
         k1zxa8qER1rKE3GkdndQNXwBOKrsQwkz4FA05z5SEp+fwhEjHdU2hsdD7f/RT3q7mzsl
         GGqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=jYavsGhF;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id s14-20020adfeb0e000000b002c844dc47b9si6494474wrn.426.2023.03.13.08.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 08:11:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=jYavsGhF;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 277DD22ACC;
	Mon, 13 Mar 2023 15:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678720275; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LJhCgLXvPMG6BXpC3z1pCms9e1fZH2LNIgtTChv1jE4=;
	b=jYavsGhFCi8ts82B7LFiDPS6LQTEmKiwZKAxDN6AaNx2pMauFac4sA2NfZ5folMWyIbZaS
	q2yNs17gwiZavpvClO13QW8RGsvTSR/pWlePRMl0KaP+I0IwV3zjrpa9ucCsUDoTaRqUx3
	iElPTdKbTFelxzGlDvgQ9vOP3tsynZM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678720275;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LJhCgLXvPMG6BXpC3z1pCms9e1fZH2LNIgtTChv1jE4=;
	b=Yg6JrmYMiQjtOKoaxQnAFwgutU68Ath9QVicgyeJyo0D9eKHJJbpFWlGLuu5+z5PwLGu5I
	h0SW7YuYoti4SHBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D3D6D13582;
	Mon, 13 Mar 2023 15:11:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id +DS7Jg89D2R1YwAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 13 Mar 2023 15:11:11 +0000
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
	Alexander Graf <agraf@csgraf.de>,
	Cornelia Huck <cohuck@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v9 03/10] target/arm: move cpu_tcg to tcg/cpu32.c
Date: Mon, 13 Mar 2023 12:10:51 -0300
Message-Id: <20230313151058.19645-4-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230313151058.19645-1-farosas@suse.de>
References: <20230313151058.19645-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: EXdNJUcjrIEF

From: Claudio Fontana <cfontana@suse.de>

move the module containing cpu models definitions
for 32bit TCG-only CPUs to tcg/ and rename it for clarity.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/virt.c                         |  2 +-
 target/arm/meson.build                |  1 -
 target/arm/{cpu_tcg.c => tcg/cpu32.c} | 13 +++----------
 target/arm/tcg/cpu64.c                |  2 +-
 target/arm/tcg/meson.build            |  1 +
 tests/qtest/arm-cpu-features.c        | 12 +++++++++---
 6 files changed, 15 insertions(+), 16 deletions(-)
 rename target/arm/{cpu_tcg.c => tcg/cpu32.c} (99%)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 999c1ada79..b661b8d91b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -204,9 +204,9 @@ static const int a15irqmap[] = {
 };
 
 static const char *valid_cpus[] = {
+#ifdef CONFIG_TCG
     ARM_CPU_TYPE_NAME("cortex-a7"),
     ARM_CPU_TYPE_NAME("cortex-a15"),
-#ifdef CONFIG_TCG
     ARM_CPU_TYPE_NAME("cortex-a35"),
     ARM_CPU_TYPE_NAME("cortex-a55"),
     ARM_CPU_TYPE_NAME("cortex-a72"),
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 3469926295..359a649eaf 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -5,7 +5,6 @@ arm_ss.add(files(
   'gdbstub.c',
   'helper.c',
   'vfp_helper.c',
-  'cpu_tcg.c',
 ))
 arm_ss.add(zlib)
 
diff --git a/target/arm/cpu_tcg.c b/target/arm/tcg/cpu32.c
similarity index 99%
rename from target/arm/cpu_tcg.c
rename to target/arm/tcg/cpu32.c
index 6ce728134f..a03c819b41 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/tcg/cpu32.c
@@ -1,5 +1,5 @@
 /*
- * QEMU ARM TCG CPUs.
+ * QEMU ARM TCG-only CPUs.
  *
  * Copyright (c) 2012 SUSE LINUX Products GmbH
  *
@@ -10,9 +10,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#ifdef CONFIG_TCG
 #include "hw/core/tcg-cpu-ops.h"
-#endif /* CONFIG_TCG */
 #include "internals.h"
 #include "target/arm/idau.h"
 #if !defined(CONFIG_USER_ONLY)
@@ -96,7 +94,7 @@ void aa32_max_features(ARMCPU *cpu)
 /* CPU models. These are not needed for the AArch64 linux-user build. */
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
 
-#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
+#if !defined(CONFIG_USER_ONLY)
 static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     CPUClass *cc = CPU_GET_CLASS(cs);
@@ -120,7 +118,7 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     }
     return ret;
 }
-#endif /* !CONFIG_USER_ONLY && CONFIG_TCG */
+#endif /* !CONFIG_USER_ONLY */
 
 static void arm926_initfn(Object *obj)
 {
@@ -1016,7 +1014,6 @@ static void pxa270c5_initfn(Object *obj)
     cpu->reset_sctlr = 0x00000078;
 }
 
-#ifdef CONFIG_TCG
 static const struct TCGCPUOps arm_v7m_tcg_ops = {
     .initialize = arm_translate_init,
     .synchronize_from_tb = arm_cpu_synchronize_from_tb,
@@ -1037,7 +1034,6 @@ static const struct TCGCPUOps arm_v7m_tcg_ops = {
     .debug_check_breakpoint = arm_debug_check_breakpoint,
 #endif /* !CONFIG_USER_ONLY */
 };
-#endif /* CONFIG_TCG */
 
 static void arm_v7m_class_init(ObjectClass *oc, void *data)
 {
@@ -1045,10 +1041,7 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
     CPUClass *cc = CPU_CLASS(oc);
 
     acc->info = data;
-#ifdef CONFIG_TCG
     cc->tcg_ops = &arm_v7m_tcg_ops;
-#endif /* CONFIG_TCG */
-
     cc->gdb_core_xml_file = "arm-m-profile.xml";
 }
 
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 89d54ec0f6..d0feb3eb52 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -457,7 +457,7 @@ static void aarch64_neoverse_n1_initfn(Object *obj)
 
 /*
  * -cpu max: a CPU with as many features enabled as our emulation supports.
- * The version of '-cpu max' for qemu-system-arm is defined in cpu_tcg.c;
+ * The version of '-cpu max' for qemu-system-arm is defined in cpu32.c;
  * this only needs to handle 64 bits.
  */
 void aarch64_max_tcg_initfn(Object *obj)
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 128f782816..4d99f6dacb 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -18,6 +18,7 @@ gen = [
 arm_ss.add(gen)
 
 arm_ss.add(files(
+  'cpu32.c',
   'translate.c',
   'translate-m-nocp.c',
   'translate-mve.c',
diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 1cb08138ad..1555b0bab8 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -506,9 +506,15 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
         QDict *resp;
         char *error;
 
-        assert_error(qts, "cortex-a15",
-            "We cannot guarantee the CPU type 'cortex-a15' works "
-            "with KVM on this host", NULL);
+        if (qtest_has_accel("tcg")) {
+            assert_error(qts, "cortex-a15",
+                         "We cannot guarantee the CPU type 'cortex-a15' works "
+                         "with KVM on this host", NULL);
+        } else {
+            assert_error(qts, "cortex-a15",
+                         "The CPU type 'cortex-a15' is not a "
+                         "recognized ARM CPU type", NULL);
+        }
 
         assert_has_feature_enabled(qts, "host", "aarch64");
 
-- 
2.35.3
