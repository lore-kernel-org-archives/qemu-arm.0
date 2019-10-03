Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp102421wrp;
        Thu, 3 Oct 2019 16:37:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxg0tMoMeEHN52eH8+Mg0sMbwMX3y+2FLTLhd8XUDci/g/Uv6xz/JTJ4JJoCIgB6YOXL6YJ
X-Received: by 2002:a17:906:18a1:: with SMTP id c1mr10027743ejf.4.1570145839168;
        Thu, 03 Oct 2019 16:37:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570145839; cv=none;
        d=google.com; s=arc-20160816;
        b=SbyJ+B2Br0JdRfK3d1fV8ap7D5GNefoloaPyTwG3NoTP1xM0G757JXly7UBbIA3nSg
         cOpzj24d+Shx/O4FP3S99hFmga5JoxOBwxlG1XH4wPbY/Iud+piLnYFMQMiwicnbntAz
         KD1H04+V1xE+9PFEgW1ogfDiQkBQPK7Lb65BbTVsdQiRA+O+73ntGtge02c1tQajS2EN
         vLrTFP820HbYR+M5tOO4sluC88SK6XacuAu84WXZ9YA5XQkc0twNaAgG0Y7Cx+auKkrF
         ZklsAPY0R3+6aCncceAJreo15wtmWZ7ITk1JaQT4UdF0TSf1TTO+xtNL1QIKBNFdm0ez
         gxMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=gk6NROCWpAXErwqeWwHpRsIJUqeAN+w2tOxqkkWL+P4=;
        b=q9LhNgI3L90RVEnofdfPv3cw/EUOOngM8LImEkj9PGaC+R+b9Opkq8w1rs/t02s6Gz
         cS5ObMc3r8PmgBj64EDdDSyrp/jHG/IEbBGwcxy5bqt3b+VwVdHvHoAsBp3r9a7MOt26
         hTh0qPJXvDNhWTlH5MUzzdO9ZiKNCbjvJvXpVO9O944QC0ssb5F6h03CIh2/VqoRC6to
         +84FEr+IX0ygvz6DLhHgEMaGTeJ621kN0C7g5b25Nr/KeFwvt9Isb1FgmTD2o3hyu1Ir
         9+rszuevNIvR975DEOxHTl3XSLolWw1SW3rCCDhUjQ/KGggmG46xrMkXjEN7efFNOqMz
         AoYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BFonStA9;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id u8si2093298ejt.219.2019.10.03.16.37.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Oct 2019 16:37:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BFonStA9;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1570145838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gk6NROCWpAXErwqeWwHpRsIJUqeAN+w2tOxqkkWL+P4=;
	b=BFonStA9G62nz1GNWe55MGqWsPII5xYqDJ2hgi82gly/PObTXwPVsJX1xaJTayrXHB/ZSe
	FiEj4nu/y+z7tkhrT0nnrZjklmC9V5Jzy+vqcrUvi+5UITnXJCeWPkaFnESMP+WIG0niXz
	NJmIXAfz0N40Y7DNZlP7emo8JMfKvY0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-f3WdxUHbO6OK9NSQYCDjhA-1; Thu, 03 Oct 2019 19:37:13 -0400
Received: by mail-wr1-f72.google.com with SMTP id n18so1825237wro.11
        for <alex.bennee@linaro.org>; Thu, 03 Oct 2019 16:37:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RjoDOzEi8vQvzx/te10cfe+DFZyreXihMMGG3SIUtsg=;
        b=Bg/WxD5ojkVbxejztusUCJQcI2RGnN4QXesQ8xiXzrRGMNT2d7s1ojDMXJOtZ+afzK
         rPPW1V/zZ47gYIQcgAFB5Jd1w4H7z11DM/+70nJqhHsozY2qcTKOOWl8KMhSBC7UDLig
         f8WxuuGk9R/jSHks6v+wp6ZEcfSyomE97ZFensS0REcSlEiQvyAEGHDF+4MJr4BX8jLr
         4X/6MB+puuuwcW0uwOHwY5bI/ftnYmqO7sg7w24aUU6qF00kHQZdulvRmZFI2euK9hmY
         y+x1XnekrZNwdzMMjOlD2uuLRHabAxak4Qcs1co2enFq48y41EQqhiUinr3KMTyuyDY+
         XiOw==
X-Gm-Message-State: APjAAAUh+ZEQD5KIVdv96YZnSmMuhcv25qWPLxAuuOjPk0Lv8snfFKaH
	RYJChfeG0L2SAdkUyH2s/UZxKylnJrHbqd4qWGXAmA+OKMahD4zd28HFTK6UPTHvHrVZNJ7DETn
	qO8wqoMF/eShKPpof
X-Received: by 2002:a5d:63cb:: with SMTP id c11mr6689900wrw.281.1570145832390;
        Thu, 03 Oct 2019 16:37:12 -0700 (PDT)
X-Received: by 2002:a5d:63cb:: with SMTP id c11mr6689890wrw.281.1570145832170;
        Thu, 03 Oct 2019 16:37:12 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.35] (240.red-88-21-68.staticip.rima-tde.net. [88.21.68.240])
        by smtp.gmail.com with ESMTPSA id c6sm4516543wrm.71.2019.10.03.16.37.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2019 16:37:11 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v2 11/15] target/arm/arm-semi: Factor out
 implementation of SYS_SEEK
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190916141544.17540-1-peter.maydell@linaro.org>
 <20190916141544.17540-12-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ffd289df-5298-e159-8ef2-f69cff5ffec4@redhat.com>
Date: Fri, 4 Oct 2019 01:37:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190916141544.17540-12-peter.maydell@linaro.org>
Content-Language: en-US
X-MC-Unique: f3WdxUHbO6OK9NSQYCDjhA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: Wb2nTlmqlICV

On 9/16/19 4:15 PM, Peter Maydell wrote:
> Factor out the implementation of SYS_SEEK via the new function
> tables.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> ---
>   target/arm/arm-semi.c | 31 ++++++++++++++++++++++---------
>   1 file changed, 22 insertions(+), 9 deletions(-)
>=20
> diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
> index ecd51338fd3..b5e1d73eb80 100644
> --- a/target/arm/arm-semi.c
> +++ b/target/arm/arm-semi.c
> @@ -389,6 +389,8 @@ typedef uint32_t sys_writefn(ARMCPU *cpu, GuestFD *gf=
,
>   typedef uint32_t sys_readfn(ARMCPU *cpu, GuestFD *gf,
>                               target_ulong buf, uint32_t len);
>   typedef uint32_t sys_isattyfn(ARMCPU *cpu, GuestFD *gf);
> +typedef uint32_t sys_seekfn(ARMCPU *cpu, GuestFD *gf,
> +                            target_ulong offset);
>  =20
>   static uint32_t host_closefn(ARMCPU *cpu, GuestFD *gf)
>   {
> @@ -442,6 +444,16 @@ static uint32_t host_isattyfn(ARMCPU *cpu, GuestFD *=
gf)
>       return isatty(gf->hostfd);
>   }
>  =20
> +static uint32_t host_seekfn(ARMCPU *cpu, GuestFD *gf, target_ulong offse=
t)
> +{
> +    CPUARMState *env =3D &cpu->env;
> +    uint32_t ret =3D set_swi_errno(env, lseek(gf->hostfd, offset, SEEK_S=
ET));
> +    if (ret =3D=3D (uint32_t)-1) {
> +        return -1;
> +    }
> +    return 0;
> +}
> +
>   static uint32_t gdb_closefn(ARMCPU *cpu, GuestFD *gf)
>   {
>       return arm_gdb_syscall(cpu, arm_semi_cb, "close,%x", gf->hostfd);
> @@ -468,11 +480,18 @@ static uint32_t gdb_isattyfn(ARMCPU *cpu, GuestFD *=
gf)
>       return arm_gdb_syscall(cpu, arm_semi_cb, "isatty,%x", gf->hostfd);
>   }
>  =20
> +static uint32_t gdb_seekfn(ARMCPU *cpu, GuestFD *gf, target_ulong offset=
)
> +{
> +    return arm_gdb_syscall(cpu, arm_semi_cb, "lseek,%x,%x,0",
> +                           gf->hostfd, offset);
> +}
> +
>   typedef struct GuestFDFunctions {
>       sys_closefn *closefn;
>       sys_writefn *writefn;
>       sys_readfn *readfn;
>       sys_isattyfn *isattyfn;
> +    sys_seekfn *seekfn;
>   } GuestFDFunctions;
>  =20
>   static const GuestFDFunctions guestfd_fns[] =3D {
> @@ -481,12 +500,14 @@ static const GuestFDFunctions guestfd_fns[] =3D {
>           .writefn =3D host_writefn,
>           .readfn =3D host_readfn,
>           .isattyfn =3D host_isattyfn,
> +        .seekfn =3D host_seekfn,
>       },
>       [GuestFDGDB] =3D {
>           .closefn =3D gdb_closefn,
>           .writefn =3D gdb_writefn,
>           .readfn =3D gdb_readfn,
>           .isattyfn =3D gdb_isattyfn,
> +        .seekfn =3D gdb_seekfn,
>       },
>   };
>  =20
> @@ -656,15 +677,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>               return set_swi_errno(env, -1);
>           }
>  =20
> -        if (use_gdb_syscalls()) {
> -            return arm_gdb_syscall(cpu, arm_semi_cb, "lseek,%x,%x,0",
> -                                   gf->hostfd, arg1);
> -        } else {
> -            ret =3D set_swi_errno(env, lseek(gf->hostfd, arg1, SEEK_SET)=
);
> -            if (ret =3D=3D (uint32_t)-1)
> -              return -1;
> -            return 0;
> -        }
> +        return guestfd_fns[gf->type].seekfn(cpu, gf, arg1);
>       case TARGET_SYS_FLEN:
>           GET_ARG(0);
>  =20
>=20
