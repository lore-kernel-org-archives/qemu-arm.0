Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp709848ejc;
        Thu, 23 Feb 2023 05:11:34 -0800 (PST)
X-Google-Smtp-Source: AK7set8DpDwh1LD6IzEi3zQDUWqFiS0gofUeBxTq8IDSkJWNKxMODJWzZDUs1DWkrlO8fQFJu3wr
X-Received: by 2002:adf:f203:0:b0:2c5:57d5:ef6e with SMTP id p3-20020adff203000000b002c557d5ef6emr13715084wro.46.1677157894795;
        Thu, 23 Feb 2023 05:11:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677157894; cv=none;
        d=google.com; s=arc-20160816;
        b=kEuiKA6E+6fIobqVSWyTkSV490GhRQ/OEwK9V2JpxATAXPBvdo1kuomtSw8qIldOaa
         IP76u8bcIyxYCkHVDwk1f7c4KB4QigMT0DrfIDtdGtuuR3zQ4D1yjHeDHu3VfWxybq/c
         S87OzxjqddFYfSVk7LRW2iISwKaA0uA9/dgNuWyf4Oxnq/63FaUrutT1B54NZrBuA03+
         G2LtSqb2IjPzcB2dv8c7BSpHiygS2UJGefk1DPplKjMmiLoBZRWuD7cTYwKgMFNq9QNa
         VU0Rft4sXkGuAa2Ab50UO4kpO+kRnRsQvQo9B163hfjf2mLMzzamsUC2QaHE4iWqX5L7
         dFrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=rvSgfXOifkyTRtNHxhA8pz3MRazpsyr3UTQvCI1tVRw=;
        b=wVNB6+y6QA9C+Ug2N5FxfBUTMUFYZiLVSVvYbmGpSZ+75mu/E7CzPvH6cB58n85Gy9
         F4UdpA+qL6FJAViLdxJQapdwaHOD8SDAU5/ZG6Ew/mORgo/gN2Zu3sQU06VJYKIsr7TM
         rL6scSSVNIK83KrrkPP/G/RYHD3vinN8Oe3/unr4tGjx2mTWB/JIf0EgOjBqU6bBqOnF
         gjzWSanYgySEmjO6MgCj5wmt9mjdJHAWaOAqTFt9siq3uR7EGZHTR1ofouv/xILpUJ3T
         u5fq4xDzcxT1WteY7xLmlM1miOgm6ySqloZmIVdKS2B6JXXYBnhPhkAk5J7Vtu7pD3CQ
         nX1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=rEYWcScp;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b="hhBC/Gnr";
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id b5-20020adff245000000b002c54782793dsi12498529wrp.76.2023.02.23.05.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 05:11:34 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=rEYWcScp;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b="hhBC/Gnr";
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 708C8218A9;
	Thu, 23 Feb 2023 13:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677157894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rvSgfXOifkyTRtNHxhA8pz3MRazpsyr3UTQvCI1tVRw=;
	b=rEYWcScpUnmjcNdTt3RYnizFqjX5EZVBDsfWyePwjeytTWBPPKVLFpHLmrBOI5GryQLT9K
	uAVsjLTN6eiT0mBCtwyHhkM28W0/27ZTCzYF0HD+O6kjy7LSvo4j8DE0o/fw5yGv/09mFk
	H2QCYOd1c1Ee6W0YC3Fb3ddpULBWlyI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677157894;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rvSgfXOifkyTRtNHxhA8pz3MRazpsyr3UTQvCI1tVRw=;
	b=hhBC/GnrvIq8eaOxtYtMlS/FHu3PHAR6yQIxGBzdBoQ8etdmwrjQyo4Yn2ClDWhYA7InD6
	OEe3m/FIPuOJcMBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 276CE139B5;
	Thu, 23 Feb 2023 13:11:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id QKE7OAJm92MLawAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 23 Feb 2023 13:11:30 +0000
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
Subject: [PATCH v7 14/20] target/arm: move cpu_tcg to tcg/cpu32.c
Date: Thu, 23 Feb 2023 10:08:35 -0300
Message-Id: <20230223130841.25916-15-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230223130841.25916-1-farosas@suse.de>
References: <20230223130841.25916-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ktZnqpRN7xrY

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
