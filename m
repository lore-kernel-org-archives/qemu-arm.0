Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp547636ejb;
        Mon, 13 Feb 2023 12:33:11 -0800 (PST)
X-Google-Smtp-Source: AK7set96ifL5YwAsUNK+m+7n58Tx8Qz6KEEz28vW4qYDM9cZ8Sop3rXmgFGM34RVj7enYNbAuPCc
X-Received: by 2002:a17:906:4710:b0:882:2027:c8e2 with SMTP id y16-20020a170906471000b008822027c8e2mr225978ejq.56.1676320391231;
        Mon, 13 Feb 2023 12:33:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676320391; cv=none;
        d=google.com; s=arc-20160816;
        b=JiSvaj3HJf9iy8fjI5otnbqio+KBnz3MIQ15aVHz0TiyDVTcLIzRn7Qj1HDCmn8m1x
         Xk7563eWya7tdLkqeDrXs4x3DnBcNPdGz43BuE66IDVTYyfjfk6Y8E7JBwmxsTnax6c0
         vw1gvugYdUTGzwOH9dcjPxL3pJRICxWOGkwIAcC67zP014lGMKP8VplsctDYXsK+P12E
         7ykVYvjpmFRGiEhazrRX9jL2cCJJ2JJQgwX/oWvgtNnr9QLyJTDwB3IT6ZcBcvuryoki
         v4rpNTidHJ5lwhnziM0ogLh+2WfuagokxJVNFdT81pQEUhujFk2qMSqgL1LVJ9N2LAsR
         YQWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=e5tfxhz0XLT506HPN6j8wnNQmjG3RMFDcTBo7NMv6Wg=;
        b=q2uKx45wR0UJh5OTWK7G69ms4YM4XiJmj5eRjxqvMEIGIHqFbPOMofBAasqQghj7Vn
         v+pGdrij6EgRY8Jp14AMy+VORNTn9Eo8cbFppOe+GWMTCTi7uPzX2Wi1XiveR6bOEbcT
         qsMEpsSPoAhw87ArWjJz9C50JTVgYBYb+oyOo+eoPy5w9fr8npwkf1Ha78GbTeVxDxdi
         DG9Go3Dc+y4eoVX2tj4T5530pCI9bjoTEpPS9MN8K87pvgHDCqmVxr6uzEvKDMq0fARg
         yRxURq7OFzciPr7T61f0BKEziemtdqH/9N0HzqZXXI+L9VC9wYZiu6KjPyVYt4udlKs1
         FUIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="eGG/reaP";
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=Vo6L1UlH;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id fi2-20020a1709073ac200b00870e8230bfdsi12435691ejc.107.2023.02.13.12.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 12:33:11 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="eGG/reaP";
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=Vo6L1UlH;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9625C2235A;
	Mon, 13 Feb 2023 20:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676320390; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e5tfxhz0XLT506HPN6j8wnNQmjG3RMFDcTBo7NMv6Wg=;
	b=eGG/reaPzfuMH/T4gAe3SSXa5lLOCZssAbZammyKu+Nudd3P4A19NGqr52DWhERZk9hwwf
	3zuPmgUw0oJj79AqwThznsJtajY8KEhgYhpvXVsTFNRrAL6I4Dq89kuRp62uGxOh0EDRPB
	gvZQ9S6Z/1s/2LjeB/Irf59bidkjn9Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676320390;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e5tfxhz0XLT506HPN6j8wnNQmjG3RMFDcTBo7NMv6Wg=;
	b=Vo6L1UlH4Mog1a4JhGgsH8agp0gfUaoZP73Ruu20jFjvLtP3CAOj36XGCndyYT67W3yJq3
	972YY9UpTfQCM2AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8A4961391B;
	Mon, 13 Feb 2023 20:33:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id wOqvE4Oe6mOVMwAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 13 Feb 2023 20:33:07 +0000
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
Subject: [PATCH RESEND v5 26/28] arm/Kconfig: Always select SEMIHOSTING when TCG is present
Date: Mon, 13 Feb 2023 17:29:25 -0300
Message-Id: <20230213202927.28992-27-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230213202927.28992-1-farosas@suse.de>
References: <20230213202927.28992-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: vebyMfVhqY0T

We are about to enable the build without TCG, so CONFIG_SEMIHOSTING
and CONFIG_ARM_COMPATIBLE_SEMIHOSTING cannot be unconditionally set in
default.mak anymore. So reflect the change in a Kconfig.

Instead of using semihosting/Kconfig, use a target-specific file, so
that the change doesn't affect other architectures which might
implement semihosting in a way compatible with KVM.

The selection from ARM_v7M needs to be removed to avoid a cycle during
parsing.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 configs/devices/arm-softmmu/default.mak | 2 --
 hw/arm/Kconfig                          | 1 -
 target/arm/Kconfig                      | 7 +++++++
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/configs/devices/arm-softmmu/default.mak b/configs/devices/arm-softmmu/default.mak
index 1b49a7830c..cb3e5aea65 100644
--- a/configs/devices/arm-softmmu/default.mak
+++ b/configs/devices/arm-softmmu/default.mak
@@ -40,6 +40,4 @@ CONFIG_MICROBIT=y
 CONFIG_FSL_IMX25=y
 CONFIG_FSL_IMX7=y
 CONFIG_FSL_IMX6UL=y
-CONFIG_SEMIHOSTING=y
-CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
 CONFIG_ALLWINNER_H3=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 2d157de9b8..ef518c1f1d 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -316,7 +316,6 @@ config ARM_V7M
     # currently v7M must be included in a TCG build due to translate.c
     default y if TCG && (ARM || AARCH64)
     select PTIMER
-    select ARM_COMPATIBLE_SEMIHOSTING
 
 config ALLWINNER_A10
     bool
diff --git a/target/arm/Kconfig b/target/arm/Kconfig
index 3f3394a22b..39f05b6420 100644
--- a/target/arm/Kconfig
+++ b/target/arm/Kconfig
@@ -4,3 +4,10 @@ config ARM
 config AARCH64
     bool
     select ARM
+
+# This config exists just so we can make SEMIHOSTING default when TCG
+# is selected without also changing it for other architectures.
+config ARM_SEMIHOSTING
+    bool
+    default y if TCG && ARM
+    select ARM_COMPATIBLE_SEMIHOSTING
-- 
2.35.3
