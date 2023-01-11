Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id q20-20020a7bce94000000b003c6c3fb3cf6sm17137340wmj.18.2023.01.10.23.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 23:59:50 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 0BD9E1FFB7;
	Wed, 11 Jan 2023 07:59:49 +0000 (GMT)
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
 <20230108023719.2466341-3-richard.henderson@linaro.org>
User-agent: mu4e 1.9.12; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 02/36] tcg: Handle dh_typecode_i128 with
 TCG_CALL_{RET, ARG}_NORMAL
Date: Wed, 11 Jan 2023 07:59:41 +0000
In-reply-to: <20230108023719.2466341-3-richard.henderson@linaro.org>
Message-ID: <874jsxmrgr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: PfFG5xWwC7mr


Richard Henderson <richard.henderson@linaro.org> writes:

> Many hosts pass and return 128-bit quantities like sequential
> 64-bit quantities.  Treat this just like we currently break
> down 64-bit quantities for a 32-bit host.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
