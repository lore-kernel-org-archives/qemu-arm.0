Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c7df320csm15085845f8f.7.2025.03.17.07.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 07:59:30 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id A066C5F892;
	Mon, 17 Mar 2025 14:59:29 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [PATCH for-10.1 2/9] gdbstub: Allow gdb_core_xml_file to be set
 at runtime
In-Reply-To: <20250317142819.900029-3-peter.maydell@linaro.org> (Peter
	Maydell's message of "Mon, 17 Mar 2025 14:28:12 +0000")
References: <20250317142819.900029-1-peter.maydell@linaro.org>
	<20250317142819.900029-3-peter.maydell@linaro.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 17 Mar 2025 14:59:29 +0000
Message-ID: <87iko7og8e.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 6GK7hTRB9/lg

Peter Maydell <peter.maydell@linaro.org> writes:

> Currently the CPUClass:gdb_core_xml_file setting is a simple 'const
> char *' which the CPU class must set to a fixed string.  Allow the
> CPU class to instead set a new method gdb_get_core_xml_file() which
> returns this string.
>
> This will allow Arm CPUs to use different XML files for AArch32 vs
> AArch64 without having to have an extra AArch64-specific class type
> purely to give somewhere to set cc->gdb_core_xml_file differently.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
