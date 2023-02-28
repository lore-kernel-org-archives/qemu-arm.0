Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6099805ejc;
        Tue, 28 Feb 2023 11:28:48 -0800 (PST)
X-Google-Smtp-Source: AK7set+KU1O8ZrP8ylJ3X/dF2YyM85ukB3v6pQdqHZ2E210agUlumI5gWf4CWK11dqKFFuWPjqLm
X-Received: by 2002:adf:e587:0:b0:2cb:2775:6e6 with SMTP id l7-20020adfe587000000b002cb277506e6mr2704656wrm.45.1677612528207;
        Tue, 28 Feb 2023 11:28:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677612528; cv=none;
        d=google.com; s=arc-20160816;
        b=HGuaszt/cZVEbaNLJLeCdizSZrkE+XZPzGp6Mc7d88ddenlDiY5qnRWt231JwItr2m
         fAZrfhsbngUkroKdVPht1/KNIWKWlZe9s3veE2tbVsW6S4iz+5rD++3qA8m9qqwTD1QC
         i2nzKXvFpGGkd48/F19F9CAfWPq34DrjB9Dmb/guSOZVZzIgFOdHPMwGe35yd++dSG0B
         6IxLEYJjt+FrVSc/axWePoJSuJylQSwuXIT2hL/LmUkQEv4DG7MexslN9TeVEQy0nb/2
         YWHMJF7ojGcnAWW/BYI/7yxyOqCBdcPIn7aZnfA4BzZWA5wxd/9Y0k62V7I/6fmoNOpM
         +Glg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=rvSgfXOifkyTRtNHxhA8pz3MRazpsyr3UTQvCI1tVRw=;
        b=a1iTZGMGlBcXPxid1QcFb7kiMAaTCw37apQmppAg1yzR67yX8N3hcRy3tGoMEL7scG
         fvLZoYmqc3twrkFX1ywv9hn0jn1nARG9GaKEGbT/Gr3vnSAPS0TSJuq5nbUuq8BhBDQ1
         +KsJih5I/yGJLp2RFQ0BJHbxzBmy7pvdt9+x64bOCm4bNzp4Dil6ZrVmfHqGpgkPYpBh
         8EcCM+kKjD5T1/d2NCu+Tlr5cJhDVapVxgFYEkPixLipOrosdfM3QW5xrtjD+eag5b4n
         4BWpYAjEx2+PzAOF8n+CHvxV+W5mupgqa0yCgfDSY9odWcSaQkepGAG8gs+MJMPFwr1l
         tMig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Y+ANBmc7;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id g10-20020a5d540a000000b002c54d2cb78esi8927512wrv.607.2023.02.28.11.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 11:28:48 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Y+ANBmc7;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C664821A7A;
	Tue, 28 Feb 2023 19:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677612527; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rvSgfXOifkyTRtNHxhA8pz3MRazpsyr3UTQvCI1tVRw=;
	b=Y+ANBmc7ko7GqjtwQAGxrkmZ7RYH8WUxg7AnaLC0Bx6ASPiFMCGltda4os1qjMkwHck0+E
	52xkh2GLaQgqHZsdcFsR48kuRfBrTumJiW7FAL1QyqR31nsJvOkEDcYMDjIyeCfJwLhecB
	/mVbZ6Q02wxZz0027dXJwgq32LJ8roI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677612527;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rvSgfXOifkyTRtNHxhA8pz3MRazpsyr3UTQvCI1tVRw=;
	b=D6oVQ5iDIbG2Jj7y/J1nNvce08hFidrdJ+1fU0IqC5ooJ7F5KMZySV+iTR8+uNuYjkcP/4
	5gsGGVi9ZEZtjtBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 862861333C;
	Tue, 28 Feb 2023 19:28:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id cOj3E+xV/mNBagAAMHmgww
	(envelope-from <farosas@suse.de>); Tue, 28 Feb 2023 19:28:44 +0000
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
Subject: [PATCH RESEND v7 4/9] target/arm: move cpu_tcg to tcg/cpu32.c
Date: Tue, 28 Feb 2023 16:26:23 -0300
Message-Id: <20230228192628.26140-5-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230228192628.26140-1-farosas@suse.de>
References: <20230228192628.26140-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: qt1GMo6CZJsg

From: Claudio Fontana <cfontana@suse.de>

move the module containing cpu models definitions
for 32bit TCG-only CPUs to tcg/ and rename it for clarity.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/virt.c                         |  2 +-
 target/arm/meson.build                |  1 -
 target/arm/{cpu_tcg.c => tcg/cpu32.c} | 13 +++----------
 target/arm/tcg/meson.build            |  1 +
 tests/qtest/arm-cpu-features.c        | 12 +++++++++---
 5 files changed, 14 insertions(+), 15 deletions(-)
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
index d236112684..85a884808e 100644
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
index 5a2690f56e..4cbd7d68fb 100644
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
@@ -27,7 +25,7 @@
 /* CPU models. These are not needed for the AArch64 linux-user build. */
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
 
-#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
+#if !defined(CONFIG_USER_ONLY)
 static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     CPUClass *cc = CPU_GET_CLASS(cs);
@@ -51,7 +49,7 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     }
     return ret;
 }
-#endif /* !CONFIG_USER_ONLY && CONFIG_TCG */
+#endif /* !CONFIG_USER_ONLY */
 
 static void arm926_initfn(Object *obj)
 {
@@ -947,7 +945,6 @@ static void pxa270c5_initfn(Object *obj)
     cpu->reset_sctlr = 0x00000078;
 }
 
-#ifdef CONFIG_TCG
 static const struct TCGCPUOps arm_v7m_tcg_ops = {
     .initialize = arm_translate_init,
     .synchronize_from_tb = arm_cpu_synchronize_from_tb,
@@ -968,7 +965,6 @@ static const struct TCGCPUOps arm_v7m_tcg_ops = {
     .debug_check_breakpoint = arm_debug_check_breakpoint,
 #endif /* !CONFIG_USER_ONLY */
 };
-#endif /* CONFIG_TCG */
 
 static void arm_v7m_class_init(ObjectClass *oc, void *data)
 {
@@ -976,10 +972,7 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
     CPUClass *cc = CPU_CLASS(oc);
 
     acc->info = data;
-#ifdef CONFIG_TCG
     cc->tcg_ops = &arm_v7m_tcg_ops;
-#endif /* CONFIG_TCG */
-
     cc->gdb_core_xml_file = "arm-m-profile.xml";
 }
 
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
