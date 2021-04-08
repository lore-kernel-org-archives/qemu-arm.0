Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id u8sm47618866wrr.42.2021.04.08.04.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 04:10:05 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 60CB31FF7E;
	Thu,  8 Apr 2021 12:10:05 +0100 (BST)
References: <20210406174031.64299-1-richard.henderson@linaro.org>
 <20210406174031.64299-9-richard.henderson@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v4 08/12] target/arm: Merge mte_check1, mte_checkN
Date: Thu, 08 Apr 2021 12:10:01 +0100
In-reply-to: <20210406174031.64299-9-richard.henderson@linaro.org>
Message-ID: <87eeflt4ky.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 7stW5xkDt3pV


Richard Henderson <richard.henderson@linaro.org> writes:

> The mte_check1 and mte_checkN functions are now identical.
> Drop mte_check1 and rename mte_checkN to mte_check.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
