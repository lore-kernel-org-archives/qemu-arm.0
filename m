Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp251800njc;
        Sat, 8 Mar 2025 11:03:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUYs/7ojywIJzWk1VIjTdIjzBR0epQ6TofA26VXXKTVyhtaAS+Gb7ksIRgYd8coaWZ3tz8tO3NfvvQUgg==@linaro.org
X-Google-Smtp-Source: AGHT+IGKZQvDy0cCSDgDb3KUojM9fBmA+e+pajGPV9omnrO9qVXbdUwUIZYXaM9WJOsObTViHZSz
X-Received: by 2002:a05:6122:54b:b0:520:4996:7cf2 with SMTP id 71dfb90a1353d-523e417412amr5365149e0c.10.1741460602304;
        Sat, 08 Mar 2025 11:03:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741460602; cv=none;
        d=google.com; s=arc-20240605;
        b=GruAa0mGDQDhC6AZACyB/dF8J05MBwsafuEqdlh1xGUqdUM+X8b9ugxgWTqygo0SBf
         JWIBp7JuwyF5mSJFFaWqRdZcStb0bBaMkpOZxD181B9hkLTVzx6Yr6wHyVJLDw1bPBL3
         HEnIam6tyF6EBzDMI5rFB/eVqQqJ09Wi4eNTmu3xKP6ypSH0XRCaIc5zIr4a/3GKT6zJ
         lMf0xn4Yf+1W1cwbBz5AKZOegcEY0S0wMVjV24RoPGXYjVBdRNvSup3TjIcpP74Xs5lA
         W9F2qaiFw7qwhXcY6T/V9nWsnc7TfeGuheqgNb7zhMJPPbazIYurqYPRiOMNMJfHQVPH
         lWIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=aIqBM/TFApGI4yptbwhXjcFV6AOYWTNkUbNj3G3Lsk0=;
        fh=pmtkCn/8v5Mwk9pec205w3RB/J6lCsDZpkTtSZF0KYs=;
        b=NWM8cvm6IRKuXeHK4MyFw13nxNUFGvpMtE0z9beBWNaFVrLWctaOYM2WXgaEGP3Sga
         EtwQPNBNuihm4vHEQvo5HOIk6zF79JjXBd9bcVc7FebE/2UodeF6e5n4YXDxU2Y+1pS/
         fN8FRwC7WFsa0VZ+DX9cffEem53LR9bA2awO7XitgYkorXy5BrXG6i/gUG2ikLB+u0WT
         kC3nH3+M746iBj57/ilLfsXtXlDVVSUE/tEmnxiNmXnS07pj7BMV7Y+KRNLmDps9dC4f
         z9EWvliiV2+zP1HAiLHHbTWlJp2X+PusP4ZyS5TEev/byVrOAobcjk9GzYh5YlZLrpPc
         B1Aw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DpyKKdRx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-523d8c876e3si1397314e0c.200.2025.03.08.11.03.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Mar 2025 11:03:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DpyKKdRx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tqzRn-0006tc-0f; Sat, 08 Mar 2025 14:02:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tqzRi-0006kJ-LY
 for qemu-devel@nongnu.org; Sat, 08 Mar 2025 14:02:51 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tqzRS-0003Tt-5e
 for qemu-devel@nongnu.org; Sat, 08 Mar 2025 14:02:37 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cebe06e9eso2266005e9.3
 for <qemu-devel@nongnu.org>; Sat, 08 Mar 2025 11:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741460552; x=1742065352; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aIqBM/TFApGI4yptbwhXjcFV6AOYWTNkUbNj3G3Lsk0=;
 b=DpyKKdRxiTNuO99YclSrteJvhfcBUh693X5sBLDDs2ph550tx5r7OE99hO661fwkCK
 TPSggLve1+IfZ3UDz2FgEqOWkNcHlH0dliTE9/BOAbmf8Yeft4ciYl3f3G06+0uSAQTP
 hT8XwLo6EgmnnLrDDCa5YNAODF70PYHLEWdk5RBH3QbLAW8Le5vRsPH2mfxbb3YiK8Xl
 ha/1xhqptrnuF5zFVXtFuNgXXbAEn+RWyxfOq7891Hh5uhZ2p8ls5UW8t05nZx0Hqz32
 3qIDN/JbDV8VdsijBiQp3JjXSoA9XLI5Uub9woAV1PiSX5AlPUHProHu7sTQxHGXhTcJ
 gaVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741460552; x=1742065352;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aIqBM/TFApGI4yptbwhXjcFV6AOYWTNkUbNj3G3Lsk0=;
 b=DnWpVVTscVAX/npimG/En+QwDsP/idXGtqBYzpaw53GGHn8tNILgeFYW5y++Bh33Xy
 oGGVOP/BTkyT4ifcaBgvCeVzguK73kMnEMgXK6va6S/mxjtRvScn+fZyZt30A+oluxRL
 yCDrEC+JVA/J/PqgNCJVT1SAZfVlpWlVUmAclAomY8hWt7vk/mwmsMmjutVVDE0cnPO6
 0Ru2+0nj4mCkT30b2uKfgSxDMdTiCYu9JRRq/PHeXC39jILijjo5JyB7YvPanCoBIWIF
 KZeO04/hmMg+ezbzUdv8LuRrHXqOvYWytZbbNUxHB2eb4xvtOiS1D4+zaw1RSPAeDQJp
 CY+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2W6uYl0RoXGvDYi4DOOCQDZ2cp9U3zLRyQ7wBNIuUyYrXHRsbvg9eJZx4/p8N+jfa28GxiW12J+pL@nongnu.org
X-Gm-Message-State: AOJu0Yzw85vAoaQPJkFPnYRGKFecQZvRQIc1WUD1NbYWKb9zZIDItApz
 9SN5E3rF8ohv4dVm4jmtNVsrwGsH272JJpfFe+JQ1NEB9y/DLTiaZrg7fXQoxwE=
X-Gm-Gg: ASbGncsUofMbbW24i1A/Z60mWDHXtN6t0vwPXXiRY6C8HPIQEQNuPAu4aXGpNB+dodf
 NEMn3cegC2w3HeYFsCPnOY/V2J6HMqT7HVH5quZhrBAJcW0UGSQ4C9ZLIgUNJO3bp7bRl6SW6xK
 +StngP4UuKC2yYH8H/Kkjuse5clTVZPtxiU4oYIxQ9FpQEoie6JP+/LpA8PFlK3t0kRnzZrtYQN
 qMo9DaLs9t9ARZeX7ad7s4o4cF0T63OaMcUUnXSJGd/DHp06b59M8Z6RgcDga8tLD8mXAt1crgz
 XrGxMg9L6nM66j71Wzkgmegde66uhUfX5l51l9v1wLrEup9RvfEmiSBm+ukdl+MMSnH340/ldT5
 MZV7i/sga9vT7xMF1WEY=
X-Received: by 2002:a05:600c:1d2a:b0:439:89e9:4eff with SMTP id
 5b1f17b1804b1-43c601d91e9mr57679085e9.10.1741460552489; 
 Sat, 08 Mar 2025 11:02:32 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdfddcsm9716966f8f.35.2025.03.08.11.02.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 08 Mar 2025 11:02:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: BALATON Zoltan <balaton@eik.bme.hu>,
	qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 00/12] hw/sd/sdhci: Set reset value of interrupt registers
Date: Sat,  8 Mar 2025 20:02:18 +0100
Message-ID: <20250308190230.7508-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DZ1zT69Nlwz2

Rainy saturday, time for some hobbyist contributions :)

In this series we try to address the issue Zoltan reported
and try to fix in [*], but using a more generic approach.
The SDHCI code ends up better consolidated and ready to
scale for more vendor implementations.

I expect (with few QOM knowledge) this to be trivial to review.

- Remove SDHCIState::vendor field
- Convert state fields to class ones
- Simplify endianness handling
- Add default reset values as class fields

[*] https://lore.kernel.org/qemu-devel/20250210160329.DDA7F4E600E@zero.eik.bme.hu/

Philippe Mathieu-Daudé (12):
  hw/sd/sdhci: Remove need for SDHCIState::vendor field
  hw/sd/sdhci: Introduce SDHCIClass stub
  hw/sd/sdhci: Make quirks a class property
  hw/sd/sdhci: Make I/O region size a class property
  hw/sd/sdhci: Enforce little endianness on PCI devices
  hw/sd/sdhci: Allow SDHCI classes to register their own MemoryRegionOps
  hw/sd/sdhci: Simplify MemoryRegionOps endianness check
  hw/sd/sdhci: Unify default MemoryRegionOps
  hw/sd/sdhci: Add SDHCIClass::ro::capareg field
  hw/sd/sdhci: Allow SDHCI classes to have different register reset
    values
  hw/sd/sdhci: Implement Freescale eSDHC as TYPE_FSL_ESDHC
  hw/ppc/e500: Replace generic SDHCI by Freescale eSDHC

 hw/sd/sdhci-internal.h |  25 +++----
 include/hw/sd/sdhci.h  |  43 ++++++++++-
 hw/arm/fsl-imx25.c     |   2 -
 hw/arm/fsl-imx6.c      |   2 -
 hw/arm/fsl-imx6ul.c    |   2 -
 hw/arm/fsl-imx7.c      |   2 -
 hw/arm/fsl-imx8mp.c    |   2 -
 hw/ppc/e500.c          |  10 +--
 hw/sd/sdhci-pci.c      |   1 +
 hw/sd/sdhci.c          | 163 ++++++++++++++++++++++++++---------------
 10 files changed, 155 insertions(+), 97 deletions(-)

-- 
2.47.1

