Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp549061njc;
        Thu, 14 Nov 2024 13:00:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX89/BO0xkmHZwL2QXnC4IYImSeynMq7VH9wbJnvQ4ibu0coeWeawQlpSswGfIzvb8b4oL3u7gccvYJxg==@linaro.org
X-Google-Smtp-Source: AGHT+IGrszWNobnFhwsn6sLZM05Y5OAPF1faF99B708SByb/j2Z/RQP4wSJglKmkofoiRdOZtBrs
X-Received: by 2002:a05:6102:4422:b0:4ad:5c41:d1b with SMTP id ada2fe7eead31-4ad62b481acmr742766137.12.1731618048371;
        Thu, 14 Nov 2024 13:00:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731618048; cv=none;
        d=google.com; s=arc-20240605;
        b=kS+kN6z0Qxu9jfXiEWlW/SUuQDuO+YCFglsne2nRMg+8KT/1fJYlWKyuU8/rlWxxQ8
         lFRanxvuGfKIK1MRBXtHrLtS4h1H5KbbLz4whYxB+JtpsaB86bVCMfei/KZUj7yW2uFa
         DN1Ksk0Sp0B0pA1zpWRHcYfFL8XkNTPa2JrEPHY3son+iFt+ZLogERHvejqRkzRl2BWS
         EqeUEUkbTjYpr2bRaKpEY8ncMaq/jueelE16IawimeNsluzmXaIXT6LssXLdKxMbqdsp
         tPiyyC1VFGuFrP42ZswYpjlXjYUh6/MEv3orLDLICvdZK8N0SSIfSILKuRCxEqpIuK7k
         doTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dxalhuJA3V9Mf8DxAADrs85j1mYwG4uCtR+wwxiXnFU=;
        fh=0xatxj4OzDuPzz9ohsUVwDA2hHz9oEYpGaZXdg02hgE=;
        b=ZXW1wlKxTFU9ijQYIQQONeef8xDkaballFaBBZTAfw1C0QmRB08MKpcL9AUd1mOvaP
         154Q/1a7EQoDm2fc1zknuL/IxUVouThB1TqQcVdkRP1bp7TWuAZfLwWT1SdVjqDlZ3hw
         pmmE2nepV5TUJr1Hq7w+0O0Y9pdsR5y7fVDOPr293242nuniull5oXT3V5y+j6nnxiO/
         uNE/Vysp5fCuHXkQK8deQpeh3OWf9zTufOSecMfKYA7MP5mjefojavp4WILvYCe1ulBR
         qD1opO7boGAkla5f7SDHJSTLXh0gAhDENrRAbYl92mpuC1ckZ7UYRB29B2VablDwm6ej
         cXyw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cx41yGx3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-856dfd58d2csi33961241.119.2024.11.14.13.00.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2024 13:00:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cx41yGx3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBgx1-0008Dq-US; Thu, 14 Nov 2024 16:00:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBgx0-0008C9-1z
 for qemu-arm@nongnu.org; Thu, 14 Nov 2024 16:00:26 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBgwy-0007uM-I7
 for qemu-arm@nongnu.org; Thu, 14 Nov 2024 16:00:25 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-37d49ffaba6so709362f8f.0
 for <qemu-arm@nongnu.org>; Thu, 14 Nov 2024 13:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731618023; x=1732222823; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dxalhuJA3V9Mf8DxAADrs85j1mYwG4uCtR+wwxiXnFU=;
 b=cx41yGx3ew8rlJ4Cxv3ogkRDgC2SfNrX8u9YYSdhNhtU90cxa6DMlk1hHC/ciKbvpj
 ZiHmSkfWi7s8mIiLrD3zw0U2g6vtxkEjbpWJN3nLp6st7LzDjQHL8BQdmpZBg7u9kc8S
 0ZsDMM5yRMOIn/RMhjWZvLTL1SABDonCfXbVziTGQf4knd6NWHGhdKzSQ6ZsO6TVnvF7
 HxAwxjOK0puUh7Z5kwx+FQ2kvqAvi01LnQ2LfJzdsCtvAQ5auEQwInwlJxDnnFltURlF
 2rXfLxuom5oLX+/8WhZEh+6UPlaql/oq4W4HA1zqA0ZPcssklYtVQGCnyTLOWs+YcW/l
 DBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731618023; x=1732222823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dxalhuJA3V9Mf8DxAADrs85j1mYwG4uCtR+wwxiXnFU=;
 b=bY4UHu9G5dVcKzoEDaHd1BzEZtWkTHyRqcnuJiykukAvZ6+Yb47Aa+o2oIztHN5AuO
 Cjda2sgRs9gRqtt9kvKKzUWWTaRO9/yJy2j4A5FgcEb2qg+s5uVnVj/Dcaqw42WF/IgJ
 jSLs+73vVLTBSOOunPIETuBBFcX80efPzGaX1ZeaN7d99VmPBkJlGmNOas2wFC5L3YpW
 UNDR+6DZ/wtHFKuycbLMB7ua7u3B6CFGFDMe0C58mTwBZPdDI6ZZTIQG0SowREaEsnR+
 j/kqsCSST9G0+zx+2Gs9c0ykGEpUIL82kL8256r7jsle2NQQN2zwJ3I40TBzRkF7IlPB
 9J1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgykcQ236xL+/PfbH8Yr8QIhxU7sRmR2c4Y25H06CUbw2RX4YZeHD7gbnwLeaz086sk9iViH4+jw==@nongnu.org
X-Gm-Message-State: AOJu0YyLZ7l5oGJEROCm2m1qhmWqfAJyhBgLOVno0rI4dFB6D8/rknFo
 qUJRHof+vKT+/okAa8+zX23zo6XDS5tBd4ZvazZPpUCnv0oNXdrw5weJKD2uTR8=
X-Received: by 2002:a05:6000:2a01:b0:37d:4332:e91d with SMTP id
 ffacd0b85a97d-38225aa6246mr158254f8f.52.1731618022950; 
 Thu, 14 Nov 2024 13:00:22 -0800 (PST)
Received: from localhost.localdomain ([176.187.209.228])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821ada2da2sm2430618f8f.15.2024.11.14.13.00.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 14 Nov 2024 13:00:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Anton Johansson <anjo@rev.ng>,
 Bernhard Beschow <shentey@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH RESEND v2 01/19] hw/microblaze: Restrict MemoryRegionOps are
 implemented as 32-bit
Date: Thu, 14 Nov 2024 21:59:52 +0100
Message-ID: <20241114210010.34502-2-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114210010.34502-1-philmd@linaro.org>
References: <20241114210010.34502-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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
X-TUID: V1oWUN71VoPe

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

