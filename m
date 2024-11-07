Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3910520njc;
        Wed, 6 Nov 2024 17:23:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUoDE+e82G1H3tZ0ctPOt/qkESHic1NSoHrX7r5yrrT1D8Stdq0JGHHwA0jxAjLXDBevedmQcQh4rvqxA==@linaro.org
X-Google-Smtp-Source: AGHT+IHIalGpq+RloT/l9H4/MHQOXR3uiet6Eh7BBjvbau+Cm0zrlZTgfGvepGhE38ZTzMk7Sl/F
X-Received: by 2002:a05:6902:72f:b0:e28:e52c:9d16 with SMTP id 3f1490d57ef6-e336f6c86d1mr348484276.32.1730942639078;
        Wed, 06 Nov 2024 17:23:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730942639; cv=none;
        d=google.com; s=arc-20240605;
        b=EQPtsq93VhTw/NQBhNrM3yCQSaVSDXum9jcDItsoWExRK6bUYbLkrQATIxZf7OHUu8
         Ae9IRlVAOB8lMCy0ck+VU4ZGmts6Dhvun9Ca+yiwToAIMS6Qg2Lpmcy7Slxf5fqZXf/p
         QJ1QzSovlroKurkHv4+bC0Efwp4GqIB5fw2UHfU5Y20YdnZicA+Y9z1NTL+W1tmO7fS3
         6D8EyKxRCsheyzmlxhDLMtlLlQkPzsGqTfV6NViJdp5i81uS2NYY0elnfABBLwLLbilK
         CGZtMlg6qZ9QM1bsEiNUTN1Pw3Yf8vYzcUzuUEF9JHXgIqLtouVfAL+3GYEDvZEXUgNC
         LVyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TuPwiqIhCeXBlsbOfNhFENqptld55kTTq3KPR5HdoQA=;
        fh=QAGd90dq0RKvW//bYvhkOt1Dnq4n3n6icYpMK8NhPkA=;
        b=dxt2z8C1pC9UiAv993txXLFz1ZGeMkUfF3fyC9yi9xhE9cF8cKx+Xahed4WIMmIqnJ
         EnHYVcjtp3jQ/LeZszzBFX0Ac02TyKIQ/7BYPFlMstNLk6kew5jjaaDMuLCenLlGyjAh
         GjcztEQhyICKWErEx1k9QpGPVUo9yDF+qbO/uPVyTWvk/Dk/BRIWww8Vlxw9lcCnMrVx
         uQYf5J3TXVlQe8gjuxwj6olyxQRTuvc1qd8tuLRLNABPtRVJ6hh1gjCUHYt9w/3/HkLR
         V9MgnBwGxg7HjSXExwlZvYkp4bouR0dxB+anc+1y+44wGsyVwVIk/gJCDZhWX9bRQxn7
         EKSQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xQElYISA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ff40ebc1si2868291cf.82.2024.11.06.17.23.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Nov 2024 17:23:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xQElYISA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8rEz-0005MO-Eq; Wed, 06 Nov 2024 20:23:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8rEw-0005Fg-UV
 for qemu-arm@nongnu.org; Wed, 06 Nov 2024 20:23:14 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8rEu-00038K-2C
 for qemu-arm@nongnu.org; Wed, 06 Nov 2024 20:23:14 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43152b79d25so3874075e9.1
 for <qemu-arm@nongnu.org>; Wed, 06 Nov 2024 17:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730942590; x=1731547390; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TuPwiqIhCeXBlsbOfNhFENqptld55kTTq3KPR5HdoQA=;
 b=xQElYISAxUBpBVklCJ9WCRLxSsUBo3nwEIRa0JYNJKghA+vIdMxOKjLNy1uiEE0lG9
 hXDhvvn/+3a56SxaM9FJBt9CbQbrVpHrW6VAGsSE6hSS2J8mXZ4He/AOXOIBMy17dv+O
 tK2zaYM3iwj0JzZxEEiPpeGpL1uG8uzmbURJDIQqVCO1pYFNTo8bPIQaYzDa1BY4fBmQ
 G9aIVg5hf6hFyR4dvb8u6lZ1qwy3K0es503mkyIC3pvtCizRhxsbq7My4zsL8IQO00H7
 3+YuT9sveHVHBSh31N51FsV2FmzGiIDt8exACJ72ArI69PMHULO2xVDLfVP8Yyil/BqO
 D0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730942590; x=1731547390;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TuPwiqIhCeXBlsbOfNhFENqptld55kTTq3KPR5HdoQA=;
 b=XivgJmA+9PjmWWg36NytmB81BSOoV0yPAZ8RQz45zYdmgnak7KmUTvDIm4pUMuEzgh
 PDUVdrbhbcuKOIg3kOQosgO6072DzXZin1C/Y9xLTOHuW/dnwT5gRNmTZspO4V2oOO1Y
 K3FCOSDOCogDob7wzTpoFUYRcgaURkf6gobP+O3EUiycyun6K2iDGYtTSKpECqZHX7RV
 S61bOT3uJOPIibpl40VOEL3QAvxwl3U//dhC9jmV1h6+BnfSBj5tvO1ERSJC0AVYjNEe
 bigUWkMsAcQzZvEoJX9uV4dnrb7c7M5eJK0epQRtHtj5AvpBjaPG4QdzYm2V+ezF3Uj7
 wkXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlIGjIZGbI2nN69aym3Kp+gaxxKtjLGBkgtGuby53Z14/wqbxoQbt4gkxZeoif1bQzpJrBTNk23w==@nongnu.org
X-Gm-Message-State: AOJu0YzFtRaR2ymskp0Xcs1pprmjKxCLenMMzNDZBSeZMSO7Z2s4huDp
 X1nm5t+a8yxJW7fU4IDij2sTlo/VKbCt5rjg0GUopOvTFQkfdUwr7izWm0p9tSE=
X-Received: by 2002:a05:600c:510f:b0:42c:bd27:4c12 with SMTP id
 5b1f17b1804b1-432b14bd38emr1457565e9.10.1730942590423; 
 Wed, 06 Nov 2024 17:23:10 -0800 (PST)
Received: from localhost.localdomain ([89.101.241.141])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed97e62csm240261f8f.37.2024.11.06.17.23.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 06 Nov 2024 17:23:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Anton Johansson <anjo@rev.ng>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jason Wang <jasowang@redhat.com>, devel@lists.libvirt.org,
 qemu-ppc@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 07/16] hw/char/xilinx_uartlite: Make device endianness
 configurable
Date: Thu,  7 Nov 2024 01:22:13 +0000
Message-ID: <20241107012223.94337-8-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241107012223.94337-1-philmd@linaro.org>
References: <20241107012223.94337-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: f4akxiWfTPLg

Replace the DEVICE_NATIVE_ENDIAN MemoryRegionOps by a pair
of DEVICE_LITTLE_ENDIAN / DEVICE_BIG_ENDIAN.
Add the "little-endian" property to select the device
endianness, defaulting to little endian.
Set the proper endianness on the single machine using the
device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/xilinx_uartlite.c                | 44 ++++++++++++++++--------
 hw/microblaze/petalogix_s3adsp1800_mmu.c |  1 +
 2 files changed, 31 insertions(+), 14 deletions(-)

diff --git a/hw/char/xilinx_uartlite.c b/hw/char/xilinx_uartlite.c
index 3022b3d8ef..c43bf1a030 100644
--- a/hw/char/xilinx_uartlite.c
+++ b/hw/char/xilinx_uartlite.c
@@ -57,6 +57,7 @@
 struct XilinxUARTLite {
     SysBusDevice parent_obj;
 
+    bool little_endian_model;
     MemoryRegion mmio;
     CharBackend chr;
     qemu_irq irq;
@@ -166,21 +167,36 @@ uart_write(void *opaque, hwaddr addr,
     uart_update_irq(s);
 }
 
-static const MemoryRegionOps uart_ops = {
-    .read = uart_read,
-    .write = uart_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
-    .impl = {
-        .min_access_size = 4,
-        .max_access_size = 4,
-    },
-    .valid = {
-        .min_access_size = 1,
-        .max_access_size = 4
+static const MemoryRegionOps uart_ops[2] = {
+    {
+        .read = uart_read,
+        .write = uart_write,
+        .endianness = DEVICE_BIG_ENDIAN,
+        .impl = {
+            .min_access_size = 4,
+            .max_access_size = 4,
+        },
+        .valid = {
+            .min_access_size = 1,
+            .max_access_size = 4,
+        },
+    }, {
+        .read = uart_read,
+        .write = uart_write,
+        .endianness = DEVICE_LITTLE_ENDIAN,
+        .impl = {
+            .min_access_size = 4,
+            .max_access_size = 4,
+        },
+        .valid = {
+            .min_access_size = 1,
+            .max_access_size = 4,
+        },
     }
 };
 
 static Property xilinx_uartlite_properties[] = {
+    DEFINE_PROP_BOOL("little-endian", XilinxUARTLite, little_endian_model, true),
     DEFINE_PROP_CHR("chardev", XilinxUARTLite, chr),
     DEFINE_PROP_END_OF_LIST(),
 };
@@ -219,6 +235,9 @@ static void xilinx_uartlite_realize(DeviceState *dev, Error **errp)
 {
     XilinxUARTLite *s = XILINX_UARTLITE(dev);
 
+    memory_region_init_io(&s->mmio, OBJECT(dev),
+                          &uart_ops[s->little_endian_model],
+                          s, "xlnx.xps-uartlite", R_MAX * 4);
     qemu_chr_fe_set_handlers(&s->chr, uart_can_rx, uart_rx,
                              uart_event, NULL, s, NULL, true);
 }
@@ -228,9 +247,6 @@ static void xilinx_uartlite_init(Object *obj)
     XilinxUARTLite *s = XILINX_UARTLITE(obj);
 
     sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
-
-    memory_region_init_io(&s->mmio, obj, &uart_ops, s,
-                          "xlnx.xps-uartlite", R_MAX * 4);
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
 }
 
diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/petalogix_s3adsp1800_mmu.c
index c0136d84c3..bd8b85fa54 100644
--- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
+++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
@@ -107,6 +107,7 @@ petalogix_s3adsp1800_init(MachineState *machine)
     }
 
     dev = qdev_new(TYPE_XILINX_UARTLITE);
+    qdev_prop_set_bit(dev, "little-endian", !TARGET_BIG_ENDIAN);
     qdev_prop_set_chr(dev, "chardev", serial_hd(0));
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, UARTLITE_BASEADDR);
-- 
2.45.2

