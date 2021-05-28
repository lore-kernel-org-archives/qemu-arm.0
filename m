Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id g70sm7398894wme.9.2021.05.28.08.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 08:26:46 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id ECE981FF7E;
	Fri, 28 May 2021 16:26:45 +0100 (BST)
References: <20210527095152.10968-1-peter.maydell@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH] arm: Consistently use "Cortex-Axx", not "Cortex Axx"
Date: Fri, 28 May 2021 16:26:37 +0100
In-reply-to: <20210527095152.10968-1-peter.maydell@linaro.org>
Message-ID: <87h7im2822.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: nSe1A/6jrU7Z


Peter Maydell <peter.maydell@linaro.org> writes:

> The official punctuation for Arm CPU names uses a hyphen, like
> "Cortex-A9". We mostly follow this, but in a few places usage
> without the hyphen has crept in. Fix those so we consistently
> use the same way of writing the CPU name.
>
> This commit was created with:
>   git grep -z -l 'Cortex ' | xargs -0 sed -i 's/Cortex /Cortex-/'
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
