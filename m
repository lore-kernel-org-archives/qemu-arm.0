Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp551068njc;
        Thu, 14 Nov 2024 13:03:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUxJ34liwc+CmG66lQNaqH6o7iHSlT5Y7+VQDhuUeAX1XrLh4SFAuEp1AIY1bBL6hojJVlW8fZOX57lUQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHv6VxofzsUFGrbOx3n4f5M0A3tkvdEJMswjf9P8c3SEYnT1f3C4WBwmccvHKfeEi/beOIa
X-Received: by 2002:a05:6122:1ac5:b0:50d:4802:3596 with SMTP id 71dfb90a1353d-5146524bc67mr5680981e0c.7.1731618194510;
        Thu, 14 Nov 2024 13:03:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731618194; cv=none;
        d=google.com; s=arc-20240605;
        b=bS3MVfsxxS6vgBdgeBcGQ5bWCOu14/XkY3a+G8ecA/JfPD9kBA7C0bvsKUbqta7AGj
         Qkm0jHbRq99UyeW3ysXSf7/D8ce9tCi8rGpoMa215F8Je3nzvigQ0saRMKFH8SyaTlGt
         RtOH5om98HZ5utmc9+sQ2z7Qv124Hr+aSCBemCyQm+cvG4OTGtd8rL8wRiykcgoWezPw
         0oMpfaqmHRFNeRdWYqll0JRq0YBt8r0fVUV8OH8ftcCK16OYlROpe+mMIqz0C3FuOlRo
         ocgwuzZ+wMOvTI7wCXAsI1Udc6ZXQSh9laX4bDCahWcRQJf1XlFoKpQAj6qoIW7GDhe5
         /sTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=b8zvUlfKjuVL1gQONPCLSNzp6FDlA5idGOeDaT6LkvA=;
        fh=bP6gCT6+/8Nl9QU5gLD5hp5Qd0fQ4WguAysSZqTx8AU=;
        b=TCSVml7piwb6wSpAcXRRtckho9QpI93kCLm6BPhwnZkptno6GxJVc6Is47b1V2LAuS
         nnxxcTEkTRSuwZfeI+qEPP7Ezrmll3TlWtyrQZSM9ZX4j8EBYPFlu+z+3D2Fxqwj5zFa
         vor+k6U/d9oGpJn64lfPCvPGaPO38PeDDdyXEtEjYtyiC5jSkjQLVnaG1rT9ZAa09pfL
         E+ODQAfV5zV5DahyMaJaJMK2HLuRZp7UMM8yZkPt1qRKoqNJowxf3Ogxnc/bzqyfmVg6
         VZZFxZ60pp1Nv+IrNKfSYvYyapB6Y9i7bVsreQAPRSZcCTZwq0EeUb8SsKEf4o9BI+eH
         Ma1g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fwqkHPne;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-51479caafeasi26963e0c.270.2024.11.14.13.03.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2024 13:03:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fwqkHPne;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBgyT-0001pv-Iw; Thu, 14 Nov 2024 16:01:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBgyO-0001Xc-6M
 for qemu-arm@nongnu.org; Thu, 14 Nov 2024 16:01:52 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBgyL-00086Q-Kx
 for qemu-arm@nongnu.org; Thu, 14 Nov 2024 16:01:51 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-38207c86695so820948f8f.2
 for <qemu-arm@nongnu.org>; Thu, 14 Nov 2024 13:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731618108; x=1732222908; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b8zvUlfKjuVL1gQONPCLSNzp6FDlA5idGOeDaT6LkvA=;
 b=fwqkHPnevinQ5zkPmmwuHieP7VzqLULaY+cdqLvhbdsEg0iew3+KwYZZ1M3zpIZva7
 fhZEigj34ZWx22W6e2XyQJJHnWtgy/e+8Xfl2pjjSNhMRUc8M0yFVlTyXLf8HmbDFs3a
 thyUn41JY/PPmi7jVzTKZMF4BzW6BCwaf247mpKOUR6hal7BzPIyG8qXU52z8/iugNfT
 PYCvPCFBdTDUwIxUSzkfCfA0rXxf2BswpxUAIvnNtC7+5xJGsooasPxktfTtxviKxmLj
 +XHlLQcD0ueIoV6INjz73gIWE+TAdf27d5jhXVyzzw2DqWygzUix55nGbxVxu22tLGd1
 3Taw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731618108; x=1732222908;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b8zvUlfKjuVL1gQONPCLSNzp6FDlA5idGOeDaT6LkvA=;
 b=ID+Soi0qrqPRUQJ2cVQAWYJQ+1cKhEGEDNubTiPUW7tralM60oPBOV4u6G7g0vB4lG
 6+MxMg8qOoCwptm5JcxCS/NEA/Mnwye6zSDDRNznuXlUJoc5W70+wTspNZPZOu3S/Nts
 SmgBIRFRRNt95xmIeWrAuYEwCwATcVMl+E3eTxe2UjgnJ1hAmxCaoWB4XQjYx+uhyQ0D
 XuHHoLiTEEAlwf3RHFawht2aNHJ9LyJwOfZ1tjUtgKqgtk04F5ivBV4W2iJG5Q/ANvug
 IT7Lx2ZElg5Qe/kYL1WTY8MOVtfpatU+GHib8TSmQXmjRYkHjTS9YaSlKdX/toEK1AKI
 Ld2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/yzR3vFzEYJckp+5183uj6mcZapmN4J9IqLNcKOGTv6ZY005qfRd3w5sHaJP/m7kUlJJb/0EAqQ==@nongnu.org
X-Gm-Message-State: AOJu0YzB63542JJB0Q2KsxI/xCy0Hb3PkZiThwZbOTOXGEQvp4Wigq4D
 fQ1IualZ1H8LEYtPnuo1zrdG+hFHILGnhZzqzatj9TK+ni2OPkHibPPYW7BwAb8=
X-Received: by 2002:a5d:5f91:0:b0:381:f443:21ca with SMTP id
 ffacd0b85a97d-38225ab4db7mr129227f8f.58.1731618108071; 
 Thu, 14 Nov 2024 13:01:48 -0800 (PST)
Received: from localhost.localdomain ([176.187.209.228])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821adadba4sm2423628f8f.24.2024.11.14.13.01.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 14 Nov 2024 13:01:45 -0800 (PST)
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>
Subject: [PATCH RESEND v2 12/19] hw/net/xilinx_ethlite: Access TX_CTRL
 register for each port
Date: Thu, 14 Nov 2024 22:00:03 +0100
Message-ID: <20241114210010.34502-13-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114210010.34502-1-philmd@linaro.org>
References: <20241114210010.34502-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
X-TUID: 3Up//llwxC6F

Rather than accessing the registers within the mixed RAM/MMIO
region as indexed register, declare a per-port TX_CTRL. This
will help to map the RAM as RAM (keeping MMIO as MMIO) in few
commits.

Previous s->regs[R_TX_CTRL0] and s->regs[R_TX_CTRL1] are now
unused. Not a concern, this array will soon disappear.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/net/xilinx_ethlite.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index 06da940303..674f805d76 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -65,6 +65,7 @@ typedef struct XlnxXpsEthLitePort
     struct {
         uint32_t tx_len;
         uint32_t tx_gie;
+        uint32_t tx_ctrl;
 
         uint32_t rx_ctrl;
     } reg;
@@ -140,7 +141,7 @@ eth_read(void *opaque, hwaddr addr, unsigned int size)
 
         case R_TX_CTRL1:
         case R_TX_CTRL0:
-            r = s->regs[addr];
+            r = s->port[port_index].reg.tx_ctrl;
             break;
 
         case R_RX_CTRL1:
@@ -161,7 +162,6 @@ eth_write(void *opaque, hwaddr addr,
 {
     XlnxXpsEthLite *s = opaque;
     unsigned int port_index = addr_to_port_index(addr);
-    unsigned int base = 0;
     uint32_t value = val64;
 
     addr >>= 2;
@@ -169,24 +169,23 @@ eth_write(void *opaque, hwaddr addr,
     {
         case R_TX_CTRL0:
         case R_TX_CTRL1:
-            if (addr == R_TX_CTRL1)
-                base = 0x800 / 4;
-
             if ((value & (CTRL_P | CTRL_S)) == CTRL_S) {
                 qemu_send_packet(qemu_get_queue(s->nic),
                                  txbuf_ptr(s, port_index),
                                  s->port[port_index].reg.tx_len);
-                if (s->regs[base + R_TX_CTRL0] & CTRL_I)
+                if (s->port[port_index].reg.tx_ctrl & CTRL_I) {
                     eth_pulse_irq(s);
+                }
             } else if ((value & (CTRL_P | CTRL_S)) == (CTRL_P | CTRL_S)) {
                 memcpy(&s->conf.macaddr.a[0], txbuf_ptr(s, port_index), 6);
-                if (s->regs[base + R_TX_CTRL0] & CTRL_I)
+                if (s->port[port_index].reg.tx_ctrl & CTRL_I) {
                     eth_pulse_irq(s);
+                }
             }
 
             /* We are fast and get ready pretty much immediately so
                we actually never flip the S nor P bits to one.  */
-            s->regs[addr] = value & ~(CTRL_P | CTRL_S);
+            s->port[port_index].reg.tx_ctrl = value & ~(CTRL_P | CTRL_S);
             break;
 
         /* Keep these native.  */
-- 
2.45.2

