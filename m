Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp964010njb;
        Wed, 12 Feb 2025 04:39:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWq1MJfxOpNONXgaNpimPK381V2xSOHlkp5Mu2LMFkYqkNNqhc4yS+dRG9+3FCXRPnDpq/of3SrsMhT6Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFcPHixecdBDyFf9OFRqdJACLec5vzM2O2v17BmkTONrekJ+aVT3OnMexJfJiTzrdz1fZER
X-Received: by 2002:a05:620a:4012:b0:7b7:28c:dcd9 with SMTP id af79cd13be357-7c06fc8be5fmr434844685a.29.1739363956245;
        Wed, 12 Feb 2025 04:39:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739363956; cv=none;
        d=google.com; s=arc-20240605;
        b=PcaTdRxed66sfjkYxkENNcLC5F3mf1QOl5U1haCIppqKo/NO2rtk2JpaZscYujQv4K
         mbq9miY51gOT3nl8JFgorD64ax59pOea7wW/jnc0hzBpYEU5ftqC7Gw3HPylsgbuezJj
         nfWUc3Pm4GWwYn5PQCmXN8ALafc3LBJdHds7GjRCreHPB7I821Qv6gP/aJKbFwnRvZbP
         m3Q/bd8B9W44JeOmwWIvMlNp+Apt8b9oPzwUdDE80xdSj2RitjkNLiFes8ZJk3ictJhq
         Honz3T6JpTS2j8ijS/wwG3mkIqiNKH5Cfjc3D8i9jh4hhkIZlH9dZrg8bDHRqMfVXcvA
         woMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bl4sjYgd+6H7eHNUlupuE7g4cuSiaY2xksyCAoSPYXk=;
        fh=lhvKafqMdsPxuQ3U89r3JGl6dGOdafmIIAqjCyjBKQQ=;
        b=MA7xsng52WwpOiCMyg1GA1kaQZllbm4gHGqBmCb35S6A6Dh73G0dkqzL4Gw/xPiY6r
         AQuIhX/rRnnRKCJwi25mtpBHsfRUWz45sqiHGFTaUzN+0eyhnjSOzpezvMNxWvUsiy9T
         DeroJElmXc61OxLAKtQlhu6vRNV8nePrPka/OB36nvKCSs2RlxhaOS3xkoDj3KMw+VPN
         U70NUYjycrkbkGEhGtejPB8MUf9wYz4QpZbinsXS2f4ALKej93Zp3XLMplU8a1+4i+hk
         35mpaEAl6EoU+Ry4Sgyj2GQgRDNfqyYUbADsQFMvv1CWXUAU+4rfIW8KU0HfJGoK4i23
         fjZg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RmkZs9ri;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c0724908f6si123096685a.553.2025.02.12.04.39.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 04:39:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RmkZs9ri;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiC0w-0004QX-7T; Wed, 12 Feb 2025 07:38:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiBzf-0003XM-Dj
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 07:37:35 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiBza-0000Qy-Dg
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 07:37:31 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-38dd935a267so3048309f8f.1
 for <qemu-arm@nongnu.org>; Wed, 12 Feb 2025 04:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739363836; x=1739968636; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bl4sjYgd+6H7eHNUlupuE7g4cuSiaY2xksyCAoSPYXk=;
 b=RmkZs9riLVHHXvcpw//Bxy47pmL7cOYO48WTVkOOMxYMZCskYqITki78KWf27RfOPL
 rkOoEe9K2apvVAfN1mVWgP81W4d0QYFf/3mm43nyGaHeIsvYFrrYN6XstdTaa25cDRP0
 0TMAe+Il98nvmqUhMgv1QlU3cVROtmOs0Ao483bOFGKizK/AjMTY/cCg+xAGTW2VSTA1
 OWzCo/CgnoqhoG0zSdjiA/crh/By+OAJIQiT7X31xu04dS6FtoT5LWA9eiJNXB2eySOh
 ZoBUK5KX5cOaXRFXab0vRXhKO64sdELSs2ZlxQ5PutcZca7m0JGOEbukz/yBS2xqyfvF
 TI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739363836; x=1739968636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bl4sjYgd+6H7eHNUlupuE7g4cuSiaY2xksyCAoSPYXk=;
 b=OhyoIdglXZ+Z4h9ZpX3GzLcwGQhW6BgJBAj1IHEXa2Rh214ePceZoaYtP5uq8o2jFO
 TceIMFDJ4WO2ARV3BJMNjt+R5BGOOL4Eiw/lgrxsg8mABKDIZNXzNXBEz2qktpBZUqpB
 RdMVumbT0S4L4nb/IO4XKBVKJBAxRBPYvuEXBfj1kio1sGIfClu9bxk3nb8QTcg9SzFr
 ICB70LFMu9B1fkMFVdK6+fbmBxYZxwWPDdPXwGQIE6MtwSJAJFkhc6f6p9IhKnDPSFZE
 1M+PSntvTmz+MERs/yGWIz/LifaVpQOVlw4eFh7eCxKdYwSLjZ5THb7nPbIcdyjOK3Aj
 KQ5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWr4zKrHdDDEpouGon5WzhQUszBVlC9JbQeiUaSmqclFbvHipsatEH1tJ8SKRWaC/feLH3pUDjXag==@nongnu.org
X-Gm-Message-State: AOJu0YwCYUr44g2IMLoa6srnpt48MQkp0KClRrCYfdLrPokvEyHXk34R
 5VrQG6pW6ZKhWxrYndcmSrz9isfgMe+Yf1XBdRHqAs/Jwki/EDbbVopksbODHXw=
X-Gm-Gg: ASbGncv/lRgAICD4eFPPMJHiTE6w7LXcKvSi1MtRAEPQNAJpK3eyn9qitHeb7oUAxT8
 MQHRsWkuQoVyh2+2Xma92O00jiK7jCcXanhSVcFDBZEmTE0yi6zy4zrwanwI6lhvzHsOorvgnsC
 w7e/6sj9j5E0cbsIkkpNM1u0cW7QV2tzYdPkQZM2VMbmh6vgM+Na4nHVkwu9as8H+ioa4v/6UgD
 kyHiflLYDuNe60IYOKs8I3lyIqQural6VefebCkRfmenZUQPL70sl+rSLZHVPhDo369WJmCCtNa
 217yMEweEpndy6VMXySM4nlFnibuN+Nyfw/Nuk+TCI9uJYGnIKpFcipwzux9t4N36w==
X-Received: by 2002:a5d:59ab:0:b0:38d:d8b2:ceef with SMTP id
 ffacd0b85a97d-38dea2709b9mr2593018f8f.13.1739363836237; 
 Wed, 12 Feb 2025 04:37:16 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dd2750829sm12277708f8f.7.2025.02.12.04.37.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Feb 2025 04:37:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v7 03/10] hw/net/xilinx_ethlite: Make device endianness
 configurable
Date: Wed, 12 Feb 2025 13:36:52 +0100
Message-ID: <20250212123659.52764-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250212123659.52764-1-philmd@linaro.org>
References: <20250212123659.52764-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 2If4yYYS+g5p

Replace the DEVICE_NATIVE_ENDIAN MemoryRegionOps by a pair
of DEVICE_LITTLE_ENDIAN / DEVICE_BIG_ENDIAN.
Add the "little-endian" property to select the device
endianness, defaulting to little endian.
Set the proper endianness on the single machine using the
device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/microblaze/petalogix_s3adsp1800_mmu.c |  1 +
 hw/net/xilinx_ethlite.c                  | 29 +++++++++++++++++++-----
 hw/riscv/microblaze-v-generic.c          |  1 +
 3 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/petalogix_s3adsp1800_mmu.c
index 15cabe11777..d419dc49a25 100644
--- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
+++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
@@ -123,6 +123,7 @@ petalogix_s3adsp1800_init(MachineState *machine)
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, irq[TIMER_IRQ]);
 
     dev = qdev_new("xlnx.xps-ethernetlite");
+    qdev_prop_set_enum(dev, "endianness", endianness);
     qemu_configure_nic_device(dev, true, NULL);
     qdev_prop_set_uint32(dev, "tx-ping-pong", 0);
     qdev_prop_set_uint32(dev, "rx-ping-pong", 0);
diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index 14bf2b2e17a..15d9b95aa80 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -34,6 +34,7 @@
 #include "hw/sysbus.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
+#include "hw/qdev-properties-system.h"
 #include "hw/misc/unimp.h"
 #include "net/net.h"
 #include "trace.h"
@@ -85,6 +86,7 @@ struct XlnxXpsEthLite
 {
     SysBusDevice parent_obj;
 
+    EndianMode model_endianness;
     MemoryRegion container;
     qemu_irq irq;
     NICState *nic;
@@ -183,10 +185,10 @@ static void port_tx_write(void *opaque, hwaddr addr, uint64_t value,
     }
 }
 
-static const MemoryRegionOps eth_porttx_ops = {
+static const MemoryRegionOps eth_porttx_ops[2] = {
+    [0 ... 1] = {
         .read = port_tx_read,
         .write = port_tx_write,
-        .endianness = DEVICE_NATIVE_ENDIAN,
         .impl = {
             .min_access_size = 4,
             .max_access_size = 4,
@@ -195,6 +197,9 @@ static const MemoryRegionOps eth_porttx_ops = {
             .min_access_size = 4,
             .max_access_size = 4,
         },
+    },
+    [0].endianness = DEVICE_LITTLE_ENDIAN,
+    [1].endianness = DEVICE_BIG_ENDIAN,
 };
 
 static uint64_t port_rx_read(void *opaque, hwaddr addr, unsigned int size)
@@ -232,10 +237,10 @@ static void port_rx_write(void *opaque, hwaddr addr, uint64_t value,
     }
 }
 
-static const MemoryRegionOps eth_portrx_ops = {
+static const MemoryRegionOps eth_portrx_ops[2] = {
+    [0 ... 1] = {
         .read = port_rx_read,
         .write = port_rx_write,
-        .endianness = DEVICE_NATIVE_ENDIAN,
         .impl = {
             .min_access_size = 4,
             .max_access_size = 4,
@@ -244,6 +249,9 @@ static const MemoryRegionOps eth_portrx_ops = {
             .min_access_size = 4,
             .max_access_size = 4,
         },
+    },
+    [0].endianness = DEVICE_LITTLE_ENDIAN,
+    [1].endianness = DEVICE_BIG_ENDIAN,
 };
 
 static bool eth_can_rx(NetClientState *nc)
@@ -300,6 +308,14 @@ static NetClientInfo net_xilinx_ethlite_info = {
 static void xilinx_ethlite_realize(DeviceState *dev, Error **errp)
 {
     XlnxXpsEthLite *s = XILINX_ETHLITE(dev);
+    unsigned ops_index;
+
+    if (s->model_endianness == ENDIAN_MODE_UNSPECIFIED) {
+        error_setg(errp, TYPE_XILINX_ETHLITE " property 'endianness'"
+                         " must be set to 'big' or 'little'");
+        return;
+    }
+    ops_index = s->model_endianness == ENDIAN_MODE_BIG ? 1 : 0;
 
     memory_region_init(&s->container, OBJECT(dev),
                        "xlnx.xps-ethernetlite", 0x2000);
@@ -328,7 +344,7 @@ static void xilinx_ethlite_realize(DeviceState *dev, Error **errp)
                                BUFSZ_MAX, &error_abort);
         memory_region_add_subregion(&s->container, 0x0800 * i, &s->port[i].txbuf);
         memory_region_init_io(&s->port[i].txio, OBJECT(dev),
-                              &eth_porttx_ops, s,
+                              &eth_porttx_ops[ops_index], s,
                               i ? "ethlite.tx[1]io" : "ethlite.tx[0]io",
                               4 * TX_MAX);
         memory_region_add_subregion(&s->container, i ? A_TX_BASE1 : A_TX_BASE0,
@@ -340,7 +356,7 @@ static void xilinx_ethlite_realize(DeviceState *dev, Error **errp)
         memory_region_add_subregion(&s->container, 0x1000 + 0x0800 * i,
                                     &s->port[i].rxbuf);
         memory_region_init_io(&s->port[i].rxio, OBJECT(dev),
-                              &eth_portrx_ops, s,
+                              &eth_portrx_ops[ops_index], s,
                               i ? "ethlite.rx[1]io" : "ethlite.rx[0]io",
                               4 * RX_MAX);
         memory_region_add_subregion(&s->container, i ? A_RX_BASE1 : A_RX_BASE0,
@@ -363,6 +379,7 @@ static void xilinx_ethlite_init(Object *obj)
 }
 
 static const Property xilinx_ethlite_properties[] = {
+    DEFINE_PROP_ENDIAN_NODEFAULT("endianness", XlnxXpsEthLite, model_endianness),
     DEFINE_PROP_UINT32("tx-ping-pong", XlnxXpsEthLite, c_tx_pingpong, 1),
     DEFINE_PROP_UINT32("rx-ping-pong", XlnxXpsEthLite, c_rx_pingpong, 1),
     DEFINE_NIC_PROPERTIES(XlnxXpsEthLite, conf),
diff --git a/hw/riscv/microblaze-v-generic.c b/hw/riscv/microblaze-v-generic.c
index ebdd461ae98..a21fdfbe6db 100644
--- a/hw/riscv/microblaze-v-generic.c
+++ b/hw/riscv/microblaze-v-generic.c
@@ -120,6 +120,7 @@ static void mb_v_generic_init(MachineState *machine)
 
     /* Emaclite */
     dev = qdev_new("xlnx.xps-ethernetlite");
+    qdev_prop_set_enum(dev, "endianness", ENDIAN_MODE_LITTLE);
     qemu_configure_nic_device(dev, true, NULL);
     qdev_prop_set_uint32(dev, "tx-ping-pong", 0);
     qdev_prop_set_uint32(dev, "rx-ping-pong", 0);
-- 
2.47.1

