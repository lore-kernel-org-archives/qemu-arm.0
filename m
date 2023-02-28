Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6099903ejc;
        Tue, 28 Feb 2023 11:28:55 -0800 (PST)
X-Google-Smtp-Source: AK7set95zlQXL3ldETV+e0riMAOYnm/GkgBgHrumK2w6BlsiKeMvtK3T8YVqsccr6eTG1e8HWymf
X-Received: by 2002:a05:600c:3b05:b0:3eb:399f:6b70 with SMTP id m5-20020a05600c3b0500b003eb399f6b70mr3011899wms.31.1677612535468;
        Tue, 28 Feb 2023 11:28:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677612535; cv=none;
        d=google.com; s=arc-20160816;
        b=ZdU74yJUSOXBuNodxHQAH0UboYFhd8yOBW1zgR7adlGDGglTbNg9WaxqiswbyutnEg
         0Q6Bm5qt5v8v+M+ffopZqBvIUzTrhDrtlwzal9Re6EuV8wQRjPeK4rN+/w1BO4fhzJfE
         7OXqkyvTcFmtg3jOMuA1xjjMdmJvMgA/I2VetpU/KtZmOS9gNcjfDaZ9Y+ncD6xiZABd
         OgvBltl27HTl6kgJf+AgDoSZimsqhNh9fYlmoXyZDDaFtzgXAaWKa5xEm2zVDpCkwHwq
         4tvnw2BkEPxv6D3cb/Sp+JMUO4WD/eK8iwtE9naHJdvVMVPW3/J4Ez6SoNI9Qw7pyxKI
         yoMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=QweYlVkgsKkdSaR0EGS4O9Xq8Ca8lpE3c9GPYgg4Tf4=;
        b=K7JR2QTNWHkPSbfxFlv9A19eFZCwi116B0iKn/kV5aFfxcC/RECSTWBvSfQrvWR1wJ
         OnsAkkYi7tjog5YhuC/RHYiyVIQ/UIE9+TljY+V/6eMB48BM6ZxS/642DXqrJhBT78Zy
         QKhEh1wuZPKw4BlB18h1RKJKaopeJLr8NOQP6kmTuPnveSTdKTN7EHwoDXgMZWOu8Uz/
         o+C8PUdsqlHSm5RO7sUQK/r7t3+cm3ImJ0R/b2cmt4zF4wIu9QX+roZ6WddC/+8u9O0y
         ym3I5vVhzcihx8koreTmnX1D7j3i5T5YOW2onpPg7e+X9m3K+jkhBDHpjzBwZc0ykoi7
         eu9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="G3vAhk/Q";
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id z7-20020a05600c0a0700b003e11d7e9257si16441842wmp.105.2023.02.28.11.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 11:28:55 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="G3vAhk/Q";
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1EAF31FDEF;
	Tue, 28 Feb 2023 19:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677612535; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QweYlVkgsKkdSaR0EGS4O9Xq8Ca8lpE3c9GPYgg4Tf4=;
	b=G3vAhk/QBVTCt6RCQW6apvmZQHJCX5AK5fN/xJg6DU38PUYrzZk9qgMPAVY2PnQFG0sP6G
	kNcwFGDMk3woL8A6Mpz62dltYP8oS9VS8XeXAFw1De31gDTvu8TzyuE0IKRo++B4XE3MmE
	Pfu7ePg2kWKhns0EwU25MCS+qCbRJVw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677612535;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QweYlVkgsKkdSaR0EGS4O9Xq8Ca8lpE3c9GPYgg4Tf4=;
	b=9v3N4gkEt5Om1WiPLV2Tct50J8z9JLf/DNhLSzwUpIz/LldGuGJP6Jbr7bB55ZGmm4GISs
	w0mk9mMpEj3EaMAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3A36B1333C;
	Tue, 28 Feb 2023 19:28:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id YN0RAfRV/mNBagAAMHmgww
	(envelope-from <farosas@suse.de>); Tue, 28 Feb 2023 19:28:52 +0000
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
Subject: [PATCH RESEND v7 6/9] arm/Kconfig: Always select SEMIHOSTING when TCG is present
Date: Tue, 28 Feb 2023 16:26:25 -0300
Message-Id: <20230228192628.26140-7-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230228192628.26140-1-farosas@suse.de>
References: <20230228192628.26140-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 7bn9+vlNdV3S

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
