Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7535293njc;
        Tue, 12 Nov 2024 10:13:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXAhWL76xppXj/VcHFam4ABmwU9AABb5m8H1P//EqDOXmuZ5nRzszN3zAksJDxc1tUwSpv8MmI2Z4aQmg==@linaro.org
X-Google-Smtp-Source: AGHT+IH8w1hysLjDl0TFgoS7gKUM2EqEH/8pOiNZ56TnawtmBTOh7E9KxCjQzWgnjczigFS/9h+C
X-Received: by 2002:a05:6214:5b11:b0:6d1:72f5:bc6c with SMTP id 6a1803df08f44-6d39e12e332mr224768626d6.22.1731435212637;
        Tue, 12 Nov 2024 10:13:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731435212; cv=none;
        d=google.com; s=arc-20240605;
        b=B5z2SmwpgJQoWO+583lEgIH+w0x2Hx1nL4uaSaYAOshdwPsdWiFdWq+7PEZTGu7x3c
         rbRgt59UFkwUQET5ouORmLgACjkSjTrJz/cgxiBPcD74CpYjAAvv0ltJ+mo5ypkmNEKO
         TXqIvhCJeo4e9nAFYKZVyjp0nN12ML8GmEsbs2lw8wfCqj+fj+2pqEC8z9e0qLijnAxU
         ZloovMxLi2Z3xWLHWbB+QO00CSVyBvtZSR4SeHYF15OOMJ8e14WTjgONEuiB+IyzfWlQ
         g9PDu55587Sdpe6l9jfcn9srQeZN81t1V5++BbVnbwkx7mJ2X9+WBD0EEkjzToJTfeRp
         SflQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vGBo3n6UAnKrx1s/4bgTSsf0dXQKvd5mL1bf1mP4VKA=;
        fh=B8QF6b1AkwR8AyD7rbwD2nrsqCCCJgXpTiY48dkoYaM=;
        b=F+NUhPxnpu/VRH2yStsSEyuxbEFY2648eEHTULM7KLuHrm7PyjmR/5Ud0w5vKcCcSe
         Ur9dUGyMO43d3fQuncTyeaiB+xtXRyomFS8kw54Nb6AvzhwTBt+nxIAHbVo7aaEkdZJK
         jXhQq/AUudkIwbW2bJnhhemMKhoDx+TgHIWAhV5O/pdOTMP0fQhITsH5j1Y6p0tEv/mO
         FIc1zw4U380TFuW+z1OYG1n/pj+Hg40QUB5hKuXIxApRXlbnEK6VpMdkfQcT4pA0Tjiq
         8ObTo4GPGFHfYzgw/ho0hoEp3uvGjc4EvctTYbNkYw/Dh4A9CWpHQjeA4et4fWbJI9eI
         A5mg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qBkdv6jy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d3962106c1si144341056d6.63.2024.11.12.10.13.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 10:13:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qBkdv6jy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAvNg-0007pQ-B0; Tue, 12 Nov 2024 13:12:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tAvNO-0006u1-NL
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 13:12:30 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tAvNL-00022F-4h
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 13:12:30 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-37d3e8d923fso4224723f8f.0
 for <qemu-arm@nongnu.org>; Tue, 12 Nov 2024 10:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731435145; x=1732039945; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vGBo3n6UAnKrx1s/4bgTSsf0dXQKvd5mL1bf1mP4VKA=;
 b=qBkdv6jyWCtN8zjpBJWyuWiJX8yGSfdNNvIj9VLOoCk+sxL7ADaniBmSLhIEa5DQ1/
 Vypk9eUNaBhsCgj3aagxVVPuJuQFvk4SXo0kVZTtNxm59phJfY8TZyOCGOToQckUET5U
 mWWf7vCydBRjY+XhosN6ikG3Cv6FeQiic7vDk+yT3E/Nm3x/FRQq5sytVx+BhRfwaF/N
 JrjIhh7P+Qj2/A2l5M3VBkSeG82108Qx5qJ05Ae2MmGRUZRCSTvT9nQxN7QXbhTxVrPJ
 LRvTVyqCw/iDYlNBoOsm+4BnZ0wib39+5N64e7BEn8H0+8izT3NGnq0nNAM2bAN7Id+Q
 A9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731435145; x=1732039945;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vGBo3n6UAnKrx1s/4bgTSsf0dXQKvd5mL1bf1mP4VKA=;
 b=PAMHmP2xRj2x/XsY9EMj/q7GoX18So0n1y0yi+uCMQXrBAXusjIBNXTZgoDtocL+bo
 Yb+JR+T8UsPR9bqekZk0tBl7dpDczX9cVhd3aAM+pc3Z1wYUatRAsX9nY9jMUkjbA+Yu
 oPUrH4A0QGtKEcVLVpIgpbk8Hd0VUw2siuJdDyBcFUEO6lBV6UqvBl94l2+CyfujsZ+y
 PgIbZGTmnpDz1yfGzbXJzucj3TNgH+4m8Zb6MJvEO+jSXerJWordeb1ttMf/0Yjz2Wcn
 a965AD4AJ+HJITC81O3zy3QOZyMu6UxiaTYnigxdN7jc05372ZBBgM6PI9HE8uvLrKBP
 hq4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHlx1q3Xieyf0Ds+m++Skm2n6tkGTTc8IZg4CIehjR/BHjxbMPsCZ0wzEbddwOvW3A1sT7qkww8A==@nongnu.org
X-Gm-Message-State: AOJu0Yx1ArNaIE2p7dS4f7np2xuxHXy39jXh92MslJsdJ0IukFnS39Hu
 V3HaZgohiV11PIowdf7WvjoFlnNMWPS5c7dDBznk/ScdzpvyaGKSAzwLFCeN3J8=
X-Received: by 2002:a5d:6484:0:b0:37e:d92f:c14a with SMTP id
 ffacd0b85a97d-381f188583bmr13802823f8f.42.1731435145331; 
 Tue, 12 Nov 2024 10:12:25 -0800 (PST)
Received: from localhost.localdomain
 (cnf78-h01-176-184-27-250.dsl.sta.abo.bbox.fr. [176.184.27.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381fc0f5f91sm7530136f8f.62.2024.11.12.10.12.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Nov 2024 10:12:24 -0800 (PST)
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
Subject: [PATCH 16/20] hw/net/xilinx_ethlite: Map TX_LEN as MMIO
Date: Tue, 12 Nov 2024 19:10:40 +0100
Message-ID: <20241112181044.92193-17-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241112181044.92193-1-philmd@linaro.org>
References: <20241112181044.92193-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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
X-TUID: 1zw+A4cZ3SbC

Declare TX registers as MMIO region, split it out
of the current mixed RAM/MMIO region.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/xilinx_ethlite.c | 71 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 59 insertions(+), 12 deletions(-)

diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index 161fd97f06..159b2b0c64 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -38,11 +38,11 @@
 #define A_MDIO_BASE   0x07e4
 
 #define R_TX_BUF0     0
-#define R_TX_LEN0     (0x07f4 / 4)
+#define A_TX_BASE0    0x07f4
 #define R_TX_GIE0     (0x07f8 / 4)
 #define R_TX_CTRL0    (0x07fc / 4)
 #define R_TX_BUF1     (0x0800 / 4)
-#define R_TX_LEN1     (0x0ff4 / 4)
+#define A_TX_BASE1    0x0ff4
 #define R_TX_CTRL1    (0x0ffc / 4)
 
 #define R_RX_BUF0     (0x1000 / 4)
@@ -53,6 +53,11 @@
 
 #define RX_BUFSZ_MAX  0x07e0
 
+enum {
+    TX_LEN =  0,
+    TX_MAX
+};
+
 enum {
     RX_CTRL = 0,
     RX_MAX
@@ -125,6 +130,51 @@ static void *rxbuf_ptr(XlnxXpsEthLite *s, unsigned port_index)
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
@@ -187,11 +237,6 @@ eth_read(void *opaque, hwaddr addr, unsigned int size)
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
@@ -237,11 +282,6 @@ eth_write(void *opaque, hwaddr addr,
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
@@ -330,6 +370,13 @@ static void xilinx_ethlite_realize(DeviceState *dev, Error **errp)
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

