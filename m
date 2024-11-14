Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp550724njc;
        Thu, 14 Nov 2024 13:02:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU7f2gNwwNM1dxXjb5TBYdXSXoGvOcwe+1vygM9m0G0F+myMNQS9mY/V6SpXB1MO8UD/6lRNbc1igvbOg==@linaro.org
X-Google-Smtp-Source: AGHT+IGyjS763sn45Hll1G9tI1Tl9e91/3VAH7eGu8/XKb8xdeQ/p2FAhLqLBRbqgGYeWspz7pKj
X-Received: by 2002:a05:6214:5404:b0:6d3:71ab:adb9 with SMTP id 6a1803df08f44-6d3fb88bff7mr1574296d6.45.1731618168627;
        Thu, 14 Nov 2024 13:02:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731618168; cv=none;
        d=google.com; s=arc-20240605;
        b=CuWzY21dfyrepuDI+40h/CbNsFfcYQqxXUQolXnG9BFgE3MCz6o5RtCMzwP0dVC4iy
         eLCwdr1HlrVj+o+KDkHxLCpqQr7zQUMFoNiC8tXEp315gNoI/a+e+YlnVZGTrN4pFy38
         L6g9e/1h7yoGxqcBsgVoTY+1VFX6y/jg57RGJBqIe7P/YueTDaT7KJv6bC52M1/5uMWD
         /HPhfidqxpmaQAhEyEiHn/rhKsnzM8oPuO9ZFerHNdNjHRf8qY07Zgnil8Bi1dtCHcF2
         r8LeQGCkXoIQc6QmHVKhQuVbkEvZEx54fzdf3N0gm270BdfqeE6VBNmSLD4yKqMMjv7+
         4Ezw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dRoZ7cwroZSiGL3yaDx0dNBCN/zDvjhHMaiZQ6yO+wI=;
        fh=IRuGWMvTeecxgxjKSI7QmRflMkYktes0sVu/RVhAZQM=;
        b=fd4ulaz/740hgvaIPcmCfYr5G9EyPUDyMC4J7lhYCJ81O22yDF+KGNuCaP3aaCpXlI
         0ObyOORaLZu7n4LpTS0n361U1kUw/xgwrDkelRJQMIWf5GS2lnq9YgOzTSjfllLM9/s7
         VzgGsGl+6+wMQas+ATjleK+LxNbrPhskUHvb0HgUZt2kCQ4BLeV9AIfRm8pN3b3EPnQD
         xjmXCMcdLNG4zNe8wtt3fYn+q8j9nsGdeI5eBLv6tvTOOEfNZ8PEmtU74LCumEfJt3ss
         /t3DA2dGn14Yj+LdO4Ni5ZU/L8y+3VVwKk5n8ZwIqgbZuKoCDeSOtr5OnPxVpGG34LJ6
         weDQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dNBagkX5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d3ee760a02si20164786d6.37.2024.11.14.13.02.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2024 13:02:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dNBagkX5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tBgyP-0001Us-16; Thu, 14 Nov 2024 16:01:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBgy2-0000vd-UL
 for qemu-devel@nongnu.org; Thu, 14 Nov 2024 16:01:34 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBgy1-00083i-84
 for qemu-devel@nongnu.org; Thu, 14 Nov 2024 16:01:30 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43167ff0f91so196405e9.1
 for <qemu-devel@nongnu.org>; Thu, 14 Nov 2024 13:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731618084; x=1732222884; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dRoZ7cwroZSiGL3yaDx0dNBCN/zDvjhHMaiZQ6yO+wI=;
 b=dNBagkX5m/FX7t7T5jQoZQhUA40uCypjD5dZzCYGcBQjMlwKuG8kUEXdvCuY4HEhDm
 qEhzVZSMzvT+/f3cN39lTtiKoVJ3yJwMYklbaL6GccDNcZBoEGbisVJ1IlYBAy7SNA8A
 2w11FYXgboJu3XxX5zaVg4TYsJcaplp67BJLZzq3EoYQMNkpUkWB3J+ppp4Z/C6H6xt5
 kK7ZUNBlMWSxC+x4g6SHjCE+OcQHcRf7FGn03RvfkdCReCKfyjbjv5IUzv4Wk7D0411y
 0oaQNuXS9zUlwSl6QY7toIDVU6sttt+gXF6QapwDEAAIuQNaroUH5PVL9xnWYJIDRtBv
 nmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731618084; x=1732222884;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dRoZ7cwroZSiGL3yaDx0dNBCN/zDvjhHMaiZQ6yO+wI=;
 b=MMzd5qJJ+GawgBYprlVlqY/LwP0XjpH75ya/kjs8BOtOOnA1K1YqvKQxM+S7Iqg2Nr
 ta8JiRhyQf//8yMaszpua0w5dMquV6VpB+WyL5ug1fIDLxPiU1CaZ9GWFA/ZXorSBu7a
 IOJhgWWoPMF4HB8BzjN1niFa74OB8e1RM8pAj6CXuqaIXns9Qir33GBgwSOUL2Pi6xqo
 OhozjU0gAhP85IyzcF+g+gpxB6AE74WsUOMze9K5yRshFKF4NC0IBJhNU4QhGlcV9rtG
 5L+JktbCH3L/Tfsrn5eycEpjTb9lRgdXGYcLv8YlClQ6m26ow8V/wrO+htq7MR7staog
 LE/A==
X-Gm-Message-State: AOJu0YwdBd1uBTA3odIA0+L3DE/yhZaN+xYrR3/R7mNZUSXACUhlgmuA
 TwvYGhW0JQaGoJ14PucsC52BUwvMzgA9heWLJiSEFwLj1POpkRhWExzLos2cpGFdIFRLq+SX3v9
 I
X-Received: by 2002:a05:600c:4e08:b0:431:1512:743b with SMTP id
 5b1f17b1804b1-432df78b038mr1278145e9.21.1731618083769; 
 Thu, 14 Nov 2024 13:01:23 -0800 (PST)
Received: from localhost.localdomain ([176.187.209.228])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821adad238sm2417922f8f.25.2024.11.14.13.01.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 14 Nov 2024 13:01:22 -0800 (PST)
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
Subject: [PATCH RESEND v2 09/19] hw/net/xilinx_ethlite: Introduce rxbuf_ptr()
 helper
Date: Thu, 14 Nov 2024 22:00:00 +0100
Message-ID: <20241114210010.34502-10-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114210010.34502-1-philmd@linaro.org>
References: <20241114210010.34502-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ihwYqDTPsB/w

rxbuf_ptr() points to the beginning of a (RAM) RX buffer
within the device state.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/net/xilinx_ethlite.c | 40 ++++++++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index 21ce2a112c..a993cb8bb9 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -60,6 +60,13 @@
 #define CTRL_P     0x2
 #define CTRL_S     0x1
 
+typedef struct XlnxXpsEthLitePort
+{
+    struct {
+        uint32_t rx_ctrl;
+    } reg;
+} XlnxXpsEthLitePort;
+
 #define TYPE_XILINX_ETHLITE "xlnx.xps-ethernetlite"
 OBJECT_DECLARE_SIMPLE_TYPE(XlnxXpsEthLite, XILINX_ETHLITE)
 
@@ -77,6 +84,7 @@ struct XlnxXpsEthLite
     unsigned int port_index; /* dual port RAM index */
 
     UnimplementedDeviceState mdio;
+    XlnxXpsEthLitePort port[2];
     uint32_t regs[R_MAX];
 };
 
@@ -100,10 +108,18 @@ static void *txbuf_ptr(XlnxXpsEthLite *s, unsigned port_index)
     return &s->regs[rxbase + R_TX_BUF0];
 }
 
+static void *rxbuf_ptr(XlnxXpsEthLite *s, unsigned port_index)
+{
+    unsigned int rxbase = port_index * (0x800 / 4);
+
+    return &s->regs[rxbase + R_RX_BUF0];
+}
+
 static uint64_t
 eth_read(void *opaque, hwaddr addr, unsigned int size)
 {
     XlnxXpsEthLite *s = opaque;
+    unsigned port_index = addr_to_port_index(addr);
     uint32_t r = 0;
 
     addr >>= 2;
@@ -115,9 +131,12 @@ eth_read(void *opaque, hwaddr addr, unsigned int size)
         case R_TX_LEN1:
         case R_TX_CTRL1:
         case R_TX_CTRL0:
+            r = s->regs[addr];
+            break;
+
         case R_RX_CTRL1:
         case R_RX_CTRL0:
-            r = s->regs[addr];
+            r = s->port[port_index].reg.rx_ctrl;
             break;
 
         default:
@@ -167,7 +186,9 @@ eth_write(void *opaque, hwaddr addr,
             if (!(value & CTRL_S)) {
                 qemu_flush_queued_packets(qemu_get_queue(s->nic));
             }
-            /* fall through */
+            s->port[port_index].reg.rx_ctrl = value;
+            break;
+
         case R_TX_LEN0:
         case R_TX_LEN1:
         case R_TX_GIE0:
@@ -197,22 +218,21 @@ static const MemoryRegionOps eth_ops = {
 static bool eth_can_rx(NetClientState *nc)
 {
     XlnxXpsEthLite *s = qemu_get_nic_opaque(nc);
-    unsigned int rxbase = s->port_index * (0x800 / 4);
 
-    return !(s->regs[rxbase + R_RX_CTRL0] & CTRL_S);
+    return !(s->port[s->port_index].reg.rx_ctrl & CTRL_S);
 }
 
 static ssize_t eth_rx(NetClientState *nc, const uint8_t *buf, size_t size)
 {
     XlnxXpsEthLite *s = qemu_get_nic_opaque(nc);
-    unsigned int rxbase = s->port_index * (0x800 / 4);
+    unsigned int port_index = s->port_index;
 
     /* DA filter.  */
     if (!(buf[0] & 0x80) && memcmp(&s->conf.macaddr.a[0], buf, 6))
         return size;
 
-    if (s->regs[rxbase + R_RX_CTRL0] & CTRL_S) {
-        trace_ethlite_pkt_lost(s->regs[R_RX_CTRL0]);
+    if (s->port[port_index].reg.rx_ctrl & CTRL_S) {
+        trace_ethlite_pkt_lost(s->port[port_index].reg.rx_ctrl);
         return -1;
     }
 
@@ -220,10 +240,10 @@ static ssize_t eth_rx(NetClientState *nc, const uint8_t *buf, size_t size)
         trace_ethlite_pkt_size_too_big(size);
         return -1;
     }
-    memcpy(&s->regs[rxbase + R_RX_BUF0], buf, size);
+    memcpy(rxbuf_ptr(s, port_index), buf, size);
 
-    s->regs[rxbase + R_RX_CTRL0] |= CTRL_S;
-    if (s->regs[R_RX_CTRL0] & CTRL_I) {
+    s->port[port_index].reg.rx_ctrl |= CTRL_S;
+    if (s->port[port_index].reg.rx_ctrl & CTRL_I) {
         eth_pulse_irq(s);
     }
 
-- 
2.45.2

