Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp679537lfb;
        Fri, 15 May 2020 10:09:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwsaKgrnna7RKayOt7j9pUip1RSB4Zt6hH83lhzx5VvSTThYcRRiJulYkBuykmW8wbxxTN
X-Received: by 2002:a25:6a82:: with SMTP id f124mr6935271ybc.460.1589562543867;
        Fri, 15 May 2020 10:09:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589562543; cv=none;
        d=google.com; s=arc-20160816;
        b=sIkV5Aqtt78ZHfMlQgRMehJMBef7qZIX8V4YXP1eS/Y99IDLWMdUf4+xnesDqag0Og
         fwmzBfUAzYv5Ct2qCfxrPCN5dBVaWULaS/cJ4VZOjneZTo93tXckgI196J7renhjhxxJ
         hq50bk2RI4LXvLizVvJY1fmOiXAuUnqh7Xzk6VIKORsF1Im34G7V4EeHpyAOwqUR3VNT
         IVWWXSoun8yJpGtCgtZQ0l7Ld83MLchuvnOdX8bbrzhdbPQ8l/DleXAP80HzmygKrxLm
         rmCMkTOfie4rn/1SvNbEHQX+6mcLdp5NfoRHkcM1UGmC/VDx7o+KGWAJVmz8AmcLa/Q2
         gDFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=CgUPsSauJHPAfqEtx3F/6v2O6U+cLNjTuefN7n8Nwkw=;
        b=CYULHL1o4GuxjxMiHwZuBnN+ed3hIwm77P/NlAArrq4irGV/L4WSklZKF8PZJtnI/i
         FxAH2mU37etrT1MKu5tUqSzrxRIvtTUJc9DK77HKTqpxK1tKOTTT9hm8mo9bwIYT+Wy9
         Qs8xagvHu3iC3Gz55KLerkaIAv5bNfyINc9G7xYeD88Z9FfEUhbb6xtc/UibXFZsh2Xr
         iCH30qOJiDfKc9mlb3DllRYyMm3cAPNhYQSWDQgRvsUgvmw9Ct2S/3XhYPYCejvMFw4X
         2kmI9HiL+1pnr2TT9gorBcn6tSSTAE38o2JXA5LB8NJxbN7xNg2xzSq9uvKPYm5Ae3GM
         q23A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bg4pB3HV;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id 137si2028812ybl.66.2020.05.15.10.09.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 May 2020 10:09:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bg4pB3HV;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589562543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CgUPsSauJHPAfqEtx3F/6v2O6U+cLNjTuefN7n8Nwkw=;
	b=bg4pB3HVScczVqURCfK270sW26260rP1cdH2LrQ3KXlI3Mm7loVrI2u5uWnkbIs7Luch8S
	0zSa3Ux/VEoUCdOfCjopbKewi6U/++SeGV4gYpnkpQONihJWKVbfhm7llcd2C3AD8RFOir
	vMi9ovpcrcilJ9m30gqwMd4V0tfnx0c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-Jaw0uchWNoW7c5YjuYIHBA-1; Fri, 15 May 2020 13:08:59 -0400
X-MC-Unique: Jaw0uchWNoW7c5YjuYIHBA-1
Received: by mail-wm1-f71.google.com with SMTP id w189so1474825wmg.1
        for <alex.bennee@linaro.org>; Fri, 15 May 2020 10:08:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CgUPsSauJHPAfqEtx3F/6v2O6U+cLNjTuefN7n8Nwkw=;
        b=iSC2AyNr6ktllkx9lSON7BAGQajR7UjQTLn7DoX8ht6uN414BmmcdJvfdaUYAHbj4o
         udv4vJ0TR6U+7b8OJ/po/KDTwaau44OxVHyzrQyTyueHI5I85NAkdOH0S89lT9sGzyzU
         vjaDbCcqFGQIX3qWyBcM4oRkmu+KJYbX0Fu34QUZMrkaHHt+D6ul5mLryVpua9kXI+Z1
         6kyIcZS/MYLSkk7B4egYHWVxTxmKzyyKPzvLfnsVfY4nxrSffMpUVuszbDWFcj7/ZHUZ
         dc3RNUVbWcj/G5cqpU9vjD4nwKvYuz96GldyyYZYkVoSt88izC3lrg8myaDpTIuFiSpJ
         bllA==
X-Gm-Message-State: AOAM530nVSQBSeAqP5dlfiS7FG26mTpD2OqemLxD9tm0tKVdFB9U3Ovu
	MIWEhD+VwQFhhXmeIhI+49RNBlN5IxvFkB0XLc82KhOVYZPZlUUEHaeOIweyGhxl1Jl+rr9iozn
	fqdQFVmxKKPjZe35C
X-Received: by 2002:a1c:e2c5:: with SMTP id z188mr5022585wmg.35.1589562538397;
        Fri, 15 May 2020 10:08:58 -0700 (PDT)
X-Received: by 2002:a1c:e2c5:: with SMTP id z188mr5022566wmg.35.1589562538245;
        Fri, 15 May 2020 10:08:58 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id z12sm1931109wmc.6.2020.05.15.10.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 10:08:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>,
	Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Richard Henderson <rth@twiddle.net>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Chris Wulff <crwulff@gmail.com>,
	qemu-riscv@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Marek Vasut <marex@denx.de>,
	Michael Walle <michael@walle.cc>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 09/10] Makefile: Allow target-specific optional Kconfig
Date: Fri, 15 May 2020 19:08:03 +0200
Message-Id: <20200515170804.5707-10-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200515170804.5707-1-philmd@redhat.com>
References: <20200515170804.5707-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: FAluZL9jw6wA

Allow use of target-specific Kconfig file.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index b4c0830b26..5fce168fcb 100644
--- a/Makefile
+++ b/Makefile
@@ -423,11 +423,13 @@ MINIKCONF_INPUTS = $(SRC_PATH)/Kconfig.host \
                    $(SRC_PATH)/accel/Kconfig \
                    $(SRC_PATH)/hw/Kconfig
 MINIKCONF_DEPS = $(MINIKCONF_INPUTS) \
-                 $(wildcard $(SRC_PATH)/hw/*/Kconfig)
+                 $(wildcard $(SRC_PATH)/hw/*/Kconfig) \
+                 $(wildcard $(SRC_PATH)/target/*/Kconfig)
 MINIKCONF = $(PYTHON) $(SRC_PATH)/scripts/minikconf.py
 
 $(SUBDIR_DEVICES_MAK): %/config-devices.mak: default-configs/%.mak $(MINIKCONF_DEPS) $(BUILD_DIR)/config-host.mak
 	$(call quiet-command, $(MINIKCONF) $(MINIKCONF_ARGS) \
+		$(wildcard $(SRC_PATH)/target/$(firstword $(subst -, ,$@))/Kconfig) \
 		> $@.tmp, "GEN", "$@.tmp")
 	$(call quiet-command, if test -f $@; then \
 	  if cmp -s $@.old $@; then \
-- 
2.21.3
