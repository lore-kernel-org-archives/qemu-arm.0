Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4678626ejb;
        Tue, 20 Dec 2022 14:06:42 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuJOs6kuhCr99AawHkTjSwbcdb2jxPJ2copfpSupDbKEcGT+e1q+UQbGA6xKyLSN2V5OZsO
X-Received: by 2002:adf:fb50:0:b0:257:5361:b432 with SMTP id c16-20020adffb50000000b002575361b432mr13555820wrs.51.1671574002167;
        Tue, 20 Dec 2022 14:06:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671574002; cv=none;
        d=google.com; s=arc-20160816;
        b=SnKOLyuK3q4AEOyK8F2DuUbtKyNyHuIy7wuxoy2iKjsEVXnhzmLxaMAzPvBfViOlhe
         P2/FDxRQzrwBIwyO/Wl+/8Mmpa4rYMh7Ehn3kkXxSeq6CRpajtVkNLxRJpA3zdYP7kid
         rpM5icy2InO3ARGS3KP6QDsNIFsAeXWQpXMFHoP3mT1co/tyDYUjwnkgxU+imWadKDL/
         zOIoZGIXsRf6gL/KUs5cWIUTwVLmvAC2ar+AMSCG4t/jQyuaLZKwIVzcMi5UPjNS9fHi
         rZA7nvXA/fQGgTCQLsREBzi4DDjH23h6qAB7IpcMWI6odyO0b2/GZILttq9z6NiO6oTY
         c9fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=Y5V1jhX9pzm3fTgmfFkuVCIs6JasO5NGiAX8tVgYFz8=;
        b=KVi/bjaLUk6z1Esc07yuLI1vbFmtyZ6SunVGPYOT0mgBZRfIR47hi16AnShFnK3YST
         FmL9DawYHOabFQZgaOHnC/FI70agFTWnyPzj48fiOut6Mf5hxkevPHRImmM+lgy95fdi
         LPjA5qChnDkwV/5IwVwhNwUSkgeiAJAvxpcuQQi2bqTjJ1CDWrual8qWImqDGIE0R0IH
         w/V52jJn2ih3flfkbLd8OWic7LtBFtaEfJWmapM/4vv43X9XiAdoWT41SQzl75TTEkTE
         wMwHrfOMWGrRvOq6pysWzDkDsXUNxQGxf8jcKrBI7QGmNrzq0oBYAVeYMW0nTkr3uaNC
         CdDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=ESlLwnXq;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id ck6-20020a5d5e86000000b002369cf448b6si11746022wrb.380.2022.12.20.14.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 14:06:42 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=ESlLwnXq;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BB2B64DC69;
	Tue, 20 Dec 2022 22:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1671574001; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y5V1jhX9pzm3fTgmfFkuVCIs6JasO5NGiAX8tVgYFz8=;
	b=ESlLwnXqiPRGIRzc5c+Ny7g7vk1Ffdu8JG2akMIDUSCoUFFLtJPHGCm5RTYIXWOzO+t7HY
	jGiRm2W8yugjkpOWH9+4i/OkbEQX+40pBDWTHSb+qtqEo6dVEQWe/qnci6sexEAsusAsF1
	eT2ePZ98bHvDVjDgjk4P+q5WuXpvE9k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1671574001;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y5V1jhX9pzm3fTgmfFkuVCIs6JasO5NGiAX8tVgYFz8=;
	b=Je5u/Xxs8qmLDj+Pr92UO6qG1/gNoMfU1Irh/HoMmHt+v/XbI9ir7oSjeAQDZSAVa0ZziC
	wtUGAegM3FKln+Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DBC7213254;
	Tue, 20 Dec 2022 22:06:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id eFeQJ+4xomPwfAAAMHmgww
	(envelope-from <farosas@suse.de>); Tue, 20 Dec 2022 22:06:38 +0000
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
Subject: [PATCH v2 3/5] target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()
Date: Tue, 20 Dec 2022 19:04:24 -0300
Message-Id: <20221220220426.8827-4-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221220220426.8827-1-farosas@suse.de>
References: <20221220220426.8827-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 6M3YKkHbjjZe

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
index 193e0ef8fb..f33687e98d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10107,11 +10107,13 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
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
