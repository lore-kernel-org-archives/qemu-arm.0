Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp787311ejc;
        Wed, 18 Jan 2023 11:37:36 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsb6/ttbkPhDPmvm0KDZ9CyaAsiv2K9LYUpn/sasKGtgb6zQeQhAG9G64KVCIRPCqRbEGhG
X-Received: by 2002:adf:d22c:0:b0:2bd:f95d:4457 with SMTP id k12-20020adfd22c000000b002bdf95d4457mr6376432wrh.69.1674070656537;
        Wed, 18 Jan 2023 11:37:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674070656; cv=none;
        d=google.com; s=arc-20160816;
        b=TJg7o/WuN+6yMkHU0HhrD/al9C8Ln0kLT+3mTm6qdzPQtTYt+gBEaXRgpBZmm8iTGN
         8lu9h4nZIVBdmJJwiChE/JvYNV2sK5b3xGlhpud2KtcmAnkyHl2W50tf21p38MFb4gSi
         OSc6qTijWErKvkPYxi/atXFiJ6A78SBr2pv/S6XIdXj7L8x8cmTuYr9Wvn28yTq0XCX1
         knnGBblJ3LcFTlKZtb1+n3xf+reQunGrovHWlnyZV6lfIZk8F8C80/4RthorrMqnuiyu
         2hgbHBsi96u3acViEGAWtTgg1QY9Ad1P7SSZgVSGW/xJwVnEJC+K6HF747NQGrf5sP0i
         emvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=NJ+2gFAwrWJs1Rja6tKsipbGn3qjwQ6uQWZxuQyrtuk=;
        b=CCeMRbduol6JVNS7s4qzybxwYe8EYXDzeezJWD0EvDGLo72YRm/OMWInJfPKIkPuMc
         ZhzJDB6oNTIelyQkdOQnrRzi/nvTD0V+Qi/Lcx/qoWO2OqoYPBn+CJqsx8LwsP9HOYNo
         m1EMrgc6CF81N9tsYahRpkJ66kpeOTcR4KX6/ADxnlWNtASI4MRyBAzJOBiM4aJA/ffV
         aRMySM+aamL6T5qFZQRH2Yx5nTx0Y2SnONpJD0Lgcc75SZAouYailvV3M5Z9CGZLhpL/
         FBwblBMvku+KV+xKMs8dt+H5O+RZjGuULV5mUklWnPmUFwSIFj9Xwi4xMcyIMdTmY00t
         mamA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=oURJOUMN;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id l15-20020a05600002af00b002bde2e0a23asi19951671wry.927.2023.01.18.11.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 11:37:36 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=oURJOUMN;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2D3C83EEAC;
	Wed, 18 Jan 2023 19:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674070656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NJ+2gFAwrWJs1Rja6tKsipbGn3qjwQ6uQWZxuQyrtuk=;
	b=oURJOUMNPmuMjRbKlp88IT35JwkgXk14HSm0mAfjrM+v5AE99j28bKl5JRDrbUmxqrRyTk
	Dy7lBdfrdyeBnxBoKV72yLpRrMJo59D67SXIktITMoS+awKV6h23SSL9c54+PC4LguUUr+
	rXkHJnuIYZ9arT+N071ycT2Ku4ti1gY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674070656;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NJ+2gFAwrWJs1Rja6tKsipbGn3qjwQ6uQWZxuQyrtuk=;
	b=b740coP8oAK5au5SUwsmom0AXuUHzoYdPsAJpNHQvEh8iv2Z6cBy9/J7Q96sVde7va0dlt
	0qtVZLOzdDqcvyAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 871A9139D2;
	Wed, 18 Jan 2023 19:37:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id EMEVFH1KyGOWBwAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 18 Jan 2023 19:37:33 +0000
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
Subject: [PATCH 04/20] target/arm: Move PC alignment check
Date: Wed, 18 Jan 2023 16:35:02 -0300
Message-Id: <20230118193518.26433-5-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230118193518.26433-1-farosas@suse.de>
References: <20230118193518.26433-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: o0tb4aQPiMJU

Move this earlier to make the next patch diff cleaner. While here
update the comment slightly to not give the impression that the
misalignment affects only TCG.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/machine.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/arm/machine.c b/target/arm/machine.c
index 5f26152652..b4c3850570 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -839,6 +839,15 @@ static int cpu_post_load(void *opaque, int version_id)
         }
     }
 
+    /*
+     * Misaligned thumb pc is architecturally impossible. Fail the
+     * incoming migration. For TCG it would trigger the assert in
+     * thumb_tr_translate_insn().
+     */
+    if (!is_a64(env) && env->thumb && (env->regs[15] & 1)) {
+        return -1;
+    }
+
     hw_breakpoint_update_all(cpu);
     hw_watchpoint_update_all(cpu);
 
@@ -856,15 +865,6 @@ static int cpu_post_load(void *opaque, int version_id)
         }
     }
 
-    /*
-     * Misaligned thumb pc is architecturally impossible.
-     * We have an assert in thumb_tr_translate_insn to verify this.
-     * Fail an incoming migrate to avoid this assert.
-     */
-    if (!is_a64(env) && env->thumb && (env->regs[15] & 1)) {
-        return -1;
-    }
-
     if (!kvm_enabled()) {
         pmu_op_finish(&cpu->env);
     }
-- 
2.35.3
