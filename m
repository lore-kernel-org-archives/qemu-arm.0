Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp931528njb;
        Wed, 12 Feb 2025 03:39:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXXxvPGNNRW0vXKImhMUz6VPFSZw1d8XfcWH8FaYwgfT6tfeFcnuh93PcpboUqtRdurhO0ogGMI3sNR8w==@linaro.org
X-Google-Smtp-Source: AGHT+IH8UHa0jZssT4NFiOGuDu5xOJLV9hindlTxhandRI6JwDl0EZTsdx+VqNuwkXMIWASy7mFf
X-Received: by 2002:adf:cc82:0:b0:38d:d8e0:a9a1 with SMTP id ffacd0b85a97d-38dea3d9d1dmr1712538f8f.29.1739360397196;
        Wed, 12 Feb 2025 03:39:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739360397; cv=none;
        d=google.com; s=arc-20240605;
        b=IRyNid/pKSn37SyTaQ2SRPPu3x1dWOvGLqGyrEGqsgmSwAZCYV0ekqPJY5iRrXrfuh
         LaIBrb3EdeDU4IgidZElVJ3y742HSLzWJkjPPXkcY6sOvJUD2s9eZchHNNdUd4GPotKC
         Uwy5uql+zJl3cKdO83mS+8ECF8JjpMtl8oMAaPURUCxh6EiZ8U7c7ZPQ4Dw/afJ9V2G5
         cjf4rfweNul3Sh+G9PHCnh02CTyTh1rfUDgtjjfqFAlptgBpLVigXJG9RqjUp8bbnewJ
         sAmSojfNlIpnhXLD/J8lc1EK5N/kWEY15/OcIGQuF/938eUMF00skM9sLuIwW0e/qjyk
         dcPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=mEUX3qY75fsXd/SIMG1U80ZMnDgC2FfV0nZrMVlIheQ=;
        fh=M3jhSyWjU5lhw9j1QvLaiqsl7EGWeilRGMdlV7ypQfE=;
        b=HU+WKn87dxPFZz9ZxEDEXFcCjIa0hReSTG2aLe0neWQzTOKGGCHe0urchmdDyfDPuC
         sHTm238fEvRQmuakns+G7dZzetmI8T2WhJGaqYK4gOUfl38tvTffPv2rllYZUkG/xp40
         mDUclGI7hXw/fWWGgcrC8vTALNbun0VQ6Zu1pqptM4b+WXej2H8jzevuZpMDTY6mYZsk
         cb8JMUsfdUqlwjNOBMvMA7NMd2Y89qxqiZAkAxSOP5+lke1rCQv9sWa5oBEuw+sUNeZq
         mdJGKDUanNluWYyj7RbhZbKa8uxOqXz0xqZR5zjQvUE5YZDqxDvyNTyU5pSJSRZSi+LB
         kIDg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IObPy7KL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-38dc5de20absi8485408f8f.822.2025.02.12.03.39.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 03:39:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IObPy7KL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiB5q-0002Es-86; Wed, 12 Feb 2025 06:39:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiB5o-0002EP-Cq
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 06:39:49 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiB5j-0000Zk-IM
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 06:39:47 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4393dc02b78so24341675e9.3
 for <qemu-arm@nongnu.org>; Wed, 12 Feb 2025 03:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739360380; x=1739965180; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mEUX3qY75fsXd/SIMG1U80ZMnDgC2FfV0nZrMVlIheQ=;
 b=IObPy7KLcj3hV1yfbX0rNGRyYkyttzPHEycUx/0aku7yptfTZo3+OyUmUFoFY3WEoH
 fPCM0fJIH9wknbGrt5ipX4chqAMKKKlkzGpMiQJSWqDK1BtVQd7W31BOUHA1HAVj+UG4
 UyHhKvneSXqEfVgMeIUgoau4lg7c2Lw7pHVJQnubJRcA+7BGz8Yl/f2bZE1VYbKxpW2D
 z5D5iqVRm7VFVbBDl28y0BhWR3vmn4o8xguyszksVxs1rPvF+Ikmo19BZZ6wO9RsoZxI
 Xmr1zJ/qleDZDrkW3lv1muBM9aDO9/pTd+Ofnzmpr88h4GlxJlrgLq26HBmnXi2M+JQN
 QX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739360380; x=1739965180;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mEUX3qY75fsXd/SIMG1U80ZMnDgC2FfV0nZrMVlIheQ=;
 b=dxyDeVx+Wd1BfIXxEt6714mkJ9bAZOFjLHliMtF+neutf9dPHMH3Cfbk480XWSK1Rh
 pyFfD6aJjIRuYQw+VqtpHzZZH3TbSMobpi/wVhoyPGPl2JZC8O/ZsMok+cwn6fG9WCyx
 Q6qG5XIMLCfHKmGj0ZYl65SgxPuxWdZmMu0cPqTRhN3qH2fa0YlR/7HIncxeSmg9gaRe
 p+8YphiepncN9lUVkEnPPend1UDOaw/riybAgEZdDpGXCdsDGj+bnMweQ3OZuqrXas70
 0/deTZ8Gksl12pwSAB+w3M24aHxsBi8D4P8B65fY8WiVKqWfTChvlPOdX247OiIRjSPT
 i84A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdNqrWs1NhkYMIeoJlNlnUHKHV801piBq5WxeWeXmUrtrJqsGtu5lS5MXjqkSKuXJzd3fahWuvLg==@nongnu.org
X-Gm-Message-State: AOJu0YzO8w2x4Ydf8pAniyzcVb+bM2Liz/USj7EHQ/Sr6a0erwBHZcNM
 n3q27/L/0ARwPj/rflaU6srl3799qj/+8tFjvy/Ldnb/NGQZ+hYTKdYI4aX5xV4=
X-Gm-Gg: ASbGncskwbRF5QiBIYQezbN8p6TTVUTgWwntgpkjH7E8kvtsYajWFEzEHSKW7jA1LAU
 8yMSOSIuiXxM8c8VqU6K8Hq+6/mKsB7pKEp5GmsjNQNNy3l91CgoFbkNmf9YeQmcyJQdRP28lxk
 +rHATeX2cDgEqe2AJmUMeoJcb4r/KfJoKusrwtFzwowka4j9ZwSestVd29UPwj1xff1MyGwYJI2
 1KOIHnHKvRw1Nn7NZGxV19ipcaxRZsknk/P+UNWvIdMj22h/73zh8byaBurGe/zE3gwAszSFpWM
 +HtfwGfgLcTpoxiRfvCc4JO0/kTkz3MdgshyxRe288+RsXKW4fsUdJ54ycJu2HtMAg==
X-Received: by 2002:a05:6000:1faa:b0:38d:e9dd:bc88 with SMTP id
 ffacd0b85a97d-38dea3c33f4mr2183502f8f.7.1739360380324; 
 Wed, 12 Feb 2025 03:39:40 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f1f27e612sm861398f8f.93.2025.02.12.03.39.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Feb 2025 03:39:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Burton <paulburton@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Jason Wang <jasowang@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>
Subject: [PATCH 0/5] hw: More DEVICE_ [NATIVE -> LITTLE] _ENDIAN conversions
Date: Wed, 12 Feb 2025 12:39:33 +0100
Message-ID: <20250212113938.38692-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: JPoIa4SpDPE8

When devices are only built for little-endian targets,
DEVICE_NATIVE_ENDIAN expand to DEVICE_LITTLE_ENDIAN.
Replace by the latter to simplify.

Philippe Mathieu-Daudé (5):
  hw/arm: Mark Allwinner Technology devices as little-endian
  hw/mips: Mark Boston machine devices as little-endian
  hw/mips: Mark Loonson3 Virt machine devices as little-endian
  hw/pci-host: Mark versatile regions as little-endian
  target/i386: Mark WHPX APIC region as little-endian

 hw/arm/allwinner-a10.c         |  2 +-
 hw/arm/allwinner-h3.c          |  8 ++++----
 hw/arm/allwinner-r40.c         |  2 +-
 hw/i2c/allwinner-i2c.c         |  2 +-
 hw/intc/allwinner-a10-pic.c    |  2 +-
 hw/mips/boston.c               |  6 +++---
 hw/mips/loongson3_virt.c       |  4 ++--
 hw/misc/allwinner-a10-ccm.c    |  2 +-
 hw/misc/allwinner-a10-dramc.c  |  2 +-
 hw/misc/allwinner-cpucfg.c     |  2 +-
 hw/misc/allwinner-h3-ccu.c     |  2 +-
 hw/misc/allwinner-h3-dramc.c   |  6 +++---
 hw/misc/allwinner-h3-sysctrl.c |  2 +-
 hw/misc/allwinner-r40-ccu.c    |  2 +-
 hw/misc/allwinner-r40-dramc.c  | 10 +++++-----
 hw/misc/allwinner-sid.c        |  2 +-
 hw/misc/allwinner-sramc.c      |  2 +-
 hw/net/allwinner-sun8i-emac.c  |  2 +-
 hw/net/allwinner_emac.c        |  2 +-
 hw/pci-host/versatile.c        |  4 ++--
 hw/rtc/allwinner-rtc.c         |  2 +-
 hw/sd/allwinner-sdhost.c       |  2 +-
 hw/ssi/allwinner-a10-spi.c     |  2 +-
 hw/timer/allwinner-a10-pit.c   |  2 +-
 hw/watchdog/allwinner-wdt.c    |  2 +-
 target/i386/whpx/whpx-apic.c   |  2 +-
 26 files changed, 39 insertions(+), 39 deletions(-)

-- 
2.47.1

