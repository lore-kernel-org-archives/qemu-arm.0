Received: by 2002:a17:505:42a7:b0:1be9:327d:8ee3 with SMTP id rt7csp3034070njb;
        Tue, 24 Sep 2024 12:20:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUeOMhLUXgTNY/3yJX1jV13S/55rKqzJ2/63IQX+RgfAv7d1l7NzO6GfFQMu/Z/zVGeDkDwoun95dK8vg==@linaro.org
X-Google-Smtp-Source: AGHT+IFKrEWIwxV0DrraESrFhBWCPKI0H38fQdGt7FMAEo0NYJfraiAExcPJomzPSNzPBbrypq3O
X-Received: by 2002:a05:6102:ccd:b0:49e:928f:7976 with SMTP id ada2fe7eead31-4a15dc997c6mr807859137.12.1727205609564;
        Tue, 24 Sep 2024 12:20:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727205609; cv=none;
        d=google.com; s=arc-20240605;
        b=UsQjUt0YG2m9zs1Blc9Jr+4E/74xPCsI7n6E3KX3NDBDTot+hR6PRTDmulBD/HCInN
         0m9Mast8quJWDrgvVmjql1LIJM9zqwbzF4X/C9xdYyqO2pCNfFJsIwsCsjDScLE9oQhR
         FMnleKqR2rdWagp2fAMUKm7QfeuU7L3Ckir4PDIh7LlHLD5UAv6RsfyeMmQyzDJA6jL1
         UO93gwfj3B026eZnY88TZHiR+7+ANe7VtvRsepxAN3zqALf/8C6r4IDBwbMpQ86Gt0AR
         dJI1gUddy+yzufediyZf/mHY30P14y1elXVJCRaJ8bBvjV2bDT38GW55UCFeK2/BRblj
         v7cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=hC7RUQh5iJG+tj/FBPCCf6KG23a/jAttxBOMoGR0rKk=;
        fh=uGu748YfoQIXvdPSvfeQwNuYW9BHIK+6sVMr/sevgac=;
        b=jE6MEVhDyqB74OZDI55Tno34nxN1je12qJKjFhtT5c1ZppCnv933kkgVrG/H+bX2j5
         ox7WLXiBrZ8BWj+0Eh/OxVlSNmg928XwH1GBi+OSZJ0x6b17IyskC2Ih0cR9soMO7FrF
         deSOSZh4kAxx3zwQllb9XeFSh0CMZWthbtjLeJaN49BRN6W58os3PE90WBzjnkZh5igi
         YlLY2HB+rzC/wrlZpUFzZBoM+iMjwZYCjQwD80xWCuRqjF/9uXNAp26aI28oMQNjDxEt
         ZHgYYPq/p+mAAyfmarIC0z/Qg5bWNFQnhKjSzz5DE1K9EcR/T3InGT7pg/hRT/qQNatT
         6Rag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WapE7C94;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cb0f4c2576si23357556d6.29.2024.09.24.12.20.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Sep 2024 12:20:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WapE7C94;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1stB4a-0006ZQ-NW; Tue, 24 Sep 2024 15:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1stB4Y-0006TX-H0
 for qemu-arm@nongnu.org; Tue, 24 Sep 2024 15:19:42 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1stB4W-00054F-Hw
 for qemu-arm@nongnu.org; Tue, 24 Sep 2024 15:19:42 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42ca4e0299eso48920055e9.2
 for <qemu-arm@nongnu.org>; Tue, 24 Sep 2024 12:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727205578; x=1727810378; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hC7RUQh5iJG+tj/FBPCCf6KG23a/jAttxBOMoGR0rKk=;
 b=WapE7C94XMBgUm7YgN+lqFsR2UkSW8oE0wYJrzIEmxhZJDc/1Yh/b/OxURNwPrxmO/
 abfr3kde9Nf/pLHo4N2Qq76Nxv42F6y6lZVonufkpCdXKnhNrH+mVFmsB6zzMtvJFsov
 Xpmv0at91qv4PPlna/PMipbOu+AyCL+qp7rGBYsA4ND9qdUdSm4jDYwc/EuLiGisfJDR
 WqKev6sqpazBiDDy2OljPjhJH1SwedUTQbrJgjFpmJNz3n/f/mcfiUqGgRIHmv6FLugZ
 fukJG4d3/8ILND/zVmog5Fs9K34Fvwag5OYfv1Ht6xriDi3RbRiTqzfOGvxWnw+XxW+A
 hZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727205578; x=1727810378;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hC7RUQh5iJG+tj/FBPCCf6KG23a/jAttxBOMoGR0rKk=;
 b=mz2Fy5LsHToyTzEc8jMcfitBRzqnyZhfqalZZaIm0Vm6OASLoUUiazZVWoUqRKxXDx
 AslHToE6d4sX1KhgGSk1rNpYHGsYa5L9h1ulo2xM/9UCj2N2OCpp/m/JfiCwbZ7obk2p
 RVvy3Wf2081HRIU9b3ntSThHx1HTlvBG6JrryTm1KeGIHvfuUfCZBFioGpFoAiwspnNv
 H48fh8e97+DW9Ld0YtWEV/ANk/l2xKw65mcBKgrAsV+owVAZmJ4uGx0VZCpq7MurX5Jh
 KsKDvSUAhcv2oZbz1vl2HuJAF9feuBk0ONivHc438eHNnEl8su1f8XJCB48Kw+RWxuFP
 nYtA==
X-Gm-Message-State: AOJu0YzanZLzsVTKjfa8kj6CcTvWPQbbaW+5GU6MK22inPRXNN4RqvYm
 v1TRqYuVeq6JJtHlEVIhk6iIdiwPLLZlokAyDffiRPPMgH2EqOh8E7LSxsOPy04=
X-Received: by 2002:a05:600c:3d05:b0:42c:de2f:da27 with SMTP id
 5b1f17b1804b1-42e9610381bmr1107585e9.2.1727205577664; 
 Tue, 24 Sep 2024 12:19:37 -0700 (PDT)
Received: from localhost.localdomain (208.15.23.93.rev.sfr.net. [93.23.15.208])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e7543b9a4sm166337075e9.12.2024.09.24.12.19.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 Sep 2024 12:19:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Tony Nguyen <tony.nguyen@bt.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH] hw/arm/armv7m: Expose and access System Control Space as
 little endian
Date: Tue, 24 Sep 2024 21:19:32 +0200
Message-ID: <20240924191932.49386-1-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: N6dvw82mikcw

Per the Armv7-M Architecture Reference Manual (ARM DDI 0403E):

  The System Control Space (SCS, address range 0xE000E000 to
  0xE000EFFF) is a memory-mapped 4KB address space that provides
  32-bit registers for configuration, status reporting and control.
  All accesses to the SCS are little endian.

Expose the region as a little-endian one and force dispatched
accesses to also be in little endianness.

Fixes: d5d680cacc ("memory: Access MemoryRegion with endianness")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/armv7m.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 7c68525a9e..4a01b970e6 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -140,7 +140,7 @@ static MemTxResult v7m_sysreg_ns_write(void *opaque, hwaddr addr,
         /* S accesses to the alias act like NS accesses to the real region */
         attrs.secure = 0;
         return memory_region_dispatch_write(mr, addr, value,
-                                            size_memop(size) | MO_TE, attrs);
+                                            size_memop(size) | MO_LE, attrs);
     } else {
         /* NS attrs are RAZ/WI for privileged, and BusFault for user */
         if (attrs.user) {
@@ -160,7 +160,7 @@ static MemTxResult v7m_sysreg_ns_read(void *opaque, hwaddr addr,
         /* S accesses to the alias act like NS accesses to the real region */
         attrs.secure = 0;
         return memory_region_dispatch_read(mr, addr, data,
-                                           size_memop(size) | MO_TE, attrs);
+                                           size_memop(size) | MO_LE, attrs);
     } else {
         /* NS attrs are RAZ/WI for privileged, and BusFault for user */
         if (attrs.user) {
@@ -174,7 +174,7 @@ static MemTxResult v7m_sysreg_ns_read(void *opaque, hwaddr addr,
 static const MemoryRegionOps v7m_sysreg_ns_ops = {
     .read_with_attrs = v7m_sysreg_ns_read,
     .write_with_attrs = v7m_sysreg_ns_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static MemTxResult v7m_systick_write(void *opaque, hwaddr addr,
@@ -187,7 +187,7 @@ static MemTxResult v7m_systick_write(void *opaque, hwaddr addr,
     /* Direct the access to the correct systick */
     mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]), 0);
     return memory_region_dispatch_write(mr, addr, value,
-                                        size_memop(size) | MO_TE, attrs);
+                                        size_memop(size) | MO_LE, attrs);
 }
 
 static MemTxResult v7m_systick_read(void *opaque, hwaddr addr,
@@ -199,14 +199,14 @@ static MemTxResult v7m_systick_read(void *opaque, hwaddr addr,
 
     /* Direct the access to the correct systick */
     mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]), 0);
-    return memory_region_dispatch_read(mr, addr, data, size_memop(size) | MO_TE,
-                                       attrs);
+    return memory_region_dispatch_read(mr, addr, data,
+                                       size_memop(size) | MO_LE, attrs);
 }
 
 static const MemoryRegionOps v7m_systick_ops = {
     .read_with_attrs = v7m_systick_read,
     .write_with_attrs = v7m_systick_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 /*
-- 
2.45.2

