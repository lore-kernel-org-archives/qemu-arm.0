Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id l9-20020a1709063d2900b00730af3346d6sm2298442ejf.212.2022.08.10.06.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 06:11:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 1D9FF1FFB7;
	Wed, 10 Aug 2022 14:11:56 +0100 (BST)
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-18-richard.henderson@linaro.org>
User-agent: mu4e 1.8.8; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 17/62] target/arm: Remove is_subpage argument to
 pmsav8_mpu_lookup
Date: Wed, 10 Aug 2022 14:11:06 +0100
In-reply-to: <20220703082419.770989-18-richard.henderson@linaro.org>
Message-ID: <871qtomeeb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: hzt8hi6IVZoQ


Richard Henderson <richard.henderson@linaro.org> writes:

> This can be made redundant with result->page_size, by moving
> the basic set of page_size from get_phys_addr_pmsav8.  We still
> need to overwrite page_size when v8m_security_lookup signals
> a subpage.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
<snip>
>=20=20
>      ret =3D pmsav8_mpu_lookup(env, address, access_type, mmu_idx,
> -                            result, &mpu_is_subpage, fi, NULL);
> -    result->page_size =3D
> -        sattrs.subpage || mpu_is_subpage ? 1 : TARGET_PAGE_SIZE;
> +                            result, fi, NULL);
> +    if (sattrs.subpage) {
> +        result->page_size =3D 1;
> +    }

We should probably document the meaning of page_size =3D=3D 1 in the
comments for the definition of GetPhysAddrResult.

>      return ret;
>  }


--=20
Alex Benn=C3=A9e
