Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id k16sm33753815wro.11.2021.04.08.04.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 04:10:30 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 61DBB1FF7E;
	Thu,  8 Apr 2021 12:10:30 +0100 (BST)
References: <20210406174031.64299-1-richard.henderson@linaro.org>
 <20210406174031.64299-10-richard.henderson@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 09/12] target/arm: Rename mte_probe1 to mte_probe
Date: Thu, 08 Apr 2021 12:10:21 +0100
In-reply-to: <20210406174031.64299-10-richard.henderson@linaro.org>
Message-ID: <87blapt4k9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: RXHYvwk5xxlM


Richard Henderson <richard.henderson@linaro.org> writes:

> For consistency with the mte_check1 + mte_checkN merge
> to mte_check, rename the probe function as well.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
