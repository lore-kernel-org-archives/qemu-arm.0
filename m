Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8306118ejb;
        Wed, 4 Jan 2023 14:01:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv/15NpS5lb8A2VzRPWRit27tUbGiMsLODWALLs1PnUU7K3ldMsRWTaKJO5E8PCfefyzAGB
X-Received: by 2002:a05:600c:3b8f:b0:3d0:480b:ac53 with SMTP id n15-20020a05600c3b8f00b003d0480bac53mr37324611wms.12.1672869709050;
        Wed, 04 Jan 2023 14:01:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672869709; cv=none;
        d=google.com; s=arc-20160816;
        b=fyj4SGVKVT15BvS3a7gS8gnJ/YKZ/7PQ00OSm7bcei4WKfa8IKruFECFqslhkRByUn
         qZ4Ijikd4g/Sjd819goVA2p2cM0dqrlzufkhEtQXwHG2F7NxkHLwpUlvQ82cFFohjRat
         SYBbBG4bmxu6eZIabc8d1WlYxMPLRKN9N2g6B5oWsyefiNY7jy2kCHM/k/wBMmf/xmJc
         jMO7vwz5YJ1W81HOXS9iT+BVckQca2tTuvjn8WvFYPuroblm/JkLWlmkiq/+odHm5gYi
         b92tNuLqX2+7sMsHpF6PKSv0IHEpfyE35K+FossdAqxNJeSVdUrugHWlQ1p4TTjFXIuZ
         3oag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=nQEegwHGNN7Z6VYfpF6X6KbKk1CytmES9LnxfjWls9g=;
        b=MsDG5IKEKb52ooHlqkcQvPJv5LYhYKwONTq0SGySgWOi7WxwamNhs9fShUzHYhXBFZ
         mytGN4ZvfnLjYrFVK96TX7zn13+Ob5576ywlQGFVtu8INjwJmG6Zza17cLeuah9pEEuI
         TOzMcPJZBjoMvoGKRwgn1h1Sj6aCc92imoXoxeCezWN30oh19q7k1IB8m5KvsU818T3w
         9d4IfAujZkHcZjgiolK9YJeaTLGZZAWCGJMzbBwZrT3EhwBZHPl/3P2iSBJ8lpwDJ8Ws
         zTevAiDHdaAUfp33tFGN4pYmAJrXSnCL3BTCjQll1C0qxiSXC5V9bkRdbX8KkviaxZAg
         UW1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=PiInJ9D7;
       dkim=neutral (no key) header.i=@suse.de header.b=R35fY8W1;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id bx5-20020a5d5b05000000b00285c3b386dasi16270924wrb.360.2023.01.04.14.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 14:01:49 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=PiInJ9D7;
       dkim=neutral (no key) header.i=@suse.de header.b=R35fY8W1;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A2A894D80D;
	Wed,  4 Jan 2023 22:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1672869708; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nQEegwHGNN7Z6VYfpF6X6KbKk1CytmES9LnxfjWls9g=;
	b=PiInJ9D72kQq5zRX/dr5zcaX/TE5tsx1zaJe8wEi/ZLvaCUquf1YB482wByWXtjNdjmNpp
	xD3moE7iAa91b6Wm66y+xXCr16BdbA1gVkKZb2ywMoj4Amr3GlQQMtHnUNbpPvzHAeUG9B
	gMGIKnkLKbi2XwlGKSegQxzn77e8YQk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1672869708;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nQEegwHGNN7Z6VYfpF6X6KbKk1CytmES9LnxfjWls9g=;
	b=R35fY8W1DssTvFGuxIOW7zunCvqXSDWhRdY1xb1C5gGO7yMs6Lps7nIBrenU4SvIqso7gk
	32dE3u5gdODYuQAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F37881342C;
	Wed,  4 Jan 2023 22:01:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id oLFILkn3tWPwJAAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 04 Jan 2023 22:01:45 +0000
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
Subject: [RFC PATCH 21/27] target/arm: make further preparation for the exception code to move
Date: Wed,  4 Jan 2023 18:58:29 -0300
Message-Id: <20230104215835.24692-22-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230104215835.24692-1-farosas@suse.de>
References: <20230104215835.24692-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 3+pfbzVeYVX/

From: Claudio Fontana <cfontana@suse.de>

the exception code needs some adjustment before being exposed to
KVM-only builds. We need to call arm_rebuild_hflags only when TCG is
enabled, or we will error out.

The direct call to helper_rebuild_hflags_a64(env, new_el) will not
be possible when extracting out to common code,
it seems safe to replace it with a call to arm_rebuild_hflags, since
the write to pstate is already done.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/helper.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index bea1ef242a..a536d77611 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1131,7 +1131,9 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
         env->regs[14] = env->regs[15] + offset;
     }
     env->regs[15] = newpc;
-    arm_rebuild_hflags(env);
+    if (tcg_enabled()) {
+        arm_rebuild_hflags(env);
+    }
 }
 
 static void arm_cpu_do_interrupt_aarch32_hyp(CPUState *cs)
@@ -1687,7 +1689,11 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     pstate_write(env, PSTATE_DAIF | new_mode);
     env->aarch64 = true;
     aarch64_restore_sp(env, new_el);
-    helper_rebuild_hflags_a64(env, new_el);
+
+    if (tcg_enabled()) {
+        /* pstate already written, so we can use arm_rebuild_hflags here */
+        arm_rebuild_hflags(env);
+    }
 
     env->pc = addr;
 
-- 
2.35.3
