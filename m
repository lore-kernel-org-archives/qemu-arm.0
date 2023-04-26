Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp593504ejm;
        Wed, 26 Apr 2023 11:00:43 -0700 (PDT)
X-Google-Smtp-Source: AKy350YtkKp5CIk0geL3CF02P06JygmHkhzt889lDSXhhk+J6qbVOcYAbXUOXG7U8y7bSjTuaJjq
X-Received: by 2002:adf:f80d:0:b0:2fb:1269:13c0 with SMTP id s13-20020adff80d000000b002fb126913c0mr18082007wrp.27.1682532043518;
        Wed, 26 Apr 2023 11:00:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682532043; cv=none;
        d=google.com; s=arc-20160816;
        b=COGsvQi5ARnXpqt8L7wPN5IEXdgV2qjNbrFpou444LPON3Qb2Ah44+FDypZWQvnmnt
         Z+M7YFBs9QHgvqHjUWnUZFKESk4S3ILlHzOoTn3jcQA7E1qEWxXCFgin84Huls/uG/gL
         VT5iYVZGt50eONbEq949OnFQZE9bz6NbI0EP012AR4wgGKv/Nxyr27acIFtwA1NGR+Qe
         IW5W+ddbeeTFtMtX3O+W05iFNlUrVVozFW3HBnhJqC2PtDAJZojRpbJqhIl+TGo7BoPl
         h8quDhXWps+kvhxcabsLI04NnFn7mzAQXUcnNpwgD0qHYCFedFmxZRluQ6IZhVPPI/PN
         SmKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=/AJg4ST4FrMj/BP0/dvt6yDic8CTYikOQEsRe/mQRjw=;
        b=HE2GTeGGKOtHVbjBpftj9hWOTJZYvuMvSPppvgikVAGjbF6pLE8sptfTxBkwuogEAW
         HkEkyAEJdQMwR2nIAJprDTn1k7+TzR6gt3pWr7OgLhMGoq9pwFeD9V9b1Q4oKewYxb4e
         /PqvPS/ZBX6cRTL+JUTJF0hd/kVaC54j0ytAXrtsKW2MXiL/+w83eveOkmXAvAGooNmX
         DCey2h2JN+jS3dFgU+xjiO2Fizzu3jF8zDVYxOZZRm3mJFwB6UZIxbWMQOmmpvctPKor
         xUrEUvu1dXsZGVB2ciIdBMGpA70mE+D/O/SskHFXZxsYGV2t92NrLqxH3BN3EXAzVbJy
         R1kw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=MA3kEbVb;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id x1-20020adfec01000000b002efebdb1714si10566161wrn.664.2023.04.26.11.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 11:00:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=MA3kEbVb;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2BC071FDD8;
	Wed, 26 Apr 2023 18:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1682532043; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/AJg4ST4FrMj/BP0/dvt6yDic8CTYikOQEsRe/mQRjw=;
	b=MA3kEbVbOq9tnRZrlb/1NQ90da4r51UJmBp32HtVSB5oTiTjiTEtWMx6jd2jImu/I9vmpr
	Gfpuepcafqc43Z70RrotO9Zzoov2aAnSkEYgJ2DhbWv+WEx7FbglR29HzXi/G73hgkXYE5
	rDdW+r8Cow7VmOgNuiHVBPCQjoRLa+o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1682532043;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/AJg4ST4FrMj/BP0/dvt6yDic8CTYikOQEsRe/mQRjw=;
	b=rouegVn1EAJ6fcv7Lqu56bMIDUIObssj9CiNk1eOdzfhIXfuf1qIULYwot2bHvHXokxTP6
	Ua/TpwM7pl8aXbDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 12913138F0;
	Wed, 26 Apr 2023 18:00:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id CNcaM8dmSWSoVQAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 26 Apr 2023 18:00:39 +0000
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
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH v11 07/13] target/arm: move cpu_tcg to tcg/cpu32.c
Date: Wed, 26 Apr 2023 15:00:07 -0300
Message-Id: <20230426180013.14814-8-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230426180013.14814-1-farosas@suse.de>
References: <20230426180013.14814-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: FdJ7QmPRTiFl

From: Claudio Fontana <cfontana@suse.de>

move the module containing cpu models definitions
for 32bit TCG-only CPUs to tcg/ and rename it for clarity.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/virt.c                         |  2 --
 target/arm/meson.build                |  1 -
 target/arm/{cpu_tcg.c => tcg/cpu32.c} | 13 +++----------
 target/arm/tcg/cpu64.c                |  2 +-
 target/arm/tcg/meson.build            |  1 +
 5 files changed, 5 insertions(+), 14 deletions(-)
 rename target/arm/{cpu_tcg.c => tcg/cpu32.c} (99%)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 1450a9f363..b99ae18501 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -206,9 +206,7 @@ static const int a15irqmap[] = {
 static const char *valid_cpus[] = {
 #ifdef CONFIG_TCG
     ARM_CPU_TYPE_NAME("cortex-a7"),
-#endif
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
index 15aa88e40f..47d2e8e781 100644
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
@@ -1014,7 +1012,6 @@ static void pxa270c5_initfn(Object *obj)
     cpu->reset_sctlr = 0x00000078;
 }
 
-#ifdef CONFIG_TCG
 static const struct TCGCPUOps arm_v7m_tcg_ops = {
     .initialize = arm_translate_init,
     .synchronize_from_tb = arm_cpu_synchronize_from_tb,
@@ -1035,7 +1032,6 @@ static const struct TCGCPUOps arm_v7m_tcg_ops = {
     .debug_check_breakpoint = arm_debug_check_breakpoint,
 #endif /* !CONFIG_USER_ONLY */
 };
-#endif /* CONFIG_TCG */
 
 static void arm_v7m_class_init(ObjectClass *oc, void *data)
 {
@@ -1043,10 +1039,7 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
     CPUClass *cc = CPU_CLASS(oc);
 
     acc->info = data;
-#ifdef CONFIG_TCG
     cc->tcg_ops = &arm_v7m_tcg_ops;
-#endif /* CONFIG_TCG */
-
     cc->gdb_core_xml_file = "arm-m-profile.xml";
 }
 
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 646aa46ac9..886674a443 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -525,7 +525,7 @@ static void aarch64_neoverse_n1_initfn(Object *obj)
 
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
-- 
2.35.3
