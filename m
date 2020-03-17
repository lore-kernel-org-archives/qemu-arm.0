Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp1319804lfe;
        Tue, 17 Mar 2020 02:53:09 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtD4TPyn5WTtVrDX/23ZhDejlM0bkp02JynpJldxx83g1u+Gt2oJTzA18XjtWKhLndlFx+d
X-Received: by 2002:a1c:7c05:: with SMTP id x5mr4412844wmc.67.1584438789618;
        Tue, 17 Mar 2020 02:53:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584438789; cv=none;
        d=google.com; s=arc-20160816;
        b=EPYoTyGMxFTvbu87OtZqyAmEF1XNThihkUkzeV4uenOnOswP0SUQvTweaaN2inAJs6
         hWDJWw5YuDbXrpaTcL89MvgGqpgpIX111JKXgRDcu6HABc5f0Bd9DSX2oJ5WWYTZcBlW
         bTEngX+aHH2nrn/QW7t17YVFZlZteGuEFuxujIGQ7ZOypdmsRFeSA3B5thxPveJtbKXc
         VHQv26qrVx3UvFYcxYB9dv+i5rPaB8JYa+er/JgfEskB6QlzunKO/qGkXgfm7XxVBra1
         N4I0AL5jXZKdNfUNeC3pEn2heyTLpyUWsZCzLoY/8N2fiVCjrp5zy8cm3cgNccA0HHzU
         HE2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=laNZlL7Tt9NYI5LoxZQ8lyNrzvzhVmV+Pbohz3i15mY=;
        b=zIqTOg+vv6oIPwDbhZTgYQcIoIEiyF7CSr6+DDh0DeYUjpcWwWibaNnu9RC/C07r/w
         /vmvvcQtTPpIqJGA/H5uxQYA4ivsvL4yvf8iviUFgt++dVmX2BJsy0iJ3DabeT+Y65TV
         TQbGG7V2n7IF7yYD1MnvOcduh+TJEBRIc7/ofLSeCIj3xjYQPb35maQFF7DSmz4LU2CH
         NvxoS7Bx8J7BhPZ3aCS74ahjCgMu6sJa5Fmo2tFiZ+u21XElslfrySvRNvmGiLEz+6Ij
         gR1rpYgKPLNeoLhObt9zLUFBv+zQlk4HPh5jwb5wSveHcxB34xSO5dMR+j+mIUoeMYTu
         eHzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Mmih/sfc";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com. [216.205.24.74])
        by mx.google.com with ESMTPS id a1si2160171wrp.323.2020.03.17.02.53.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Mar 2020 02:53:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) client-ip=216.205.24.74;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Mmih/sfc";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584438788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=laNZlL7Tt9NYI5LoxZQ8lyNrzvzhVmV+Pbohz3i15mY=;
	b=Mmih/sfcdW9+Fqtg9Q53Hsuy/JkouJr7+vJGXE6wreTYau461/Ls1zV7cw6ChOVmjDYV1X
	39VVFsRrex7K2L3A0ll+gI2BVFP4lKfPSGrK2Qpbnn5vYHZ9QEtc4fM1AWsan+lEHe/z7H
	UjN4MuxOL3oOP+EJr8w9UMShVuC4aGQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-zFTW3JEjPbe1YC4lM1zjPQ-1; Tue, 17 Mar 2020 05:53:06 -0400
X-MC-Unique: zFTW3JEjPbe1YC4lM1zjPQ-1
Received: by mail-wr1-f72.google.com with SMTP id t4so7485995wrv.9
        for <alex.bennee@linaro.org>; Tue, 17 Mar 2020 02:53:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OcE9RsIGTqtb4S7XTfRvGWs4Vuw7HRNex08Oaq9O0V0=;
        b=taP+wozON5Hzh0UB6jPbDUaRyDSGGH74GJHgwZMkr/I9i2aJewX3+QiMn9wDJk4Yyv
         n7tSYv3swsJPy1fWPwCTC/Z9fdT8yN+di4sEb1hZPI7xgg9VWKBJAhkQiwATeU/vrC/R
         dt9/wTIT9ZN6xF1ccNhi1QH67pSdl1NbvgML+2iRUECZfc0LHQUD66psBDgqWVuKUZ08
         coo7Vg1as7xHqQduMgbhLbGP9RwKinoQmbbA0C7f2OHbCSZEl8kYdfyC5G1nkG4IKVPm
         GN5TpV10IpQ/LtrjCBUtcAnAEkbYFZI+gAPiDo+RmDHk8fk8c/7b14n3nDRrTd9sLMcs
         EI6g==
X-Gm-Message-State: ANhLgQ083lX+wa0Yirqd+GHwJKQ1qV3zh6SKPyEmtpzneT3yEAEUxRWu
	Q7U/CRbmYGPcYkmijbyi26QQuJhu1f8tS8D3dRR8qBb3Kxl1/OQVXgPr0OnrdiNbFTDgA9N2lE+
	BrMs4gDLH8mx0ImNC
X-Received: by 2002:adf:f807:: with SMTP id s7mr5011841wrp.49.1584438785531;
        Tue, 17 Mar 2020 02:53:05 -0700 (PDT)
X-Received: by 2002:adf:f807:: with SMTP id s7mr5011821wrp.49.1584438785327;
        Tue, 17 Mar 2020 02:53:05 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.34] (96.red-83-59-163.dynamicip.rima-tde.net. [83.59.163.96])
        by smtp.gmail.com with ESMTPSA id l83sm3252809wmf.43.2020.03.17.02.53.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2020 02:53:04 -0700 (PDT)
Subject: Re: [PATCH v1 13/28] target/i386: use gdb_get_reg helpers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <rth@twiddle.net>
References: <20200316172155.971-1-alex.bennee@linaro.org>
 <20200316172155.971-14-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9ecb1d64-c447-5c0d-0280-ce9cd6537fa6@redhat.com>
Date: Tue, 17 Mar 2020 10:53:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200316172155.971-14-alex.bennee@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: 6W2we2BZg2L6

On 3/16/20 6:21 PM, Alex Benn=C3=A9e wrote:
> This is cleaner than poking memory directly and will make later
> clean-ups easier.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>=20
> ---
> v7
>    - remove stray space
>    - fixup the floatx80 set/get routines
> ---
>   target/i386/gdbstub.c | 27 +++++++++++----------------
>   1 file changed, 11 insertions(+), 16 deletions(-)
>=20
> diff --git a/target/i386/gdbstub.c b/target/i386/gdbstub.c
> index 572ead641ca..e4d8cb66c00 100644
> --- a/target/i386/gdbstub.c
> +++ b/target/i386/gdbstub.c
> @@ -98,26 +98,22 @@ int x86_cpu_gdb_read_register(CPUState *cs, uint8_t *=
mem_buf, int n)
>                   return gdb_get_reg64(mem_buf,
>                                        env->regs[gpr_map[n]] & 0xffffffff=
UL);
>               } else {
> -                memset(mem_buf, 0, sizeof(target_ulong));
> -                return sizeof(target_ulong);
> +                return gdb_get_regl(mem_buf, 0);
>               }
>           } else {
>               return gdb_get_reg32(mem_buf, env->regs[gpr_map32[n]]);
>           }
>       } else if (n >=3D IDX_FP_REGS && n < IDX_FP_REGS + 8) {
> -#ifdef USE_X86LDOUBLE
> -        /* FIXME: byteswap float values - after fixing fpregs layout. */
> -        memcpy(mem_buf, &env->fpregs[n - IDX_FP_REGS], 10);
> -#else
> -        memset(mem_buf, 0, 10);
> -#endif
> -        return 10;
> +        floatx80 *fp =3D (floatx80 *) &env->fpregs[n - IDX_FP_REGS];
> +        int len =3D gdb_get_reg64(mem_buf, cpu_to_le64(fp->low));
> +        len +=3D gdb_get_reg16(mem_buf + len, cpu_to_le16(fp->high));
> +        return len;
>       } else if (n >=3D IDX_XMM_REGS && n < IDX_XMM_REGS + CPU_NB_REGS) {
>           n -=3D IDX_XMM_REGS;
>           if (n < CPU_NB_REGS32 || TARGET_LONG_BITS =3D=3D 64) {
> -            stq_p(mem_buf, env->xmm_regs[n].ZMM_Q(0));
> -            stq_p(mem_buf + 8, env->xmm_regs[n].ZMM_Q(1));
> -            return 16;
> +            return gdb_get_reg128(mem_buf,
> +                                  env->xmm_regs[n].ZMM_Q(0),
> +                                  env->xmm_regs[n].ZMM_Q(1));
>           }
>       } else {
>           switch (n) {
> @@ -290,10 +286,9 @@ int x86_cpu_gdb_write_register(CPUState *cs, uint8_t=
 *mem_buf, int n)
>               return 4;
>           }
>       } else if (n >=3D IDX_FP_REGS && n < IDX_FP_REGS + 8) {
> -#ifdef USE_X86LDOUBLE
> -        /* FIXME: byteswap float values - after fixing fpregs layout. */
> -        memcpy(&env->fpregs[n - IDX_FP_REGS], mem_buf, 10);
> -#endif
> +        floatx80 *fp =3D (floatx80 *) &env->fpregs[n - IDX_FP_REGS];
> +        fp->low =3D le64_to_cpu(* (uint64_t *) mem_buf);
> +        fp->high =3D le16_to_cpu(* (uint16_t *) (mem_buf + 8));
>           return 10;
>       } else if (n >=3D IDX_XMM_REGS && n < IDX_XMM_REGS + CPU_NB_REGS) {
>           n -=3D IDX_XMM_REGS;
>=20

I'd prefer both USE_X86LDOUBLE hunks in a separate patch, anyway:

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
