Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp1089518njb;
        Wed, 12 Feb 2025 07:44:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUJYVBK6o4QskZqg0rHsrAC2DMq5DNSOuMhoE6nAIeM420MJ54O1YVml0FfrX0mcOw1EI90WAAa0zhV9Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHbMDY2ZO+22+a6kYIm6OOIZ4S09lBLKePnWc2JpfjVQYO6Jo9TCyFEzX+AJEI9gf4KJYFi
X-Received: by 2002:a05:620a:288b:b0:79f:67b:4fdc with SMTP id af79cd13be357-7c06fc4db5cmr490504585a.2.1739375094918;
        Wed, 12 Feb 2025 07:44:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739375094; cv=none;
        d=google.com; s=arc-20240605;
        b=N/dG+2PDEKt63irzo5n0OnpQhU2k3RfBbftQ1sCRUNVf0h+UdUszZwBJ6VOziFEOxw
         oSn038gQTFsZqVX5hF2jh/fTJLCLT4SitymSd0u5RwItwnzCnvD5tx46a5u2olqm7JYR
         5ghfB+XM8/fyeP04xbLK2I1QHFmWUo6AV70LNux7koeF+/L447ysERJksKJagJ23benN
         +e4kiCz7V3xat1lPKb5PhikGMq63jtDb2YcfZuCUT5dQKveI0nGhmdNCLF1CioegNgkh
         hx3dcC14c72vcCF5dunopmpwpwUxJQP2zx+9HyK0eGNDkNhPkBXYM613vnPzHSHc0s3s
         Me3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LU07FFTNrNmuJxeXtZj1sROe3UDgZjRzrIqhpiTHeSE=;
        fh=hWVdrLeg5QPgv9fXHXKjKJDN+kSzMZOX9GaAIz7EDAs=;
        b=lHDOK5zym2XlxKrWMQoMe+g+RsBYyswoEFOVObtMxcmEO0OoFRBggALuCDIYOBKYCM
         B0smhnROaj6oYl553RFnh9kW8g4J/7o+jKxT/ahc7mKshcHmLFyXapLS8bR+Ddlr9QW+
         tJthKP326i3rfkgHM8ERq3jUBqFRO6PwaQcB+bAwm3FUW7jMUbmOtCroDNwf+sDwj8lI
         xrLPuOPqQrCPjulfFCMceT6CIZ2DuJ8JyjX2fmUgzqwAEZXlY6YLdsWx33l+1sLnqxJq
         DB/hvuYXxisfkGLFi8gGqhxRNh173bKvxbE79k1A5GUP2NQNDESja2VXvOkSh/M26QHU
         vF7A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=akQTDbLx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c06976d05asi394697085a.223.2025.02.12.07.44.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 07:44:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=akQTDbLx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiEtz-0004PD-0C; Wed, 12 Feb 2025 10:43:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiEtx-0004Oo-9Z
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 10:43:49 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiEtv-0006tJ-8w
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 10:43:48 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-38f1e8efe82so821726f8f.0
 for <qemu-arm@nongnu.org>; Wed, 12 Feb 2025 07:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739375025; x=1739979825; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LU07FFTNrNmuJxeXtZj1sROe3UDgZjRzrIqhpiTHeSE=;
 b=akQTDbLxAjbKTWIfWY+SQwhZAh/ztcYL8vYyOuwDuUkHDxWXea1gpUiIvrWsG4kbGD
 +xKiU6Tzj/9o0i0wJWsLndfh0X/9htvADotYAZrw6dvqoRSMDD/+H46gw1oGXlD60aA5
 rDfOAyTpXkbbQl4712Q/dj6Pqch5aIUzuagD40v56XKQ5oMjmdO4c/Vpjc4xroLu78PN
 gOPFDmhJ8POoi731JIeNtXrkMx/ajrcOzZidZi8YnDdDliLn9zXka3WqKh7lwdaGZDJL
 LZ7CG7Z9Eg4CyZR2foLk7tjSoPZqGDKwINqsAcjAavh1lFOaby1ds1QW49XmjeXmx7g/
 pFVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739375025; x=1739979825;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LU07FFTNrNmuJxeXtZj1sROe3UDgZjRzrIqhpiTHeSE=;
 b=uDleZ20l39sARZQtWspjQD6SHPk3yPgFAsBqlHvUtEGB19+IV8pQyEOoSUGVyZI+LT
 4kQKSKVSrHQV1zaZXJ4ygABtzXmtRCEiRZZfpUxKa26oYzrGz7EgWWhEHkwk4xj2XQka
 P5eBDC/JfD82HCjPnkp107OVP67krOyUtYu5Cq98jPuSNDU2LtYYdb6Md6Ha+yuET7jb
 lHe+tocNT9MvGsIAi5hLxI1Qq0HcohRjl9QmWx0CN4uLLWTNn7mTghwjwCRwOOLPgXyj
 j8DTQkAw+MSvv74c1C1RXjUCXGhIrhfITzlel/0ZXr/MD7wLWbG9xJ6kCq0NBkb8aPzU
 tlHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhMEPUJAnCq2ytWCNm8Zsy4yAJa32QkOb52GTmoQYzzStqkPcipIDOaF32Tb8Al5vM+5TQnnxEiQ==@nongnu.org
X-Gm-Message-State: AOJu0Yzq3IhBIKk53gfekuN/i9aKmDQ92RAK2WU5uFoCg83ZBTNt/xbJ
 HBhAXkdVzhs0xA5m/LHEfuTiZtb7losF7Q/vv2FkxXcSoBdRRU8u9zZkkrJuMeA=
X-Gm-Gg: ASbGncurxRHzcwRU0No1QHWRFgna7MbS0a4Yx88CXTN7FNXXDx7BdnN8SYg0bHpiu1K
 G/DPgu1p4jI5i6LzSiKN06WPy9vis2vPj1uirGEt2b2mG3DLBQ/SP9zreadLw1xbGpPFoC2q4Kg
 WMqHCtP4soS+a1O93mQhgqIE8/sr2L1ezrbLTlm3RLYkS8g0QJQs+PF3/fj1rjP71l5DhF0Bsr5
 GkrUWBBlnC1ccTycPOXtYrsW2HiOIp+easKzmhk6OHTnBMkVwuZbxidLf7nwfbjdHxE/8P7NNVr
 IzNTeLzdId9smyiBGxNlC6LM9J83kFT3jnrnEKKlWpar5G8/7VL2wVU735W40MSTKJcK+IA=
X-Received: by 2002:a5d:6da9:0:b0:38d:d666:5457 with SMTP id
 ffacd0b85a97d-38dea2cfee0mr3483006f8f.42.1739375025566; 
 Wed, 12 Feb 2025 07:43:45 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1b824dsm22948015e9.34.2025.02.12.07.43.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Feb 2025 07:43:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Rob Herring <robh@kernel.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 2/8] hw/arm/exynos4210: Specify explicitly the GIC has 64
 external IRQs
Date: Wed, 12 Feb 2025 16:43:27 +0100
Message-ID: <20250212154333.28644-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250212154333.28644-1-philmd@linaro.org>
References: <20250212154333.28644-1-philmd@linaro.org>
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
X-TUID: 0Yzq8B7gcxxX

When not specified, Cortex-A9MP configures its GIC with 64 external
IRQs (see commit a32134aad89 "arm:make the number of GIC interrupts
configurable"). Add the GIC_EXT_IRQS definition (with a comment)
to make that explicit.

Except explicitly setting a property value to its same implicit
value, there is no logical change intended.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/exynos4210.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index b6537a2d64a..b452470598b 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -103,6 +103,8 @@
 #define EXYNOS4210_PL330_BASE1_ADDR         0x12690000
 #define EXYNOS4210_PL330_BASE2_ADDR         0x12850000
 
+#define GIC_EXT_IRQS 64 /* FIXME: verify for this SoC */
+
 enum ExtGicId {
     EXT_GIC_ID_MDMA_LCD0 = 66,
     EXT_GIC_ID_PDMA0,
@@ -588,6 +590,8 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
 
     /* Private memory region and Internal GIC */
     qdev_prop_set_uint32(DEVICE(&s->a9mpcore), "num-cpu", EXYNOS4210_NCPUS);
+    qdev_prop_set_uint32(DEVICE(&s->a9mpcore), "num-irq",
+                         GIC_EXT_IRQS + GIC_INTERNAL);
     busdev = SYS_BUS_DEVICE(&s->a9mpcore);
     sysbus_realize(busdev, &error_fatal);
     sysbus_mmio_map(busdev, 0, EXYNOS4210_SMP_PRIVATE_BASE_ADDR);
-- 
2.47.1

