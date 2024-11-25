Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1323930njc;
        Mon, 25 Nov 2024 06:21:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW0Y521WaHghVnM31EF69sRBvbBUAWANOOec/RBanmjmQ9dSWhQgu72I+3WAm7G7ygAUK/V/3/V0W1obw==@linaro.org
X-Google-Smtp-Source: AGHT+IHSpU7bKv9+b7JrwTgFMXJPqeOKeMJMGJFu7IGJQJkezOT+ThhMnv87dPYbl7fCcxB2lpdl
X-Received: by 2002:a05:620a:6014:b0:7b6:6e3f:49e0 with SMTP id af79cd13be357-7b66e3f4b97mr329358585a.41.1732544485871;
        Mon, 25 Nov 2024 06:21:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732544485; cv=none;
        d=google.com; s=arc-20240605;
        b=ITl8epoRbSzp0yBLnS/BrYy3tZjuqm/V1ly9L42NaDZLCJeBeXmGTautoDsLWAkgT6
         7CUy9S9p2YVTQJxkW0QAtm2M+xanxYnXT5bajsQL4oAL3LXM2pPXLGiD43BFESHgHmLj
         Vyij9sBesIeg7Shu4q8sXOWrTvEb4Q5jHW/yLUI3Da1MCBYm7/z2YLcl4MHt45MBqRKt
         gi/ezqlSXo9MNvwqIlWnoj0SSek0YhblX5AbxxgSwG5ybjrWD5cQOQqPf29uSSdAkIOi
         HJkXbQRyoXOlUk6eDcwfc0TilhQM1NXs21IVsX5xMzOGQKpIcuBcwa+PsIMd+S6lOtyf
         Qtig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=yAVWOFUvVKskdDU+V1zn93YlTAt78Y5f+KZ/cbLa3L0=;
        fh=UVRYWh0+nz6zJ9Q1gdV/QfY2HKq9vrDeDvGFh8Uzb7Y=;
        b=Gnec/q1QLlVveLPpk9WSYU1uX6Cfh0njlTCJYZQmrFS34zUDRdus0jJ1kRE079oMLG
         y1UHOiu3D/wF56FOSSwrtxKoPoSzcoSXGJAxRgdoXjtuYRJAvK4yWINj+H5Yn4+aiwSm
         EQkJ5QezSMiTX4aS0f+gGe1bfwk19bbFE+VdxIrHCOIoWZrBobVUeAhrH71OEzjrlmex
         aVtO+KLNsX5y/3EWAVxftwuDEUyPxWvWqZbwPkGgFhg2vcTu8evESWmetvThiL6tO4P5
         345fjSnrjkE6+JKvvHTpxjkCiulBr75A4Bjvo8Yb9zn5DH6xDuQ/XAIA0gsB2QuhwcN6
         sZ1w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CucN4xqt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b673148087si24678685a.678.2024.11.25.06.21.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Nov 2024 06:21:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CucN4xqt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tFZxD-00057f-T5; Mon, 25 Nov 2024 09:20:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tFZx7-00056r-ER
 for qemu-arm@nongnu.org; Mon, 25 Nov 2024 09:20:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tFZx4-0000XX-RH
 for qemu-arm@nongnu.org; Mon, 25 Nov 2024 09:20:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732544430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yAVWOFUvVKskdDU+V1zn93YlTAt78Y5f+KZ/cbLa3L0=;
 b=CucN4xqtI2ADKoqWQiGbsUipYCIXdQttrD1V43Ek1iayP5nmmb0NRiKuHaiu/pX/fHKsSg
 MiMK6jmpuIHv6fO6mdKNkaIz55A+HB/31bpodbgMTW+HFWtTebzfeyMg/LopJIpprsWY8I
 rhrG9+N2G+uPRWICLpem0qN3hjkpE54=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-253-ph3qNi-uNJi69Cixbe3-AQ-1; Mon, 25 Nov 2024 09:20:25 -0500
X-MC-Unique: ph3qNi-uNJi69Cixbe3-AQ-1
X-Mimecast-MFC-AGG-ID: ph3qNi-uNJi69Cixbe3-AQ
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7b66ec70846so77978385a.3
 for <qemu-arm@nongnu.org>; Mon, 25 Nov 2024 06:20:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732544425; x=1733149225;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yAVWOFUvVKskdDU+V1zn93YlTAt78Y5f+KZ/cbLa3L0=;
 b=aJs19vqkH2aXqgv4PgOhq56D+E6bqoStwWZ817FHQPxiEF2lON/4QOlU2DBt/Gnv7t
 JfiQuTZFGxLl198B6RF4KIjFAaNb5otQ4OfwGwL5w9BFwl8+W4rdY5y6+YGbdTLgw9x4
 eCp+Riev9jv57z8k5INwsugu/T0QcUATtG2LaAz4T/+Kt5Q3D6TuUKuv0PkNRVlyulFc
 FeF1y6Hm5al6bgIaR4qXAO3yIFV3DR6Hlk8dHagLMcoDVK35qr4E+uk4vP2DvtVZZivS
 ZR7SWp5Pn4W6upGWC2A054kkJNDLQ0aL6HBill7jNsC69AZCGPW7v3GlIXrd7yFMDrf6
 ZsGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBRJ4EeGosQbm4Ge3pMlETQC+gBnDlS8cGbpry4Jyd8L7E5CZKJa4Fmn7Hm6ZQRISfcWxJQAxavg==@nongnu.org
X-Gm-Message-State: AOJu0YzcnAaMkyVfM6SShvRHyiM2QYkgVII0zOatqENEN9cG+TVSaIZk
 iT/M1NsIQYO71DYA9Oc5lgMup7bjSQyPl9gYZcNRBwqVkBnkwsTVlzyudKTlrtbBIugwrLb8JHX
 0X94OAYBfn5/B0KRjgsaCLGXWXGjis9BCWMYkV24la9KDJT500A==
X-Gm-Gg: ASbGnct2eBQjjRr/l46kn7ZCuapLpct7SFpfJNb9INN5KQMlyZIWteMOeIpU5zpjoJ7
 31MGY42y8UME8RV93H/FIN9CGA+G2/8K68+TU7IgOfbKCKlwdEnasnOl3BG2iZ6YpvibCQ7RNq3
 j3zmyLrCclx/1H9+JA0Q1IlzfOChZ4/BMY6dIANJfPrUDvG+w1l0L7kza3xVxeKMvS4FPh5Jybt
 tgKXwkk2cPqf0yvIJcZOnI7rsO0G4BJbXiBc0NZTAmahDQkqOewgRm88A8VMc14/kb576TxXraI
 jqo=
X-Received: by 2002:a05:620a:25c6:b0:7af:c3f4:ee45 with SMTP id
 af79cd13be357-7b51459dc5cmr2135747185a.55.1732544424878; 
 Mon, 25 Nov 2024 06:20:24 -0800 (PST)
X-Received: by 2002:a05:620a:25c6:b0:7af:c3f4:ee45 with SMTP id
 af79cd13be357-7b51459dc5cmr2135741285a.55.1732544424331; 
 Mon, 25 Nov 2024 06:20:24 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-51-70.web.vodafone.de. [109.42.51.70])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b667f71523sm130134085a.0.2024.11.25.06.20.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 06:20:23 -0800 (PST)
Message-ID: <43924ccd-61b5-4862-ae54-6c9bfa5e8dda@redhat.com>
Date: Mon, 25 Nov 2024 15:20:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0 6/8] hw/riscv/virt: Remove pointless GPEX_HOST()
 cast
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-ppc@nongnu.org
References: <20241125140535.4526-1-philmd@linaro.org>
 <20241125140535.4526-7-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241125140535.4526-7-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mIUUKZQgQ0bnSLAsJRwIJ5tJs4naCZi-AdnvLVFBN6E_1732544425
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.93,
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
X-TUID: im7ZEioWpwbO

On 25/11/2024 15.05, Philippe Mathieu-Daudé wrote:
> No need to QOM-cast twice, since the intermediate value
> is not used.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/riscv/virt.c | 20 +++++++++-----------
>   1 file changed, 9 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 45a8c4f819..2feb851f15 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1140,23 +1140,21 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
>       dev = qdev_new(TYPE_GPEX_HOST);
>   
>       /* Set GPEX object properties for the virt machine */
> -    object_property_set_uint(OBJECT(GPEX_HOST(dev)), PCI_HOST_ECAM_BASE,
> +    object_property_set_uint(OBJECT(dev), PCI_HOST_ECAM_BASE,
>                               ecam_base, NULL);
> -    object_property_set_int(OBJECT(GPEX_HOST(dev)), PCI_HOST_ECAM_SIZE,
> +    object_property_set_int(OBJECT(dev), PCI_HOST_ECAM_SIZE,
>                               ecam_size, NULL);
> -    object_property_set_uint(OBJECT(GPEX_HOST(dev)),
> -                             PCI_HOST_BELOW_4G_MMIO_BASE,
> +    object_property_set_uint(OBJECT(dev), PCI_HOST_BELOW_4G_MMIO_BASE,
>                                mmio_base, NULL);
> -    object_property_set_int(OBJECT(GPEX_HOST(dev)), PCI_HOST_BELOW_4G_MMIO_SIZE,
> +    object_property_set_int(OBJECT(dev), PCI_HOST_BELOW_4G_MMIO_SIZE,
>                               mmio_size, NULL);
> -    object_property_set_uint(OBJECT(GPEX_HOST(dev)),
> -                             PCI_HOST_ABOVE_4G_MMIO_BASE,
> +    object_property_set_uint(OBJECT(dev), PCI_HOST_ABOVE_4G_MMIO_BASE,
>                                high_mmio_base, NULL);
> -    object_property_set_int(OBJECT(GPEX_HOST(dev)), PCI_HOST_ABOVE_4G_MMIO_SIZE,
> +    object_property_set_int(OBJECT(dev), PCI_HOST_ABOVE_4G_MMIO_SIZE,
>                               high_mmio_size, NULL);
> -    object_property_set_uint(OBJECT(GPEX_HOST(dev)), PCI_HOST_PIO_BASE,
> +    object_property_set_uint(OBJECT(dev), PCI_HOST_PIO_BASE,
>                               pio_base, NULL);
> -    object_property_set_int(OBJECT(GPEX_HOST(dev)), PCI_HOST_PIO_SIZE,
> +    object_property_set_int(OBJECT(dev), PCI_HOST_PIO_SIZE,
>                               pio_size, NULL);
>   
>       sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> @@ -1189,7 +1187,7 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
>           gpex_set_irq_num(GPEX_HOST(dev), i, PCIE_IRQ + i);
>       }
>   
> -    GPEX_HOST(dev)->gpex_cfg.bus = PCI_HOST_BRIDGE(GPEX_HOST(dev))->bus;
> +    GPEX_HOST(dev)->gpex_cfg.bus = PCI_HOST_BRIDGE(dev)->bus;
>       return dev;
>   }
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>

