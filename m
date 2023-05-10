Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id c17-20020adffb11000000b003075428aad5sm17181896wrr.29.2023.05.10.06.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 06:14:50 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 359701FFBB;
	Wed, 10 May 2023 14:14:50 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-14-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v5 13/30] tcg/aarch64: Convert
 tcg_out_qemu_{ld,st}_slow_path
Date: Wed, 10 May 2023 14:14:42 +0100
In-reply-to: <20230506072235.597467-14-richard.henderson@linaro.org>
Message-ID: <877ctg8h11.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 85ZLI6hzxo/u


Richard Henderson <richard.henderson@linaro.org> writes:

> Use tcg_out_ld_helper_args, tcg_out_ld_helper_ret,
> and tcg_out_st_helper_args.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
