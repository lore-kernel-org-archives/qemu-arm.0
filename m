Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0780BD3E771
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Dec 2025 18:38:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vTP3u-00017b-7T; Wed, 10 Dec 2025 13:37:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vTP3r-000168-U6
 for qemu-arm@nongnu.org; Wed, 10 Dec 2025 13:37:15 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vTP3p-0002Sm-GZ
 for qemu-arm@nongnu.org; Wed, 10 Dec 2025 13:37:15 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-42b38de7940so22703f8f.3
 for <qemu-arm@nongnu.org>; Wed, 10 Dec 2025 10:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765391832; x=1765996632; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rmuruirWl2Hf5ekYVz4hPWVOUqfIMTyLIVh2I054+1w=;
 b=lPf1ng1m+syMAWv97M961lmlISdr0FiIEk0KTMWAzZTDmT4/2GVlGauTE+IcI8mfkf
 ttDFhpju8A8nWM0BbeqooV2RSL87OlQ640hGgDKLu4xmp5Z1NbTIHpU+SZ3uvU2bBiKI
 ZBOl+nVn+NuSw4aY+SgYg/Zpk4fPu/drEEU08AtVMerHCBDjDZaKYCOLeKuEN5iQt18C
 qp9EcE4mWaVAVMcPPhf+6P3Gj6fUr+EEqYLMZXRnxRQYsrkmrmUtJZ/9IqCndL9ICN0K
 Y4Y4nEmZdK779+8YhkYwDrg6uUYrd+hRlj7Qy76HbegQUV3/odckKa8GDi39MksDIrmY
 cj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765391832; x=1765996632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rmuruirWl2Hf5ekYVz4hPWVOUqfIMTyLIVh2I054+1w=;
 b=RGGgi7nx75ZIi552ZhMolCsis+ar6h2OumRXwcgrrgwTZk7KLWHGnmdE6Jyy99SQws
 InbmgNKwj0ZzeNZSAJweXV39YhDKwIk97vQ/i4Zftza/3o2eZLxItQYGzp4iqJ2l2B4g
 mDY1VgdjVvE7yKjfDohU39br6mNqQRoHaPUSapTnbBy03dw6gu1ENYbwlLOPhOcyUCLk
 UYu7aEFGjrkkfY/X4Fz/nPkyyBQihqB0PUOKqQCbH5O9Scqpm3FGmvSkak4/ChN6iR6B
 e/biK3sAUgv4PJbeXMJ+2JxnqjxSTZTm/XF5v5snBj9okZYyyYUGcQHf18y0h0odcZNW
 RcJA==
X-Gm-Message-State: AOJu0YxCVZTL/SR/VibN8p4yDpeZf5Nvhzry1yF5wlzkLGgH5hFM+toQ
 TO6m4iDKeGJgFanOOeoowGNGsYov1AE+tVCtsQzCPE8EjurvjVOGKOampRO5/kupxGPnZl72O4W
 5QyKE
X-Gm-Gg: AY/fxX4ZPZBv7D210auoPy3O9R+6+D38Lrz1fMw8zkmijYoKW20z9WrYVASRmbiCpMI
 /ePKTItbYFm8+x76SfNZDb/AgeXPOkQ/QJ7F3yLl6evxIEJ8cPa4yapX6sKYa/C5BV+7uW6NwHw
 qWFj12VOpXbCq5Qzindv3kppWeCkRwUBMs5r9Hu5R3+RPMKVtiowEx37Vylu0aBnA4au+nNL2co
 +pcOBN2oKk/yTDHjiMZPul7YXBokVQNZ7I2Go2FEDg+DqRs3J5GLTfQMMNLkI7svVpdR0wwKJHb
 WH8xPdH0gmrKH2gzebQlGL6I/1bk6ZA8ByeobIm1PX7W6yOu3Q4HNZUmRkQ6oiPzUJam6UfiqhU
 f9DGcWnE4iu+9ryalKdwXrM+8sgTB9Tp69QXDcfsk+Qt5Chskh7Cie+dyswmlhrizvNhmlgVFAX
 dCZPrARW0a+Ofn0MrN
X-Google-Smtp-Source: AGHT+IH1iyn5x17R9K9rC7H+NaITv97PoyAn08Em0f2NKaqGMEXqVLZSE34ATuLzYc85qXZ4UwQfig==
X-Received: by 2002:a05:6000:2509:b0:42b:3131:5433 with SMTP id
 ffacd0b85a97d-42fa3ada434mr3916195f8f.26.1765391831880; 
 Wed, 10 Dec 2025 10:37:11 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8a7044csm477702f8f.15.2025.12.10.10.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Dec 2025 10:37:11 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-11.0 7/7] hw/arm/omap1: Remove omap_badwidth_*
 implementations
Date: Wed, 10 Dec 2025 18:37:00 +0000
Message-ID: <20251210183700.3446237-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210183700.3446237-1-peter.maydell@linaro.org>
References: <20251210183700.3446237-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

Now there are no callsites for the omap_badwidth_* family
of functions we can remove their implementations.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/omap.h | 10 --------
 hw/arm/omap1.c        | 59 -------------------------------------------
 2 files changed, 69 deletions(-)

diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index bdb2e887e47..66a435a3d72 100644
--- a/include/hw/arm/omap.h
+++ b/include/hw/arm/omap.h
@@ -673,16 +673,6 @@ struct omap_mpu_state_s {
 struct omap_mpu_state_s *omap310_mpu_init(MemoryRegion *sdram,
                 const char *core);
 
-uint32_t omap_badwidth_read8(void *opaque, hwaddr addr);
-void omap_badwidth_write8(void *opaque, hwaddr addr,
-                uint32_t value);
-uint32_t omap_badwidth_read16(void *opaque, hwaddr addr);
-void omap_badwidth_write16(void *opaque, hwaddr addr,
-                uint32_t value);
-uint32_t omap_badwidth_read32(void *opaque, hwaddr addr);
-void omap_badwidth_write32(void *opaque, hwaddr addr,
-                uint32_t value);
-
 void omap_mpu_wakeup(void *opaque, int irq, int req);
 
 #define OMAP_BAD_REG(paddr)        \
diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index cfa4e1f677c..8fa4195a5fa 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -44,65 +44,6 @@
 #include "target/arm/cpu-qom.h"
 #include "trace.h"
 
-static inline void omap_log_badwidth(const char *funcname, hwaddr addr, int sz)
-{
-    qemu_log_mask(LOG_GUEST_ERROR, "%s: %d-bit register %#08" HWADDR_PRIx "\n",
-                  funcname, 8 * sz, addr);
-}
-
-/* Should signal the TCMI/GPMC */
-uint32_t omap_badwidth_read8(void *opaque, hwaddr addr)
-{
-    uint8_t ret;
-
-    omap_log_badwidth(__func__, addr, 1);
-    cpu_physical_memory_read(addr, &ret, 1);
-    return ret;
-}
-
-void omap_badwidth_write8(void *opaque, hwaddr addr,
-                uint32_t value)
-{
-    uint8_t val8 = value;
-
-    omap_log_badwidth(__func__, addr, 1);
-    cpu_physical_memory_write(addr, &val8, 1);
-}
-
-uint32_t omap_badwidth_read16(void *opaque, hwaddr addr)
-{
-    uint16_t ret;
-
-    omap_log_badwidth(__func__, addr, 2);
-    cpu_physical_memory_read(addr, &ret, 2);
-    return ret;
-}
-
-void omap_badwidth_write16(void *opaque, hwaddr addr,
-                uint32_t value)
-{
-    uint16_t val16 = value;
-
-    omap_log_badwidth(__func__, addr, 2);
-    cpu_physical_memory_write(addr, &val16, 2);
-}
-
-uint32_t omap_badwidth_read32(void *opaque, hwaddr addr)
-{
-    uint32_t ret;
-
-    omap_log_badwidth(__func__, addr, 4);
-    cpu_physical_memory_read(addr, &ret, 4);
-    return ret;
-}
-
-void omap_badwidth_write32(void *opaque, hwaddr addr,
-                uint32_t value)
-{
-    omap_log_badwidth(__func__, addr, 4);
-    cpu_physical_memory_write(addr, &value, 4);
-}
-
 /* MPU OS timers */
 struct omap_mpu_timer_s {
     MemoryRegion iomem;
-- 
2.43.0


