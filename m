Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ce2-20020a5d5e02000000b0033af4848124sm3918077wrb.109.2024.01.30.05.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 05:34:38 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 18A175F9D3;
	Tue, 30 Jan 2024 13:34:38 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,  Peter Maydell
 <peter.maydell@linaro.org>,  David Hildenbrand <david@redhat.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  qemu-devel@nongnu.org,  qemu-arm@nongnu.org,
  qemu-s390x@nongnu.org
Subject: Re: [PATCH v4 3/3] tests/tcg: Add the PROT_NONE gdbstub test
In-Reply-To: <20240129093410.3151-4-iii@linux.ibm.com> (Ilya Leoshkevich's
	message of "Mon, 29 Jan 2024 10:32:16 +0100")
References: <20240129093410.3151-1-iii@linux.ibm.com>
	<20240129093410.3151-4-iii@linux.ibm.com>
User-Agent: mu4e 1.11.27; emacs 29.1
Date: Tue, 30 Jan 2024 13:34:38 +0000
Message-ID: <87cytjosgh.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: oOdzqvWxID2u

Ilya Leoshkevich <iii@linux.ibm.com> writes:

> Make sure that qemu gdbstub, like gdbserver, allows reading from and
> writing to PROT_NONE pages.
>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
