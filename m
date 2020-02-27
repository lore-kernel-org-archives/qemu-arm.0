Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4281876lfg;
        Thu, 27 Feb 2020 02:55:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqwL+tcJHN48oL39Q0+/ps3z6O/FSkZLQv7t/9yuSCCw3owdkZv8ffbWM30I49zU9LTrETsI
X-Received: by 2002:a05:6402:1496:: with SMTP id e22mr3606150edv.132.1582800958925;
        Thu, 27 Feb 2020 02:55:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582800958; cv=none;
        d=google.com; s=arc-20160816;
        b=m/IFfM1lk19O4exBfRrmGVWjo6uq7Yqi/Q/oNmO3+mCAddMzWXLG2hBlU5mR+lldnM
         7rtBs8NBtp2fVzTDnUW/Jdi4PiL6DzrR6YXWu3ZIYVyd3RHHRzFMbtqNAoG2G2jsL7Rg
         2s7cMpX3hctrqH+YlLOB2Vq4z3DJi9Atj/Zfno9vPeQJPqT9dLocAhvqRPT7/j9ItQRN
         alThLr3zd7VB+GbZ0Ne71fHmoWcti7aiytlSJz02tD5zTCDqYZ5JlLbOqh80JfeEWdgN
         xHIxbgcnVUJM4HMrwD3T5iRj/YDH+Rsdng5gMOg3dx2348ZPZiDlESqt3aSNRZ76kuSA
         /8FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=wEYoNT/cijPB7GqibG/gzqnvDkM/46SZAJDGRq2EqsQ=;
        b=0GG9tKN2oq8LBmUJ1vnBiEszDZdCQT5Uac9k3Rd2HuQnQFGA14y/NQlGDckBeWeXCm
         UGIdEn66rzmu2BBGL6jA3fvqiT42aD+gHjmtVZovxhRgRKlNvhfSya4vY48Gp20AzHe7
         CQyxtTLWsxoPaKvx+3qNTqEgTGGSisEMfm2OSt4yJ1kJDCuBrvDgh11PVYxHzjstYZUy
         OrxsP1sSfBoT3mSZb76KyAEaoSopgG7tlvwlxOmC0621cz0S1smDLitamA1/tEtlxAA5
         EGSClh/xFSrwgWUqBcGqrnnLTBspwWD00ebX9gTLg7i1h+l2uxUPUzzbn/tlwYPOsnFg
         au9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iHxMkwqR;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id p17si1719673edq.165.2020.02.27.02.55.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Feb 2020 02:55:58 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iHxMkwqR;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582800957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wEYoNT/cijPB7GqibG/gzqnvDkM/46SZAJDGRq2EqsQ=;
	b=iHxMkwqR1coFPn8xu/RCW7LxF1i/6MivM45EJ2QzXevW6PyP+8HlQZwdTNRt5dkGp1o2DF
	CHtuP2xZNIwJf/ylxpaILGDqat2tltP3f5MZNLaYmhAoZCmJn3c4Xn8mCKaFn4CHJ8ltSS
	v5a+Y8QlrizkrGh3gjgvVEVYP6dIVP4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-tpUKyEJgMIiXJM6FkwNLpw-1; Thu, 27 Feb 2020 05:55:56 -0500
X-MC-Unique: tpUKyEJgMIiXJM6FkwNLpw-1
Received: by mail-wm1-f70.google.com with SMTP id j130so844189wmj.9
        for <alex.bennee@linaro.org>; Thu, 27 Feb 2020 02:55:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kteApUs3RsCNniCriUznWuhA9fmjUixYiTjqoR6ql5U=;
        b=eMXquYunJLfBQXErSjz5KTnzILzdTdIjxhYhDeyp1D+ViDfez+vsJOyiSlZOSz4J71
         Cbc6H9Ux16EmuQIQJCKiQ0RZe0cJb2PHQDn3udERmNx6uOZziyYsaYd6QBmPCSdytCG7
         UervigMGu4kFtMmEkLzASxJpRcgwqqalkoYhv30sKSAro475vGgO1ECWWG/SJlq4BEHv
         Z262K2IwzzeJ26YoXIpyXOk2n3l1+4geTHudch6Shym9YG7i3aKwok8bLOP4xQm5wDpL
         A6mycStyqyEwALOnklviA05noo9BRghZXJPpsy4+BLHTxRRUrDgZgIr5hzZ0lrnOTx7f
         nClA==
X-Gm-Message-State: APjAAAXwjHZqKuJDIK10vw1qg0V69mtlA/RCcpkHRhQubPYTf4XlUpQz
	6CWuCnXzyXJ1KrtXTYsngdjrcNG5Oloo5WL5IEGvitCbbvxVKIqo6JZ1P7vyKeUyutCRJnxWpGe
	xuJdivbrC+htRfLbL
X-Received: by 2002:a5d:4bd2:: with SMTP id l18mr4003616wrt.99.1582800954946;
        Thu, 27 Feb 2020 02:55:54 -0800 (PST)
X-Received: by 2002:a5d:4bd2:: with SMTP id l18mr4003591wrt.99.1582800954643;
        Thu, 27 Feb 2020 02:55:54 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net. [88.21.205.47])
        by smtp.gmail.com with ESMTPSA id p10sm559730wrx.81.2020.02.27.02.55.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2020 02:55:54 -0800 (PST)
Subject: Re: [PATCH v1 3/4] accel/tcg: only USE_STATIC_CODE_GEN_BUFFER on 32
 bit hosts
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>
References: <20200226181020.19592-1-alex.bennee@linaro.org>
 <20200226181020.19592-4-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <fe07b79c-3324-c9ea-b658-ef7790494ecf@redhat.com>
Date: Thu, 27 Feb 2020 11:55:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200226181020.19592-4-alex.bennee@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: pVIKDj1E3ZcF

On 2/26/20 7:10 PM, Alex Benn=C3=A9e wrote:
> There is no particular reason to use a static codegen buffer on 64 bit
> hosts as we have address space to burn. Allow the common CONFIG_USER
> case to use the mmap'ed buffers like SoftMMU.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>   accel/tcg/translate-all.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 5b66af783b5..4ce5d1b3931 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -892,11 +892,12 @@ static void page_lock_pair(PageDesc **ret_p1, tb_pa=
ge_addr_t phys1,
>       }
>   }
>  =20
> -#if defined(CONFIG_USER_ONLY)
> -/* Currently it is not recommended to allocate big chunks of data in
> -   user mode. It will change when a dedicated libc will be used.  */
> -/* ??? 64-bit hosts ought to have no problem mmaping data outside the
> -   region in which the guest needs to run.  Revisit this.  */
> +#if defined(CONFIG_USER_ONLY) && TCG_TARGET_REG_BITS =3D=3D 32
> +/*
> + * For user mode on smaller 32 bit systems we may run into trouble
> + * allocating big chunks of data in the right place. On these systems
> + * we utilise a static code generation buffer directly in the binary.
> + */
>   #define USE_STATIC_CODE_GEN_BUFFER
>   #endif
>  =20
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
