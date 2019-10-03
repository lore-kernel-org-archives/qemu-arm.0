Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp97254wrp;
        Thu, 3 Oct 2019 16:32:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyboRVyYGOqm9bXT7bXplSEiKganf5PJzOBNPJCMvDeWNoXXgr7fW0+PYmWN2i7dyzot2mD
X-Received: by 2002:ae9:eb46:: with SMTP id b67mr7281598qkg.401.1570145531647;
        Thu, 03 Oct 2019 16:32:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570145531; cv=none;
        d=google.com; s=arc-20160816;
        b=yoxi/FfhcOXBqZ2pYSkbcEA4F0pT0qEbMA6lebWQ9Khi5Hn2bmWMkuW2EGFTD672Bv
         xPHCMtNPVyi7qlSJUT8szuv6jY22a324j/8fFrVDV+H7lusq7hWmTqBiPNI+PWFDBUCl
         d2mD7Ma6VtyBpYq4862pzz9FEd9fUvwCbGX/BvYyQfgLBGqy/qJgwFeMuIzInFblax65
         D+Ru07r/8DiWrZZrhxMBVO5S4bXZqtu4WuRFouGthPtAwiW1n831aQkwy18UOSV7wgtP
         +EkVZ8LZnU/P4wHikCukR9dvkX/AQITaZh/3yQmgJtxCeMfCPY7F5hIc6sc3DvdNLPOn
         /WHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=X++9C+o63TLz2yiBE4eVu8eFHPYuFJf499i6Z8ZrnAE=;
        b=EG+ic6tn4eAPAh+VBhotvjxJtJNNV1ddOcE6ifS+Msu3Z2qDcb3kP6J6kTGrm3gykG
         OuTKnHrHvOphf4qRxcP2W9eH924c3bJ1EEZCE/B8PNEZPJszhZRPz8h5oL/v+GK7vugW
         AW+mFUL0hVmaIYEmOIvk86SdacgCFzXCS8L7QknnxgGgDrt7NMwF6FWQamJSogUHnjNv
         Q0fKEmxFcLV84ytSahVQZcBf/ow0AhDY8t1gTMek41vHqi8ZL8fnXO8mqGJS9vCJBSvE
         CtPjef23jO1A6U5lC75ux38dCjdG5v1yDD0qpU1T5RWCxc3llfLmi004enBRfDDf/xhw
         /+UQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BzfuI4T4;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id p5si3622539qtn.234.2019.10.03.16.32.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Oct 2019 16:32:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BzfuI4T4;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1570145531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X++9C+o63TLz2yiBE4eVu8eFHPYuFJf499i6Z8ZrnAE=;
	b=BzfuI4T4iQoLrEGKsaG43mlTcATK6auN7LgZZinch8cgD9mG8p76GCvZJh9QiuipgevbXY
	gpE3t8zJMXqpMPPox3Q2ULJJYG2UNjiiJXWPLEQvq+TfM8ewKyYvrXU6gRm+p6TElKA1Yx
	83szwSL+k/hd/clpvmxQy8D3laibcTI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-4fCeJt0FNXGQtcaRJHRG0g-1; Thu, 03 Oct 2019 19:32:09 -0400
Received: by mail-wm1-f70.google.com with SMTP id j125so1779302wmj.6
        for <alex.bennee@linaro.org>; Thu, 03 Oct 2019 16:32:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6fg+tL8hdMuSlCATnh5vXBFe8nhdX3zEsZie5KLf89k=;
        b=n1UlI0q4vodlzZCw9xlL3GusSw3+QouJTR+n+oDTXHgye/XKesohfOL4tj98YAIXhi
         13KM6vedhkq0nStlJ6j5sCp+UG0nPKUjCaOr6P3Kb9slFp8znkvJ7A29iuFAQ+EovOrU
         ZLHd3TzTvKafFsOJWHV23ow7u1WUybTGY9cKl1scExfrbLwSOwhF0LfPRRLbixcXguvJ
         +r7ZI9T0iEjDyFX6PPDbMWrtIaRxQ+DbOMiPd+Ec84W5QIfqCja3d/sV+0POrA3ktgMr
         gRMOpWK074s7uHLRkAfrtW6FoSWl1c2a33saPWfq/NSNTWDed658vLc1UJy5VDbp0Buk
         k1Hw==
X-Gm-Message-State: APjAAAV4bT80JzNvyqLOoti+YjHBfCc+tjZwv4JtDvC9PSUbMczuu1Zv
	d0y4Kv+xRC5MAhGfezd+RVACmpeRAJNGSruGlCzo0K/sECQJnmH1K6uud4sLXpkLZ7aUwrf+V3j
	ebrjyETodo0pzHguT
X-Received: by 2002:a5d:51d1:: with SMTP id n17mr415035wrv.85.1570145527443;
        Thu, 03 Oct 2019 16:32:07 -0700 (PDT)
X-Received: by 2002:a5d:51d1:: with SMTP id n17mr415024wrv.85.1570145527218;
        Thu, 03 Oct 2019 16:32:07 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.35] (240.red-88-21-68.staticip.rima-tde.net. [88.21.68.240])
        by smtp.gmail.com with ESMTPSA id t123sm6570271wma.40.2019.10.03.16.32.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2019 16:32:06 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v2 07/15] target/arm/arm-semi: Factor out
 implementation of SYS_CLOSE
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190916141544.17540-1-peter.maydell@linaro.org>
 <20190916141544.17540-8-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <84350edd-f5e7-cf9a-5cfe-c5caf603f492@redhat.com>
Date: Fri, 4 Oct 2019 01:32:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190916141544.17540-8-peter.maydell@linaro.org>
Content-Language: en-US
X-MC-Unique: 4fCeJt0FNXGQtcaRJHRG0g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: Seh+ghqxRTm7

On 9/16/19 4:15 PM, Peter Maydell wrote:
> Currently for the semihosting calls which take a file descriptor
> (SYS_CLOSE, SYS_WRITE, SYS_READ, SYS_ISTTY, SYS_SEEK, SYS_FLEN)
> we have effectively two implementations, one for real host files
> and one for when we indirect via the gdbstub. We want to add a
> third one to deal with the magic :semihosting-features file.
>=20
> Instead of having a three-way if statement in each of these
> cases, factor out the implementation of the calls to separate
> functions which we dispatch to via function pointers selected
> via the GuestFDType for the guest fd.
>=20
> In this commit, we set up the framework for the dispatch,
> and convert the SYS_CLOSE call to use it.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> ---
>   target/arm/arm-semi.c | 44 ++++++++++++++++++++++++++++++++++++-------
>   1 file changed, 37 insertions(+), 7 deletions(-)
>=20
> diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
> index 02cd673d47d..e5f1e2aaaf2 100644
> --- a/target/arm/arm-semi.c
> +++ b/target/arm/arm-semi.c
> @@ -109,6 +109,7 @@ static int open_modeflags[12] =3D {
>   typedef enum GuestFDType {
>       GuestFDUnused =3D 0,
>       GuestFDHost =3D 1,
> +    GuestFDGDB =3D 2,
>   } GuestFDType;
>  =20
>   /*
> @@ -172,14 +173,14 @@ static GuestFD *do_get_guestfd(int guestfd)
>   /*
>    * Associate the specified guest fd (which must have been
>    * allocated via alloc_fd() and not previously used) with
> - * the specified host fd.
> + * the specified host/gdb fd.
>    */
>   static void associate_guestfd(int guestfd, int hostfd)
>   {
>       GuestFD *gf =3D do_get_guestfd(guestfd);
>  =20
>       assert(gf);
> -    gf->type =3D GuestFDHost;
> +    gf->type =3D use_gdb_syscalls() ? GuestFDGDB : GuestFDHost;
>       gf->hostfd =3D hostfd;
>   }
>  =20
> @@ -376,6 +377,39 @@ static target_ulong arm_gdb_syscall(ARMCPU *cpu, gdb=
_syscall_complete_cb cb,
>       return is_a64(env) ? env->xregs[0] : env->regs[0];
>   }
>  =20
> +/*
> + * Types for functions implementing various semihosting calls
> + * for specific types of guest file descriptor. These must all
> + * do the work and return the required return value for the guest,
> + * setting the guest errno if appropriate.
> + */
> +typedef uint32_t sys_closefn(ARMCPU *cpu, GuestFD *gf);
> +
> +static uint32_t host_closefn(ARMCPU *cpu, GuestFD *gf)
> +{
> +    CPUARMState *env =3D &cpu->env;
> +
> +    return set_swi_errno(env, close(gf->hostfd));
> +}
> +
> +static uint32_t gdb_closefn(ARMCPU *cpu, GuestFD *gf)
> +{
> +    return arm_gdb_syscall(cpu, arm_semi_cb, "close,%x", gf->hostfd);
> +}
> +
> +typedef struct GuestFDFunctions {
> +    sys_closefn *closefn;
> +} GuestFDFunctions;
> +
> +static const GuestFDFunctions guestfd_fns[] =3D {
> +    [GuestFDHost] =3D {
> +        .closefn =3D host_closefn,
> +    },
> +    [GuestFDGDB] =3D {
> +        .closefn =3D gdb_closefn,
> +    },
> +};
> +
>   /* Read the input value from the argument block; fail the semihosting
>    * call if the memory read fails.
>    */
> @@ -485,11 +519,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>               return set_swi_errno(env, -1);
>           }
>  =20
> -        if (use_gdb_syscalls()) {
> -            ret =3D arm_gdb_syscall(cpu, arm_semi_cb, "close,%x", gf->ho=
stfd);
> -        } else {
> -            ret =3D set_swi_errno(env, close(gf->hostfd));
> -        }
> +        ret =3D guestfd_fns[gf->type].closefn(cpu, gf);
>           dealloc_guestfd(arg0);
>           return ret;
>       case TARGET_SYS_WRITEC:
>=20
