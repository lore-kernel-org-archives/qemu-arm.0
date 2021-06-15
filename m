Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id i2sm15673696wmo.40.2021.06.15.09.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 09:29:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9C8601FF7E;
	Tue, 15 Jun 2021 17:29:35 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [PATCH] docs/system/arm: Document which architecture extensions
 we emulate
References: <20210615160652.29485-1-peter.maydell@linaro.org>
Date: Tue, 15 Jun 2021 17:29:35 +0100
In-Reply-To: <20210615160652.29485-1-peter.maydell@linaro.org> (Peter
	Maydell's message of "Tue, 15 Jun 2021 17:06:52 +0100")
Message-ID: <878s3bgkgg.fsf@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: GhP+JnrVgRNe

Peter Maydell <peter.maydell@linaro.org> writes:

> These days the Arm architecture has a wide range of fine-grained
> optional extra architectural features. We implement quite a lot
> of these but by no means all of them. Document what we do implement,
> so that users can find out without having to dig through back-issues
> of our Changelog on the wiki.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> The FEAT_ lists are in the order the features are listed in
> the Arm ARM; alternatively we could alphabetize them?

Maybe a slight preference for alphabetical order. And crossed fingers
the ARM ARM doesn't change it's names again ;-)

Either way:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
