Received: by 2002:a17:505:7d82:b0:1be9:327d:8ee3 with SMTP id wv2csp574842njc;
        Wed, 13 Nov 2024 10:21:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVSu4x/ivv6QciKKbFNYas8GlObhsCA6lt4LvMnX6+FVN7AEy4rJwg4bUxyQb1E5MDON1pAutuL1+MocA==@linaro.org
X-Google-Smtp-Source: AGHT+IFAJPfeGKeCejN693KXGy04qf2vWxtfrwY1HEPCJF0GtEZndcWzLNOWkaXNwojZcu/7insg
X-Received: by 2002:a05:6358:ed12:b0:1aa:c4b4:b26f with SMTP id e5c5f4694b2df-1c641f7c9bamr1004362855d.26.1731522096692;
        Wed, 13 Nov 2024 10:21:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731522096; cv=none;
        d=google.com; s=arc-20240605;
        b=Z65oZEYD67x/e9azCfYX2DO6rBS8ciKF+QQ2C1ZEv97HXBlDi+CpRkjISgeKS1B0/0
         UVjjMZ+wZmQDti+eIwbWsJZhQdnRZT6z9V6lf8+EjNMy2kH09I6ZBexYpbFu6UHB4zAs
         5aoqjo5JJzGRUV2hXu/4Dq6oJsPBLt5TSx0Fq+2cCto8R8mc6X7vynm4kM54jdGHd2Gv
         oLXEkXzWMTzntWgh7/iFOApC6IMCKZLcofwesup60zAQyrKkVIAv1+1kfyYCz2sD9RUm
         1ka3Sqeo0ReRi/my7ZXLFGJj/Dt3q/UUMjYwj1ef15r5jgDWerraTS4bIvU2Ih1erPqD
         FTag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=B163VpaRJXxp3b2iqYNrwHU/NDgSITNT/KiNnMB0IkU=;
        fh=qIMyZCYGPd5wgfcVfJpUhuse7NMXqnjW177x0nVQTNU=;
        b=gkDS990T8yAbODCZQBcVXRvIvj1X2qmnW1bKQT1czxSInSamWVdqDnymlgMZeTbu61
         U8s3BPqBzFAblZQe4uw5yWJsHlcikTB05sk7cR3TtcKkLGYF+cuNBNp6NBvKTuZb1uWa
         8TJ1xVJqzr//VK+a3+xu8WBKpviZEsfbrGxEsheVpTILDCHQteY0SEJa1gZAJm8asga2
         7Z3lVe1dyJFJ4HYSBXexYg1W/jB2GVR55P5p5Nqzvgj3Ovbu0B5RiNGqoIK4XKCy8vHp
         FmckTlznFuR80tm1DMKpOCCQ426AFoiFgP29WkAJ+g6gyk4F213ohYmZphBg8E+l/6yC
         cNwg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FWzQz+NC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ff4101c6si160989261cf.42.2024.11.13.10.21.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Nov 2024 10:21:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FWzQz+NC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBHzV-0004ui-7h; Wed, 13 Nov 2024 13:21:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tBHzT-0004uX-82
 for qemu-arm@nongnu.org; Wed, 13 Nov 2024 13:21:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tBHzR-0002QI-7D
 for qemu-arm@nongnu.org; Wed, 13 Nov 2024 13:21:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731522076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=B163VpaRJXxp3b2iqYNrwHU/NDgSITNT/KiNnMB0IkU=;
 b=FWzQz+NCWXVu1RsYWv+kVq2WYvQ6S+/f0c2N3EznD0nUw3wE52xVDKJMF9WtmHMLGP/14V
 741CM+xOkdytEGXoQJap3+NIfKksg8amoWcuiMiTQCyHkHq931fzbYbB2vJFN4GQrI7pAV
 O/YMZf8J74aS6v8pipN6fhqpJcvVAKw=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-wya1f-B0O4O1D-NfHI9vfA-1; Wed, 13 Nov 2024 13:21:10 -0500
X-MC-Unique: wya1f-B0O4O1D-NfHI9vfA-1
X-Mimecast-MFC-AGG-ID: wya1f-B0O4O1D-NfHI9vfA
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-53da283f583so701575e87.3
 for <qemu-arm@nongnu.org>; Wed, 13 Nov 2024 10:21:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731522068; x=1732126868;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B163VpaRJXxp3b2iqYNrwHU/NDgSITNT/KiNnMB0IkU=;
 b=QtzqTHT5SDci0pj4g8RMuNe0dJ13+dwNKOVOhdjAhJyepDqHUuxbDU7thWel55cKMV
 b0okB2WMIM9iJ3R+Ol6rx/t/KNSYIjS3UMDgMvPEgX4MHGeCGE1/Y8eA+lFNROPKdc43
 aKloVEhN6U2MhIbOMvCeO5Q4rwXxOKzSua+yeclDNKOWGLZZ1ihgxO369rdn8hAFmR0/
 sEaANAFx5tIKDQdUDzo3VFiVDTF3z64ZksLolyrZy0DzNXMmccJs1GDqxeArgaeVDi8g
 R+Sa7lSxSQExv3BAKe4i0IH80uAEeDaNx0ZwMCMlyVxgaJS47XH6XWZZkuHQnDPBub+Q
 gHBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6S6MD2vKyF4XwU8OQm0cHpUWTc1ZII/kJMkekh3+HUSAei7VBJ3H6sEBMsaC7Re890bCQoDPvmw==@nongnu.org
X-Gm-Message-State: AOJu0YyOstoyLPy4BFiGxUcI5pLVOH3mVefsaOOiXgPYZpvbF5Yg5cit
 Lz6nSq1m7T4Hk1csSWWO+mokh04QvUsm4Oflp7EBPD2Olu7xPtMJO1OKXWZHxodK9GhhXp2QI22
 9CDs/w5zLZg4/nJqEULFsWSKLUXzEYd6IvUUPvOQXn8yGkkjGSA==
X-Received: by 2002:a05:6512:3a88:b0:536:a6c6:33f with SMTP id
 2adb3069b0e04-53d862bb481mr10575539e87.13.1731522068301; 
 Wed, 13 Nov 2024 10:21:08 -0800 (PST)
X-Received: by 2002:a05:6512:3a88:b0:536:a6c6:33f with SMTP id
 2adb3069b0e04-53d862bb481mr10575516e87.13.1731522067790; 
 Wed, 13 Nov 2024 10:21:07 -0800 (PST)
Received: from [192.168.10.47] ([151.49.84.243])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-432d54f75f9sm32575485e9.17.2024.11.13.10.21.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Nov 2024 10:21:07 -0800 (PST)
Message-ID: <5a3d70f5-e135-4450-aed4-eac03abc58c0@redhat.com>
Date: Wed, 13 Nov 2024 19:21:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/20] hw/net/xilinx_ethlite: Map the RAM buffer as RAM
 memory region
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Anton Johansson <anjo@rev.ng>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Gustavo Romero <gustavo.romero@linaro.org>
References: <20241112181044.92193-1-philmd@linaro.org>
 <20241112181044.92193-20-philmd@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20241112181044.92193-20-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bGHmtVBruGz9nivTtZC7i6HmL0GoHWVQ9FH0LLj0_-Y_1731522068
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.119,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: X86W+QhBsdSi

On 11/12/24 19:10, Philippe Mathieu-Daudé wrote:
> Rather than using I/O registers for RAM buffer, having to
> swap endianness back and forth (because the core memory layer
> automatically swaps endiannes for us), declare the buffers
> as RAM regions. Remove the now unused s->regs[] array.
> 
> The memory flat view becomes:
> 
>    FlatView #0
>     Root memory region: system
>      0000000081000000-00000000810007f3 (prio 0, ram): ethlite.tx[0]buf
>      00000000810007f4-00000000810007ff (prio 0, i/o): ethlite.tx[0]io
>      0000000081000800-0000000081000ff3 (prio 0, ram): ethlite.tx[1]buf
>      0000000081000ff4-0000000081000fff (prio 0, i/o): ethlite.tx[1]io
>      0000000081001000-00000000810017f3 (prio 0, ram): ethlite.rx[0]buf
>      00000000810017fc-00000000810017ff (prio 0, i/o): ethlite.rx[0]io
>      0000000081001800-0000000081001ff3 (prio 0, ram): ethlite.rx[1]buf
>      0000000081001ffc-0000000081001fff (prio 0, i/o): ethlite.rx[1]io

The receive buffers should end at 7fb and ffb; no need to repost of course.

Paolo

> 
> Mention the device datasheet in the file header.
> 
> Reported-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/net/xilinx_ethlite.c | 79 +++++++++++------------------------------
>   1 file changed, 20 insertions(+), 59 deletions(-)
> 
> diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
> index f681b91769..da453465ca 100644
> --- a/hw/net/xilinx_ethlite.c
> +++ b/hw/net/xilinx_ethlite.c
> @@ -2,6 +2,10 @@
>    * QEMU model of the Xilinx Ethernet Lite MAC.
>    *
>    * Copyright (c) 2009 Edgar E. Iglesias.
> + * Copyright (c) 2024 Linaro, Ltd
> + *
> + * DS580: https://docs.amd.com/v/u/en-US/xps_ethernetlite
> + * LogiCORE IP XPS Ethernet Lite Media Access Controller
>    *
>    * Permission is hereby granted, free of charge, to any person obtaining a copy
>    * of this software and associated documentation files (the "Software"), to deal
> @@ -27,7 +31,6 @@
>   #include "qemu/bitops.h"
>   #include "qom/object.h"
>   #include "qapi/error.h"
> -#include "exec/tswap.h"
>   #include "hw/sysbus.h"
>   #include "hw/irq.h"
>   #include "hw/qdev-properties.h"
> @@ -46,7 +49,6 @@
>   #define A_RX_BASE0    0x17fc
>   #define R_RX_BUF1     (0x1800 / 4)
>   #define A_RX_BASE1    0x1ffc
> -#define R_MAX         (0x2000 / 4)
>   
>   #define RX_BUFSZ_MAX  0x07e0
>   
> @@ -72,6 +74,8 @@ typedef struct XlnxXpsEthLitePort
>   {
>       MemoryRegion txio;
>       MemoryRegion rxio;
> +    MemoryRegion txbuf;
> +    MemoryRegion rxbuf;
>   
>       struct {
>           uint32_t tx_len;
> @@ -100,7 +104,6 @@ struct XlnxXpsEthLite
>   
>       UnimplementedDeviceState mdio;
>       XlnxXpsEthLitePort port[2];
> -    uint32_t regs[R_MAX];
>   };
>   
>   static inline void eth_pulse_irq(XlnxXpsEthLite *s)
> @@ -118,16 +121,12 @@ static unsigned addr_to_port_index(hwaddr addr)
>   
>   static void *txbuf_ptr(XlnxXpsEthLite *s, unsigned port_index)
>   {
> -    unsigned int rxbase = port_index * (0x800 / 4);
> -
> -    return &s->regs[rxbase + R_TX_BUF0];
> +    return memory_region_get_ram_ptr(&s->port[port_index].txbuf);
>   }
>   
>   static void *rxbuf_ptr(XlnxXpsEthLite *s, unsigned port_index)
>   {
> -    unsigned int rxbase = port_index * (0x800 / 4);
> -
> -    return &s->regs[rxbase + R_RX_BUF0];
> +    return memory_region_get_ram_ptr(&s->port[port_index].rxbuf);
>   }
>   
>   static uint64_t port_tx_read(void *opaque, hwaddr addr, unsigned int size)
> @@ -252,53 +251,6 @@ static const MemoryRegionOps eth_portrx_ops = {
>           },
>   };
>   
> -static uint64_t
> -eth_read(void *opaque, hwaddr addr, unsigned int size)
> -{
> -    XlnxXpsEthLite *s = opaque;
> -    uint32_t r = 0;
> -
> -    addr >>= 2;
> -
> -    switch (addr)
> -    {
> -        default:
> -            r = tswap32(s->regs[addr]);
> -            break;
> -    }
> -    return r;
> -}
> -
> -static void
> -eth_write(void *opaque, hwaddr addr,
> -          uint64_t val64, unsigned int size)
> -{
> -    XlnxXpsEthLite *s = opaque;
> -    uint32_t value = val64;
> -
> -    addr >>= 2;
> -    switch (addr)
> -    {
> -        default:
> -            s->regs[addr] = tswap32(value);
> -            break;
> -    }
> -}
> -
> -static const MemoryRegionOps eth_ops = {
> -    .read = eth_read,
> -    .write = eth_write,
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> -    .impl = {
> -        .min_access_size = 4,
> -        .max_access_size = 4,
> -    },
> -    .valid = {
> -        .min_access_size = 4,
> -        .max_access_size = 4
> -    }
> -};
> -
>   static bool eth_can_rx(NetClientState *nc)
>   {
>       XlnxXpsEthLite *s = qemu_get_nic_opaque(nc);
> @@ -354,6 +306,9 @@ static void xilinx_ethlite_realize(DeviceState *dev, Error **errp)
>   {
>       XlnxXpsEthLite *s = XILINX_ETHLITE(dev);
>   
> +    memory_region_init(&s->mmio, OBJECT(dev),
> +                       "xlnx.xps-ethernetlite", 0x2000);
> +
>       object_initialize_child(OBJECT(dev), "ethlite.mdio", &s->mdio,
>                              TYPE_UNIMPLEMENTED_DEVICE);
>       qdev_prop_set_string(DEVICE(&s->mdio), "name", "ethlite.mdio");
> @@ -363,6 +318,10 @@ static void xilinx_ethlite_realize(DeviceState *dev, Error **errp)
>                               sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->mdio), 0));
>   
>       for (unsigned i = 0; i < 2; i++) {
> +        memory_region_init_ram(&s->port[i].txbuf, OBJECT(dev),
> +                               i ? "ethlite.tx[1]buf" : "ethlite.tx[0]buf",
> +                               0x07f4, &error_abort);
> +        memory_region_add_subregion(&s->mmio, 0x0800 * i, &s->port[i].txbuf);
>           memory_region_init_io(&s->port[i].txio, OBJECT(dev),
>                                 &eth_porttx_ops, s,
>                                 i ? "ethlite.tx[1]io" : "ethlite.tx[0]io",
> @@ -370,6 +329,11 @@ static void xilinx_ethlite_realize(DeviceState *dev, Error **errp)
>           memory_region_add_subregion(&s->mmio, i ? A_TX_BASE1 : A_TX_BASE0,
>                                       &s->port[i].txio);
>   
> +        memory_region_init_ram(&s->port[i].rxbuf, OBJECT(dev),
> +                               i ? "ethlite.rx[1]buf" : "ethlite.rx[0]buf",
> +                               0x07f4, &error_abort);
> +        memory_region_add_subregion(&s->mmio, 0x1000 + 0x0800 * i,
> +                                    &s->port[i].rxbuf);
>           memory_region_init_io(&s->port[i].rxio, OBJECT(dev),
>                                 &eth_portrx_ops, s,
>                                 i ? "ethlite.rx[1]io" : "ethlite.rx[0]io",
> @@ -390,9 +354,6 @@ static void xilinx_ethlite_init(Object *obj)
>       XlnxXpsEthLite *s = XILINX_ETHLITE(obj);
>   
>       sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
> -
> -    memory_region_init_io(&s->mmio, obj, &eth_ops, s,
> -                          "xlnx.xps-ethernetlite", R_MAX * 4);
>       sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
>   }
>   

