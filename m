Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da517380sm37749166b.89.2025.05.01.06.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 06:09:09 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 6287E5F9F8;
	Thu,  1 May 2025 14:09:08 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  Philippe =?utf-8?Q?Mathi?=
 =?utf-8?Q?eu-Daud=C3=A9?=
 <philmd@linaro.org>,  "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH v2 3/7] hw/core/cpu-common: Don't init gdbstub until
 cpu_exec_realizefn()
In-Reply-To: <20250429132200.605611-4-peter.maydell@linaro.org> (Peter
	Maydell's message of "Tue, 29 Apr 2025 14:21:56 +0100")
References: <20250429132200.605611-1-peter.maydell@linaro.org>
	<20250429132200.605611-4-peter.maydell@linaro.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 01 May 2025 14:09:08 +0100
Message-ID: <87r018xytn.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: D7Zv8LGGd/27

Peter Maydell <peter.maydell@linaro.org> writes:

> Currently we call gdb_init_cpu() in cpu_common_initfn(), which is
> very early in the CPU object's init->realize creation sequence.  In
> particular this happens before the architecture-specific subclass's
> init fn has even run.  This means that gdb_init_cpu() can only do
> things that depend strictly on the class, not on the object, because
> the CPUState* that it is passed is currently half-initialized.
>
> In commit a1f728ecc90cf6c6 we accidentally broke this rule, by adding
> a call to the gdb_get_core_xml_file method which takes the CPUState.
> At the moment we get away with this because the only implementation
> doesn't actually look at the pointer it is passed.  However the whole
> reason we created that method was so that we could make the "which
> XML file?" decision based on a property of the CPU object, and we
> currently can't change the Arm implementation of the method to do
> what we want without causing wrong behaviour or a crash.
>
> The ordering restrictions here are:
>  * we must call gdb_init_cpu before:
>    - any call to gdb_register_coprocessor()
>    - any use of the gdb_num_regs field (this is only used
>      in code that's about to call gdb_register_coprocessor()
>      and wants to know the first register number of the
>      set of registers it's about to add)
>  * we must call gdb_init_cpu after CPU properties have been
>    set, which is to say somewhere in realize
>
> The function cpu_exec_realizefn() meets both of these requirements,
> as it is called by the architecture-specific CPU realize function
> early in realize, before any calls ot gdb_register_coprocessor().
> Move the gdb_init_cpu() call to there.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
