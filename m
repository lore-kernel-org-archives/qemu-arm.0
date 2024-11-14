Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp490559njc;
        Thu, 14 Nov 2024 11:08:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXXgpg1bW+SDqcKQRvSJ6GGv0RLzJ9VWV/5d/dPrs1lQAkcZoIU9Nl4fmHk+tI4dpZuMmTLcEelRXWiIQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH69MHoWg3QWcrrQim8nWuDmNNTpEo4kgwGiKlIWJx/omGgN+ThEOI8SXLxcOBLObfqrITN
X-Received: by 2002:a05:6214:3c9a:b0:6d3:7f9c:9e51 with SMTP id 6a1803df08f44-6d3edcfbaa9mr40719336d6.20.1731611292337;
        Thu, 14 Nov 2024 11:08:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731611292; cv=none;
        d=google.com; s=arc-20240605;
        b=Wuy9w0HtBiib5Pik/GVOAOXwA2rxOKP25QfpYmYrfHAd+ZlB54bPnN37n4oGyv9x8F
         yCZDll2J7Nk9TA1lforojdAWdgN7yzjt+k3YYjT0aYVsx2v49sDAdht0dMV03bRsy6ye
         ehWssYh9qQzb7u2yy1o/UkP7cPvhIX93I6YHs4nN3YRYfsi7uUQ+nU0BDb7gswoP5ejB
         6ysLSKWmtfvGT7/Kebj+mOy3laLkhimzzZ9wd/Oek31jsImIFjaflgBJpPw1ONujsHCC
         A63Jw7FlYK9zHvdRj0t572Jq0Rl1Y8K7hhxhNJKDI5IcbvyMPoiaI66Xnt8oxrxOAazH
         A6dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dxalhuJA3V9Mf8DxAADrs85j1mYwG4uCtR+wwxiXnFU=;
        fh=34JYvW6kmsmXCNtFTHL4kZFhUuvNWJFZYA4JJhSTITI=;
        b=BnEcgDlS/Azk/sAm+g1n8m/pDIvk0Ih/qGe1iluVWHEoqu1zbpIQQ/MXEQ31KzWlXz
         e8mUaW7f824N1Sgmca7RR3ymHTkd9+hCz6xdFfFWX4/fVd/UDfCa9g9AUZgz8cK+YhBj
         8SHGZDbtV33lEmFMc3bEhBnviVk+f6/b6GvFXTqYnvHgwiOis4KCGhI8hruGinFdGrg0
         ctGMogTfY5INluTjr2xmcM9sZC0hlU8evNDzMHHxVaJHUlnVqAN578oLUnVQZqx4xZfb
         K1UoByEx1dFV5/WNKGkjldOJ30TIM8cMjuFDR2ubirjwSTtgNbGOi3Xeo8igjWTmJMfl
         G8Hg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gq5FBebU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d3ee8b744csi17678776d6.272.2024.11.14.11.08.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2024 11:08:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gq5FBebU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBfC6-0004Gv-Ea; Thu, 14 Nov 2024 14:07:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBfBz-0004CC-1C
 for qemu-arm@nongnu.org; Thu, 14 Nov 2024 14:07:50 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBfBw-0005V7-Rj
 for qemu-arm@nongnu.org; Thu, 14 Nov 2024 14:07:46 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4315e62afe0so9038435e9.1
 for <qemu-arm@nongnu.org>; Thu, 14 Nov 2024 11:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731611263; x=1732216063; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dxalhuJA3V9Mf8DxAADrs85j1mYwG4uCtR+wwxiXnFU=;
 b=Gq5FBebUOPzHyv/KQrMpEOOseclpPCN22l+fZU+ikZucZ+wahkibEqa9FVp/B7Jn54
 wq6MiF7Zg2uLyPnJLf11YmrZzPIYpBoHOTH6/INOy3aH/3iUetJ/GtAWa3m03MEDKWQZ
 A3rgdIBUqfRWeVVrWt+UxtnOgLQsb01LY8ZJZJZDWAeDXZf6Aa62KJ4N2HpCS4+rjl2e
 rzPJfJB6drqFUlVc6msPamBCKrFOUyxAjARgPtU28jWMNFsgONx5zD2VdU1397RRAURR
 qgoKpXCoz62atGTJ1yV0jOrLjzf4YU+TUdrVX+5LgA+C9YR0Hsk6Jm1siylbKkH/x6YT
 rUvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731611263; x=1732216063;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dxalhuJA3V9Mf8DxAADrs85j1mYwG4uCtR+wwxiXnFU=;
 b=piXXJrJuTuS/V1Z2Sfa39u/8hHHIbIkHC3O5emqAnr0KCc+8/zAn0HStpB6NuVlcAK
 Y+PzviRBlGkAAuJ723sI7+PFIki7cGXKbP2Wdwba3d0hWA1ylc/jHno9tR42k4EHB8EL
 axXL9V8JZ3Ik1m0ROWabuwbz6/bdPja+jJwtvOtRLtwZR9nMeReN5PvrhZHGhjzof712
 Bd3h8cOiVVqKtacn4NjPC7tJpxjjxQmJbRFIWEgMrDbI4ZpIb8Rp2T0VUE0CeaYW3jF5
 7Fe0eBq4xf0SUv4j5G+tb24RpQz9EvzZPYnRBjwWloD5XCSKPvIdEj+MhGymotsCnrK3
 92GA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVk8lcgsvky6EwSL4fg0XSWqRl2mSo8XKl/967ZzsMx6pHzbrw1Myv8pg9QRyD4F0TeZONhw+/Ryg==@nongnu.org
X-Gm-Message-State: AOJu0YwQJZZIpWAk3vDMZAFU8sQ+S4WwUZQ3xoYIeglFKojFGOS8Ybvq
 K94mlp1PbzWZiMtYkYVSpfhIOyS/O+hirgt0yD1M34RWhwPiTPYPlueujDI3YLw=
X-Received: by 2002:a05:600c:3b82:b0:42c:bb10:7292 with SMTP id
 5b1f17b1804b1-432b74fc98cmr213441365e9.1.1731611263083; 
 Thu, 14 Nov 2024 11:07:43 -0800 (PST)
Received: from localhost.localdomain ([176.187.209.228])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821e073e0asm1721415f8f.30.2024.11.14.11.07.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 14 Nov 2024 11:07:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Anton Johansson <anjo@rev.ng>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 01/19] hw/microblaze: Restrict MemoryRegionOps are
 implemented as 32-bit
Date: Thu, 14 Nov 2024 20:07:15 +0100
Message-ID: <20241114190733.33902-2-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114190733.33902-1-philmd@linaro.org>
References: <20241114190733.33902-1-philmd@linaro.org>
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
X-TUID: H3iWQTxpKpzw

All these MemoryRegionOps read() and write() handlers are
implemented expecting 32-bit accesses. Clarify that setting
.impl.min/max_access_size fields.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Anton Johansson <anjo@rev.ng>
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

