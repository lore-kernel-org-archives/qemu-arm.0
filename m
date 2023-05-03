Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3058732ejm;
        Wed, 3 May 2023 12:38:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7NPHMfG8INg2fApKUV/hAPzAWJmxIZfMbVOnsQFjfOBgS/RKpyTCsEwBsyJSenC5WnmpvN
X-Received: by 2002:adf:dbc3:0:b0:306:4681:4ebd with SMTP id e3-20020adfdbc3000000b0030646814ebdmr789728wrj.55.1683142722779;
        Wed, 03 May 2023 12:38:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683142722; cv=none;
        d=google.com; s=arc-20160816;
        b=VwEyxlK2RZj1Pz5X+O0wjOuXTlCkHx1QX6KWpr+hzguhDovpkN5eT5opBe1Xp60WVt
         8++BI28ta6XsFt6UHVf0gMxfQmF/b0fpG3ftn/9y9QMifkanY+D+kmr65+brFgIr7j67
         4fHYmCcBPNnPUmdLMCky35DhOwR5DI2r1FkcRyf8UW7cVyF3Tu4oQIzObMzqj7BmtIdX
         WfaHHtZ9gnEETFAcrRiugaEAB1jYhw4NLggKEb0TshfFHhDrRLQEv1kHKIdDfFDlo6ds
         JOYCL3GjH9ANrZG9aaIBD+fWmXpL3LYHu06lqFzgpUmoGCElK2tYtouMXLPYWvXy15L8
         TReQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=ehEY6N7BVI4T/u6lbUad4g753KQ1tp1Ylfn20vttUXw=;
        b=mq9Pe/dewbzOAbzN7Gbh9MHBkP8o7xeq3J/VEHgkX+XlOHPGIen2susXyGH37ZfasI
         GJSdH7wK+cja3Xafp7G9vFtZu0MQ1fh1NC1XGa7ThKt4crLnaap3eQpAt++ZJMtjvKGt
         fEyToshaIiqN5DsJx+gmutdQ+UIX+dl9wSM+iT3sSxa8RyIDebfp0hs59UJSKbzRfjnZ
         fMPwaDTq9zMyET3eVWdagS9aAbwB0igyMmJi1kWPY1KnMap1BSqrsJQTrJOXa0+0fGAf
         zDRHJIJlf0AIUY2mtHdwb5zWHIfqDXgA4pr3xmD8RV8hEZ8cyDVxpljgtyoug/sUpZmt
         dgGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=CYrfLNVv;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id 11-20020a05600c104b00b003f29b9fa460si1324882wmx.89.2023.05.03.12.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 12:38:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=CYrfLNVv;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7350E22C23;
	Wed,  3 May 2023 19:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1683142722; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ehEY6N7BVI4T/u6lbUad4g753KQ1tp1Ylfn20vttUXw=;
	b=CYrfLNVvvyY+XUlCvRUtEoQtfEHYPrUn7MYUmvxmf3ZFK86nHUm4faBjlVAVIMQ5nS3f4L
	j9nk4o4QOWpgHD17hNexqW5HFxrtezaGwJuHd9Nw8vw95GRmQMu++66q7yUXrG8TOE3QaA
	gKSfvQ4/oJUOJXGwm69nPzzdfZwpZP8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683142722;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ehEY6N7BVI4T/u6lbUad4g753KQ1tp1Ylfn20vttUXw=;
	b=bu5Jxa+1TxMhLfd6Cfg0n3wIVJHKByvTaRpWmVzxBNONteU30K2bK8CLf1FA8KTTT4o4D2
	35fRFgLRV3zi6PCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A9C991331F;
	Wed,  3 May 2023 19:38:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 6BpjHEC4UmTNYQAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 03 May 2023 19:38:40 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 2/3] target/arm: Add CONFIG_ARM_V7M back to default.mak
Date: Wed,  3 May 2023 16:38:32 -0300
Message-Id: <20230503193833.29047-3-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230503193833.29047-1-farosas@suse.de>
References: <20230503193833.29047-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 8wCBJpbuxiBJ

We cannot allow this config to be disabled at the moment as not all of
the relevant code is protected by it.

Commit 29d9efca16 ("arm/Kconfig: Do not build TCG-only boards on a
KVM-only build") moved the CONFIGs of several boards to Kconfig, so it
is now possible that nothing selects ARM_V7M (e.g. when doing a
--without-default-devices build).

Return the CONFIG_ARM_V7M entry to default.mak while we don't enable
the compilation without it. Note that this goes against the intention
of commit cd43648a44 ("hw/arm: move CONFIG_V7M out of
default-devices"), but at this point this is the smallest change we
can do.

Fixes: 29d9efca16 ("arm/Kconfig: Do not build TCG-only boards on a KVM-only build")
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 configs/devices/arm-softmmu/default.mak | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/devices/arm-softmmu/default.mak b/configs/devices/arm-softmmu/default.mak
index 647fbce88d..0c2b24d6bb 100644
--- a/configs/devices/arm-softmmu/default.mak
+++ b/configs/devices/arm-softmmu/default.mak
@@ -4,3 +4,4 @@
 # CONFIG_TEST_DEVICES=n
 
 CONFIG_ARM_VIRT=y
+CONFIG_ARM_V7M=y
-- 
2.35.3
