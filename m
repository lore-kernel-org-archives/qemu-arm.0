Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp2220104ejq;
        Mon, 8 May 2023 11:16:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6SrMLGZf2JKy5LxNaYn3ErbVDsjHYJeDNzXNsxKak+m3LHsYfqpmWh3Kvwd6Ptz0sOgF4O
X-Received: by 2002:a7b:cd94:0:b0:3f4:266d:5901 with SMTP id y20-20020a7bcd94000000b003f4266d5901mr2468264wmj.35.1683569779661;
        Mon, 08 May 2023 11:16:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683569779; cv=none;
        d=google.com; s=arc-20160816;
        b=tBCJQeP8ofGdoMiHCxPB01+kh8AZeG2DPpwonGowPbqEPNCQbFp54lYP5ObCXEZ035
         vZ4/+0FUd8S2ZfLhP4NRckI33ur/PuIfjZ8CQK97BJOWb5Nnk+WIM3D3H66m2XGDR9uu
         044fI78DEUrAcYj1EL0BSuv0bu4+HQbIhgib5IV2ZhES2sksxhlCgQcrOrcp63+WyV/Z
         M9p9i1AFvJGOCf4y9Y8GMOH21OqoUA0PjUDz1eR3iLB7S3pu0+ZT0ehS9rWoURiusDkd
         LtL/a5ijpuE8nby/j5Wc0mhjsP2Y7TWxTTwHUM6tnU/K1ANSa+xXgUzIRRSX023cCBln
         5Kdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=Ppt0sa0XAwy+XRuOa3p9oGr7/EBACeoA3VT1BgrZHhI=;
        b=oTsQ5SXyPT1W8djWBQcF1oAhRnxH9xNLYipTQZVJmwwnYxCPSTjzEItMS0a+qW0JjV
         B0lEEuc67o8UMj56dRttRcZSaZKRdrWPEdt8aIwzGh5oA8aZCC1kk+yNkU8nYc9sEFSR
         JvaaMp2Xj3p9797/x2ACbedxzqtITEHV3oIi1BZ2Mub5TfoBEGHj9yv8h9nDrSblWGOn
         4go5OPhpc6tgKqfCuGZqihLuUyj5SKCYfINigIFYlVpTC90BUcVmN38kZeP5alXa8a/p
         Xl3kcAZVLiVNGVXpXiCVukZ27hj/+ej25v3e1t3gEJgJd56OFKIoWGtLWxrBHyc0ipNL
         Jv5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=mUQ6Okd7;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id r8-20020a056000014800b002f91019fa02si5102934wrx.628.2023.05.08.11.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 11:16:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=mUQ6Okd7;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 483AD21E3D;
	Mon,  8 May 2023 18:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1683569779; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ppt0sa0XAwy+XRuOa3p9oGr7/EBACeoA3VT1BgrZHhI=;
	b=mUQ6Okd7+r5JK5rBPINgc2Wop/ktTOqGf86GjAnU8BsEDtv1zdPwcJ2FpZbNHKgaPPt7uc
	4bem8bNt+Nc3Z9UL4xYotuqTAqnEj/dFCsjY0tm2yQM5ezZA01rUpmy3xFxWiWeg4AsKuh
	iv2jp6jarwZZUTCqGmb6Y6VxOXrPA04=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683569779;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ppt0sa0XAwy+XRuOa3p9oGr7/EBACeoA3VT1BgrZHhI=;
	b=U1fFKTYhZK9XXZxZFOwXPSGmCdDhNpcMG4M5NloO7AQ8I+TDu4/pBsCPlCZ4w1O0Oq3M9t
	YTR5JE1Lt77ALUDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F35431346B;
	Mon,  8 May 2023 18:16:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id SE7XLXA8WWSIdwAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 08 May 2023 18:16:16 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 1/3] target/arm: Select SEMIHOSTING when using TCG
Date: Mon,  8 May 2023 15:16:09 -0300
Message-Id: <20230508181611.2621-2-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230508181611.2621-1-farosas@suse.de>
References: <20230508181611.2621-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: vep+tHXp8dv3

Semihosting has been made a 'default y' entry in Kconfig, which does
not work because when building --without-default-devices, the
semihosting code would not be available.

Make semihosting unconditional when TCG is present.

Fixes: 29d9efca16 ("arm/Kconfig: Do not build TCG-only boards on a KVM-only build")
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/Kconfig | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/target/arm/Kconfig b/target/arm/Kconfig
index 39f05b6420..3fffdcb61b 100644
--- a/target/arm/Kconfig
+++ b/target/arm/Kconfig
@@ -1,13 +1,7 @@
 config ARM
     bool
+    select ARM_COMPATIBLE_SEMIHOSTING if TCG
 
 config AARCH64
     bool
     select ARM
-
-# This config exists just so we can make SEMIHOSTING default when TCG
-# is selected without also changing it for other architectures.
-config ARM_SEMIHOSTING
-    bool
-    default y if TCG && ARM
-    select ARM_COMPATIBLE_SEMIHOSTING
-- 
2.35.3
