Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2821781njc;
        Tue, 5 Nov 2024 05:30:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWkD+cJOP9O1sSHlJYvoZ/XgyZnuz9bpZB1SOo3s2CUAtjeRwPNX8a0dpHCCvqREYHAB5GltVWnqnJcdw==@linaro.org
X-Google-Smtp-Source: AGHT+IEmYYWF/ImKtMT8FAE7R6ddnM68LX84GzO5ELbnG6uho3YPT+qwmIMvTjyOQBuqFzVBGg6r
X-Received: by 2002:a05:6102:2ad1:b0:4a3:ab95:9637 with SMTP id ada2fe7eead31-4a962e4a3d9mr14837720137.12.1730813443298;
        Tue, 05 Nov 2024 05:30:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730813443; cv=none;
        d=google.com; s=arc-20240605;
        b=f4ynDBtVpe8sFM1qOG9BtO7vyjrP75+nMtHfBv82q3h+nfFw7a6+80Tjy6IipSctwf
         4oGmovnegIMYztiFZ7lwnpL5nBzTrtwaarsRzbUxVnpnANNHQtAGdyjU/6VcLUygd9bf
         jsLF2En0SI601zpveL1ucsYNAMO15Eo1J1wb+g2cbVUasXbYkR0vlB/L3pvsRFKFXK+n
         8EJ9tHlZUXjQ4TRaZU1+efScd93kZkNM3Hpg5T1971zWnLv4nsjST/LPLHFVnK8cuzNI
         iIVdlHflv0GFsBLlUsZYA7FariSjX2lDNuXHK0r+RjLbDKcU6HBQL+oIxuIPxo4GJ//1
         hBoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=5Sss8rKk7Z6a7rjC/2C5ln/J+KjDoS++adVNtsROyxw=;
        fh=gBon++aOXrXU5x0+3Gx4EMO0bOTnojgYziv26K4bb+Q=;
        b=MIHVcPrzC9xcTyd+epC8N/E+OECZffyoIgLMOL+ebeHO3lxskLHyn0mw5j/QVe8ds9
         9naUvatsFFExaH6WzB2xlHreIaOwIO88gF1LYoHETIefsk0TvXUQzCjSY65GI3h5o2R+
         bQCtbtQnj1GyFZKKuo3LfUzhun4ab4ZOl/j6y39j7jfSGl8UoDhrpWE55MoGNnr5R65k
         xGY4JOlVh3Rsx/RsFNu2rCCcX59K3nrqllTkSjcZpmdhjznz0DBkE3gSIFlZKevyMeSr
         lShArBNUN/I97gVz4emfSab3xCVZw8xxKsUjNcRK+i/VRKNi19Nj1qMjUPMpoLXqS2Fn
         IB2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="MkRBm/lc";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4a957530d6fsi3014633137.397.2024.11.05.05.30.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 05:30:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="MkRBm/lc";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8Jdg-0000vf-MJ; Tue, 05 Nov 2024 08:30:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t8JdX-0000rE-Ci
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 08:30:29 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t8JdT-0007Dr-Hk
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 08:30:23 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-431695fa98bso43096055e9.3
 for <qemu-arm@nongnu.org>; Tue, 05 Nov 2024 05:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730813415; x=1731418215; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5Sss8rKk7Z6a7rjC/2C5ln/J+KjDoS++adVNtsROyxw=;
 b=MkRBm/lcl7rnmercMiawqUst6kZ3f8DcWAF9Z0ACPZCeHbkoWE7quAx+f6xYo7/pob
 5qnRaQngfyUdvUpT9+vheHbw172JOBim/k8jRbLDrMWdJwM051Knjt0IOatfKhbovZ5L
 DGNVoFx9xave16gpOISws+GdEWYRanIWpuguiIxy/xF4h3eVGMpYZWYvVyHGLnTelRIM
 EtolBCCPwvnoPparMdhesZfjqZ4hOr2d8i0kl7ODwYu4qGqMFy7iYlTwlDJ9qTtvuAeC
 UGfQ6yHAffcFqQMR8ZA5Qg9WrFgtu7S2XBjnHxmi8NKi9zJgkVAyqhep34KR3ZPBYIZZ
 FN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730813415; x=1731418215;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5Sss8rKk7Z6a7rjC/2C5ln/J+KjDoS++adVNtsROyxw=;
 b=wCGynPc22mQvVrH+O/ZGXys3TDdz0wGMixv8sp8GYUOMSw4eDMDIw/AEI+KjkqDfRV
 goq2cn+Z7RWEVhQD3xTB/iA+HhBLGVB2wyVOjXi4zKCk6R/2W3JQiQpr3fKzZgsPr1AF
 uYfTW5vhWDPTn6ny4h0hPL1CF/b6ibg5yxbudvFgMWsEnxppH6E7MXz0++YjbbB0M7gn
 LCfY1D6ujzfBc+wyxG4J0+8Vr1zowyV6zZosxk35NasnKwYvLndpLTF1d+OIFdrTlwyU
 biqxXDbkWMvCj33zFZfz+GUC/rPWUC54SFNAy2vdy7jKIn67uywFJYUnul9x5lQkHfPp
 Pq1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvKEHB1OUUr1pHBln9e21+3iXt7z0gQXgRNYsFYdZGKIYlXGKiEypdBlstHu9nKTwaZ2mg3usEPQ==@nongnu.org
X-Gm-Message-State: AOJu0Yylx3v/kHACX3tEDiZ4jreY/YgYUQW2LvLvaG5iX3Uw12/+JOKG
 vPGU9TUv+m9mzdBz3L55UWHeQfGk9qopC7TK+pMGe+3xcCg0hYfqtVMjERpUhVM=
X-Received: by 2002:a05:600c:3b93:b0:431:5ab3:d28d with SMTP id
 5b1f17b1804b1-4319ac9a6c9mr326871625e9.9.1730813414598; 
 Tue, 05 Nov 2024 05:30:14 -0800 (PST)
Received: from [192.168.21.227] ([154.14.63.34])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd8e8549sm224611245e9.10.2024.11.05.05.30.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2024 05:30:14 -0800 (PST)
Message-ID: <5f3a4435-dfd2-48cc-8b95-35b8bdd07810@linaro.org>
Date: Tue, 5 Nov 2024 13:30:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/19] hw/net/xilinx_ethlite: Only expect big-endian
 accesses
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Anton Johansson <anjo@rev.ng>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, devel@lists.libvirt.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>
References: <20241105130431.22564-1-philmd@linaro.org>
 <20241105130431.22564-13-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241105130431.22564-13-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
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
X-TUID: stfFfzOj9Pq+

On 11/5/24 13:04, Philippe Mathieu-Daudé wrote:
> The Xilinx 'ethlite' device was added in commit b43848a100
> ("xilinx: Add ethlite emulation"), being only built back
> then for a big-endian MicroBlaze target (see commit 72b675caac
> "microblaze: Hook into the build-system").
> 
> I/O endianness access was then clarified in commit d48751ed4f
> ("xilinx-ethlite: Simplify byteswapping to/from brams"). Here
> the 'fix' was to use tswap32(). Since the machine was built as
> big-endian target, tswap32() use means the fix was for a little
> endian host. While the datasheet (reference added in file header)
> is not precise about it, we interpret such change as the device
> expects accesses in big-endian order. Besides, this is what other
> Xilinx/MicroBlaze devices use (see the 3 previous commits).
> 
> Correct the MemoryRegionOps endianness. Add a 'access-little-endian'
> property, so if the bus access expect little-endian order we swap
> the values. Replace the tswap32() calls accordingly.
> 
> Set the property on the single machine using this device.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/microblaze/petalogix_s3adsp1800_mmu.c |  1 +
>   hw/net/xilinx_ethlite.c                  | 20 ++++++++++++++++----
>   2 files changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/petalogix_s3adsp1800_mmu.c
> index 8110be83715..8407dbee12a 100644
> --- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
> +++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
> @@ -123,6 +123,7 @@ petalogix_s3adsp1800_init(MachineState *machine)
>       qemu_configure_nic_device(dev, true, NULL);
>       qdev_prop_set_uint32(dev, "tx-ping-pong", 0);
>       qdev_prop_set_uint32(dev, "rx-ping-pong", 0);
> +    qdev_prop_set_bit(dev, "access-little-endian", !TARGET_BIG_ENDIAN);
>       sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>       sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, ETHLITE_BASEADDR);
>       sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, irq[ETHLITE_IRQ]);
> diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
> index ede7c172748..44ef11ebf89 100644
> --- a/hw/net/xilinx_ethlite.c
> +++ b/hw/net/xilinx_ethlite.c
> @@ -3,6 +3,9 @@
>    *
>    * Copyright (c) 2009 Edgar E. Iglesias.
>    *
> + * DS580: https://docs.amd.com/v/u/en-US/xps_ethernetlite
> + * LogiCORE IP XPS Ethernet Lite Media Access Controller
> + *
>    * Permission is hereby granted, free of charge, to any person obtaining a copy
>    * of this software and associated documentation files (the "Software"), to deal
>    * in the Software without restriction, including without limitation the rights
> @@ -25,7 +28,6 @@
>   #include "qemu/osdep.h"
>   #include "qemu/module.h"
>   #include "qom/object.h"
> -#include "exec/tswap.h"
>   #include "hw/sysbus.h"
>   #include "hw/irq.h"
>   #include "hw/qdev-properties.h"
> @@ -65,6 +67,7 @@ struct xlx_ethlite
>       NICState *nic;
>       NICConf conf;
>   
> +    bool access_little_endian;
>       uint32_t c_tx_pingpong;
>       uint32_t c_rx_pingpong;
>       unsigned int txbuf;
> @@ -103,9 +106,12 @@ eth_read(void *opaque, hwaddr addr, unsigned int size)
>               break;
>   
>           default:
> -            r = tswap32(s->regs[addr]);
> +            r = s->regs[addr];
>               break;
>       }
> +    if (s->access_little_endian) {
> +        bswap32s(&r);
> +    }
>       return r;
>   }
>   
> @@ -117,6 +123,10 @@ eth_write(void *opaque, hwaddr addr,
>       unsigned int base = 0;
>       uint32_t value = val64;
>   
> +    if (s->access_little_endian) {
> +        bswap32s(&value);
> +    }
> +
>       addr >>= 2;
>       switch (addr)
>       {
> @@ -161,7 +171,7 @@ eth_write(void *opaque, hwaddr addr,
>               break;
>   
>           default:
> -            s->regs[addr] = tswap32(value);
> +            s->regs[addr] = value;
>               break;
>       }
>   }
> @@ -169,7 +179,7 @@ eth_write(void *opaque, hwaddr addr,
>   static const MemoryRegionOps eth_ops = {
>       .read = eth_read,
>       .write = eth_write,
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .endianness = DEVICE_BIG_ENDIAN,
>       .impl = {
>           .min_access_size = 4,
>           .max_access_size = 4,
> @@ -256,6 +266,8 @@ static void xilinx_ethlite_init(Object *obj)
>   }
>   
>   static Property xilinx_ethlite_properties[] = {
> +    DEFINE_PROP_BOOL("access-little-endian", struct xlx_ethlite,
> +                     access_little_endian, false),

I'm not a fan of performing any swapping within device code.
The memory subsystem should do all of it.

A better solution is two tables, eth_ops_{be,le}, which differ only in the setting of 
.endianness.  Handle the property by registering the correct MemoryRegionOps during init.


r~
