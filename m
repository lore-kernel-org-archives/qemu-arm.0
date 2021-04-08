Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id s8sm44886699wrn.97.2021.04.08.04.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 04:23:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5AB731FF7E;
	Thu,  8 Apr 2021 12:23:38 +0100 (BST)
References: <20210406174031.64299-1-richard.henderson@linaro.org>
 <20210406174031.64299-11-richard.henderson@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 10/12] target/arm: Simplify sve mte checking
Date: Thu, 08 Apr 2021 12:23:32 +0100
In-reply-to: <20210406174031.64299-11-richard.henderson@linaro.org>
Message-ID: <878s5tt3yd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 3okv8dbLM30k


Richard Henderson <richard.henderson@linaro.org> writes:

> Now that mte_check1 and mte_checkN have been merged, we can
> merge sve_cont_ldst_mte_check1 and sve_cont_ldst_mte_checkN.
>
> Which means that we can eliminate the function pointer into
> sve_ldN_r and sve_stN_r, calling sve_cont_ldst_mte_check directly.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
