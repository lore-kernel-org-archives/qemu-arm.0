Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp463914njb;
        Tue, 4 Feb 2025 12:10:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWkc17jyLNQfQ84O9CyGzgFmq5L1S55uYwddyoGgOKEJlbuFvlmxap3BKTubZgAO6Hd1wGuwP6zXkZtLg==@linaro.org
X-Google-Smtp-Source: AGHT+IEIQr3C1pAQu4KhjfrMaNGW4Q37B3B6mLdTLuAy+NjjiCaMUU7bWZMU3Ipnx9mNAPd9aGO5
X-Received: by 2002:a05:620a:248c:b0:7b6:c92e:2e6d with SMTP id af79cd13be357-7c03a0418f6mr8322485a.52.1738699817647;
        Tue, 04 Feb 2025 12:10:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738699817; cv=none;
        d=google.com; s=arc-20240605;
        b=QRy3XxSEtTrA1n7o3NI47006xT6L/CdQzFb/8AM5JzGfmIKYCj8WaZDRSqfEhD2LAw
         xVoDKxS9NHXyqHnjs6XymSrjjiYp32oDKmbB4X2G0I1z5e1bLo+nt9JT3xVRXCz4RYWm
         k4ZkgkCoTYi+9TazJ0pxMDMRdk5I+10uY3+WXGyrrW7n9bFBPYMnhuNY5MQQcgHvYMqM
         t6R16xvU4CSqpA9m+gp2ChLo6d2qhMLw6hSd0/0f9WPAX1Qv1apSM2xq2aYl3RsD0NWU
         LoHfyY/tJXxG8yIhouipuu+gzx9TFx1ksK2twn0SzcGANPe6BmtK0oMoIi7eNAeDLaCA
         lfUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=EqVhAosz/A6QAaD3TmSgOO9xc/masNVVDg/+AovaPWA=;
        fh=sNGqOaX3y8lXh2+UGIMHh3hU0PVxqHddbMe6cdsY+j8=;
        b=dh7Qqb9QWforS7ji2+LTTtrtc55Np/KE0Y0NDXIlH8ABYC1ubJWXPU9IXy1kjHy1rh
         KSw+bhfZ/pMUSomlZIzqDEu9LgO8fuUk879IEjW0ddPqmPC6uGDXwQoe0GopAWVTmGlh
         /76sOc88Z8JT/bpotxgY0lzjbdOkHNQtMrTJiMXgoc+do3iJ9CfS/I9npfSBLoI4G61R
         LPd4jRRW9TC40cmTHMDyj32JsHj7Do9Kprtu3Wo9x7jkGsrDmlLLQdoiApv8mkUH/gv2
         rM/fbSjForsJppe9zo65kcS/N6f27icLfWjj2I3AnYm4+IWg9NOuO+zDaPQCsxoNfGl6
         dfCA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AWq7hsTc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c02db6318fsi336643085a.163.2025.02.04.12.10.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 12:10:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AWq7hsTc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfPFC-00010t-Ga; Tue, 04 Feb 2025 15:10:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfPEw-0000vo-55
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 15:09:48 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfPEp-0006Nv-7g
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 15:09:45 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3863494591bso3087047f8f.1
 for <qemu-arm@nongnu.org>; Tue, 04 Feb 2025 12:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738699776; x=1739304576; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EqVhAosz/A6QAaD3TmSgOO9xc/masNVVDg/+AovaPWA=;
 b=AWq7hsTczEOEwbviHPgE4ZgnMxvsr8lY2+H1tgWlK6YvBrcNwJcsie23ADNfjDBhyu
 4LwajMCQV3HFTMTcX+LCh1ebf49bNy+ifEeMy9+E8TMACWcKQA8Ma3jjnEHrJlPNbjzM
 /POlzWhJRieSh1nFZP1GxlawT3FRlSgF6e+/NhJ3JGQAOhHw6XzchEzqZ8cpzrGnF04j
 odMbC7hWzzD4owM92hHmi3GTXA2bJrr8SdYSbh42G71wQd1SvR6aIFeXYTFUBwxi9R7T
 UapFWggasAlOjR57vCvSFMHygXC6/se0R7O3n17RC0FppPXBGnDPxYihniJEKVUtIwxl
 FSrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738699776; x=1739304576;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EqVhAosz/A6QAaD3TmSgOO9xc/masNVVDg/+AovaPWA=;
 b=VgK6UVVI71UFoVF6f63hatZwDMNJaQYb39BeLF3Wvk9UEUV4oJ5gJM1Gx3Uc/GmwSb
 POYcbCMAs0SIehqhOH25oQT1bYVY531C8irn3xdWjm2/I4i1mMEXb30LpuuzVCnoBFI6
 LsJbMdITvhQAt8/DiQDDHkzE8RBSf0TW0SgkDJEVvhTawHM7uTzgo2bA/ZwlPzzCe82v
 LynxuMKjAbA7pO+Y71BKdJQRu7wYOfqLvfu/uoQF0sI2zKxL7SP2eAwMvzay+n+cugft
 AOHtu5w6fbZ5C25xYVl/Osq8MG/soINj3azGsQHfjm4/El9kRgg30AJ3aKjwMNXCTdXL
 TGGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbvfimu9Wxv3ez0HCM0Jw5FTgP7fo8HeFs+coQ+wRJSQLiAvJGvylJERtYCVb0SmrONDpe3ptF+g==@nongnu.org
X-Gm-Message-State: AOJu0YzajcVPGRihxaiwwh53y/uues8aHTaXVB58iV+4GZHj6nP/24AW
 uwynbZOGJ/xjXhNgc13eyIhe1OUmrg4iN9fStkPvOHlnxEC7rNDoedEvf7C1PJs=
X-Gm-Gg: ASbGncs5dEMXBIFOn6j196QuiPc0igJ8SX3onFDOWuLjSVradtc20GwKGTZMMDUOhl1
 o1jeLZc2FgkQljbdJYN2rY2Uviz6bGAOj5BxXsK7LcUbL8gqmjYtMnOIZYn4EAGeUDQ3XVZMpt3
 HZy9J3kdkluzdWDNc+VPQMcVqzr4ly2mY5IjaDYOERoaVqttPeNu8QPwYqtTb60wckHf8rxHL4k
 O0P/xG+LR0OdivP/lzsOsn2euhj+WKMlWGy7JQhRfw/EXrodvrnayB/dPb9Y+rPUe6c15aQhPQe
 49toKRYP5pX8AiZ5jVJ346zttbMWhzSGYMYNaQ0iOzMZWgVxMHvwXOPNTtYYiGO93g==
X-Received: by 2002:a05:6000:1a8a:b0:385:e8aa:2a4e with SMTP id
 ffacd0b85a97d-38db48bfb90mr123522f8f.31.1738699776239; 
 Tue, 04 Feb 2025 12:09:36 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc26d6fsm233518245e9.14.2025.02.04.12.09.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 04 Feb 2025 12:09:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 0/7] hw/boards: Try to make sense of
 MachineClass::no_sdcard flag
Date: Tue,  4 Feb 2025 21:09:27 +0100
Message-ID: <20250204200934.65279-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: M2L2/K9eifkN

Invert MachineClass 'no_sdcard' flag logic and rename it
to 'create_default_sdcard_drive' to make sense of this
default value applied to all machines.
We use the OnOffAuto tri-state to catch implicit default
values. Then we toggle the logic and remove invalid uses.
No logical change intended (except the assertion added).

The list of machines using this feature is:

  $ git grep -l 'auto_create_sdcard = true'
  hw/arm/aspeed.c
  hw/arm/bananapi_m2u.c
  hw/arm/cubieboard.c
  hw/arm/exynos4_boards.c
  hw/arm/fby35.c
  hw/arm/imx25_pdk.c
  hw/arm/integratorcp.c
  hw/arm/mcimx6ul-evk.c
  hw/arm/mcimx7d-sabre.c
  hw/arm/npcm7xx_boards.c
  hw/arm/omap_sx1.c
  hw/arm/orangepi.c
  hw/arm/raspi.c
  hw/arm/raspi4b.c
  hw/arm/realview.c
  hw/arm/sabrelite.c
  hw/arm/stellaris.c
  hw/arm/versatilepb.c
  hw/arm/vexpress.c
  hw/arm/xlnx-versal-virt.c
  hw/arm/xlnx-zcu102.c
  hw/riscv/microchip_pfsoc.c
  hw/riscv/sifive_u.c

Since v3:
- Do not remove machines with multiple sd-bus
Since v2:
- Fixed mis-rebase catched by Thomas

Philippe Mathieu-Daudé (7):
  hw/boards: Convert no_sdcard flag to OnOffAuto tri-state
  hw/boards: Explicit no_sdcard=false as ON_OFF_AUTO_OFF
  hw/boards: Rename no_sdcard -> auto_create_sdcard
  hw/boards: Remove all invalid uses of auto_create_sdcard=true
  hw/arm: Remove all invalid uses of auto_create_sdcard=true
  hw/riscv: Remove all invalid uses of auto_create_sdcard=true
  hw/boards: Ensure machine setting auto_create_sdcard expose a SD Bus

 include/hw/boards.h        |  2 +-
 hw/arm/aspeed.c            | 20 ++++++++++++++++++++
 hw/arm/bananapi_m2u.c      |  1 +
 hw/arm/cubieboard.c        |  1 +
 hw/arm/exynos4_boards.c    |  2 ++
 hw/arm/fby35.c             |  1 +
 hw/arm/imx25_pdk.c         |  1 +
 hw/arm/integratorcp.c      |  1 +
 hw/arm/mcimx6ul-evk.c      |  1 +
 hw/arm/mcimx7d-sabre.c     |  1 +
 hw/arm/npcm7xx_boards.c    |  5 +++++
 hw/arm/omap_sx1.c          |  2 ++
 hw/arm/orangepi.c          |  1 +
 hw/arm/raspi.c             |  5 +++++
 hw/arm/raspi4b.c           |  1 +
 hw/arm/realview.c          |  4 ++++
 hw/arm/sabrelite.c         |  1 +
 hw/arm/stellaris.c         |  1 +
 hw/arm/versatilepb.c       |  2 ++
 hw/arm/vexpress.c          |  2 ++
 hw/arm/xilinx_zynq.c       |  1 -
 hw/arm/xlnx-versal-virt.c  |  1 +
 hw/arm/xlnx-zcu102.c       |  1 +
 hw/core/null-machine.c     |  1 -
 hw/riscv/microchip_pfsoc.c |  1 +
 hw/riscv/sifive_u.c        |  1 +
 hw/s390x/s390-virtio-ccw.c |  1 -
 system/vl.c                | 24 ++++++++++++++++++++----
 28 files changed, 78 insertions(+), 8 deletions(-)

-- 
2.47.1

