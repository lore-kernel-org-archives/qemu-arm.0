Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp413929ejc;
        Fri, 13 Jan 2023 06:06:35 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtbwHYxmOD/svUplt8deNsHnULaVTtZdNQcVVGHUntFVRCvdzOCFKZmFH7g/eiHAyfMXdbb
X-Received: by 2002:a5d:6e09:0:b0:2bb:31da:f3ea with SMTP id h9-20020a5d6e09000000b002bb31daf3eamr18442804wrz.9.1673618795025;
        Fri, 13 Jan 2023 06:06:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673618795; cv=none;
        d=google.com; s=arc-20160816;
        b=SFN8EB6BGvmQraokrp3AM5RRT7fL9PB3NUCR4gIkO2PLWwoYpOTubZUcp3a9hJvZVr
         +uvQMRrLe6XBlPxFlLfGrFB8S/WDqW5o4+lcOw9I9AzHWWNGVYl4VeG+IhfE5zrieZiV
         dZZHynFax3MbDZS3a6d9GbYe23mSn7leLG6trPpNgf4QLPnjAd+ebNHcSbkLlJSl6s9R
         Q+4TmIthlaBVQnQqn+855X4Oc76r0B6CTn2jdYtKhBeP1K2w8svp+QPyVMMDy3tjEKCB
         BGRaTNmlDQ5Qh8C/31a1bHWFnxLxpVqFFlotbvQqdKVg6UuabrCVCUsCPLX8zjwnIMm8
         u6Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=2laEYVqQuamS7kSJe401Aqj3wjbNUoRgW08TktVLHOI=;
        b=cOc8h43mVt5HXpaH+yhGZ582czX8uXdIGlKejJ8Hcf1JOu+DhQGtSQNs/Vs5mXqFp7
         v1moe//XZGiYmUtGwGL58AiJXPakMDfeMmnZQx48cEG+eMY+gEzYZC221IlRrrIrSFIt
         Y8m1A2OJ0sZuH+BEIzbOWDe3+w2vfjeZppRwNrtQfSKyw0K66KJGLSFDI9HueZI4Rq2Y
         I7YzpURxQTC4bBjpPg6rnSQwg6sDXx5wMw4hFAglUQs4Z4uDqTgxKwjxrC6sCXcHTWmS
         xwzIdlPvdQOZRfXJOf+xuZJbTx49pbxTFiHgqRRwXQJvhQ9JzzA2vsZqY32gKZ/mZLKH
         fieA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="vnI/EWYM";
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id p18-20020a5d4e12000000b002bde2120101si1312639wrt.360.2023.01.13.06.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 06:06:35 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="vnI/EWYM";
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4550860AAE;
	Fri, 13 Jan 2023 14:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673618794; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2laEYVqQuamS7kSJe401Aqj3wjbNUoRgW08TktVLHOI=;
	b=vnI/EWYMkmPA2TCmLcslJiBFaF918x8vz2t9h6s5/tmJcmtITEODJd678XYoGxmmkqZJhf
	BYfI8e8BmqWPSD2RalQoyfU2OOxGCzczNVvjpSRujeifztzAZ9Io4JYMoHHIqaEPW1hY5T
	Xgc/MjciqEdKfSucbjq6wtQ8ugj09UI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673618794;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2laEYVqQuamS7kSJe401Aqj3wjbNUoRgW08TktVLHOI=;
	b=tqFAdQcZb1cKLvyYbIdRebk+OQ3Eft+05TUabOsdwzCDzN+qF+HBKOluh+x6GiXn4HRsTG
	m99MigoZHZjBELBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A5B5C1358A;
	Fri, 13 Jan 2023 14:06:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id oKanG2dlwWP8DQAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 13 Jan 2023 14:06:31 +0000
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
Subject: [RFC PATCH v3 03/28] target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()
Date: Fri, 13 Jan 2023 11:03:54 -0300
Message-Id: <20230113140419.4013-4-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230113140419.4013-1-farosas@suse.de>
References: <20230113140419.4013-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: z/0Dy/FJucDE

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/helper.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 562da41e73..aa94db9917 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10613,11 +10613,13 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
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
