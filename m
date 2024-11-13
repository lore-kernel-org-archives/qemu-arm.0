Received: by 2002:a17:505:7d82:b0:1be9:327d:8ee3 with SMTP id wv2csp451809njc;
        Wed, 13 Nov 2024 07:35:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUviWcus5LhqK7+m4dDwx64gGaTAsGOSIoIEGTmRBs7SFURo3cJ4Zq3tax00Rw51J9M+paY8dMXd0/Sng==@linaro.org
X-Google-Smtp-Source: AGHT+IEgfi+cAURM9e2EpcF1JNX7FvpI2CEuq3qtez65pz8KwiJu9uWhhoN7ggyMbEboxZ/fNHYi
X-Received: by 2002:a05:6122:a1a:b0:50d:160e:de73 with SMTP id 71dfb90a1353d-51401bd4ec0mr19886908e0c.6.1731512147065;
        Wed, 13 Nov 2024 07:35:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731512147; cv=none;
        d=google.com; s=arc-20240605;
        b=TNjPedmTKX9cKqixMUC85usvhG76UlIL3rCWo/8lFa28cOiTJ/m3xvu5pMFjyb+Gc0
         uq41A1zz2ag++9/KVix1DmmBpkdTkkmi3Vy/kX2d73VB6Nv22EMng7y9157Y9FGJGJCu
         SgxmMvZ0ibXlE7AvLd5veZ29l1fhnFs5ZwEgg3mis+VPTWpGdRBaw4+rCxmv1edHL6/6
         lRcn4XVq23hN218UcBWDpgm5QPrCyYPwHKIH8CMQOPrncmAMNNHX9D1N2pKqZn9G9NqA
         R0GCsNMutUMncwn6TEHME+HTpSSBwRVYmgqy4aXe1p1Kr3JArs05Yh4uX718m6dm841R
         +/oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=vZBLAStm8FCTgPNyHu7pl00RWgvkCF3+cQtxGJUqTMs=;
        fh=Lq9n5bM14Kv+YBsyktf1vsqLJngWqsz5rwprjEM/vWU=;
        b=ltYRbz1lwDXz3Kk61JJqvqmzzNSHhYnEFSCPVKGv/2Spl4Ovx1g6MG5o/l5WGqaGLf
         xNtqGvcER85NXuMkXhbdY1fnTK7MYRCFURxXAqgg41ZaPBcxRpTKR4q75OJiNa2na34R
         R/olguMZTl5DLRu+mLhRu7pwatJBhEHJ11sBQ6GmTAzdXeGjB9yITStuA4HxwP9ORgGt
         7pUW8oe6+98zRiscdfsJMyhRjuvmzha8bN82GMI6tl03qCbp/xKRwdfbGTtm2xyvfDD1
         BK5ovJgFmklXcUMFss0ZJRng7O+vPRbaV05/DHkyTfKf1rF7/CoXfiSIWhxdDPR2ZMXW
         t6Vw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=H8ZADC8U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-513f31640ddsi4063707e0c.42.2024.11.13.07.35.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Nov 2024 07:35:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=H8ZADC8U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBFPA-0005XN-9A; Wed, 13 Nov 2024 10:35:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1tBFP0-0005NI-Pq; Wed, 13 Nov 2024 10:35:34 -0500
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1tBFOy-00008O-Vb; Wed, 13 Nov 2024 10:35:30 -0500
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2f75c56f16aso65789871fa.0; 
 Wed, 13 Nov 2024 07:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731512126; x=1732116926; darn=nongnu.org;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vZBLAStm8FCTgPNyHu7pl00RWgvkCF3+cQtxGJUqTMs=;
 b=H8ZADC8U/0huyI7tPmW9cRklilOvnspfE6vbGd1IsPmBYljISpkDYQoVjolP3DUMXu
 hboyQAfEaJFjxORxeYL5vG9EuIK/yCsNz019oaSJu+1+sahkckvZ9Ao/TX1KPPAikwdb
 Sa4Ixdy/8/GjOCktBnBcMX8l2u0Z9ZIEcolKNo7YTU2hxXk8kHGQdGRui7uTgPHw8xKO
 eoOQjDrguP+Xr3N3Zdp14hcsZgNvoD6Zd0LVyuChXVvM6QDifoSFh3vS+BLZIh2fTrOS
 iYyCeVp1D1QDOt639R2Y863lkKI5HC1jqbSOoL6rgKHRAf/rOMC/H4MJufR1vI05z1fm
 O7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731512126; x=1732116926;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vZBLAStm8FCTgPNyHu7pl00RWgvkCF3+cQtxGJUqTMs=;
 b=U3OhDKuuntHSZyaIyAsUCFg/CIVY0e8galbcX/0cGeP1gp1aMeck+vFZz7BPn4sJRU
 yjfKRldJXW1brrp1i0EgyWXvA9y9Kauk9I1fwWIyVEYt/LJAbwxbt3MEFsSD6LtnX+H2
 YR1mIyBojUK49nJV8eUg9Yw9TfY6LI0SIXbHtBr3QRkqNidUwf4nhATVmYwsNQWci7iQ
 +oZdkPmk0T4JDQKDKNqPaaEy+msNDOEz2/hr6y6fPZgVMXb12raSpx1oNwKMZ5i7u9Zw
 jsVcCv0VFEp6AXHadutB/xL/7KustLaKNIYVuuz19FsHE3XO5ezchQlq1BJBJc1y/3mr
 /1lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlTh+VAkM3tnQS2oYXrkEAw+vssw/nnlTkF4MOiowyiaK3vQtsA8xDLwSvMVwZ41tWdyhVrETAAA==@nongnu.org
X-Gm-Message-State: AOJu0YwDHXaLAfZKldxfQKpQpxwE8D8CSYXyEEWHdfrjTjXQkfOE5fMp
 SKmx8QOal9CinmVmNceGKcKrvlQ0vQ8eqFoBNHNc/EoESIRVlfr7
X-Received: by 2002:a2e:a994:0:b0:2fb:4b40:1e1c with SMTP id
 38308e7fff4ca-2ff4c655fa7mr18856901fa.36.1731512126352; 
 Wed, 13 Nov 2024 07:35:26 -0800 (PST)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ff17991d06sm24091761fa.71.2024.11.13.07.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 07:35:25 -0800 (PST)
Date: Wed, 13 Nov 2024 16:35:25 +0100
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
Subject: Re: [PATCH 20/20] hw/net/xilinx_ethlite: Rename 'mmio' MR as
 'container'
Message-ID: <ZzTHPQp5SgjBXUN0@zapote>
References: <20241112181044.92193-1-philmd@linaro.org>
 <20241112181044.92193-21-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241112181044.92193-21-philmd@linaro.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x234.google.com
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
X-TUID: U6Zmh8LKZg02

On Tue, Nov 12, 2024 at 07:10:44PM +0100, Philippe Mathieu-Daudé wrote:
> Having all its address range mapped by subregions,
> s->mmio MemoryRegion effectively became a container.
> Rename it as 'container' for clarity.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>


> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/net/xilinx_ethlite.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
> index da453465ca..c65001cf46 100644
> --- a/hw/net/xilinx_ethlite.c
> +++ b/hw/net/xilinx_ethlite.c
> @@ -93,7 +93,7 @@ struct XlnxXpsEthLite
>  {
>      SysBusDevice parent_obj;
>  
> -    MemoryRegion mmio;
> +    MemoryRegion container;
>      qemu_irq irq;
>      NICState *nic;
>      NICConf conf;
> @@ -306,7 +306,7 @@ static void xilinx_ethlite_realize(DeviceState *dev, Error **errp)
>  {
>      XlnxXpsEthLite *s = XILINX_ETHLITE(dev);
>  
> -    memory_region_init(&s->mmio, OBJECT(dev),
> +    memory_region_init(&s->container, OBJECT(dev),
>                         "xlnx.xps-ethernetlite", 0x2000);
>  
>      object_initialize_child(OBJECT(dev), "ethlite.mdio", &s->mdio,
> @@ -314,31 +314,31 @@ static void xilinx_ethlite_realize(DeviceState *dev, Error **errp)
>      qdev_prop_set_string(DEVICE(&s->mdio), "name", "ethlite.mdio");
>      qdev_prop_set_uint64(DEVICE(&s->mdio), "size", 4 * 4);
>      sysbus_realize(SYS_BUS_DEVICE(&s->mdio), &error_fatal);
> -    memory_region_add_subregion(&s->mmio, A_MDIO_BASE,
> +    memory_region_add_subregion(&s->container, A_MDIO_BASE,
>                              sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->mdio), 0));
>  
>      for (unsigned i = 0; i < 2; i++) {
>          memory_region_init_ram(&s->port[i].txbuf, OBJECT(dev),
>                                 i ? "ethlite.tx[1]buf" : "ethlite.tx[0]buf",
>                                 0x07f4, &error_abort);
> -        memory_region_add_subregion(&s->mmio, 0x0800 * i, &s->port[i].txbuf);
> +        memory_region_add_subregion(&s->container, 0x0800 * i, &s->port[i].txbuf);
>          memory_region_init_io(&s->port[i].txio, OBJECT(dev),
>                                &eth_porttx_ops, s,
>                                i ? "ethlite.tx[1]io" : "ethlite.tx[0]io",
>                                4 * TX_MAX);
> -        memory_region_add_subregion(&s->mmio, i ? A_TX_BASE1 : A_TX_BASE0,
> +        memory_region_add_subregion(&s->container, i ? A_TX_BASE1 : A_TX_BASE0,
>                                      &s->port[i].txio);
>  
>          memory_region_init_ram(&s->port[i].rxbuf, OBJECT(dev),
>                                 i ? "ethlite.rx[1]buf" : "ethlite.rx[0]buf",
>                                 0x07f4, &error_abort);
> -        memory_region_add_subregion(&s->mmio, 0x1000 + 0x0800 * i,
> +        memory_region_add_subregion(&s->container, 0x1000 + 0x0800 * i,
>                                      &s->port[i].rxbuf);
>          memory_region_init_io(&s->port[i].rxio, OBJECT(dev),
>                                &eth_portrx_ops, s,
>                                i ? "ethlite.rx[1]io" : "ethlite.rx[0]io",
>                                4 * RX_MAX);
> -        memory_region_add_subregion(&s->mmio, i ? A_RX_BASE1 : A_RX_BASE0,
> +        memory_region_add_subregion(&s->container, i ? A_RX_BASE1 : A_RX_BASE0,
>                                      &s->port[i].rxio);
>      }
>  
> @@ -354,7 +354,7 @@ static void xilinx_ethlite_init(Object *obj)
>      XlnxXpsEthLite *s = XILINX_ETHLITE(obj);
>  
>      sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
> -    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->container);
>  }
>  
>  static Property xilinx_ethlite_properties[] = {
> -- 
> 2.45.2
> 
