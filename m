Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef8e509dsm837428566b.68.2025.03.25.03.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 03:18:08 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 6FA3E5F76B;
	Tue, 25 Mar 2025 10:18:07 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,  qemu-devel@nongnu.org,
  qemu-arm@nongnu.org
Subject: Re: [PATCH] tests/functional/test_aarch64_virt_gpu: Skip if "dbus"
 display isn't available
In-Reply-To: <20250325061609.272847-1-thuth@redhat.com> (Thomas Huth's message
	of "Tue, 25 Mar 2025 07:16:09 +0100")
References: <20250325061609.272847-1-thuth@redhat.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 25 Mar 2025 10:18:07 +0000
Message-ID: <87pli52z34.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: vWz2uYp+zmPT

Thomas Huth <thuth@redhat.com> writes:

> From: Thomas Huth <thuth@redhat.com>
>
> This test currently fails if the "dbus" display has not been compiled
> into the binary (which can happen when CFI has been enabled, for example).
> Check for the error message to skip the test in that case.
>
> While we're at it, also make sure that this test is covered in the
> right section in the MAINTAINERS file.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
