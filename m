Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp345962ejc;
        Thu, 19 Jan 2023 05:57:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXts0xUg7vS1aTo0O7noAvdXOWUpt90bWuIA7Q+wO3WlzNzVZPONCKx5yGRS9Hb6zNIhABaF
X-Received: by 2002:aa7:de95:0:b0:49d:be2b:b9b1 with SMTP id j21-20020aa7de95000000b0049dbe2bb9b1mr10751271edv.36.1674136645518;
        Thu, 19 Jan 2023 05:57:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674136645; cv=none;
        d=google.com; s=arc-20160816;
        b=OpS7ZjzJiiVDbYON/wFGtKCcFNSTSVAzS0xpWE4I087OlVuQ2trOfxl9btGCY9EPXZ
         jfYHXMKdt5FXbIeMYSE4+nUtAP8SU2YNSsXxiHTexB4GDjXGHLvnJkbERS1JSLLj6J5Z
         DaD8HoJ5a54epICjod7fm6cDjquFS7FM+pjp6ra10aXjWLWK9UJ1vVTiNVHn/pakwLsX
         GNVAw+kT6A0Ox7hA+KrU4WuzL+VHalH4FMkGCZmrvXZFJwxfWm+Syv2Eg1SZXeXilhUy
         nZRXLGncj4JiSQCyoV9b+RC7ZXFP2pZuVKvyv+0D7+a1lEdRmkC+nrxP6vZSMC8nvFyc
         ePXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=AuqrwC97+9Z1Th4V0AydpH0eXGT097zQTCDCeGSE7aQ=;
        b=YT4pf3Pt1juH4ESQQ7gB2mGvVPtf4+AO6vkDxlFHzEDGIHKnjC42hcvHQGIkSFBEVf
         dUJRvFXFtBsZDEsmKw+ozYINwdG2NGNTF+QJIdh8BpVpJ2IkK8QXJuFsFzAh2rTH7stE
         HIZmZH9i/fwGq5qjQ2Oz0kOxXi3hxT3IulrtZWJJGX+1kmnkqbjAPsFR0313aojiyJ8i
         FooZsdDYfs/Eiv0HJ/m2UTfguVIJl1XOcLftErvFpEXJO4wqdwlLy9JLzSiOdzYCZkK/
         gUuON9IImw+mhdEGZPzt/TpkfAFxvEEPsGC6M7kWvBUrJGkOjyXRwa0nH95/1f4kCJgY
         WIxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=EsBz738q;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id q11-20020aa7d44b000000b004974f256f48si32132282edr.576.2023.01.19.05.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 05:57:25 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=EsBz738q;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 28C1A5CE74;
	Thu, 19 Jan 2023 13:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674136645; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AuqrwC97+9Z1Th4V0AydpH0eXGT097zQTCDCeGSE7aQ=;
	b=EsBz738q6x9qqSp9tcKqH1Pnp6wdqj+EWPM38WJ7Wf2zes19bV1zWN1+ms5muyB4GfeC1G
	4/JRfKA8rCE64PhOwRYfx6+u17SY1nQ5zHow1lLEO9j4Z81RVgWBvzRrpxIuf/D9ldkqhP
	x6KIkBOedP0b8JJjoj5MU6Anw12FCaM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674136645;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AuqrwC97+9Z1Th4V0AydpH0eXGT097zQTCDCeGSE7aQ=;
	b=mYrT/UPT5poGHFzAmXD0Y5oiCo1qnIthekz+ggXtTUDuYw0nY5YPQjnpLZ9kkNfoopts81
	MI5I+R1Z6i8yoECA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 13CC2134F5;
	Thu, 19 Jan 2023 13:57:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GGZjMkFMyWOCFAAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 19 Jan 2023 13:57:21 +0000
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
Subject: [RFC PATCH v4 14/15] arm/Kconfig: Always select SEMIHOSTING when TCG is present
Date: Thu, 19 Jan 2023 10:54:23 -0300
Message-Id: <20230119135424.5417-15-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230119135424.5417-1-farosas@suse.de>
References: <20230119135424.5417-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ZV8g/JJpqmKe

We are about to enable the build without TCG, so CONFIG_SEMIHOSTING
and CONFIG_ARM_COMPATIBLE_SEMIHOSTING cannot be unconditionally set in
default.mak anymore. So reflect the change in a Kconfig.

Instead of using semihosting/Kconfig, use a target-specific file, so
that the change doesn't affect other architectures which might
implement semihosting in a way compatible with KVM.

The selection from ARM_v7M needs to be removed to avoid a cycle during
parsing.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
The linux-user build does not use Kconfig. Is it worth it to add
support to it? There's just the semihosting config so far.
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
index 19d6b9d95f..e0da8841db 100644
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
