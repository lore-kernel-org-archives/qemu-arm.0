Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6032798lfp;
        Tue, 11 Feb 2020 23:14:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqwGD00bL0ZAphnOi4q02ahyiBocW5BAoAXmzwNN+r0lB5KY5+F+EHXZU3AW+QJMXafat+Ei
X-Received: by 2002:ae9:e112:: with SMTP id g18mr9870249qkm.190.1581491675961;
        Tue, 11 Feb 2020 23:14:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581491675; cv=none;
        d=google.com; s=arc-20160816;
        b=a2C+M9cLl74obX/NTNnImhQrDqODu4sa5pfTcpbw4YtTE4YXhaLdnn9IXCSRkt9O/q
         t6S0Ti27q3IM9Q//MrNN75NxAf+p6FtJed9+OmvRDgwK1vAsrZ3ipvkr6bPVXy8QDGdR
         FMiiOF46j0d4WSlxbodW4oWMXjH25V9G0VegxkKzRXQH+/uLAlE91vYedaI5olMIG5S1
         GU8CwRdgx5M+yfyOgtmBwv9cN7RV2nD6WMp4595uIMVJwKK1fy1NxnBhY2vabqXHpMOG
         ckLrtDuVRAXcr97wPk0JXBwqq3SlojFUlOg76JUlP+Ywrs6aGqFj7fg/OoQNf/Ohuwhr
         hZIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=aT5UiNf8gz7EGwt9+XmRFIld/RnBLY/7qtRI4rhcrME=;
        b=Fak09c8Pd00Puz3ppOnd5YUj1s1VxoXzVs/dN7FxK1VivznMlenva5E7AxxWwoHo84
         YdRHZCLXplL1YjaGG2fqqXCG+AFZz+c3txIb/aIy/XxkymXsiuknq4S+ucVvb4kbrfWj
         g4JDPV6vNnzqcZjRDNF2a2+0ixq89Dg7CEuHnbzJEoTVa77w2voTHlNleKlOSYyNUo65
         ZOa3UUpTWJhTaqvDe9PKpqTKo9zswd5DYLRXt/L5dLekFF0C4jt+3bfVQEzj+wRB3ADO
         U9Lbvm1hgjRnETwxzMrH7IvUdR3P+K5Hdp3eIuhVIgsRy4KtSJ5Nxj1xK+K+bdP0thvD
         QH6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gYJkZ9Q3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8si3305476qkg.97.2020.02.11.23.14.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 23:14:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gYJkZ9Q3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1mEF-0003xU-BA
	for alex.bennee@linaro.org; Wed, 12 Feb 2020 02:14:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53601)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j1mE5-0003vA-Li
 for qemu-arm@nongnu.org; Wed, 12 Feb 2020 02:14:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j1mE4-0004Oo-Fz
 for qemu-arm@nongnu.org; Wed, 12 Feb 2020 02:14:25 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43864
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j1mE4-0004O9-Cs
 for qemu-arm@nongnu.org; Wed, 12 Feb 2020 02:14:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581491663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aT5UiNf8gz7EGwt9+XmRFIld/RnBLY/7qtRI4rhcrME=;
 b=gYJkZ9Q350WTzZyQLwpvHvD9kG9j9HawRmqpvxV9BgSh+MNLq5NPukppnUe6zaggJEVdp2
 85fHVLvx7XRR4IXmaNDbRrwyog66FelDFDMqRzZjHYkIHplpwuF4LHo/s683ElKJAZFMrG
 nW+XHXCGGkVkJozV3aAM6wFPki+6XVk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-IAykVFAqM8yw-pp2Ve-Rmg-1; Wed, 12 Feb 2020 02:14:19 -0500
Received: by mail-wm1-f72.google.com with SMTP id 7so341324wmf.9
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2020 23:14:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u3tnGTnKXIZFszcgkY4p1KSu60g0NmpIXqQvcc6mDgw=;
 b=q7lZugnW/F4d7wZUIsLX7dZN6FDNjXcTJwzpslXnEbMBr3dLwGuXRjF1k+U55NhPPI
 0G1p/gv8p8tdiNFgPbBJ0yYLpIXCs3l9vZN41ksJsCir40TLbwhBawGMP6G4cU4jIzco
 snB1uyb9I8TiS4ipy280F3GzDZi66ZLq0O2jgEHSVBViH+upb3wJgo5+o+VUX602y2vo
 U+bCLjUCOtNW5KaQCKRkxfncoz6HnYY9oIDlEVxHQdn5lfTxrM4nZEYxAE1jqvw0mvQP
 pBrsHO3Z6tbclXzLB3zQWdBXzPKYNR9CnZAPgI9aydpUlczMvvN/NG0aqWhEpnVQt9A3
 j4pg==
X-Gm-Message-State: APjAAAU9RbEU5Pp5xpeEMoE+IsJ77s/S2QFnORSZiFedHT61iqODOJca
 KtoGXDuUIQBZ11B/d8MUToJCwZ8ort3TnRzpOZwm2EdbBZZGwmGFHyWLyvLuGyW5hiFxpRO1G78
 Irj2NiP4uxnqM
X-Received: by 2002:adf:dcc2:: with SMTP id x2mr13317784wrm.24.1581491658793; 
 Tue, 11 Feb 2020 23:14:18 -0800 (PST)
X-Received: by 2002:adf:dcc2:: with SMTP id x2mr13317746wrm.24.1581491658438; 
 Tue, 11 Feb 2020 23:14:18 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id f8sm8471536wru.12.2020.02.11.23.14.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 23:14:17 -0800 (PST)
Subject: Re: [PATCH 13/13] target/arm: Correct handling of PMCR_EL0.LC bit
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200211173726.22541-1-peter.maydell@linaro.org>
 <20200211173726.22541-14-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a9e33251-9f9d-dc6a-efd9-6f4fcba1a124@redhat.com>
Date: Wed, 12 Feb 2020 08:14:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200211173726.22541-14-peter.maydell@linaro.org>
Content-Language: en-US
X-MC-Unique: IAykVFAqM8yw-pp2Ve-Rmg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vJZ5SErkOrHi

On 2/11/20 6:37 PM, Peter Maydell wrote:
> The LC bit in the PMCR_EL0 register is supposed to be:
>   * read/write
>   * RES1 on an AArch64-only implementation
>   * an architecturally UNKNOWN value on reset
> (and use of LC=3D=3D0 by software is deprecated).
>=20
> We were implementing it incorrectly as read-only always zero,
> though we do have all the code needed to test it and behave
> accordingly.
>=20
> Instead make it a read-write bit which resets to 1 always, which
> satisfies all the architectural requirements above.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
>=20
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index c6758bfbeb5..1d8eafceda8 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1023,6 +1023,11 @@ static const ARMCPRegInfo v6_cp_reginfo[] =3D {
>   #define PMCRC   0x4
>   #define PMCRP   0x2
>   #define PMCRE   0x1
> +/*
> + * Mask of PMCR bits writeable by guest (not including WO bits like C, P=
,
> + * which can be written as 1 to trigger behaviour but which stay RAZ).
> + */
> +#define PMCR_WRITEABLE_MASK (PMCRLC | PMCRDP | PMCRX | PMCRD | PMCRE)
>  =20
>   #define PMXEVTYPER_P          0x80000000
>   #define PMXEVTYPER_U          0x40000000
> @@ -1577,9 +1582,8 @@ static void pmcr_write(CPUARMState *env, const ARMC=
PRegInfo *ri,
>           }
>       }
>  =20
> -    /* only the DP, X, D and E bits are writable */
> -    env->cp15.c9_pmcr &=3D ~0x39;
> -    env->cp15.c9_pmcr |=3D (value & 0x39);

Ah this was missing PMCRLC indeed.

I was tempted to use 'Fixes: 74594c9d813' but the PMCRLC is "Reserved,=20
UNK/SBZP" in the ARMv7 reference manual.
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> +    env->cp15.c9_pmcr &=3D ~PMCR_WRITEABLE_MASK;
> +    env->cp15.c9_pmcr |=3D (value & PMCR_WRITEABLE_MASK);
>  =20
>       pmu_op_finish(env);
>   }
> @@ -5886,7 +5890,8 @@ static void define_pmu_regs(ARMCPU *cpu)
>           .access =3D PL0_RW, .accessfn =3D pmreg_access,
>           .type =3D ARM_CP_IO,
>           .fieldoffset =3D offsetof(CPUARMState, cp15.c9_pmcr),
> -        .resetvalue =3D (cpu->midr & 0xff000000) | (pmcrn << PMCRN_SHIFT=
),
> +        .resetvalue =3D (cpu->midr & 0xff000000) | (pmcrn << PMCRN_SHIFT=
) |
> +                      PMCRLC,
>           .writefn =3D pmcr_write, .raw_writefn =3D raw_write,
>       };
>       define_one_arm_cp_reg(cpu, &pmcr);
>=20

