Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp271889njb;
        Thu, 25 Jul 2024 23:00:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWNBSqt34IvLhHYOGW82JciMNzI0IDa6l9FfWU8Dq3ytIVOmmErfBbhTLn4qUQoJ3S6TN9TrbsP4tU3s6jbzpOGB90aEvIy
X-Google-Smtp-Source: AGHT+IHT80WOm0DJEniasReu2EM5qth4kTF4/B1sCB+kYL8GFwpRHALF0YyNpUDEarBh6PS+DFY+
X-Received: by 2002:a05:6102:9d3:b0:493:c261:1a7a with SMTP id ada2fe7eead31-493d986db35mr5194672137.0.1721973618942;
        Thu, 25 Jul 2024 23:00:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721973618; cv=none;
        d=google.com; s=arc-20160816;
        b=Sswx+6pyEW++KzZMre7mglex9jVLgA2CqqonyRULhEqfPbCxSPaVNjOzLxUTtyUevN
         6307nF40DDXRVmNwb2/9fCabybTXacZAVLJ9r53d5vXboRhAmxKgxKisKiMPKlRexTTj
         ub2e9On4dDiw5LjYLzrTYiTep+tA/r5wsqA2edZQAD/Wv/PjZTodWbta7eW9v6RVqMa0
         uXv45DeXhhEloU/wp/Zk48bRpaaq4lJ3HZEnEFwQqnJ+oed8N3UMgty0OtldgS8KNqSB
         hv9TAhqbazX8PAYnWFmGFULi9Mi9miflG6zkLHoKIi+KiPxIMts7oungO2F9Dbj9B5Aq
         vM7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=9Za57CxWKyfgLnTqPQsh6nioQ4Nt2VfZ5IqfZz3w8wU=;
        fh=DO75sBr5zYsAPbcWi2ho6go4UnvYMXrMWHrP8L6E7Rw=;
        b=n/H+/LK5o8Z0BHQVzSlT/nUb0tu/+7bJG+Lrbid72liOBFaCYqyIVSOf8qlyBZHXcv
         T3ziSmwnk7mHmhCt1ohVt5/4zy9/bkIEE9YbPKKpw0xWzKBUGNTVbS2s5ci7cfWGITA9
         l4oVMBKDevGaMKu80NQ5XzmmFNCc/p9n8aIlzAsyWwl3ho9gRq/JKQXfZQVQTaMtoNxr
         g2Ff5MLeWsmJncYVlOdAULsa1WPH9+ypashTbW35cB0bX5qz6u/TyW6eGMsX3ktFCRAg
         yRx/iN9DHVz7bMU+QqCXLd0FwWOqDkbGOemmSDNv8IbiONcRX30T1Iz0kTdgyaqFjdAR
         7ZgQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=j3lx9LmN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a1d749e458si340745285a.731.2024.07.25.23.00.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2024 23:00:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=j3lx9LmN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sXDzj-0001m1-KX; Fri, 26 Jul 2024 01:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1sXDzi-0001j8-I2
 for qemu-arm@nongnu.org; Fri, 26 Jul 2024 01:59:58 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1sXDzg-0006vO-Qw
 for qemu-arm@nongnu.org; Fri, 26 Jul 2024 01:59:58 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-260fed6c380so501611fac.1
 for <qemu-arm@nongnu.org>; Thu, 25 Jul 2024 22:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1721973591; x=1722578391; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9Za57CxWKyfgLnTqPQsh6nioQ4Nt2VfZ5IqfZz3w8wU=;
 b=j3lx9LmN36cst56okxcZR17ZWd4RH96C0R0fq4wuyqD0twF9FmJDYGjE6qRBp3bMps
 +5ikP/h7Wf8SYxNwsFe7+qVmvRooQhL/Yl+xPLgZ1Wrv1WhUreN2zV5R1DruG6f9ghtX
 6dIL0lmRUxBPahoRrmaCMQBK+dvMiRtuhr0ZhUluj6hDfTFqzUx7Pvk6UpmSqa3E+jIV
 dwKtSl4krl5sMuk1qpSnRWKBcHC6rjXt2mBobq5V8FQvP9iRnEa4vSjCvBhgtOOLZR4Y
 fDFH33pHDIMscOzRH0Bf456dyBrbZDs7ppm1C02lWOGAIQh4GJVBtEAvxqVJ/bV/H2Tm
 LZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721973591; x=1722578391;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9Za57CxWKyfgLnTqPQsh6nioQ4Nt2VfZ5IqfZz3w8wU=;
 b=Sr5wW6nUAw7Yl/RpBjn4QnMPYtEdDV5lCrdXbi7PHBJKkxSzQuR36nOmn0AqGLTXSW
 i0b7NPIFNiMjL3PavqLXxqlLeShJ89zJsfuq+JbPGVhaJRq1R1FUYF2QVXH1oyO6JBQm
 cDhMaavFP853ZwJOtAFe47KmRS3jP65NyHyiPujspb9i3SrALD92OUm12coBfE7eoIaJ
 zvXKwCNYI2YeThQJwjVKSYbJjOb4/KKWBoAPRgLkb0xh2cJPfDwN6drHk5u1vadrOj67
 Rda644byCPk5jngPEYAXAelutpYCMVhaCljc+D4TFnqOCyY+m8h5pXasjlg1zN8M7J3G
 LNwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWybAlt87o/MRuIKOFlTyBf64+H7qZp/JytC3CqNJ8YFo3Ul9YFt5i5K8eyDCsp2Vgu+PVf/SnJsKsbfiree0VrKtLf
X-Gm-Message-State: AOJu0YyQoMfT/y44bqz+IV2HCoFo9FkLqmXKfg5IE5giIVvSqYmNdBim
 v+e2Ki0WzzyjNvxawqN39BDejvVXGIYXafplThqxRyTgxLjfL8N6sEutNOEIHnPyUXaM22IIzhM
 l
X-Received: by 2002:a05:6870:c1cf:b0:25d:f285:d008 with SMTP id
 586e51a60fabf-266cc1f0195mr5245876fac.7.1721973591059; 
 Thu, 25 Jul 2024 22:59:51 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70ead6e1a4bsm2002128b3a.5.2024.07.25.22.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 22:59:50 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org (open list:Xilinx Zynq), Jim Shu <jim.shu@sifive.com>
Subject: [PATCH 4/4] hw/net: xilinx_axienet: Fix DMA RX IRQ if ethernet
 disable RX
Date: Fri, 26 Jul 2024 13:59:33 +0800
Message-Id: <20240726055933.817-5-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240726055933.817-1-jim.shu@sifive.com>
References: <20240726055933.817-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=jim.shu@sifive.com; helo=mail-oa1-x2b.google.com
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
X-TUID: uX5XTLI76ZEg

When AXI ethernet RX is disabled, it shouldn't send packets to AXI DMA,
which may let AXI DMA to send RX full IRQs. It is aligned with real AXI
DMA/ethernet IP behavior in the FPGA.

Also, now ethernet RX blocks the RX packets when it is disabled. It
should send and clear the remaining RX packets when enabling it.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
---
 hw/net/xilinx_axienet.c | 71 ++++++++++++++++++++++++-----------------
 1 file changed, 42 insertions(+), 29 deletions(-)

diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
index 05d41bd548..8428f10946 100644
--- a/hw/net/xilinx_axienet.c
+++ b/hw/net/xilinx_axienet.c
@@ -530,6 +530,40 @@ static uint64_t enet_read(void *opaque, hwaddr addr, unsigned size)
     return r;
 }
 
+static void axienet_eth_rx_notify(void *opaque)
+{
+    XilinxAXIEnet *s = XILINX_AXI_ENET(opaque);
+
+    /* If RX is disabled, don't trigger DMA to update RX desc and send IRQ */
+    if (!axienet_rx_enabled(s)) {
+        return;
+    }
+
+    while (s->rxappsize && stream_can_push(s->tx_control_dev,
+                                           axienet_eth_rx_notify, s)) {
+        size_t ret = stream_push(s->tx_control_dev,
+                                 (void *)s->rxapp + CONTROL_PAYLOAD_SIZE
+                                 - s->rxappsize, s->rxappsize, true);
+        s->rxappsize -= ret;
+    }
+
+    while (s->rxsize && stream_can_push(s->tx_data_dev,
+                                        axienet_eth_rx_notify, s)) {
+        size_t ret = stream_push(s->tx_data_dev, (void *)s->rxmem + s->rxpos,
+                                 s->rxsize, true);
+        s->rxsize -= ret;
+        s->rxpos += ret;
+        if (!s->rxsize) {
+            s->regs[R_IS] |= IS_RX_COMPLETE;
+            if (s->need_flush) {
+                s->need_flush = false;
+                qemu_flush_queued_packets(qemu_get_queue(s->nic));
+            }
+        }
+    }
+    enet_update_irq(s);
+}
+
 static void enet_write(void *opaque, hwaddr addr,
                        uint64_t value, unsigned size)
 {
@@ -546,6 +580,14 @@ static void enet_write(void *opaque, hwaddr addr,
             } else {
                 qemu_flush_queued_packets(qemu_get_queue(s->nic));
             }
+
+            /*
+             * When RX is enabled, check if any remaining data in rxmem
+             * and send them.
+             */
+            if ((addr & 1) && s->rcw[addr & 1] & RCW1_RX) {
+                axienet_eth_rx_notify(s);
+            }
             break;
 
         case R_TC:
@@ -666,35 +708,6 @@ static int enet_match_addr(const uint8_t *buf, uint32_t f0, uint32_t f1)
     return match;
 }
 
-static void axienet_eth_rx_notify(void *opaque)
-{
-    XilinxAXIEnet *s = XILINX_AXI_ENET(opaque);
-
-    while (s->rxappsize && stream_can_push(s->tx_control_dev,
-                                           axienet_eth_rx_notify, s)) {
-        size_t ret = stream_push(s->tx_control_dev,
-                                 (void *)s->rxapp + CONTROL_PAYLOAD_SIZE
-                                 - s->rxappsize, s->rxappsize, true);
-        s->rxappsize -= ret;
-    }
-
-    while (s->rxsize && stream_can_push(s->tx_data_dev,
-                                        axienet_eth_rx_notify, s)) {
-        size_t ret = stream_push(s->tx_data_dev, (void *)s->rxmem + s->rxpos,
-                                 s->rxsize, true);
-        s->rxsize -= ret;
-        s->rxpos += ret;
-        if (!s->rxsize) {
-            s->regs[R_IS] |= IS_RX_COMPLETE;
-            if (s->need_flush) {
-                s->need_flush = false;
-                qemu_flush_queued_packets(qemu_get_queue(s->nic));
-            }
-        }
-    }
-    enet_update_irq(s);
-}
-
 static ssize_t eth_rx(NetClientState *nc, const uint8_t *buf, size_t size)
 {
     XilinxAXIEnet *s = qemu_get_nic_opaque(nc);
-- 
2.17.1

