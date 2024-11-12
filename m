Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7533532njc;
        Tue, 12 Nov 2024 10:11:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXZt3XM4OT8wmtmrk0BuQedINwP+uzr8t2SbYi2Ndl5TD6otuoWOIXxp/ym9RDsGSAmjIhxJOgF4IkGfQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFJ4PBHkoYtwIKRTChYTnu7RyATan9Mg4LN0CDE0xxGKPx5Dq2a7X7UdCGyCA0tSsK+CsCG
X-Received: by 2002:a05:6102:38cf:b0:4a4:7671:7588 with SMTP id ada2fe7eead31-4aae168c955mr13819221137.22.1731435066511;
        Tue, 12 Nov 2024 10:11:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731435066; cv=none;
        d=google.com; s=arc-20240605;
        b=c01uNL5nEbph6YgWI8CBRMjoSFT26VlplVtt2AFt2ARWieHM+F6qEJLgrPHbDutaKz
         HK79XXdhiiIUjko1aNFRp5rUjbbyN8JSoyKcAPHtDNv7WzIKBi3IxTruWUFSmZQ9sVVb
         rw8KNrScY+nsLpCrdXPxKQJQVCGhJaA3uUbchU7eS2YEdiu0HWenxNkyTOWHeXPAU7sj
         vcagYWknWenxfPeopV0QUytO1j3qoYU3I66Y3XiCYyY6JHVjfU8dof3XU+ZyCuCSv4Bx
         fHNmtkVHqcXCQRd5b32DTJhYiNYwu0ee5h/xN8wdcOzAYuYEmEYxxjhrQUJGapx5wcAA
         9mwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dxalhuJA3V9Mf8DxAADrs85j1mYwG4uCtR+wwxiXnFU=;
        fh=hJW1krj8bo/9dkuju65aPRtXMvyTApYG5C+a3IY54X8=;
        b=l1Lj/9N96MwwWujXARkdjZHAqyb/muXej1uHFsunvcag9zqobb2q/RG3efpM/Av2+o
         gtRfZDhZDhOJijozKrU6ibHd9zYED6eJVDoKeJN1rps8Htj5y4IsjDX09/UFS7E+1SUQ
         Ug64v2aNzaNySl3aeR4suBgjZU+bIbieHxj6SIWIXJ2a2tjWc+FgIOKlWG5p1RrxkZbn
         b4pH0UD/wHCLoKZPDoQVJsBIOA7wo9/K8WyR/huP/BqAJC44gpk/pEVNX4v1e1CAbUi6
         N27DoYiH3UZc2d7Jk0JH87yVitaSSxtLvDrXQ/xLRpaow/UI6tejgWJIGRPsMPU3b+Id
         KnRA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lJ9Cm2iS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4aaa7c2d375si3257359137.597.2024.11.12.10.11.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 10:11:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lJ9Cm2iS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAvLx-0004v0-Ln; Tue, 12 Nov 2024 13:11:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tAvLu-0004uT-LX
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 13:10:58 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tAvLt-0001rq-4s
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 13:10:58 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-37d538fe5f2so4389398f8f.2
 for <qemu-arm@nongnu.org>; Tue, 12 Nov 2024 10:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731435056; x=1732039856; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dxalhuJA3V9Mf8DxAADrs85j1mYwG4uCtR+wwxiXnFU=;
 b=lJ9Cm2iSSpxyAnKMuBy2DLAaFLsRlBMED2NZzfuO6wzTcf390IK9pOi003279rU3dd
 xoSiRnZDmMeC6INBC0WySIbN5vQfmpDBg0u55uV0/mZgWLxrnPkcoq/oxSygcKT0MaB5
 Fw8VTOfkN+8duGSHY4lvXINHnTWz89srKQQZadJ5Xrz3CY6+/tkFhamiR5mTHxeKSZuj
 6L/A925S3s9mPJlZa2P1+hs0dBrNqp43UzyyCxEJB4FMTORAoajKhSBEgqgZxPPn6SWL
 ooRCYm3LImHma2WaxPU+0p+ACNkhPOXdfDvts5Yj9Qr9BiKe75VB8a0Lo40/mdS5iZCr
 N/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731435056; x=1732039856;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dxalhuJA3V9Mf8DxAADrs85j1mYwG4uCtR+wwxiXnFU=;
 b=ZD3iHTfrzrklXQZwGG13Q9xW9a2zHtaPPxbT8PUpuaFhjNyS0M7LcJLMM1HhHVljy1
 QhToBFdY1hq088IrwD0g4Y7KyvRQd3dQIVismSh0HX8bzgOUnt0vI3Tb+D5DHY4640LR
 MPcjvV65EHlLDUhmnvElmRB9m+ni9ofbhQ3eQcLXkpH8jakOokDFx/BcprusxfZjhnlL
 X9C7MZ4rIAuqoSkcSz38LevpPqoRTzIXRUuwo44mhcaOHbqV/8w4sySdn99iW77dlfw0
 Eik7aUPoUMHlnQSYDWBHjMeqfP8Rd5ESz5fGJhMgLcxu+9/8bSLC02P5FgxRTpEefBbM
 vivA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuc7ma1Di2LbwZujRIN/Yqkgcx2aADDMSahdLur0G5l1A+WXxAMokVzHutoABKom7zIy1cHJeLAg==@nongnu.org
X-Gm-Message-State: AOJu0Yz+eUOco3eALFkBk8FqJ5XRXjHI+ryMfeBONMWJLtBuc1QB6QPC
 aEMncELhhTqYpkFKSaXeGXhj0yPt+CCJDaEh/2PyrEM0eYxgggPtGLYv+MVK2L4=
X-Received: by 2002:a05:6000:184c:b0:37d:238:5a84 with SMTP id
 ffacd0b85a97d-3820df71a37mr43757f8f.15.1731435055659; 
 Tue, 12 Nov 2024 10:10:55 -0800 (PST)
Received: from localhost.localdomain
 (cnf78-h01-176-184-27-250.dsl.sta.abo.bbox.fr. [176.184.27.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381fbf416c6sm7670380f8f.54.2024.11.12.10.10.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Nov 2024 10:10:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Anton Johansson <anjo@rev.ng>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 01/20] hw/microblaze: Restrict MemoryRegionOps are implemented
 as 32-bit
Date: Tue, 12 Nov 2024 19:10:25 +0100
Message-ID: <20241112181044.92193-2-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241112181044.92193-1-philmd@linaro.org>
References: <20241112181044.92193-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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
X-TUID: 30QBIuZrKlHN

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

