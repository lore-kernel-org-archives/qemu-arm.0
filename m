Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7533868njc;
        Tue, 12 Nov 2024 10:11:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUszR3iHXdF+s1XDI2kFNvWIMAjZ6nu8nFIwh8CYGpWlZKJ7HafvJ+lM8ALvzrJO57nQg6PKO79VpnGTA==@linaro.org
X-Google-Smtp-Source: AGHT+IFikXeQ3pVxatTA7caF+yGRrIcmjz6wj1N8AZ1xQLgRzwm+8po1coXDnqbdKN1EhmXGSeA3
X-Received: by 2002:a05:6808:10c2:b0:3e6:14a6:4288 with SMTP id 5614622812f47-3e794664d56mr15295413b6e.11.1731435093373;
        Tue, 12 Nov 2024 10:11:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731435093; cv=none;
        d=google.com; s=arc-20240605;
        b=Xiy0axhmhzySA9UooFD/FdfqctLdrhAHNiLserzSwfwdwefUHoJbJRflkdwdjeI1M3
         rI2CfbNnalk9w+ZX/jx/LB9GYU59JDXHJ3OGaX10QE1jLSIagBxx+3a3m92dtZYNrQ45
         crQnxg+13ahSuF/pSy3yIZtJ2rqsns5h/OGlSt/jmN5bZ0cUEDC3dRhP/luU6aaxv7If
         gEYuo7PWkhqVCB3a4Hr2/19PaEvBJRrNHU+yrBCy8vsKUlP63ULil9OLYUCGpZ7TWZjU
         5jfo4G0Nz0m2B6rb64g9kxb9eMJQaAAe5vju9nEf4JGLe6Fn17kLLTb8EtBuWENSlEQC
         LrRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=oH/SQSX4OUP5TxQrfvghzIartXS3npm2RFGdjSdA9Ng=;
        fh=q1hHDi2762ZNWahadgDAvnl+pay+ll69lZ07vmTKkfA=;
        b=dy7hNMm/kt+iL+nwc+EN9uZYldmc4vOY0kYu86EDnVn5xbB5RI5XVtHgNFe2p4L0IX
         ico1pURWWoG70qmjVrSKzN/ddCtQZNdpFxAs32YELaXbdkoWRaQ+RkQ+3S6nrFYH+xq4
         o6qja6OuECiC5yRJw7rz4WgZfq4eIfD9msoSS/TvGzAyrwTlsn18tLJiObwpd4YerFTL
         zeklD0UnaKawCBL+mN6fVjZJgmHu/424TAuqG/bCISnitqGaDV7A1b+jqC4cKhqahUOO
         LIKUnDBOoN4iv1ov0wfGKLu7Bx4tetkwBjpEJRmGFvAmHrBEhPpDJXt+NQ6YrMq1Gb9D
         aR8g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BsBqowxg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4aa9f030af9si3298778137.322.2024.11.12.10.11.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 10:11:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BsBqowxg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAvMR-00052F-CV; Tue, 12 Nov 2024 13:11:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tAvM9-0004xr-Np
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 13:11:14 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tAvM5-0001t1-PZ
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 13:11:12 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-431695fa98bso47565215e9.3
 for <qemu-arm@nongnu.org>; Tue, 12 Nov 2024 10:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731435068; x=1732039868; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oH/SQSX4OUP5TxQrfvghzIartXS3npm2RFGdjSdA9Ng=;
 b=BsBqowxgsurXN+MW6A3LRV+KZr5BOOdjPGZucOjzunOoUzzFfggFvN7yKNzSwsnej2
 jxdN/eIYLa3CgaDZHa/TMjgpN1bFfsxI933n5lCbRGMEHivZWxxjsLnEsxS31Lcq+pLb
 7mBbZPbm8QijRukU32EyHrwrMX3Kfv95I8JJpSqir2Qt0n58AXnlq5M96SPEPfkUO2gu
 TnIib27NBNKlzng0Kzb42CkNtlIdVDJrQc+526oo7eVa9/0wi18uNB9TYT5BS5pSYQYH
 fGJ1oyY1FPhzZv7QDEwkIerWu31gpIITRYW1SLFKq7PVMJvyISezcsGBVYk3NKq/FFib
 TepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731435068; x=1732039868;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oH/SQSX4OUP5TxQrfvghzIartXS3npm2RFGdjSdA9Ng=;
 b=kIFQUVp6tjGax3I4HzJK2sCotyoD/i4ULMs2MZgRjOMNt3YlK7dzAYYNMJ5RzJDzIp
 8KSIeZIEmb6Jokzz17NWA+s/ch7DlWz6ZepVzhQN8SSMcrXMGqIuu9sUf2e5kkxN5YA2
 0QEbe1EwRckAUPCENXzgEXDfOW1uoN9fajJ9GtcECTHbYOq/y32SHPD1xK201hxzkcuj
 d5deRT8njHlaDXN3fwwHdvA2Z/pBlET3xM3NVdWWRofFIFErGzev6XM9XnxulqI2yPg0
 T5OOsDaufcbb/JW9vOvZLyHcC5knBhfrnNzQJMP+SwYTjuzBTniZz6ExwjqXpG3Z+jDD
 z8FA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVD53RjlBklhyx1gzoFUzxG0lB22jt/HtJ6ed9vqWvBjbrfcvDP11RC3lxdlfdnBNivbJdMDKqRaQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy9/ptzjzjIQT4T8usttexj2gGILEphHwHmu1R3cyEncJpKamT2
 UrbkPBsSbMgQaAlX/HmgUXh9wvmmk67z6vGKwMu91J/ffvkqOfigQ4IslttsGCA=
X-Received: by 2002:a05:600c:510a:b0:42f:7c9e:1f96 with SMTP id
 5b1f17b1804b1-432b74fdee3mr147919705e9.1.1731435068020; 
 Tue, 12 Nov 2024 10:11:08 -0800 (PST)
Received: from localhost.localdomain
 (cnf78-h01-176-184-27-250.dsl.sta.abo.bbox.fr. [176.184.27.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed97e46bsm15765702f8f.30.2024.11.12.10.11.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Nov 2024 10:11:07 -0800 (PST)
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
Subject: [PATCH 03/20] hw/net/xilinx_ethlite: Remove unuseful debug logs
Date: Tue, 12 Nov 2024 19:10:27 +0100
Message-ID: <20241112181044.92193-4-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241112181044.92193-1-philmd@linaro.org>
References: <20241112181044.92193-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: TCytu1Ve9fHX

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/xilinx_ethlite.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index bb330a233f..2b52597f03 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -32,7 +32,6 @@
 #include "net/net.h"
 #include "trace.h"
 
-#define D(x)
 #define R_TX_BUF0     0
 #define R_TX_LEN0     (0x07f4 / 4)
 #define R_TX_GIE0     (0x07f8 / 4)
@@ -100,7 +99,6 @@ eth_read(void *opaque, hwaddr addr, unsigned int size)
         case R_RX_CTRL1:
         case R_RX_CTRL0:
             r = s->regs[addr];
-            D(qemu_log("%s " HWADDR_FMT_plx "=%x\n", __func__, addr * 4, r));
             break;
 
         default:
@@ -126,13 +124,10 @@ eth_write(void *opaque, hwaddr addr,
             if (addr == R_TX_CTRL1)
                 base = 0x800 / 4;
 
-            D(qemu_log("%s addr=" HWADDR_FMT_plx " val=%x\n",
-                       __func__, addr * 4, value));
             if ((value & (CTRL_P | CTRL_S)) == CTRL_S) {
                 qemu_send_packet(qemu_get_queue(s->nic),
                                  (void *) &s->regs[base],
                                  s->regs[base + R_TX_LEN0]);
-                D(qemu_log("eth_tx %d\n", s->regs[base + R_TX_LEN0]));
                 if (s->regs[base + R_TX_CTRL0] & CTRL_I)
                     eth_pulse_irq(s);
             } else if ((value & (CTRL_P | CTRL_S)) == (CTRL_P | CTRL_S)) {
@@ -156,8 +151,6 @@ eth_write(void *opaque, hwaddr addr,
         case R_TX_LEN0:
         case R_TX_LEN1:
         case R_TX_GIE0:
-            D(qemu_log("%s addr=" HWADDR_FMT_plx " val=%x\n",
-                       __func__, addr * 4, value));
             s->regs[addr] = value;
             break;
 
@@ -203,7 +196,6 @@ static ssize_t eth_rx(NetClientState *nc, const uint8_t *buf, size_t size)
         return -1;
     }
 
-    D(qemu_log("%s %zd rxbase=%x\n", __func__, size, rxbase));
     if (size > (R_MAX - R_RX_BUF0 - rxbase) * 4) {
         trace_ethlite_pkt_size_too_big(size);
         return -1;
-- 
2.45.2

