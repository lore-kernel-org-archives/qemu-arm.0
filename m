Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31d987csm36879745e9.27.2025.01.22.12.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 12:55:46 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 5CE485FA4B;
	Wed, 22 Jan 2025 20:55:44 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 02/10] gdbstub: Clarify no more than
 @gdb_num_core_regs can be accessed
In-Reply-To: <20250122093028.52416-3-philmd@linaro.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 22 Jan 2025 10:30:20
 +0100")
References: <20250122093028.52416-1-philmd@linaro.org>
	<20250122093028.52416-3-philmd@linaro.org>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Wed, 22 Jan 2025 20:55:44 +0000
Message-ID: <8734hamuun.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: NJ3zWqmIqETT

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Both CPUClass::gdb_read_register() and CPUClass::gdb_write_register()
> handlers are called from common gdbstub code, and won't be called with
> register index over CPUClass::gdb_num_core_regs:
>
>   int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
>   {
>       CPUClass *cc =3D CPU_GET_CLASS(cpu);
>
>       if (reg < cc->gdb_num_core_regs) {
>           return cc->gdb_read_register(cpu, buf, reg);
>       }
>       ...
>   }
>
>   static int gdb_write_register(CPUState *cpu, uint8_t *mem_buf, int reg)
>   {
>       CPUClass *cc =3D CPU_GET_CLASS(cpu);
>
>       if (reg < cc->gdb_num_core_regs) {
>           return cc->gdb_write_register(cpu, mem_buf, reg);
>       }
>       ...
>   }
>
> Clarify that in CPUClass docstring, and remove unreachable code on
> the microblaze and tricore implementations.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
