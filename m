Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp8032685njk;
        Mon, 30 Dec 2024 11:04:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXghiIuJsKgtXt1TW4TZkolBQ0eoUNaKMZroItpPZmanuTw1JCma4a411dUhV7fyRGSXA0KQZdGgoG4rg==@linaro.org
X-Google-Smtp-Source: AGHT+IHRrv68tiUpJOiBbqGiLXtO7flEFBy6elsPG7e5trKlMrktbxGw36oHN09r/Fc2yfsos1X4
X-Received: by 2002:a05:620a:4807:b0:7b6:d611:ce82 with SMTP id af79cd13be357-7b9ba83580dmr5542236485a.59.1735585455981;
        Mon, 30 Dec 2024 11:04:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735585455; cv=none;
        d=google.com; s=arc-20240605;
        b=XBVHH7nNYKb1tTjko28R9rL5FR+9nDu5s/aoxsmiejkwYTvmP7R6+MbjhPjeC962u4
         KR0kgZqrks5+zTNvsnXBVIAuopKNX2wDnBYu2sdCZ/gnZE28I5Sy6Rkh4/kl2aQdmrbd
         Abnw5YU370+blx5QX/D6+zrgiKM+FkED/XoV+yBZTy9uG3G9hpfMMwKTq1qBTEiWK7az
         eJsPXF1oSqaqDtZbEwevkVRJvNlsymhVNdxRsFz4Mzil1pvx5HSuBGcmD51qjKOC8iH+
         GZ9PeEnbADUqLoa5JIg90YrKTjWVPakbxLDvmQDjxvcTcJR3zErlUMq7Wd36kwi1yCNh
         A8Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=tqX4ZDqJeVvjB3AauIbeUtUX20e9/xznDP4YjX8B+/k=;
        fh=XhEWBvPiSiI6QKbYfeot/rIUshCd4b93t6HiWBrqsFE=;
        b=fcoOdSs6NWh24lLXGJIYzdj9i66lZRCr2WivIGu1CFnYXVwKEq0gog9+EQA7IIQW3f
         Avg/jxZY+l5ISyLMFXOGcquE6FfxERWXRr79+x3d7HpP1940X4wiyRM3AYHSRi07sHTy
         p5n6X2rRZzXIVoL/O9yugY9mAw5ku/n+belXFi/DKozZT2HDSgQJfKUzhDjnfU6rU7rc
         ikmjhRM8T9105+J/bAtVQVd55hZx3Bi9viAtRH3g/9ofouUkieMSweDNsC6mRuCTTheI
         F8B8yte7gDy6cotjxSkDaNxHGTFqou9h7ezwW1GxNpnfCjIbit+cHerc9T4c+isXIMZq
         8sBw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=liWcT7jC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b9ac4dc0ccsi2794391085a.458.2024.12.30.11.04.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Dec 2024 11:04:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=liWcT7jC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tSL3L-0004Il-HY; Mon, 30 Dec 2024 14:03:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tSL3G-0004DC-L4
 for qemu-arm@nongnu.org; Mon, 30 Dec 2024 14:03:43 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tSL3C-0007qy-IJ
 for qemu-arm@nongnu.org; Mon, 30 Dec 2024 14:03:42 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4368a293339so54204505e9.3
 for <qemu-arm@nongnu.org>; Mon, 30 Dec 2024 11:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735585411; x=1736190211; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tqX4ZDqJeVvjB3AauIbeUtUX20e9/xznDP4YjX8B+/k=;
 b=liWcT7jCJ/WaXY5s5NWQ2cNCkz6N1V9TgHKFW6zgFtGQeq9EpWklBVSq1Ft45UgfvS
 LVmm4jfjj1b0FGcBLZtkHtKRt+9Bwp12uOzm3diHxrzqRyOhzeXvxOJucZGbu7+8uvjh
 22N7Y0EJ8wfWW+6BewAQT6mSzntti0Wt8fnebQSYEfnIo41hLslemSRBS2zyvyjznRDz
 BwLvvfXn9i11FKPj6OQifKULPQ3EupO3BdN7X1osDY8U3QNYyPPTRxe5GS8x0EfkBRNf
 ZUuRZRBIgn77fDlTHRP2pG36cUUEe+R403LBixXtykrxi27yFEEfniz2WiRf3N3lQCMz
 MTHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735585411; x=1736190211;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tqX4ZDqJeVvjB3AauIbeUtUX20e9/xznDP4YjX8B+/k=;
 b=NobYV0KH90e43r3/JgWW8hMx4KrC92IYJjKySaT8Y5Vk41AxQwBIFoA9DyWrGLFK2k
 Ducux8kmp0Otf5s0SF5AVTa8e7rSmPScy4c0wUWhGSaM+Z7CNS5WEOWhgBlf5P9WZW3U
 WM09pLYyh3KT/DDnTvU9Mcn/ooBJzNuhJed0DrrQFiAZV6UIPDE4V2flPIMN13lyA4sP
 7QRrchywCUgmlIy63B//o6o2pmEm5/g/qaB7b1WuGt2bbG1AnaQtoBWrSSylYIxC2UTY
 G+SurleG9Iy163d0S5LVdrv6cxj76Fy4v6TjHROkTV/5xmJNE3OBm99aktU1B8EI4uHO
 QFag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPiATcL9RrFaE3lBtQfKEnOOeGhy5KpaSfxRvHXxPwnC7k6WXNPM+tMKVxeofaATafAUlaAgDrNg==@nongnu.org
X-Gm-Message-State: AOJu0YxdcAntDWzYzBIsWjIeR5ghM+IRXG66qLvA3+tnOQ//9BbZbfNK
 AxMu2/WJBTVbYg/QJStYzNd/ucDr0n+TUqzaDjpu+5Q6fCV5c3z9Or1mXqmJ7MI=
X-Gm-Gg: ASbGncs4tOBrbxJ3Rsk7yuZelFkboQu9MR7hoRgyYfVjhIR8yJHJLGsi6UoFUGUI+/c
 aNJrDYxvrDg2P3HuCSAvgFCXiJ7P2wY/AWEiMg9t2JBt4jJzrz++AWgLHxa1r6M3SHvpzr6+Eis
 oIutluHJzxa5qxL0LIDqqWO3RWGXbRR3rjN3IU+n/GzgghEEmGetg8Tx7jedP+c9xzGe20NSy/y
 KMO0oVAXJkGSvrZgMh2TPJyb8vhy8qzpcpapxTo94dzWTZzRRrNJkGoXzez6Xt2Uk9Mt0lce3N+
 qG1lSggLR8PJIUtMPZeywOPc
X-Received: by 2002:a05:600c:1388:b0:434:a7e3:db5c with SMTP id
 5b1f17b1804b1-436686440abmr300241725e9.11.1735585410746; 
 Mon, 30 Dec 2024 11:03:30 -0800 (PST)
Received: from [192.168.69.132] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436611ea42esm369813825e9.9.2024.12.30.11.03.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Dec 2024 11:03:29 -0800 (PST)
Message-ID: <4f6553bb-43e2-4db2-8c9f-cccbb9c817eb@linaro.org>
Date: Mon, 30 Dec 2024 20:03:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 00/14] macOS PV Graphics and new vmapple machine type
To: Phil Dennis-Jordan <phil@philjordan.eu>
Cc: qemu-devel@nongnu.org, agraf@csgraf.de, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 stefanha@redhat.com, mst@redhat.com, slp@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 shorne@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bmeng.cn@gmail.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, akihiko.odaki@daynix.com,
 qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 balaton@eik.bme.hu
References: <20241223221645.29911-1-phil@philjordan.eu>
 <8554330d-fd9b-4fa5-b37c-161f70b71f7d@linaro.org>
 <CAAibmn3PGD5oN9nAeUaqYkAxsH1CWhAQrkqGEaFUd7Ohr-uRfg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAAibmn3PGD5oN9nAeUaqYkAxsH1CWhAQrkqGEaFUd7Ohr-uRfg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: pOa0ZJ400Mat

On 27/12/24 13:19, Phil Dennis-Jordan wrote:
> 
> 
> On Mon, 23 Dec 2024 at 23:58, Philippe Mathieu-Daudé <philmd@linaro.org 
> <mailto:philmd@linaro.org>> wrote:


>      > Alexander Graf (8):
>      >    hw: Add vmapple subdir
>      >    hw/misc/pvpanic: Add MMIO interface
>      >    gpex: Allow more than 4 legacy IRQs
>      >    hw/vmapple/aes: Introduce aes engine
>      >    hw/vmapple/bdif: Introduce vmapple backdoor interface
>      >    hw/vmapple/cfg: Introduce vmapple cfg region
>      >    hw/vmapple/virtio-blk: Add support for apple virtio-blk
>      >    hw/vmapple/vmapple: Add vmapple machine type
>      >
>      > Phil Dennis-Jordan (6):
>      >    ui & main loop: Redesign of system-specific main thread event
>     handling
>      >    hw/display/apple-gfx: Introduce ParavirtualizedGraphics.Framework
>      >      support
>      >    hw/display/apple-gfx: Adds PCI implementation
>      >    hw/display/apple-gfx: Adds configurable mode list
>      >    MAINTAINERS: Add myself as maintainer for apple-gfx, reviewer
>     for HVF
>      >    hw/block/virtio-blk: Replaces request free function with g_free
> 
>     If there are no objection or further comments, I'm taking this
>     series and will post a PR after xmas & testing.
> 
> 
> Thanks Phil, much appreciated! Enjoy your time off.
> 
> I've just posted an updated -v3 of my xhci patch series as v2 suffered 
> from the same breakage as this patch set. I recommend applying that one 
> on top for testing vmapple. It helps when you can use keyboard and mouse 
> properly and don't need to mess around with VNC.

I'm first taking patches 1-5 & 8 [*] squashing mostly style fixups,
TypeInfo rebase and header reduction ("qemu/osdep.h" is only for .c):

-- >8 --
diff --git a/hw/display/apple-gfx.h b/hw/display/apple-gfx.h
index a1160bf6619..3900cdbabbb 100644
--- a/hw/display/apple-gfx.h
+++ b/hw/display/apple-gfx.h
@@ -8,17 +8,14 @@
  #ifndef QEMU_APPLE_GFX_H
  #define QEMU_APPLE_GFX_H

-#define TYPE_APPLE_GFX_MMIO         "apple-gfx-mmio"
-#define TYPE_APPLE_GFX_PCI          "apple-gfx-pci"
-
-#include "qemu/osdep.h"
-#include <dispatch/dispatch.h>
-#import <ParavirtualizedGraphics/ParavirtualizedGraphics.h>
-#include "qemu/typedefs.h"
+#include "qemu/queue.h"
  #include "exec/memory.h"
  #include "hw/qdev-properties.h"
  #include "ui/surface.h"

+#define TYPE_APPLE_GFX_MMIO         "apple-gfx-mmio"
+#define TYPE_APPLE_GFX_PCI          "apple-gfx-pci"
+
  @class PGDeviceDescriptor;
  @protocol PGDevice;
  @protocol PGDisplay;
@@ -71,7 +68,7 @@ void *apple_gfx_host_ptr_for_gpa_range(uint64_t 
guest_physical,
                                         uint64_t length, bool read_only,
                                         MemoryRegion **mapping_in_region);

-extern const PropertyInfo qdev_prop_display_mode;
+extern const PropertyInfo qdev_prop_apple_gfx_display_mode;

  #endif

diff --git a/hw/display/apple-gfx-mmio.m b/hw/display/apple-gfx-mmio.m
index 60580a373d8..b2e0e7a30fa 100644
--- a/hw/display/apple-gfx-mmio.m
+++ b/hw/display/apple-gfx-mmio.m
@@ -3,9 +3,6 @@
   *
   * Copyright © 2023 Amazon.com, Inc. or its affiliates. All Rights 
Reserved.
   *
- * This work is licensed under the terms of the GNU GPL, version 2 or 
later.
- * See the COPYING file in the top-level directory.
- *
   * SPDX-License-Identifier: GPL-2.0-or-later
   *
   * ParavirtualizedGraphics.framework is a set of libraries that macOS 
provides
@@ -16,13 +13,14 @@
   */

  #include "qemu/osdep.h"
-#import <ParavirtualizedGraphics/ParavirtualizedGraphics.h>
-#include "apple-gfx.h"
-#include "monitor/monitor.h"
+#include "qemu/log.h"
+#include "block/aio-wait.h"
  #include "hw/sysbus.h"
  #include "hw/irq.h"
+#include "apple-gfx.h"
  #include "trace.h"
-#include "qemu/log.h"
+
+#import <ParavirtualizedGraphics/ParavirtualizedGraphics.h>

  OBJECT_DECLARE_SIMPLE_TYPE(AppleGFXMMIOState, APPLE_GFX_MMIO)

@@ -32,10 +30,9 @@
   * their definitions here so that we can also work with the ARM version.
   */
  typedef bool(^IOSFCRaiseInterrupt)(uint32_t vector);
-typedef bool(^IOSFCUnmapMemory)(
-    void *, void *, void *, void *, void *, void *);
-typedef bool(^IOSFCMapMemory)(
-    uint64_t phys, uint64_t len, bool ro, void **va, void *, void *);
+typedef bool(^IOSFCUnmapMemory)(void *, void *, void *, void *, void *, 
void *);
+typedef bool(^IOSFCMapMemory)(uint64_t phys, uint64_t len, bool ro, 
void **va,
+                              void *, void *);

  @interface PGDeviceDescriptor (IOSurfaceMapper)
  @property (readwrite, nonatomic) bool usingIOSurfaceMapper;
@@ -168,8 +165,8 @@ static bool apple_gfx_mmio_unmap_surface_memory(void 
*ptr)
      RCU_READ_LOCK_GUARD();
      region = memory_region_from_host(ptr, &offset);
      if (!region) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: memory at %p to be unmapped 
not "
-                      "found.\n",
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: memory at %p to be unmapped not found.\n",
                        __func__, ptr);
          return false;
      }
@@ -261,7 +258,7 @@ static void apple_gfx_mmio_reset(Object *obj, 
ResetType type)
  static const Property apple_gfx_mmio_properties[] = {
      DEFINE_PROP_ARRAY("display-modes", AppleGFXMMIOState,
                        common.num_display_modes, common.display_modes,
-                      qdev_prop_display_mode, AppleGFXDisplayMode),
+                      qdev_prop_apple_gfx_display_mode, 
AppleGFXDisplayMode),
  };

  static void apple_gfx_mmio_class_init(ObjectClass *klass, void *data)
@@ -276,7 +273,7 @@ static void apple_gfx_mmio_class_init(ObjectClass 
*klass, void *data)
      device_class_set_props(dc, apple_gfx_mmio_properties);
  }

-static TypeInfo apple_gfx_mmio_types[] = {
+static const TypeInfo apple_gfx_mmio_types[] = {
      {
          .name          = TYPE_APPLE_GFX_MMIO,
          .parent        = TYPE_SYS_BUS_DEVICE,
diff --git a/hw/display/apple-gfx-pci.m b/hw/display/apple-gfx-pci.m
index 4cfc01fc725..b939bb9b233 100644
--- a/hw/display/apple-gfx-pci.m
+++ b/hw/display/apple-gfx-pci.m
@@ -12,11 +12,12 @@
   * aimed primarily at x86-64 macOS VMs.
   */

-#include "apple-gfx.h"
+#include "qemu/osdep.h"
  #include "hw/pci/pci_device.h"
  #include "hw/pci/msi.h"
-#include "qapi/error.h"
+#include "apple-gfx.h"
  #include "trace.h"
+
  #import <ParavirtualizedGraphics/ParavirtualizedGraphics.h>

  OBJECT_DECLARE_SIMPLE_TYPE(AppleGFXPCIState, APPLE_GFX_PCI)
@@ -27,7 +28,7 @@
      AppleGFXState common;
  };

-static const char* apple_gfx_pci_option_rom_path = NULL;
+static const char *apple_gfx_pci_option_rom_path = NULL;

  static void apple_gfx_init_option_rom_path(void)
  {
@@ -117,7 +118,7 @@ static void apple_gfx_pci_reset(Object *obj, 
ResetType type)
  static const Property apple_gfx_pci_properties[] = {
      DEFINE_PROP_ARRAY("display-modes", AppleGFXPCIState,
                        common.num_display_modes, common.display_modes,
-                      qdev_prop_display_mode, AppleGFXDisplayMode),
+                      qdev_prop_apple_gfx_display_mode, 
AppleGFXDisplayMode),
  };

  static void apple_gfx_pci_class_init(ObjectClass *klass, void *data)
@@ -139,7 +140,7 @@ static void apple_gfx_pci_class_init(ObjectClass 
*klass, void *data)
      device_class_set_props(dc, apple_gfx_pci_properties);
  }

-static TypeInfo apple_gfx_pci_types[] = {
+static const TypeInfo apple_gfx_pci_types[] = {
      {
          .name          = TYPE_APPLE_GFX_PCI,
          .parent        = TYPE_PCI_DEVICE,
diff --git a/hw/display/apple-gfx.m b/hw/display/apple-gfx.m
index b00c72fc4dd..aa1455b6295 100644
--- a/hw/display/apple-gfx.m
+++ b/hw/display/apple-gfx.m
@@ -3,9 +3,6 @@
   *
   * Copyright © 2023 Amazon.com, Inc. or its affiliates. All Rights 
Reserved.
   *
- * This work is licensed under the terms of the GNU GPL, version 2 or 
later.
- * See the COPYING file in the top-level directory.
- *
   * SPDX-License-Identifier: GPL-2.0-or-later
   *
   * ParavirtualizedGraphics.framework is a set of libraries that macOS 
provides
@@ -15,21 +12,24 @@
   */

  #include "qemu/osdep.h"
-#import <ParavirtualizedGraphics/ParavirtualizedGraphics.h>
-#include <mach/mach_vm.h>
-#include "apple-gfx.h"
-#include "trace.h"
-#include "qemu-main.h"
-#include "exec/address-spaces.h"
-#include "migration/blocker.h"
-#include "monitor/monitor.h"
-#include "qemu/main-loop.h"
+#include "qemu/lockable.h"
  #include "qemu/cutils.h"
  #include "qemu/log.h"
  #include "qapi/visitor.h"
  #include "qapi/error.h"
+#include "block/aio-wait.h"
+#include "exec/address-spaces.h"
  #include "system/dma.h"
+#include "migration/blocker.h"
  #include "ui/console.h"
+#include "apple-gfx.h"
+#include "trace.h"
+
+#include <mach/mach.h>
+#include <mach/mach_vm.h>
+#include <dispatch/dispatch.h>
+
+#import <ParavirtualizedGraphics/ParavirtualizedGraphics.h>

  static const AppleGFXDisplayMode apple_gfx_default_modes[] = {
      { 1920, 1080, 60 },
@@ -419,7 +419,7 @@ static void set_cursor_glyph(void *opaque)
          s->cursor = NULL;
      }

-    if (bpp == 32) { /* Shouldn't be anything else, but just to be 
safe...*/
+    if (bpp == 32) { /* Shouldn't be anything else, but just to be 
safe... */
          s->cursor = cursor_alloc(width, height);
          s->cursor->hot_x = job->hotspot.x;
          s->cursor->hot_y = job->hotspot.y;
@@ -467,7 +467,7 @@ static void apple_gfx_do_read_memory(void *opaque)

      r = dma_memory_read(&address_space_memory, job->physical_address,
                          job->dst, job->length, MEMTXATTRS_UNSPECIFIED);
-    job->success = r == MEMTX_OK;
+    job->success = (r == MEMTX_OK);

      qemu_sem_post(&job->sem);
  }
@@ -694,12 +694,11 @@ static void new_frame_handler_bh(void *opaque)
  static NSArray<PGDisplayMode *> *apple_gfx_create_display_mode_array(
      const AppleGFXDisplayMode display_modes[], uint32_t 
display_mode_count)
  {
-    uint32_t i;
      PGDisplayMode *mode_obj;
      NSMutableArray<PGDisplayMode *> *mode_array =
          [[NSMutableArray alloc] initWithCapacity:display_mode_count];

-    for (i = 0; i < display_mode_count; i++) {
+    for (unsigned i = 0; i < display_mode_count; i++) {
          const AppleGFXDisplayMode *mode = &display_modes[i];
          trace_apple_gfx_display_mode(i, mode->width_px, mode->height_px);
          PGDisplayCoord_t mode_size = { mode->width_px, mode->height_px };
@@ -836,8 +835,8 @@ static void apple_gfx_set_display_mode(Object *obj, 
Visitor *v,

      ret = qemu_strtoi(endptr, &endptr, 10, &val);
      if (ret || val > UINT16_MAX || val <= 0) {
-        error_setg(errp, "width in '%s' must be a decimal integer number "
-                   "of pixels in the range 1..65535", name);
+        error_setg(errp, "width in '%s' must be a decimal integer number"
+                         " of pixels in the range 1..65535", name);
          return;
      }
      mode->width_px = val;
@@ -847,8 +846,8 @@ static void apple_gfx_set_display_mode(Object *obj, 
Visitor *v,

      ret = qemu_strtoi(endptr + 1, &endptr, 10, &val);
      if (ret || val > UINT16_MAX || val <= 0) {
-        error_setg(errp, "height in '%s' must be a decimal integer number "
-                   "of pixels in the range 1..65535", name);
+        error_setg(errp, "height in '%s' must be a decimal integer number"
+                         " of pixels in the range 1..65535", name);
          return;
      }
      mode->height_px = val;
@@ -859,18 +858,18 @@ static void apple_gfx_set_display_mode(Object 
*obj, Visitor *v,
      ret = qemu_strtoi(endptr + 1, &endptr, 10, &val);
      if (ret || val > UINT16_MAX || val <= 0) {
          error_setg(errp, "refresh rate in '%s'"
-                   " must be a positive decimal integer (Hertz)", name);
+                         " must be a positive decimal integer (Hertz)", 
name);
          return;
      }
      mode->refresh_rate_hz = val;
      return;

  separator_error:
-    error_setg(errp, "Each display mode takes the format "
-               "'<width>x<height>@<rate>'");
+    error_setg(errp,
+               "Each display mode takes the format 
'<width>x<height>@<rate>'");
  }

-const PropertyInfo qdev_prop_display_mode = {
+const PropertyInfo qdev_prop_apple_gfx_display_mode = {
      .name  = "display_mode",
      .description =
          "Display mode in pixels and Hertz, as 
<width>x<height>@<refresh-rate> "
---

Regards,

Phil.

[*] I'll share the rebased branch later.
