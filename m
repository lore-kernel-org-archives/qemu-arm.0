Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id v23-20020a05600c4d9700b003db1ca20170sm2857931wmp.37.2023.01.25.13.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 13:51:29 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id EF2631FFB7;
	Wed, 25 Jan 2023 21:51:28 +0000 (GMT)
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
User-agent: mu4e 1.9.16; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 00/36] tcg: Support for Int128 with helpers
Date: Wed, 25 Jan 2023 21:50:55 +0000
In-reply-to: <20230108023719.2466341-1-richard.henderson@linaro.org>
Message-ID: <87y1pqp9jz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: FhdVSCMkLDpr


Richard Henderson <richard.henderson@linaro.org> writes:

> Changes for v4:
>   * About half of the v3 series has been merged,
>   * AArch64 host requires even argument register.
>   * target/{arm,ppc,s390x,i386} uses included here.

Have you got a branch or a new re-base? I tried applying but got messy
conflicts I couldn't cleanly resolve.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
