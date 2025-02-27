Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b7a28bf64sm35397115e9.39.2025.02.27.14.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 14:23:54 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id C1E8B5F929;
	Thu, 27 Feb 2025 22:23:53 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [PATCH] tests/tcg: Suppress compiler false-positive warning on
 sha1.c
In-Reply-To: <20250227141343.1675415-1-peter.maydell@linaro.org> (Peter
	Maydell's message of "Thu, 27 Feb 2025 14:13:43 +0000")
References: <20250227141343.1675415-1-peter.maydell@linaro.org>
User-Agent: mu4e 1.12.9; emacs 29.4
Date: Thu, 27 Feb 2025 22:23:53 +0000
Message-ID: <87a5a7vxfq.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: hbEtLYqjSAvy

Peter Maydell <peter.maydell@linaro.org> writes:

> GCC versions at least 12 through 15 incorrectly report a warning
> about code in sha1.c:
>
> tests/tcg/multiarch/sha1.c:161:13: warning: =E2=80=98SHA1Transform=E2=80=
=99 reading 64 bytes from a region of size 0 [-Wstringop-overread]
>   161 |             SHA1Transform(context->state, &data[i]);
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> This is a piece of stock library code for doing SHA1 which we've
> simply copied, rather than writing ourselves. The bug has been
> reported to upstream GCC (about a different library's use of this
> code):
>  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D106709
>
> For our test case, since this isn't our original code and there isn't
> actually a bug in it, suppress the incorrect warning rather than
> trying to modify the code to work around the compiler issue.

Queued to maintainer/for-10.0-softfreeze, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
