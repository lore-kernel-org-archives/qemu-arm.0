Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp5600136njk;
        Thu, 26 Dec 2024 00:23:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWvH41XIR+KOX/gslf9NQOISyMxm9HMKOgABGZQhwjULGGt0oskzxd52HStN79WC6zgjN+eTOActH+YzQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF4OQt5iANSaNghgQeWccsmvwQIrXcPFPo0SV/umfraeFTWDKc/hZJmCr1BzacTUjSnF/Qk
X-Received: by 2002:a05:620a:1a85:b0:7b6:753b:9b5d with SMTP id af79cd13be357-7b9ba7cc903mr3300710385a.36.1735201399763;
        Thu, 26 Dec 2024 00:23:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735201399; cv=none;
        d=google.com; s=arc-20240605;
        b=XpRJh9x46f/dHtzn0PQXq+tnH2jQUU9mBgNOdn8adAnAAsrxhgN4a3sMQX1002qCKR
         Gkxc9mPtlYcI9ww0qCwtkoFoH8hiKRiByE18V/fLlVQE8yZwR6qTBpdg2nu4Z4TUzSc1
         9e5hVY3EhX3pxK2Q7MEDM0EBca3i1DC+QwVwsbB6hCAqTsduxLxZ/943k1fXrAWOud/y
         vpulqHepwl+2AqFJ04HXmIGqFNUjbhjS6zIlC0COeOCliEHjqYsEi1G/UTXMoWlPxfPH
         MF4DZUuh9fojSV0IWlCUHlHonIKavf18fvxD4oTXMCMp0ClR/nFditcYpvtzwU7hoDFH
         xHGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=F8RiAlCHl+1NqI9Hasi2td6dnDjrsz5BjuPhZ1v7pKk=;
        fh=luqczq21R/WVyFsAXY3xjiSk+tbt+bB+3AXcxVMujQk=;
        b=C0axdjERQ0wwbEiMzEKkN0FCV2CcU/N8V8Hg49sJ3uT31hjc33vYNWCt8igI00ya9L
         4zWtI9yoMh0SUGVlUSN2Nt9UT4p+v6GDG1QU6CpA++A1aDy/c9Mqd6cn9J36UP9DgR9G
         JFICCTOPT2gfFNel9U0XABYbznPpVT9OZc60mO58TknP5M/PY51/W0u2EmB1K9TDVra5
         0ndj1pMTIVpUrCxS0lA73384We8TO6D1RVsqUhf7nLaGJimVMPGeiE0B7XpKmvy3zCJS
         4OkvHB9tS7IoCOi5/3zyKJRQzJ9t6Fojtt209g0NxT3OnLGKF5I3R0GiKZFGRJEmk1fj
         yNUw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="ok/qIcwF";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b9ac47a303si1787887585a.286.2024.12.26.00.23.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Dec 2024 00:23:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="ok/qIcwF";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tQj91-0007E2-Ql; Thu, 26 Dec 2024 03:22:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3XBJtZwgKCHcrpcVjoncbjjbgZ.XjhlZhp-Vmhijibip.jmb@flex--wuhaotsh.bounces.google.com>)
 id 1tQj90-0007DR-QO
 for qemu-arm@nongnu.org; Thu, 26 Dec 2024 03:22:58 -0500
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3XBJtZwgKCHcrpcVjoncbjjbgZ.XjhlZhp-Vmhijibip.jmb@flex--wuhaotsh.bounces.google.com>)
 id 1tQj8y-0000VG-Aa
 for qemu-arm@nongnu.org; Thu, 26 Dec 2024 03:22:58 -0500
Received: by mail-pl1-x64a.google.com with SMTP id
 d9443c01a7336-2163a2a1ec2so131343095ad.1
 for <qemu-arm@nongnu.org>; Thu, 26 Dec 2024 00:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1735201373; x=1735806173; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=F8RiAlCHl+1NqI9Hasi2td6dnDjrsz5BjuPhZ1v7pKk=;
 b=ok/qIcwFhWSbgCVsl5FOjkAQqwIvEFePYkj/+ccpRgbIRUI4keCsWTwXaKwnzpQp88
 AECzYVsb8kV5HG28G9Zkg0f7h8h93Pvta25zqHXXVuPE3Hh5eeLnrb+8cYOz84IdyP3E
 O6DNhSQtSefc3OfaOTm8jYcitYrhk3n9+Bxv/FWA1NFqILAQ6RbiJFsMZ+iuaINXQO5Y
 Mk66lE7RAHl1YgZFRtWp6HRy1CWzCLW5UwtOLXA67DDOIFc9+UQIBfEdLYlM1ylWa9e0
 Hah9hAY2yv7J0IFw8rjMhcTz/DH6FF+Z/MZD3q+RdvOGnSHuJVvBjPpavpXOLwZJ0hCv
 +soA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735201373; x=1735806173;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F8RiAlCHl+1NqI9Hasi2td6dnDjrsz5BjuPhZ1v7pKk=;
 b=xM4YqZAKjaYq+B4KzoF8V/Qe53+v9gey6NRceWXjGFjs8kV2e64Y7D32viMmq3747i
 V9jLcAI1/QaFuFz7TTS1vS4bI4Oojt4BB+NeD4ggmXa4TTIBnM2XiKeUZnPxLcs2KzqO
 dbd8TOy0M+pywcE/OPjObr61J6uQHBPFbQLtGOBuxT4WB4ZMflU/LDyf98SFAeesZTT7
 ocpYuEHlbfn46d/nVOFN7d3F95zbqN84/MaQxgitbDy7dP6m6HIfd/4mb4+EaeT+mu9n
 JS1NQ1CIIkP3DOS1PiTc0FgNYL6C+bpG/9hPtaXjI2uYUqLL3aUkfi1iHfSF/fQJ4h6X
 W1rg==
X-Gm-Message-State: AOJu0YxfW/7RJu4/NLMaRg/P7zqOkCM8+HLcKwCpbkWtUHj4L9IQIOv9
 xwXVqaevwjoSNGIQNX2YPNQpzLp8ohIpiLkWDCm4MXmUPPBUFSwcsA3N4B35llgWQhZeL7Enhoa
 6JJ6G5Me3ZA==
X-Received: from pgbcq8.prod.google.com ([2002:a05:6a02:4088:b0:801:9268:c344])
 (user=wuhaotsh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f682:b0:216:6f1e:5799 with SMTP id
 d9443c01a7336-219e6f14829mr246488525ad.35.1735201372788; 
 Thu, 26 Dec 2024 00:22:52 -0800 (PST)
Date: Thu, 26 Dec 2024 08:22:20 +0000
In-Reply-To: <20241226082236.2884287-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20241226082236.2884287-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241226082236.2884287-2-wuhaotsh@google.com>
Subject: [PATCH 01/17] docs/system/arm: Add Description for NPCM8XX SoC
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, titusr@google.com, mimik-dev@google.com, 
 hskinnemoen@google.com, venture@google.com, pbonzini@redhat.com, 
 jasowang@redhat.com, alistair@alistair23.me, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3XBJtZwgKCHcrpcVjoncbjjbgZ.XjhlZhp-Vmhijibip.jmb@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x64a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: XsiQfEpe+WJG

NPCM8XX SoC is the successor of the NPCM7XX. It features quad-core
Cortex-A35 (Armv8, 64-bit) CPUs and some additional peripherals.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 docs/system/arm/nuvoton.rst | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index 05059378e5..0a1916fb99 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -1,12 +1,13 @@
 Nuvoton iBMC boards (``kudo-bmc``, ``mori-bmc``, ``npcm750-evb``, ``quanta-gbs-bmc``, ``quanta-gsj``)
 =====================================================================================================
 
-The `Nuvoton iBMC`_ chips (NPCM7xx) are a family of ARM-based SoCs that are
+The `Nuvoton iBMC`_ chips are a family of ARM-based SoCs that are
 designed to be used as Baseboard Management Controllers (BMCs) in various
-servers. They all feature one or two ARM Cortex-A9 CPU cores, as well as an
-assortment of peripherals targeted for either Enterprise or Data Center /
-Hyperscale applications. The former is a superset of the latter, so NPCM750 has
-all the peripherals of NPCM730 and more.
+servers. Currently there are two families: NPCM7XX series and
+NPCM8XX series. NPCM7XX series feature one or two ARM Cortex-A9 CPU cores,
+while NPCM8XX feature 4 ARM Cortex-A35 CPU cores. Both series contain a
+different assortment of peripherals targeted for either Enterprise or Data
+Center / Hyperscale applications.
 
 .. _Nuvoton iBMC: https://www.nuvoton.com/products/cloud-computing/ibmc/
 
@@ -27,6 +28,8 @@ There are also two more SoCs, NPCM710 and NPCM705, which are single-core
 variants of NPCM750 and NPCM730, respectively. These are currently not
 supported by QEMU.
 
+The NPCM8xx SoC is the successor of the NPCM7xx SoC.
+
 Supported devices
 -----------------
 
@@ -62,6 +65,8 @@ Missing devices
    * System Wake-up Control (SWC)
    * Shared memory (SHM)
    * eSPI slave interface
+   * Block-tranfer interface (8XX only)
+   * Virtual UART (8XX only)
 
  * Ethernet controller (GMAC)
  * USB device (USBD)
@@ -76,6 +81,11 @@ Missing devices
  * Video capture
  * Encoding compression engine
  * Security features
+ * I3C buses (8XX only)
+ * Temperator sensor interface (8XX only)
+ * Virtual UART (8XX only)
+ * Flash monitor (8XX only)
+ * JTAG master (8XX only)
 
 Boot options
 ------------
-- 
2.47.1.613.gc27f4b7a9f-goog

