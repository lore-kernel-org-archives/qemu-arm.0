Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp787469ejc;
        Wed, 18 Jan 2023 11:37:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXso14DcX703cG1NWCswqNiKTdreeY+XRqvl1c9eYX34gEbDKzVXH2stdfo3gvf7UBxDkuUr
X-Received: by 2002:a05:6000:384:b0:2bd:fe8b:2a22 with SMTP id u4-20020a056000038400b002bdfe8b2a22mr7775956wrf.49.1674070670187;
        Wed, 18 Jan 2023 11:37:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674070670; cv=none;
        d=google.com; s=arc-20160816;
        b=Dvo8LVdYMiU0lK1qMgvaTV8GIEyov/0XnJXRosrpl+dzSjzIo2q37BhAcRF3oGJRrD
         A3WbiaAnfk64998e8qdhyKcukRGVsZ6n75eg+STgJnexSXGQzWfj8hZiav3j4T0R40g/
         PsyfVzxUD+j633Qf1G//1LFhQ0pOud8rL9cVotDQMT54KBW0Xou3Y9DtXR6NB15CPwKM
         W9MVIAt286ZY3+QehosVq7FK5ZWW1L1Q4x5orYtNwgw7SH/YlXD41lmFcmO6BldQ+mNp
         anlvz8ujiHRBIiRPDJYo5ffjMhJLnKY7FNGnErxvdVjwzjDimUFTUtARfymR3AD6Usbs
         zXyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=meCVjgRR8YO54X20etQhiNgUYCSA+fv2Iuvux1hEpY0=;
        b=H4cQGAVoJk4/sVrZBN6FAH8aFRcrViL13DbewCV1/mu+Ad1M0GgDjkCJ3Dssl1w0Ic
         6wNDzy68Qsqcllvb2dwsOv1uFM5AYNvo8+3k5W+HNJSV96XkYkSYV9Mu9hcNJuJCxuUo
         zrIAVuXSbUg9UJ/KPIc8KtgpgByFBSd6F4e9GO4La9NIRsWMJf6z6KoX5CIZd6UWLJ9L
         ZH8xxR6p9FQmvVH8vkl2rGyj578QFTxkas/vjh1B6Eyz8aoS19ROMR0X0cCbutu3tawV
         /25UbFANezVLB6vPV9O1kGYZO2owA0aDOpNkeRze0adhIv5CQq7CtAL0WYM6Dw8aYHmU
         m2rQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=RHJoWxdl;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id b15-20020a05600003cf00b002bde01e04cfsi15009045wrg.794.2023.01.18.11.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 11:37:50 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=RHJoWxdl;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CEC435BEDA;
	Wed, 18 Jan 2023 19:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674070669; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=meCVjgRR8YO54X20etQhiNgUYCSA+fv2Iuvux1hEpY0=;
	b=RHJoWxdlXshM8g9Ina0PxrPAl7Ci1YcCSOU5yS39oBMGdpTV/R9aedj80lVqs/jJlOoGOB
	dApC0EIkBbIXGqJc74palmNuyTuwf7VBaQ97oLwng+Jv+Mg/KdEZuQIJT23BI5FkMw2Bve
	ScCpcfGbZuMo5IsWOVIanWXPeZ+h4k4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674070669;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=meCVjgRR8YO54X20etQhiNgUYCSA+fv2Iuvux1hEpY0=;
	b=9jBYDMRl+i4CLeMUivUMch/C4xLsHHloAiDoK5fx0i09885exFaosdO9hOEvSVJiNLLzDk
	IAMoA9Jk5rd9SEAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 33EC9139D2;
	Wed, 18 Jan 2023 19:37:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id WHxtO4pKyGOWBwAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 18 Jan 2023 19:37:46 +0000
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
Subject: [PATCH 08/20] target/arm: Wrap breakpoint/watchpoint updates with tcg_enabled
Date: Wed, 18 Jan 2023 16:35:06 -0300
Message-Id: <20230118193518.26433-9-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230118193518.26433-1-farosas@suse.de>
References: <20230118193518.26433-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: CfbE/2KWoKCw

This is in preparation for moving debug_helper.c into a TCG-specific
directory.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
