Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp345540ejc;
        Thu, 19 Jan 2023 05:56:37 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv80WEefLTNfTHpnyxuvXLKCottYcRPV6MsjbLrCno8v5PKBet+oHuVNvWCxhXEIkkRqcGy
X-Received: by 2002:a17:906:a88c:b0:7c1:5098:907a with SMTP id ha12-20020a170906a88c00b007c15098907amr11249291ejb.35.1674136597783;
        Thu, 19 Jan 2023 05:56:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674136597; cv=none;
        d=google.com; s=arc-20160816;
        b=B/JlDcCIF63GiR+qoyDED5bqeaGMvwKZyoY3V0cvdWVYktWFun/IDMO/KYjxERszLV
         dK3XksrYhYSYOd3rxgFwvSYwSrkomUFL8PCbvSlLfwutDTZIv9VOcTjySJ80oHuhalOR
         2bc4MghtQnPEHVRBXahKzNEEn3oyiI6BM18jJd9QWOI9VPYdOMUUM1W8K/tcY0Ngat79
         KXM9bfL8aEipsQf+AOfhXnHsBOZXbK/WGmBWYhDxUsOjzQo6JSZSnMtGIqzptwbBW+10
         AobwP68V4w6jQk0Q5S7yhsfpx9eXIGww6bDak45qUzYE0h9QXj5Mx/tClAUtQ433nd4S
         aMiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=ra1qat97EQPLudkBbHcze3B8+J/jBfibJTx/9Jf2oPk=;
        b=cutq+Bf/D7n+otObr2H/OWJIEREN8EknyTgyBVSllOPHe12hsFBcmMpJZS+UY3qn4K
         UccmND//1ffTEQeX8Fjwaob0aWNoiAddf4DJZcQEqXUgwSog0HyJMI2On0rMnNa8EJiV
         QYLpIXOFfcoPNIIVKqaYvIF0dnfhZ/dXsnZJ3k8ZMdB083jnHx54ROFonPxn5xt+T465
         7/68jkZ4mxCq+sOC9IZmcFQu/aj98U8n9kyIeCZdyOVG1eGD/lO4bTv/iob0m1nwHefz
         sXY/jZnlty/Mxji7TnKjgwwktclUwVBRQkdYk4vYev1uUjIAa5cjKc7wuCP57NBBB5BR
         sIRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=0QgKb17X;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id he34-20020a1709073da200b0087028d25e14si16501942ejc.565.2023.01.19.05.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 05:56:37 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=0QgKb17X;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 691FF5CE75;
	Thu, 19 Jan 2023 13:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674136597; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ra1qat97EQPLudkBbHcze3B8+J/jBfibJTx/9Jf2oPk=;
	b=0QgKb17XxI5hNGAvmw83qanl46BOrG4++BmOF05mMIKO0N6jztb05U8IjjtZeJwMY/84h6
	CCb6ihd7UVSUojZFS3480aBcRXfpkUtZyX10PiAMLCa0tzGOlwOzr3PK2fWdf/dLNUHfjZ
	FjXSE6Nu2QAf9kHBxMzCvvCkFqLfnIw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674136597;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ra1qat97EQPLudkBbHcze3B8+J/jBfibJTx/9Jf2oPk=;
	b=CmeqMOLt3Dh34k4MvQ+qUFBbZKSdV2JuN/xwEA16vRBXN+1yWaZUguAeF6cqfirJ0C6NdF
	k1sSxrvhqzdljWCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 63576134F5;
	Thu, 19 Jan 2023 13:56:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id aCJwChJMyWOCFAAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 19 Jan 2023 13:56:34 +0000
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
	Cornelia Huck <cohuck@redhat.com>
Subject: [RFC PATCH v4 02/15] target/arm: move cpu_tcg to tcg/cpu32.c
Date: Thu, 19 Jan 2023 10:54:11 -0300
Message-Id: <20230119135424.5417-3-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230119135424.5417-1-farosas@suse.de>
References: <20230119135424.5417-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 6uFbipiq1OIw

From: Claudio Fontana <cfontana@suse.de>

move the module containing cpu models definitions
for 32bit TCG-only CPUs to tcg/ and rename it for clarity.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/meson.build                |  1 -
 target/arm/{cpu_tcg.c => tcg/cpu32.c} | 13 +++----------
 target/arm/tcg/cpu64.c                |  2 +-
 target/arm/tcg/meson.build            |  1 +
 4 files changed, 5 insertions(+), 12 deletions(-)
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
index 4d5bdddae4..92943853ce 100644
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
index 8debe81fd5..cea1e594c1 100644
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
