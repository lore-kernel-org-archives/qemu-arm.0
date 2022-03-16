Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id d4-20020a056402000400b00412d60fee38sm884877edu.11.2022.03.16.05.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 05:03:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 1942C1FFB7;
	Wed, 16 Mar 2022 12:03:16 +0000 (GMT)
References: <20220315204306.2797684-1-peter.maydell@linaro.org>
 <20220315204306.2797684-3-peter.maydell@linaro.org>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 2/2] target/arm: Log fault address for M-profile faults
Date: Wed, 16 Mar 2022 12:03:10 +0000
In-reply-to: <20220315204306.2797684-3-peter.maydell@linaro.org>
Message-ID: <87wngu2jgb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: TP1oEb/gtfHK


Peter Maydell <peter.maydell@linaro.org> writes:

> For M-profile, the fault address is not always exposed to the guest
> in a fault register (for instance the BFAR bus fault address register
> is only updated for bus faults on data accesses, not instruction
> accesses).  Currently we log the address only if we're putting it
> into a particular guest-visible register.  Since we always have it,
> log it generically, to make logs of i-side faults a bit clearer.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
