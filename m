Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id n17-20020a5d4c51000000b002c54c9bd71fsm14076489wrt.93.2023.03.22.09.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 09:21:50 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 1038D1FFB7;
	Wed, 22 Mar 2023 16:21:50 +0000 (GMT)
References: <20230322142902.69511-1-philmd@linaro.org>
 <20230322142902.69511-3-philmd@linaro.org>
User-agent: mu4e 1.9.22; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 Claudio Fontana <cfontana@suse.de>, qemu-arm@nongnu.org
Subject: Re: [PATCH-for-8.0 2/2] target/arm/gdbstub: Only advertise
 M-profile features if TCG available
Date: Wed, 22 Mar 2023 16:21:45 +0000
In-reply-to: <20230322142902.69511-3-philmd@linaro.org>
Message-ID: <877cv869k1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: oOhCWoCP+XeW


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Cortex-M profile is only emulable from TCG accelerator. Restrict
> the GDBstub features to its availability in order to avoid a link
> error when TCG is not enabled:
>
>   Undefined symbols for architecture arm64:
>     "_arm_v7m_get_sp_ptr", referenced from:
>         _m_sysreg_get in target_arm_gdbstub.c.o
>     "_arm_v7m_mrs_control", referenced from:
>         _arm_gdb_get_m_systemreg in target_arm_gdbstub.c.o
>   ld: symbol(s) not found for architecture arm64
>   clang: error: linker command failed with exit code 1 (use -v to see inv=
ocation)
>
> Fixes: 7d8b28b8b5 ("target/arm: Implement gdbstub m-profile systemreg and=
 secext")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
