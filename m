Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp393119njb;
        Fri, 11 Oct 2024 06:21:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUW+X9gZIK8z9aWF3WMDtxqXHBYBfHSwihFOJ+6zoCXVYz7Wc8PrLdlutmV+MumI9HjH4pEV8kcpDyxXg==@linaro.org
X-Google-Smtp-Source: AGHT+IF3poRMeko3LqnCAIcg9fGdDrP1E/MlxT4Od5Onkv/E/nReAf8pHEtglAUdnX4637zIL/Na
X-Received: by 2002:a05:6902:12c4:b0:e24:fac6:fad9 with SMTP id 3f1490d57ef6-e2919d83c4amr1841409276.16.1728652864925;
        Fri, 11 Oct 2024 06:21:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728652864; cv=none;
        d=google.com; s=arc-20240605;
        b=hoOnihbvX8Kh139jFqoukY/lda0XTRuzklv2fj7CHrbsbb6Lhli2+TlrdV6nWbqpp+
         b+7DA2XXD6LiDqaJl32TPbunieX8/ZoRvsHB1+NI4avU5GO/8JsCf9lfCH8SheW5XkLj
         4FBWtG9ndXzI2FPcWuZRku19AhdbX/e1wg12dqZNER0HSmvUaj/DUSzUW2XJRskRuMK6
         fPxk/+f/IpXxci6pfiHmTnDVtN70//liFYgpqwExK9RKalzv1XOrmMQeWCVeuCUmBimD
         GqzXlr4xCodIW/ODdgfkU9co+QWBH7UsyiZYh8F1X9UYjjzJuKhJZO6GSDjAJ/SKmX6I
         6jUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JREXIIvl302nrjZLS5RAoHzWxTFKuXAGwAHQ6gMR2Hg=;
        fh=yV7XiH9Iqz9ECmsY7O4iL5H1OqntXAXD46ZP2pth0HE=;
        b=e0P83w9/mqxMWn6U7REARRsxekvM+YME/7OSBYy/2KFt+OtjxtBb4D9xkD5F6Q8Cw1
         Sevon5jT0IriAShLbiKclEFdhRQsBm8x1ZMna1Fbfr8Fnqf4OHFeFMWDRNoUREWsH7TH
         perNTDE0gipUEpwBgHhSKdAHa+vbAdbSaY48VDFeP9+775s25jUrFQ+Cj7ukDJu6g5n8
         X9AjB196MYpVF5T9UyXLZKxkS6t8cZzqmdeoKPkfw9sIAMZvEGZSDwx3e7xmAWluXE8S
         K2RoJOYyYgYcTA/6WYm8B1jZHi01lzEsbxwAsp8VCkhgoXJWA75yug1n80kczLPb+jhw
         e8yQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WRyfxEXk;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b1149d1222si383422485a.761.2024.10.11.06.21.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:21:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WRyfxEXk;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728652864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JREXIIvl302nrjZLS5RAoHzWxTFKuXAGwAHQ6gMR2Hg=;
	b=WRyfxEXkPK1ibg3y6QZieL3Jg3wrvmh1pzLK3FIeo7ZInoMtp6tyPAxxxajZhKpb/X0noy
	LryTY0eWGZUiMQuUn9ulKLugg/1fTpGY/+7wgsCcbNYtJKK+3Wwc2+SIntMJlCYLmYudRe
	OwWv84z/1+yXGgb7rwwb0NiuphFRkGU=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-638-DufTexF8MpaGj1B6Ka8pYQ-1; Fri,
 11 Oct 2024 09:21:01 -0400
X-MC-Unique: DufTexF8MpaGj1B6Ka8pYQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D19411955D5F;
	Fri, 11 Oct 2024 13:20:59 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.193.77])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5D1951955E8F;
	Fri, 11 Oct 2024 13:20:55 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH 16/17] Revert "hw/sh4/r2d: Realize IDE controller before accessing it"
Date: Fri, 11 Oct 2024 15:19:33 +0200
Message-ID: <20241011131937.377223-17-thuth@redhat.com>
In-Reply-To: <20241011131937.377223-1-thuth@redhat.com>
References: <20241011131937.377223-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: ZsJ7cADhRV4I

This reverts commit 3c5f86a22686ef475a8259c0d8ee714f61c770c9.

Changing the order here caused a regression with the "tuxrun"
kernels (from https://storage.tuxboot.com/20230331/) - ATA commands
fail with a "ata1: lost interrupt (Status 0x58)" message.
Apparently we need to wire the interrupt here first before
realizing the device, so revert the change to the original
behavior.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/sh4/r2d.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index e5ac6751bd..7eecd79fcc 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -286,9 +286,9 @@ static void r2d_init(MachineState *machine)
     dinfo = drive_get(IF_IDE, 0, 0);
     dev = qdev_new("mmio-ide");
     busdev = SYS_BUS_DEVICE(dev);
+    sysbus_connect_irq(busdev, 0, irq[CF_IDE]);
     qdev_prop_set_uint32(dev, "shift", 1);
     sysbus_realize_and_unref(busdev, &error_fatal);
-    sysbus_connect_irq(busdev, 0, irq[CF_IDE]);
     sysbus_mmio_map(busdev, 0, 0x14001000);
     sysbus_mmio_map(busdev, 1, 0x1400080c);
     mmio_ide_init_drives(dev, dinfo, NULL);
-- 
2.46.1
