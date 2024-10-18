Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp845368njb;
        Fri, 18 Oct 2024 07:13:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW78Elf05tB/3zgaTamnx980O9mtaUcYiRSbbB7Id+/FO86Z6qN9YWykIcMzdIbCU83idvTrxMFi+FY0Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFf4ZCZFAOVutdnICjyGP+KkZDtV5PV6dIAZZn7jdr5Xv8jwAiRGQ4JKxwkmDrPSZiLjUoz
X-Received: by 2002:a05:6808:22a3:b0:3e6:252:eba8 with SMTP id 5614622812f47-3e602c5a9b8mr1652370b6e.9.1729260837042;
        Fri, 18 Oct 2024 07:13:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729260837; cv=none;
        d=google.com; s=arc-20240605;
        b=QNU+nDQ7bF0IYCWvMh2p4gI9HeyqUnT4Xud4z9fT7jqC0tD5+SDb7846Aoj2Fyaosx
         uby8AC5bi4wrxUIBYxQWV8MmrpylluDBXuFv029EsVHWFi9s0iAvLo5kxL0sdzITKG3S
         Nrt3EQBG8ZRUm2NoiOcwQ342YmaPKxOEP3gejqtgRjBu1kR8qBTqBdyFQKX8tcuDCw+T
         uqVH6I+WZbOKdupgKTTftR3XuHkbQhyOPDJfy282AFBRa+R/U+1NyEGdtlniAofAk/C+
         EvSEKCO9UHb7g04TYsqXyIgeUMdM/DSvv3B/76AivL33+3GuGaST21DKpk5hfmiVqRXy
         FtjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gAX28yWcBXDRA8GUHaWHj1wjFTUDruopzlW85DJp/k8=;
        fh=JROX7yrvKMYU9BbmMyfGDG7C+H2YgCvn4aRmWAEICOc=;
        b=hgJwwdlr/dHMgQLMn9BJextNgE7t4rld9ExtC3XLyl1e8yHJtweChb+lr+CI/HiJxA
         DRgsED24koVaktR5bv8V9/NdCO9Df42+dQZlKxfdTAe0dAfucabPD/DQYQIu5He0qr4i
         pxuLufNneWhZwNXvOMUkCsKH4Gm9XN/cE+dXACu4wTrSr5dr9aSpe+w0IHJ0TjgUQBjF
         6zRwG7PNaL4vR5cYtzhk0aA45vsQjlY9L/jczlwgQVbPfbbZHac2TNiXG9QgoLUlORhM
         Bxjptb37vR2v+T8Nr4plYlpokKbr/cNYcJmYPa3LY7tBxBcwWPzdULQj3y8w7XrH2yzS
         /RLQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BZEFjEsb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4a5d64392besi312126137.492.2024.10.18.07.13.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2024 07:13:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BZEFjEsb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t1njZ-0000x9-Pe; Fri, 18 Oct 2024 10:13:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t1njY-0000wB-G7
 for qemu-arm@nongnu.org; Fri, 18 Oct 2024 10:13:40 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t1njW-0006xY-N3
 for qemu-arm@nongnu.org; Fri, 18 Oct 2024 10:13:40 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4314c452180so22244775e9.0
 for <qemu-arm@nongnu.org>; Fri, 18 Oct 2024 07:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729260817; x=1729865617; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gAX28yWcBXDRA8GUHaWHj1wjFTUDruopzlW85DJp/k8=;
 b=BZEFjEsbM2VXR8Q+/P9ORzeTjPA7VqUjzG9iZdoH6nIhe0loS7fZNuSXfnzB3DYSZs
 IpqrFYDLTFhOlf3VcA2acM+ZdF8RWhohhaNp1tUR3qz201f1yUovfDLJgFIZ/UJ2kkff
 Jbkz19p5H/9UYf+XQSUxI/hFdi0g+I2uCsY5iQkSEj0dgxSaTdKSA48eAqGYlXBva+17
 nokWkuYoggIt9PEKNolERCvsquj+lP/8Yh5BwTo/w9q11SwIjaQErq5uRaW1YsZJgfIT
 fJMIkGg2E68lzCl0rsj1XBipGeYpCH6zKtwWC/TXaALEfTuHmyAcWBXFa/jEuAVT5Eel
 tB4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729260817; x=1729865617;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gAX28yWcBXDRA8GUHaWHj1wjFTUDruopzlW85DJp/k8=;
 b=CP7SdRMVx8QQ8KUJ2o5o+Pw1ar8SdlB7mJ4UHaKa6UEAauK4hFMJXpJlUSIfmDd63k
 cq98z6VSghJkQeiIKttI5/IIxhQMNuruiQQqFoKfvcwsVUvyQcwdD6bHzAwi+EEFwsRF
 qfXEEQV/HnY2phVVWckVLtwvN9hWviUIoxho920fRGujx1MEi6VSMzOlRzlY7uuljPEL
 BElO/wU7ic6suh1Rbn5Smh0lw9fpubryCJjziFnHJHR+qTFiUNvcH03jDJ5zWNgdVYtu
 ylbjyXMukSlULye2vNKaE+8cBb+ssNCp/NeYZlAL8dP7f6GW8r93Qwb18mQ7+QDqRZFL
 oGtg==
X-Gm-Message-State: AOJu0Yx8zGxLG/eIU7EWckNoZWasKiEJQVJwhUkTZwABTQu4ejGM9lZu
 akJqNeRUOHvmtOMQ350FeFJ/HaUAUWSVDCoaKsP0M/97sI4aH4HKoIaX+nwEAWQA45LWZPzTVI+
 O
X-Received: by 2002:a05:600c:4ecc:b0:431:416e:2603 with SMTP id
 5b1f17b1804b1-431586fc9b3mr47060115e9.3.1729260817068; 
 Fri, 18 Oct 2024 07:13:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ecf0ecd89sm2040086f8f.78.2024.10.18.07.13.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 07:13:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH 4/7] docs/system/arm: Add placeholder doc for exynos4 boards
Date: Fri, 18 Oct 2024 15:13:29 +0100
Message-Id: <20241018141332.942844-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241018141332.942844-1-peter.maydell@linaro.org>
References: <20241018141332.942844-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: h8QMNpxFBJWF

Add a placeholder doc for the exynos4 boards nuri and smdkc210.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 MAINTAINERS                | 1 +
 docs/system/arm/exynos.rst | 9 +++++++++
 docs/system/target-arm.rst | 1 +
 3 files changed, 11 insertions(+)
 create mode 100644 docs/system/arm/exynos.rst

diff --git a/MAINTAINERS b/MAINTAINERS
index dff8073c5bc..031b117a3a0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -716,6 +716,7 @@ L: qemu-arm@nongnu.org
 S: Odd Fixes
 F: hw/*/exynos*
 F: include/hw/*/exynos*
+F: docs/system/arm/exynos.rst
 
 Calxeda Highbank
 M: Rob Herring <robh@kernel.org>
diff --git a/docs/system/arm/exynos.rst b/docs/system/arm/exynos.rst
new file mode 100644
index 00000000000..86894bc02b7
--- /dev/null
+++ b/docs/system/arm/exynos.rst
@@ -0,0 +1,9 @@
+Exynos4 boards (``nuri``, ``smdkc210``)
+=======================================
+
+These are machines which use the Samsung Exynos4210 SoC, which has Cortex-A9 CPUs.
+
+``nuri`` models the Samsung NURI board.
+
+``smdkc210`` models the Samsung SMDKC210 board.
+
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index 9c01e66ffa9..a7f88c8f317 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -90,6 +90,7 @@ undocumented; you can get a complete list by running
    arm/digic
    arm/cubieboard
    arm/emcraft-sf2
+   arm/exynos
    arm/fby35
    arm/musicpal
    arm/kzm
-- 
2.34.1

