Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id d15-20020adfa34f000000b0033ae9f1fb82sm6497820wrb.48.2024.01.30.05.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 05:33:24 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 700815F9D3;
	Tue, 30 Jan 2024 13:33:23 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,  Peter Maydell
 <peter.maydell@linaro.org>,  David Hildenbrand <david@redhat.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  qemu-devel@nongnu.org,  qemu-arm@nongnu.org,
  qemu-s390x@nongnu.org
Subject: Re: [PATCH v4 2/3] tests/tcg: Factor out gdbstub test functions
In-Reply-To: <20240129093410.3151-3-iii@linux.ibm.com> (Ilya Leoshkevich's
	message of "Mon, 29 Jan 2024 10:32:15 +0100")
References: <20240129093410.3151-1-iii@linux.ibm.com>
	<20240129093410.3151-3-iii@linux.ibm.com>
User-Agent: mu4e 1.11.27; emacs 29.1
Date: Tue, 30 Jan 2024 13:33:23 +0000
Message-ID: <87il3bosik.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: xwmx2SVNWvhT

Ilya Leoshkevich <iii@linux.ibm.com> writes:

> Both the report() function as well as the initial gdbstub test sequence
> are copy-pasted into ~10 files with slight modifications. This
> indicates that they are indeed generic, so factor them out. While
> at it, add a few newlines to make the formatting closer to PEP-8.
>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
