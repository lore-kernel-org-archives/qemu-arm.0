Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp128501ejb;
        Fri, 17 Feb 2023 12:15:05 -0800 (PST)
X-Google-Smtp-Source: AK7set/9kPKYY0KQtGs4ULdzbSJc8SuZ59uQGgdFtOMKhiQCRxLzex6nW7NME24fyYqavpVo2rmE
X-Received: by 2002:adf:f48c:0:b0:2c5:4add:9e46 with SMTP id l12-20020adff48c000000b002c54add9e46mr1637448wro.28.1676664905047;
        Fri, 17 Feb 2023 12:15:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676664905; cv=none;
        d=google.com; s=arc-20160816;
        b=qLe44Unw7M+Nh7j4eLFGKiZn1lzMv5ntAJgInzqi6onvVSBeQ55sMo8fbT3wmwUky9
         z4G9hFwWZVYmDQjECeEvnPjBrZzFImHFhIWkqYqmap7d+qyjYeXx8FLkrJVaVRzTyJIJ
         1DBBxq62Eusfl9ICOxUH2t2G8yHlqg6b1Tr1Ph/aFug1CRoB0jEqQnnyNMgjxaWwmZla
         LThknWSyJ9iXJptUsROUZxyFT28avXgP82udpPBzWwqwADEmo4eIqnCaMjhnR7V0ol7h
         N7Jo1eTPDX9NmzBfXb9AV2VeEBD9KHZJR/8/RKsm3iU9NjOIdLUwYOwK8hSfpwDm3g8O
         CWTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=PRc0e5uIvfMVp5ULxxJVjzrBpmFpsMaB/O9Bi9dJ6kI=;
        b=na2EMMl4nL/X40DL27Jvus0cLIwjdY7IH33GkRg/Rio9tIrUvqxeHpWH7CzirKY+A0
         yhoIEpxUT4C+M1rRmrKmxfAGp1d7ja3Fgb6SkRtsHsmO88OucWPWnaox75NXY3h1i7X0
         S9F3rrJLZhBcQ0lfFNKQK+GZ/Gtj1XKOt8BA1/DD1egaMV81I6Tu8QDEH8nhH9Hi6162
         0OeB/TfkT4+S5Ud6xTaC6aRdsLaeBf2+H6mL0Ou5E6AMA8IftmIvZdzSgpRjLOxAABgH
         R7FRH5TrmSVtXU5+Zxg3lOIKByx/cN9SfctyRrxjYaj6YKiR/bFf65g9YpxKxYgBqSwp
         s8rg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=y7bSzF5a;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id g16-20020a056000119000b002c54fe4a0cfsi5539960wrx.163.2023.02.17.12.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 12:15:05 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=y7bSzF5a;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A96A220FBD;
	Fri, 17 Feb 2023 20:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676664904; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PRc0e5uIvfMVp5ULxxJVjzrBpmFpsMaB/O9Bi9dJ6kI=;
	b=y7bSzF5a5dR7Eiiat5fnUCNEaAvxgzizzF0jrGgNy78FmJ+qH+vbuONqqEtWIFAP7oHoc+
	4tFhe6rqvIp5V+m9BAPt20+NbSHsBIrtEH+zb8nA3jmoDgQCHYj0QFwpgRqNqZnyC2c763
	E0MDX/al9tXqbmqYe4tX6qzhFBU928k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676664904;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PRc0e5uIvfMVp5ULxxJVjzrBpmFpsMaB/O9Bi9dJ6kI=;
	b=laGEq9l+hesowseAkjTEBYo///KSyJECvctvtAunN1age63m2ChV8RPjgAIQU6OS2OFlX4
	WkHx+KlM3S4jHTAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 62DE3138E3;
	Fri, 17 Feb 2023 20:15:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id SJwfC0Xg72MwIAAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 17 Feb 2023 20:15:01 +0000
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
Subject: [PATCH v6 20/29] target/arm: move cpu_tcg to tcg/cpu32.c
Date: Fri, 17 Feb 2023 17:11:41 -0300
Message-Id: <20230217201150.22032-21-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230217201150.22032-1-farosas@suse.de>
References: <20230217201150.22032-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: A8qXRQtLKqjh

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
 target/arm/tcg/cpu64.c                |  2 +-
 target/arm/tcg/meson.build            |  1 +
 tests/qtest/arm-cpu-features.c        | 12 +++++++++---
 6 files changed, 15 insertions(+), 16 deletions(-)
 rename target/arm/{cpu_tcg.c => tcg/cpu32.c} (99%)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 20a18d0ba1..fbeeed115d 100644
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
index b0bc8a3cea..f03d242ba8 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -6,7 +6,6 @@ arm_ss.add(files(
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
index 64d5a785c1..caa5252ad9 100644
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
@@ -93,7 +91,7 @@ void aa32_max_features(ARMCPU *cpu)
 /* CPU models. These are not needed for the AArch64 linux-user build. */
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
 
-#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
+#if !defined(CONFIG_USER_ONLY)
 static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     CPUClass *cc = CPU_GET_CLASS(cs);
@@ -117,7 +115,7 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     }
     return ret;
 }
-#endif /* !CONFIG_USER_ONLY && CONFIG_TCG */
+#endif /* !CONFIG_USER_ONLY */
 
 static void arm926_initfn(Object *obj)
 {
@@ -1013,7 +1011,6 @@ static void pxa270c5_initfn(Object *obj)
     cpu->reset_sctlr = 0x00000078;
 }
 
-#ifdef CONFIG_TCG
 static const struct TCGCPUOps arm_v7m_tcg_ops = {
     .initialize = arm_translate_init,
     .synchronize_from_tb = arm_cpu_synchronize_from_tb,
@@ -1034,7 +1031,6 @@ static const struct TCGCPUOps arm_v7m_tcg_ops = {
     .debug_check_breakpoint = arm_debug_check_breakpoint,
 #endif /* !CONFIG_USER_ONLY */
 };
-#endif /* CONFIG_TCG */
 
 static void arm_v7m_class_init(ObjectClass *oc, void *data)
 {
@@ -1042,10 +1038,7 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
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
index 8691802950..4ff2014bea 100644
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
