Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id e15-20020a5d4e8f000000b0030629536e64sm16776452wru.30.2023.05.10.02.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 02:09:28 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 075EC1FFBB;
	Wed, 10 May 2023 10:09:28 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-7-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v5 06/30] tcg/mips: Introduce prepare_host_addr
Date: Wed, 10 May 2023 10:09:19 +0100
In-reply-to: <20230506072235.597467-7-richard.henderson@linaro.org>
Message-ID: <87a5yca6yg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: AyvXA67dXW7g


Richard Henderson <richard.henderson@linaro.org> writes:

> Merge tcg_out_tlb_load, add_qemu_ldst_label, tcg_out_test_alignment,
> and some code that lived in both tcg_out_qemu_ld and tcg_out_qemu_st
> into one function that returns HostAddress and TCGLabelQemuLdst structure=
s.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
