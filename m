Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp1721333ejb;
        Fri, 16 Dec 2022 13:32:02 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6HycMyQ4caBLX+oASGaJTjCNZAdN+DzVLC9n2DCyBbjT74rADdyqflM28yzRCDdNpuc8rv
X-Received: by 2002:a5d:4152:0:b0:24f:11eb:2988 with SMTP id c18-20020a5d4152000000b0024f11eb2988mr16327095wrq.71.1671226322317;
        Fri, 16 Dec 2022 13:32:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671226322; cv=none;
        d=google.com; s=arc-20160816;
        b=GBSK/k/0FgmbaGQ9l6FiIyRVgkuA2hWcP1CiUHzxlDCi5mfGtFvKH+NHwU14HM+n2D
         SpNHy3MDUduSbjYSM0+8JJA+SBoLM14JHzghb+9yeuFZ5Dk9knNQQYKEo8o0UZAFj+Rt
         Z/UlCA+aXfZzcHoRHcfWAeUoJtj23i8TdP7YLl7Eetp5aP6/gB+s1qIS1SE8iFYW7x/o
         SxhRa8IW8WlD+T3+fiYoVoNs/tJ+7+FuFoRtHcza7mDZwbKc+jj8RB14c6EkiXVEZC93
         VDBDRHoFoaTFgPUxp9ofcbyPPmq6yRlqw6RYI3W2l0jIa3nBZc2D5lqbNyliN1erNoGd
         mqvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=ArciblxJn99VFUNeKFhgWt1wFbO+tKvCM9aSQYafwj8=;
        b=lHeQp5gQSaw6p4CwtUV9QWeI415PnOzT0xcycUPWRhGgAUcS1iW7ZDX8i2FIf3gVeZ
         3wUVSCBQQlCJ8fCEsJ4ag3qW4RvGwCdUbitt1Wu2SGitXoUQNSPU5HbzolSDmLtx8SQD
         Z9tmuCmZUKWJTqxxIObiUxKu3zI0bEaoqefmvVgUmWFacYvi+RMrJZpopXo9B4A5V0dB
         O927E5nCqnc9gcCnrxPVyIufmX3d9iRRAjcBtYLtSI0fI4HrmuNPXfbt85lVPAvSOF+y
         7n/8tfAWt7aFoU3FfU9/Jw6fqvdkH6dDyql5SmNjOmYCnz4ri5nKSDhm7t8jRN5IUSnT
         KHdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=oLA3ZzbF;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id w12-20020adfcd0c000000b0022afa7b5368si2246376wrm.272.2022.12.16.13.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 13:32:02 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=oLA3ZzbF;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D579E5D96F;
	Fri, 16 Dec 2022 21:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1671226321; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ArciblxJn99VFUNeKFhgWt1wFbO+tKvCM9aSQYafwj8=;
	b=oLA3ZzbFVp9cDztWQcBlZ1u14ZjwKpTxNFkLWwdTVx4WA/gAjz2zCpy8u2WG/geRKtyOIT
	nOqFOFyJpD1/4uNLRR1f34DeSevK4rKNHdbjB1P1d/QoRZg88NZ3iRtCWIaSbW3x9erdKF
	I4BxiK76ti64dYgFope+DF447s08TDQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1671226321;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ArciblxJn99VFUNeKFhgWt1wFbO+tKvCM9aSQYafwj8=;
	b=UkstPnjvbHbqRHMH7Dqx6/orP9c8eCHCsaFKBxWy/Yl1NSamQZrJLrg5Sgz7OsNK23vA3x
	g2jiqXpYUpP11MCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4BBB1138FD;
	Fri, 16 Dec 2022 21:31:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id EBzPBM/jnGPAHwAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 16 Dec 2022 21:31:59 +0000
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
Subject: [PATCH 4/5] target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()
Date: Fri, 16 Dec 2022 18:29:43 -0300
Message-Id: <20221216212944.28229-5-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221216212944.28229-1-farosas@suse.de>
References: <20221216212944.28229-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: mfwyoYxub6tH

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
Originally from:
[RFC v14 42/80] target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()
https://lore.kernel.org/r/20210416162824.25131-43-cfontana@suse.de
---
 target/arm/helper.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9d0a53cb00..92624e2910 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10066,11 +10066,13 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     unsigned int cur_el = arm_current_el(env);
     int rt;
 
-    /*
-     * Note that new_el can never be 0.  If cur_el is 0, then
-     * el0_a64 is is_a64(), else el0_a64 is ignored.
-     */
-    aarch64_sve_change_el(env, cur_el, new_el, is_a64(env));
+    if (tcg_enabled()) {
+        /*
+         * Note that new_el can never be 0.  If cur_el is 0, then
+         * el0_a64 is is_a64(), else el0_a64 is ignored.
+         */
+        aarch64_sve_change_el(env, cur_el, new_el, is_a64(env));
+    }
 
     if (cur_el < new_el) {
         /* Entry vector offset depends on whether the implemented EL
-- 
2.35.3
