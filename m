Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp1322859lfe;
        Tue, 17 Mar 2020 02:56:32 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vukjnTkUUpGssbZqtR/uO1/67OJVPxLicAs5nRm8H4dGn6V7UE/u8OD+ydcZnGWTubR5Di7
X-Received: by 2002:a5b:a8d:: with SMTP id h13mr6049243ybq.132.1584438992476;
        Tue, 17 Mar 2020 02:56:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584438992; cv=none;
        d=google.com; s=arc-20160816;
        b=vlj4kMcROOb3M8yUr4KvpmzhKWxGNCoOwWswYKTzO8om1weYqoe6UPrGaAbr7WWGId
         dt19Vmcs0ojv9+RsTc0OgeDQRhJ3A3DaPEqTx0RtjA6U/UtxbKRX/DGkJH6pezsAyE8q
         Av1OfUReUEzjpMag+crbEnNjIF+ROQPrQ3TDwOaOp8oJ+quOZnet5mNDD+AAeKbFIcoZ
         GD9p5jy+d7TIX//Bt5u/TlenQMzWzH6rZicCr9heDBnxADN+wqvd+bs8OxePI9Zw4f6b
         ONTVFy9+bUNKmxFIbHI+G9IUcSAT/ZTw/Lzc6l67rBCuSz5azpkP8A4ePB+JygxFLah4
         b6oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=LKb9voVP0DcRntiJe2qk76Bv9LmVh1K46wznR3c2LOY=;
        b=t9fRjBJKyjEhTly9pto3mExsziHqVkLmKDyL2UlRr6rAibkZE/QLkHNPV3iHbShQ6L
         sNlGNsb+h1uOjQUu1NSvNcWZsv7WvfuGtrSr4cY4PtJPLarrP/t8GKak4+Fw01SYBq5I
         +L83cYvkFTrOuFmbMFyx7S73yQyvKKfWeVyqk0z2jI8G8XXTEg3c6p4IOpV2zpTcEcom
         PAUo21Cf6Ml0PitbJAQNKeieMpQ6w2zDXmT8vJweiMVXRO6FYj98RHqjjqRRBtaL/KTx
         6M3F+7QHoGCdd/ADuBz5S2XNpj7i5cHnPwBaJSFg+Oai5P5lMIhFfhYQ3UAzL1XzRbz5
         D/gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KAEsT2rQ;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com. [63.128.21.74])
        by mx.google.com with ESMTPS id e8si2305066ybn.469.2020.03.17.02.56.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Mar 2020 02:56:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) client-ip=63.128.21.74;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KAEsT2rQ;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584438992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LKb9voVP0DcRntiJe2qk76Bv9LmVh1K46wznR3c2LOY=;
	b=KAEsT2rQDryzFqQohilwOWHIGve6eeqPpIzpG5MQ043PcrghcP3KwXgMuwHKWPEDVe0tTf
	WXeX9nowvBxd7SQh7WR+AuBSv8Xd0SHCdmgQ26N0Mf2H/9I3522qdWTeWYrNg2QbdReoEd
	5s36/iUimN2XanU6nEj/RLOC8sz3RSM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-ua-N9iqAMl-wlO7wM13qOw-1; Tue, 17 Mar 2020 05:56:28 -0400
X-MC-Unique: ua-N9iqAMl-wlO7wM13qOw-1
Received: by mail-wr1-f72.google.com with SMTP id u12so7990527wrw.10
        for <alex.bennee@linaro.org>; Tue, 17 Mar 2020 02:56:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ULRZbuCwsnyJRRqZMeMEz/jzykrdAzXvpLbJ6qxv3wY=;
        b=bR/mY9xUUzLNqPCAebcTVEDBlLGnsYJcM2U/+xMb8VJXuQ+/NQi+Bq6q8xAkk+9WyU
         rTwN2tj3OPDn8t5QYfyMLBrP9Anp2QyD7vz+PBPFUoa/0QCZZs0y6W+QGHOpe3l8Ya9E
         3pzeClHu5xynYhOdDAYE7sadurm0TcT7RkdG9XBA/eHqdtyYw3E2NxYGM0qJ31CncZQ5
         viwSb6VBFYOvoz8fcBmV/24DVrcbLFFl7Coklfxw/DiMBeY3QyJnrAQrx2gNjTJ3BoAa
         Mk7aK8BxTgYh5JMRda28Zg85cy3CeHqPbt6yr78GUbU0hvN3eOK6ujaxiLGccFcY/8za
         zAXQ==
X-Gm-Message-State: ANhLgQ04F7xMiEuElGg41IZlo9+mfM/vfa7IeGP7LnYe/dPhrFbkrQPy
	hKNoCgFZY4iZbdSSIItzxaTQhmYIuwJZS1PoM3TBO37rktrunWOyPzNYi1mIXWu+eJ0ricYydQv
	+hCyDwLMDmo7Bf84c
X-Received: by 2002:a1c:23d5:: with SMTP id j204mr4651688wmj.59.1584438987450;
        Tue, 17 Mar 2020 02:56:27 -0700 (PDT)
X-Received: by 2002:a1c:23d5:: with SMTP id j204mr4651665wmj.59.1584438987221;
        Tue, 17 Mar 2020 02:56:27 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.34] (96.red-83-59-163.dynamicip.rima-tde.net. [83.59.163.96])
        by smtp.gmail.com with ESMTPSA id w19sm3242788wmi.0.2020.03.17.02.56.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2020 02:56:26 -0700 (PDT)
Subject: Re: [PATCH v1 19/28] target/arm: don't bother with id_aa64pfr0_read
 for USER_ONLY
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200316172155.971-1-alex.bennee@linaro.org>
 <20200316172155.971-20-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c34eed7d-ee17-b06a-68e4-fecceab4b216@redhat.com>
Date: Tue, 17 Mar 2020 10:56:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200316172155.971-20-alex.bennee@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: H8gsNFhlDS26

On 3/16/20 6:21 PM, Alex Benn=C3=A9e wrote:
> For system emulation we need to check the state of the GIC before we
> report the value. However this isn't relevant to exporting of the
> value to linux-user and indeed breaks the exported value as set by
> modify_arm_cp_regs.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>=20
> ---
> v2
>    - extend the ifdef and make type CONST with no accessfn
> ---
>   target/arm/helper.c | 20 +++++++++++++++-----
>   1 file changed, 15 insertions(+), 5 deletions(-)
>=20
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 7e560ea7db6..d2ec2c53510 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6697,6 +6697,7 @@ static uint64_t id_pfr1_read(CPUARMState *env, cons=
t ARMCPRegInfo *ri)
>       return pfr1;
>   }
>  =20
> +#ifndef CONFIG_USER_ONLY
>   static uint64_t id_aa64pfr0_read(CPUARMState *env, const ARMCPRegInfo *=
ri)
>   {
>       ARMCPU *cpu =3D env_archcpu(env);
> @@ -6707,6 +6708,7 @@ static uint64_t id_aa64pfr0_read(CPUARMState *env, =
const ARMCPRegInfo *ri)
>       }
>       return pfr0;
>   }
> +#endif
>  =20
>   /* Shared logic between LORID and the rest of the LOR* registers.
>    * Secure state has already been delt with.
> @@ -7280,16 +7282,24 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>            * define new registers here.
>            */
>           ARMCPRegInfo v8_idregs[] =3D {
> -            /* ID_AA64PFR0_EL1 is not a plain ARM_CP_CONST because we do=
n't
> -             * know the right value for the GIC field until after we
> -             * define these regs.
> +            /*
> +             * ID_AA64PFR0_EL1 is not a plain ARM_CP_CONST in system
> +             * emulation because we don't know the right value for the
> +             * GIC field until after we define these regs.
>                */
>               { .name =3D "ID_AA64PFR0_EL1", .state =3D ARM_CP_STATE_AA64=
,
>                 .opc0 =3D 3, .opc1 =3D 0, .crn =3D 0, .crm =3D 4, .opc2 =
=3D 0,
> -              .access =3D PL1_R, .type =3D ARM_CP_NO_RAW,
> +              .access =3D PL1_R,
> +#ifdef CONFIG_USER_ONLY
> +              .type =3D ARM_CP_CONST,
> +              .resetvalue =3D cpu->isar.id_aa64pfr0
> +#else
> +              .type =3D ARM_CP_NO_RAW,
>                 .accessfn =3D access_aa64_tid3,
>                 .readfn =3D id_aa64pfr0_read,
> -              .writefn =3D arm_cp_write_ignore },
> +              .writefn =3D arm_cp_write_ignore

I guess this is the implementation of what Peter described here:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg689388.html

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> +#endif
> +            },
>               { .name =3D "ID_AA64PFR1_EL1", .state =3D ARM_CP_STATE_AA64=
,
>                 .opc0 =3D 3, .opc1 =3D 0, .crn =3D 0, .crm =3D 4, .opc2 =
=3D 1,
>                 .access =3D PL1_R, .type =3D ARM_CP_CONST,
>=20
