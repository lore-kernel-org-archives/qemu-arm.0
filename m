Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp709135ejc;
        Thu, 23 Feb 2023 05:10:50 -0800 (PST)
X-Google-Smtp-Source: AK7set++x7GGoH+hqF6kbdVG/mEjD7pHrztj4Cb0qHtM5QnVVmQD7qcTS1r6V+ckGiEUmIdHFhxM
X-Received: by 2002:a05:600c:92a:b0:3e2:24a0:ba26 with SMTP id m42-20020a05600c092a00b003e224a0ba26mr8417444wmp.16.1677157850603;
        Thu, 23 Feb 2023 05:10:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677157850; cv=none;
        d=google.com; s=arc-20160816;
        b=ZppE/iTY6WJFVOpFLJUcRBXpszYYGo2K5Qxu65usQrUNUxtV3h4Py0WOIybq+rRqAA
         k5tUefITcedM33I98IQt/EsF4iLnEEZFjD/L3Kj2SJH0/RyZqCrb0CxAFrPZ8z/kePD8
         hXOdX+Vv3tkHbu3DRnG+AkGBkYsxVvaDGnN9ixjO9j7U2uPxOqZ/oySTdAr1PQF7Ks0d
         xaOya9A+ceyYnWK/p6yGht1puEOFAhlULhhkCyIrg6hZxBcI9zAQNexfCpvg20VLBnXA
         zPuvJV/0VBYshbOE+PbsbCMUFPW9UYuQ3ccu+y30T4LUdURGQHN5gvi4R82bPgRcDe3C
         CLmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=natOrxcghh2zyYNa/12pnvmlNmiN5SwAjy+1kjcsMMY=;
        b=Vd2j37pHXfceh6bPGguV9SG0k1F3C3dMjQD0BbtwrQggQ1T6QRlGLIxq+oHuneAI/x
         uH5+U2OZnIxIMbmmUDL1QALj6g89iKNKxWtC0Ks2kVd8zOmy2JT4nd7G86tKMo2ovGj5
         2GBbnjGzujY/4Jeg3Lwp+ZZ908nr2ELKmVfF72HlwzfinCOTVC+h64fu5MiAVqV9+k5G
         ddxwPuO/Xw2rThazU4MMn+VR0FxuUmko8Q9iNacOlqfH4qLCqlOu18i/wWvbGqL8Md/E
         yr2GLnJJm/rZ/X5pHDAFel7IyxUX/XI5/x8x00yvl/XQDXnsMrxjwkwWUucbQ6X7FP/h
         3klQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=omHOwDnT;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=uMT6nHEp;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id b42-20020a05600c4aaa00b003d6537396fcsi1737512wmp.46.2023.02.23.05.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 05:10:50 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=omHOwDnT;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=uMT6nHEp;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3DA4D204AC;
	Thu, 23 Feb 2023 13:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677157850; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=natOrxcghh2zyYNa/12pnvmlNmiN5SwAjy+1kjcsMMY=;
	b=omHOwDnTh3dPR4EYEhTgChOxCf2s1qAVBtJQ63u2c7kVIX+47CzGCO2DyEb7K387mm3DaS
	kdxvVitdCF+x+QTAp6vi7clK55qeMbQelUP6r4aIduJ0dagFnmdq+e8lQoHkDhUXmhLJ9F
	oYCLNQKSVKsqwVA41ILHujCierY6poA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677157850;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=natOrxcghh2zyYNa/12pnvmlNmiN5SwAjy+1kjcsMMY=;
	b=uMT6nHEp4ZgOtJHgdhba+R7OK+w6sSfJIXG/qLMkT/pCEMeWwmWEPdECtmEnU50KDM7S8Q
	OnDzdLhGT8zAT6BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 60B53139B5;
	Thu, 23 Feb 2023 13:10:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id eBy2Ctdl92MLawAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 23 Feb 2023 13:10:47 +0000
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
Subject: [PATCH v7 01/20] target/arm: Wrap breakpoint/watchpoint updates with tcg_enabled
Date: Thu, 23 Feb 2023 10:08:22 -0300
Message-Id: <20230223130841.25916-2-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230223130841.25916-1-farosas@suse.de>
References: <20230223130841.25916-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: zhpCXD4dPTms

This is in preparation for restricting compilation of some parts of
debug_helper.c to TCG only.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/cpu.c          |  6 ++++--
 target/arm/debug_helper.c | 16 ++++++++++++----
 target/arm/machine.c      |  7 +++++--
 3 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 876ab8f3bf..da416f7b1c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -539,8 +539,10 @@ static void arm_cpu_reset_hold(Object *obj)
     }
 #endif
 
-    hw_breakpoint_update_all(cpu);
-    hw_watchpoint_update_all(cpu);
+    if (tcg_enabled()) {
+        hw_breakpoint_update_all(cpu);
+        hw_watchpoint_update_all(cpu);
+    }
     arm_rebuild_hflags(env);
 }
 
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 3c671c88c1..3325eb9d7d 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -939,7 +939,9 @@ static void dbgwvr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     value &= ~3ULL;
 
     raw_write(env, ri, value);
-    hw_watchpoint_update(cpu, i);
+    if (tcg_enabled()) {
+        hw_watchpoint_update(cpu, i);
+    }
 }
 
 static void dbgwcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -949,7 +951,9 @@ static void dbgwcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     int i = ri->crm;
 
     raw_write(env, ri, value);
-    hw_watchpoint_update(cpu, i);
+    if (tcg_enabled()) {
+        hw_watchpoint_update(cpu, i);
+    }
 }
 
 void hw_breakpoint_update(ARMCPU *cpu, int n)
@@ -1062,7 +1066,9 @@ static void dbgbvr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     int i = ri->crm;
 
     raw_write(env, ri, value);
-    hw_breakpoint_update(cpu, i);
+    if (tcg_enabled()) {
+        hw_breakpoint_update(cpu, i);
+    }
 }
 
 static void dbgbcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1079,7 +1085,9 @@ static void dbgbcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     value = deposit64(value, 8, 1, extract64(value, 7, 1));
 
     raw_write(env, ri, value);
-    hw_breakpoint_update(cpu, i);
+    if (tcg_enabled()) {
+        hw_breakpoint_update(cpu, i);
+    }
 }
 
 void define_debug_regs(ARMCPU *cpu)
diff --git a/target/arm/machine.c b/target/arm/machine.c
index b4c3850570..fd6323f6d8 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -2,6 +2,7 @@
 #include "cpu.h"
 #include "qemu/error-report.h"
 #include "sysemu/kvm.h"
+#include "sysemu/tcg.h"
 #include "kvm_arm.h"
 #include "internals.h"
 #include "migration/cpu.h"
@@ -848,8 +849,10 @@ static int cpu_post_load(void *opaque, int version_id)
         return -1;
     }
 
-    hw_breakpoint_update_all(cpu);
-    hw_watchpoint_update_all(cpu);
+    if (tcg_enabled()) {
+        hw_breakpoint_update_all(cpu);
+        hw_watchpoint_update_all(cpu);
+    }
 
     /*
      * TCG gen_update_fp_context() relies on the invariant that
-- 
2.35.3
