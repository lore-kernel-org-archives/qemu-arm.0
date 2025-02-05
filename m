Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47f1dbfsm1109979266b.78.2025.02.05.06.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 06:43:19 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id E080D5F90B;
	Wed,  5 Feb 2025 14:43:18 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  Peter Maydell
 <peter.maydell@linaro.org>,  Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH] tests/functional/test_aarch64_virt: Fix vulkan test
 without egl-headless
In-Reply-To: <20250205141140.97437-1-thuth@redhat.com> (Thomas Huth's message
	of "Wed, 5 Feb 2025 15:11:40 +0100")
References: <20250205141140.97437-1-thuth@redhat.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Wed, 05 Feb 2025 14:43:18 +0000
Message-ID: <87h6588nax.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: LzC7mTVOATL6

Thomas Huth <thuth@redhat.com> writes:

> The vulkan test currently fails if the egl-headless device is not
> available. Let's add a proper check to skip the test in this case.
>
> Fixes: 3d30f882ce ("tests/functional: extend test_aarch64_virt with vulka=
n test")
> Reported-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
