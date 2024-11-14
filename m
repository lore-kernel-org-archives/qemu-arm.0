Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp550210njc;
        Thu, 14 Nov 2024 13:02:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW7augqQ9e3bfCoHgXiyxD8Iw6+TMTFPumpYTkwtKV9k1nPUL0IG0Wm2LsW9zqy6wC6gmvIogmUy9PmrA==@linaro.org
X-Google-Smtp-Source: AGHT+IF3kDLME1Gs2eGbL9yiZ6Ai66HR+xnBN06tQwzk9nqDoRPuXyi5rJOhB74YwZ2h6R/3/qJd
X-Received: by 2002:a05:622a:4083:b0:458:22fa:190d with SMTP id d75a77b69052e-46363e9734amr3224731cf.37.1731618131650;
        Thu, 14 Nov 2024 13:02:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731618131; cv=none;
        d=google.com; s=arc-20240605;
        b=JbL+HjuISLRKwaOipBZSTvO9nBqudHmmBXfGlissQb5XNEGbXE6PWS+aNnNs+EePwc
         m8ojnANrRjv3i8vpIgTV0NcLz1LxTdxQJbH4g6Ct2UecSu664DwxQ3eRqLM36GWFSOqq
         OQag+CFdJrJHCKYlh+zEuT/D1YlKsNea9hvFd/QDh/D3p4pdBmLx0gcHkfCGDLAl6csH
         4+jyDaKJbvsFfirOe8yLkg7RwJcpSPevUTmshoURzxTO98blMVf1kskdXz2m+ruUkOqN
         GPiWQHS/DW+FNVoEBSQezAcPK+hIY8xVSNLscbAwkGFPqqKtLHC26BnOYCSJIkrB/xTF
         S24g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LMLXteKzNxHurRj29HFY+TepUdXjvjn4u+eJ/Foyx5Y=;
        fh=GmyOkueckRdCSnKhEKXYuxeEi94+j+AvyVwsAd+4zRE=;
        b=VPLCH2FHH7iT0EoznepJwF+9MjvnGFsJc0cLB8mYEbNbhEr+G9Rypl3tDlr7Q23i27
         gj2qBZ5zgc4pe4hZeeugYA8Z91JXY/as9Uk40hcAjwG0P9nC7HKqQactg3iTDTG5X9/g
         h+KUHRIyBctrUbRjJDudtL2PhDMyi9VXGwgHCZmXJfeYzRGbv7GVKERX4RPk6Elewzrx
         eKrKTZc4cGG6GS6jmoe1P5Zar8QPBF1I0N3dJEN+vbZZ5vKUVYYtSb6i6VEmsH0rKBFF
         LP1sL9txoX8mGRyfM6SPps5v58DAhiEOjvYDE15Cd4jEanJglS4YoWzhY/DeMrNiLsRa
         0K1g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QXR8PiYR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4635a9872f9si18059141cf.132.2024.11.14.13.02.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2024 13:02:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QXR8PiYR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBgyX-000296-B7; Thu, 14 Nov 2024 16:02:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBgyU-0001yJ-TI
 for qemu-arm@nongnu.org; Thu, 14 Nov 2024 16:01:58 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBgyS-00087i-Vs
 for qemu-arm@nongnu.org; Thu, 14 Nov 2024 16:01:58 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-37d4fd00574so649558f8f.0
 for <qemu-arm@nongnu.org>; Thu, 14 Nov 2024 13:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731618115; x=1732222915; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LMLXteKzNxHurRj29HFY+TepUdXjvjn4u+eJ/Foyx5Y=;
 b=QXR8PiYRp/nNe2kza3DZTzPsMSADTAzU5bqFSK3aZZFKmCPQ7sd4ucNt96VS+HkZuI
 KhDgueRTCFK5cFAUUG8PNaVfcYRJhh94bNW2f8pbAFkYMlkLhicWQj/6DzsjaBqI2QpH
 kGIJ/yEsWXgBui0cUVnMIj84SKFMu9P75XVwW30MnEn7z/97UvgQxB/hNLQZUmxt+8rr
 0vMY/N2AMeQwoImM1s28G/q4A92bQo6WfxPmlRs7sm/u68r2lRzOLgjCFdLZcpCtx2Vu
 7Z80rwsmt+C4DJx4OZz6/MobKKFlIXiHl/WfMz0SVv9YHcRNC8RLF5O3Lr42hcWivyz9
 x3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731618115; x=1732222915;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LMLXteKzNxHurRj29HFY+TepUdXjvjn4u+eJ/Foyx5Y=;
 b=KDyvjCG4eE1sqeKD5D4bUqqOzPsGrpBj5oNdgyxKPvcfWmFpS0RyhW4+KIILr3HCOn
 VdeMS3PfKgotQhdOxty/x/bbxZ4a2GZR5oGtaI6O6T1z7MovYzRt3fm9WfQ7kcbrHUTQ
 EaiDrkZwfWOiIgYE4xt2SgA/m+u6W7GxIjGvHCTX5O1+UyNg/WDppkEhooB3usGB8U0t
 XFSYYNuExaJk+zZax8GbX9ptUAxKGTj51+u4y9yGa8a0L6BH2Dve2BjZAvrIEi4Hd075
 fmlHfyDWbb3BDDZQvqwqlwbD5zVX+rjry9tCkIj57ikL7kaG6qi6RN6neG7/uuB/LeTT
 6A6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoyzWG7wIKOYQ9mI2azKc192z0OeXAEPPeWqN01cczp06BtRZwt9t32xIyM2iK4J8th7RIojlI/A==@nongnu.org
X-Gm-Message-State: AOJu0YzSeX5J1o8cpoNaNU+vzGP3d4lefzBkqNb4nKK88RR+cUQK/dPM
 Rh5iklFZ5FnHhv9J4zteor41egVtre71aH/s3K4ZzUoHhV3UQRpONBL+LAL4I5I=
X-Received: by 2002:a5d:5c0f:0:b0:37c:ffdd:6d5a with SMTP id
 ffacd0b85a97d-38224e54560mr447248f8f.6.1731618115295; 
 Thu, 14 Nov 2024 13:01:55 -0800 (PST)
Received: from localhost.localdomain ([176.187.209.228])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821d0ea3e2sm2085593f8f.109.2024.11.14.13.01.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 14 Nov 2024 13:01:54 -0800 (PST)
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
Subject: [PATCH RESEND v2 13/19] hw/net/xilinx_ethlite: Map RX_CTRL as MMIO
Date: Thu, 14 Nov 2024 22:00:04 +0100
Message-ID: <20241114210010.34502-14-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114210010.34502-1-philmd@linaro.org>
References: <20241114210010.34502-1-philmd@linaro.org>
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
X-TUID: +hl/UvwU9ek3

Declare RX registers as MMIO region, split it out
of the current mixed RAM/MMIO region.
The memory flat view becomes:

  (qemu) info mtree -f
  FlatView #0
   Root memory region: system
    0000000081000000-00000000810007e3 (prio 0, i/o): xlnx.xps-ethernetlite
    00000000810007e4-00000000810007f3 (prio 0, i/o): ethlite.mdio
    00000000810007f4-00000000810017fb (prio 0, i/o): xlnx.xps-ethernetlite @00000000000007f4
    00000000810017fc-00000000810017ff (prio 0, i/o): ethlite.rx[0]io
    0000000081001800-0000000081001ffb (prio 0, i/o): xlnx.xps-ethernetlite @0000000000001800
    0000000081001ffc-0000000081001fff (prio 0, i/o): ethlite.rx[1]io

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/xilinx_ethlite.c | 82 +++++++++++++++++++++++++++++++++--------
 1 file changed, 67 insertions(+), 15 deletions(-)

diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index 674f805d76..d8f5a06182 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -49,11 +49,16 @@
 #define R_TX_CTRL1    (0x0ffc / 4)
 
 #define R_RX_BUF0     (0x1000 / 4)
-#define R_RX_CTRL0    (0x17fc / 4)
+#define A_RX_BASE0     0x17fc
 #define R_RX_BUF1     (0x1800 / 4)
-#define R_RX_CTRL1    (0x1ffc / 4)
+#define A_RX_BASE1     0x1ffc
 #define R_MAX         (0x2000 / 4)
 
+enum {
+    RX_CTRL = 0,
+    RX_MAX
+};
+
 #define GIE_GIE    0x80000000
 
 #define CTRL_I     0x8
@@ -62,6 +67,8 @@
 
 typedef struct XlnxXpsEthLitePort
 {
+    MemoryRegion rxio;
+
     struct {
         uint32_t tx_len;
         uint32_t tx_gie;
@@ -119,6 +126,55 @@ static void *rxbuf_ptr(XlnxXpsEthLite *s, unsigned port_index)
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
+    unsigned port_index = addr_to_port_index(addr);
+
+    switch (addr >> 2) {
+        case RX_CTRL:
+            if (!(value & CTRL_S)) {
+                qemu_flush_queued_packets(qemu_get_queue(s->nic));
+            }
+            s->port[port_index].reg.rx_ctrl = value;
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
@@ -144,11 +200,6 @@ eth_read(void *opaque, hwaddr addr, unsigned int size)
             r = s->port[port_index].reg.tx_ctrl;
             break;
 
-        case R_RX_CTRL1:
-        case R_RX_CTRL0:
-            r = s->port[port_index].reg.rx_ctrl;
-            break;
-
         default:
             r = tswap32(s->regs[addr]);
             break;
@@ -189,14 +240,6 @@ eth_write(void *opaque, hwaddr addr,
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
@@ -289,6 +332,15 @@ static void xilinx_ethlite_realize(DeviceState *dev, Error **errp)
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

