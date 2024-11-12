Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7535798njc;
        Tue, 12 Nov 2024 10:14:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUngYmZttDIND6chDuf/iZmrdWx4t+dvTLIaPYJaHd39BsbNScTaKBfRPo9tkabxdza7lAhLe3kBd8V6A==@linaro.org
X-Google-Smtp-Source: AGHT+IHv5Fk3Ra4ioQC+06MS5CsiKTli3krOKL3AHL6GDcji0eQNOPWaUjNvZduJEg/DvKKxVFCU
X-Received: by 2002:a05:6102:cc6:b0:4a7:4c73:974e with SMTP id ada2fe7eead31-4aae11ca5ddmr16608423137.0.1731435255733;
        Tue, 12 Nov 2024 10:14:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731435255; cv=none;
        d=google.com; s=arc-20240605;
        b=fzRmItLR8nJzJjOy+GezNeClBvt7TxafkdbfQDZrSnHZfocwcblf7G1WM/pp7oyHCx
         yWJBt8o7cBdKjOpQ2CkBOi8cwc5b+US5yCPTfU1XxRJlTlIyM114rYOFhTVB+ApfQc+B
         WLz2vs1BVZZkzVC3afAYbJAB4HACavE2k+VpkUt5KqkSLP7Bt+btt9+msqQPYeWXjPtO
         UQ/iOQBt9HDGa7xJOdQetClHAMni1YjGCd2P9N6uQGsnCq238PEJfWgs02YsIsfuVt4h
         LF+zhd7OGmKS1JR17/bGTNJJrpXG0R0VAGanYXXZL4qPe5MOF307plWVBQTn3H8/tRj+
         qScA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=33ai2lENeDpCfbtpntzIEqfDXZ63d2DBrrpSSg3fCCg=;
        fh=/NYlY+uCRvd+wcChiz/ta1RuYFDAZ5iRsu5G5ybazoc=;
        b=U9Dhwb0O02OinfEkErrg7uYYbr+wEt3/K73R8B8a0wkQdkcqXQE+IwOLSxsw34PRZp
         2lkoAs+7uK96IwVUtFy0q5zpGg0am5kNAm2QrkwN94awSRRAjX6QI6aszhAwXScoHAKf
         ff/SB/DvA7m/G6V8tW+M8Fz6f+cesIxz4uacx7TzNC7VKeeKPgYbPr5kEfn/6itcdkx8
         naxj4mXH60i17CESdc2ay0Ourgp/3opdSAaFQZpsYqQrCeOrYzChB5IaxAyOPajE43MQ
         4FyVcFnH2c2trQOdMmflXQpN+Xuzgs4Tg2PyxSX12HYC1UA+FV5AmwiJJmH1pDfvZetL
         09Og==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y3L9CiDN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4aa97d3518bsi3703321137.74.2024.11.12.10.14.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 10:14:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y3L9CiDN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAvNV-00070F-8y; Tue, 12 Nov 2024 13:12:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tAvNG-00069i-J9
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 13:12:22 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tAvNE-00021q-TI
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 13:12:22 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-37d533b5412so4115515f8f.2
 for <qemu-arm@nongnu.org>; Tue, 12 Nov 2024 10:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731435139; x=1732039939; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=33ai2lENeDpCfbtpntzIEqfDXZ63d2DBrrpSSg3fCCg=;
 b=Y3L9CiDNfV+OM23aekSPqhFEtu4gvBB+r/uRNW8dYTQFWTFRJeHg6v1t3X/egn8tj3
 QVEQ7Uhs+3wsDuhv7GwQFpk6o7qs8hGnJDNjnQvCPjW450Ppwj5+73pkPyxe86IY2wya
 W3c4i8NKIQ4Xun9srLa2iGIxiLPNJ4e+KyBk8WZB790GgP9sRY52VmCHDt0btrYmeGoW
 QD/BZCbZYAfay0lcEvIqeLmGGgji8VwywkVXVB9e5TxiTw3s3BWv5eaaVw3eqN9Uv3JS
 xSxdh5yCrjZtA5XL6AfGQwNjvM35wq1wCSaC2+V1LzVzPYVPNUVdPrrI4Tbb8agdBhNa
 fKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731435139; x=1732039939;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=33ai2lENeDpCfbtpntzIEqfDXZ63d2DBrrpSSg3fCCg=;
 b=lY87KO/2ZpGAxqeA+/y8m5/rZz9LJ8I0MKOaGqNcR0lBZdd9Ju4fqzIoSTZ5ezNwnK
 lTO1NBpVjJD6PK3oeuduhe0EGO4zTtxGgqLupCdQZg88sqoEbu+8UTR5MKYqQOQfluQH
 6VL9bLwBtucjalHBWZEJ6dxTBHEdzX4xGvDC5sIyiRkK0uZM/226V4IltviWDuyO9+wh
 ijS8fyS2NyWeaP2Rn5usd686IB/eNHIT95eFBm+dRmGdvAKfmLK/MRUhdgv5P440VNxS
 vfJ3HE46AlOCBJ1/I+PI1qJf1kWSyLOUQlddzIz5A6riHajO2m2D3BB/TJJb8xJOJZvR
 G/XA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+0nL+yQt0t7sr/mqwnng1JvWMUKw7fcRgdmWXt9aDhfsT7nIQeo1zfi0Vrx6gZOq/7XJPqqEFEQ==@nongnu.org
X-Gm-Message-State: AOJu0YwraY/Jg07bcfNJoCzE54FcdhIz8pqjnJqBdwi81aowLuZYnLH/
 KRy3TX9gOMdeAux9zeDj7E8tzdjldidq7o3ER0nvWRw8qL4gPBQQ9hslkNHibNU=
X-Received: by 2002:a05:6000:4107:b0:381:f604:30c2 with SMTP id
 ffacd0b85a97d-381f6043253mr12399576f8f.35.1731435139511; 
 Tue, 12 Nov 2024 10:12:19 -0800 (PST)
Received: from localhost.localdomain
 (cnf78-h01-176-184-27-250.dsl.sta.abo.bbox.fr. [176.184.27.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed97071esm15832992f8f.12.2024.11.12.10.12.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Nov 2024 10:12:18 -0800 (PST)
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
Subject: [PATCH 15/20] hw/net/xilinx_ethlite: Map RX_CTRL as MMIO
Date: Tue, 12 Nov 2024 19:10:39 +0100
Message-ID: <20241112181044.92193-16-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241112181044.92193-1-philmd@linaro.org>
References: <20241112181044.92193-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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
X-TUID: yh3rJLAWXTDp

Declare RX registers as MMIO region, split it out
of the current mixed RAM/MMIO region.
The memory flat view becomes:

  FlatView #0
   Root memory region: system
    0000000081000000-00000000810007e3 (prio 0, i/o): xlnx.xps-ethernetlite
    00000000810007e4-00000000810007f3 (prio 0, i/o): ethlite.mdio
    00000000810007f4-00000000810017fb (prio 0, i/o): xlnx.xps-ethernetlite @00000000000007f4
    00000000810017fc-00000000810017ff (prio 0, i/o): ethlite.rx[0]io
    0000000081001800-0000000081001ffb (prio 0, i/o): xlnx.xps-ethernetlite @0000000000001800
    0000000081001ffc-0000000081001fff (prio 0, i/o): ethlite.rx[1]io

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/xilinx_ethlite.c | 79 +++++++++++++++++++++++++++++++++--------
 1 file changed, 65 insertions(+), 14 deletions(-)

diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index 4d86851f38..161fd97f06 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -46,13 +46,18 @@
 #define R_TX_CTRL1    (0x0ffc / 4)
 
 #define R_RX_BUF0     (0x1000 / 4)
-#define R_RX_CTRL0    (0x17fc / 4)
+#define A_RX_BASE0    0x17fc
 #define R_RX_BUF1     (0x1800 / 4)
-#define R_RX_CTRL1    (0x1ffc / 4)
+#define A_RX_BASE1    0x1ffc
 #define R_MAX         (0x2000 / 4)
 
 #define RX_BUFSZ_MAX  0x07e0
 
+enum {
+    RX_CTRL = 0,
+    RX_MAX
+};
+
 #define GIE_GIE    0x80000000
 
 #define CTRL_I     0x8
@@ -61,6 +66,8 @@
 
 typedef struct XlnxXpsEthLitePort
 {
+    MemoryRegion rxio;
+
     struct {
         uint32_t tx_len;
         uint32_t tx_gie;
@@ -118,6 +125,53 @@ static void *rxbuf_ptr(XlnxXpsEthLite *s, unsigned port_index)
     return &s->regs[rxbase + R_RX_BUF0];
 }
 
+static uint64_t port_rx_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    XlnxXpsEthLite *s = opaque;
+    unsigned port_index = addr_to_port_index(addr);
+    uint32_t r = 0;
+
+    switch (addr >> 2) {
+        case RX_CTRL:
+            r = s->port[port_index].reg.rx_ctrl;
+            break;
+        default:
+            g_assert_not_reached();
+    }
+
+    return r;
+}
+
+static void port_rx_write(void *opaque, hwaddr addr, uint64_t value,
+                          unsigned int size)
+{
+    XlnxXpsEthLite *s = opaque;
+
+    switch (addr >> 2) {
+        case RX_CTRL:
+            if (!(value & CTRL_S)) {
+                qemu_flush_queued_packets(qemu_get_queue(s->nic));
+            }
+            break;
+        default:
+            g_assert_not_reached();
+    }
+}
+
+static const MemoryRegionOps eth_portrx_ops = {
+        .read = port_rx_read,
+        .write = port_rx_write,
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
 static uint64_t
 eth_read(void *opaque, hwaddr addr, unsigned int size)
 {
@@ -143,10 +197,6 @@ eth_read(void *opaque, hwaddr addr, unsigned int size)
             r = s->port[port_index].reg.tx_ctrl;
             break;
 
-        case R_RX_CTRL1:
-        case R_RX_CTRL0:
-            r = s->port[port_index].reg.rx_ctrl;
-
         default:
             r = tswap32(s->regs[addr]);
             break;
@@ -187,14 +237,6 @@ eth_write(void *opaque, hwaddr addr,
             break;
 
         /* Keep these native.  */
-        case R_RX_CTRL0:
-        case R_RX_CTRL1:
-            if (!(value & CTRL_S)) {
-                qemu_flush_queued_packets(qemu_get_queue(s->nic));
-            }
-            s->port[port_index].reg.rx_ctrl = value;
-            break;
-
         case R_TX_LEN0:
         case R_TX_LEN1:
             s->port[port_index].reg.tx_len = value;
@@ -287,6 +329,15 @@ static void xilinx_ethlite_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(&s->mmio, A_MDIO_BASE,
                             sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->mdio), 0));
 
+    for (unsigned i = 0; i < 2; i++) {
+        memory_region_init_io(&s->port[i].rxio, OBJECT(dev),
+                              &eth_portrx_ops, s,
+                              i ? "ethlite.rx[1]io" : "ethlite.rx[0]io",
+                              4 * RX_MAX);
+        memory_region_add_subregion(&s->mmio, i ? A_RX_BASE1 : A_RX_BASE0,
+                                    &s->port[i].rxio);
+    }
+
     qemu_macaddr_default_if_unset(&s->conf.macaddr);
     s->nic = qemu_new_nic(&net_xilinx_ethlite_info, &s->conf,
                           object_get_typename(OBJECT(dev)), dev->id,
-- 
2.45.2

