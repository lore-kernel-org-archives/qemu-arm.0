Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp414766ejc;
        Fri, 13 Jan 2023 06:07:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtwamyvWxckYHFMBrLng4evSTPq/Lzt/in2dfrPdW0KXM3DBjOoRKw2Z+GzItiwXZNX3Gzl
X-Received: by 2002:adf:fad0:0:b0:2bd:e539:46e0 with SMTP id a16-20020adffad0000000b002bde53946e0mr1363613wrs.46.1673618845025;
        Fri, 13 Jan 2023 06:07:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673618845; cv=none;
        d=google.com; s=arc-20160816;
        b=RwTUQ/bkM2xI4Tc+N8GjeAL3m8g+VVR+o+OUNLvy6Rtcn+zyrL0M6uJl+dZDO2tK29
         X89Cll3T3EalkNfRWjsn3GASo5+25eaTFeESovfSYFTYGSVLGQWWfvJTuE4J2khk6xeV
         2J2UL0QPoW/vcnZ+eKtZ+9AaDEHLExMQfNOarFeikI2TJov01yzJb5seRkn8cbBLw83L
         3BOqu5BBDi0X5tL29O3uYjBhC083vG5C5CKFIbCfFpH5FyBxBH6CBiLG1hYzDN2sJbe/
         Oc66qiJTOi6L1VdGai2VUSeVRnzOm4aZnqTWMUDQeJYcXa+NLD3WUfOSzgBo/tjEWLMp
         8E2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=BgxTDwH6kxR/wgmh9MEH8ZoFcSs+tVa4bOrsIpU9uAM=;
        b=fCCqawjiJBmj16aq8cFzAOFc3jhay3DodrFKDduYlQWrpiGbWGc3LjFqn3hoyTi/FF
         04ne++OGloxx27DeTpZDWriXEiWotSe6LEzIUbKD5140xVm34fjx6aMjBCaVNHAQdUn8
         5Uve43nXDDZvogs1MEFf2YkeHkakGkRORVvxCUu6ebGqfNYgtPMPPf0iuv1szgox2X58
         jpE0TRnO0qQAzbxtLXtDH2Gq/4ZekAPn2OG2n3GyjiD5pR4kTi2+Ixb1oN0/yUGfYTz+
         K090U/y91mbiTU+XtFxrepAK18kYghysvRrAUGYf8w/lXIqJBoH8EMqYkooQa6rKJv84
         L0Eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=OldAUDvJ;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id k17-20020a5d6e91000000b0022d3f2d67e6si15364750wrz.1038.2023.01.13.06.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 06:07:25 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=OldAUDvJ;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 739FE4DE3E;
	Fri, 13 Jan 2023 14:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673618844; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BgxTDwH6kxR/wgmh9MEH8ZoFcSs+tVa4bOrsIpU9uAM=;
	b=OldAUDvJAp8Nc0yEwoMqFSYH3N7G6aIJXl8qWACQj2djPKXNZc9uR1/mAlAomLhEg/+rBe
	UO8Jye4PWknYjQoR9iJ7dBuztW6pJylktSYueqkDjTU72WUTvO3uO+E38eWLYmhnDODEn7
	E+xYp/Y+dxJdaEIALqgTBebcCvwEGV0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673618844;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BgxTDwH6kxR/wgmh9MEH8ZoFcSs+tVa4bOrsIpU9uAM=;
	b=cL+e37eB+vZVgLphmi89enONeMr+o8GdTGzKxrLGLZN9hbtH6H6x7IEQHuU9mk3nPZK5Th
	u7/WLs2TqppGEzDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D59211358A;
	Fri, 13 Jan 2023 14:07:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id +IFAJ5llwWP8DQAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 13 Jan 2023 14:07:21 +0000
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
Subject: [RFC PATCH v3 19/28] target/arm: move cpu_tcg to tcg/cpu32.c
Date: Fri, 13 Jan 2023 11:04:10 -0300
Message-Id: <20230113140419.4013-20-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230113140419.4013-1-farosas@suse.de>
References: <20230113140419.4013-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: R3C0xWG+PYUn

From: Claudio Fontana <cfontana@suse.de>

move the module containing cpu models definitions
for 32bit TCG-only CPUs to tcg/ and rename it for clarity.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/meson.build                |  1 -
 target/arm/{cpu_tcg.c => tcg/cpu32.c} | 13 +++----------
 target/arm/tcg/meson.build            |  1 +
 3 files changed, 4 insertions(+), 11 deletions(-)
 rename target/arm/{cpu_tcg.c => tcg/cpu32.c} (99%)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 595d22a099..88f1a5c570 100644
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
index 571e29bc16..10c4386222 100644
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
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/boards.h"
@@ -23,7 +21,7 @@
 /* CPU models. These are not needed for the AArch64 linux-user build. */
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
 
-#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
+#if !defined(CONFIG_USER_ONLY)
 static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     CPUClass *cc = CPU_GET_CLASS(cs);
@@ -47,7 +45,7 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     }
     return ret;
 }
-#endif /* !CONFIG_USER_ONLY && CONFIG_TCG */
+#endif /* !CONFIG_USER_ONLY */
 
 static void arm926_initfn(Object *obj)
 {
@@ -943,7 +941,6 @@ static void pxa270c5_initfn(Object *obj)
     cpu->reset_sctlr = 0x00000078;
 }
 
-#ifdef CONFIG_TCG
 static const struct TCGCPUOps arm_v7m_tcg_ops = {
     .initialize = arm_translate_init,
     .synchronize_from_tb = arm_cpu_synchronize_from_tb,
@@ -964,7 +961,6 @@ static const struct TCGCPUOps arm_v7m_tcg_ops = {
     .debug_check_breakpoint = arm_debug_check_breakpoint,
 #endif /* !CONFIG_USER_ONLY */
 };
-#endif /* CONFIG_TCG */
 
 static void arm_v7m_class_init(ObjectClass *oc, void *data)
 {
@@ -972,10 +968,7 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
     CPUClass *cc = CPU_CLASS(oc);
 
     acc->info = data;
-#ifdef CONFIG_TCG
     cc->tcg_ops = &arm_v7m_tcg_ops;
-#endif /* CONFIG_TCG */
-
     cc->gdb_core_xml_file = "arm-m-profile.xml";
 }
 
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 25bc98999e..3c2f1e8d84 100644
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
