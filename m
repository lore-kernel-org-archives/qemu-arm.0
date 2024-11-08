Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp5010969njc;
        Fri, 8 Nov 2024 07:48:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWvwNExXh7x1m3aSK+UBz5IH/LcRkOhimzFM2PJLgfF5xoIn5keXawTIK7GdKmvelbNczG/StvAbVr12A==@linaro.org
X-Google-Smtp-Source: AGHT+IE/WtEweqzBlYCCNfLoJ8ndrBFK5NY73UP4cb1TeubV5vMX2AM4M528gGDovMWOsKoNl7UT
X-Received: by 2002:a05:6214:53c7:b0:6cb:ef36:5fbe with SMTP id 6a1803df08f44-6d39e4d246fmr57573676d6.3.1731080920861;
        Fri, 08 Nov 2024 07:48:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731080920; cv=none;
        d=google.com; s=arc-20240605;
        b=gq7x8jmWmz26GWPx0UkqifNJFzUVlfaemCm87UsisO7ms7G9Y41/qna77sWt5QZAa4
         MoTU1Mycst8YPUYT6XtYKYaUNr3ZYNYCn8EL6BxZjAZyLt5NtrK7QdK9Ke4vHLjv6x4L
         h+UpEhk7ZNcRRHSpvH6eSU1KJGhvSwkP/nW3tCsldIIh+UUNdYmbENJ694kZYKUroMno
         Y1gxkoiOXkY5xk7l7xZ+lGoEGk0wxMufxVHPAtQ7tm5x6Elg5d9n5tI3lC/+C0K8rjJb
         iSOiVf8UTSVKYWMWsjYH5gjpl7mgJiSUJFDpaymFqYGQI7tW1+Sfi4woVtb00qicYoXx
         KsMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eC842Nuh9R0vJWP6nw94dy+XXPWkmXcFTwUalIOdql8=;
        fh=uVZzof9kTBLUp8erA9Y9y/lgM0IaUri0pc8EcU7fJ3I=;
        b=hwKmofx5hXF2sb8bFN4ynOKw1NzM+QIOm53Uc8xPQFa7/JgAzfcZJgvSbLxeLlNLVa
         q7U1QxmnOYjMmtvjMZJVMvOgAybdpsCRgs1MV4VYrvS0qhqg4aJKmpQlfsemkNxeQ1h0
         wf3UGD0+rpn2xFw17YDTEKXBecnKJXe0H6bOrT3Kyt8DBoCEC20v4itaykJTYx4G9ETw
         sAwwxaz5+S2aX1P/ksdoov6f5QgQjwquJW6KV4cRMI1Cg1rUBkje25bvvEypQCX1mF2n
         NUEgRpqPCgHeypGR8//PtXe4dxYEWKhPKZepYbT95bQxM75uYsokYk/vy0tUeKzMORfS
         YS1w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="u/qYz+0b";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d396665ddbsi48147416d6.332.2024.11.08.07.48.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Nov 2024 07:48:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="u/qYz+0b";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t9R9I-00034A-KP; Fri, 08 Nov 2024 10:43:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t9R90-0002jc-W2
 for qemu-arm@nongnu.org; Fri, 08 Nov 2024 10:43:31 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t9R8w-0005Os-NA
 for qemu-arm@nongnu.org; Fri, 08 Nov 2024 10:43:29 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4315e62afe0so21216385e9.1
 for <qemu-arm@nongnu.org>; Fri, 08 Nov 2024 07:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731080605; x=1731685405; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eC842Nuh9R0vJWP6nw94dy+XXPWkmXcFTwUalIOdql8=;
 b=u/qYz+0b70/OpBOeLNZVtF5uu97AxZBPFbM0NBurBqEtH0mOLcSBSz3vaZQYPmRild
 1lnCB931y1LjoQtAAufaREhw4nxf4zy42tB9cSGj58RpX9bBS6+xHj9GGIIJK2uh2T9O
 kZgJBN2AS1ZNOwvFzF1XNdLK52sNq1RfEgs+Q8Zc96WS8OfUj/di69fCGdL4grd3mA8b
 gC8jhPdvUjOrPHyZzguV1jBtLYd/lpYFIFtTfNfL0tXzCuURlrf+h8rwWZspvCa2azy/
 M8f1i6u+3v1/ZNCfB+vja38lWiLutGJsSleft5ClcpoSDpaYG6+McyCijPArTWkScw9f
 IgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731080605; x=1731685405;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eC842Nuh9R0vJWP6nw94dy+XXPWkmXcFTwUalIOdql8=;
 b=QLro3hcVy9eHW18yE3sqVq0kUncwtjrU924dV0lytj6gZyV7LNgLsG6OmKN5ivWmz8
 bxxDc6ev18szKwEP+NYHZBx74LSw4hXjoASYzWB2qjGcxeFxeNpXEA6vTlvL076f7JYL
 wVrhoUhMmA2/JqpjudutDoPNLxj5A8uiQ6CiUI5onxybmVamckQI0QkvXvMd/8+VyP6U
 Dp/vJ8M8IT22AFvAkOxZxxwsoPVc1VvKqkB3rH7UjnIG0sgNXI76jTvktlJbH+u4F44i
 /T9xpnDIIzLdSZlmjhmv88VpItOKLcXQfb7eLKqegdt+BwY9blPY0JpPYe5XnrJTJO9A
 K8UA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyjBdWzAzD+9iS+u+QqLDen8YptH+TrcKO7Wnu/s6WXu8hEol2Lj1Co6IAWKjLHXSRmUeKUBqhig==@nongnu.org
X-Gm-Message-State: AOJu0Yzep0+niUy3yzhR0U2JDKr4iBceFA2JflnQqHDptJKbMnex4+Mk
 5Q7AiB50tFITze6Iv/+erIkLtM16bMmdawdc6kETLuyqMqH6v5S1N9eas5mYVEU=
X-Received: by 2002:a05:6000:2588:b0:381:c8fe:20b1 with SMTP id
 ffacd0b85a97d-381f18855b8mr2960779f8f.42.1731080605051; 
 Fri, 08 Nov 2024 07:43:25 -0800 (PST)
Received: from localhost.localdomain ([89.101.134.25])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381eda0411csm5170510f8f.95.2024.11.08.07.43.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 08 Nov 2024 07:43:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Anton Johansson <anjo@rev.ng>
Cc: Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, devel@lists.libvirt.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 01/17] hw/microblaze: Restrict MemoryRegionOps are
 implemented as 32-bit
Date: Fri,  8 Nov 2024 15:43:01 +0000
Message-ID: <20241108154317.12129-2-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241108154317.12129-1-philmd@linaro.org>
References: <20241108154317.12129-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: hYtttKE3hPAF

All these MemoryRegionOps read() and write() handlers are
implemented expecting 32-bit accesses. Clarify that setting
.impl.min/max_access_size fields.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Anton Johansson <anjo@rev.ng>
Message-Id: <20241105130431.22564-8-philmd@linaro.org>
---
 hw/char/xilinx_uartlite.c | 4 ++++
 hw/intc/xilinx_intc.c     | 4 ++++
 hw/net/xilinx_ethlite.c   | 4 ++++
 hw/timer/xilinx_timer.c   | 4 ++++
 4 files changed, 16 insertions(+)

diff --git a/hw/char/xilinx_uartlite.c b/hw/char/xilinx_uartlite.c
index f325084f8b..3022b3d8ef 100644
--- a/hw/char/xilinx_uartlite.c
+++ b/hw/char/xilinx_uartlite.c
@@ -170,6 +170,10 @@ static const MemoryRegionOps uart_ops = {
     .read = uart_read,
     .write = uart_write,
     .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
     .valid = {
         .min_access_size = 1,
         .max_access_size = 4
diff --git a/hw/intc/xilinx_intc.c b/hw/intc/xilinx_intc.c
index 6e5012e66e..8fb6b4f1a5 100644
--- a/hw/intc/xilinx_intc.c
+++ b/hw/intc/xilinx_intc.c
@@ -144,6 +144,10 @@ static const MemoryRegionOps pic_ops = {
     .read = pic_read,
     .write = pic_write,
     .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
     .valid = {
         .min_access_size = 4,
         .max_access_size = 4
diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index bd81290808..e84b4cdd35 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -170,6 +170,10 @@ static const MemoryRegionOps eth_ops = {
     .read = eth_read,
     .write = eth_write,
     .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
     .valid = {
         .min_access_size = 4,
         .max_access_size = 4
diff --git a/hw/timer/xilinx_timer.c b/hw/timer/xilinx_timer.c
index 32a9df69e0..383fc8b3c8 100644
--- a/hw/timer/xilinx_timer.c
+++ b/hw/timer/xilinx_timer.c
@@ -193,6 +193,10 @@ static const MemoryRegionOps timer_ops = {
     .read = timer_read,
     .write = timer_write,
     .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
     .valid = {
         .min_access_size = 4,
         .max_access_size = 4
-- 
2.45.2

