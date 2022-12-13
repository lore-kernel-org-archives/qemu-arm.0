Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4237856ejb;
        Tue, 13 Dec 2022 05:53:27 -0800 (PST)
X-Received: by 2002:a62:687:0:b0:56c:eaa5:465c with SMTP id 129-20020a620687000000b0056ceaa5465cmr21676833pfg.17.1670939607566;
        Tue, 13 Dec 2022 05:53:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670939607; cv=none;
        d=google.com; s=arc-20160816;
        b=tiz7KVXl8V+EvKfpwd5TmSWhWSjRnBTlCvUx347WVB4/4WIFQjAe9jGUoiVCF9yttW
         Cj6mm/4KEMIWanjIe94khsyitqjq5CsB/H4w33SagIuQZI06UhvJinBrrmVxhrvyQ46L
         0pmYjZSqN3gbbBdB92eOx6oit3s9MuAN3QETUKA4AXfDRZySdvSA0KkW73XHpl7LOTt2
         eR7q4ORmPnsw5ZimjRYtceomcaEX0MGan8UwZwLDdH4jkwXXO9LoLsuR03yHBUds1RSt
         NY50WrE2rFljqQauUTGO+Rju4YaVOcel3Ztiek3jPSTdG2MpLzMhaeMAIQelRaOesB6d
         Hp9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eHMaokyjr27CS5rkdbnnEtYsn9U4n9/xandQHoXDiNE=;
        b=Nq5sz4lNwwHMEyutbTmOOaLIhrht7Q6Mbg2TWHvXe75+8WuXtORZN/tLXAhsqkaw6i
         YNsoVsSnpZomfh8U2QkWM0MyhyhII7sUr6XS+1fBNEtCecLDUziADqh9EztmNQzjMyYA
         LeCmEF9xJgUC70fV0R+Ht00uKfgbtKZYwr7Ok0VIsTLYLVoTjg54UPukjDM6V8nqhNpX
         UYYHACWc1od4WNO66dES2MImRRz9zxL70LuZMDx6wzJDcVjhsvSJ8bDIlPsmE5lqrBJX
         RdX94lEnYlTA3KXEJ3drtLWoSfQ0JTjPA6WzWwAFE+5juiJcgHi3NxBMvZlMXyokN7Hj
         rt4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ltOa7mlE;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n7-20020aa78a47000000b005612553a535sor5332936pfa.15.2022.12.13.05.53.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 Dec 2022 05:53:27 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ltOa7mlE;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHMaokyjr27CS5rkdbnnEtYsn9U4n9/xandQHoXDiNE=;
        b=ltOa7mlELncktV/fY+kCf6K4cJWjkUKON1LnvkkOqhjZnDkJPEXVtW8HBP2wy8++PL
         ScRAH/7iwb66wx2kva7VKxxSYMHk4xJGzFRLDkXLsqXD0VXQeLmPZuhoiMofqeMNm3Uy
         CvuaBi5shOmIstg31jOvV6F2wyoZbZEzNE/Ra9C6X1duRFuBnZoLAMjD2NligYm+Absf
         y5u5xHzwmVc0Iqoy3YcyMl/DRQpPXftWAMeQlRKpC8fCJGZdkhgIuYvgw4ZCrTcro1jF
         +wQN8QDTydY2g5fyWASv+MuHEJMp9O1n1iyOJf5zvxAxJB8Jw92+165HeiegDt8vTh82
         W2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHMaokyjr27CS5rkdbnnEtYsn9U4n9/xandQHoXDiNE=;
        b=i7qowwi25KDo9fMgLUDOfwYe7/vjAcE28Gbakb2qC9QhIf0GwBIg5MZdaPr8mxU8+y
         ZT8R/m+EFSKZKykY+HQsMQ/jnDP/+nvExcT5JbTPZ4D/b4t3ULdKVxqzxVOtD4h+/Mxa
         50+N1BhDVCcUz85IjYv4N0J9Qz9s94dyAnSOBYclrpTvisa48Pcil5ITinDcwK67f30Y
         5F9gQYqiqj30x5OIlDRYzpGC4/8NABxudc/uD1KI7m4E12xT6zMpyB+4LjBdqXKc18EG
         CrD3y6e8qcUmIRaI95GVjLFo8PVS4lTNAOOcAx72GqvPumqas57/VPBbly+PNGxpk5/y
         AcXA==
X-Gm-Message-State: ANoB5plbjnubxooei0sSQ08I7s2sx5wxfeIERrz47+aCK5quMgf9kWLI
	dQTlGIHMBJ34r0y9LxklNcFczUGUAvYAusBmft/4emS1
X-Google-Smtp-Source: AA0mqf70D8jPcBllhJs41kvS035Bh4MO+4Fwjr0ncXgwRq7xxQkaF3qvSoz/si1sLXKAEubA/HkdE4YqVvGbDnfzafs=
X-Received: by 2002:a62:5f81:0:b0:56b:bb06:7dd5 with SMTP id
 t123-20020a625f81000000b0056bbb067dd5mr79718932pfb.3.1670939607082; Tue, 13
 Dec 2022 05:53:27 -0800 (PST)
MIME-Version: 1.0
References: <20221213125218.39868-1-philmd@linaro.org> <20221213125218.39868-4-philmd@linaro.org>
In-Reply-To: <20221213125218.39868-4-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Dec 2022 13:53:15 +0000
Message-ID: <CAFEAcA-iouFJgu_2cG2TapxYVr-_ZK1Uuwa4mqSL5zNKg6Jq+Q@mail.gmail.com>
Subject: Re: [RFC PATCH-for-8.0 3/3] hw/net/xilinx_ethlite: Replace tswap32()
 by be32_to_cpu()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
	BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Alistair Francis <alistair@alistair23.me>, David Gibson <david@gibson.dropbear.id.au>, 
	Jason Wang <jasowang@redhat.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: DZHccW/px8bJ

On Tue, 13 Dec 2022 at 12:52, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> This partly revert commit d48751ed4f ("xilinx-ethlite:
> Simplify byteswapping to/from brams") which states the
> packet data is stored in big-endian.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

> @@ -102,8 +102,8 @@ eth_read(void *opaque, hwaddr addr, unsigned int size=
)
>              D(qemu_log("%s " TARGET_FMT_plx "=3D%x\n", __func__, addr * =
4, r));
>              break;
>
> -        default:
> -            r =3D tswap32(s->regs[addr]);
> +        default: /* Packet data */
> +            r =3D be32_to_cpu(s->regs[addr]);
>              break;
>      }
>      return r;
> @@ -160,8 +160,8 @@ eth_write(void *opaque, hwaddr addr,
>              s->regs[addr] =3D value;
>              break;
>
> -        default:
> -            s->regs[addr] =3D tswap32(value);
> +        default: /* Packet data */
> +            s->regs[addr] =3D cpu_to_be32(value);
>              break;
>      }
>  }

This is a change of behaviour for this device in the
qemu-system-microblazeel petalogix-s3adsp1800 board, because
previously on that system the bytes of the rx buffer would
appear in the registers in little-endian order and now they
will appear in big-endian order.

Edgar, do you know what the real hardware does here ?

thanks
-- PMM
