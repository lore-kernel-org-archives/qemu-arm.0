Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp546625ejb;
        Mon, 13 Feb 2023 12:31:44 -0800 (PST)
X-Google-Smtp-Source: AK7set/doqXe37FInQuEcgdZf8IojBAkkItNtQj6xFdSunVTtEwozXLUx5/wFxRIU3qapCs9GkI4
X-Received: by 2002:a50:8e41:0:b0:4a2:6573:5c35 with SMTP id 1-20020a508e41000000b004a265735c35mr25842383edx.21.1676320304398;
        Mon, 13 Feb 2023 12:31:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676320304; cv=none;
        d=google.com; s=arc-20160816;
        b=B1Dr1aQ8y/Q3Yn/xBB2npjO2vFiOHXXZqdKqgMyIbTwkD39QP+tIITfnOYZWr0Vp8F
         Z/uz56yAzFYkdGQtlDs/JvvUL6wrTeUf1ktgKLYXR2WCYRpD35hQ2NyHICOYhw/Lsa7Z
         Xc2mB6dnatpvvmlJXeWfgOLog/xBj+8kaJhGPSwNU242OrNIiSM/9FC2KKPWM0u0TmZk
         M+hXabOBCtB5mALKoHo6i02zqncmJ+UxQZ7yFRNmJUONxCceSU7bKI8wuP1BMBBYhS+S
         zSKNpFbdQpFHZwnZr3rNMjdQ2GbwbJIzELggQW1fHknSlIXrmxtBF2+7gWtJFFSt0kDj
         kYhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=IneoIjeaaItZ9WFIdyjktzS9t1bCTfcOcWOa6rg90xU=;
        b=HDWWcatKNgYA4WrzVZQUm6MWDBqVYXTZhS3gAaxWdkXFOMJwyBI4wwbkEfOfbmArWj
         urSatlY4qZyEpB8qdZoqaPqv0m+tvm403E3GiMnqArTPcWVj/0M1c+eQ/Vc1kZ36JKFH
         YZ5utUjDfUYoU+mb8OtCLAam39FwXky8IfRstH3OWy8aWf0bk74Mwgeb3E+/qHy0onLL
         ehpmPzbWetQ6dSrQfu57+zCKQkNFV9CGuSPNuhPL0NqxWvGB+bDRvMe+4v1+Wu6hEEBS
         SfheW+0tIjlsB1sqescsvnbmhRFXfKH9Sz8049B/o4GTbFxXAoS9/6GcKm/QGyVbLrlh
         HuPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="IaJ6vp0/";
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=4A3cEk7o;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id p17-20020aa7cc91000000b004a7670bdaf3si14761532edt.447.2023.02.13.12.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 12:31:44 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="IaJ6vp0/";
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=4A3cEk7o;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EBB3F2233D;
	Mon, 13 Feb 2023 20:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676320303; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IneoIjeaaItZ9WFIdyjktzS9t1bCTfcOcWOa6rg90xU=;
	b=IaJ6vp0/NLVwoFwKwXgRb1EzIUXcq0ICWyXcFPJ4dqp1x2W/JuPr3PSzzoJmfduB84Oe13
	tGccUewKytDNUHQDEj45xQQRj20RDR5b+RiNhhcvIKHIBydOYiP5zGGQpHWfiP0VLoKSVZ
	1Cuv/wtKlLjNtQjA5xBljCL5r8Ob/SQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676320303;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IneoIjeaaItZ9WFIdyjktzS9t1bCTfcOcWOa6rg90xU=;
	b=4A3cEk7on+NDArmGFnW/RXSkNstd1Nqcom8Zi3s/f5mch21NN+pNMXb6VKwvM1KODT4v8k
	15/SqnrpKZvJFHAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E07A31391B;
	Mon, 13 Feb 2023 20:31:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id eM/zKCye6mOVMwAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 13 Feb 2023 20:31:40 +0000
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
Subject: [PATCH RESEND v5 03/28] target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()
Date: Mon, 13 Feb 2023 17:29:02 -0300
Message-Id: <20230213202927.28992-4-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230213202927.28992-1-farosas@suse.de>
References: <20230213202927.28992-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 8gP/6Ep2g6bT

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/helper.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1fc860e039..bd704396e0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10819,11 +10819,13 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
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
