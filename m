Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2543130ejf;
        Tue, 27 Feb 2024 00:40:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX3bl1k4/YlJBvSWYf9BPzwbBKYMj0IwLEt4e9a4BnZM3D6spCK05vdnmj7TsxUzf6F7iJ3xg21/jpGv5Lpw0nkcxriZMin
X-Google-Smtp-Source: AGHT+IEMH+z2PBmO7+iiRJAr0eCke36WCgsVhrd1alOqunld9lu5nH+5aUs9dTDgTIxkg+sKgf3k
X-Received: by 2002:a05:620a:1187:b0:787:d667:ffba with SMTP id b7-20020a05620a118700b00787d667ffbamr1645149qkk.44.1709023248419;
        Tue, 27 Feb 2024 00:40:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709023248; cv=none;
        d=google.com; s=arc-20160816;
        b=bYwCQmHY3sjCZme5avN9Vsd6jY6ABAoROb1IN11gfrLFZcenaZb35uLUJHRmXU4dGD
         ODWvwV2zxGE3Xk894brLGUPX/2Rst5GHOQ1n55iwwl6whR4tzfNYIHcadSvf0xnZR/54
         p9ksOY8GAXIQW4HhbIz9PK7eIKtEMK7jgQqMqFy2KR02Nx7jeAh/ztyprYE9Xv5rD2Rn
         quqUHPQ5nynv6Hzlb1ZXT3Zx3MzLJ+/pzRVwzB7XY+dPAWYnecxERAS5zUVhxR8IMtuf
         wAu+Hvrskp36ZXwOnCcEpjKXWcqswazReWUVUlQq4WCe2glGqRs9cnZ3mr9828DNcpv+
         JxWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vqc0dN+90FxlJ0ZwXpMXw0U7lDa+rLwNm5jLhzGNtec=;
        fh=ht74as8ujqosUOQLcY0TU86AMxoSZrcHnU+txusKQAk=;
        b=Gy1XGhw1myD+FpFkxrv+rj1ib9HtqrUZ133uybSBnpEEvlF+juUWHGijyToRz1q3SB
         S1wfIS6j2TsN68vJ1kF3U2qzi936OmHI9FMii46dKdiUuH3JcPpgqtVsDnwQinZXarLA
         Qu2AbDzoPNky3Z8CRfIozUshQ0KCorsL2D/reu4LVAt7KR0GVpDD0zKsu9pjKSScbbpB
         X9GFIS6ZEe9z1bRqJhS6heZsMxVZNzi3nsWZHIEJjlxU9h5A/YU/2bc2/zjR+WGrOl9m
         docLpMr8pyNAqVxsGWGQSFqWg0i1jtOgGIIHITyF0QNrf2QxPWavLh4Y/4oBfnSFeaQG
         Seuw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="QU/VyRbt";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id vy11-20020a05620a490b00b00787a69de5d7si6949173qkn.651.2024.02.27.00.40.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 00:40:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="QU/VyRbt";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ret0g-00064m-SH; Tue, 27 Feb 2024 03:40:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ret0d-0005z3-Jw
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 03:40:21 -0500
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ret0a-0007dZ-Jq
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 03:40:18 -0500
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2d21a68dd3bso52926211fa.1
 for <qemu-arm@nongnu.org>; Tue, 27 Feb 2024 00:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709023215; x=1709628015; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vqc0dN+90FxlJ0ZwXpMXw0U7lDa+rLwNm5jLhzGNtec=;
 b=QU/VyRbthrO/HXExLka9fsLfP+IcnXxNLVxLfYh/aUJIF2T7Tr9QQlLGpWL/i4Nhxj
 9IipRRE0NBVH97LK4KU2oTaHxdtU3jTUK0wb7xvI+LAB2Lzf/dh0uSRzkv4WhYj4TsXG
 WuPn5OW808x2NYY78I4Aa8sDgbHJUWhrp4CYtxiftUliLhArt4u8FgmmOiTB/sVRyPci
 KiQEuYwjdoxPJMFavmKydHpaMwh02Qd+1uXhJag/1Fg9gTB/4u2B5ID9Z5r3KlYXRSWw
 xSeX5C8t9X9Hlv4RoGD++HUt3mI0N3kzmqYsn+4sUZp/mzK9PmBNvqy3SQxJtu/7lJO0
 C7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709023215; x=1709628015;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vqc0dN+90FxlJ0ZwXpMXw0U7lDa+rLwNm5jLhzGNtec=;
 b=MoyKBCVLP1ru2UxzY/SRIkbaQw3QSQ4y6dVw9Zg0UDcyeAR7Rm1ptoaLeuRDHiGzP6
 7F7B96KwshBHW2RtdhYPNEGVHP+Y7kkrt/xdFEpxpG3kwD5X09rr0InJqi4S3VVgopiN
 qS4dJWIiEGb8TZH9p7Xezu9JVqmUzRtGZm7SonuZtcAYmigD0/YRz+2H6SMxmb5PULZL
 AWYJwzwObLvQpAqKWqp4tK8jgtVlJ0gco4TrTN23rczJv/iC7mN+p3CiBIY4UtRQJAqq
 hKi9PcRqPw6JdvxSBgVdv0MKI0LItA8F2W9ZuvJRPvbUaR5zuRivROrbZHseU0hAUBaf
 v9JQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCURHAwZfLw8QLZQ1Fz4Pf9i3/A8sKjSszgjERWlZgsS8DfFYxQcrEB5dCsa7kgdKM99YcT4gu/oTC+K/L8QNLAE3h7z
X-Gm-Message-State: AOJu0Yxuc8/of7gqccex6QONqIt2YpsAoHIJlowWnDQ2UwZqTD2DYgfw
 lwO3ZzWe/AOVrgzoZB9qfCduyIxcaj8Mz048Dy0jrPz5aLo9MgruKDgrI7GGVBQ=
X-Received: by 2002:a2e:9c92:0:b0:2d2:628e:7fbf with SMTP id
 x18-20020a2e9c92000000b002d2628e7fbfmr5750458lji.36.1709023214817; 
 Tue, 27 Feb 2024 00:40:14 -0800 (PST)
Received: from m1x-phil.lan (mic92-h03-176-184-33-214.dsl.sta.abo.bbox.fr.
 [176.184.33.214]) by smtp.gmail.com with ESMTPSA id
 e13-20020a5d594d000000b0033dd53c8f15sm6479143wri.13.2024.02.27.00.40.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 27 Feb 2024 00:40:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 04/30] hw/display/exynos4210_fimd: Pass frame buffer memory
 region as link
Date: Tue, 27 Feb 2024 09:39:20 +0100
Message-ID: <20240227083948.5427-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240227083948.5427-1-philmd@linaro.org>
References: <20240227083948.5427-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: r09FZUh1paTn

Add the Exynos4210fimdState::'framebuffer-memory' property. Have
the board set it. We don't need to call sysbus_address_space()
anymore.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240226173805.289-5-philmd@linaro.org>
---
 hw/arm/exynos4210.c          |  2 ++
 hw/display/exynos4210_fimd.c | 19 ++++++++++++++++---
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index ab18836943..e3f1de2631 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -770,6 +770,8 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
 
     /*** Display controller (FIMD) ***/
     dev = qdev_new("exynos4210.fimd");
+    object_property_set_link(OBJECT(dev), "framebuffer-memory",
+                             OBJECT(system_mem), &error_fatal);
     busdev = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(busdev, &error_fatal);
     sysbus_mmio_map(busdev, 0, EXYNOS4210_FIMD0_BASE_ADDR);
diff --git a/hw/display/exynos4210_fimd.c b/hw/display/exynos4210_fimd.c
index 84687527d5..5712558e13 100644
--- a/hw/display/exynos4210_fimd.c
+++ b/hw/display/exynos4210_fimd.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/qdev-properties.h"
 #include "hw/hw.h"
 #include "hw/irq.h"
 #include "hw/sysbus.h"
@@ -32,6 +33,7 @@
 #include "qemu/bswap.h"
 #include "qemu/module.h"
 #include "qemu/log.h"
+#include "qapi/error.h"
 #include "qom/object.h"
 
 /* Debug messages configuration */
@@ -302,6 +304,7 @@ struct Exynos4210fimdState {
     MemoryRegion iomem;
     QemuConsole *console;
     qemu_irq irq[3];
+    MemoryRegion *fbmem;
 
     uint32_t vidcon[4];     /* Video main control registers 0-3 */
     uint32_t vidtcon[4];    /* Video time control registers 0-3 */
@@ -1119,7 +1122,6 @@ static void exynos4210_fimd_invalidate(void *opaque)
  * VIDOSDA, VIDOSDB, VIDWADDx and SHADOWCON registers */
 static void fimd_update_memory_section(Exynos4210fimdState *s, unsigned win)
 {
-    SysBusDevice *sbd = SYS_BUS_DEVICE(s);
     Exynos4210fimdWindow *w = &s->window[win];
     hwaddr fb_start_addr, fb_mapped_len;
 
@@ -1147,8 +1149,7 @@ static void fimd_update_memory_section(Exynos4210fimdState *s, unsigned win)
         memory_region_unref(w->mem_section.mr);
     }
 
-    w->mem_section = memory_region_find(sysbus_address_space(sbd),
-                                        fb_start_addr, w->fb_len);
+    w->mem_section = memory_region_find(s->fbmem, fb_start_addr, w->fb_len);
     assert(w->mem_section.mr);
     assert(w->mem_section.offset_within_address_space == fb_start_addr);
     DPRINT_TRACE("Window %u framebuffer changed: address=0x%08x, len=0x%x\n",
@@ -1924,6 +1925,12 @@ static const GraphicHwOps exynos4210_fimd_ops = {
     .gfx_update  = exynos4210_fimd_update,
 };
 
+static Property exynos4210_fimd_properties[] = {
+    DEFINE_PROP_LINK("framebuffer-memory", Exynos4210fimdState, fbmem,
+                     TYPE_MEMORY_REGION, MemoryRegion *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void exynos4210_fimd_init(Object *obj)
 {
     Exynos4210fimdState *s = EXYNOS4210_FIMD(obj);
@@ -1944,6 +1951,11 @@ static void exynos4210_fimd_realize(DeviceState *dev, Error **errp)
 {
     Exynos4210fimdState *s = EXYNOS4210_FIMD(dev);
 
+    if (!s->fbmem) {
+        error_setg(errp, "'framebuffer-memory' property was not set");
+        return;
+    }
+
     s->console = graphic_console_init(dev, 0, &exynos4210_fimd_ops, s);
 }
 
@@ -1954,6 +1966,7 @@ static void exynos4210_fimd_class_init(ObjectClass *klass, void *data)
     dc->vmsd = &exynos4210_fimd_vmstate;
     dc->reset = exynos4210_fimd_reset;
     dc->realize = exynos4210_fimd_realize;
+    device_class_set_props(dc, exynos4210_fimd_properties);
 }
 
 static const TypeInfo exynos4210_fimd_info = {
-- 
2.41.0

