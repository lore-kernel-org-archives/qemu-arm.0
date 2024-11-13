Received: by 2002:a17:505:7d82:b0:1be9:327d:8ee3 with SMTP id wv2csp438092njc;
        Wed, 13 Nov 2024 07:16:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWtQPhFU4qV1iOOZN2CDLKaDvni3y14iF+sNcUdV/i6OA5nI1yabeBmT7biNiy+9pHjWcNsJfokLO8tjA==@linaro.org
X-Google-Smtp-Source: AGHT+IE6NyG4n5Hc260AckV/5/toE6qEIcT/lWu6FOBsCNzcyDzUdfJ9qSEhWilMq+ybFGrq++ad
X-Received: by 2002:a05:620a:1a14:b0:7b1:e77b:26cc with SMTP id af79cd13be357-7b331e88d38mr2428150385a.9.1731511007118;
        Wed, 13 Nov 2024 07:16:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731511007; cv=none;
        d=google.com; s=arc-20240605;
        b=a+pKjOV39btDXlpRbbKyPC0PYho99P6pkDcjs56mxMVkIk5d5BBRk49tQcHiWVbe+a
         k6LHlYFb4Fsvee6CYk9ujYLUNrIgq/f03U9Y9Xa8L8ftqXoAt9iulGfLnyGvkCtu0h1M
         aDjvQ1Y1RjdTRUTRwkI68SdWNeHEnqvBUpKxGapgaFJx4DJh/YO5M25hadyLxvglBSNs
         qy5e5bPsiKDga5vbdtgtigcvyOBGQ65ChX6JK+u7CWRu+jHG0t+erNxn7/Q4PyDRtRPo
         TMGCfDdxJnJB+CGoa/tcyrdWOP/oD8YbyYHNei1+1wVuQZq9FHUx85932H7W//j0r8T5
         6NQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=B5fHvzroXJWd5ybla0hZmq+2663EwaeFGcEYF/myD0w=;
        fh=GcU1IwQ/c1KsYIvvFCgkCbQOsGDsNs/FZlLx7d66y2g=;
        b=QqyMCfiw5gE3fdnZgYyMihTVaxluMB8IN1ZNSAI/GQ6sfn/FGbV4hbAznk5Fyt4FJP
         9kdbPyJWz0WlFu1FLs0d0hKRJQNRty8IJ7LbChP3pxAJuEbaiTHJ5tgunZPUxxD9n/lM
         eDXdojRQLOOUHZC/w4JNpdCh6XZWlmR3jSs+t7609hUdU+exSQZEFtiMXrsM5prOqoH7
         lPIAv3noyma80r/zhtOuZZ4jyFlr7ohKACjoV+V/yL0Bncij+mfAs/ZzIsVnUqvwe10F
         xpV2Bi3SvJrW0IrVYkZnjV1hZux0z0q3+FY0HHup8FFpcjRVPM12DwdE9e9AM9jyuJUZ
         5VbA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="OIVPFf7/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b32ac59b3bsi1677846285a.201.2024.11.13.07.16.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Nov 2024 07:16:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="OIVPFf7/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBF6c-0003M4-Ti; Wed, 13 Nov 2024 10:16:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1tBF6b-0003IG-AU; Wed, 13 Nov 2024 10:16:29 -0500
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1tBF6W-0006Uy-1p; Wed, 13 Nov 2024 10:16:26 -0500
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-53c779ef19cso8391271e87.3; 
 Wed, 13 Nov 2024 07:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731510981; x=1732115781; darn=nongnu.org;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=B5fHvzroXJWd5ybla0hZmq+2663EwaeFGcEYF/myD0w=;
 b=OIVPFf7/S6CWZEBeRoGK0lUyzc+TLp8DsjvA7Y6BQAZ62W2L4ZwBTetZSYiBWL96RK
 9fhE3IgeXIummEod7kHYp3Yznp24PkNb9s7jNcrEfCqKeYFh7IZswJkL3jozJ+NVRRHs
 Z83ukCPHXkGAYShLu8tYj2BoiMSQmrYa/92xtiLw6lEqnLh6cdndoJmKLfBh2YKJ7U/G
 ixgm02SqHRBCogEmx/o/A199e3gEafPAwUK3oTDyrDmi5eKJzB5bG3RHq5QLNw5ucEju
 s5JfGQ3pzLzbwDGpXDj6fN+0db4NfZzpLkx67M/46xrmUN9CjUCA5D4XJAL9EtsM1J4Z
 KbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731510981; x=1732115781;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B5fHvzroXJWd5ybla0hZmq+2663EwaeFGcEYF/myD0w=;
 b=tm5e4e+FHjVYws8X1D4/+enq/86++FkgvzPxV3GZuhL5CMPVI9OKWEZS6AE6WHy5Kg
 Rt1UL5uPJv+t7Jv63eDZlSTs9kaa6r43zDktSeb88uGTRU82ZaJp98FBCDAIQqGXsCsO
 Pg7fG9uG4jBhNRuJfZ2mjgKES40Xn14u+AqSPvvJy2/ZAHTkHiYNu7jL4Wmaoie6otIn
 vRzY6Y05b8WN/WjRSCa2t8FM0QxEXcSCambYu06M5+JaCJqeg6rgSpIcoZM26sTjpb8k
 EtOsqS/yzHcOaGftoFjJF1Yit4LXmzOFq4f9AuMxpgXPlwdr0gCliGR1wILNgcClueFc
 0Ocg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiem4Y5w8ws00jkKwWzOEeWTbq+tOgFuVunPuXtmAXsHRpUCkLjmGa4v/QDAqn/10at40TmJpvxg==@nongnu.org
X-Gm-Message-State: AOJu0YzugB/74WE6S8IxuNGbtFFcbuut1wgzsa/egDmq5LLl/6Jdp2Kg
 s6UkqECOcP7rngpJ6PdvIEFmJXL/aMaBYSgXKrYZnok+Vyc5vTUY
X-Received: by 2002:a05:6512:3407:b0:539:fb49:c489 with SMTP id
 2adb3069b0e04-53d9fe7593bmr1829657e87.9.1731510980438; 
 Wed, 13 Nov 2024 07:16:20 -0800 (PST)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53d826a9b45sm2203242e87.212.2024.11.13.07.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 07:16:19 -0800 (PST)
Date: Wed, 13 Nov 2024 16:16:18 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Anton Johansson <anjo@rev.ng>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Gustavo Romero <gustavo.romero@linaro.org>
Subject: Re: [PATCH 06/20] hw/net/xilinx_ethlite: Map MDIO registers (as
 unimplemented)
Message-ID: <ZzTCwn9cykFTH0L_@zapote>
References: <20241112181044.92193-1-philmd@linaro.org>
 <20241112181044.92193-7-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241112181044.92193-7-philmd@linaro.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: qL5UIafdUIBh

On Tue, Nov 12, 2024 at 07:10:30PM +0100, Philippe Mathieu-Daudé wrote:
> Rather than handling the MDIO registers as RAM, map them
> as unimplemented I/O within the device MR.
> 
> The memory flat view becomes:
> 
>   (qemu) info mtree -f
>   FlatView #0
>    Root memory region: system
>     0000000081000000-00000000810007e3 (prio 0, i/o): xlnx.xps-ethernetlite
>     00000000810007e4-00000000810007f3 (prio 0, i/o): ethlite.mdio
>     00000000810007f4-0000000081001fff (prio 0, i/o): xlnx.xps-ethernetlite @00000000000007f4
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>


Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>



> ---
>  hw/net/xilinx_ethlite.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
> index e6f6179fce..76b1e7d826 100644
> --- a/hw/net/xilinx_ethlite.c
> +++ b/hw/net/xilinx_ethlite.c
> @@ -25,13 +25,17 @@
>  #include "qemu/osdep.h"
>  #include "qemu/module.h"
>  #include "qom/object.h"
> +#include "qapi/error.h"
>  #include "exec/tswap.h"
>  #include "hw/sysbus.h"
>  #include "hw/irq.h"
>  #include "hw/qdev-properties.h"
> +#include "hw/misc/unimp.h"
>  #include "net/net.h"
>  #include "trace.h"
>  
> +#define A_MDIO_BASE   0x07e4
> +
>  #define R_TX_BUF0     0
>  #define R_TX_LEN0     (0x07f4 / 4)
>  #define R_TX_GIE0     (0x07f8 / 4)
> @@ -71,6 +75,7 @@ struct XlnxXpsEthLite
>      unsigned int txbuf;
>      unsigned int rxbuf;
>  
> +    UnimplementedDeviceState mdio;
>      uint32_t regs[R_MAX];
>  };
>  
> @@ -231,6 +236,14 @@ static void xilinx_ethlite_realize(DeviceState *dev, Error **errp)
>  {
>      XlnxXpsEthLite *s = XILINX_ETHLITE(dev);
>  
> +    object_initialize_child(OBJECT(dev), "ethlite.mdio", &s->mdio,
> +                           TYPE_UNIMPLEMENTED_DEVICE);
> +    qdev_prop_set_string(DEVICE(&s->mdio), "name", "ethlite.mdio");
> +    qdev_prop_set_uint64(DEVICE(&s->mdio), "size", 4 * 4);
> +    sysbus_realize(SYS_BUS_DEVICE(&s->mdio), &error_fatal);
> +    memory_region_add_subregion(&s->mmio, A_MDIO_BASE,
> +                            sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->mdio), 0));
> +
>      qemu_macaddr_default_if_unset(&s->conf.macaddr);
>      s->nic = qemu_new_nic(&net_xilinx_ethlite_info, &s->conf,
>                            object_get_typename(OBJECT(dev)), dev->id,
> -- 
> 2.45.2
> 
