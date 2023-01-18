Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp787281ejc;
        Wed, 18 Jan 2023 11:37:33 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvNvL0O0zJRZVnE21z15okMWzOD3uZu5VZlTtpdTf/454A8OjuzI4J+A9r3krbJ7NiPpEF8
X-Received: by 2002:a05:600c:54eb:b0:3da:2090:d404 with SMTP id jb11-20020a05600c54eb00b003da2090d404mr7770978wmb.18.1674070653582;
        Wed, 18 Jan 2023 11:37:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674070653; cv=none;
        d=google.com; s=arc-20160816;
        b=urKBZXKm/pLD+lOMOPRGrXFnagzjSXaMnp5SEWLx6htBcsmBm5eVns6BxBi4Uv9ZqY
         EawdwhOYpLsAzKPMo768YZMsBGW3h/bWVdugySmaD36TjVPp5hdv005feQSrxXhD7st9
         cs1uxPmeYevYxqutr23tJoPVihEoHc/HKJEQu5Degv1P7tNYzqWD5CKK+KRqGdgegTdh
         5vVLcnnMnHXpQz3MQGaO7GbB4IRucFWln4YZnxggbzqfnnqrnv5DvQHuWT5GvQFUSxPk
         H1fgSmQfRYWZ4J34NwCWfyRGBcGvE1X4uSiFhA+svMN0GHnoQV4rPPrIMiVAz9Ppqkil
         Hd6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=5ZU33MGAonNXvbt7lwnBEOjzXRA4Tj/uHjD0A8MtBoc=;
        b=LO86PhBpv4SxCrnMcy1bsFw0g+5Oz6OrpcVV/sBqsTJ+VbQWI7svpXDlq6S3isYi8a
         qJC5iJsSDCMYtfiWTiHYxzMc5405hqNld2UABilZXqnhcJMnTiLsQ1iJ+5HY9aEFPcQ4
         U0wu4hQNideujLrjrVCoQXeVY+ZmoMyksrssJkpbUxCH1jTvD7CK3SlBaxwZ5a545W0x
         UyNYc0rQdst+cvlQrPwY2YayDuq/MF31cJ7GjkV/xZqbR5HszuiDh90OCuv1PcC4nC1u
         51dYXS9CpsIZn0AqE2uANyl1P1G/Lnxl9ieec99ukXwV02eKHHszqIcWUfhnKr7xK24h
         K/2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=qM2nSqM2;
       dkim=neutral (no key) header.i=@suse.de header.b=mwh4ZSjC;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id i22-20020a05600c355600b003cf4e1f9cd3si3287038wmq.16.2023.01.18.11.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 11:37:33 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=qM2nSqM2;
       dkim=neutral (no key) header.i=@suse.de header.b=mwh4ZSjC;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1BCED3EEB0;
	Wed, 18 Jan 2023 19:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674070653; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5ZU33MGAonNXvbt7lwnBEOjzXRA4Tj/uHjD0A8MtBoc=;
	b=qM2nSqM2ICPTg9/s5Ybji1TtWHoT/pJ0vogSmpowKWuqPq2Vn250WBEL2Ow2A8GIuW6QgD
	pzOkQSSG0NBxT8cdmXlBmzcNnfiT7P7uRlYI2hAhBCDOnm6FYlPBvkKbhdTN+y+r+BCik+
	qu0l3F5VH0yQKRdoEvV7CiO/MSfJaAI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674070653;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5ZU33MGAonNXvbt7lwnBEOjzXRA4Tj/uHjD0A8MtBoc=;
	b=mwh4ZSjCzP/JD2GeC85CYaR+B1aFk/2XtYKbCMsiPAwJp1EE8NWHr+JhKlZamHj7vNZtzQ
	U1RGndmwVvAoDDBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 73EA5139D2;
	Wed, 18 Jan 2023 19:37:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id cJdhD3pKyGOWBwAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 18 Jan 2023 19:37:30 +0000
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
Subject: [PATCH 03/20] target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()
Date: Wed, 18 Jan 2023 16:35:01 -0300
Message-Id: <20230118193518.26433-4-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230118193518.26433-1-farosas@suse.de>
References: <20230118193518.26433-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 13pwKasRXp/A

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/helper.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7c39280a83..96a668989b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10616,11 +10616,13 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
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
