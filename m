Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc186d905asm1135005a12.79.2025.01.24.04.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 04:50:29 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 2C1185F8D0;
	Fri, 24 Jan 2025 12:50:28 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>,  Paolo
 Bonzini <pbonzini@redhat.com>,  qemu-arm@nongnu.org,  Igor Mammedov
 <imammedo@redhat.com>,  kvm@vger.kernel.org,  qemu-ppc@nongnu.org,
  qemu-riscv@nongnu.org,  David Hildenbrand <david@redhat.com>,
  qemu-s390x@nongnu.org,  xen-devel@lists.xenproject.org,  Richard
 Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 03/20] gdbstub: Check for TCG before calling tb_flush()
In-Reply-To: <20250123234415.59850-4-philmd@linaro.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 24 Jan 2025 00:43:57
 +0100")
References: <20250123234415.59850-1-philmd@linaro.org>
	<20250123234415.59850-4-philmd@linaro.org>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Fri, 24 Jan 2025 12:50:28 +0000
Message-ID: <878qr0jrzf.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: LIg1EkvqRroc

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Use the tcg_enabled() check so the compiler can elide
> the call when TCG isn't available, allowing to remove
> the tb_flush() stub.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
