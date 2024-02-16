Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id m5-20020a05600c4f4500b0041253d0acd6sm150381wmq.47.2024.02.16.03.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 03:44:06 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 5ADD65F83F;
	Fri, 16 Feb 2024 11:44:06 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,  Peter Maydell
 <peter.maydell@linaro.org>,  David Hildenbrand <david@redhat.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  qemu-devel@nongnu.org,  qemu-arm@nongnu.org,
  qemu-s390x@nongnu.org
Subject: Re: [PATCH v5 0/3] linux-user: Allow gdbstub to ignore page protection
In-Reply-To: <20240131114817.288027-1-iii@linux.ibm.com> (Ilya Leoshkevich's
	message of "Wed, 31 Jan 2024 12:46:28 +0100")
References: <20240131114817.288027-1-iii@linux.ibm.com>
User-Agent: mu4e 1.11.28; emacs 29.1
Date: Fri, 16 Feb 2024 11:44:06 +0000
Message-ID: <87h6i84os9.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: sR5o0Sd70Yqu

Ilya Leoshkevich <iii@linux.ibm.com> writes:

> v4: https://lists.gnu.org/archive/html/qemu-devel/2024-01/msg05857.html
> v4 -> v5: Fix the probe_proc_self_mem vs probe_proc_self_mem() typo.
>           Add Alex's R-b and A-b.

I was going to pull this and realised it already went in via Richard's
tcg-next. Did this fix get merged?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
