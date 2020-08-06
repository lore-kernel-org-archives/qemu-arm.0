Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id v12sm6154950wri.47.2020.08.06.04.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 04:50:14 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B5CC11FF7E;
	Thu,  6 Aug 2020 12:50:13 +0100 (BST)
References: <20200806104453.30393-1-peter.maydell@linaro.org>
 <20200806104453.30393-5-peter.maydell@linaro.org>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 4/4] target/arm: Use correct FPST for VCMLA, VCADD on fp16
In-reply-to: <20200806104453.30393-5-peter.maydell@linaro.org>
Date: Thu, 06 Aug 2020 12:50:13 +0100
Message-ID: <87d044kn7u.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: s6E0MnVHdPJv


Peter Maydell <peter.maydell@linaro.org> writes:

> When we implemented the VCMLA and VCADD insns we put in the
> code to handle fp16, but left it using the standard fp status
> flags. Correct them to use FPST_STD_F16 for fp16 operations.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
