Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp281386ejc;
        Wed, 12 Apr 2023 05:19:10 -0700 (PDT)
X-Google-Smtp-Source: AKy350adQRxNTBpRsXVrEWpwuPA6w3UR8sbNQV2wFNn+NuGJY98zUdLvNMnBnjoQS/dSON8ep2aA
X-Received: by 2002:adf:edcc:0:b0:2d7:3d7c:19cb with SMTP id v12-20020adfedcc000000b002d73d7c19cbmr2042107wro.4.1681301950699;
        Wed, 12 Apr 2023 05:19:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681301950; cv=none;
        d=google.com; s=arc-20160816;
        b=V4NphZzb3/g7JgYkm98JT1ZnTaH7f7xqwsnNKxCPM49ZNkDuUpOxapid8dDxCdar4r
         zCzpIoRBsJs431/ieaTfjbRPsY5pJMW30px3zBeoyCF6BJVDfqXM2kj+07FDuQknt+5O
         O2EglUZIU4sTiPYZ9HyO2cP5mruTvywlNFoY60yMSN8TVH3AFR/UTLge5suOn+aA+UJO
         ng7rFtjLmfECD/p4/lFZdG4syzT/w/Iml5z1XXzByWPzwoYogjI2Pzuiih0g/EsixJOA
         dfhIh4ExBFcrVrl9Ccd0ZDdAthtxGY3BrjW8U/VXMRXxAjDwuWutgTHOHncBCGAhNdGa
         MAjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=QweYlVkgsKkdSaR0EGS4O9Xq8Ca8lpE3c9GPYgg4Tf4=;
        b=oq3kfF4O5bLfK+k1NOWvj9URdMf/mcWp8BYNXxB41sY8YZMJhZtzrphqnoj3Xgyldj
         mD1Q9A2PErf1vqtj56t43wgRYyuD2dM9C2zOzhZt5qxHBKBge96GctDWLlVtUVyq2IU7
         9QJVwyjyqJ1IR92Kg4J06cPx2o1ahPmTx7sZ+UjUJCTOzINPLBImQA919Y74bCnc4Zwg
         Gv8+2WvTDkkDXkMn4uiXSixlNnZiAG7qMCJpCbCLdS7eO0k7SG9D6liryiNMz4ZBFbBi
         oqbemErUYYqGZyY7ObmFURqzNzjB1l3X3Cwd6EId25sGgj+wDM06T+rF7nANtfThEKrg
         7F7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=IesFzAQv;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=XwF5SfW9;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id b11-20020a5d550b000000b002efeba4e214si1801304wrv.140.2023.04.12.05.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 05:19:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=IesFzAQv;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=XwF5SfW9;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5CD7F21940;
	Wed, 12 Apr 2023 12:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1681301950; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QweYlVkgsKkdSaR0EGS4O9Xq8Ca8lpE3c9GPYgg4Tf4=;
	b=IesFzAQvyogGpMOSohIdUAc2eka65V3oJVfTjo0SCsTJfgg0VD5dT5IWgOSNljdWZGiEIK
	4WAwBYK/Rvp32a51aVeR32QoY054G6abCVnIh5VnOXVgQcd4PAkfjsC9ruY1nRlPDHmnrw
	TKYHp6NKlMOoRfJajf2G7d5rA5g9XK0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681301950;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QweYlVkgsKkdSaR0EGS4O9Xq8Ca8lpE3c9GPYgg4Tf4=;
	b=XwF5SfW9onFuMtDgFMIqhag9XVA3m7khh/Yr90CagRK5GTaWbOjHVpWNnPetRV6b74agDi
	GNtMP8qT/KVXlODA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 54E52132C7;
	Wed, 12 Apr 2023 12:19:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 0MvfBruhNmSMUgAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 12 Apr 2023 12:19:07 +0000
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
Subject: [PATCH v10 09/11] arm/Kconfig: Always select SEMIHOSTING when TCG is present
Date: Wed, 12 Apr 2023 09:18:27 -0300
Message-Id: <20230412121829.14452-10-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230412121829.14452-1-farosas@suse.de>
References: <20230412121829.14452-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: EC69TcKpE9r5

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
