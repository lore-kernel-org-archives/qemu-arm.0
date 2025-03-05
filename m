Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp911777njm;
        Wed, 5 Mar 2025 08:12:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWax4D5ocnLfR2gWzyfdWOESuXEHEUrNQib++r0qD6wEArztcjB2L8zD4fPzwi2rAwF7tzfVSfZSHuyRQ==@linaro.org
X-Received: by 2002:a05:600c:1c29:b0:43b:d1ac:13 with SMTP id 5b1f17b1804b1-43bd2ae6785mr32842125e9.30.1741191170411;
        Wed, 05 Mar 2025 08:12:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741191170; cv=none;
        d=google.com; s=arc-20240605;
        b=K4E/FqdPL0tghWIBrMp2mI+gkAHgSEXhAbHDq3DUytWAmkkhh7MuVp+zPB+JPQFpw3
         xHkzZh1iiHZNqKf8YgLtXfdDsYv5SNay5WBl7uhtoIYB8vgPkoKmX+0A0bNjr54doOn/
         g0xSZpvhs3mlEyzrUEqtiH3LsmWx7qCr8XxPn2hz+IpcGQEgYXj365uCncpTL7HG4mZ5
         KnIhSULy17Sg90wn+FWan+Jo8o1/cMVSZiUPs9IxxcrIC+BrCXy6BjKsvisbbzcuAYwm
         LQj7s6obm7+gxut2Pg7MUB9jslKD+8h8YyFW//WJKCTZk8fBmaH4qwXv0JK0Q2l/8AET
         S60w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=eULSMR+wOPom3XwDZHhHaMYxsR4PJeNusGTgEDgMQis=;
        fh=ih1sWZkXecDG8WRjXuQgDZFswGN9uqLOmnUwCga6mpQ=;
        b=KWdy0zMvwJC6P/WQwr9OJHDZlIwrP8v6Gtrgq48whONcE+0CePBjZHqrwA0NrnBxod
         f3/bG97TZs7qx6VDMxriD1oedEX5oqUsCkwPMuLCM937lAfR3Po6mgPD/cktPldcPEgP
         AAPYQnOOd2EemjfxN2e6AHOFKnN5oOY/xZ7X/u9nANUNEFN4MNDzGm1zyXKfjtclLWZx
         j0MeK8NoOG838q91fuXdzzYE6uqYsXos+t5CEOyChNqWlVFF3XpN3ciZbclVxBwObPFq
         +cMhfiZ+pPrqCPQl2p/rhYNhoC55rmHTbGuyp5CYe9ZsmAAd5KF/WTJTQk5oo7hr/1uE
         sCow==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZPBOsmf9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43bc264db6esor28947455e9.2.2025.03.05.08.12.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 05 Mar 2025 08:12:50 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZPBOsmf9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741191170; x=1741795970; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eULSMR+wOPom3XwDZHhHaMYxsR4PJeNusGTgEDgMQis=;
        b=ZPBOsmf9Aq4JPuhuQPO1OAxmQ0q6ZayOgf+yfNagdvXKWrIECsKRlE45LF8t0Qh37S
         coaFNooWqdQOjue58U4U7tBGFNlVVYUIUJYCPvdJFW9InWKf7bfcBYAcGehTBeKR/Pdw
         Sh8pi8zpBqe3HcjLYs6LXvhV8WuWG22IxFPhqiW3Y4xzde3EgIdkIdChopDSn6zjPOxi
         DQxGpQIRPw63aeD93cfSJVx2E6tFTLNPWgJxwp7RBW4QOm6CFXSVjeDXkinXmcMJh/16
         W3EDCoKB+lPCG/XS2cOOLQ/cfnw6dCD6hzt2mbOa4Nev8T2HTFomCrzYjk2gMRiHYiGS
         HjPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741191170; x=1741795970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eULSMR+wOPom3XwDZHhHaMYxsR4PJeNusGTgEDgMQis=;
        b=H/lCw1kiQpE7ETZypputRm0oPjvVcY03FolxA3bvKTDA2NgwuZ2ksTxvvT7m2Xfyqn
         5yj+AZLvQeI+j+A2+xk4yvxfbf9KpbKzzN0lIjvG2IsEX6hwbrwVbh7ayE/7+BDkme7Y
         uf/RlyTtyyJFJ+9hUZniizwHbfTy1NFAEVijmSGCsxy7y42qr3Ke7vyNHVZK7FX8nRI7
         5Djdr7Rp4RhHgTwJFlHh1FWcc29q4XIXmEyNlSTv7hieMxysYPIpX0hjdmo3QP33meV/
         /Kyk1Hud0DseEGAkybvolQXFcBT8HioufR+mLIpM82boHsbfFmxQ/rem76BSxF7xjyVC
         xEPg==
X-Forwarded-Encrypted: i=1; AJvYcCXGocxIzfA+avpYUlq1bWj13g0rudXLEZQKwsykxHt8I/XdCoKetlQ5SHtCxZUEcRB7BRCyHW/Yw+euWQ==@linaro.org
X-Gm-Message-State: AOJu0YyVXQB/4UyFSFj4tBpsJi8BaALV1pFGm64ttFUc1DW8KV2D5o/V
	FhCEYOoZOXPTJtqLqs+RnVCZbCV7wO0TtGkho9BNcutEmiz0/+0bZFztwzw0bCrx8A==
X-Gm-Gg: ASbGncubRTxaRdLoHaUjkO5k+lp0aLYwhXqqzL/vo8Afb59WkYn2RaMoBG6/fxop/UI
	quuYWXUUCQTHsoOxQ/zwYhBoebRqR+61XRsB7sIQLpvr8ZgKzc7tU/1dgJH7at6698NtGlfUY0l
	zWZhAOMqYe64jKPt5zeEsqPh1CWB/lW4d1dKpOulvgk7GIA0AAafLXIGdAn9axvCbCCmq9XIVhP
	UH0PareBDP7hDvl8NSE3yu5RAVYeMybnUetp2pLOonOApUoHRuKsQiX0X4XYfhW5IUKTRF1/rTd
	ItlBHebCkWxL03E2FusXW3u6yDGhTkhvHWaCpJ1t8Vm6J3BSenCsWyPrTQEU4BKH5BqlbPIb/2b
	OvfoyXOyUdQCBfmoAnUM=
X-Google-Smtp-Source: AGHT+IEYQibmHjw9N7LchBFy6y339Sg5OLg0NcqSCdtZ2kKQKuxt6kE3aOx+yP0Jn5TOb4rm6hpdDA==
X-Received: by 2002:a5d:588b:0:b0:390:ebae:6c18 with SMTP id ffacd0b85a97d-3911f740b6amr2820440f8f.12.1741191169879;
        Wed, 05 Mar 2025 08:12:49 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912933c050sm41438f8f.100.2025.03.05.08.12.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 05 Mar 2025 08:12:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH 0/4] hw/arm: Register target-specific QOM types at runtime
Date: Wed,  5 Mar 2025 17:12:44 +0100
Message-ID: <20250305161248.54901-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: I7oErBUchF2f

In preparation of having a single binary for both ARM and
Aarch64 targets, unify raspi & aspeed by replacing the
compile-time TARGET_AARCH64 check by a QOM runtime call
on legacy_binary_is_64bit().

No behavior change with current binaries:

  $ ./qemu-system-arm -M help | fgrep raspi
  raspi0               Raspberry Pi Zero (revision 1.2)
  raspi1ap             Raspberry Pi A+ (revision 1.1)
  raspi2b              Raspberry Pi 2B (revision 1.1)

  $ ./qemu-system-aarch64 -M help | fgrep raspi
  raspi0               Raspberry Pi Zero (revision 1.2)
  raspi1ap             Raspberry Pi A+ (revision 1.1)
  raspi2b              Raspberry Pi 2B (revision 1.1)
  raspi3ap             Raspberry Pi 3A+ (revision 1.0)
  raspi3b              Raspberry Pi 3B (revision 1.2)
  raspi4b              Raspberry Pi 4B (revision 1.5)

Based-on: <20250305153929.43687-1-philmd@linaro.org>

Philippe Mathieu-Daudé (4):
  qom: Introduce TypeInfo::registerable() callback
  hw/arm/raspi: Replace TARGET_AARCH64 by legacy_binary_is_64bit()
  hw/arm/aspeed: Replace TARGET_AARCH64 by legacy_binary_is_64bit()
  hw/ppc: Remove TARGET_PPC64 use in ppc_create_page_sizes_prop()

 include/qom/object.h | 1 +
 hw/arm/aspeed.c      | 8 ++------
 hw/arm/bcm2836.c     | 6 ++----
 hw/arm/raspi.c       | 7 +++----
 hw/ppc/fdt.c         | 5 +++--
 qom/object.c         | 4 ++++
 qom/trace-events     | 1 +
 7 files changed, 16 insertions(+), 16 deletions(-)

-- 
2.47.1
