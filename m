Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4678668ejb;
        Tue, 20 Dec 2022 14:06:45 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4fN3fcenmzsesB7ZYOjRsZRR6Gg7OXEAepNsFJSJ2GJbRLav0W3UJv16x2k/+NbZMJSkiG
X-Received: by 2002:a05:6000:1d89:b0:232:be5c:bfd1 with SMTP id bk9-20020a0560001d8900b00232be5cbfd1mr29573885wrb.4.1671574005456;
        Tue, 20 Dec 2022 14:06:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671574005; cv=none;
        d=google.com; s=arc-20160816;
        b=L5Ae9c8SVuz3YkauDh8amnQBY9IWuXjLZpxB2NsDQEChesmxnO46exlpF5JycE/9ZB
         er7pUxuJRq87Mgy/qIeLT5yNvlOWjEQbD+oaYRd6ua77mJQYQqIzA5Nic/Q5MMv9tmOE
         L5dPx3fNDHQFUkApomm1u2cbYPTX/r0Nmavm+QWlc+f5BB/8C/GlCaN3IJhFKlIITB/U
         YE2o7rBdfyw3gRSYb9SSx89C1oGIxWkyey4LgRGMriN1BXRsA0fgXgppKWffQ/X/rgaL
         pgVNks8fKK0JyiKrcs9wQgMI+Q3Fo4spx5xvk1D/9YGpjO9HOPs67ZfYj9I7WcnKFLyb
         4nfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=/7BcAL3xC8nxLYT+T8cHD52ZC0T+NIcGPKCGSYbSUow=;
        b=F6R87m+sY56jegx7j+R/f9aB1hbuB9flU7w5LJMFIJAlsjegB8DPoCaj/m9vuG4Wo4
         aSHhotx1kjAvOL+kD0u3ng0NwPkB6D1SKoOoitE2qDzoA9CndqdxPHBUioByexP7OI+8
         R8m4Ns49nP/BKiAlSsY3IlLvvrYkcZOj1qRVG9cVvIn5W4CDHL/d95fSVhQNHAKJOxe9
         oXjJW/CiFNBYEJATO8GlEUpJqLUDkoEzSHJt4/1A2nJS0X53mZvbTQCfeeSG91QcuB5k
         V6eKY/fuJd0CTxaO33ap8sl7e/Cr3tH/9uKASums8T4zrwuUENdmyHFFMemwpfkA95Ph
         xN2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=KQwpQn6t;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id cc10-20020a5d5c0a000000b0024215b40fb2si9634160wrb.479.2022.12.20.14.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 14:06:45 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=KQwpQn6t;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1488776A44;
	Tue, 20 Dec 2022 22:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1671574005; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/7BcAL3xC8nxLYT+T8cHD52ZC0T+NIcGPKCGSYbSUow=;
	b=KQwpQn6t6ExZ1z9/7kSB2cpYKtAbFZ9v7sCtocWaOieg4tsbjKhX1fLRz4J5pifEGVxLZI
	uGH+r3xTMCBusc0tVelLOm9HPsgIPvKztWuXfRwxmRubS2ECg4Ohc3SL3dBgCSzHL03PaN
	qiMVKATGV7eppTTLpg8VxbjpawyxRac=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1671574005;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/7BcAL3xC8nxLYT+T8cHD52ZC0T+NIcGPKCGSYbSUow=;
	b=Be1Ux2VHUQlhwgbEaXmFn49GDfKkw8FnPJPn4vl0cOTl6yVdX9xn8ZSceUqY3qI1Hr5fHL
	8pNpT391wSP+lhAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 35F8713254;
	Tue, 20 Dec 2022 22:06:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id yFq7OvExomPwfAAAMHmgww
	(envelope-from <farosas@suse.de>); Tue, 20 Dec 2022 22:06:41 +0000
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
Subject: [PATCH v2 4/5] target/arm: Move PC alignment check
Date: Tue, 20 Dec 2022 19:04:25 -0300
Message-Id: <20221220220426.8827-5-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221220220426.8827-1-farosas@suse.de>
References: <20221220220426.8827-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 0Uey1WSOM2ju

Move this earlier to make the next patch diff cleaner. While here
update the comment slightly to not give the impression that the
misalignment affects only TCG.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/machine.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/arm/machine.c b/target/arm/machine.c
index 54c5c62433..a186787d2b 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -811,6 +811,15 @@ static int cpu_post_load(void *opaque, int version_id)
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
 
@@ -828,15 +837,6 @@ static int cpu_post_load(void *opaque, int version_id)
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
