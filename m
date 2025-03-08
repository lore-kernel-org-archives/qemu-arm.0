Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp252929njc;
        Sat, 8 Mar 2025 11:05:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVh3oaC3gCYrbIWch0yt69mO5tRqMKQul/9r1dgRuYVp1gpUmJJcMzaCbejZHPYXpqYsjYP0d2I4z4oUg==@linaro.org
X-Google-Smtp-Source: AGHT+IE57CUWZJXkEQN7C4w+6pbwDOaJObZnYDR+4Jr9XbIRH6aXE9QiNVSye9Dg3MgCMJTrbhKP
X-Received: by 2002:a05:620a:6017:b0:7c3:c0dc:b5fa with SMTP id af79cd13be357-7c53c871145mr672457285a.14.1741460726684;
        Sat, 08 Mar 2025 11:05:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741460726; cv=none;
        d=google.com; s=arc-20240605;
        b=EeukivoMBDbgsDbMNOmEVHUOUyPnfO/8aL3GEcv3TJ1vm787yow39GruVQ0ON1M7Fb
         0WP/Cnf4hKljnazXRA1dIBiC7mNkPlRp5+7NT3uvSXFvMMDy21LJBbcYDUgC9XuAMLI7
         p+bG4XKcxKVcnhrAXZ+cpPvw7Dr6xvcPHln2LRjDGX7Axcbp179pNtW2ulHJzNGH5B+9
         x9gg+f3ehDiP4TVcN/xuUqm4Z5aYAhdMhFsduM50svsGN5LsIiCbeLyVREy9+zM+QxTy
         D/NIQInxWq7Lg7kWRuNvTnky/ULWjh1n30kR/QYtex5gpPDPGPRJ4yHZuVgWx4Mxxld5
         T8bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=EY3LDQvhSY1UJUDBZWJ0oLgNLpHwNcu9pDPeUp1WnOo=;
        fh=XBAPtKgrAxs9e9hKaLPDaj3WzuiL71ugCzRhaljrWlE=;
        b=DqStTQNeoi+xUzHd4EZZB48mA2fmmWKK5b8PLKyC4a27i7oHupClSVmYTeIJmKomJ+
         uOfZKpdnLdKD3zbjXn2UmvEpiUe6slaAbDEdeLoSz7xt1Rs1Tf/MGQzlmTTOv/Eajkzl
         Q1/OKg8wVpXagyGnZrMGVw5zCfp4v2HLBX4Sg5CM7exHB1Kl23QNhane6I0/RLqQj7rb
         wgDyhtS2svLoh0I3+bV3uwoc4ZdgyS7yVOF95Jx1vUk+PlOtu1hTydPSJ3lWFzH3AGIQ
         WG1do5/EvvAzuodwEIrCkmi7aQoAWRRTQAlnwG3QjGA4ckusYp8PCJQe/qiQFdeTZm6H
         /fBA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oeSFy2Fd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3e535998dsi586870485a.140.2025.03.08.11.05.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Mar 2025 11:05:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oeSFy2Fd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tqzSL-0007bo-6T; Sat, 08 Mar 2025 14:03:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tqzS7-0007Ex-8S
 for qemu-arm@nongnu.org; Sat, 08 Mar 2025 14:03:15 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tqzS4-0003c8-PG
 for qemu-arm@nongnu.org; Sat, 08 Mar 2025 14:03:14 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-39129fc51f8so2499905f8f.0
 for <qemu-arm@nongnu.org>; Sat, 08 Mar 2025 11:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741460591; x=1742065391; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EY3LDQvhSY1UJUDBZWJ0oLgNLpHwNcu9pDPeUp1WnOo=;
 b=oeSFy2Fd+bD3R37B8XWknkiECzVgqFAyhtqwpw0+c0hdMb5HSVUxbE12GJ8Am23UET
 AIame9iC9BnK0fPwiNE6i84nY+hiQ2LUXJdwQYUBGyhQbrqiJ7WWKJ8lN4Riws4l0cNe
 UCYWmeDOjrEVhBtaUp2MkHLiDgRLtJXLTIW1Y5ZvEx8DojVxaHkXpd+kSDSUqfOI3hx5
 30o7j6uIx8fYkWAw4bIzW79aRk4vhMxA+el/9/PSd0UFMow0zYogIUq8RvUycxtl/w+Y
 zdbGmeJHIZdM+ePyy2mgZFVcPQwN8yKYLk7tJQS0vHjY4iAC+jjTfbIoWb6Am+kVkBz+
 885Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741460591; x=1742065391;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EY3LDQvhSY1UJUDBZWJ0oLgNLpHwNcu9pDPeUp1WnOo=;
 b=O7Zbbx4ANYRD6eqwaERUmX6UTj+4qTiNLsnoWATQYP0/e9PRg85PQNA6xrWzWw66/S
 JNO29eY/OEbtR5xhU+/gVlF4rhTcTf5eGYBeaqPReqF0l5mhrLD7v9nlT9LSHOEAMJC6
 CNXYG9J8I9m+qVduSAEXxveaxYFZHSoqVjeHBFSfmIDvJP2erzbKP/+8HqrK457Qc4Cq
 SeQ0BkE297CF5r31WDYX0zt8fA8xjRu/o/8LZxatSrgUuPVXYmWDfDcAPdIUkIkuAMwG
 iJiTsuDLU51ZTsIX33nb/3AApUxhY8aGh4IlazvNAAbQNI4hDaLBJ6n/hS2gYnAb2XnH
 p7YQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1px6tLbQDja9nS/5OVCfdBsqwcBE7L/FrjlY7Brg008smZL/r7yw3Dg8CCQkZFtvgk77O0tH3Ug==@nongnu.org
X-Gm-Message-State: AOJu0YxvYmVVQTTPvr3mCxL/WNz+o/ilEcfIUcgkOzfGwsqosjvBNGds
 GvmoByh4y4s9CB747KB4E1L/iLGJ7W0dwhdB0t/i/loZ9yIrGOTBYLRKPWE5/RA=
X-Gm-Gg: ASbGnctkqIv2Qqq/J2utijhCnUuphzVABqydnzR3kFmkDDzjX1mjrHudzkOCAxOGNBD
 4zuDMW6JfyEoxPAQCk9x22nJTgtJdv8Sot9Z9MkfVM5r0dmSZXp7Mzye5ni30nIbSLCap1l5V9K
 BG0xkuZXA5hBNc47WP9wlSTTz8HSLW87b6pzEWKYCTHJP/O95X38A7XEgrHFLvdeSjgu6d+BISz
 wchLQDwqxFoUKScB+1PNTQZw6Z4UawIfC9zw/LVHG3GOXd0l96/IFTufNdWJvz7jYjP2lBtHdLQ
 cUdZGESPV4wV2a6yd8pNeYojhton9URiFVEDq7+eFwpJrKhzCdcp0zeymbgvfSLTyRUxeM8ZFhn
 lcYYrbBrzgZj2hhoBWkQ=
X-Received: by 2002:a05:6000:4109:b0:390:f4c7:ea20 with SMTP id
 ffacd0b85a97d-39132d6b7f1mr3969482f8f.24.1741460591053; 
 Sat, 08 Mar 2025 11:03:11 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd426c56esm127609315e9.8.2025.03.08.11.03.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 08 Mar 2025 11:03:10 -0800 (PST)
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
Subject: [PATCH v3 08/12] hw/sd/sdhci: Unify default MemoryRegionOps
Date: Sat,  8 Mar 2025 20:02:26 +0100
Message-ID: <20250308190230.7508-9-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250308190230.7508-1-philmd@linaro.org>
References: <20250308190230.7508-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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
X-TUID: xxSK7OPOL6TI

Note, sdhci_mmio_le_ops[] was missing .impl.access_size = 4.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/sdhci.c | 41 ++++++++++++++++-------------------------
 1 file changed, 16 insertions(+), 25 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index d115e88c4b9..15e6976220f 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1372,30 +1372,22 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
                        value >> shift, value >> shift);
 }
 
-static const MemoryRegionOps sdhci_mmio_le_ops = {
-    .read = sdhci_read,
-    .write = sdhci_write,
-    .valid = {
-        .min_access_size = 1,
-        .max_access_size = 4,
-        .unaligned = false
+static const MemoryRegionOps sdhci_mmio_ops[2] = {
+    [0 ... 1] = {
+        .read = sdhci_read,
+        .write = sdhci_write,
+        .impl = {
+            .min_access_size = 4,
+            .max_access_size = 4,
+        },
+        .valid = {
+            .min_access_size = 1,
+            .max_access_size = 4,
+            .unaligned = false
+        },
     },
-    .endianness = DEVICE_LITTLE_ENDIAN,
-};
-
-static const MemoryRegionOps sdhci_mmio_be_ops = {
-    .read = sdhci_read,
-    .write = sdhci_write,
-    .impl = {
-        .min_access_size = 4,
-        .max_access_size = 4,
-    },
-    .valid = {
-        .min_access_size = 1,
-        .max_access_size = 4,
-        .unaligned = false
-    },
-    .endianness = DEVICE_BIG_ENDIAN,
+    [0].endianness = DEVICE_LITTLE_ENDIAN,
+    [1].endianness = DEVICE_BIG_ENDIAN,
 };
 
 static void sdhci_init_readonly_registers(SDHCIState *s, Error **errp)
@@ -1443,8 +1435,7 @@ void sdhci_common_realize(SDHCIState *s, Error **errp)
     ERRP_GUARD();
     SDHCIClass *sc = SYSBUS_SDHCI_GET_CLASS(s);
 
-    s->io_ops = sc->io_ops ?: (s->endianness == DEVICE_BIG_ENDIAN ?
-                               &sdhci_mmio_be_ops : &sdhci_mmio_le_ops);
+    s->io_ops = sc->io_ops ?: &sdhci_mmio_ops[s->endianness == DEVICE_BIG_ENDIAN];
     if (s->io_ops->endianness != s->endianness) {
         error_setg(errp, "Invalid endianness for SD controller");
         return;
-- 
2.47.1

