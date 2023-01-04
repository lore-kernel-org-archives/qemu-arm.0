Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8305623ejb;
        Wed, 4 Jan 2023 14:01:11 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvZms67bM2Uvr7UXRYfrr2qSeLXkhVDxpQMDJPi9d5dDICo69z991Vw5dbCa94o8h5xQCSI
X-Received: by 2002:a05:6000:384:b0:297:175c:3cbd with SMTP id u4-20020a056000038400b00297175c3cbdmr12050752wrf.66.1672869671032;
        Wed, 04 Jan 2023 14:01:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672869671; cv=none;
        d=google.com; s=arc-20160816;
        b=I9/rOAKThvFfeOgz38YnL7b0qprn32oCboVwuV2ll6H/Zwh/KgBO8X6tIVqosKKBNv
         JvjDJCDnmQnwzJDmUy18BhwftmD3MqHPY/fFl61d5CVmekA9w0A2IO7+fnv3ASCbE6lD
         9Y2+TxN13AsyUqmtcVZVswJUWbOrubSkFa3Yn29EDVdGJywtJE0GmnaDmyBnBhyShqfb
         E3ro/YJmtJZINxGx7czmvlDepPKGtPofEN6xkCcPQRijbbpwcBzgZX/S7Oo1nV/+e5xw
         qIP31w+7Pd1zRc3yaSlHanddMSQhkk8esgEF3WuRJNh8fNj7EU9W688umOgrrmYbVKpZ
         tIoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=cFNFy3321ErYNLh8oVQzCQFApxyWT5HEFN/Pl29x7zY=;
        b=k7XDBZtfeUi7iK15DKICf2oNkckNrxIZ3KeK/twgxlwMojf3TPeMV/bFG78bhHQZGO
         proCxWX1/bMJ68tIzrmc9Tgp+V/AED55NE4fponW686S8lCc6IDLwMyQOfq05pNgKyTw
         a1eGyR57FsM7+RNlU9panK46I2OvL2N1rZ6YAyf3m7uFMDv/8FBN8HC6ZAZwb1UtERI8
         Y1PBP7yrbaBwYH13lEhWemg2fSYuEiEY+bhohYV7Npr7QNSMhHv5Dn6wDnV80N0mpaoE
         dw9MmkaU8RX3uVcW+1vJI3AUU1HP8nYv6sV1n9vaNNVTtj5hOT4DJn84bQpWh22etQXX
         G5UA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=jpsmwYo0;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id cc15-20020a5d5c0f000000b0029875dbfefcsi6839933wrb.384.2023.01.04.14.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 14:01:11 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=jpsmwYo0;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A3E3E4D7FC;
	Wed,  4 Jan 2023 22:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1672869670; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cFNFy3321ErYNLh8oVQzCQFApxyWT5HEFN/Pl29x7zY=;
	b=jpsmwYo0LbvV5aKrzWgtecC8i2qsEl7ab01QW6AwPpMfe9ntZweDD/r8pk3SU4XYPN8Bjc
	YGHLM7ooGOqBn//tDr3tO5eVPT6PNPNuPo8KafGW+lgD/XtXuaWUIqRVFZbvbOZIVAq73W
	lR1TtefmU1hPkknCQQuIKMvGYlG9e70=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1672869670;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cFNFy3321ErYNLh8oVQzCQFApxyWT5HEFN/Pl29x7zY=;
	b=7phrQ5M5U6oKmKG9aiUajWnfQsLBAe3LXQdXosImcD+WOpUu+ZRByD0OOz1SuaRyd//Mos
	XOdnvqyglHNElzAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EE35D1342C;
	Wed,  4 Jan 2023 22:01:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id OIbiLCP3tWPwJAAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 04 Jan 2023 22:01:07 +0000
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
Subject: [RFC PATCH 09/27] target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()
Date: Wed,  4 Jan 2023 18:58:17 -0300
Message-Id: <20230104215835.24692-10-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230104215835.24692-1-farosas@suse.de>
References: <20230104215835.24692-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: oHWZgpbQy7kL

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/helper.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2bb302e5d2..506c057675 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10202,11 +10202,13 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
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
         /*
-- 
2.35.3
