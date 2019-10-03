Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp100648wrp;
        Thu, 3 Oct 2019 16:35:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzne2tO2DJfn43SnSwONJpogtS2MjMWz3ixONHSySgpHydP/rPc/HneFCQJxMbiit9QVLfn
X-Received: by 2002:ac8:48d8:: with SMTP id l24mr5033917qtr.241.1570145744287;
        Thu, 03 Oct 2019 16:35:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570145744; cv=none;
        d=google.com; s=arc-20160816;
        b=Q/Wh+xjnaJMpT3+LvaqS3cdxnpU8UDu35VxBlOuu+jqdROIb0CqWLLtjDkEKazIPXQ
         4rustcHEaxkjgauG0jTTQ6XtgcfUcF3AEIJi6qEehyYVnuji7G4SrDcJsnN1cEnS8Mil
         K62kkaefom26MVnCroSj9X9AJxwZVFgjAk3o4YKqbdTOWWclW/8hrlAbsqbbWka2Xs3L
         fGIjfl6NCowK+kXWwvRJg3DYv+p/poMX9c6fc/MMHN2f2oWegbLjjGWgWSCfHoKusgoD
         7IiBgMW3JGuZgcpX+Iy0BcIHpiiThBzeFzevnkLhxTGSUBuozbWWoX7BIwqLlUm3GT+x
         wLBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=fyCnNaclr1coILkgqFFyMfCkBB0uT3Y7AO7cBo7S4ZY=;
        b=iu+s8qLjvFg0fGHxtYYi8ZrsZ7H0v7cLjtwFtLmOU0ShSmxzRbEl1rW5UIwa1wh23L
         WA5FztxISVFwycMpV3bUpG2f2mRm+5S2Rr3TGJ216YcAgQBRx7mHMT4pPp+0Upt59UrQ
         Xc4RXQ5klTb1I2775uZ7v98LefJyOQZUpSNhY3xJpvcd/MRe6QR0SKnYV9thFS8j8hYn
         HbGJUvtWyk0enJdpFKpx2Ef9LZwbk2S06TK0bGNY+rrzws7HwR/wQGQEz4S9nSVTh/Sn
         P1vNjAlV/KA52omD3laRl7OiCG8mYZf7H5po8e1da3dMY+BGMTC+g2V7MYWYXD/lh6/c
         JqGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AM0RtcI8;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id s94si4039449qtd.29.2019.10.03.16.35.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Oct 2019 16:35:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AM0RtcI8;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1570145743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fyCnNaclr1coILkgqFFyMfCkBB0uT3Y7AO7cBo7S4ZY=;
	b=AM0RtcI8Zbm4l2QiJwmbIcT+UR+NKBR4AaxyaAcCWINbizYZQZOScbXltCk1ET/lzKMFAi
	nXGSeNPRr8elWK/Hy9HHdoACiVEDwXbR7Jm0M02S/shRmw6o9SoneNUmcWXMdG6SDTNqAi
	W5u3U0L6MKLkQZ/tkJspjAtGWY6l7kE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198--hNv1IzqP8uFRIqwuza1Xw-1; Thu, 03 Oct 2019 19:35:42 -0400
Received: by mail-wr1-f71.google.com with SMTP id m14so1816653wru.17
        for <alex.bennee@linaro.org>; Thu, 03 Oct 2019 16:35:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1KQnw7PBZF8rEylxGzGQfhR2h8Ga9+Dwp53B1SQXiqA=;
        b=kBMoLw6Yz4d+pdzYmgpiZsE2n+HLK89PU47+kGHxRB50GGkaVVnSUIPsf6OKWmqlfP
         H47nlYTLukA6FimU1xZHElZ5iZTsrCgHVbqA2tTSfxINtPaD5ao0lLqBLFznDSTsYUPQ
         Tm6AJQKqpnUlemtOkInlgWjTIv/CB4xtF5scBU91nh+4UU53fcG7ABrSm50YJd6zU8ky
         vcW/A0btfD+YsIIOMenGKLbF+rV4va9WmLglXSxZy81pXpxdjzoxYQfsI3FDmsfay2CW
         tozpKItlOyMVnzcN+iaSGq+GkxfsdxqmGiU8rDLhSkGzVdYLTxI2Yr32iHgytoVJupef
         HqVQ==
X-Gm-Message-State: APjAAAUm8ujHGxIe5zzmTVTD6jWog96qQ+q+QtkfuUkXtVbBdfLwIsf8
	K+I53eOerbALcL40OGErQzYwy2XSJw133sKVhwfOBdgg+UQp+mB3U92YPZsDaFdzjBPGEn5NqFA
	fi/TmMJUjUUYgFr/8
X-Received: by 2002:a1c:4485:: with SMTP id r127mr8148527wma.59.1570145741292;
        Thu, 03 Oct 2019 16:35:41 -0700 (PDT)
X-Received: by 2002:a1c:4485:: with SMTP id r127mr8148519wma.59.1570145741062;
        Thu, 03 Oct 2019 16:35:41 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.35] (240.red-88-21-68.staticip.rima-tde.net. [88.21.68.240])
        by smtp.gmail.com with ESMTPSA id t17sm7175316wrp.72.2019.10.03.16.35.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2019 16:35:40 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v2 10/15] target/arm/arm-semi: Factor out
 implementation of SYS_ISTTY
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190916141544.17540-1-peter.maydell@linaro.org>
 <20190916141544.17540-11-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <20a30b5b-177b-0d24-00bb-6b49305af8a0@redhat.com>
Date: Fri, 4 Oct 2019 01:35:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190916141544.17540-11-peter.maydell@linaro.org>
Content-Language: en-US
X-MC-Unique: -hNv1IzqP8uFRIqwuza1Xw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: QaSJh75JesVq

On 9/16/19 4:15 PM, Peter Maydell wrote:
> Factor out the implementation of SYS_ISTTY via the new function
> tables.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> ---
>   target/arm/arm-semi.c | 20 +++++++++++++++-----
>   1 file changed, 15 insertions(+), 5 deletions(-)
>=20
> diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
> index 958083a105c..ecd51338fd3 100644
> --- a/target/arm/arm-semi.c
> +++ b/target/arm/arm-semi.c
> @@ -388,6 +388,7 @@ typedef uint32_t sys_writefn(ARMCPU *cpu, GuestFD *gf=
,
>                                target_ulong buf, uint32_t len);
>   typedef uint32_t sys_readfn(ARMCPU *cpu, GuestFD *gf,
>                               target_ulong buf, uint32_t len);
> +typedef uint32_t sys_isattyfn(ARMCPU *cpu, GuestFD *gf);
>  =20
>   static uint32_t host_closefn(ARMCPU *cpu, GuestFD *gf)
>   {
> @@ -436,6 +437,11 @@ static uint32_t host_readfn(ARMCPU *cpu, GuestFD *gf=
,
>       return len - ret;
>   }
>  =20
> +static uint32_t host_isattyfn(ARMCPU *cpu, GuestFD *gf)
> +{
> +    return isatty(gf->hostfd);
> +}
> +
>   static uint32_t gdb_closefn(ARMCPU *cpu, GuestFD *gf)
>   {
>       return arm_gdb_syscall(cpu, arm_semi_cb, "close,%x", gf->hostfd);
> @@ -457,10 +463,16 @@ static uint32_t gdb_readfn(ARMCPU *cpu, GuestFD *gf=
,
>                              gf->hostfd, buf, len);
>   }
>  =20
> +static uint32_t gdb_isattyfn(ARMCPU *cpu, GuestFD *gf)
> +{
> +    return arm_gdb_syscall(cpu, arm_semi_cb, "isatty,%x", gf->hostfd);
> +}
> +
>   typedef struct GuestFDFunctions {
>       sys_closefn *closefn;
>       sys_writefn *writefn;
>       sys_readfn *readfn;
> +    sys_isattyfn *isattyfn;
>   } GuestFDFunctions;
>  =20
>   static const GuestFDFunctions guestfd_fns[] =3D {
> @@ -468,11 +480,13 @@ static const GuestFDFunctions guestfd_fns[] =3D {
>           .closefn =3D host_closefn,
>           .writefn =3D host_writefn,
>           .readfn =3D host_readfn,
> +        .isattyfn =3D host_isattyfn,
>       },
>       [GuestFDGDB] =3D {
>           .closefn =3D gdb_closefn,
>           .writefn =3D gdb_writefn,
>           .readfn =3D gdb_readfn,
> +        .isattyfn =3D gdb_isattyfn,
>       },
>   };
>  =20
> @@ -631,11 +645,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>               return set_swi_errno(env, -1);
>           }
>  =20
> -        if (use_gdb_syscalls()) {
> -            return arm_gdb_syscall(cpu, arm_semi_cb, "isatty,%x", gf->ho=
stfd);
> -        } else {
> -            return isatty(gf->hostfd);
> -        }
> +        return guestfd_fns[gf->type].isattyfn(cpu, gf);
>       case TARGET_SYS_SEEK:
>           GET_ARG(0);
>           GET_ARG(1);
>=20
