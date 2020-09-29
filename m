Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4986200lfq;
        Tue, 29 Sep 2020 15:44:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfelaDZQKuT9kRANk13R5Svyt2GBmxfmxi+e7YqjrHnBMGURtNOvccDDaY+L7pmMNClsPZ
X-Received: by 2002:a25:b3c5:: with SMTP id x5mr9611459ybf.207.1601419469319;
        Tue, 29 Sep 2020 15:44:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601419469; cv=none;
        d=google.com; s=arc-20160816;
        b=CZHNBK6eO7p98hm5ab1VJ6rH5JvQt/tfX5m87X2DjTXZ7hbnbNz0pyeeNOrM+EcsjP
         DYjzkoOGDGVFHua1vJauYGhet6P4ejRX0OWvFn0Lyr0WWQmkY8SRGMqIKtjNGjF1t9xX
         qSPRpMbTfL0FJLi0pB/vm6EOaSPaSQ92YzOcSny1nmZGAaBXe7rpvegMitXDRQwrv0mW
         JK/nsArPxz4k68iug4DforK9DvcObu//Iqvx/9EeaJaN/znfBACFdeJrXWKq+xoYSoOZ
         R3fo3J08q7xXzp2e7gzhTUvnM2/4jFQbrnkoNMlR8fCIZF/0FrquZPj6/bon9NSL4qx8
         C9+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=o4HjcXP3qwr6X7IJP4D/f1xvLwTdd8bPvM5GyTvUpNE=;
        b=ekVYtaK06NEJEvtrJqCiaehiPAkGZaZfIZtHasL1n0zxRqunm1y4jS8Kjz/5651LfG
         J3nbEaaHMkz833Ht3+Y79rdgM37da7hhy5oi18V6YaJkENyR7/UOhTEMzRBEwtcMnJ3L
         ISv+9pLRAhbW5aW1uz7kSMpE10pCKRXo6lg9Ir+I8HNbi+2EyMYw5ie7B7I3q5pmq0AY
         LmtySSfgT5Qto16Ot/uLtc105y4zqesOaS9EP3p5YHVVK5c2qbOsU8FGRBUXYfeiVWka
         S27xIXA4iwl44eq82m0W15jPVkH0S6y6KtJCl4Li0RG6vUbnkttamzIiM/b6CiUHpn3k
         uhVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FkFf5Ij4;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id 18si5927689ybj.342.2020.09.29.15.44.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Sep 2020 15:44:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FkFf5Ij4;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601419468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o4HjcXP3qwr6X7IJP4D/f1xvLwTdd8bPvM5GyTvUpNE=;
	b=FkFf5Ij41zCOn7dYNCLzUE2DTM4mv3RpTx0tyOdWu9jOYAQlorbAMTCbK41VhXF1yFntJz
	ztV8xfQV2PqN+nt6Fs01xCgh4uNa7uF7ZDyXnyiJF5YAyWfwdWXEzpShQD5/Wgu0lbXpmJ
	wUS59jgNCFiDYnRuSoWH9SHD3xBREww=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-CdlbykxpMwmQp_4tXNYMTA-1; Tue, 29 Sep 2020 18:44:24 -0400
X-MC-Unique: CdlbykxpMwmQp_4tXNYMTA-1
Received: by mail-wr1-f72.google.com with SMTP id s8so2338653wrb.15
        for <alex.bennee@linaro.org>; Tue, 29 Sep 2020 15:44:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o4HjcXP3qwr6X7IJP4D/f1xvLwTdd8bPvM5GyTvUpNE=;
        b=bUhgQyLrEO6JOkbsSNAE2VsjPRfdEfd2AtVQSQakvc3fAWbJVub+3SEU/+cgRax2t3
         uGspyypwd0tTVSpjRzfORKKbdOfv1w5TYhl9B5emml0zc/mZHy7cmhUYkKV6Z3d9Km4j
         whjJREjpqoFx7Lsh3mxcGdKPk9qA6lNUFs6Zbm2U3wfMjbAE6f/5smOzAt5FuTo2LBUW
         xH18lyu9ST82eZl98UWhUXFLPU1S/PI0ssnvx0EKecpHNPdr0G3AWHNoVNBS03+qTm+z
         20Io6ZfVEz0eo7KnBi2eRUKfzTS3j0o768eKBx3urZwFUIMmGrnK1JYax9LBrcySuNnR
         c0Bg==
X-Gm-Message-State: AOAM530SCFPdBGLHLrH+pdHwVjDhNT8e3p9ESUAkmqhgzuZtMshHDKca
	Sf/w5TMvjpUdKjM/Kz3x7NbYO72nSDawtuS4f570SQf5nJkwPRm/tcBGl0fp1CbJnk4U+PwnkHr
	KtumlgZnL8zx3Lrxs
X-Received: by 2002:adf:83c3:: with SMTP id 61mr6487531wre.287.1601419463553;
        Tue, 29 Sep 2020 15:44:23 -0700 (PDT)
X-Received: by 2002:adf:83c3:: with SMTP id 61mr6487523wre.287.1601419463375;
        Tue, 29 Sep 2020 15:44:23 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (74.red-83-53-161.dynamicip.rima-tde.net. [83.53.161.74])
        by smtp.gmail.com with ESMTPSA id l4sm8483138wrc.14.2020.09.29.15.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:44:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Fam Zheng <fam@euphon.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v4 05/12] target/arm: Restrict ARMv5 cpus to TCG accel
Date: Wed, 30 Sep 2020 00:43:48 +0200
Message-Id: <20200929224355.1224017-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200929224355.1224017-1-philmd@redhat.com>
References: <20200929224355.1224017-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: HbGiBzmOyXSH

KVM requires a cpu based on (at least) the ARMv7 architecture.

Only enable the following ARMv5 CPUs when TCG is available:

  - ARM926
  - ARM946
  - ARM1026
  - XScale (PXA250/255/260/261/262/270)

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/Kconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index b546b20654..d2876b2c8b 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -2,6 +2,10 @@ config ARM_V4
     bool
     select TCG
 
+config ARM_V5
+    bool
+    select TCG
+
 config ARM_VIRT
     bool
     imply PCI_DEVICES
@@ -44,6 +48,7 @@ config CUBIEBOARD
 
 config DIGIC
     bool
+    select ARM_V5
     select PTIMER
     select PFLASH_CFI02
 
@@ -73,6 +78,7 @@ config HIGHBANK
 
 config INTEGRATOR
     bool
+    select ARM_V5
     select ARM_TIMER
     select INTEGRATOR_DEBUG
     select PL011 # UART
@@ -99,6 +105,7 @@ config MUSCA
 
 config MUSICPAL
     bool
+    select ARM_V5
     select BITBANG_I2C
     select MARVELL_88W8618
     select PTIMER
@@ -138,6 +145,7 @@ config OMAP
 
 config PXA2XX
     bool
+    select ARM_V5
     select FRAMEBUFFER
     select I2C
     select SERIAL
@@ -254,6 +262,7 @@ config SX1
 
 config VERSATILE
     bool
+    select ARM_V5
     select ARM_TIMER # sp804
     select PFLASH_CFI01
     select LSI_SCSI_PCI
@@ -373,6 +382,7 @@ config NPCM7XX
 
 config FSL_IMX25
     bool
+    select ARM_V5
     select IMX
     select IMX_FEC
     select IMX_I2C
@@ -399,6 +409,7 @@ config FSL_IMX6
 
 config ASPEED_SOC
     bool
+    select ARM_V5
     select DS1338
     select FTGMAC100
     select I2C
-- 
2.26.2
