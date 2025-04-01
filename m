Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fba4c29sm157175245e9.5.2025.04.01.03.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 03:29:59 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 3FEAC5F8B9;
	Tue,  1 Apr 2025 11:29:58 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Zhang Chen <zhangckid@gmail.com>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  Peter Maydell
 <peter.maydell@linaro.org>,  qemu-trivial@nongnu.org
Subject: Re: [PATCH] docs/arm: Add apple HVF host for supported guest CPU type
In-Reply-To: <20250401083102.72845-1-zhangckid@gmail.com> (Zhang Chen's
	message of "Tue, 1 Apr 2025 16:31:02 +0800")
References: <20250401083102.72845-1-zhangckid@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 01 Apr 2025 11:29:58 +0100
Message-ID: <87zfh0npi1.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: b6y/P8PmzllW

Zhang Chen <zhangckid@gmail.com> writes:

> In my test, latest QEMU already support Apple HVF for -cpu host and max.
>
> From guest VM lscpu:
>
> Architecture:             aarch64
>   CPU op-mode(s):         64-bit
>   Byte Order:             Little Endian
> CPU(s):                   11
>   On-line CPU(s) list:    0-10
> Vendor ID:                Apple
>   Model name:             -
>     Model:                0
>     Thread(s) per core:   1
>     Core(s) per socket:   11
>     Socket(s):            1
>     Stepping:             0x0
>     BogoMIPS:             48.00
>     Flags:                fp asimd evtstrm aes pmull sha1 sha2 crc32 atom=
ics fphp asimdhp cpuid asimdrdm jscvt fcma lrcpc dcpop sha3 asimddp sha512 =
asim
>                           dfhm dit uscat ilrcpc flagm ssbs sb paca pacg d=
cpodp flagm2 frint
>
> Signed-off-by: Zhang Chen <zhangckid@gmail.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
