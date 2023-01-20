Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1303534ejc;
        Fri, 20 Jan 2023 10:51:03 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuI3WVN/ragENqX87JQ/MK58JRhnjMHofxm5GhZ32e5HKgs2E9HMdSfFLdgTFesMWOe6XtO
X-Received: by 2002:a17:906:5a5c:b0:877:593a:58ef with SMTP id my28-20020a1709065a5c00b00877593a58efmr11323118ejc.77.1674240663225;
        Fri, 20 Jan 2023 10:51:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674240663; cv=none;
        d=google.com; s=arc-20160816;
        b=aj6z7b+8uh906QbhkO1q8/SRybzMGlh0VVk0PBFCMVsmqtno1vnrtHi7yDiAazWZ7W
         +J92ReTuq6dgmzkPJnhTxpmiGFYk1kbMGA63WwRx3yb7AOxLQUV3v03wR0GozXVYIy13
         FsLaMI46IxMLp1YQg7p1+bbaHRdvDtJbbYSXD3mKy1Rz0v8Wt0etGrJiOi8bllPSfdx2
         Z+WP4smBrbjwNOZJSt8/E89igfkIx0Ov3Q6DxiadMa8bNtaFJswR5drJRNAaf3epwEV3
         UJ23HdPSR5UQ1mUWNVg5JDx0hTqaKHnWf5cUqcfAbBU2qTf4wHngRMC2Fhlm6gDvFJuC
         CWHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=hbU7HrZCP93qfv9uhjdBYhL7a4UEt8xa3EKaz+dXueg=;
        b=OR6B3z0gnak15b+X+YatWoZbH8hhGNk0ZhIb4YBQz4BY1sVbie8usBgs8UhmvPrCc4
         xwB/iea17vTo4jzNlk1zy6C6kRWttguO4mqJTIAAflbXXufIxXxTIw4iXnaI0opfA5Xp
         Znc6/H/G/5/HdQtzwf1vClQLg0fuaMsrWhHTh1Y/oiNtJ+I3E+CEegyVZ3SzV9Jl7ezm
         UXrkzCr16AdkEh2jrxlohxEYr6JKe/TBtobEWMGutq/MwjWm/XlL61MhxVfkC4RPcBZm
         QBAMyv4gOVQ1eiDQ4SgvnU9ssBDDr2XbT/IlQYFj1b+jGlevubjRBqH/+axwI5zGYnOZ
         sdeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Tn7gLZsJ;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id hg7-20020a1709072cc700b008692b15cca1si26245812ejc.603.2023.01.20.10.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:51:03 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Tn7gLZsJ;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CE1E8337CA;
	Fri, 20 Jan 2023 18:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674240662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hbU7HrZCP93qfv9uhjdBYhL7a4UEt8xa3EKaz+dXueg=;
	b=Tn7gLZsJk48uaPEB/DSmy9/I3C4Mkc8fLpBljO6bAWPzZzQm5bdII4gOSzz8o92hwqJ42e
	431tNsaiiDLeeUuNgCq1A8qu8rX4aGN+TwydTyyIw2sTk4i461C7hBfp1qy25iddpV53FM
	RPDmhvaF8igIOBoURhHa4z+juH3q58w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674240662;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hbU7HrZCP93qfv9uhjdBYhL7a4UEt8xa3EKaz+dXueg=;
	b=1dt9r5lf7Q9t90gfgrGLvaTDjasWRn2HPnEhDQQOrgLwlRzsEC331xU1NmN6rWwNB4lzc5
	WmUrSWnTwATr+oBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B81381390C;
	Fri, 20 Jan 2023 18:50:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id YDbhHpPiymNSbQAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 20 Jan 2023 18:50:59 +0000
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
Subject: [RFC PATCH v5 8/9] arm/Kconfig: Always select SEMIHOSTING when TCG is present
Date: Fri, 20 Jan 2023 15:48:24 -0300
Message-Id: <20230120184825.31626-9-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230120184825.31626-1-farosas@suse.de>
References: <20230120184825.31626-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: WdZU27J7AGMv

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
