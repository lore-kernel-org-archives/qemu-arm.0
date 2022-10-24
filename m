Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id d14-20020a05600c34ce00b003b31c560a0csm149555wmq.12.2022.10.24.07.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 07:55:44 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2C91B1FFB7;
	Mon, 24 Oct 2022 15:55:44 +0100 (BST)
References: <20221024051851.3074715-1-richard.henderson@linaro.org>
 <20221024051851.3074715-9-richard.henderson@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v6 08/14] target/arm: Fix fault reporting in
 get_phys_addr_lpae
Date: Mon, 24 Oct 2022 15:55:39 +0100
In-reply-to: <20221024051851.3074715-9-richard.henderson@linaro.org>
Message-ID: <87bkq19spb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 3e86bNbSAV1D


Richard Henderson <richard.henderson@linaro.org> writes:

> Always overriding fi->type was incorrect, as we would not properly
> propagate the fault type from S1_ptw_translate, or arm_ldq_ptw.
> Simplify things by providing a new label for a translation fault.
> For other faults, store into fi directly.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
