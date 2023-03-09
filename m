Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1122005ejc;
        Thu, 9 Mar 2023 12:14:57 -0800 (PST)
X-Google-Smtp-Source: AK7set/UyLZnyxzIvvnYaUH7BJaH7oNgVJliGwNTdeUqvMb5Vgfn7bU5srU9c0zeYP/YtywMUy4b
X-Received: by 2002:adf:f7c5:0:b0:2c7:bbe:4572 with SMTP id a5-20020adff7c5000000b002c70bbe4572mr15429908wrq.39.1678392897475;
        Thu, 09 Mar 2023 12:14:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678392897; cv=none;
        d=google.com; s=arc-20160816;
        b=eZDNKMCXLEoWeOAFzamER1pPrqtRz1fBNNUv6DzV6eqWqLtQJxcQVMemYX50ZhFQYN
         Fy2A0cWdkpUMCryHDK0SvLqswrOO7Jxh+iSDhM2IBgrYSqu3g7awIJ25W/EnwRHoTTBj
         z2k5drmjs0MCFjzk8HBEgwIQQP4lazbsnyF6i2l0cKtoJWEVkWH1JusFizdRiDEkCz3D
         X2KsJdLv5LvitYws7ytkP1xG0UUQLwefIeXvAQx1ElAFd9bhLZqWxS2jPBO6I9fX/y/V
         7TlNfV2lcENmIAbSdUP5E8lP/jRFwPTfTNrn1AAk3mwrYDglz9NbdR0ZmGyS8jyyR6sK
         sMJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=QweYlVkgsKkdSaR0EGS4O9Xq8Ca8lpE3c9GPYgg4Tf4=;
        b=ob1OWoQ7lghfDLkeTYrouTYO4D8cDjm9xtOAorHNqxTu8/K2sKNmAg3TciIwy6wFU0
         4QNFxLoR6+Z03e+JsPQqgve64ftQWFMq8cB8m550M9hBYLMjIIYMuuIrZqlEE6gyvU70
         z+zxXG9DkPv++9Il85uLNImLfTMCqCzL0tnY5UKHq0SgM18YYhJ/bU0ZPFLDE+8RvCu/
         suHs790jOc5x3c0ZU7ZMG7WG0LWPXgsbwtBuMog3KL60XPGPy+8mS9PcHHYKudtkMIcy
         Nna/ml8pDh71caM28x7p3G/BWSEM3d5yDHybArOPl996kMiF0ORXdTUXZI8HDEyu8FQF
         6fzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=l6zD38ir;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id d12-20020a5d6dcc000000b002c54737cc7dsi321493wrz.52.2023.03.09.12.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 12:14:57 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=l6zD38ir;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1A91A202A7;
	Thu,  9 Mar 2023 20:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678392897; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QweYlVkgsKkdSaR0EGS4O9Xq8Ca8lpE3c9GPYgg4Tf4=;
	b=l6zD38ir6j/J9TTwsl5eJuAcDQl/iBSOviA+eIlW42gzDdI2cIjbL7oedDMytTY4zBQCvK
	89xmA98QTLRgU/q38QPhGmVZXIPQ3kV2qMoTWfdFOo+1MxKKOQg0kFmGms+ixkw89yPiX2
	3QSeVbz5uVgx9bWsUvxCzGp/uMxs13Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678392897;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QweYlVkgsKkdSaR0EGS4O9Xq8Ca8lpE3c9GPYgg4Tf4=;
	b=T48EJ6Ay6oIvUdYyIczM0MGCYkfxGHzRTF7y41yLhgVk4672yQlJBnjwpl/r6PuTobHFZN
	LHtwkGNNUGlV6sBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2DF161391B;
	Thu,  9 Mar 2023 20:14:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 2KeROT0+CmTUZwAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 09 Mar 2023 20:14:53 +0000
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
Subject: [PATCH v8 05/11] arm/Kconfig: Always select SEMIHOSTING when TCG is present
Date: Thu,  9 Mar 2023 17:14:28 -0300
Message-Id: <20230309201434.10831-6-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230309201434.10831-1-farosas@suse.de>
References: <20230309201434.10831-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 7ygmWoeft76t

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
index b5aed4aff5..c0b213f42d 100644
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
