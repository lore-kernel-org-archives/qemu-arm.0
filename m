Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3154038njc;
        Tue, 5 Nov 2024 14:39:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUr70Zg8jr91WzH8MeP3wkObLqS1tcemgWhTUFSd9+1zMNiqrryCV48MNR/FJ7EEGDXiwAxbuFJUeHz/g==@linaro.org
X-Google-Smtp-Source: AGHT+IEah6LzFD//042gT+Qea2BV2qfPYHQGOkMHXbLGxt40a5HR+fw7bjFf+HHTpcRtwSKeCqu+
X-Received: by 2002:a05:620a:4311:b0:7a9:aba6:d037 with SMTP id af79cd13be357-7b193ed8235mr5516015185a.13.1730846352199;
        Tue, 05 Nov 2024 14:39:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730846352; cv=none;
        d=google.com; s=arc-20240605;
        b=S+yNa1r5YIpI7pZv8gcsynce197qngUTVpWjTGGd4+nSU3RMTGTFbW8Nne9YKAg2+4
         g6sXnjTovM8hg+W3pv2636az0YeD9t1i57irehmIK9iKTQGMKRaIWMl+QMA8UfYjTU2B
         7QsSNmCW/TO3nVNldbCxgmq4Un5JrPV9d+gntfVlTR67T8YCOwjCSnxUuNe+HaISHp/2
         K6orBprCVh8Bga61LN+k/lqivnqc54w9+lcKpvBFo/jK0OELjXTe/CbANNak02xnzb1b
         1sqBYCPuqEXCatsOekGRb4il3/Nxdt6T4ZjWpvDAg8DIdU8xwwmTYkFnq909smgrxcoN
         W2fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ShFGJTpVKFc9QmQlqenOsyPYzBf+Ir7f6DuZ968ajtE=;
        fh=JQrwQORT4nDwB6w6aHcSiG16YbIyXY9Fu1VpFjeAYrg=;
        b=QKYrCTJrOsDuFQfXPEMkNVvLN1jzScwi5C/ILF/lI25y2JepB0kjz9mCYKWRdgqQoM
         JEhMUeiWFkm2/DKmrE1JtXIVwcLOgFjw6JKO86nZWntHxJ0CrW/GF+xy/6Wss7Ya2tpS
         VOf7U+aoIvG3b0s+HGo7ZTBWmfgPltKhGGtdhRBrC99x1V1mwhOP58rQi+vjO6pGsAB8
         G3PQ6BT4o+EpACQOQEMTIUVNOB8l9d7fcf8La07sfuxtOR6MuAOXmWUxHg9+FWQSrTyZ
         DTUi1L7KssGsIGvH4JnQ1jWfnUBkH/YMocehTULtE+jLEw1tmWOOGWkOy/GHLZTUD4Co
         ZO0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=SNLOUcAR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b2f3ab11efsi1428093485a.536.2024.11.05.14.39.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 14:39:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=SNLOUcAR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t8SCQ-0002fU-Bx; Tue, 05 Nov 2024 17:38:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1t8SCP-0002fI-8r; Tue, 05 Nov 2024 17:38:57 -0500
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1t8SCN-0002S9-ME; Tue, 05 Nov 2024 17:38:57 -0500
Received: by mail-ua1-x930.google.com with SMTP id
 a1e0cc1a2514c-851d6c397bbso1943842241.2; 
 Tue, 05 Nov 2024 14:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730846334; x=1731451134; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ShFGJTpVKFc9QmQlqenOsyPYzBf+Ir7f6DuZ968ajtE=;
 b=SNLOUcARxc85DmXVH80uZeQDeb5IgXsmLwqZBTCmnlwb6DgjFihEfT+l73iQxGWe7C
 VKwzegIlfyumYru/sHjDcOaknmpxy4NQCQe1IM8X7GWUJ6DORtL+sKWP9rmINdNmjnBp
 IZrrWdC7FO+KeQP1bYU65CHOaeCQ3glwsTKUEYOQQomb+w6+co/oINjbpWNESuFcb+Mf
 zFWFyrcAhazzIHAo8rHocqakc8tmvxdY1TB6a6Nswz2jITy/Dmu2Xap6kfcN1rd9jo2S
 4l5UnGFqOjNScXNiZpsAWG7MOUCZESPX5nYF/V2IwNtILsoh+cTF31hst4tkYEN6Fbfn
 URYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730846334; x=1731451134;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ShFGJTpVKFc9QmQlqenOsyPYzBf+Ir7f6DuZ968ajtE=;
 b=jfclHzVLEXo+HyIo4SB3W3xwrn5IYSQfMLjRmVZ9GVIvrljCEk+yWWCrhsJQcQ07Hp
 3ykyGRa8URThdLdxpbHLQGf0tWYHnZoCYyErSwe9aTbYNSH2XKFvYBjxtYxQgEBaSBut
 NOVt7aisL6z8JgUBDXSith4THct4cnl8TuJiPr76OfMdk2sh5KrAPqxlom0z+qyAv4Mp
 2CMSNcBatrTv9chr/lXpDT5d1tbYSgIdB0IDtD779x9taXXMAwgvgq/rt9b77xwHkZYs
 KhNw8c2XeAlfjX+jz+okPJJ9EbqqAf6/MV7ZRQiyiqieNm+Q+6WbyQvPaHV6BlHNBu89
 wpGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUM2UzosK8fhYUEG97UK4DoFrEwVvnf+jFAAQe7rlupG6Za8kD9EbWpjrRprWw8AWfBtgEDVYDZdw==@nongnu.org
X-Gm-Message-State: AOJu0YwE81od6f/GGlDGwsN9Rwnpds+6nnfTBE3/vMcAMxk3burCpgFu
 Dh+OAdTL46NOzEaQgmaN9SANxONadPPvzg7YNGJOUW0D/EDgs1Lp+bEMJ8Uw6SQaoshEC6t24Go
 HdyCj+9HyvnmITXZ1WjLsNWxi88g=
X-Received: by 2002:a05:6102:6cc:b0:4a5:6f41:211e with SMTP id
 ada2fe7eead31-4a8cfd598demr33376274137.24.1730846334280; Tue, 05 Nov 2024
 14:38:54 -0800 (PST)
MIME-Version: 1.0
References: <20241105130431.22564-1-philmd@linaro.org>
 <20241105130431.22564-7-philmd@linaro.org>
In-Reply-To: <20241105130431.22564-7-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 6 Nov 2024 08:38:28 +1000
Message-ID: <CAKmqyKMBaGoH_iXiQqX3TBuAJteGRA6UcXsFDuRqBSU-yLytaw@mail.gmail.com>
Subject: Re: [PATCH 06/19] hw/microblaze: Fix MemoryRegionOps coding style
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Anton Johansson <anjo@rev.ng>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, devel@lists.libvirt.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x930.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pRs/NB9J3Z4C

On Tue, Nov 5, 2024 at 11:07=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Fix few MemoryRegionOps style before adding new fields
> in the following commits.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/char/xilinx_uartlite.c | 4 ++--
>  hw/intc/xilinx_intc.c     | 4 ++--
>  hw/net/xilinx_ethlite.c   | 4 ++--
>  hw/timer/xilinx_timer.c   | 4 ++--
>  4 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/hw/char/xilinx_uartlite.c b/hw/char/xilinx_uartlite.c
> index f325084f8b9..a69ad769cc4 100644
> --- a/hw/char/xilinx_uartlite.c
> +++ b/hw/char/xilinx_uartlite.c
> @@ -172,8 +172,8 @@ static const MemoryRegionOps uart_ops =3D {
>      .endianness =3D DEVICE_NATIVE_ENDIAN,
>      .valid =3D {
>          .min_access_size =3D 1,
> -        .max_access_size =3D 4
> -    }
> +        .max_access_size =3D 4,
> +    },
>  };
>
>  static Property xilinx_uartlite_properties[] =3D {
> diff --git a/hw/intc/xilinx_intc.c b/hw/intc/xilinx_intc.c
> index 6e5012e66eb..2b8246f6206 100644
> --- a/hw/intc/xilinx_intc.c
> +++ b/hw/intc/xilinx_intc.c
> @@ -146,8 +146,8 @@ static const MemoryRegionOps pic_ops =3D {
>      .endianness =3D DEVICE_NATIVE_ENDIAN,
>      .valid =3D {
>          .min_access_size =3D 4,
> -        .max_access_size =3D 4
> -    }
> +        .max_access_size =3D 4,
> +    },
>  };
>
>  static void irq_handler(void *opaque, int irq, int level)
> diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
> index bd812908085..11eb53c4d60 100644
> --- a/hw/net/xilinx_ethlite.c
> +++ b/hw/net/xilinx_ethlite.c
> @@ -172,8 +172,8 @@ static const MemoryRegionOps eth_ops =3D {
>      .endianness =3D DEVICE_NATIVE_ENDIAN,
>      .valid =3D {
>          .min_access_size =3D 4,
> -        .max_access_size =3D 4
> -    }
> +        .max_access_size =3D 4,
> +    },
>  };
>
>  static bool eth_can_rx(NetClientState *nc)
> diff --git a/hw/timer/xilinx_timer.c b/hw/timer/xilinx_timer.c
> index 32a9df69e0b..0822345779c 100644
> --- a/hw/timer/xilinx_timer.c
> +++ b/hw/timer/xilinx_timer.c
> @@ -195,8 +195,8 @@ static const MemoryRegionOps timer_ops =3D {
>      .endianness =3D DEVICE_NATIVE_ENDIAN,
>      .valid =3D {
>          .min_access_size =3D 4,
> -        .max_access_size =3D 4
> -    }
> +        .max_access_size =3D 4,
> +    },
>  };
>
>  static void timer_hit(void *opaque)
> --
> 2.45.2
>
>
