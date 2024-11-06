Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3398498njc;
        Wed, 6 Nov 2024 01:54:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXy2LeIF144nyaGIio6y+qMDRnGBuctNTgB6L2Y43MQLJmaCO49n3t49RzypLqKJJiRwAxjTWCj8pVWkA==@linaro.org
X-Google-Smtp-Source: AGHT+IENpBtyWXM97cuzXTkcbQiAyQcQ1Kkkl8hbJOWI4uQ5wLQfBVhHXSgxcshSjo/JE7hoe9ij
X-Received: by 2002:a67:ea8d:0:b0:4a8:ff13:383 with SMTP id ada2fe7eead31-4a8ff130860mr21024058137.16.1730886847360;
        Wed, 06 Nov 2024 01:54:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730886847; cv=none;
        d=google.com; s=arc-20240605;
        b=RNWBTZBI4hwICaUIRZ4+4Nq2hg2WsV9h0IsfLDn5C0L0zJmZK2i0LN3OuYNXeIYw3e
         7513CB2cRQB846wwQ1swq8dpnVYYkT2Opo3+SSGZopuOl5EuxzCkKjT7UD1VSbufcUZ3
         mr4fNk2Zey/KxTk79VDR43my2QvP2GoY7w0LFCi9R2XaGmIccK/6UAFpkxTzd6zqBrBZ
         DwYy01O656qIJyDomSquZZ3Pmtvsgl8eg2A6uO5EEu6M3dA7v0M0qYX/DbGXE+frKgq0
         Qb999lizEczMFDW/uQpNdw9Kt0yL9ShR9m0nEDPA232l5nQav5K46llFjlyVklzg8iCt
         9/Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=nP+NRHrvPcF/GLP+M/LO3pbc+GXA6ruKrTtZ+hPidds=;
        fh=cuZRj0f0U1XNm7N9kFFJA1hLwW7tTZWh8oKd7IfSfdQ=;
        b=WYUGupRPgNEOQLPnZliO7aYD1eS9hj2Hrvz8sdCGJbt7yf7eoWJZheW9pZaXv/wuyd
         SjpP5rwhbH4DvmauO2GxfCxkSR+vcJ/uvWzkhhmXLdSDdI2wpHmXGAsuaHeouNoOKODe
         1NOo1B/zSBf6TfHFjGKgTOy/carHK9LPPGFO8JVWVsdkxrnmG5t8B5vS0Hba07on9mhw
         v7t62xeSvqN9/qiKfuZqAk9ST6ZaCTuQ997lq0eL28QZXApMrWzYh3Egm5EUSJGT/0Qv
         XIciz5e7LskfCURgp9V62JCHoqrfpBNZKSL0AyIJH7wjxtyJ2ibLkYkRfV/C3IpsPKgg
         pJng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lzR91N4a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d35417fdccsi168950786d6.365.2024.11.06.01.54.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Nov 2024 01:54:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lzR91N4a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8cjH-0003MJ-J8; Wed, 06 Nov 2024 04:53:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8cjB-0003Le-14
 for qemu-arm@nongnu.org; Wed, 06 Nov 2024 04:53:30 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8cj8-0007i1-Fe
 for qemu-arm@nongnu.org; Wed, 06 Nov 2024 04:53:28 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-37d5689eea8so3807886f8f.1
 for <qemu-arm@nongnu.org>; Wed, 06 Nov 2024 01:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730886804; x=1731491604; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nP+NRHrvPcF/GLP+M/LO3pbc+GXA6ruKrTtZ+hPidds=;
 b=lzR91N4aKDwNBR0g9qpD55Dzw+SL859btz50XeCaY+GSXc8gJr/JtJ696vonKhqTFb
 CZ17hmNhFf5hv+QwN4nnmBtX9uFRZn9K44aNLagDOVFzAbiOIF4ZdlSy+YKS3q8M8fUs
 4ipcraN8fEc5U8oiKL9IPhhRmuTzBQR2z8+RMcIyvQk0WaYxhEKjjKEvuK3jWNI33hmt
 bWH3pKbCDAch1w/jM9x4e3YRqWAUPkXxvu7Gaq5eWukGAJsK5p9wRXWBWQimT0la/q0t
 EA0hJZA6hBZcoWghS2NOGacF9s3Ob+GYPkCYP9jS5zkukcqagiiyMV6grAOnM6RI4zuN
 K4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730886804; x=1731491604;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nP+NRHrvPcF/GLP+M/LO3pbc+GXA6ruKrTtZ+hPidds=;
 b=rEbhMzsEeT2gNmqRaWZ+wqGj3I89cUWxMU2n62/KB8Vgasj9HyJmyti5U6hYmbhjs5
 o8EAwb74eeLzqT3RCulJR8OelKgNOLIRCO1u4E5lVdk/2D4/mEpbOgEvanZrtQ1vWMUt
 nokmmFhAiWwQ/5aB5gyX8MiRfCah4U9x1ksaSwkibrFsv79wvf5UWDFr2PkWwqszk+jR
 jZcUUrQWbEU0z9WFyF2n04a38Q5+wdy5r/xhTABPllCBm+QgJIfKmViEbvvlHILgWMZF
 +pfwDYMGXsnKMff1nVbcewXgfRRgtBcvgeyqIP+TmcAkJEVsoZFfgwx7CHVcuZiNDBSc
 Nfaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfyay48dRawMSCfSPcBbvHRdTM3B5uy+yEfnsmsCUVdJ30uUqusvxPlNrhNfXMlauBXydv4fd0aQ==@nongnu.org
X-Gm-Message-State: AOJu0YygtLWugMGWbd3daqZWtKYgkMITW2e7lS+QGEKkazMyz/dh5+j1
 K97DvlsB6or9xLWvtGn03Y5K0jI4xzRwUVlYucPrHcs1q6dqQPCHgZM7FwY0DWk=
X-Received: by 2002:a5d:47cc:0:b0:381:c935:dec9 with SMTP id
 ffacd0b85a97d-381c935dff4mr16973147f8f.12.1730886804126; 
 Wed, 06 Nov 2024 01:53:24 -0800 (PST)
Received: from [172.16.22.241] ([154.14.63.34])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10b7b27sm18835027f8f.19.2024.11.06.01.53.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2024 01:53:23 -0800 (PST)
Message-ID: <82295d07-796e-44f9-8185-4b1430260fe3@linaro.org>
Date: Wed, 6 Nov 2024 09:53:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/19] hw/net/xilinx_ethlite: Only expect big-endian
 accesses
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Anton Johansson <anjo@rev.ng>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, devel@lists.libvirt.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>
References: <20241105130431.22564-1-philmd@linaro.org>
 <20241105130431.22564-13-philmd@linaro.org>
 <5f3a4435-dfd2-48cc-8b95-35b8bdd07810@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <5f3a4435-dfd2-48cc-8b95-35b8bdd07810@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
X-TUID: vNVcYNoOOlfR

On 5/11/24 13:30, Richard Henderson wrote:
> On 11/5/24 13:04, Philippe Mathieu-Daudé wrote:
>> The Xilinx 'ethlite' device was added in commit b43848a100
>> ("xilinx: Add ethlite emulation"), being only built back
>> then for a big-endian MicroBlaze target (see commit 72b675caac
>> "microblaze: Hook into the build-system").
>>
>> I/O endianness access was then clarified in commit d48751ed4f
>> ("xilinx-ethlite: Simplify byteswapping to/from brams"). Here
>> the 'fix' was to use tswap32(). Since the machine was built as
>> big-endian target, tswap32() use means the fix was for a little
>> endian host. While the datasheet (reference added in file header)
>> is not precise about it, we interpret such change as the device
>> expects accesses in big-endian order. Besides, this is what other
>> Xilinx/MicroBlaze devices use (see the 3 previous commits).
>>
>> Correct the MemoryRegionOps endianness. Add a 'access-little-endian'
>> property, so if the bus access expect little-endian order we swap
>> the values. Replace the tswap32() calls accordingly.
>>
>> Set the property on the single machine using this device.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/microblaze/petalogix_s3adsp1800_mmu.c |  1 +
>>   hw/net/xilinx_ethlite.c                  | 20 ++++++++++++++++----
>>   2 files changed, 17 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c 
>> b/hw/microblaze/petalogix_s3adsp1800_mmu.c
>> index 8110be83715..8407dbee12a 100644
>> --- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
>> +++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
>> @@ -123,6 +123,7 @@ petalogix_s3adsp1800_init(MachineState *machine)
>>       qemu_configure_nic_device(dev, true, NULL);
>>       qdev_prop_set_uint32(dev, "tx-ping-pong", 0);
>>       qdev_prop_set_uint32(dev, "rx-ping-pong", 0);
>> +    qdev_prop_set_bit(dev, "access-little-endian", !TARGET_BIG_ENDIAN);
>>       sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>>       sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, ETHLITE_BASEADDR);
>>       sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, irq[ETHLITE_IRQ]);
>> diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
>> index ede7c172748..44ef11ebf89 100644
>> --- a/hw/net/xilinx_ethlite.c
>> +++ b/hw/net/xilinx_ethlite.c
>> @@ -3,6 +3,9 @@
>>    *
>>    * Copyright (c) 2009 Edgar E. Iglesias.
>>    *
>> + * DS580: https://docs.amd.com/v/u/en-US/xps_ethernetlite
>> + * LogiCORE IP XPS Ethernet Lite Media Access Controller
>> + *
>>    * Permission is hereby granted, free of charge, to any person 
>> obtaining a copy
>>    * of this software and associated documentation files (the 
>> "Software"), to deal
>>    * in the Software without restriction, including without limitation 
>> the rights
>> @@ -25,7 +28,6 @@
>>   #include "qemu/osdep.h"
>>   #include "qemu/module.h"
>>   #include "qom/object.h"
>> -#include "exec/tswap.h"
>>   #include "hw/sysbus.h"
>>   #include "hw/irq.h"
>>   #include "hw/qdev-properties.h"
>> @@ -65,6 +67,7 @@ struct xlx_ethlite
>>       NICState *nic;
>>       NICConf conf;
>> +    bool access_little_endian;
>>       uint32_t c_tx_pingpong;
>>       uint32_t c_rx_pingpong;
>>       unsigned int txbuf;
>> @@ -103,9 +106,12 @@ eth_read(void *opaque, hwaddr addr, unsigned int 
>> size)
>>               break;
>>           default:
>> -            r = tswap32(s->regs[addr]);
>> +            r = s->regs[addr];
>>               break;
>>       }
>> +    if (s->access_little_endian) {
>> +        bswap32s(&r);
>> +    }
>>       return r;
>>   }
>> @@ -117,6 +123,10 @@ eth_write(void *opaque, hwaddr addr,
>>       unsigned int base = 0;
>>       uint32_t value = val64;
>> +    if (s->access_little_endian) {
>> +        bswap32s(&value);
>> +    }
>> +
>>       addr >>= 2;
>>       switch (addr)
>>       {
>> @@ -161,7 +171,7 @@ eth_write(void *opaque, hwaddr addr,
>>               break;
>>           default:
>> -            s->regs[addr] = tswap32(value);
>> +            s->regs[addr] = value;
>>               break;
>>       }
>>   }
>> @@ -169,7 +179,7 @@ eth_write(void *opaque, hwaddr addr,
>>   static const MemoryRegionOps eth_ops = {
>>       .read = eth_read,
>>       .write = eth_write,
>> -    .endianness = DEVICE_NATIVE_ENDIAN,
>> +    .endianness = DEVICE_BIG_ENDIAN,
>>       .impl = {
>>           .min_access_size = 4,
>>           .max_access_size = 4,
>> @@ -256,6 +266,8 @@ static void xilinx_ethlite_init(Object *obj)
>>   }
>>   static Property xilinx_ethlite_properties[] = {
>> +    DEFINE_PROP_BOOL("access-little-endian", struct xlx_ethlite,
>> +                     access_little_endian, false),
> 
> I'm not a fan of performing any swapping within device code.
> The memory subsystem should do all of it.
> 
> A better solution is two tables, eth_ops_{be,le}, which differ only in 
> the setting of .endianness.  Handle the property by registering the 
> correct MemoryRegionOps during init.

Squashing this on top to have the two tables, but we still need to
swap back the effect of memory.c swapping for the binary, so I don't
think this is what you want:

-- >8 --
diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index 44ef11ebf89..d58757eb919 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -67,6 +67,7 @@ struct xlx_ethlite
      NICState *nic;
      NICConf conf;

+    bool model_little_endian;
      bool access_little_endian;
      uint32_t c_tx_pingpong;
      uint32_t c_rx_pingpong;
@@ -109,7 +110,7 @@ eth_read(void *opaque, hwaddr addr, unsigned int size)
              r = s->regs[addr];
              break;
      }
-    if (s->access_little_endian) {
+    if (s->access_little_endian ^ s->model_little_endian) {
          bswap32s(&r);
      }
      return r;
@@ -123,7 +124,7 @@ eth_write(void *opaque, hwaddr addr,
      unsigned int base = 0;
      uint32_t value = val64;

-    if (s->access_little_endian) {
+    if (s->access_little_endian ^ s->model_little_endian) {
          bswap32s(&value);
      }

@@ -176,7 +177,7 @@ eth_write(void *opaque, hwaddr addr,
      }
  }

-static const MemoryRegionOps eth_ops = {
+static const MemoryRegionOps eth_ops_be = {
      .read = eth_read,
      .write = eth_write,
      .endianness = DEVICE_BIG_ENDIAN,
@@ -190,6 +191,20 @@ static const MemoryRegionOps eth_ops = {
      },
  };

+static const MemoryRegionOps eth_ops_le = {
+    .read = eth_read,
+    .write = eth_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+};
+
  static bool eth_can_rx(NetClientState *nc)
  {
      struct xlx_ethlite *s = qemu_get_nic_opaque(nc);
@@ -247,6 +262,11 @@ static void xilinx_ethlite_realize(DeviceState 
*dev, Error **errp)
  {
      struct xlx_ethlite *s = XILINX_ETHLITE(dev);

+    memory_region_init_io(&s->mmio, OBJECT(dev),
+                          s->model_little_endian ? &eth_ops_le : 
&eth_ops_be, s,
+                          "xlnx.xps-ethernetlite", R_MAX * 4);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
+
      qemu_macaddr_default_if_unset(&s->conf.macaddr);
      s->nic = qemu_new_nic(&net_xilinx_ethlite_info, &s->conf,
                            object_get_typename(OBJECT(dev)), dev->id,
@@ -259,15 +279,13 @@ static void xilinx_ethlite_init(Object *obj)
      struct xlx_ethlite *s = XILINX_ETHLITE(obj);

      sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
-
-    memory_region_init_io(&s->mmio, obj, &eth_ops, s,
-                          "xlnx.xps-ethernetlite", R_MAX * 4);
-    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
  }

  static Property xilinx_ethlite_properties[] = {
      DEFINE_PROP_BOOL("access-little-endian", struct xlx_ethlite,
                       access_little_endian, false),
+    DEFINE_PROP_BOOL("model-little-endian", struct xlx_ethlite,
+                     model_little_endian, false),
      DEFINE_PROP_UINT32("tx-ping-pong", struct xlx_ethlite, 
c_tx_pingpong, 1),
      DEFINE_PROP_UINT32("rx-ping-pong", struct xlx_ethlite, 
c_rx_pingpong, 1),
      DEFINE_NIC_PROPERTIES(struct xlx_ethlite, conf),

---
