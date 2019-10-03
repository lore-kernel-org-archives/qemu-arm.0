Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp90032wrp;
        Thu, 3 Oct 2019 16:24:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwWp1fxlSwR1UxYNGrSHxpACK683bb6rN/Y+wJuZ2HCL54HFr0qupx0CqI5E0EnUc4XnNLl
X-Received: by 2002:ac8:36c7:: with SMTP id b7mr13183024qtc.275.1570145081761;
        Thu, 03 Oct 2019 16:24:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570145081; cv=none;
        d=google.com; s=arc-20160816;
        b=ciO/gnLtxsUW0D4NPciX4uDfa1hTnClBlI5Iv47yv59uen26dZAEyNMCbe840smtDf
         UFyc9+ETknKPqeEu1CP+wHNWcPT3eCzKeya55ooDKWB3X8pm7M6KNoCbMFALZjAaG31r
         U2J9JZU67pv3NCP/+agObMwW3f6mdAe2vAccXGJo00mMHcuX8mwln91OFasFIjwnkxXe
         W38Mc1aQ/5lsp2YoPbZWAeQB6B9FyuaVvfbjlXp9FlC/f+fKzRewLc3mitIEWloXbLP2
         bUWE5al47YdSmc8d5aqn9aGzNEUEViXgr2UOks2QyK/v2Ej1hq7cqjPm7n3/bMWcHiLo
         o7hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Wki6/h0rYHJ1VluFFFgwSUQEH1GEWfy/N8CY+kJiJCU=;
        b=Z5OvHnuHIFwetyk+BWtz0RXqv4HK8LWpOOh1qDXUIbHV/r5A3cwFVQvOX0YsqvKQZC
         pVnNn1tFfivIp23bJjPpEpbZtkEC8H/VbR6NyuTrWQEF/mOLC3xK4RJSfEMJU2v42bVR
         fP95nhqowzkJLVK64qzQicDAAk5uBZD2wvGVyyCfkMC5+6kWhRaH+si4kav4HtyASGdF
         k0np0YDIZORWqCLx1JoiIDWiNdDK8kUgVMgzBXmUqo6sC1CxYX0jTEhHKqzRTXQoKbOa
         puMrg9UDxQikQf86Z6Rd6ebaT51Wha3ezgHnRfLIhc/QtQkdF2pAQzgabesu6xuf5v+l
         j+Lw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QOcjLYgr;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id d204si3831967qkg.31.2019.10.03.16.24.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Oct 2019 16:24:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QOcjLYgr;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1570145081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wki6/h0rYHJ1VluFFFgwSUQEH1GEWfy/N8CY+kJiJCU=;
	b=QOcjLYgrJtDNDOgPkfx1zfse2P1xbWKYZWCGEVNl+xe0bZANoVZBSAntlPu6ATm12nFg0x
	xj/JomzSr+nOxD6BI2I9YSV12C2Wr6FSpDaeUKs2loHLXfx/yl7MFNVYLV4JYosAfHJkbD
	/k1CP1WrVm5x5dQqfeROwdNohPeKRek=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-XEskIrxZPw-7vdzYEQhFsA-1; Thu, 03 Oct 2019 19:24:39 -0400
Received: by mail-wm1-f69.google.com with SMTP id o188so1777799wmo.5
        for <alex.bennee@linaro.org>; Thu, 03 Oct 2019 16:24:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xnT5eQjNQBARaF6UDq3kKyCElJIjEQvAj4d/TAmzogM=;
        b=MutkJ2l33qdhUgdX/fCpPISneGIytAprE27RxrN7u5ZaAlUnKy7edN7HGjRDvHRvmA
         t9a0o9FQyCK0G13TXXhBrtXEqtyURK1iaFM+Dwew2PaujTtNWe0nTa17mH6lEoMgZcR3
         Tr3Gu+kEUVjSmnRLTEQhhy0pRXsXB3s0DybdRJIAW84wsLMaxXdNamyrFoaXv638F6v+
         4PkvKIDKUmfotFzxTux5ohW0arixZQqstg/5hkoRq25y/pJNkJpeBsKIsSR05A+/cXaf
         nkbiW9j113yU98gvg04HxitCVBzZuV3dsYgcD5skeEDQYTPHGe2AXEeYWKWtFe1A1aQg
         UvZA==
X-Gm-Message-State: APjAAAUg9+LWlWv2+cS3AWhdgiTR5WyOun+QsU2Q4wMTxIKCYr4Z8j8+
	15+HCbXMur+R2Mi9g/K5JB2TtAO7gdBK0lx4M2pqtxkwEqvFOTTJSXgSpPpGiMm+ZuSg/FD5uSM
	Myg65qCRlrw+2SxDb
X-Received: by 2002:adf:8b13:: with SMTP id n19mr9547885wra.203.1570145078403;
        Thu, 03 Oct 2019 16:24:38 -0700 (PDT)
X-Received: by 2002:adf:8b13:: with SMTP id n19mr9547869wra.203.1570145078220;
        Thu, 03 Oct 2019 16:24:38 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.35] (240.red-88-21-68.staticip.rima-tde.net. [88.21.68.240])
        by smtp.gmail.com with ESMTPSA id o22sm9901551wra.96.2019.10.03.16.24.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2019 16:24:37 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v2 01/15] target/arm/arm-semi: Capture errno
 in softmmu version of set_swi_errno()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190916141544.17540-1-peter.maydell@linaro.org>
 <20190916141544.17540-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a10f43ac-82e8-7600-94d3-513feafaf325@redhat.com>
Date: Fri, 4 Oct 2019 01:24:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190916141544.17540-2-peter.maydell@linaro.org>
Content-Language: en-US
X-MC-Unique: XEskIrxZPw-7vdzYEQhFsA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: 1f6dBfjcoVCU

On 9/16/19 4:15 PM, Peter Maydell wrote:
> The set_swi_errno() function is called to capture the errno
> from a host system call, so that we can return -1 from the
> semihosting function and later allow the guest to get a more
> specific error code with the SYS_ERRNO function. It comes in
> two versions, one for user-only and one for softmmu. We forgot
> to capture the errno in the softmmu version; fix the error.
>=20
> (Semihosting calls directed to gdb are unaffected because
> they go through a different code path that captures the
> error return from the gdbstub call in arm_semi_cb() or
> arm_semi_flen_cb().)
>=20

Fixes: 8e71621f784
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> NB that a later commit will put in some cleanup of TaskState
> that will let us reduce the duplication between the two
> implementations of this function.
> ---
>   target/arm/arm-semi.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
> index 90423a35deb..03e60105c05 100644
> --- a/target/arm/arm-semi.c
> +++ b/target/arm/arm-semi.c
> @@ -114,8 +114,13 @@ static inline uint32_t set_swi_errno(TaskState *ts, =
uint32_t code)
>       return code;
>   }
>   #else
> +static target_ulong syscall_err;
> +
>   static inline uint32_t set_swi_errno(CPUARMState *env, uint32_t code)
>   {
> +    if (code =3D=3D (uint32_t)-1) {
> +        syscall_err =3D errno;
> +    }
>       return code;
>   }
>  =20
> @@ -124,10 +129,6 @@ static inline uint32_t set_swi_errno(CPUARMState *en=
v, uint32_t code)
>  =20
>   static target_ulong arm_semi_syscall_len;
>  =20
> -#if !defined(CONFIG_USER_ONLY)
> -static target_ulong syscall_err;
> -#endif
> -
>   static void arm_semi_cb(CPUState *cs, target_ulong ret, target_ulong er=
r)
>   {
>       ARMCPU *cpu =3D ARM_CPU(cs);
>=20
