Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8305655ejb;
        Wed, 4 Jan 2023 14:01:15 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtPtmXJE+ZfFXNPxUodw9RhZKbaAy4KQZLyy6KNDjg59MfCFZLSNS9csZPrQEfF0k/9+2+r
X-Received: by 2002:a5d:484f:0:b0:293:ffe0:9d15 with SMTP id n15-20020a5d484f000000b00293ffe09d15mr10629144wrs.67.1672869674835;
        Wed, 04 Jan 2023 14:01:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672869674; cv=none;
        d=google.com; s=arc-20160816;
        b=ZVWqxmfU5kds9/wbx+3R8G5Uz5aKQxIn3veMGwS+XVgvvHHhdj8hd3vXYojd9AHpds
         YhrcGCQDPxQkGbfpHbtCd/ZTyCFH3AfU8DAA1JP6KUT0nFu+xIHvTETP1Ae0hTHplyZJ
         IN5xtvs/hdFBovgdYjDT+kvoERtEuHibFlSLuZgz9Y1ba5K8S0KM876eORLyZuvoW79c
         z7p+p0oKlZJFizxPZbJjOBamgZMI+hu/s3DDjCVN58BIMY2WpDZbtstkZrZirKK80LSA
         sVani24MqxT1AvGKOkWTMcA15o9g91AwNQgAIBUTSmDpmE7s4Mnca4lImLpb7HzWbPJ0
         4a8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=jz9dbTPU+EH8CtHhWP2ptK+D+kdUG7W0WvI7eM9zV9c=;
        b=laHF18TPATYrJE0EOBRYCJOXLY1VoruAjGpk+FJMpIawqAtIpA4i4P8IykaxGhiFgJ
         szKvvkkqCwrZR6cWNmWZKkTuS/3PxwRvwP6CaFDvYje9gh/3Y4BfG8+i/j8zsVoGfOJ1
         Fy6aNL8rIkSkqggRYBzs0d8Lsn1fhrgXwXszBQ4N+HorXNHAKul/y0le0jhZ94rezgpe
         Cvu59nV2wBdEhxoBAzOwYVQMHIT+lr8bvGfGUWxOLpAHiyiFfS+MJh77bS2/eVJwsUmq
         u/qT/vmmjcyWCxQLIQmk5dTnwYYLzzvZZ36DUcLvfWtRmsl+xlqu+E/h/PsTYIe3pL2N
         ZqXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="BMV1s8C/";
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=30cUD+uJ;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id o6-20020a5d47c6000000b00241c878d1b8si25752529wrc.896.2023.01.04.14.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 14:01:14 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="BMV1s8C/";
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=30cUD+uJ;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C806A3F049;
	Wed,  4 Jan 2023 22:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1672869673; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jz9dbTPU+EH8CtHhWP2ptK+D+kdUG7W0WvI7eM9zV9c=;
	b=BMV1s8C/YwmXSomhsF1onQgKODyqqyKv8xLK7rsHXUximyJCq24DVks395KHJAbUH3pwaT
	MIHAE2hT75B/GSssASYwhXj3+jyNXaZCgWKOQn6qVyPe770w6bTOEcYeThEYwfBVnpuWoE
	9uuweWko1ZEvAchW0TnKPkXTlv7ufVk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1672869673;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jz9dbTPU+EH8CtHhWP2ptK+D+kdUG7W0WvI7eM9zV9c=;
	b=30cUD+uJXxDC9jFacIEkJMMHKehS+UP0J8UB0SefkaktMm/CBPssBzG3RzMiksVWLVwHCd
	7JEoKtBTm/LT74Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 190241342C;
	Wed,  4 Jan 2023 22:01:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id qDtvNCb3tWPwJAAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 04 Jan 2023 22:01:10 +0000
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
Subject: [RFC PATCH 10/27] target/arm: Move PC alignment check
Date: Wed,  4 Jan 2023 18:58:18 -0300
Message-Id: <20230104215835.24692-11-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230104215835.24692-1-farosas@suse.de>
References: <20230104215835.24692-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: sklM5oFbUGoZ

Move this earlier to make the next patch diff cleaner. While here
update the comment slightly to not give the impression that the
misalignment affects only TCG.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
