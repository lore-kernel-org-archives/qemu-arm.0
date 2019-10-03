Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp98805wrp;
        Thu, 3 Oct 2019 16:33:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzJWwUTqHvyqiEoLGP4uRidViZufuvmcTC89BllFK9cv+d35FuHYv4Qu/EK/+eb5NwNks5y
X-Received: by 2002:a37:7041:: with SMTP id l62mr7336722qkc.7.1570145620530;
        Thu, 03 Oct 2019 16:33:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570145620; cv=none;
        d=google.com; s=arc-20160816;
        b=zS229eihDi95sOKGYX+RpmR0iz+X0Z6tQYukENrShgEFBNul0s3NZvQFRhxW4u/jqe
         HGsa8W1S+KJ22VY3hOhi+Oy2BsKOU2m4MGzAp8BOyKOTWCArcSeuAlbp6C8cucdPunBs
         53EW8rPRtKQU1CwFaJS0cHGcqLKz/6nQwwPhekVbe0JnehGABFX8y7XAoRgoSXsu3H+0
         VzBafPq2U3LZBzmSnVTZ0wAkroKZzStOCxo7fU6ZZnKhpN5QOxNnTWjr/FYgQmztXtfI
         VLroGREvqwEoBgF0jCtX0kLW3H95L4eufMNSg2/HEb0MmHguWemdX+hOYsO2ZEBFYTrq
         VVcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=ncD+GIq+W9TQMVOQtOXuiMziZEZ6DuqaNnsravIvYNs=;
        b=gM7TLXG986bv22EN4DAe2A+124oDnVy92NoH/cmM0OyxHtdeH9oHrBHyE8Sj5nhPXH
         a/Sz/cBmRPCDoMymw/rtFgVJfC/JPLIF07kNYtG/kivKztd3A7kS+fhmgEbsiLQgBO0n
         +J9TKFTiFuEBDFe3vw/ImR/QdHD3pzwiMq0AtgwZAHMOPKq4eyq5cFvwLY26s9ZJ8iws
         Z0622PdI18ki1IGPMIagi4P0ZZfi+zyVzxS+d/qsc0LNAOqMITTnzALusirO5wIl7p/x
         NeJkgPqbAgexOwKpD33I14D4I6rpOYXs6b6NLCaOKJoRqYkNS7lZLMT/Xoce7sXFJKIs
         Pcow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=frqJKCWW;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id c66si4207203qkg.377.2019.10.03.16.33.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Oct 2019 16:33:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=frqJKCWW;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1570145620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ncD+GIq+W9TQMVOQtOXuiMziZEZ6DuqaNnsravIvYNs=;
	b=frqJKCWWNL2PY1QeC3zEkJ7/zUIi7/FfOXn8YfMtxhAqzoU1X7WndCTizJFdYM9JxuzcQF
	eIywdV1bZV+ICfJeAVNj5MIh4WuoEU6MV4Fg6JqbngDio42Fi6tdLq7kkVo1A0bP1/JtNR
	GkCMtrfsLDTrI+lgoTv49eGQKLbfjTk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-wPWUMpH3NTihGf-rCfXjSg-1; Thu, 03 Oct 2019 19:33:37 -0400
Received: by mail-wr1-f69.google.com with SMTP id n3so1830924wrt.9
        for <alex.bennee@linaro.org>; Thu, 03 Oct 2019 16:33:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2OXZied8K+dE+da8q1xBCh960/6kRu+OEosH48qhxHc=;
        b=lrmX1WTb6dGS3DkBkl5iCUodkkKw73kcMlCy8faWQ1rjqj8tNgG8VvrEEKozGUMxDy
         LWHY9kn0UjKQH5bouMtKvMezdVvSKSJCYwyEwUAXz20VL2ma6VcHO9oZVJaXqu7aFvJd
         WJLxhYncXLZ/NJ+BlV8Wps2/4xh1Jv0o96zplVKCDLTrZdwRHJe9kPaFdM5xmrcTthZJ
         C8wY8Vf2MJssrxeYqKnBs1jlSsEpy48NLLnMY/vxV5+I+AUJ94xWKT/S1B9d5CZ1Vbdp
         OTgMkbxczJj7Yb2ZaBQ8Zr7f+ETCvOFnfHGgm+29KqjlbYT8+ejE6lHDpVPbUVOcv4hx
         4y5w==
X-Gm-Message-State: APjAAAUHDGy/NE4iNihf33k9MF14FZpjEVgSfaqqhBG2zXNlhWuDAuq6
	ZgQCof5qoXrWX4U9mqBH0gsTj5K3qUQh4LtK3t7h1Ed/7hY7OvdKzh9LMtMko5NLhNuk0RXZWP2
	fbnmEQxMo4FYoppvt
X-Received: by 2002:a7b:c35a:: with SMTP id l26mr8864689wmj.81.1570145615651;
        Thu, 03 Oct 2019 16:33:35 -0700 (PDT)
X-Received: by 2002:a7b:c35a:: with SMTP id l26mr8864680wmj.81.1570145615407;
        Thu, 03 Oct 2019 16:33:35 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.35] (240.red-88-21-68.staticip.rima-tde.net. [88.21.68.240])
        by smtp.gmail.com with ESMTPSA id a3sm6652758wmc.3.2019.10.03.16.33.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2019 16:33:34 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v2 08/15] target/arm/arm-semi: Factor out
 implementation of SYS_WRITE
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190916141544.17540-1-peter.maydell@linaro.org>
 <20190916141544.17540-9-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <674d0aff-71c7-f613-2a62-3fbaffda1da1@redhat.com>
Date: Fri, 4 Oct 2019 01:33:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190916141544.17540-9-peter.maydell@linaro.org>
Content-Language: en-US
X-MC-Unique: wPWUMpH3NTihGf-rCfXjSg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: 9lJppeKa5V80

On 9/16/19 4:15 PM, Peter Maydell wrote:
> Factor out the implementation of SYS_WRITE via the
> new function tables.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> ---
>   target/arm/arm-semi.c | 51 ++++++++++++++++++++++++++++---------------
>   1 file changed, 33 insertions(+), 18 deletions(-)
>=20
> diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
> index e5f1e2aaaf2..c21cbb97bc1 100644
> --- a/target/arm/arm-semi.c
> +++ b/target/arm/arm-semi.c
> @@ -384,6 +384,8 @@ static target_ulong arm_gdb_syscall(ARMCPU *cpu, gdb_=
syscall_complete_cb cb,
>    * setting the guest errno if appropriate.
>    */
>   typedef uint32_t sys_closefn(ARMCPU *cpu, GuestFD *gf);
> +typedef uint32_t sys_writefn(ARMCPU *cpu, GuestFD *gf,
> +                             target_ulong buf, uint32_t len);
>  =20
>   static uint32_t host_closefn(ARMCPU *cpu, GuestFD *gf)
>   {
> @@ -392,21 +394,51 @@ static uint32_t host_closefn(ARMCPU *cpu, GuestFD *=
gf)
>       return set_swi_errno(env, close(gf->hostfd));
>   }
>  =20
> +static uint32_t host_writefn(ARMCPU *cpu, GuestFD *gf,
> +                             target_ulong buf, uint32_t len)
> +{
> +    uint32_t ret;
> +    CPUARMState *env =3D &cpu->env;
> +    char *s =3D lock_user(VERIFY_READ, buf, len, 1);
> +    if (!s) {
> +        /* Return bytes not written on error */
> +        return len;
> +    }
> +    ret =3D set_swi_errno(env, write(gf->hostfd, s, len));
> +    unlock_user(s, buf, 0);
> +    if (ret =3D=3D (uint32_t)-1) {
> +        ret =3D 0;
> +    }
> +    /* Return bytes not written */
> +    return len - ret;
> +}
> +
>   static uint32_t gdb_closefn(ARMCPU *cpu, GuestFD *gf)
>   {
>       return arm_gdb_syscall(cpu, arm_semi_cb, "close,%x", gf->hostfd);
>   }
>  =20
> +static uint32_t gdb_writefn(ARMCPU *cpu, GuestFD *gf,
> +                            target_ulong buf, uint32_t len)
> +{
> +    arm_semi_syscall_len =3D len;
> +    return arm_gdb_syscall(cpu, arm_semi_cb, "write,%x,%x,%x",
> +                           gf->hostfd, buf, len);
> +}
> +
>   typedef struct GuestFDFunctions {
>       sys_closefn *closefn;
> +    sys_writefn *writefn;
>   } GuestFDFunctions;
>  =20
>   static const GuestFDFunctions guestfd_fns[] =3D {
>       [GuestFDHost] =3D {
>           .closefn =3D host_closefn,
> +        .writefn =3D host_writefn,
>       },
>       [GuestFDGDB] =3D {
>           .closefn =3D gdb_closefn,
> +        .writefn =3D gdb_writefn,
>       },
>   };
>  =20
> @@ -539,24 +571,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>               return set_swi_errno(env, -1);
>           }
>  =20
> -        if (use_gdb_syscalls()) {
> -            arm_semi_syscall_len =3D len;
> -            return arm_gdb_syscall(cpu, arm_semi_cb, "write,%x,%x,%x",
> -                                   gf->hostfd, arg1, len);
> -        } else {
> -            s =3D lock_user(VERIFY_READ, arg1, len, 1);
> -            if (!s) {
> -                /* Return bytes not written on error */
> -                return len;
> -            }
> -            ret =3D set_swi_errno(env, write(gf->hostfd, s, len));
> -            unlock_user(s, arg1, 0);
> -            if (ret =3D=3D (uint32_t)-1) {
> -                ret =3D 0;
> -            }
> -            /* Return bytes not written */
> -            return len - ret;
> -        }
> +        return guestfd_fns[gf->type].writefn(cpu, gf, arg1, len);
>       case TARGET_SYS_READ:
>           GET_ARG(0);
>           GET_ARG(1);
>=20
