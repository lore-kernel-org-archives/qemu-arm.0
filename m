Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp127788ejb;
        Fri, 17 Feb 2023 12:14:16 -0800 (PST)
X-Google-Smtp-Source: AK7set+Dd47VA4hVD6LYsQN0AYmxFAXyx2o1uou87tRsZBJ9gXibSN9+X6FQb/kGEUVo2btilgpv
X-Received: by 2002:a5d:47ce:0:b0:2c6:825d:ed13 with SMTP id o14-20020a5d47ce000000b002c6825ded13mr3364440wrc.25.1676664856037;
        Fri, 17 Feb 2023 12:14:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676664856; cv=none;
        d=google.com; s=arc-20160816;
        b=R3f/D0ltVhXEcadVjnrnf4/R8bdRHB3imCxwDV8lx2xQSpvBSPK5c6enz3/FAgTPQH
         zkIOOAtuQ9u9KfgpdVrAc1pfbS6aspMQvtxH5iPbtoSC2PW9zHQNZVvWib5RU0C6O38O
         FuUFTHREBtZaniKHDb2n7BI01nq0OIALcGJE0mUOV6QRw//Ms6910gtrDAJ3ORqQZNxv
         qRJIkl7zLhNHTZIgOe9kCQDm3a57iSaYmZn7P5+5dPuJ/0sij3drg3yfs9OTYO3kxHVP
         14qRqTyMMVujdX+sOI8SCgukRMcR1uXDPyiR9E8MzmXUfkUXYjw753oGhWO4UZrRzb1W
         9M8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=cWoKPCghIzAA36VHFtdF7EWD4R4fSa9iv5Mvy17UrUQ=;
        b=CVXB0t9/rwLCt4ScplNlgzbHbdYTin7K9yU12ER85FKCnl484vKzp0wtkSuKZePApi
         JUEN6ZDBDmMH4swm5R50DSc/XgWLrdK4bmkqzyMXYXK1EtcrcxN7ORKmLxfS24jRVTP5
         qttE946x0cUtbdWS/+dUBJB4JmP8LinK/M0ikRpjstEVdp0dJdJUzTJPiVgpu0E13hxA
         cJbghlPxKbrvQR8drmf/OmH3TU1epGxHK7Ri5Em1UWKmeTuCVpuMjqQM6Md+S5IgBDjb
         C43d/XfL8IEYbQsqbxG24us9veTHob9RcyUXyAM2Jx8vWY0BaMZLs1oyRG0y8lyFiYqn
         VtzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=E8H92Fu7;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id x4-20020adfdcc4000000b002c56a45ce85si5248092wrm.124.2023.02.17.12.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 12:14:16 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=E8H92Fu7;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A10C434656;
	Fri, 17 Feb 2023 20:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676664855; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cWoKPCghIzAA36VHFtdF7EWD4R4fSa9iv5Mvy17UrUQ=;
	b=E8H92Fu7pxxxC7YkLvNa7ntDobDWc/86nKvriyCVFr3vJG30Ml6xu1HVEh8r6NUeY22GjZ
	be79AzrxhLUiEnyLeRKWr5s+FwOiy72PPEP8+oBf7l4gji+rl6YnXzOQkrnVN8MlfMP2VV
	t9z7eR4aFUm64PPw464Vxb4IYS0ZRUY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676664855;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cWoKPCghIzAA36VHFtdF7EWD4R4fSa9iv5Mvy17UrUQ=;
	b=620edRjpYvs3UbTLXPd9RzvVztpJTlfFROzTGcJuMxEhVDnDvM4zcH8AOw6zbq/RDj8QRu
	07BmS+RZM+qy6lAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B6782138E3;
	Fri, 17 Feb 2023 20:14:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id iJ6RHxTg72MwIAAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 17 Feb 2023 20:14:12 +0000
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
Subject: [PATCH v6 06/29] target/arm: Wrap breakpoint/watchpoint updates with tcg_enabled
Date: Fri, 17 Feb 2023 17:11:27 -0300
Message-Id: <20230217201150.22032-7-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230217201150.22032-1-farosas@suse.de>
References: <20230217201150.22032-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 9BnhcbHeanF5

This is in preparation for restricting compilation of some parts of
debug_helper.c to TCG only.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
Dropped r-bs because I added a few more ifs in debug_helper.c
---
 target/arm/cpu.c          |  6 ++++--
 target/arm/debug_helper.c | 16 ++++++++++++----
 target/arm/machine.c      |  7 +++++--
 3 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5f63316dbf..d7ceb626f0 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -536,8 +536,10 @@ static void arm_cpu_reset_hold(Object *obj)
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
