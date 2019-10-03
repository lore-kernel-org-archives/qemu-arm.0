Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp103294wrp;
        Thu, 3 Oct 2019 16:38:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwUO+u70vUZaQBqBTGb7MBmPbcWAraliQsAjRRXZblFuo3ypXyVHy/wqPQ8FYZyMDTEGXrU
X-Received: by 2002:ad4:4649:: with SMTP id y9mr7867994qvv.247.1570145886045;
        Thu, 03 Oct 2019 16:38:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570145886; cv=none;
        d=google.com; s=arc-20160816;
        b=BUeXZAKA4t1E2u+3zBBH6y46KJEWoXu5cBrUUspGC/3XbLjz8P8iKZ+EBpknzCT36/
         yUN4h7G9pD26jpFrWUq9LeZZubSjPPdq1vhtE9oO3TA/s6BXJfq/seSWpNt06SGFNYhd
         +k2hD/M8miPIhfwwrma9kve7RBaq81yf1Q+HqibSNOkADmDjsdcadUS1ntQxd3EHoTy/
         vQKEmy8sTY0L2X2KGgUT7fA6hOhBI33A/f7oiZTX4W6OFi5oZpQQtMXLhyI1bzpMUpBM
         s5/Em43sJlEfhPITIz4QdJa8sQZ6ZUIuRV5MS3pJryM/fpHUzbcedAGGaJv9OXGLFB9k
         KCEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=DRTZigKCEY4opWJBLHi11l/zrCItDh8Z1O0Kg5+OawA=;
        b=W8P7bAqr7GMIRcmAB2ffhY/+MUmv8tLTqPhM/7UYVhvHV9DjtimIy7MTpWlKBwpgjz
         H1mafA8JDNQBxxQTLVuXagGa/4cBEhiMek/Vhoh85q///eYxX9Eong5H0EpLSqMCddUR
         v9ylpOEJGQXJAM77YnDyK8TC+peYk2i9xwfCmBNzOHOMSEP3hpLqsiBukYODwEouqxnt
         IonmVLRTT0zfxnlZCdSLry5CuXMRGWNCvTWtd/eeEJQK8OfeWl7Je9Ig+3Zq0Q4NOizc
         /yDJhJOrQtub4uLeChLqAIfrB7ILF82dLcgToou7a64o69PyZyn1TCFuOWK5OGlDOyef
         rlMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IkzIvBuT;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id q28si4093104qvf.153.2019.10.03.16.38.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Oct 2019 16:38:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IkzIvBuT;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1570145885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DRTZigKCEY4opWJBLHi11l/zrCItDh8Z1O0Kg5+OawA=;
	b=IkzIvBuT+QM4UDCkF0geU0R3hf2Zito/pVNiC20RPhggBxnpinhkCUxJf/utGYisqxJJE9
	718RM/YiVSb+r3KjpUOTp6oSFB1RaVWAkpRKKH4xCBOAffJbgjBbCHbl7Uni6fRGbECPQG
	9dYbGnCtcYpWnk5CdLXJSc/LmwWD2dg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-A72lgWOmMCCle7sM4FlXxQ-1; Thu, 03 Oct 2019 19:38:04 -0400
Received: by mail-wr1-f72.google.com with SMTP id j7so20125wrx.14
        for <alex.bennee@linaro.org>; Thu, 03 Oct 2019 16:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZIP0ODjDWHxED5SbJ/GsbdeKZ47VF2Eyu5DtWpV0WjY=;
        b=Kg0l26zM45gRO6lXaFAkMUPib3ZkoaTiE8IOcR4q2J7DesbFJoV+mIDtxMRxBfb5p7
         p1I6uDPTq1CWf5ELGfZBKhfivxav7ovNOWjg+KlslxPGnt8tI23Id8BSxhpnincAunu1
         M2fwOwmm/rfIVfviflgjRxpHVYFT8TXOBl5Pyf4v2OVmU7uWFevKg1C4d1Osd7lbJ55W
         bHoaVVtJFydmj4WDZIEeMeXlrMW4WqXPuU1mqPuEGIusOZ6Kxs8ou8zXlOy89HHUuDmG
         JNyjTpHWjeR+JGU3YNJo+WgaHA5IyhUWMfq8E8OSHOaGLp5I4lda6Qy1oiumzmBLWb8p
         i5Cg==
X-Gm-Message-State: APjAAAWcqg3/f1H0qxvbDERdKwxNgpI7J/1vT6ypI+wTx7C4rcIiqGq2
	eET/NhRazMZWRmwsKsfz7tYwMXsDLyuUnOexnbj+uMih3tGxVoTLBXGCzMGK8EDGMpv4H2gNulx
	T+WlVF4mqLQ82yW6W
X-Received: by 2002:a5d:670c:: with SMTP id o12mr9370772wru.103.1570145883062;
        Thu, 03 Oct 2019 16:38:03 -0700 (PDT)
X-Received: by 2002:a5d:670c:: with SMTP id o12mr9370764wru.103.1570145882854;
        Thu, 03 Oct 2019 16:38:02 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.35] (240.red-88-21-68.staticip.rima-tde.net. [88.21.68.240])
        by smtp.gmail.com with ESMTPSA id j26sm6242833wrd.2.2019.10.03.16.38.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2019 16:38:02 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v2 12/15] target/arm/arm-semi: Factor out
 implementation of SYS_FLEN
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190916141544.17540-1-peter.maydell@linaro.org>
 <20190916141544.17540-13-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <05e204c1-2aa3-7f77-1354-16d9239a901f@redhat.com>
Date: Fri, 4 Oct 2019 01:38:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190916141544.17540-13-peter.maydell@linaro.org>
Content-Language: en-US
X-MC-Unique: A72lgWOmMCCle7sM4FlXxQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: 0zEV7eNeqzhD

On 9/16/19 4:15 PM, Peter Maydell wrote:
> Factor out the implementation of SYS_FLEN via the new
> function tables.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> ---
>   target/arm/arm-semi.c | 32 ++++++++++++++++++++++----------
>   1 file changed, 22 insertions(+), 10 deletions(-)
>=20
> diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
> index b5e1d73eb80..87c911f0187 100644
> --- a/target/arm/arm-semi.c
> +++ b/target/arm/arm-semi.c
> @@ -391,6 +391,7 @@ typedef uint32_t sys_readfn(ARMCPU *cpu, GuestFD *gf,
>   typedef uint32_t sys_isattyfn(ARMCPU *cpu, GuestFD *gf);
>   typedef uint32_t sys_seekfn(ARMCPU *cpu, GuestFD *gf,
>                               target_ulong offset);
> +typedef uint32_t sys_flenfn(ARMCPU *cpu, GuestFD *gf);
>  =20
>   static uint32_t host_closefn(ARMCPU *cpu, GuestFD *gf)
>   {
> @@ -454,6 +455,17 @@ static uint32_t host_seekfn(ARMCPU *cpu, GuestFD *gf=
, target_ulong offset)
>       return 0;
>   }
>  =20
> +static uint32_t host_flenfn(ARMCPU *cpu, GuestFD *gf)
> +{
> +    CPUARMState *env =3D &cpu->env;
> +    struct stat buf;
> +    uint32_t ret =3D set_swi_errno(env, fstat(gf->hostfd, &buf));
> +    if (ret =3D=3D (uint32_t)-1) {
> +        return -1;
> +    }
> +    return buf.st_size;
> +}
> +
>   static uint32_t gdb_closefn(ARMCPU *cpu, GuestFD *gf)
>   {
>       return arm_gdb_syscall(cpu, arm_semi_cb, "close,%x", gf->hostfd);
> @@ -486,12 +498,19 @@ static uint32_t gdb_seekfn(ARMCPU *cpu, GuestFD *gf=
, target_ulong offset)
>                              gf->hostfd, offset);
>   }
>  =20
> +static uint32_t gdb_flenfn(ARMCPU *cpu, GuestFD *gf)
> +{
> +    return arm_gdb_syscall(cpu, arm_semi_flen_cb, "fstat,%x,%x",
> +                           gf->hostfd, arm_flen_buf(cpu));
> +}
> +
>   typedef struct GuestFDFunctions {
>       sys_closefn *closefn;
>       sys_writefn *writefn;
>       sys_readfn *readfn;
>       sys_isattyfn *isattyfn;
>       sys_seekfn *seekfn;
> +    sys_flenfn *flenfn;
>   } GuestFDFunctions;
>  =20
>   static const GuestFDFunctions guestfd_fns[] =3D {
> @@ -501,6 +520,7 @@ static const GuestFDFunctions guestfd_fns[] =3D {
>           .readfn =3D host_readfn,
>           .isattyfn =3D host_isattyfn,
>           .seekfn =3D host_seekfn,
> +        .flenfn =3D host_flenfn,
>       },
>       [GuestFDGDB] =3D {
>           .closefn =3D gdb_closefn,
> @@ -508,6 +528,7 @@ static const GuestFDFunctions guestfd_fns[] =3D {
>           .readfn =3D gdb_readfn,
>           .isattyfn =3D gdb_isattyfn,
>           .seekfn =3D gdb_seekfn,
> +        .flenfn =3D gdb_flenfn,
>       },
>   };
>  =20
> @@ -687,16 +708,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>               return set_swi_errno(env, -1);
>           }
>  =20
> -        if (use_gdb_syscalls()) {
> -            return arm_gdb_syscall(cpu, arm_semi_flen_cb, "fstat,%x,%x",
> -                                   gf->hostfd, arm_flen_buf(cpu));
> -        } else {
> -            struct stat buf;
> -            ret =3D set_swi_errno(env, fstat(gf->hostfd, &buf));
> -            if (ret =3D=3D (uint32_t)-1)
> -                return -1;
> -            return buf.st_size;
> -        }
> +        return guestfd_fns[gf->type].flenfn(cpu, gf);
>       case TARGET_SYS_TMPNAM:
>           qemu_log_mask(LOG_UNIMP, "%s: SYS_TMPNAM not implemented", __fu=
nc__);
>           return -1;
>=20
