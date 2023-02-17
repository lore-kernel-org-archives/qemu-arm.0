Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp127675ejb;
        Fri, 17 Feb 2023 12:14:09 -0800 (PST)
X-Google-Smtp-Source: AK7set90vyOfAGj5+Mr6Ny90hs1/qnPXi09APBPWldRBP4J/9Z/bnJFhV1KDBtO8OjfMG3wmC5XR
X-Received: by 2002:a5d:4c8d:0:b0:2c5:598a:dd0f with SMTP id z13-20020a5d4c8d000000b002c5598add0fmr292843wrs.0.1676664849409;
        Fri, 17 Feb 2023 12:14:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676664849; cv=none;
        d=google.com; s=arc-20160816;
        b=ESj4k8q12mSaV7KWVpMMd7/A08DcFgdvlaw5xEK96jCnAHRdtOzCsB0siGyznfN6Dh
         Ss9o7HEWhpwu6ll1RbvVkZv8glvpgPx5hRcP3jQivyUHXgtgiGWrWPLM+H77uxcwv2FP
         EQphBRASc/ANdcl30bMzlbnQ1WwlQsljTTofPq8WdrIlCmCHoR48k2NsDHS/MbB3Ykel
         LRkkiuL+gnW7zfgj+FZJUJ8Vssi/KG5J2XNi8yXatMBtLS2UdHAnxqzcEqP7ztvOzc/6
         AYXODLp4t9s9oRGG7Mk0ZnTFT35huNEfnUO6qn1RlOmJgCXK5yx4s3tTzpAcesOMvNQq
         vT0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=Vmu/tZEOvDxJsSgDXhKLFroXqmMIraIq6twXvpPip20=;
        b=r8W5lF7Lguux7TJ0SL1jX8iLiA9h7PkReAt3y7NvDiGntAH1DvWsjxHalol1r9gI1T
         zN4EH9eedvMM54tvV5HIPKCNNxd0OPVZJLHhv7O3k9By2X7MUMBKeBEWkqjvjg6OuOQ3
         sU3x1e8e/weUrtwtzQjUIzOaogsX2QuyHNAS1J938bF2MbH06y0a4fx0D12OCxCGLr/V
         +4fzLiK+Gae71hQ696/Zp3J3LThJG+rFqSqJ9g7AIUylPsokZQkBTJWJqXCN7KGpVWth
         +dl5OVzTVFHQ081VOoRtL4zbOt7zXsEgVubWdn5coIOVhg6I5WxBhKUzFwHazIayr+Df
         f9cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=HRtUFvGk;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b="H/B/3ewD";
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id c6-20020adfe706000000b002c3e2cb9889si5418926wrm.38.2023.02.17.12.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 12:14:09 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=HRtUFvGk;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b="H/B/3ewD";
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EC16F20FB3;
	Fri, 17 Feb 2023 20:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676664848; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vmu/tZEOvDxJsSgDXhKLFroXqmMIraIq6twXvpPip20=;
	b=HRtUFvGkzDz9QZNEJ5TPzaMgGz7gkIFFLxqaSe2vt9Fuf/pnAO4bGdKzmRPlKZOhGX6pv4
	aY2xz/GUioCq3MOoHEriAM7+uPKlCNqfXy3JJyRzikHMZPCRK65Ii2MPueWnuLCwhpIVdl
	sQ6chykaXc3Y3w6YiRGWC7o0eieO8Gw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676664848;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vmu/tZEOvDxJsSgDXhKLFroXqmMIraIq6twXvpPip20=;
	b=H/B/3ewDhQL12/J4sRPbS2QvpYd3Lt2pusCsCs9D+NU6+ZPgMaHR7FMq220rvAqTzuRiUe
	p3JPgJ+w2v50ClBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0E3C9138E3;
	Fri, 17 Feb 2023 20:14:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 6JkyMg3g72MwIAAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 17 Feb 2023 20:14:05 +0000
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
Subject: [PATCH v6 04/29] target/arm: Move PC alignment check
Date: Fri, 17 Feb 2023 17:11:25 -0300
Message-Id: <20230217201150.22032-5-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230217201150.22032-1-farosas@suse.de>
References: <20230217201150.22032-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 26YraRVcFGIc

Move this earlier to make the next patch diff cleaner. While here
update the comment slightly to not give the impression that the
misalignment affects only TCG.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
