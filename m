Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp490631njc;
        Thu, 14 Nov 2024 11:08:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWKS/VJXnyvhXZNbNVOhr7Ubb91t6m2EWJSiX2U9vR4C5dqRkswduZj8VQbCGrxVnVxyydWohdEjNcqVw==@linaro.org
X-Google-Smtp-Source: AGHT+IH22YiPs36fJjU6A0j3htGQ0/BeM138d7YDrLCfSokSqjYTfKLzUelnGBkHRLG8wUFsnn/i
X-Received: by 2002:ac8:594e:0:b0:463:112f:498c with SMTP id d75a77b69052e-4634015ed1bmr137581541cf.6.1731611298876;
        Thu, 14 Nov 2024 11:08:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731611298; cv=none;
        d=google.com; s=arc-20240605;
        b=gZf5GIA5kf2tnMF048YfH6M5KY7RnSsXNnBaHioa2dwOQUjGiznJxPOlQSvrjTyKQZ
         N0+P2oZc7+8C9ObosgCrpykfcL1lqO5exDxUR2dFRvTqWmeqc/wozrgZo1yoEtZN84LJ
         0asT1in7tN+lXaLVJvY1PGi0f/lt3JcymLLmjYDoLJiWvdN6Gb4tGkEjReviZbfi6EN/
         sddnEAgIwJ6gRX75xy+JWoTyYGJrFXldEYDncqcZuZFnR9DY+aCX0ytgDfwSn1wDr3Or
         d5u3pQdsO0hLZVFbPrygZ1Cs9xVtRxp4kstFgIdETOQDErrVe/rYV6RS3tLhP3b8/hac
         pSww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GtXVKpSIpZsJQkvyHDSbG39GxcMu+Qe8sXh7gatQ/Yw=;
        fh=Z0BxY1wyc6UcCnqJglJ7gTp2HCZwvpqSF4hblXika5E=;
        b=W6Ur9P5BqXv/tuvsCK6HuYRqizw2EBEp/oavu0x2zyZjRgGUL08M0NWnF+beE5JfBa
         elqZvKkBsO03Umoemdzfnnjt5waxzv5rYyOxZiiFeNq9G9g3j6LVEcLrGrn1VETsH5c8
         xIR2XA6sls75TGvx2OYh+OJSD2aF/FKeBBDDYzlT+2iQPrGNcGVkP5BCU7isrz1NSInA
         yeovbGv8EPqVRR2wsDLwB1lx0TbGBxI3n5tCi1/4XTf0U2rgrPXM3EfbcpbHvo/FETKG
         DB9WMeRM432BbRn4vKP5n+Yu+pAZfy/qs01TUx7GO3/3WegDjWywHoqUw7qR85NmP/OD
         Eq9Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eRzoQ/7k";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4635aa9f1ebsi16913441cf.337.2024.11.14.11.08.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2024 11:08:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eRzoQ/7k";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBfCJ-0004jC-Ou; Thu, 14 Nov 2024 14:08:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBfCI-0004iu-4G
 for qemu-arm@nongnu.org; Thu, 14 Nov 2024 14:08:06 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBfCG-0005ZT-B2
 for qemu-arm@nongnu.org; Thu, 14 Nov 2024 14:08:05 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-37d538fe5f2so683861f8f.2
 for <qemu-arm@nongnu.org>; Thu, 14 Nov 2024 11:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731611283; x=1732216083; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GtXVKpSIpZsJQkvyHDSbG39GxcMu+Qe8sXh7gatQ/Yw=;
 b=eRzoQ/7kq+i89RA4PXQxrvrgpPSr6KL3Flliu/zhN7RXqeqgoIjta9SW4bmZjHGZe3
 KniYKK3X1TTcFdVJ0Bb2bRZ3AWJG0SbkQBIO1+KKxm6O9D24D6/L4hsZ/mZzJ6S9st3n
 i0vgCQA1DZa5fmfnHdWYjrUF4HOethRvRmky3g4SF01/+HNKwca7smF2JRvxP4mHO3lU
 6xkBEuDT0aaxBdCfAFPI5DlNf8WCC+tqA3vjjjn0TRCOVEui673HOhhqqAUgI/vGBsin
 HZMGj3ERIJIYUg6cctpXkoal8yqkvj5+ylS2z4PlAUzyyr/7np1xz0JObrXnWUz1HkgQ
 L+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731611283; x=1732216083;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GtXVKpSIpZsJQkvyHDSbG39GxcMu+Qe8sXh7gatQ/Yw=;
 b=XVvoKeyjBCJP1EibT537jaxid9lnfRPhu48gQiBtYmEqBAcWwj12rhngoHWOXhW2Py
 E54Hg3qFiUbb5FPYLYP+CsN+1bBi4hwJiNMdAc9yvwMDQ0AAX3jWdjDdZiBz1Msosu79
 5VU8s7pl/9+DaC0CieJl/QEBnwl26+0h0qWDX5evBs0jkX5QlPdG6clmO6rQKDjyKekC
 qtrptV4CqfL0FmB99iMnSgSzsM5ne/DaRDpsTBYv0O8sqUHTSPBZMHtuaW+Gms6tzb2y
 awvlz9ZGTs97Px0AIOoLr3F4nkle32/goi/rbhP1yU7Tz7pYCGiOeM1oEXumaYDrlCuP
 jpcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsdzmQt88Gd7N2oDxcx5Rq7p8jJ02OyDkQbPq0BRGJAPsKHFwkUamNdPfV/QJyAMjRE2cdM0dKNw==@nongnu.org
X-Gm-Message-State: AOJu0YwKV/aGIjiCvgjbEgjaa/dUB84EaXZzJjgSsyf+oeECi9Cu5ItS
 Bh80wfqsJ2inedkhYBu52zxWeboiyDYXVKDEtDzi3b8JqBn8enAir064Z3Xkv6U=
X-Received: by 2002:a5d:5d10:0:b0:37d:4f1b:35a with SMTP id
 ffacd0b85a97d-3820df6a932mr6081679f8f.3.1731611282791; 
 Thu, 14 Nov 2024 11:08:02 -0800 (PST)
Received: from localhost.localdomain ([176.187.209.228])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821ae3100csm2192071f8f.91.2024.11.14.11.08.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 14 Nov 2024 11:08:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Anton Johansson <anjo@rev.ng>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>
Subject: [PATCH v2 04/19] hw/net/xilinx_ethlite: Update QOM style
Date: Thu, 14 Nov 2024 20:07:18 +0100
Message-ID: <20241114190733.33902-5-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114190733.33902-1-philmd@linaro.org>
References: <20241114190733.33902-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
X-TUID: i5ZNwKiBGF08

Use XlnxXpsEthLite typedef, OBJECT_DECLARE_SIMPLE_TYPE macro;
convert type_init() to DEFINE_TYPES().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/net/xilinx_ethlite.c | 48 +++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 26 deletions(-)

diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index 2b52597f03..0f59811c78 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -53,10 +53,9 @@
 #define CTRL_S     0x1
 
 #define TYPE_XILINX_ETHLITE "xlnx.xps-ethernetlite"
-DECLARE_INSTANCE_CHECKER(struct xlx_ethlite, XILINX_ETHLITE,
-                         TYPE_XILINX_ETHLITE)
+OBJECT_DECLARE_SIMPLE_TYPE(XlnxXpsEthLite, XILINX_ETHLITE)
 
-struct xlx_ethlite
+struct XlnxXpsEthLite
 {
     SysBusDevice parent_obj;
 
@@ -73,7 +72,7 @@ struct xlx_ethlite
     uint32_t regs[R_MAX];
 };
 
-static inline void eth_pulse_irq(struct xlx_ethlite *s)
+static inline void eth_pulse_irq(XlnxXpsEthLite *s)
 {
     /* Only the first gie reg is active.  */
     if (s->regs[R_TX_GIE0] & GIE_GIE) {
@@ -84,7 +83,7 @@ static inline void eth_pulse_irq(struct xlx_ethlite *s)
 static uint64_t
 eth_read(void *opaque, hwaddr addr, unsigned int size)
 {
-    struct xlx_ethlite *s = opaque;
+    XlnxXpsEthLite *s = opaque;
     uint32_t r = 0;
 
     addr >>= 2;
@@ -112,7 +111,7 @@ static void
 eth_write(void *opaque, hwaddr addr,
           uint64_t val64, unsigned int size)
 {
-    struct xlx_ethlite *s = opaque;
+    XlnxXpsEthLite *s = opaque;
     unsigned int base = 0;
     uint32_t value = val64;
 
@@ -176,7 +175,7 @@ static const MemoryRegionOps eth_ops = {
 
 static bool eth_can_rx(NetClientState *nc)
 {
-    struct xlx_ethlite *s = qemu_get_nic_opaque(nc);
+    XlnxXpsEthLite *s = qemu_get_nic_opaque(nc);
     unsigned int rxbase = s->rxbuf * (0x800 / 4);
 
     return !(s->regs[rxbase + R_RX_CTRL0] & CTRL_S);
@@ -184,7 +183,7 @@ static bool eth_can_rx(NetClientState *nc)
 
 static ssize_t eth_rx(NetClientState *nc, const uint8_t *buf, size_t size)
 {
-    struct xlx_ethlite *s = qemu_get_nic_opaque(nc);
+    XlnxXpsEthLite *s = qemu_get_nic_opaque(nc);
     unsigned int rxbase = s->rxbuf * (0x800 / 4);
 
     /* DA filter.  */
@@ -214,7 +213,7 @@ static ssize_t eth_rx(NetClientState *nc, const uint8_t *buf, size_t size)
 
 static void xilinx_ethlite_reset(DeviceState *dev)
 {
-    struct xlx_ethlite *s = XILINX_ETHLITE(dev);
+    XlnxXpsEthLite *s = XILINX_ETHLITE(dev);
 
     s->rxbuf = 0;
 }
@@ -228,7 +227,7 @@ static NetClientInfo net_xilinx_ethlite_info = {
 
 static void xilinx_ethlite_realize(DeviceState *dev, Error **errp)
 {
-    struct xlx_ethlite *s = XILINX_ETHLITE(dev);
+    XlnxXpsEthLite *s = XILINX_ETHLITE(dev);
 
     qemu_macaddr_default_if_unset(&s->conf.macaddr);
     s->nic = qemu_new_nic(&net_xilinx_ethlite_info, &s->conf,
@@ -239,7 +238,7 @@ static void xilinx_ethlite_realize(DeviceState *dev, Error **errp)
 
 static void xilinx_ethlite_init(Object *obj)
 {
-    struct xlx_ethlite *s = XILINX_ETHLITE(obj);
+    XlnxXpsEthLite *s = XILINX_ETHLITE(obj);
 
     sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
 
@@ -249,9 +248,9 @@ static void xilinx_ethlite_init(Object *obj)
 }
 
 static Property xilinx_ethlite_properties[] = {
-    DEFINE_PROP_UINT32("tx-ping-pong", struct xlx_ethlite, c_tx_pingpong, 1),
-    DEFINE_PROP_UINT32("rx-ping-pong", struct xlx_ethlite, c_rx_pingpong, 1),
-    DEFINE_NIC_PROPERTIES(struct xlx_ethlite, conf),
+    DEFINE_PROP_UINT32("tx-ping-pong", XlnxXpsEthLite, c_tx_pingpong, 1),
+    DEFINE_PROP_UINT32("rx-ping-pong", XlnxXpsEthLite, c_rx_pingpong, 1),
+    DEFINE_NIC_PROPERTIES(XlnxXpsEthLite, conf),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -264,17 +263,14 @@ static void xilinx_ethlite_class_init(ObjectClass *klass, void *data)
     device_class_set_props(dc, xilinx_ethlite_properties);
 }
 
-static const TypeInfo xilinx_ethlite_info = {
-    .name          = TYPE_XILINX_ETHLITE,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(struct xlx_ethlite),
-    .instance_init = xilinx_ethlite_init,
-    .class_init    = xilinx_ethlite_class_init,
+static const TypeInfo xilinx_ethlite_types[] = {
+    {
+        .name          = TYPE_XILINX_ETHLITE,
+        .parent        = TYPE_SYS_BUS_DEVICE,
+        .instance_size = sizeof(XlnxXpsEthLite),
+        .instance_init = xilinx_ethlite_init,
+        .class_init    = xilinx_ethlite_class_init,
+    },
 };
 
-static void xilinx_ethlite_register_types(void)
-{
-    type_register_static(&xilinx_ethlite_info);
-}
-
-type_init(xilinx_ethlite_register_types)
+DEFINE_TYPES(xilinx_ethlite_types)
-- 
2.45.2

