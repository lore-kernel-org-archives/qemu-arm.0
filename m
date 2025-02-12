Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp932010njb;
        Wed, 12 Feb 2025 03:40:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWoC42ry2u6/ZSPUbouxqZ1qJ847VEd0QoHPzeEaK3SkIKGWP1WybRNiaYeFfC5VsCSrGsuEMnw7ByDDQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE/wkKO7gxMORd8fagTJbHioCG8+2FIexUUb32nQkZE4wcTW/unbBnaTzSFoLEET/iLxLZB
X-Received: by 2002:a05:6000:144f:b0:38d:a8f7:cb73 with SMTP id ffacd0b85a97d-38dea2eadb0mr2575845f8f.40.1739360455092;
        Wed, 12 Feb 2025 03:40:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739360455; cv=none;
        d=google.com; s=arc-20240605;
        b=eHhp4If6fD05hA/9mf3wedSOC+MsRAeoodgnf0YQ7zHYIkc/pPrze0/XQfWqU+qrLO
         XZFaIGN7uADB6Mp7SXs1bR0EPgsz0d5R/H61Lh8YjjsLUXSzKw9/rIG8EpTFO+CS4cLm
         3njEPvtCtxmvlOm2dXp2X2pEFyEGOXBZ3KHaECJNWUs/lGushsCbmyc//EzD/jiDXcV+
         maocz1qxXHi3BsWpu2ahFH94BG7lp4w3FyI1+homW3jY7RAGvsIhPLBRnjbr1Z9LS7OZ
         q14r6LQCbumdIj8zhrW5EDQGskIlKy0gG9JWABFbfnS0Fbj91yUM5hggaT3mcc+Op1qw
         sx2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BnA6bbjEyVqBso4cbRaO3wDSvFIUbqXqzqoiCcLIb3A=;
        fh=Cr+D3TPWCwKGX1PcRx27aQ3i0UsiyYqHa4ZxJENzY2A=;
        b=aP4OUueB8IFjL5YjYrqNG9c7EPqmScr1gUtrwgXOmyOezeXmNdGQ4xYY9iWxUhzqV6
         A6qY7DvLQgUfPXSgDUcc6T6cpX3h2yffWb3KZ6in3Dw7zBo/zHqF0UhveE4sE/AYw+Ck
         nAli/fYO7DKhhpVTXoVVk19vs9meFpADZ/RyKOt6bMS7oXf6qy1eLfyKIbfDwZaDH/b3
         e3o9DLt/hK2za1U3mDCH9Mex9SSmv/PQPxzre9H4E+/0+awjicFL6KRc4QiGs2+zQFVq
         UcZrsi+1fwwD6FBAG+dLqtWE4LqAPy7If4eHjQg9HFxG9x8hQ+vkrzhsyIgW4gtHaTtK
         5NDQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wL4Gfl70;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-38dca259ab0si7992889f8f.441.2025.02.12.03.40.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 03:40:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wL4Gfl70;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiB60-0002HH-KY; Wed, 12 Feb 2025 06:40:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiB5y-0002Gh-C3
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 06:39:58 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiB5s-0000fW-WF
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 06:39:58 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-38dc1dfd9f2so4472506f8f.3
 for <qemu-arm@nongnu.org>; Wed, 12 Feb 2025 03:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739360390; x=1739965190; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BnA6bbjEyVqBso4cbRaO3wDSvFIUbqXqzqoiCcLIb3A=;
 b=wL4Gfl70fAf0Lu9uAS0xegvzZBfCWKfFGRL7DMevXm08Hp9pupXs++yKN+Ggw3zxAP
 eXcmS/6FOQ6geLR2dMOJsI5eJvOoRJ02N4dnaKXPSOERYhXVYx1/ttcGtodApdZ4qvzk
 HfpUmke9lLVpIfJb5MG8fMuAX5dwYvJfDT+6bbICOH55KddiBJW8js4TAfpNMtj6dLKZ
 VbzNqXV2jYiKXmtK1bqQ0FErBwMACu6YPAWhNL5hlNFUNtJxkabL9wq7STo8LqXHZenx
 rgtbPfRDx/Pz9vK/pDTHkw+AZdX6BK7wpNLdYqD83okn6N4W+q14sSlnxgddIJYrnU1h
 98LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739360390; x=1739965190;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BnA6bbjEyVqBso4cbRaO3wDSvFIUbqXqzqoiCcLIb3A=;
 b=gQZy8Mngjr9OCss2i6EvadoHUmhWKHG3bfw3keQuQrD0oDe0CxjLjhe5jvUqWzodo7
 OIBik8Qjz4+jh25mwVBsyCknUirp6eU3K92DZWeXmki709jB9zPUgl2AHr/dtdm4kKnS
 aKKBhnR+PQzTFQzpaoRV7dYW5im4631oEohiAU1R0WL3t0ZJ9IDHR2GWiIXghxoqnmi1
 B6POdrNKCRK91h4+rhlNogKYPGHFEToViK1l+rjjlbUFgi6Y8V7r09r9FYpOpI7V/gq4
 tkrJaOPmcosETkUWmJhG+iy8q1fm0cYSj/+Dw/WvarWlbfhqb7l4adeI/KFlKsC1x9vv
 hVsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRGRsCzLZlOjjpHgHKQAnto1z+DB+lNhRc4v3YbUfXTc+kC+bDE/tWTdE+4ueBhmPj3drjDj6IXA==@nongnu.org
X-Gm-Message-State: AOJu0YxDIFv4JMh3z8ehf6Mh4z8cIVa2zow11886ZY9FCt4aRil/6ojS
 pN2wELnX4ZmXznow/9bP0JrEY1NP6yF9nlRc6yDprwgRxWP756e/v+hieyAo3tg=
X-Gm-Gg: ASbGnctq9o8gNuT5NpMgYtlY8r7AvodLpWF1FDlUpaMAQvN5adVJl7Ekef5Xp4JWZ+d
 y8sTDlmoupQRirS563wXb3VGFI0D9S+zKR7Sl+L1cgfNMEP/PObCJG8FyH+XWIv5LIW1+5lJU71
 aA4c98Ggou4yIwTEy3LSfWAQZEV+kV9p4lyRQTxU/76UTVm32D9d2oH3l6mpz1X9UIaALLcSPUz
 DpX7lvjodfmTSwO07wfsyvK+XlxrkPwbjCW/A2aBz6PJJgv5AuPfgnFKc+DbFZvGoeKYFbrUDYW
 hadlxSKlFVDryqZgWCNNiKs+IC7PmiIlyNc1kz55MeiNoNznXpf+3gP015wQuz43vg==
X-Received: by 2002:a5d:664f:0:b0:38d:e57e:d21 with SMTP id
 ffacd0b85a97d-38dea290b69mr1804312f8f.30.1739360390141; 
 Wed, 12 Feb 2025 03:39:50 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dd4342502sm11666896f8f.26.2025.02.12.03.39.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Feb 2025 03:39:49 -0800 (PST)
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
Subject: [PATCH 2/5] hw/mips: Mark Boston machine devices as little-endian
Date: Wed, 12 Feb 2025 12:39:35 +0100
Message-ID: <20250212113938.38692-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250212113938.38692-1-philmd@linaro.org>
References: <20250212113938.38692-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
X-TUID: OeY8Z+4QVndW

The Boston machine is only built as little-endian.
Therefore the DEVICE_NATIVE_ENDIAN definition expand to
DEVICE_LITTLE_ENDIAN (besides, the DEVICE_BIG_ENDIAN case
isn't tested). Simplify directly using DEVICE_LITTLE_ENDIAN.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/mips/boston.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 364c328032a..4690b254dda 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -220,7 +220,7 @@ static void boston_lcd_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps boston_lcd_ops = {
     .read = boston_lcd_read,
     .write = boston_lcd_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static uint64_t boston_platreg_read(void *opaque, hwaddr addr,
@@ -299,7 +299,7 @@ static void boston_platreg_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps boston_platreg_ops = {
     .read = boston_platreg_read,
     .write = boston_platreg_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void mips_boston_instance_init(Object *obj)
@@ -758,7 +758,7 @@ static void boston_mach_init(MachineState *machine)
 
     s->uart = serial_mm_init(sys_mem, boston_memmap[BOSTON_UART].base, 2,
                              get_cps_irq(&s->cps, 3), 10000000,
-                             serial_hd(0), DEVICE_NATIVE_ENDIAN);
+                             serial_hd(0), DEVICE_LITTLE_ENDIAN);
 
     lcd = g_new(MemoryRegion, 1);
     memory_region_init_io(lcd, NULL, &boston_lcd_ops, s, "boston-lcd", 0x8);
-- 
2.47.1

