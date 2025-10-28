Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BAB8CCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 18:14:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDoDa-0007Ax-Hl; Tue, 28 Oct 2025 14:14:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoD7-000705-PE
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 14:14:33 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoCv-0001fI-VY
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 14:14:21 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-427015003eeso5612320f8f.0
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 11:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761675245; x=1762280045; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RGm17n3GNDykAs4UeW0nI6eNRzRj+Ya0fbeg5mVxNeE=;
 b=sC9/aATb1oTLFCmiUQmN0XFGPc1CVbxzXBCP0txLTTWgZIZ/OEMXWa7o3Bu7fDGIjG
 DZab6hrXetfOhvs0f3gZXNJ+/hBxiEVZ8gFB9zT6Nhcg5MOrMEwIU7GeRVpWxyPmYNBb
 +cFsxey6xO9+MbFnHlGSy8uY4961RJmUtCkuuXJMB3JFbmG38eMqBCaN6AL83MdHIiKI
 1z0zXGImSU/20mAePbOc6BZ6V89Up26eAuIDM5LxQVjqDJc1RAbBzF2BNWIfy9lvVf4U
 h6biidzBPU23ltTzJYObge9MoVKT+ElMSwk+0ejIsTWe9ztsMd0+o6+Bp3dMyYkVlvmG
 wGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761675245; x=1762280045;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RGm17n3GNDykAs4UeW0nI6eNRzRj+Ya0fbeg5mVxNeE=;
 b=qCjqX7SB/Lo2g351b+EfFhnx6fBKfmF77Jpn3pcI/EaTqPN++JzUfAuu0pIZp/lc4z
 fOD5ZOqAra1Cvj5CXakvzTXjCuYo0b8PepCH3kN3o3ovqfvu1XiB/2nQALSySdQhEnpi
 etUX5YCClM/gh1nD15t7m1rGrusXurHpNbKGNFG6vr6lo4Tdja+5f1vsEbmPu+2ZSFmR
 gdeS+wjhwlE8bozjtpcTJvZX03ZJp+lFkpGLWSrJ+FeQ8OFsLN5+HyuoGJC+k7yKKH0U
 hpLLISF0B25PUYVPDLR5uIwO+sCTcqTi67WrZsu6I2JUCRF13pUKIGeNTQlCLBXQq7BI
 689w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVE+eTILQw0nedfdoLB6w857oZPLdJR9dNTgxhLg8M2yMMA4jczBYLkzzI85GriGYqT+TA1oFGBRw==@nongnu.org
X-Gm-Message-State: AOJu0YyYt2zJa5A34grUUAJXqc+ZnP/WuMEc4ZCKRCZcHuUXBkfhMelP
 qQcV05R6we0MRLLuQZC4jaJdvtP/k6uvwQbHB8KggOtXFYa1pWQSmauPK0iYRgfdk0w=
X-Gm-Gg: ASbGncts0uMundCAfR3xT4VvM0zQbUB3vBDUcKIXS5KZA4bRN/RSFRIbU8sM5EIzqwM
 EBrr1npZSID27Ya8LxAptbKD5wT00y+OIVcIyalIt23YlNB///iBnAPG4cPlQ/HBFpZC1AuExVF
 GHNdLuqkiFQE2i1T7PHG5J2JRS3ZIu9ocNDO0nt4+DH54+PnOBvVxRs2G4F1QP7WP0sDLc9P9Y8
 3mfS4lsEgA6+XCtSnxm1kU/5e0PmnVseTlIqlqP3aOk2zSnS4IyKosnZ6l7I/FkAHBjJK1JlWKa
 7gJMo0+/OVI7YvG+KovF8XoiLxUw6zl1xIm7OA/D/EE65ksm6OsD/JY+sxaoM0dC0sqg7b6JTnT
 lZKptO3m2oKOmd6C8ZziiSviU7ye7ls2PUyz3caHQ6U+hZrb4RXaVSLQpv2ipw/sDj9uaH4tCZy
 9Js3k8+YniDaR/FugK5WmP0tDIx8N5LY/OC6zPbN7BkrxlTuJPxQ==
X-Google-Smtp-Source: AGHT+IEn6BXLgcLqz8vdSXbRpjSkU44daKaJ2dzVUTotYkB7GlMJyzAOsTXte1or1dBi5x1pPqxwOQ==
X-Received: by 2002:a05:6000:2c05:b0:427:9e6:3a64 with SMTP id
 ffacd0b85a97d-429a7e91ea7mr4547478f8f.47.1761675245209; 
 Tue, 28 Oct 2025 11:14:05 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952db99asm22057430f8f.32.2025.10.28.11.14.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Oct 2025 11:14:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v3 01/25] hw/i386/microvm: Use proper SysBus accessors
Date: Tue, 28 Oct 2025 19:12:35 +0100
Message-ID: <20251028181300.41475-2-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028181300.41475-1-philmd@linaro.org>
References: <20251028181300.41475-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

SysBusDevice::mmio[] is private data of SysBusDevice, use
sysbus_mmio_get_region() to access it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/microvm-dt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/i386/microvm-dt.c b/hw/i386/microvm-dt.c
index cb27dfd732e..d7f49bc1b5f 100644
--- a/hw/i386/microvm-dt.c
+++ b/hw/i386/microvm-dt.c
@@ -71,7 +71,8 @@ static void dt_add_virtio(MicrovmMachineState *mms, VirtIOMMIOProxy *mmio)
         return;
     }
 
-    hwaddr base = dev->mmio[0].addr;
+    MemoryRegion *mr = sysbus_mmio_get_region(dev, 0);
+    hwaddr base = mr->addr;
     hwaddr size = 512;
     unsigned index = (base - VIRTIO_MMIO_BASE) / size;
     uint32_t irq = mms->virtio_irq_base + index;
@@ -150,7 +151,8 @@ static void dt_add_pcie(MicrovmMachineState *mms)
 
 static void dt_add_ioapic(MicrovmMachineState *mms, SysBusDevice *dev)
 {
-    hwaddr base = dev->mmio[0].addr;
+    MemoryRegion *mr = sysbus_mmio_get_region(dev, 0);
+    hwaddr base = mr->addr;
     char *nodename;
     uint32_t ph;
     int index;
-- 
2.51.0


