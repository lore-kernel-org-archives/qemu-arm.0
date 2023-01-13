Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp414237ejc;
        Fri, 13 Jan 2023 06:06:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsCPRw6c8efqHapJRtovcX9ZRjFVQfqVS4nJ6DrPSI8ItFsCWFbpvwaKwoIZYAUU+t3CAaK
X-Received: by 2002:a05:600c:348b:b0:3d1:fcb4:4074 with SMTP id a11-20020a05600c348b00b003d1fcb44074mr69478911wmq.22.1673618811386;
        Fri, 13 Jan 2023 06:06:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673618811; cv=none;
        d=google.com; s=arc-20160816;
        b=XHjbfG0eEBD5de3CuGpnw0VFo/NWmSmDojTmFzAvKYwwHpSSj06RG4pii4LejHWvgz
         9ZIyl5nYmn6bbzVITuhKh56LgewWlLXtPGX/bAEkNLuktXODDkByXdlQTnITkI5L5lsS
         PUnAX2awtgd6YSSSY7+Yz/QSC0zhT/eLmF20CfHqP12zUGRbL3YVY8/NYFaJoOw9nYHG
         vXAVyRRhNo5F2JPcDts2MRw2oI/05xm+ckHki92HFsKl3SJ3KE1/mwQKlKRnOu6kFs8r
         uvsuJ44FFp60HN4xx9w5Y8WvRgUIRjzwx0Coqh5CkXeAvwpXGXAxX7AgGJ6Jg0IMb7nk
         89Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=zdx/DEqLzQMYgEHH7tnz4JGlDJ/KUsHoJefH9vp5tQs=;
        b=T68DGSXSTbKc6kyoYQXln2Cb7zXj2jmAZX3VPMtiPacpgUadS4dzy2rk6mkjIJTTOZ
         yFVrQ2pdOAUmV+3HgxjCGGg5aFIn20CZ78N5FfmMPOQIi8O0/ibo582vGCcI71dpMNCv
         jwU/AmkzrGkoMY667FL4VwDiInrVhvjxjOSsW6h0Nk+yxazsHOGvxX/6NMCPRP9C0urD
         eH9ca9FFj1PgnImbUOR5+mwRGo/ca8Zstr9F0HsF6kziR0UsO/1oA+Uj8VWYIWNBqC6x
         dRFmph1+9D26NEOCNx0UB3qnYxe66ocVdOiam5d0OeGDlRwe0geqWU45539DsSKJl1nC
         spjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=lvxErHdF;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id a4-20020a5d5704000000b002bddca42590si2040712wrv.1029.2023.01.13.06.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 06:06:51 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=lvxErHdF;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CC2086B4F0;
	Fri, 13 Jan 2023 14:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673618810; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zdx/DEqLzQMYgEHH7tnz4JGlDJ/KUsHoJefH9vp5tQs=;
	b=lvxErHdFWIgp8l6JcB51BLPYCeZccMCA+sI2BjL2KUqMfTCER83sVdVpTmLosbbpI+dVQT
	ygygtzJ9RJ+v43e/GvVq632QKmf9t7sLBjNcdd6uXj9rRtDwGvayXz9+REHinDY39dh5HJ
	aH3lhzb2HUN2NgQtsFAqEvHeE6mZs+g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673618810;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zdx/DEqLzQMYgEHH7tnz4JGlDJ/KUsHoJefH9vp5tQs=;
	b=58gusg8w23j663ZZWJQ4YiasbwzXO5iGMRWhrs3/QYknlIpzhon9QyaKw1eU/N+8eGMqXz
	d3msxh4U/xj7uGAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 374131358A;
	Fri, 13 Jan 2023 14:06:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id sJOsAHhlwWP8DQAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 13 Jan 2023 14:06:48 +0000
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
Subject: [RFC PATCH v3 08/28] target/arm: Wrap breakpoint/watchpoint updates with tcg_enabled
Date: Fri, 13 Jan 2023 11:03:59 -0300
Message-Id: <20230113140419.4013-9-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230113140419.4013-1-farosas@suse.de>
References: <20230113140419.4013-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 31V7tWQQsniN

This is in preparation for moving debug_helper.c into a TCG-specific
directory.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/cpu.c     | 6 ++++--
 target/arm/machine.c | 7 +++++--
 2 files changed, 9 insertions(+), 4 deletions(-)

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
