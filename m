Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp100146wrp;
        Thu, 3 Oct 2019 16:35:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqycz0cW3LUZOjkH76ZUwluIUpZEExOT3qKejFCcJuXhNIoWONGSjFJ/PHybyvXkOmSFqyU5
X-Received: by 2002:a37:6789:: with SMTP id b131mr7125367qkc.314.1570145712456;
        Thu, 03 Oct 2019 16:35:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570145712; cv=none;
        d=google.com; s=arc-20160816;
        b=x7MF+AW8Dxx0aWFl41hZ5VYBPZ2z5zABiF5BhWRzuxAcTP9mDEcBm4T3UtW42JP7KB
         GW7y1v8UDRI7Jt3ubxpRuoL5BibY31LPSuCSMT3T7VT+JJlFvCmvgcROY0LGoEgmVFem
         T6jxJjJ6oBnO0pqbbA6u016PcnGwCVxhQHxfhXy6Cs0zRejfb6pCmGOpxqrLXOGsgnuM
         8JAOtM+D23elnIfloM1wdEFQpqjRxtL/0w4NkBtPOuPkjXCOTpyZ+fogYw8OCWAxLx59
         S4oaLxPvVE2Z8CLZjW1treNhMhniJKb9b+iMRh3rsbRgFGJO3yABjspjhFT548D6aZMm
         Ocig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=sOvhPRusDmCI4J7IVheey5VuuQLAXmPPq1tVH797yok=;
        b=Xmcb66ADBprBPrbgMh8Y6qoPogL3/cx7m/6lTubSUE1qaTsRG1AGO+Cl3Y//6Afm7e
         K8U+0cun6suBNuhLbsm0swfk5w3MXBemQfzH04jNfyMxZ+Y5g4fGLcxwQ5TSJotxLRNL
         rwlsZm8S/St88npyuT2Z+xtdS94yUGFiu/gxft6N2qem1mXlv4JNDPrW+ugytLbZS+1A
         Xxr6OAjJXkL+5vOdK3t90tIZ6ShI693LqS9E3pcUGWlm8RoZxgtiT5v5Z4YnRD2qm8/d
         NSKQ1twpizQHsxt8EZ+xMgVqkaG/tnqzDIidPwIIgWLNIdhLRSqnvQzE8vVa3OpRVEZR
         BGSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dKwMt0jj;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id e44si4133005qve.165.2019.10.03.16.35.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Oct 2019 16:35:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dKwMt0jj;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1570145711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sOvhPRusDmCI4J7IVheey5VuuQLAXmPPq1tVH797yok=;
	b=dKwMt0jjaW5z0FapOfvrjAAenlqfK50/3c0ALa7dKdLcuA9HU2PsOUkAFyyfA9WVuSLVXb
	KzwEnl3HZp01ncSk7xePYK8kk/gMvM8WggtC3JU1JMigzU6EiXAnQpjrn5jhTrYu6XNtTp
	c2XN/GIyqtKaNQ0YaN4jyrCr+TIIDRM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-21MsFJ3QMbuF_-2I2ipu2g-1; Thu, 03 Oct 2019 19:35:10 -0400
Received: by mail-wm1-f72.google.com with SMTP id n3so1790520wmf.3
        for <alex.bennee@linaro.org>; Thu, 03 Oct 2019 16:35:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vmgiPbey/LFCJ/olGtfJQvC5DWR8VyYkW2zYHXYykko=;
        b=rygG/WWlEkJV76N3CgItlqrAyEFERbBZwb3F3GG4DOCGSOTq0ZMYZG0WxKUfBRjGsV
         5E7O20ZnPGWDw/s1QEuP/TaKiU3OgDwGcHZc2QAEDPXzYacnAi1Llavud7ykhT+kPJ9K
         q5WlDs3OcOOIRasTr7wSgL7haSHhNxp2hrUjaNAs35B8d/eR49iR1Y3rkhwsAoLs49sl
         g2y0pqYFpbsDnGDHZYXAdrigNLVn+LtDvn4tklFhodvqk1MHEFgEj3ZFLtXHTjaCwLn2
         Cu3BS/yTYz4p28pX2dOoTAgLWwxyMIX+w5agg4SWI7Lw4kNjowi8/2edNt8p2AuK0seN
         P20g==
X-Gm-Message-State: APjAAAVGTgOwzIG+hSN8Ypb6LOI5ob5fsR1i5XId2wOoYso9ABvOTHj2
	vaf85a/r1/xcdyw737SYxWLmTwLj7/PqlsA/Xomz39Kl6kSA3cLgiGZ8Mcgky+GGcoZB7fEvdMR
	Zce4J5DGr25gOhpTn
X-Received: by 2002:adf:e951:: with SMTP id m17mr8902599wrn.154.1570145708087;
        Thu, 03 Oct 2019 16:35:08 -0700 (PDT)
X-Received: by 2002:adf:e951:: with SMTP id m17mr8902528wrn.154.1570145706949;
        Thu, 03 Oct 2019 16:35:06 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.35] (240.red-88-21-68.staticip.rima-tde.net. [88.21.68.240])
        by smtp.gmail.com with ESMTPSA id 59sm3997667wrc.23.2019.10.03.16.35.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2019 16:35:06 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v2 09/15] target/arm/arm-semi: Factor out
 implementation of SYS_READ
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190916141544.17540-1-peter.maydell@linaro.org>
 <20190916141544.17540-10-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9131951e-06ad-059e-c68b-18ea6b9b71b4@redhat.com>
Date: Fri, 4 Oct 2019 01:35:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190916141544.17540-10-peter.maydell@linaro.org>
Content-Language: en-US
X-MC-Unique: 21MsFJ3QMbuF_-2I2ipu2g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: EnxQxMilba1a

On 9/16/19 4:15 PM, Peter Maydell wrote:
> Factor out the implementation of SYS_READ via the
> new function tables.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> ---
>   target/arm/arm-semi.c | 55 +++++++++++++++++++++++++++----------------
>   1 file changed, 35 insertions(+), 20 deletions(-)
>=20
> diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
> index c21cbb97bc1..958083a105c 100644
> --- a/target/arm/arm-semi.c
> +++ b/target/arm/arm-semi.c
> @@ -386,6 +386,8 @@ static target_ulong arm_gdb_syscall(ARMCPU *cpu, gdb_=
syscall_complete_cb cb,
>   typedef uint32_t sys_closefn(ARMCPU *cpu, GuestFD *gf);
>   typedef uint32_t sys_writefn(ARMCPU *cpu, GuestFD *gf,
>                                target_ulong buf, uint32_t len);
> +typedef uint32_t sys_readfn(ARMCPU *cpu, GuestFD *gf,
> +                            target_ulong buf, uint32_t len);
>  =20
>   static uint32_t host_closefn(ARMCPU *cpu, GuestFD *gf)
>   {
> @@ -413,6 +415,27 @@ static uint32_t host_writefn(ARMCPU *cpu, GuestFD *g=
f,
>       return len - ret;
>   }
>  =20
> +static uint32_t host_readfn(ARMCPU *cpu, GuestFD *gf,
> +                            target_ulong buf, uint32_t len)
> +{
> +    uint32_t ret;
> +    CPUARMState *env =3D &cpu->env;
> +    char *s =3D lock_user(VERIFY_WRITE, buf, len, 0);
> +    if (!s) {
> +        /* return bytes not read */
> +        return len;
> +    }
> +    do {
> +        ret =3D set_swi_errno(env, read(gf->hostfd, s, len));
> +    } while (ret =3D=3D -1 && errno =3D=3D EINTR);
> +    unlock_user(s, buf, len);
> +    if (ret =3D=3D (uint32_t)-1) {
> +        ret =3D 0;
> +    }
> +    /* Return bytes not read */
> +    return len - ret;
> +}
> +
>   static uint32_t gdb_closefn(ARMCPU *cpu, GuestFD *gf)
>   {
>       return arm_gdb_syscall(cpu, arm_semi_cb, "close,%x", gf->hostfd);
> @@ -426,19 +449,30 @@ static uint32_t gdb_writefn(ARMCPU *cpu, GuestFD *g=
f,
>                              gf->hostfd, buf, len);
>   }
>  =20
> +static uint32_t gdb_readfn(ARMCPU *cpu, GuestFD *gf,
> +                           target_ulong buf, uint32_t len)
> +{
> +    arm_semi_syscall_len =3D len;
> +    return arm_gdb_syscall(cpu, arm_semi_cb, "read,%x,%x,%x",
> +                           gf->hostfd, buf, len);
> +}
> +
>   typedef struct GuestFDFunctions {
>       sys_closefn *closefn;
>       sys_writefn *writefn;
> +    sys_readfn *readfn;
>   } GuestFDFunctions;
>  =20
>   static const GuestFDFunctions guestfd_fns[] =3D {
>       [GuestFDHost] =3D {
>           .closefn =3D host_closefn,
>           .writefn =3D host_writefn,
> +        .readfn =3D host_readfn,
>       },
>       [GuestFDGDB] =3D {
>           .closefn =3D gdb_closefn,
>           .writefn =3D gdb_writefn,
> +        .readfn =3D gdb_readfn,
>       },
>   };
>  =20
> @@ -584,26 +618,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>               return set_swi_errno(env, -1);
>           }
>  =20
> -        if (use_gdb_syscalls()) {
> -            arm_semi_syscall_len =3D len;
> -            return arm_gdb_syscall(cpu, arm_semi_cb, "read,%x,%x,%x",
> -                                   gf->hostfd, arg1, len);
> -        } else {
> -            s =3D lock_user(VERIFY_WRITE, arg1, len, 0);
> -            if (!s) {
> -                /* return bytes not read */
> -                return len;
> -            }
> -            do {
> -                ret =3D set_swi_errno(env, read(gf->hostfd, s, len));
> -            } while (ret =3D=3D -1 && errno =3D=3D EINTR);
> -            unlock_user(s, arg1, len);
> -            if (ret =3D=3D (uint32_t)-1) {
> -                ret =3D 0;
> -            }
> -            /* Return bytes not read */
> -            return len - ret;
> -        }
> +        return guestfd_fns[gf->type].readfn(cpu, gf, arg1, len);
>       case TARGET_SYS_READC:
>           qemu_log_mask(LOG_UNIMP, "%s: SYS_READC not implemented", __fun=
c__);
>           return 0;
>=20
