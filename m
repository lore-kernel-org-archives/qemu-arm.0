Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp593670ejm;
        Wed, 26 Apr 2023 11:00:55 -0700 (PDT)
X-Google-Smtp-Source: AKy350bPsE0IGMC5uO+MJm4g91hUpJuZpAVsnKz3qtQovQyK8D37LqDXff0aGY+yGNYqvqmmKlrP
X-Received: by 2002:a5d:508c:0:b0:2f8:b556:1fb with SMTP id a12-20020a5d508c000000b002f8b55601fbmr15815711wrt.28.1682532055508;
        Wed, 26 Apr 2023 11:00:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682532055; cv=none;
        d=google.com; s=arc-20160816;
        b=Fc8Y1Fqhqxg2MVaDt9xLPBhQAIujryZsozBCV9hgWqGzomHjgfr1tey8m7plzWRQZ8
         +oZOkYLaJEAIWdGwAQJKZ5I4yoru7t81N0u6Wo9dH0LjurU7fWcwDY6SYM2AdqCo1drv
         MghYmwEznKPav1uCXFhi77Ypqc3dmuSFGaO7XB7qIuE6bEN9Xhlb3wh50QbCtg/iZmcX
         CH5s2vFs0y4a9pjq2rMCIs3rAogOIzSgHpzXl+4BWMEcxhasYIHFjJqgXTNR0hAHi5pW
         vmhGR3lR6ahDsLGTc/nVVqLpHD8sUGtFQwry9/Fqm0V4veDb20/hgSeADZCP9wYrHpMX
         Umlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=Tk0R+RJpmdnYytVhbWzlVJ1mo4OLggH6OSWG6vaLrWk=;
        b=yHDziyPxcO5AEco+GQQwbIGdQsPZ3QktICEoo4+0/8itk1litqV7fRu2ZK/6oz3RjJ
         ddwJqJFAp3y9XqTQKcL3T+UImkEsATrsG69rYrw7GBiRiilpdDsj320pvP5nHOUF74SQ
         kDfUhEP44mArG3mnq7riSUHEHlFE3eDafN2WYw9RdMKcLM/yQhVNfGL2iSjzQm8wLv0f
         fgDXn8Mfp5sXHxHDECnDx8IA7AzyGXmfRYDhFYH31ccps6x85U1PGeFOlJIA8aWtdqhO
         YGRhd9l18wASkyz2oNS/IaIYVwpebpxW9oe00bFBpui7IQxNm780Wwdi/omV47I048PM
         0C/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=BPUIXGIE;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id v16-20020adfe4d0000000b002ff110f7544si9794597wrm.385.2023.04.26.11.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 11:00:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=BPUIXGIE;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 310CB21A18;
	Wed, 26 Apr 2023 18:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1682532055; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tk0R+RJpmdnYytVhbWzlVJ1mo4OLggH6OSWG6vaLrWk=;
	b=BPUIXGIEIQ4zmhjTkmHgZqAuPTuqTV+gfiJiXfs20AXEosjmA7pappJbTwHM4lmZ0w3Qc/
	ida/jqVD70z8jkR93r+UNbM06Tspw6CmY0mXfowVIHPhQg5xXDhEnyU/wq0PXJ9p/BrGwv
	ILZAWsuMgjjE7fbVT2ous+AOMROQ+fw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1682532055;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tk0R+RJpmdnYytVhbWzlVJ1mo4OLggH6OSWG6vaLrWk=;
	b=vq4MlZb9BItK+CYasYuVRfI2qMsp8DArt+s+Mfsl+jJzkTAdsB7KF+fbShzpg2iKVMVNHQ
	/3GCmXdLasP2NXBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4A57B138F0;
	Wed, 26 Apr 2023 18:00:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id qMDnBNRmSWSoVQAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 26 Apr 2023 18:00:52 +0000
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
Subject: [PATCH v11 10/13] arm/Kconfig: Always select SEMIHOSTING when TCG is present
Date: Wed, 26 Apr 2023 15:00:10 -0300
Message-Id: <20230426180013.14814-11-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230426180013.14814-1-farosas@suse.de>
References: <20230426180013.14814-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: +lY2UYY1sFuR

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
index b53bd7f0b2..87c1a29c91 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -317,7 +317,6 @@ config ARM_V7M
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
