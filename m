Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2202361njb;
        Mon, 7 Oct 2024 14:25:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVTFfsOysESmBOzFTStKkH5VtNhoof+t3bAvjCSw3BCIv36lNPkr9PzVwTTARlcTvZUJrKlUZNtA6h30A==@linaro.org
X-Google-Smtp-Source: AGHT+IEO7AgBAULHlsubCv4alePzbU0V6pqDSnpMkn5OF0Q7FZ+HqagvfVFjlQJ1BniM0fzd3O0D
X-Received: by 2002:a17:907:3e20:b0:a8a:8915:6bf6 with SMTP id a640c23a62f3a-a991c0308famr1333898766b.52.1728336344999;
        Mon, 07 Oct 2024 14:25:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728336344; cv=none;
        d=google.com; s=arc-20240605;
        b=cfcN3P4zyeuPtA3BdlGIBniiW3OOEm9HPKbwuEEGPgtqL1+TbDnOKv2oPlMHEOxUDA
         IVbz7pTVm3nnDIEe98fGKA5b0/wCtv6y5HV5+bG1qRCetteGLyOgE+diPNiAzncTIjzb
         zqxfJi5ZMEqACWuMWib4FSfmnf/gjcr+BlLRME8mYQ/wbvDlC1a0UwuvV03lOyTAucc8
         7S2qXrroogIwN2GCtenixhp1eWojaR9ZG6QYDQ29MxL0x27cZ3IQsJJWA2oYQqCDJ9qt
         RcFxsYkg16A5n7vALI8ePvZ0cdv5UKEr2UE5XltdcAizwud4RmtoCXJsWLngWP++qTqg
         QCjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=ui-outboundreport:content-transfer-encoding:in-reply-to:autocrypt
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=/6kYe65SKMcicOCKh5ADZUEKSAFjWpZ0mMFYAo+g85U=;
        fh=3fZ7Wohp6BUOfptJMglDqKETKOsQS3q9o/uj1RhoDNQ=;
        b=LxmEz3KPCpgEycZtdMCLQ10MD4ZjZHl4n8THtqxF4YDmTiz3DLbLZmP9VVc+V7LMKG
         ZYeNhAL5KfV/6yvTkzhbikDVCowUQQFibbh5hCkTq0fZNUVYZSNo80unI66yJm+YVaRy
         P0cpCna1cRctAJKa/4PhRQih4d4QiCC+9+WFiZnG32v3p32KgflhZghTwtT7jkEEVnfc
         HvNOM8TyS/Bhaq+L6eb5J1t1MFULvRJGi5eEhW0o3NWrp2lqdvDsb7eWgZGtgx345pS5
         US1IYdja4S2sFvWy2Cl/St3Mr3qnAn5ntoKegsInyHY2616UB+6SOu5lGwm891LL38Ut
         fOdg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=AF6AdqJP;
       spf=pass (google.com: domain of deller@gmx.de designates 212.227.17.21 as permitted sender) smtp.mailfrom=deller@gmx.de;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=gmx.de
Return-Path: <deller@gmx.de>
Received: from mout.gmx.net (mout.gmx.net. [212.227.17.21])
        by mx.google.com with ESMTPS id a640c23a62f3a-a994d1c108csi293236566b.248.2024.10.07.14.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 14:25:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of deller@gmx.de designates 212.227.17.21 as permitted sender) client-ip=212.227.17.21;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=AF6AdqJP;
       spf=pass (google.com: domain of deller@gmx.de designates 212.227.17.21 as permitted sender) smtp.mailfrom=deller@gmx.de;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1728336344; x=1728941144; i=deller@gmx.de;
	bh=/6kYe65SKMcicOCKh5ADZUEKSAFjWpZ0mMFYAo+g85U=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=AF6AdqJPHDRNpcYfqwBI5SzJ86fwhChT4iBJ+UvAugg9/8Y2VVy7cb3Pqyz2em8g
	 fS1lRWBwWsEuqz0FJ2CJd5QC4lTzaDzw6u5ztRI4vOEVnjad160jZkhq+a7CEpHA2
	 J7ZC0+Uw0tkDdVRn35Tm7FbtFzpGyMRxE53MfoDbweR862vB0G2CDFcInNWMhJ3q7
	 7Cqa85ujtnOx1TIPCwGZeBjVXtZjwE/TGC3lrb1fGbB7klwAACGFutuv/o/NSOvpH
	 dW1yg6Lpd696YfDhNJLVx0zdVfQiwck/spJeraBzwfMtvLWiYRTwo6qsOtL7nkrys
	 CjTitFWR+Hf2Kkbt3g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M72sJ-1t4F9j0mYZ-003VDb; Mon, 07
 Oct 2024 23:25:44 +0200
Message-ID: <4d7e4ea3-be70-44ea-9958-5f1b3aaff5fd@gmx.de>
Date: Mon, 7 Oct 2024 23:25:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/21] target/arm: Move device detection earlier in
 get_phys_addr_lpae
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005200600.493604-1-richard.henderson@linaro.org>
 <20241005200600.493604-20-richard.henderson@linaro.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 xsFNBF3Ia3MBEAD3nmWzMgQByYAWnb9cNqspnkb2GLVKzhoH2QD4eRpyDLA/3smlClbeKkWT
 HLnjgkbPFDmcmCz5V0Wv1mKYRClAHPCIBIJgyICqqUZo2qGmKstUx3pFAiztlXBANpRECgwJ
 r+8w6mkccOM9GhoPU0vMaD/UVJcJQzvrxVHO8EHS36aUkjKd6cOpdVbCt3qx8cEhCmaFEO6u
 CL+k5AZQoABbFQEBocZE1/lSYzaHkcHrjn4cQjc3CffXnUVYwlo8EYOtAHgMDC39s9a7S90L
 69l6G73lYBD/Br5lnDPlG6dKfGFZZpQ1h8/x+Qz366Ojfq9MuuRJg7ZQpe6foiOtqwKym/zV
 dVvSdOOc5sHSpfwu5+BVAAyBd6hw4NddlAQUjHSRs3zJ9OfrEx2d3mIfXZ7+pMhZ7qX0Axlq
 Lq+B5cfLpzkPAgKn11tfXFxP+hcPHIts0bnDz4EEp+HraW+oRCH2m57Y9zhcJTOJaLw4YpTY
 GRUlF076vZ2Hz/xMEvIJddRGId7UXZgH9a32NDf+BUjWEZvFt1wFSW1r7zb7oGCwZMy2LI/G
 aHQv/N0NeFMd28z+deyxd0k1CGefHJuJcOJDVtcE1rGQ43aDhWSpXvXKDj42vFD2We6uIo9D
 1VNre2+uAxFzqqf026H6cH8hin9Vnx7p3uq3Dka/Y/qmRFnKVQARAQABzRxIZWxnZSBEZWxs
 ZXIgPGRlbGxlckBnbXguZGU+wsGRBBMBCAA7AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheA
 FiEERUSCKCzZENvvPSX4Pl89BKeiRgMFAl3J1zsCGQEACgkQPl89BKeiRgNK7xAAg6kJTPje
 uBm9PJTUxXaoaLJFXbYdSPfXhqX/BI9Xi2VzhwC2nSmizdFbeobQBTtRIz5LPhjk95t11q0s
 uP5htzNISPpwxiYZGKrNnXfcPlziI2bUtlz4ke34cLK6MIl1kbS0/kJBxhiXyvyTWk2JmkMi
 REjR84lCMAoJd1OM9XGFOg94BT5aLlEKFcld9qj7B4UFpma8RbRUpUWdo0omAEgrnhaKJwV8
 qt0ULaF/kyP5qbI8iA2PAvIjq73dA4LNKdMFPG7Rw8yITQ1Vi0DlDgDT2RLvKxEQC0o3C6O4
 iQq7qamsThLK0JSDRdLDnq6Phv+Yahd7sDMYuk3gIdoyczRkXzncWAYq7XTWl7nZYBVXG1D8
 gkdclsnHzEKpTQIzn/rGyZshsjL4pxVUIpw/vdfx8oNRLKj7iduf11g2kFP71e9v2PP94ik3
 Xi9oszP+fP770J0B8QM8w745BrcQm41SsILjArK+5mMHrYhM4ZFN7aipK3UXDNs3vjN+t0zi
 qErzlrxXtsX4J6nqjs/mF9frVkpv7OTAzj7pjFHv0Bu8pRm4AyW6Y5/H6jOup6nkJdP/AFDu
 5ImdlA0jhr3iLk9s9WnjBUHyMYu+HD7qR3yhX6uWxg2oB2FWVMRLXbPEt2hRGq09rVQS7DBy
 dbZgPwou7pD8MTfQhGmDJFKm2jvOwU0EXchrcwEQAOsDQjdtPeaRt8EP2pc8tG+g9eiiX9Sh
 rX87SLSeKF6uHpEJ3VbhafIU6A7hy7RcIJnQz0hEUdXjH774B8YD3JKnAtfAyuIU2/rOGa/v
 UN4BY6U6TVIOv9piVQByBthGQh4YHhePSKtPzK9Pv/6rd8H3IWnJK/dXiUDQllkedrENXrZp
 eLUjhyp94ooo9XqRl44YqlsrSUh+BzW7wqwfmu26UjmAzIZYVCPCq5IjD96QrhLf6naY6En3
 ++tqCAWPkqKvWfRdXPOz4GK08uhcBp3jZHTVkcbo5qahVpv8Y8mzOvSIAxnIjb+cklVxjyY9
 dVlrhfKiK5L+zA2fWUreVBqLs1SjfHm5OGuQ2qqzVcMYJGH/uisJn22VXB1c48yYyGv2HUN5
 lC1JHQUV9734I5cczA2Gfo27nTHy3zANj4hy+s/q1adzvn7hMokU7OehwKrNXafFfwWVK3OG
 1dSjWtgIv5KJi1XZk5TV6JlPZSqj4D8pUwIx3KSp0cD7xTEZATRfc47Yc+cyKcXG034tNEAc
 xZNTR1kMi9njdxc1wzM9T6pspTtA0vuD3ee94Dg+nDrH1As24uwfFLguiILPzpl0kLaPYYgB
 wumlL2nGcB6RVRRFMiAS5uOTEk+sJ/tRiQwO3K8vmaECaNJRfJC7weH+jww1Dzo0f1TP6rUa
 fTBRABEBAAHCwXYEGAEIACAWIQRFRIIoLNkQ2+89Jfg+Xz0Ep6JGAwUCXchrcwIbDAAKCRA+
 Xz0Ep6JGAxtdEAC54NQMBwjUNqBNCMsh6WrwQwbg9tkJw718QHPw43gKFSxFIYzdBzD/YMPH
 l+2fFiefvmI4uNDjlyCITGSM+T6b8cA7YAKvZhzJyJSS7pRzsIKGjhk7zADL1+PJei9p9idy
 RbmFKo0dAL+ac0t/EZULHGPuIiavWLgwYLVoUEBwz86ZtEtVmDmEsj8ryWw75ZIarNDhV74s
 BdM2ffUJk3+vWe25BPcJiaZkTuFt+xt2CdbvpZv3IPrEkp9GAKof2hHdFCRKMtgxBo8Kao6p
 Ws/Vv68FusAi94ySuZT3fp1xGWWf5+1jX4ylC//w0Rj85QihTpA2MylORUNFvH0MRJx4mlFk
 XN6G+5jIIJhG46LUucQ28+VyEDNcGL3tarnkw8ngEhAbnvMJ2RTx8vGh7PssKaGzAUmNNZiG
 MB4mPKqvDZ02j1wp7vthQcOEg08z1+XHXb8ZZKST7yTVa5P89JymGE8CBGdQaAXnqYK3/yWf
 FwRDcGV6nxanxZGKEkSHHOm8jHwvQWvPP73pvuPBEPtKGLzbgd7OOcGZWtq2hNC6cRtsRdDx
 4TAGMCz4j238m+2mdbdhRh3iBnWT5yPFfnv/2IjFAk+sdix1Mrr+LIDF++kiekeq0yUpDdc4
 ExBy2xf6dd+tuFFBp3/VDN4U0UfG4QJ2fg19zE5Z8dS4jGIbLg==
In-Reply-To: <20241005200600.493604-20-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+yEiB+QnkLPPdYILVQkbkz/xPBXtJb9qoSPoJ/HNyxQHvgriRUf
 l0UVPtkFXjaX+L30ZIcU2ogak6EKyAdICNkL2lDqEZ9P9bvfJ475rd/e9xd77EJC1Nhce2c
 3XKLoUUpOSgSQk9ZK3+MbqQgq05Bar10EJLLUjpo2NxsQnFZdmKTwjjxJkvZMHpP7gjBj3K
 S9X5mPuGpQZyDliqkUz+w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ABOw0Kn3tKI=;C2jzHi0+cIFqu6CeJIsKYh6bOcm
 f7AcvA0pVOmiwpoBY4cLmY06ox5M1cbpovXU/KcaLOy0NHEZQof8/Qy+T0laZCTAUFQo4hxjp
 xKpxtvGkOe2B57vnRNRARPoAUtsEMlGUbiRMUcJnh/x24w6xCMg0cZ1Jzf9vu4S+Uxk6JZ7yi
 NJfkTn2PRsjGl8VsgRzCgu9D3b3i6zFaYmc8QTdZfJInJf4WpuZSrbHLKKf1a7+OcGKXS56AR
 Bl8Y++ZS3v7y+QBMhVFVV3mmKiWjmPSs+X6zc6N0e9Z5LFPGKV6awt3K+l8w2x07IwJV0i0Uz
 K0yyYI0fLcdOHbVce/WOfmc4RomOgNiu8GH+jGtpr6PLpQmLRmG3q6T7rDtnwsFbyCPfwP9p8
 QnqNH8rHRisAR67Ka73E4T3zyw2Av2lx5FVfXkLhabce/zL7XgVSOkALiG1awyIGKNwNIi2xE
 KiVtA/edLVFJ+P9G5SKGZ+dJ/dzVd7MjwMPc7jOd7RY+nyQ8alXDNGQVRc/nAhCuF3qbmLpdf
 +084cC253OIV7or+qNPojBmGvHTVQWwOLTlZH+C7raC3qKfH+tESp7CVQDd1XxrtjbGGNl8U9
 5BDFRbqXQcByO2+zdJVE/lFVkQX0OEl6dmAJgY+qDf4+r7AaiHFYTAM5hJr68qQBBUTsvprqn
 bKuHD1vlB9pHuMKl8yaVkZWTNaum6E75C53QxVOA4osT/FuJ67vfqilEsdGeVCQQ/iWuHkZFr
 HUG3IBxy+RXDkFxSqVjX4eGJgkRfKnj80OMwOqOj1TXCIwIv2EHHAszTMrSIvqDdxhbDupF64
 iEre8+dcE08Kdb/zqhEE9z6g==
X-TUID: b0lG9G9+vgGD

On 10/5/24 22:05, Richard Henderson wrote:
> Determine cache attributes, and thence Device vs Normal memory,

"thence" ?

Other than that I have no arm knowledge to review the patch below....

Helge

> earlier in the function.  We have an existing regime_is_stage2
> if block into which this can be slotted.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/ptw.c | 49 ++++++++++++++++++++++++------------------------
>   1 file changed, 25 insertions(+), 24 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 238b2c92a9..0a1a820362 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -2029,8 +2029,20 @@ static bool get_phys_addr_lpae(CPUARMState *env, =
S1Translate *ptw,
>               xn =3D extract64(attrs, 53, 2);
>               result->f.prot =3D get_S2prot(env, ap, xn, ptw->in_s1_is_e=
l0);
>           }
> +
> +        result->cacheattrs.is_s2_format =3D true;
> +        result->cacheattrs.attrs =3D extract32(attrs, 2, 4);
> +        /*
> +         * Security state does not really affect HCR_EL2.FWB;
> +         * we only need to filter FWB for aa32 or other FEAT.
> +         */
> +        device =3D S2_attrs_are_device(arm_hcr_el2_eff(env),
> +                                     result->cacheattrs.attrs);
>       } else {
>           int nse, ns =3D extract32(attrs, 5, 1);
> +        uint8_t attrindx;
> +        uint64_t mair;
> +
>           switch (out_space) {
>           case ARMSS_Root:
>               /*
> @@ -2102,6 +2114,19 @@ static bool get_phys_addr_lpae(CPUARMState *env, =
S1Translate *ptw,
>            */
>           result->f.prot =3D get_S1prot(env, mmu_idx, aarch64, ap, xn, p=
xn,
>                                       result->f.attrs.space, out_space);
> +
> +        /* Index into MAIR registers for cache attributes */
> +        attrindx =3D extract32(attrs, 2, 3);
> +        mair =3D env->cp15.mair_el[regime_el(env, mmu_idx)];
> +        assert(attrindx <=3D 7);
> +        result->cacheattrs.is_s2_format =3D false;
> +        result->cacheattrs.attrs =3D extract64(mair, attrindx * 8, 8);
> +
> +        /* When in aarch64 mode, and BTI is enabled, remember GP in the=
 TLB. */
> +        if (aarch64 && cpu_isar_feature(aa64_bti, cpu)) {
> +            result->f.extra.arm.guarded =3D extract64(attrs, 50, 1); /*=
 GP */
> +        }
> +        device =3D S1_attrs_are_device(result->cacheattrs.attrs);
>       }
>
>       if (!(result->f.prot & (1 << access_type))) {
> @@ -2131,30 +2156,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, =
S1Translate *ptw,
>       result->f.attrs.space =3D out_space;
>       result->f.attrs.secure =3D arm_space_is_secure(out_space);
>
> -    if (regime_is_stage2(mmu_idx)) {
> -        result->cacheattrs.is_s2_format =3D true;
> -        result->cacheattrs.attrs =3D extract32(attrs, 2, 4);
> -        /*
> -         * Security state does not really affect HCR_EL2.FWB;
> -         * we only need to filter FWB for aa32 or other FEAT.
> -         */
> -        device =3D S2_attrs_are_device(arm_hcr_el2_eff(env),
> -                                     result->cacheattrs.attrs);
> -    } else {
> -        /* Index into MAIR registers for cache attributes */
> -        uint8_t attrindx =3D extract32(attrs, 2, 3);
> -        uint64_t mair =3D env->cp15.mair_el[regime_el(env, mmu_idx)];
> -        assert(attrindx <=3D 7);
> -        result->cacheattrs.is_s2_format =3D false;
> -        result->cacheattrs.attrs =3D extract64(mair, attrindx * 8, 8);
> -
> -        /* When in aarch64 mode, and BTI is enabled, remember GP in the=
 TLB. */
> -        if (aarch64 && cpu_isar_feature(aa64_bti, cpu)) {
> -            result->f.extra.arm.guarded =3D extract64(attrs, 50, 1); /*=
 GP */
> -        }
> -        device =3D S1_attrs_are_device(result->cacheattrs.attrs);
> -    }
> -
>       /*
>        * Enable alignment checks on Device memory.
>        *
