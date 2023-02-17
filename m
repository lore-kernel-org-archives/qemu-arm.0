Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp128888ejb;
        Fri, 17 Feb 2023 12:15:27 -0800 (PST)
X-Google-Smtp-Source: AK7set/JPJhZTZO27Z8Ahh7HwsbCEuyQ81gLZkah2CdooStPI7pJF2FDbaKhx/LHuzB1iSvmcn8G
X-Received: by 2002:adf:d084:0:b0:2c5:99bf:18d2 with SMTP id y4-20020adfd084000000b002c599bf18d2mr4348776wrh.67.1676664927584;
        Fri, 17 Feb 2023 12:15:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676664927; cv=none;
        d=google.com; s=arc-20160816;
        b=Gw52OeZVojPKvClhsC+RPpLiy6z0ijzU/Rru0whWIbO4+xiaOXvq4mH6RPzfsDoQCQ
         QOgJDHxxhNi6q8tf9fUYbj3AcQil3/c6mIX8sohhWoowRrzkoXn2kW7ahKAJPlEzg4ZT
         thFaML1xZ1SyjQPEkl3/T4G5yu56mjyzqJRsLU4DSMNxF3PMsK6PcYWAhe7fNhEThext
         9uaz/oXNqlPxAi43nKV98g+VhjW+yDuNzBRudidiumVhUIqt6GqCrB5+Mu1GObq0shTR
         LA3VHiSWY9RVuXa4BoZ2yZgXSZQHKspS/YpQBwxDoYAzr69In54A0M0mGARPzFYa+76g
         8gGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=e5tfxhz0XLT506HPN6j8wnNQmjG3RMFDcTBo7NMv6Wg=;
        b=L8ePRvyP/8LOf6MYdgTpxDdpaaJTTYSbtB83swKabzkcasiawSHseginzmDRn5yS7Y
         8jUOIJUM7kuI38sk1BeoRdgvhdbCTA2L+7Id90HK2lXRpdBY+w2aRhb+grAifNozYkY/
         af5DDBhfiyl2DkN5i+25ygKiYnIPaijk/LB5Ndc4aLCiOpNRz9Zn4UQdCr0GwUYmDlU4
         T7PAPg7O9m35NLhrfnOLrFFZNhfBqd7hFBHZxIKgs5U2IRibCTEr0z4p17+tlTxrzNSn
         WZ3q4OvVuzkV1vuF+Nh7mpzEHzLdypuPRyRZks1sZtnASOVdaIBjA7i1vSlzpxk9rRI1
         eZsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=ZVPacfZF;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=VlB7WAhr;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id g16-20020a056000119000b002c54fe4a0cfsi5540555wrx.163.2023.02.17.12.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 12:15:27 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=ZVPacfZF;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=VlB7WAhr;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2784220FBF;
	Fri, 17 Feb 2023 20:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676664927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e5tfxhz0XLT506HPN6j8wnNQmjG3RMFDcTBo7NMv6Wg=;
	b=ZVPacfZFnu4oxlvetE0D6ZQjX8Ro14H7cVW3nrneYGYSBUTOyqPBcOCtBncf2sjRb9Bcwp
	I1lDDfbGwtZGPbqKpaNN3Iy6mAwNs/hcBB4skIPj62rYJpm1IL8n0KU83u3jjXC1v4xebZ
	AnfRPrUYVyC8xsvQ5SC4u4MGH62x+AM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676664927;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e5tfxhz0XLT506HPN6j8wnNQmjG3RMFDcTBo7NMv6Wg=;
	b=VlB7WAhrj32IYnGxdHa6538HLAXTX8dwYgdsUhRnP+SQuy0c35i5agrIWL7CgTtpRy9HrW
	zxApPkeoavCwZCDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3CB78138E3;
	Fri, 17 Feb 2023 20:15:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id WKezAVzg72MwIAAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 17 Feb 2023 20:15:24 +0000
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
Subject: [PATCH v6 26/29] arm/Kconfig: Always select SEMIHOSTING when TCG is present
Date: Fri, 17 Feb 2023 17:11:47 -0300
Message-Id: <20230217201150.22032-27-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230217201150.22032-1-farosas@suse.de>
References: <20230217201150.22032-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: hCT+8o3XAg4G

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
