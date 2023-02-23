Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp710073ejc;
        Thu, 23 Feb 2023 05:11:46 -0800 (PST)
X-Google-Smtp-Source: AK7set+a/Y35g3tH3caagovRMFcs2y6Y8Izxc+qBGHuqkxo/eGKNstjktL+VHvI2icbDl490awqB
X-Received: by 2002:adf:df87:0:b0:2c5:8c03:573f with SMTP id z7-20020adfdf87000000b002c58c03573fmr9797660wrl.31.1677157906110;
        Thu, 23 Feb 2023 05:11:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677157906; cv=none;
        d=google.com; s=arc-20160816;
        b=w01qnRfT8HbaT9PSCrsgQb6LD8miMEu+ji+3+nDcan2vAJ/H+T31nPrCTeYajinmlb
         6rmNC7v8EAvwh8QFu0osDA+2Ag8WVubvhzI18q76mTk3esmkIIFHyi7f/DdUbPEKLLd+
         K6mYedJNmUwxd//8MXwgOmVin68c378gx2L/kTwfZ82l/j38buRwF1WPsrBR4SBozonX
         dmMZIBA4H4RBmo7Vv/s2jNPI/7/G23csYXAsDrYIHc2oP7kt4rMLbzUe+KT2abrf28te
         s4awtScZJ1c+lsCd9XaycHYK++H1ylujbhdyriqUpieLeLAG6wy8D8lJ6lzdRF5uUNCx
         glNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=QweYlVkgsKkdSaR0EGS4O9Xq8Ca8lpE3c9GPYgg4Tf4=;
        b=JTG2VHJtiNr2AxYtsO9YcCERSS+xL8o7QjCDtFqYHGgX6qjCicuyWvHPf5PSy++jq1
         327DWEb6X7uUaUggZ0oEvmYTnp2JBwqx2MvtO6JOwiojKakNZgKA9q1igyIPZlvLFlsD
         4w0/PPMzuF4056JmZjphZRq9txPLSeeN3OXDWn7dWXvkPj5LYHeNCZk7PtuO2aWCuNdP
         nV5ZMFm+6NCkI2yLNl1etPg/HWrfhbk847t8qVVnal4vZ6SHPY96VpeVkoYEk6HSBxHp
         ngCMgxpWn1PFU2oeQ38wQVkM0QkB+4HjePARipAuyThIkmR0O5R7mx6kPWj2/mR5C/o0
         s/xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=ZvVW8VkZ;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id j9-20020a5d4649000000b002c558aa4171si5046752wrs.64.2023.02.23.05.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 05:11:46 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=ZvVW8VkZ;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BA552204AC;
	Thu, 23 Feb 2023 13:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677157905; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QweYlVkgsKkdSaR0EGS4O9Xq8Ca8lpE3c9GPYgg4Tf4=;
	b=ZvVW8VkZ1v6VI9vDBMWokmoE9scC99kTfPqzJrwRRjs5MTmRCMGxx+I2B+JMAM6yEmoq69
	leAAyx1pyE8K3Fixs+LsZcHtHcgmFuRYaK8imHnnOigp6h8Z8RTreN+JOcbION6viHb9Uw
	sYVSe/uosx9DStbKfs+G/ubXlAWTNTQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677157905;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QweYlVkgsKkdSaR0EGS4O9Xq8Ca8lpE3c9GPYgg4Tf4=;
	b=mTQNbYLVuNMUyJPz0UJ3hb1n1/tzGDoytxepLf5KGQOp6VW3Hf7NhybA3tCIKYgF7J+9WI
	LmmZy0zecFg2SzBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D94BF139B5;
	Thu, 23 Feb 2023 13:11:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 0LQCKA5m92MLawAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 23 Feb 2023 13:11:42 +0000
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
Subject: [PATCH v7 17/20] arm/Kconfig: Always select SEMIHOSTING when TCG is present
Date: Thu, 23 Feb 2023 10:08:38 -0300
Message-Id: <20230223130841.25916-18-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230223130841.25916-1-farosas@suse.de>
References: <20230223130841.25916-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: CvhLfj+2pTxV

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
