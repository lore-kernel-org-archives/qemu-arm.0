Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id w7sm21119952wru.74.2021.04.08.04.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 04:08:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B23301FF7E;
	Thu,  8 Apr 2021 12:08:15 +0100 (BST)
References: <20210406174031.64299-1-richard.henderson@linaro.org>
 <20210406174031.64299-8-richard.henderson@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v4 07/12] target/arm: Replace MTEDESC ESIZE+TSIZE with
 SIZEM1
Date: Thu, 08 Apr 2021 12:08:10 +0100
In-reply-to: <20210406174031.64299-8-richard.henderson@linaro.org>
Message-ID: <87h7kht4o0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: NdGvQJLbc5Cl


Richard Henderson <richard.henderson@linaro.org> writes:

> After recent changes, mte_checkN does not use ESIZE,
> and mte_check1 never used TSIZE.  We can combine the
> two into a single field: SIZEM1.
>
> Choose to pass size - 1 because size =3D=3D 0 is never used,
> our immediate need in mte_probe_int is for the address
> of the last byte (ptr + size - 1), and since almost all
> operations are powers of 2, this makes the immediate
> constant one bit smaller.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
