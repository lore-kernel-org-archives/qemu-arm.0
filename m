Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3215041wru;
        Fri, 5 Jul 2019 07:10:29 -0700 (PDT)
X-Received: by 2002:a02:a703:: with SMTP id k3mr4808002jam.12.1562335829402;
        Fri, 05 Jul 2019 07:10:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562335829; cv=none;
        d=google.com; s=arc-20160816;
        b=FzChx5tGiYDtEDPKLls/BnmQdoBwFXnTWG4KTzG5KR8a26uQbrX0MVYQQ1YdMp9Bqq
         4PpLjKxV2acUG33YGd+ivnd9JkhGcH0P9fHpLFxCB9vMEovuJg6/6sqEUlF2mY8RPhDY
         uKp4sHXmjkbShurA5jwLKntRl707NEhfGlVFkGtNm7bUi+cZ1+D1eb4Ny5N+YG0w9MYi
         qNDeppRzyXqYfsudsCiqOpObxvQqOccRDGEe8WbW5JWC6eogDlqhaw1xY8UGzPj07Vhs
         UWTKqEbAkTcnn/gEvTtYBmrN+hG1GZobeUMmqScwg9doGaXEljBckRLx7bpBTMYbJTZE
         fKrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jc8T6B1sYMgE8KUu3r8iCtOxhFzftBC0DO27E9t5POg=;
        b=q68YAxRHLav9IVlvr0QxXOirKVWTGH0A2qChxTlrP085IjfNk4zzJTm6bFD97fG5bF
         9oQVYljne8eI+074oKEGi3HA+p1p/a5Bb65uyCSKrSZA96/9TqTW5l3veFhNFtmiP8mp
         8vjfAzdhRmKXIsu5AZ9wPyMXLjGH80iMtzWQlmI7se+ds4yhGx2Q9LF+DjFxDJGUIsEP
         nq4uEIkwmrXB4tofB+V/sqMUntVDPfhmys/UC45ryB0DdadD7HF9m4VO2Hqm9LTY10DE
         qxAFeM8UKuOomtW+oi19h3lSesqjx2eLAZNtSgwfwUux1VBlDILJv8anfrmHXg+gLNNn
         JPaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=tyL3hlik;
       spf=pass (google.com: domain of laurent.desnogues@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=laurent.desnogues@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <laurent.desnogues@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 197sor20157473jaa.13.2019.07.05.07.10.29
        (Google Transport Security);
        Fri, 05 Jul 2019 07:10:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of laurent.desnogues@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=tyL3hlik;
       spf=pass (google.com: domain of laurent.desnogues@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=laurent.desnogues@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jc8T6B1sYMgE8KUu3r8iCtOxhFzftBC0DO27E9t5POg=;
        b=tyL3hlikgB7h11DqJBXwuvH1+JMnWTh2xDiNBC/IEwBdd1G6UxmyHfDcWRclCr4OPL
         WGlaPixlePBhQzKgbBNrMvj+a3PtJlAvyOisdABzL1cqS+ZjhhJwsEHMipfeAUzH+6fW
         EpIj8DZL74u/8uKgoI3ZKhpQrdk1YBZwe4sba8xlIkOxiz4phnwIp6nTSyM55dRV9W2Q
         Wv2svVhyMFggrQ0a9BLg9zVx8BJ07DQ48muqSckgK0s+vmqjK0g+Ndp29yBQ1t8s/2hl
         0O7HiiMSABZLCveKMDOq+0mNSd0voyx+MdyPd6MEMaY/vAu31+5YtK7Bp7yrfqcnehhU
         UOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jc8T6B1sYMgE8KUu3r8iCtOxhFzftBC0DO27E9t5POg=;
        b=W4cUmxhgr6GwahKGOp3pRhxTZviwErMqaCqekGX19O/mQj8dht0yJmH+is12eqa8P9
         hgfBqUDs/X4EhUBVmk+TIGv7M5wgyoJwjmRB0UDx+3MlHfMYCFDcwAsIt6r+5Fyw+lVy
         zV9dVEmFhfEIcuqYDev2daOW1l3FaOJM1QJ6LukDIXJWFXwjdOKRsTg9iE33T0SB2baN
         N4fyYppodXWMasy7gOEIzT3MMRvqFJDbyBIKikcedrZKhucIm3xoVxEOOcY3VhpIyNOE
         M4zag14kFEDf0eyoW+EYlYufU+DxrTKObPFyrnpd7UlcU+0UZid4BBoUZ3r/q0nk1Aoo
         Z1cQ==
X-Gm-Message-State: APjAAAXqYu//8FM45b5JkXLON2mQxYioJRE+W4jdcNwtUxGMgXnablqK
	54Rp0HjkeDe/vXfMSG7VvrAfWH3MlvuGh51KEoI=
X-Google-Smtp-Source: APXvYqw498Icl14jRiBkwlADDXenfHTPtE0s9hLvZO1diJiBgjG12GHUUUc/aR3ZyCJaFgHxH5+1DSeq2xvT9WUbiHw=
X-Received: by 2002:a02:ab83:: with SMTP id t3mr4830212jan.133.1562335828673;
 Fri, 05 Jul 2019 07:10:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190705124318.1075-1-philmd@redhat.com>
In-Reply-To: <20190705124318.1075-1-philmd@redhat.com>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Fri, 5 Jul 2019 16:10:27 +0200
Message-ID: <CABoDooNn3HzrgDd3sreGDogFE=_L26=si-ddkeZ6paeoMF+v6w@mail.gmail.com>
Subject: Re: [PATCH] target/arm/vfp_helper: Call set_fpscr_to_host before
 updating to FPSCR
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: PaJ/IfqmfUdu

On Fri, Jul 5, 2019 at 2:43 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> In commit e9d652824b0 we extracted the vfp_set_fpscr_to_host()
> function but failed at calling it in the correct place, we call
> it after xregs[ARM_VFP_FPSCR] is modified.
>
> Fix by calling this function before we update FPSCR.
>
> Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Tested-by: Laurent Desnogues <laurent.desnogues@gmail.com>

Thanks,

Laurent

> ---
>  target/arm/vfp_helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
> index 46041e3294..9710ef1c3e 100644
> --- a/target/arm/vfp_helper.c
> +++ b/target/arm/vfp_helper.c
> @@ -197,6 +197,8 @@ void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t=
 val)
>          val &=3D 0xf7c0009f;
>      }
>
> +    vfp_set_fpscr_to_host(env, val);
> +
>      /*
>       * We don't implement trapped exception handling, so the
>       * trap enable bits, IDE|IXE|UFE|OFE|DZE|IOE are all RAZ/WI (not RES=
0!)
> @@ -217,8 +219,6 @@ void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t=
 val)
>      env->vfp.qc[1] =3D 0;
>      env->vfp.qc[2] =3D 0;
>      env->vfp.qc[3] =3D 0;
> -
> -    vfp_set_fpscr_to_host(env, val);
>  }
>
>  void vfp_set_fpscr(CPUARMState *env, uint32_t val)
> --
> 2.20.1
>
