Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp306902njc;
        Sat, 8 Mar 2025 13:37:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXJEnvKtAJsIryD5UDIaTB1GZo90Xdj78xYVhEV9PPHDuru+ux5efVBjpquPF8e+fFyclO9yd1tcBnO8g==@linaro.org
X-Google-Smtp-Source: AGHT+IEAVshdh5zIzXQNGG2twLjEaStpiXPSDP4YWvxLWLjt+jM5PFPqFxI7TJX0Klo0dF1eNOs+
X-Received: by 2002:a05:620a:4d90:b0:7c0:c822:c4e8 with SMTP id af79cd13be357-7c4e65be7e4mr818392685a.57.1741469824087;
        Sat, 08 Mar 2025 13:37:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741469824; cv=none;
        d=google.com; s=arc-20240605;
        b=hHI36epsiGHkKWfiCnZge7RW+OntnSspYI61eQ1tVdf5tM71zGxVzyjuB8PbEV528X
         zb2fNEknj4emwikgSFk4KhGzwhY9ELzzyqkAhExYSr6php2EyJjCIDrs4XmmMyJmPi7+
         m5tpaMCzlj+7Cf/gDxWWN5wEMbwegp8SZk1m2Vhymwlt3lWKEd/b7FuRjlhxzTmKEhLW
         74YQTNXm8ekkTmTQDr3pLtSI8KvLg4P7cG819VDy2l4PRg7w7K04YtY7UA+1Kap5boN/
         i6L9OmJ7hy8uIDMxs8QqR9xZHb10LE6+CxqSBD4PRkuZVIaq4o+GgPqJRxuhUJ/PfVej
         hrPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=/soGLRQmXWup4QpXCq2XeRqXX9zhByFKSEzr8WVVrIo=;
        fh=36uiBosxzmYCAjtlQa8/upRsx/caqQtNO7dfQf7YAWA=;
        b=XYo8970h74z8rUQJ87cvLtyxfC/DklkN8pZaM9VdfBnVDT61/MFzoK1/JByTJpo5Ie
         Sz3DBqlcuAfqk74xFEkS8JyVp2pE/aWjSTiLT5wc+JmU+Bh20ga1xyF0KVfvA3xiu9ll
         w2DRPSJE+VaKGnQdoC1pxPnwJfqN0BSX8CcjBHMcO0V1SEzE8alaGMt7O17AwzQfQiTv
         Vgg9CqG1UCSG8oB2GG34LoFG0Cr92mVYOR3xdeeMgB5TpGW3cuGNa+LpbbeZamuwqPIU
         YSA1GY8afxPJPVelovAzDD0k897ITVVoLbZtgMxwrAvZcs8+jriYRBjVXMoPOjpR/NxI
         m6jQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QE34q27X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4751db424ccsi63018761cf.520.2025.03.08.13.37.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Mar 2025 13:37:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QE34q27X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tr1qk-0005Jz-Er; Sat, 08 Mar 2025 16:36:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tr1qi-0005GF-8q
 for qemu-arm@nongnu.org; Sat, 08 Mar 2025 16:36:48 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tr1qf-0003qh-8L
 for qemu-arm@nongnu.org; Sat, 08 Mar 2025 16:36:46 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43bc6a6aaf7so23175085e9.2
 for <qemu-arm@nongnu.org>; Sat, 08 Mar 2025 13:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741469803; x=1742074603; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/soGLRQmXWup4QpXCq2XeRqXX9zhByFKSEzr8WVVrIo=;
 b=QE34q27XtNWlIYph9hN1Z/Pobcz1wC/w7nLTdcuWvsIjvaSP4vff48o/EPragrrRQ7
 t8fN22fGi/nf+tQ8dNEL7MKTEL9Qc5hzyFG6jh9zWJscXE+mXihGXhHrZZ7OPxFWvHyH
 SFC+bEMJvMz2ScijTKnXZguJBjBnZUuPTCxxuOrNiw14APewCGC31YdarnNS38cBnjuv
 /T97wFGQ15UPznur18kVyqyBj+QObXltbz0RoXHBLb8t8EDCqvLYnl49/99dYvSd1OlK
 vBSlJN3klilXIsjMOIqQGulphH/m8yPaxmMNwxgt0xELuk235VQ8Ls1VUS7+IOIvqDQk
 BeSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741469803; x=1742074603;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/soGLRQmXWup4QpXCq2XeRqXX9zhByFKSEzr8WVVrIo=;
 b=KAwlNNj3/xTeXR4n86SYjkYXlx8d53bPO5Wi/uWwN7lNgeo3OWYGxoAxAtrmBT61yk
 0ZEuR59yAxlwq4GDCT1y75ZsfJQUQt14/BeuDzmC9ab+llYsl94l0ESL9ILdnyEnhbvK
 HStxdcYjpQnL04UZcmZD0zEUuqwZMVJvbWjW4F5SaV6VHQOF6+AZd9xR5nQvloItKWD3
 dUJ6hlUZXlIIbabZETTRkjEE2Oyi83n5EV5QWdVMQ7V4BJ32ffb77jKXL9RPxoaPQO17
 qAZ1GbME+wG08TyBZOPES0BWWoh5lAoEjC4lHujF3LugehIPeqWYmKO7dXivc1cfIzHz
 1lzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVefMi8tPzeFOvD4It/Y9HjVKPU8PxZIJ4Gtx3ishFHfBzSrGDc595FkSjJ5ifUEw9fflGjNcIAWg==@nongnu.org
X-Gm-Message-State: AOJu0YxTENErsid5ekF/xdqwSx4Or2+Krmsd+5uPJ3nkSM6ao1SSL7uC
 aRByUO7Joq1ze0Y9E0B+vI11Oa77EJXQOzYylN+RxKhIYXV3FsJH/nvMWl6a2mc=
X-Gm-Gg: ASbGncudKTzyFM18s/azLBvsGI+dm01s76lrEkGM/ULaznCezNRw/44/Cp2R5nRUuiH
 2cvbm20QYZictOdwioIetBX/XGxthTTWrb+G5VuGt+qPPtRyxmZF958aZnPvWzYWqxpKTYa/xw6
 V+us+qIw8GAhUpPuf6p7fzt/5coiyYLQaaZV56MHTeIHnlel9DqW78H9Arwf2M1jDEZsaRaEOcL
 lNO7GZoiElP/woNL85ARM3Br4WhUrdzSlRbBworksbnHNieST2M6+qopAVoNkKK/3j6971wCgLM
 aQX8GE7AI9UlicGCwytPitPJqrKywzHzpFE9YRFtXsXO3+fCnaO85WEPUrWvKVbyRxHZKReK/MJ
 ttXLR+W3Zjk8bgn4xQng=
X-Received: by 2002:a05:600c:358f:b0:43b:cbe2:ec08 with SMTP id
 5b1f17b1804b1-43c5a630919mr45955905e9.24.1741469803413; 
 Sat, 08 Mar 2025 13:36:43 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c0e2eecsm9836336f8f.79.2025.03.08.13.36.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 08 Mar 2025 13:36:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Guenter Roeck <linux@roeck-us.net>, qemu-block@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, qemu-arm@nongnu.org
Subject: [PATCH v4 00/14] hw/sd/sdhci: Set reset value of interrupt registers
Date: Sat,  8 Mar 2025 22:36:26 +0100
Message-ID: <20250308213640.13138-1-philmd@linaro.org>
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
X-TUID: uiUqJXAYUy2W

Since v3:
- Fix "hw/qdev-properties-system.h" (first patch)
- Convert to EndianMode (patch #10)

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

Philippe Mathieu-Daudé (14):
  hw/qdev-properties-system: Include missing 'qapi/qapi-types-common.h'
  hw/sd/sdhci: Remove need for SDHCIState::vendor field
  hw/sd/sdhci: Introduce SDHCIClass stub
  hw/sd/sdhci: Make quirks a class property
  hw/sd/sdhci: Make I/O region size a class property
  hw/sd/sdhci: Enforce little endianness on PCI devices
  hw/sd/sdhci: Allow SDHCI classes to register their own MemoryRegionOps
  hw/sd/sdhci: Simplify MemoryRegionOps endianness check
  hw/sd/sdhci: Unify default MemoryRegionOps
  hw/sd/sdhci: Convert SDHCIState::endianness to EndianMode
  hw/sd/sdhci: Add SDHCIClass::ro::capareg field
  hw/sd/sdhci: Allow SDHCI classes to have different register reset
    values
  hw/sd/sdhci: Implement Freescale eSDHC as TYPE_FSL_ESDHC
  hw/ppc/e500: Replace generic SDHCI by Freescale eSDHC

 hw/sd/sdhci-internal.h              |  28 ++---
 include/hw/qdev-properties-system.h |   1 +
 include/hw/sd/sdhci.h               |  46 +++++++-
 hw/arm/fsl-imx25.c                  |   2 -
 hw/arm/fsl-imx6.c                   |   2 -
 hw/arm/fsl-imx6ul.c                 |   2 -
 hw/arm/fsl-imx7.c                   |   2 -
 hw/arm/fsl-imx8mp.c                 |   2 -
 hw/ppc/e500.c                       |  12 +-
 hw/sd/sdhci-pci.c                   |   1 +
 hw/sd/sdhci.c                       | 172 ++++++++++++++++++----------
 11 files changed, 170 insertions(+), 100 deletions(-)

-- 
2.47.1

