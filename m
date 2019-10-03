Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp93793wrp;
        Thu, 3 Oct 2019 16:29:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwvmuPKoN3Uv5SVL3GxU4w7dXm6EihGeANAUOVqR8lOF4wQ73/hYXmv9qgYo8hBuSh+NIH3
X-Received: by 2002:ac8:44c9:: with SMTP id b9mr12842369qto.175.1570145363218;
        Thu, 03 Oct 2019 16:29:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570145363; cv=none;
        d=google.com; s=arc-20160816;
        b=p/gJQheHwJ7uPcMbom+qWq8QGPybHl+rOt4Lr7XWu0fMrmdf5WQNT6Id5WVZpMXx+p
         zLaQppWnbXTeeEXhzkPKroGDxUq7sM2cEBBpuLi45riqQwLCV2JUO4Hw1ku1hL6BwTOE
         CyiKhNpDKqsEtDH8awihSGiqj6bSQnJN/QlAkHHA33DMRpOLlC1zBWlppuiwu28E/32I
         4e8tbCanbJUrzLCTxzq8Jo70iDOCL/sBBqs1sWaqlBm81TZQFkL2i1+TuaXjcn9exxig
         vgBZYqttwJiGYf/gRPVqONAR93IYseFsRf0NXE+s9iZaSrr2m4OKpt2bVUJ0v7fJK7r9
         RcvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=lug1IHNMsci9kH3TbbG/SfQVLQjhIg+n01QH3RSNDvo=;
        b=U0Ah/ZqrAFCl+tJkdhReonVSOCHoyNjVG1oMn/5wrFWk2r7ICE/xQE9ZU6kaw5ApYr
         OPtTvZalugS1eC75TM4hohibaKUaSD0Ucm5PrY/2n7dtveTP53aEyBHCegfxhiDZ5PO4
         U6klK3OnYd5wEzd3jrynxVLe0EWlNpztyw/71SrBoUQ7M86D7/HHnuqMrYjEuLLczSEL
         yB0jGL27ejUyMoeujA1kGyLC0pBvORMmJ2vmM7ZhAbQCQYj6XDmDbraza1sRC0wQ41nS
         l8atgDQJEGmXLtb5u7keaKeN3199HmilLevSkAGSQ5DKpmNxLBU8wkjkQEka0aWBsn8x
         uICA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DtbXlsTL;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id j29si4144562qtj.292.2019.10.03.16.29.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Oct 2019 16:29:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DtbXlsTL;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1570145362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lug1IHNMsci9kH3TbbG/SfQVLQjhIg+n01QH3RSNDvo=;
	b=DtbXlsTLVPzvXsucDUIQ7ddtwaP7cM2vlS1WvWu78grpQTiv/pssV1v5V8htDEHh4sN7UM
	b8448jmd70qBxqatmPKlXLlNr79zNLh4fbyMFixO50TjiBIl6w0S7xUGDI3b6RI2gr9KOb
	bgi5xH1zfL1r25PDHzNTYdrFwIt659Y=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-DqJo5dTkNLyeO-PZKhpBVw-1; Thu, 03 Oct 2019 19:29:19 -0400
Received: by mail-wr1-f72.google.com with SMTP id v18so1810929wro.16
        for <alex.bennee@linaro.org>; Thu, 03 Oct 2019 16:29:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mQdrfWT4Jc40UpM8uY0IF8lHGug5x5FrZQcKkl53+Tg=;
        b=ecOb5g71tGNy6pc9NJ+3kEeA7EGjXnHOghtkD5jS8l7A/g/Xmn2HP1ufaAvHb44Y3j
         603rXEjAAgtiIQAD9rtsNH3oOEHpHlVYyIrU3opugfr316HhsZrX8a0N9a2vvlxJsc2A
         c0KYbCxR/kYZ/wZUQ0d0z01wlyxDNwoG+FMlBSSHlvuES33OaCZZePEK6jG1iZIMHz++
         zwe+6NxQ2XpbP0xG0OAIcOd5dgbFLx/AlIZZkUsCGvkre6pz1jE7gcZ36K4XsyiXNEtI
         mqmGJkp0iuyqGL3WjVrv6tk6+uuWdSTotrF370iOZM84DCpDtaaOz4djNPz4SKcW+yme
         LgXQ==
X-Gm-Message-State: APjAAAVU7+33qNenOwnV6hj/SxHWoF5EbYEryVMwvBNVh1d7INY3jSPA
	S2KIKWBG0s5mWXX4Hmxafglako0h9LF8/hFzbJlIzaMdtbHERE1gL7XFFumrMdNRM3fPCIaj4gF
	yRZ7STeymETtNFm0s
X-Received: by 2002:a05:600c:351:: with SMTP id u17mr8364959wmd.1.1570145357996;
        Thu, 03 Oct 2019 16:29:17 -0700 (PDT)
X-Received: by 2002:a05:600c:351:: with SMTP id u17mr8364952wmd.1.1570145357764;
        Thu, 03 Oct 2019 16:29:17 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.35] (240.red-88-21-68.staticip.rima-tde.net. [88.21.68.240])
        by smtp.gmail.com with ESMTPSA id l11sm4768017wmh.34.2019.10.03.16.29.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2019 16:29:17 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v2 06/15] target/arm/arm-semi: Use
 set_swi_errno() in gdbstub callback functions
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190916141544.17540-1-peter.maydell@linaro.org>
 <20190916141544.17540-7-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <660550a6-60c1-13ba-1caf-a9e5126b7b0f@redhat.com>
Date: Fri, 4 Oct 2019 01:29:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190916141544.17540-7-peter.maydell@linaro.org>
Content-Language: en-US
X-MC-Unique: DqJo5dTkNLyeO-PZKhpBVw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: PGw5syTgtoBx

On 9/16/19 4:15 PM, Peter Maydell wrote:
> When we are routing semihosting operations through the gdbstub, the
> work of sorting out the return value and setting errno if necessary
> is done by callback functions which are invoked by the gdbstub code.
> Clean up some ifdeffery in those functions by having them call
> set_swi_errno() to set the semihosting errno.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> ---
>   target/arm/arm-semi.c | 27 ++++++---------------------
>   1 file changed, 6 insertions(+), 21 deletions(-)
>=20
> diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
> index 2618588076f..02cd673d47d 100644
> --- a/target/arm/arm-semi.c
> +++ b/target/arm/arm-semi.c
> @@ -259,17 +259,11 @@ static void arm_semi_cb(CPUState *cs, target_ulong =
ret, target_ulong err)
>   {
>       ARMCPU *cpu =3D ARM_CPU(cs);
>       CPUARMState *env =3D &cpu->env;
> -#ifdef CONFIG_USER_ONLY
> -    TaskState *ts =3D cs->opaque;
> -#endif
>       target_ulong reg0 =3D is_a64(env) ? env->xregs[0] : env->regs[0];
>  =20
>       if (ret =3D=3D (target_ulong)-1) {
> -#ifdef CONFIG_USER_ONLY
> -        ts->swi_errno =3D err;
> -#else
> -        syscall_err =3D err;
> -#endif
> +        errno =3D err;
> +        set_swi_errno(env, -1);
>           reg0 =3D ret;
>       } else {
>           /* Fixup syscalls that use nonstardard return conventions.  */
> @@ -326,11 +320,8 @@ static void arm_semi_flen_cb(CPUState *cs, target_ul=
ong ret, target_ulong err)
>       } else {
>           env->regs[0] =3D size;
>       }
> -#ifdef CONFIG_USER_ONLY
> -    ((TaskState *)cs->opaque)->swi_errno =3D err;
> -#else
> -    syscall_err =3D err;
> -#endif
> +    errno =3D err;
> +    set_swi_errno(env, -1);
>   }
>  =20
>   static int arm_semi_open_guestfd;
> @@ -339,15 +330,9 @@ static void arm_semi_open_cb(CPUState *cs, target_ul=
ong ret, target_ulong err)
>   {
>       ARMCPU *cpu =3D ARM_CPU(cs);
>       CPUARMState *env =3D &cpu->env;
> -#ifdef CONFIG_USER_ONLY
> -    TaskState *ts =3D cs->opaque;
> -#endif
>       if (ret =3D=3D (target_ulong)-1) {
> -#ifdef CONFIG_USER_ONLY
> -        ts->swi_errno =3D err;
> -#else
> -        syscall_err =3D err;
> -#endif
> +        errno =3D err;
> +        set_swi_errno(env, -1);
>           dealloc_guestfd(arm_semi_open_guestfd);
>       } else {
>           associate_guestfd(arm_semi_open_guestfd, ret);
>=20
