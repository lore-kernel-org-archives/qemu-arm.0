Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp551101njc;
        Thu, 14 Nov 2024 13:03:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUBKdw2/M91e/PcIrURdo1HKtdFmrmteR7wsF0f0vLegsI1KN4j/WYkg0CWRRq+rhJHlb9tctPmQE6UNw==@linaro.org
X-Google-Smtp-Source: AGHT+IFmBQA8c6ZOUmxSulU4YSOZ+dXL2JGEETTzAKht5lJ1nC1XuthVNNmE3aTRWnn3z+GezsOU
X-Received: by 2002:a05:620a:f13:b0:7af:c818:bca with SMTP id af79cd13be357-7b362364b33mr43595485a.46.1731618197433;
        Thu, 14 Nov 2024 13:03:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731618197; cv=none;
        d=google.com; s=arc-20240605;
        b=FkjxbfhRrtyNBnZoh4gbrU0FEl1824R3jUcW3sM5YVkCdWgJZtB90LcAvBxcD61XXU
         qIu1RsWGucMUFESSN9fGGb1Hj7GZlv+6plhxwD4SQ+fS3Wk4V3Hb32vRjhAqaTE0tCWD
         hNTQbtXqeepGpbJCxLV88pWMMq9tZZuLPJHR4gbMlYhjwgHGi0NXTnutlu4rtnXfSAjL
         w68R5uAli+iokpCBYROeuSeXstrCv6v/T0MwtavVN43vVFgWc9S78DrK5CMmIhHK+eXB
         Ao7l8e49ASTZwf6F5zvF5o3hI//ykxCJVmuSRXxRbnUpnfSz0jJDvDqHerOls8Qvw1In
         CA9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8xMxbLuqYUOAO97RnSz2IGo3OvTtmoe9G2YVBXewgY0=;
        fh=ALh4821oAynitACCr/g25MhuD3/PQ4SDk77zTefaTk8=;
        b=k5kzO2dD4h+xbNGxmNcE4usRctCDcDzg5UzL4KHiV/t41x2aCGjSVkMzzmSi8eoSJ7
         gxM2LiMVcZdqBp1+14YErEj2TY8y0jOzfb/NiBQujDEeTHZx6W576AySFBu8Z2/hTsKS
         DolL45hKAszhqp8IoV9eyHomh65bAklAzufFYbaoCHkdto7/u/f2p9ERLOyG5mRb2hRb
         emCMnvXu9DF4rQzAIZrtM/dYgigHC4oRGIlF3dVeB7mX/NX9V7P0z6VL4eL878yQAYZB
         qyu8gxwH6QxgRh0ukOzZkUZZYZCTk028TPeJrXQDg6ld7eRXNSd4XuGCsdo/aczoe7ku
         ciWg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aqOqZqyY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b35c96f6e1si220233585a.6.2024.11.14.13.03.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2024 13:03:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aqOqZqyY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBgzP-00049f-0L; Thu, 14 Nov 2024 16:02:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBgz8-0003zL-Oc
 for qemu-arm@nongnu.org; Thu, 14 Nov 2024 16:02:39 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tBgz6-0008CS-Tq
 for qemu-arm@nongnu.org; Thu, 14 Nov 2024 16:02:38 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-38224150a84so172163f8f.3
 for <qemu-arm@nongnu.org>; Thu, 14 Nov 2024 13:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731618155; x=1732222955; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8xMxbLuqYUOAO97RnSz2IGo3OvTtmoe9G2YVBXewgY0=;
 b=aqOqZqyYm2rOA2dmzZdBoWBqf5yH/U/fszhfrCX8evsWgh9dzssPdNJaSaSj+Rw3nW
 da+rMJ8lqhpsCod6/9oYzzvNcG7EmcLFClv89VRgWUY8zF8NvV8SXpZqh+zk/8z+CGZz
 6FKF8eZtfqijLOurKM4FtwuVmYCYQY0kJDBs+KvZXF0ZOM2Ia/PqHxs9dyE8HlCt3H08
 k1Vw+9n/YUMWUdktA1TUhhHB+2WSAOPWNt5xDDxSQLUlePFzZWaDXRb25cBmIMB2QPm7
 KrVz7s7VoDHmRsF5f/UppOOOR+8CE7CD7b3bBs69yv43xbIhgT22B9QrNT1V5eobZIpJ
 NYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731618155; x=1732222955;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8xMxbLuqYUOAO97RnSz2IGo3OvTtmoe9G2YVBXewgY0=;
 b=BAhonTW4KlfTTtjQ/V7+kjSm/Pw0FFo0kcw57NG7fVbkIz5HEkiUp5zQ/C2FfyDQVr
 5bDtvtltqLOz4gJxajZ9Cu1tGIXaejXO7VfRB9fovgq13VdM4S7EMlxJ+MM+gREIHvLr
 rKIjuQo/yyv+jig2Axj1i05UtbB3IP96STMf2lvoI5RUEpWteS6+Zv9PB/MvyOEbv0II
 l3gOQ9ljoysrjRujRRp3XIj52KSHLrRdYWPjkyoYsCEK3AhAEWpiOYEhSJNu+p+uY7dh
 CLkopOThaULNRBiP9lAvu38DpZbAs1xkJDXe1umoyBaSAo4WBUlF2XB/LeWieq5j2g4y
 uDFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdFoyu+M96ujROao8BmmG+Sk4/7doTx/AwzLCSJoB0C6Gf1Y09gcCFUsNUR4dNW45lv/JOJWabng==@nongnu.org
X-Gm-Message-State: AOJu0Yy3FR57cf/27HRErry94lck4984eAchUHidOo1ZAd0Pa/9ClynG
 0jHfptH6vokEpWIatVJuChwTBnMnFtk4lm4ZU2pcHSQmZFoffGU54Op7NTn6hFg=
X-Received: by 2002:a05:6000:98e:b0:37d:54d0:1f20 with SMTP id
 ffacd0b85a97d-38225a04975mr160037f8f.24.1731618154983; 
 Thu, 14 Nov 2024 13:02:34 -0800 (PST)
Received: from localhost.localdomain ([176.187.209.228])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821adbbc4fsm2453941f8f.46.2024.11.14.13.02.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 14 Nov 2024 13:02:33 -0800 (PST)
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
Subject: [PATCH RESEND v2 18/19] hw/net/xilinx_ethlite: Rename 'mmio' MR as
 'container'
Date: Thu, 14 Nov 2024 22:00:09 +0100
Message-ID: <20241114210010.34502-19-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114210010.34502-1-philmd@linaro.org>
References: <20241114210010.34502-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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
X-TUID: PJZ9nZ4eKeUq

Having all its address range mapped by subregions,
s->mmio MemoryRegion effectively became a container.
Rename it as 'container' for clarity.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/xilinx_ethlite.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index 0d445653b2..5f1ff7b712 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -86,7 +86,7 @@ struct XlnxXpsEthLite
 {
     SysBusDevice parent_obj;
 
-    MemoryRegion mmio;
+    MemoryRegion container;
     qemu_irq irq;
     NICState *nic;
     NICConf conf;
@@ -301,7 +301,7 @@ static void xilinx_ethlite_realize(DeviceState *dev, Error **errp)
 {
     XlnxXpsEthLite *s = XILINX_ETHLITE(dev);
 
-    memory_region_init(&s->mmio, OBJECT(dev),
+    memory_region_init(&s->container, OBJECT(dev),
                        "xlnx.xps-ethernetlite", 0x2000);
 
     object_initialize_child(OBJECT(dev), "ethlite.mdio", &s->mdio,
@@ -309,31 +309,31 @@ static void xilinx_ethlite_realize(DeviceState *dev, Error **errp)
     qdev_prop_set_string(DEVICE(&s->mdio), "name", "ethlite.mdio");
     qdev_prop_set_uint64(DEVICE(&s->mdio), "size", 4 * 4);
     sysbus_realize(SYS_BUS_DEVICE(&s->mdio), &error_fatal);
-    memory_region_add_subregion(&s->mmio, A_MDIO_BASE,
+    memory_region_add_subregion(&s->container, A_MDIO_BASE,
                            sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->mdio), 0));
 
     for (unsigned i = 0; i < 2; i++) {
         memory_region_init_ram(&s->port[i].txbuf, OBJECT(dev),
                                i ? "ethlite.tx[1]buf" : "ethlite.tx[0]buf",
                                BUFSZ_MAX, &error_abort);
-        memory_region_add_subregion(&s->mmio, 0x0800 * i, &s->port[i].txbuf);
+        memory_region_add_subregion(&s->container, 0x0800 * i, &s->port[i].txbuf);
         memory_region_init_io(&s->port[i].txio, OBJECT(dev),
                               &eth_porttx_ops, s,
                               i ? "ethlite.tx[1]io" : "ethlite.tx[0]io",
                               4 * TX_MAX);
-        memory_region_add_subregion(&s->mmio, i ? A_TX_BASE1 : A_TX_BASE0,
+        memory_region_add_subregion(&s->container, i ? A_TX_BASE1 : A_TX_BASE0,
                                     &s->port[i].txio);
 
         memory_region_init_ram(&s->port[i].rxbuf, OBJECT(dev),
                                i ? "ethlite.rx[1]buf" : "ethlite.rx[0]buf",
                                BUFSZ_MAX, &error_abort);
-        memory_region_add_subregion(&s->mmio, 0x1000 + 0x0800 * i,
+        memory_region_add_subregion(&s->container, 0x1000 + 0x0800 * i,
                                     &s->port[i].rxbuf);
         memory_region_init_io(&s->port[i].rxio, OBJECT(dev),
                               &eth_portrx_ops, s,
                               i ? "ethlite.rx[1]io" : "ethlite.rx[0]io",
                               4 * RX_MAX);
-        memory_region_add_subregion(&s->mmio, i ? A_RX_BASE1 : A_RX_BASE0,
+        memory_region_add_subregion(&s->container, i ? A_RX_BASE1 : A_RX_BASE0,
                                     &s->port[i].rxio);
     }
 
@@ -349,7 +349,7 @@ static void xilinx_ethlite_init(Object *obj)
     XlnxXpsEthLite *s = XILINX_ETHLITE(obj);
 
     sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
-    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->container);
 }
 
 static Property xilinx_ethlite_properties[] = {
-- 
2.45.2

