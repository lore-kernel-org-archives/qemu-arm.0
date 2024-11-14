Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp550453njc;
        Thu, 14 Nov 2024 13:02:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXf0Dc7W9KTNWuCTSDBddMS7675vfHLvFUBjAbdYELj6Fy9ryZF62Q2N7T3kFxAXb6YE2FAd9IAL85tAw==@linaro.org
X-Google-Smtp-Source: AGHT+IGjFhQSienCW8ksEe/49zOdNROLqKX7/JD8tELk1F7F6SqvAG3tsqapdl3yANfob0yTtI4x
X-Received: by 2002:a05:6102:3749:b0:4a5:e5e5:f929 with SMTP id ada2fe7eead31-4ad630bd9f0mr533275137.13.1731618150281;
        Thu, 14 Nov 2024 13:02:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731618150; cv=none;
        d=google.com; s=arc-20240605;
        b=NhVuEGV+bz4GT2MgDvI00d0/Gy72f+zAx+vvml89/yAPwJk/8jRPUp37felAEqFvZX
         tMaSKPXqwfolJDecva5ph5bu0dTOWL647t5SFmRlvZbd5eM5kKs1Z8w8bZvr8mZVakMx
         TQIEm7Bl6s+2BMdRgHX7uz0+SyrWRBhMdJl2gZESj5V0GARK0RdPLw8kiLTzFbj9e1Mm
         2GGpwICaoLluwqYu1WguEIEAWImeo87xdC/ICF5JejmNdYJCWQ2tngpFX0PYgZJXeOl1
         Hop83AU3/KJMaDhy0wMUeLkktcA02x+kKF9eHYufeBpjF/0b3i9TUEtStHHAYBX03r/r
         QG9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WHsXd+6nklg/Fen/qM8UGXgjnDFu4CazQunEUxBn5NI=;
        fh=5hiHHW8q9bzAOIUVQfBbLxG/aC+ZhOWwaw+svlmfKao=;
        b=NEQD/Dn4Tzl8q8sKdjdZ/9Gf0HSd1xrAgFzYW9DvZUfTUfJ5p9avAuvTeZGr9aIo3R
         jNgnumDoyTeS2WPwuzCqiMHRa1qn1ptvyZXoD8l5NEPcgeoGu4/C6cTxOgEnAtR0ShYV
         QlXHMzAA3rbrMhrsYVXsOndydjCd5nXJ3itb7fjJxnyrYEFz4UC3z38p2UicJczSbnF1
         WAMF1K1iXmnLsBOKzKyN4RT0iVH5LnASKEsKJoDnzyWcm5Hp6bXE5cG9iDKtVp3M7Yjh
         qU44Pd5XPu1Y5IWJyQKQpBzaf2vZsTarWwIqnscKm5bTRfFfhi4vUrBihi2jLTq+CZL8
         IoIw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mb9848ZR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4ad64867e2fsi6563137.250.2024.11.14.13.02.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2024 13:02:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mb9848ZR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBgyg-0002k4-VH; Thu, 14 Nov 2024 16:02:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBgyc-0002Te-Nc
 for qemu-arm@nongnu.org; Thu, 14 Nov 2024 16:02:06 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBgya-00088r-Od
 for qemu-arm@nongnu.org; Thu, 14 Nov 2024 16:02:06 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-432d86a3085so9929595e9.2
 for <qemu-arm@nongnu.org>; Thu, 14 Nov 2024 13:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731618123; x=1732222923; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WHsXd+6nklg/Fen/qM8UGXgjnDFu4CazQunEUxBn5NI=;
 b=Mb9848ZRBfIgcRmkLoRzj/OJ7cmWmcTKAzeSn4hKOxguOdYAmfvO3hlZc48C+6t26U
 dKK6Pqcte53LY5N9auqAcYL9vdNfEpkeTyoH1Pvm7ifeN1/h26D2UUczBj9XEG625HIy
 qGzhNArFKhTpvFqCrhE7fJtOXKBIUPmOfoX4o+bq4h0qE+HweHJYiC39PomhumOdeUB3
 JzSX5gzulXBnGHxcRyPsu6BdP4BfXuoCT14kue2mh64LgCxhHGCoc1ppx4sI+N4k6BQV
 j9CmOdHDj7yjW87yZmZdCzXRkVBT9dLdKMpaeZiSvTyL1YKrIRbK/1R8haqXP0UNPaey
 FoKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731618123; x=1732222923;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WHsXd+6nklg/Fen/qM8UGXgjnDFu4CazQunEUxBn5NI=;
 b=eDnzbaz3QNpP8Z+SzQlno9Y9ytx2b8CyAs/p+E9zBf9X89nvS8AK86mb9SJm/yMsa+
 4rebE0C944WjoD+B/eqswdC9HPBlZbno7DQ/Twz4jFmzOV0bU2Y1BwHtJoxqzb3U4cau
 sEXROS0dgKwccWETDe5EVpGF0Fxnmq22wZ4RhYAXPLCkQn5y1QFFsGT6rgOiaauPME5k
 1juq/Mq45AugSwZLHnTPDk42lnXAJYkpoGL9lRu8Lch7KYxeZd0R0smxMYATrxDX+wNc
 kIAiR+Gk1ZvDCUP2TGQqNgjRgGIOy7nZlGk0ZnLkBDvovJ6qoA9GLpHMSfRMw7PPRw9d
 15Gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgBYvNGBveEnhU0a8piT86ts1Q2IsRQxpmEP/9wLy/Jwn+I2y1poiGaPnkr4qoxzhku/rlfSLMrQ==@nongnu.org
X-Gm-Message-State: AOJu0YxIylEeV8STTcV+zJEfcQus6jzCLQjPKT3pdhfMFJx101LeSI2W
 65n/MNOytDGFY62+FWo+BUCcC8HZL4wXjgVJwI2UERlKP8sugf1XSW94IHYM6w8E31i4qNfOtu0
 1
X-Received: by 2002:a05:600c:34c3:b0:42f:8229:a0a1 with SMTP id
 5b1f17b1804b1-432df793c74mr1277045e9.33.1731618123191; 
 Thu, 14 Nov 2024 13:02:03 -0800 (PST)
Received: from localhost.localdomain ([176.187.209.228])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821ae313a8sm2402592f8f.105.2024.11.14.13.01.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 14 Nov 2024 13:02:01 -0800 (PST)
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
Subject: [PATCH RESEND v2 14/19] hw/net/xilinx_ethlite: Map TX_LEN as MMIO
Date: Thu, 14 Nov 2024 22:00:05 +0100
Message-ID: <20241114210010.34502-15-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114210010.34502-1-philmd@linaro.org>
References: <20241114210010.34502-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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
X-TUID: Z27emd8YPMaL

Declare TX registers as MMIO region, split it out
of the current mixed RAM/MMIO region.

The memory flat view becomes:

  (qemu) info mtree -f
  FlatView #0
   Root memory region: system
    0000000081000000-00000000810007e3 (prio 0, i/o): xlnx.xps-ethernetlite
    00000000810007e4-00000000810007f3 (prio 0, i/o): ethlite.mdio
    00000000810007f4-00000000810007f7 (prio 0, i/o): ethlite.tx[0]io
    00000000810007f8-0000000081000ff3 (prio 0, i/o): xlnx.xps-ethernetlite @00000000000007f8
    0000000081000ff4-0000000081000ff7 (prio 0, i/o): ethlite.tx[1]io
    0000000081000ff8-00000000810017fb (prio 0, i/o): xlnx.xps-ethernetlite @0000000000000ff8
    00000000810017fc-00000000810017ff (prio 0, i/o): ethlite.rx[0]io
    0000000081001800-0000000081001ffb (prio 0, i/o): xlnx.xps-ethernetlite @0000000000001800
    0000000081001ffc-0000000081001fff (prio 0, i/o): ethlite.rx[1]io

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/net/xilinx_ethlite.c | 73 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 61 insertions(+), 12 deletions(-)

diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index d8f5a06182..b105fb7524 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -41,11 +41,11 @@
 #define R_TX_BUF0     0
 #define BUFSZ_MAX      0x07e4
 #define A_MDIO_BASE    0x07e4
-#define R_TX_LEN0     (0x07f4 / 4)
+#define A_TX_BASE0     0x07f4
 #define R_TX_GIE0     (0x07f8 / 4)
 #define R_TX_CTRL0    (0x07fc / 4)
 #define R_TX_BUF1     (0x0800 / 4)
-#define R_TX_LEN1     (0x0ff4 / 4)
+#define A_TX_BASE1     0x0ff4
 #define R_TX_CTRL1    (0x0ffc / 4)
 
 #define R_RX_BUF0     (0x1000 / 4)
@@ -54,6 +54,11 @@
 #define A_RX_BASE1     0x1ffc
 #define R_MAX         (0x2000 / 4)
 
+enum {
+    TX_LEN =  0,
+    TX_MAX
+};
+
 enum {
     RX_CTRL = 0,
     RX_MAX
@@ -67,6 +72,7 @@ enum {
 
 typedef struct XlnxXpsEthLitePort
 {
+    MemoryRegion txio;
     MemoryRegion rxio;
 
     struct {
@@ -126,6 +132,52 @@ static void *rxbuf_ptr(XlnxXpsEthLite *s, unsigned port_index)
     return &s->regs[rxbase + R_RX_BUF0];
 }
 
+static uint64_t port_tx_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    XlnxXpsEthLite *s = opaque;
+    unsigned port_index = addr_to_port_index(addr);
+    uint32_t r = 0;
+
+    switch (addr >> 2) {
+        case TX_LEN:
+            r = s->port[port_index].reg.tx_len;
+            break;
+        default:
+            g_assert_not_reached();
+    }
+
+    return r;
+}
+
+static void port_tx_write(void *opaque, hwaddr addr, uint64_t value,
+                          unsigned int size)
+{
+    XlnxXpsEthLite *s = opaque;
+    unsigned port_index = addr_to_port_index(addr);
+
+    switch (addr >> 2) {
+        case TX_LEN:
+            s->port[port_index].reg.tx_len = value;
+            break;
+        default:
+            g_assert_not_reached();
+    }
+}
+
+static const MemoryRegionOps eth_porttx_ops = {
+        .read = port_tx_read,
+        .write = port_tx_write,
+        .endianness = DEVICE_NATIVE_ENDIAN,
+        .impl = {
+            .min_access_size = 4,
+            .max_access_size = 4,
+        },
+        .valid = {
+            .min_access_size = 4,
+            .max_access_size = 4,
+        },
+};
+
 static uint64_t port_rx_read(void *opaque, hwaddr addr, unsigned int size)
 {
     XlnxXpsEthLite *s = opaque;
@@ -190,11 +242,6 @@ eth_read(void *opaque, hwaddr addr, unsigned int size)
             r = s->port[port_index].reg.tx_gie;
             break;
 
-        case R_TX_LEN0:
-        case R_TX_LEN1:
-            r = s->port[port_index].reg.tx_len;
-            break;
-
         case R_TX_CTRL1:
         case R_TX_CTRL0:
             r = s->port[port_index].reg.tx_ctrl;
@@ -240,11 +287,6 @@ eth_write(void *opaque, hwaddr addr,
             break;
 
         /* Keep these native.  */
-        case R_TX_LEN0:
-        case R_TX_LEN1:
-            s->port[port_index].reg.tx_len = value;
-            break;
-
         case R_TX_GIE0:
             s->port[port_index].reg.tx_gie = value;
             break;
@@ -333,6 +375,13 @@ static void xilinx_ethlite_realize(DeviceState *dev, Error **errp)
                            sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->mdio), 0));
 
     for (unsigned i = 0; i < 2; i++) {
+        memory_region_init_io(&s->port[i].txio, OBJECT(dev),
+                              &eth_porttx_ops, s,
+                              i ? "ethlite.tx[1]io" : "ethlite.tx[0]io",
+                              4 * TX_MAX);
+        memory_region_add_subregion(&s->mmio, i ? A_TX_BASE1 : A_TX_BASE0,
+                                    &s->port[i].txio);
+
         memory_region_init_io(&s->port[i].rxio, OBJECT(dev),
                               &eth_portrx_ops, s,
                               i ? "ethlite.rx[1]io" : "ethlite.rx[0]io",
-- 
2.45.2

