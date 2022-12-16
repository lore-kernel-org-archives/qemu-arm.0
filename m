Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp1721304ejb;
        Fri, 16 Dec 2022 13:31:59 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4EPFkk9EUaw2Wv6bvxMrId32BRjUWnAZmrr/XBs8zHtl5gOYRYzt0bRSYLJf8isr/GqjeN
X-Received: by 2002:a05:600c:310e:b0:3cf:b07a:cd2f with SMTP id g14-20020a05600c310e00b003cfb07acd2fmr25981286wmo.37.1671226319217;
        Fri, 16 Dec 2022 13:31:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671226319; cv=none;
        d=google.com; s=arc-20160816;
        b=E2FZUxMGY5wdDdJMRedPBSTqziguXgTluaD1YV8GfZ373vHnwXAY+jn1Qcc3tVEa1a
         wnCOeH8r+1aFFQPOq0FbTZJqvg9IEvvjInloz9I0gRYQMVyPMUT6xF/WGeI8nDfNht/s
         0ZlVy/4PWFvLsyoSjtaKf4o1H/WdghdQrgEKvTN92dKZIqtfcIAIcQHIobj4oM6jj+eQ
         LMwqIC6yl43WAKKJL48mFK454vU1eJa/m1JSoOYgE1wip3YClEwIpkf0vmjHzTl0s81S
         8kH5S6mAYcSwX1ohoZ/pnJafgCyX0VoGyhee/q4PDTs5fJUvFm5MVOsCiShSuVFqjqXc
         s0cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=/h/TcKLNuFmV1n9A40Ef7qzjjji24qdhFKETbNQjPjc=;
        b=xXo8k5QvUz5p/XYQvBAFcIqaFOfXSjvWbAKYkQBfIJk5wpNPZV2DPti7m7q+5/TVJK
         1236v2VLQYrz8d2mKngp3mgVOHGH6nBBnKSRp3YnR3OZLJh0pvMc6mBcOmDSBizmy9ew
         OrQwWjqOm/VMR5j3BeH8Kl2Z+BQ1XVTANC6NvS8Hn4ZDpn8VjacsGZvYSvWZFMNo9h5z
         QxT7wnXzEJLPSoQyOFH8yizenuQXSkBh5jHAfRSDf0U+V2Rpdw7EYWvI+OpoO/2QTr7y
         fUd5cb+/Qr0yfecJhbGYR0nJBIjEEII4rRZa1x9fWpSsSr60COSCCyeq2QdSQ1UV8jZb
         bnOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=nySjFEbt;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id 16-20020a05600c229000b003c6df327b68si6275882wmf.73.2022.12.16.13.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 13:31:59 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=nySjFEbt;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D309A5D96D;
	Fri, 16 Dec 2022 21:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1671226318; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/h/TcKLNuFmV1n9A40Ef7qzjjji24qdhFKETbNQjPjc=;
	b=nySjFEbtofkCFvI7YoeXMB7pPTGdbjsIFzRfA22TiJM2S9niH5FtxQgO7PaDZCadPqwtQD
	EwaFbF9S/zVKA5c7YvE7Kf7zflA/UlnN4oLjV6nHe4JrakoVMGf7AvJx1fdYNBrsqCq43/
	ap8R+XPD6Af5RLs9UDTRKqodV4N19i8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1671226318;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/h/TcKLNuFmV1n9A40Ef7qzjjji24qdhFKETbNQjPjc=;
	b=IDU4jFP6OlmUv2Yn4ql79fAapfqffw4sls31S05ckHw+sv1LOdaYhBkeh1Bq5yB+oqeKrT
	ym2ouLotVqeXE2AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 45E79138FD;
	Fri, 16 Dec 2022 21:31:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id CEQaA8zjnGPAHwAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 16 Dec 2022 21:31:56 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH 3/5] target/arm: wrap semihosting and psci calls with tcg_enabled
Date: Fri, 16 Dec 2022 18:29:42 -0300
Message-Id: <20221216212944.28229-4-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221216212944.28229-1-farosas@suse.de>
References: <20221216212944.28229-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: MymP91sVtKjv

From: Claudio Fontana <cfontana@suse.de>

for "all" builds (tcg + kvm), we want to avoid doing
the psci and semihosting checks if tcg is built-in, but not enabled.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
Originally from:
[RFC v14 39/80] target/arm: replace CONFIG_TCG with tcg_enabled
https://lore.kernel.org/r/20210416162824.25131-40-cfontana@suse.de
---
 target/arm/helper.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 45bf164a07..9d0a53cb00 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -26,6 +26,7 @@
 #include "sysemu/cpus.h"
 #include "sysemu/cpu-timers.h"
 #include "sysemu/kvm.h"
+#include "sysemu/tcg.h"
 #include "qemu/range.h"
 #include "qapi/qapi-commands-machine-target.h"
 #include "qapi/error.h"
@@ -10300,23 +10301,25 @@ void arm_cpu_do_interrupt(CPUState *cs)
                       env->exception.syndrome);
     }
 
-    if (arm_is_psci_call(cpu, cs->exception_index)) {
-        arm_handle_psci_call(cpu);
-        qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
-        return;
-    }
+    if (tcg_enabled()) {
+        if (arm_is_psci_call(cpu, cs->exception_index)) {
+            arm_handle_psci_call(cpu);
+            qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
+            return;
+        }
 
-    /*
-     * Semihosting semantics depend on the register width of the code
-     * that caused the exception, not the target exception level, so
-     * must be handled here.
-     */
+        /*
+         * Semihosting semantics depend on the register width of the code
+         * that caused the exception, not the target exception level, so
+         * must be handled here.
+         */
 #ifdef CONFIG_TCG
-    if (cs->exception_index == EXCP_SEMIHOST) {
-        tcg_handle_semihosting(cs);
-        return;
-    }
+        if (cs->exception_index == EXCP_SEMIHOST) {
+            tcg_handle_semihosting(cs);
+            return;
+        }
 #endif
+    }
 
     /* Hooks may change global state so BQL should be held, also the
      * BQL needs to be held for any modification of
-- 
2.35.3
