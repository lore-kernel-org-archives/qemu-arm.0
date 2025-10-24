Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05196CCD1BF
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Oct 2025 19:15:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vCNFq-0007FK-JY; Fri, 24 Oct 2025 15:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNFo-0007E3-4y
 for qemu-arm@nongnu.org; Fri, 24 Oct 2025 15:15:12 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNFk-0007Ju-G7
 for qemu-arm@nongnu.org; Fri, 24 Oct 2025 15:15:11 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4710a1f9e4cso18892565e9.0
 for <qemu-arm@nongnu.org>; Fri, 24 Oct 2025 12:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761333307; x=1761938107; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mty3IBivH6Vnk+xdMuiwBkLnhhTV1D3AWcAhgKsnzI8=;
 b=O2A9iXcCJbkisWGAjWfIBmNOC1GcrXu3C3JnF9szEq/B2T8/doAyRCzDTlPTWklH5+
 3i/+9OPdCzuhxVhOkXxQnhEQLdE7lw9XAQSzi8/KiiNgO7NoiZLh48wlVduH1FZ2BlWq
 mHH9AdH8AUgwlKe1dY12CZNJJCneMZm3+SAeh84tGyIFOVsUw5yhsb6v/bzC93CrOvqU
 WyUEPD4SgOl0VbztnAJCigmM9Uu6WxVn4hvRWGYLyR6pwTZ0QS5g1SIy16ASWgNbDz/J
 lJulh9uW0zh071HifU7D5ZMOL/UFJtqMaqWlXpEH0aa7ClBe0BlD2RNlex3xSDGW8YSl
 k8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761333307; x=1761938107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mty3IBivH6Vnk+xdMuiwBkLnhhTV1D3AWcAhgKsnzI8=;
 b=CA4xb0PSWKCKJeh0l/GXuMcSg/4Og6wFwHgyV2Z9UijTDnPUEhw30cCwALMumYyXCU
 cs4vULtO7lmpgY2BJ3u/rD52gHQIKsbJJuyMu2wYqtp/AtgTqVd8OEv0oJa4pLvGHwie
 ipucaWyCkNxesCdzvrhdbRYPgQ17efi25JS3w/xkGilWbIsvKTOmHaiKqEwZTlv4nNuE
 Exgt8GL+CDAm048B09PrK6mIp+hs7zlATSpru207cjheMW70ndxitvM1Y23Hu+42EX5W
 ny9LixcS8WgukIu26YUsWQzkwhOuA1njSfq8shQRyCrYwcnlnsmlCBcNbVRtw4XXoR7P
 pSJw==
X-Gm-Message-State: AOJu0YygChpyx2pB+YFp6pY2WMWgYML9D2T+Y6fQbsDIixxTM+bEu6tO
 9EK4zfhsVGlNUTnfGfzxiZMMKjmrxrEs0uqvEE/joie9uBwUT3lCjSTET7FAnrUlVEg=
X-Gm-Gg: ASbGnctwMsLGsKslNMwwRQFIBN3r1hzJrH6li8mHcYPXW7vWCR4gZ0rUplpu8LDBW5q
 6CE9t2UOWK9E13BtmM0QdBrL/wSJoc5ZVeWr4tFhEtVo/UOUEqOeyaVG69RYP8xagO4b/LNasFY
 QDmmWoApcLobk8KixqJKHHZB35UJc+m1I7OGsIPKzR11ghEYtqWokTGhou+KU2bxgEqE5tSVUsa
 dSZro/NcnKfJ1su4tR9stML0vK94GPqcwUj16avZcAaI09sbr41pJXwmpczU2J+m+CEmozKfRZJ
 huLZ0A6kJwcc+wI4YEEj5sSGIjN/lEDphXGrVSmnjmuTxf+CrgzL4obPavBlxbG8nFYBj4Nt3HL
 UnSspkASVnTuWKAYIzUGW+h6YLfrS6wzjd+SqwTkV+g4Pa/BbQany8gfCu5LXB9D5i85m5UhKvl
 5oUItU9RxQBGEjNVE+wVCpDQIglrqOUWL+rYmz9zU4mJvMBD0FPQ==
X-Google-Smtp-Source: AGHT+IHJPulElC4lE3QAPYJe+DLg06Uu2ObsGTptGP/SwFf6wsdthQIWa17PhJOf2v9TAr2kywqJKw==
X-Received: by 2002:a05:600c:35c3:b0:471:5bf:cd02 with SMTP id
 5b1f17b1804b1-475d2e83b91mr31895795e9.11.1761333306698; 
 Fri, 24 Oct 2025 12:15:06 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475caf2ef9fsm105040325e9.13.2025.10.24.12.15.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Oct 2025 12:15:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH 07/27] hw/sysbus: Add sysbus_has_pio() and
 sysbus_pio_get_address()
Date: Fri, 24 Oct 2025 21:03:54 +0200
Message-ID: <20251024190416.8803-8-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024190416.8803-1-philmd@linaro.org>
References: <20251024190416.8803-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Similarly to sysbus_has_mmio() and sysbus_mmio_get_region(),
add sysbus_has_pio() and sysbus_pio_get_address() for PIO.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/sysbus.h |  2 ++
 hw/core/sysbus.c    | 11 +++++++++++
 2 files changed, 13 insertions(+)

diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
index 69eb62e29c8..07a307b5ca0 100644
--- a/include/hw/sysbus.h
+++ b/include/hw/sysbus.h
@@ -71,6 +71,7 @@ typedef void FindSysbusDeviceFunc(SysBusDevice *sbdev, void *opaque);
 
 void sysbus_init_mmio(SysBusDevice *dev, MemoryRegion *memory);
 MemoryRegion *sysbus_mmio_get_region(const SysBusDevice *dev, int n);
+uint32_t sysbus_pio_get_address(const SysBusDevice *dev, int n);
 void sysbus_init_irq(SysBusDevice *dev, qemu_irq *p);
 void sysbus_pass_irq(SysBusDevice *dev, SysBusDevice *target);
 void sysbus_init_ioports(SysBusDevice *dev, uint32_t ioport, uint32_t size);
@@ -78,6 +79,7 @@ void sysbus_init_ioports(SysBusDevice *dev, uint32_t ioport, uint32_t size);
 
 bool sysbus_has_irq(const SysBusDevice *dev, int n);
 bool sysbus_has_mmio(const SysBusDevice *dev, unsigned int n);
+bool sysbus_has_pio(const SysBusDevice *dev, unsigned int n);
 void sysbus_connect_irq(SysBusDevice *dev, int n, qemu_irq irq);
 bool sysbus_is_irq_connected(const SysBusDevice *dev, int n);
 qemu_irq sysbus_get_connected_irq(const SysBusDevice *dev, int n);
diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index d33be6b2b52..1dbc345a3ef 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -206,6 +206,17 @@ void sysbus_init_ioports(SysBusDevice *dev, uint32_t ioport, uint32_t size)
     }
 }
 
+bool sysbus_has_pio(const SysBusDevice *dev, unsigned int n)
+{
+    return (n < dev->num_pio);
+}
+
+uint32_t sysbus_pio_get_address(const SysBusDevice *dev, int n)
+{
+    assert(n >= 0 && n < QDEV_MAX_PIO);
+    return dev->pio[n];
+}
+
 /* The purpose of preserving this empty realize function
  * is to prevent the parent_realize field of some subclasses
  * from being set to NULL to break the normal init/realize
-- 
2.51.0


