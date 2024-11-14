Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp549979njc;
        Thu, 14 Nov 2024 13:01:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXVtzwcOtqn86ChHN5NrEg3aXcX54eMd2XeFVwFfN94hTUpJ7MrknXqqyeqPvCjqABzq6mstEb3M7fGDQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF0a5wseYjSlcTYm4zYbo4DKc2WyC/B9iGLRZsCOAdrU0IQwqgeUVfDUu0K7avzMuRzJaOT
X-Received: by 2002:a05:6808:158d:b0:3e5:c7dc:ac60 with SMTP id 5614622812f47-3e7bc86f24amr358194b6e.43.1731618113669;
        Thu, 14 Nov 2024 13:01:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731618113; cv=none;
        d=google.com; s=arc-20240605;
        b=iIEavcsqHLlI+J2bmin00E1Wz3znGpH1dysg2+qHZ261PXnRKr87f1HboVptUSd2N/
         KMGUiqv4y+f24Oa9ThCF/ioMRumekk1Y60SrRkF0SBTuy/HzSHQvhj/TTV3Cvjy4MEzk
         kWO6NbXjYKYctFRSuaFWYTLfTBxbiKSqdiYl811qBOBsQLIj4AEy9qy7RmwSUjndquPM
         VnCkV5mvRgSKWNb7f1hrPfv6JOCd5sRlJd4Fd+mMKlGoQGY8+llZbKp8IJeZpbgLxX8V
         YOqmi5LQXARrHXuK663WZqr1FkKvL1/ocT4Urmty2WlKlAAIrmVNN/RdJT1RYkHz/RE9
         g4BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=trKZIqBS/vvTexwy29kgOKpXSiuRtzrN3KiHsscp0eY=;
        fh=dwquqPEIYDjQUVwu2mj+WnEwiVIDEQMFmkfItbB/mFE=;
        b=SPiXvH5pZj3F6OJ7xoujy6mDCWFGadXqGUpP8YNakn4XJOELp7DQ080yqrVLt0HEuT
         x4WaI9oMU3T2K7wai5pYrEjvaVvscTgipgp6KVjVZ2StUsXbWUBkOvofgBHrzjYdY3V/
         Cjc0aJq4YQGENaJS2UO/qZknqjmG1OmUTUkbYUuT+/tDirRVpUL0nK/jh3lgJOZDhUp7
         3HbQ9kNFgAjAwbylUk47b+tLjIssifpae3/PyxXX72bGI9UA3luU8XKPCtNlFfbkLU/j
         FB4f2IdgNEXJzHzT2CtwVgucp0yPpnJw61NtuYsk5IXtaXYlapsIXoUTQCMMn5mAolIJ
         rCfw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UOncNcMa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-856dfc081a4si43793241.91.2024.11.14.13.01.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2024 13:01:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UOncNcMa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBgyL-0001Pe-KM; Thu, 14 Nov 2024 16:01:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBgyE-00015f-Rx
 for qemu-arm@nongnu.org; Thu, 14 Nov 2024 16:01:44 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBgyD-00085R-Dd
 for qemu-arm@nongnu.org; Thu, 14 Nov 2024 16:01:42 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-38221500c2bso437166f8f.1
 for <qemu-arm@nongnu.org>; Thu, 14 Nov 2024 13:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731618100; x=1732222900; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=trKZIqBS/vvTexwy29kgOKpXSiuRtzrN3KiHsscp0eY=;
 b=UOncNcMaWl/KXWMQBfS2aIgL0IwvIvIq5XxjwrQLB9tOI1LqwH4f3DLyhGbaIlyH3X
 XwIqBtl0ib2/Bq0E7xK7RrAt+OFxs3Pg4nOm8yYGtDM9GnmdciVJWTPqZQSNoioYEdvb
 4kGMCFk/0WCLorP5eDyBR3DUpJGZdXrOWjGVBptvU43r/lTUwAwP98JotOWHuiPD87KF
 vF4kGbgC+e/w7nDuEIng5RIIYse/eWbi7iJa4XiArMIMN018iM6cYNmmc7abMzy0O03W
 xj0EmN5q1t8+BGeDfVdY5bTCui9VpciwZqtpoqdCNDXORMu81lpCQ5JwVhQUpimcyrsz
 vSzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731618100; x=1732222900;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=trKZIqBS/vvTexwy29kgOKpXSiuRtzrN3KiHsscp0eY=;
 b=qGEikpUEQpuVVYLrZGbOIV883u2RYTLRQF9rbwhgvlGpAbPTqbDYbKvefaIKALIJ5Q
 7WUvOfPgu25ysWadKm6F77B1UHotXiz/sp+6Ueh1Zys6+Eh2Ada95X98ZXpwbwutbOKG
 0fUhwmB4XSN+3th30OcCj7BKr2soosMgxS+b9CqjrrG/gysG5ZSIJeaiKfpNIlchq61b
 N77tx6tEVlp17/nPacZWS/SP41eQ3mxMvheQaxuZxZrXh0w4EhviQRSeGCk195oi8zOr
 XP8d+3+agtwjP3pMYyOtJ7xiV0KqN6OSiai1u/a8UmZWCaYn100A4aTJisMG+2h3Bp1M
 U2Xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjKu2K9PF3Vd4g2ariScMOmtbj7BsH9Tm01l65IlJoiPlrtJyvlkXBNPP0vgExFK40AoR7HJwjMQ==@nongnu.org
X-Gm-Message-State: AOJu0YzhVnpphL0CGUVHJ8aIqB73i05dcGFeI2QZmHdei1QXdD/+x3by
 TwBL0BvTBel4jWBtu4g+44OkHD5BoFDJTEjXv0DeHhZgNUU/RIRL9kAUgEfQqfE=
X-Received: by 2002:a05:6000:691:b0:37c:cc7c:761c with SMTP id
 ffacd0b85a97d-38224e531b7mr487963f8f.3.1731618099808; 
 Thu, 14 Nov 2024 13:01:39 -0800 (PST)
Received: from localhost.localdomain ([176.187.209.228])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821adbbbbdsm2441261f8f.50.2024.11.14.13.01.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 14 Nov 2024 13:01:38 -0800 (PST)
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
Subject: [PATCH RESEND v2 11/19] hw/net/xilinx_ethlite: Access TX_LEN register
 for each port
Date: Thu, 14 Nov 2024 22:00:02 +0100
Message-ID: <20241114210010.34502-12-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114210010.34502-1-philmd@linaro.org>
References: <20241114210010.34502-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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
X-TUID: 5B7hCRaSpMMO

Rather than accessing the registers within the mixed RAM/MMIO
region as indexed register, declare a per-port TX_LEN. This
will help to map the RAM as RAM (keeping MMIO as MMIO) in few
commits.

Previous s->regs[R_TX_LEN0] and s->regs[R_TX_LEN1] are now
unused. Not a concern, this array will soon disappear.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/net/xilinx_ethlite.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index 36ac8097af..06da940303 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -63,6 +63,7 @@
 typedef struct XlnxXpsEthLitePort
 {
     struct {
+        uint32_t tx_len;
         uint32_t tx_gie;
 
         uint32_t rx_ctrl;
@@ -134,6 +135,9 @@ eth_read(void *opaque, hwaddr addr, unsigned int size)
 
         case R_TX_LEN0:
         case R_TX_LEN1:
+            r = s->port[port_index].reg.tx_len;
+            break;
+
         case R_TX_CTRL1:
         case R_TX_CTRL0:
             r = s->regs[addr];
@@ -171,7 +175,7 @@ eth_write(void *opaque, hwaddr addr,
             if ((value & (CTRL_P | CTRL_S)) == CTRL_S) {
                 qemu_send_packet(qemu_get_queue(s->nic),
                                  txbuf_ptr(s, port_index),
-                                 s->regs[base + R_TX_LEN0]);
+                                 s->port[port_index].reg.tx_len);
                 if (s->regs[base + R_TX_CTRL0] & CTRL_I)
                     eth_pulse_irq(s);
             } else if ((value & (CTRL_P | CTRL_S)) == (CTRL_P | CTRL_S)) {
@@ -196,7 +200,7 @@ eth_write(void *opaque, hwaddr addr,
 
         case R_TX_LEN0:
         case R_TX_LEN1:
-            s->regs[addr] = value;
+            s->port[port_index].reg.tx_len = value;
             break;
 
         case R_TX_GIE0:
-- 
2.45.2

