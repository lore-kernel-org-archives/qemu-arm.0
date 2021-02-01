Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id a16sm27138510wrr.89.2021.02.01.09.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 09:10:38 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9B4981FF7E;
	Mon,  1 Feb 2021 17:10:37 +0000 (GMT)
References: <20210131115022.242570-1-f4bug@amsat.org>
 <20210131115022.242570-4-f4bug@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Richard Henderson
 <rth@twiddle.net>,
 Fam Zheng <fam@euphon.net>, Claudio Fontana <cfontana@suse.de>, Paolo
 Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org, kvm@vger.kernel.org,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org, Richard
 Henderson <richard.henderson@linaro.org>, John Snow <jsnow@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v6 03/11] target/arm: Restrict ARMv4 cpus to TCG accel
Date: Mon, 01 Feb 2021 17:10:30 +0000
In-reply-to: <20210131115022.242570-4-f4bug@amsat.org>
Message-ID: <87czxjvhma.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: l1i7MoWimCJL


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> KVM requires the target cpu to be at least ARMv8 architecture
> (support on ARMv7 has been dropped in commit 82bf7ae84ce:
> "target/arm: Remove KVM support for 32-bit Arm hosts").
>
> Only enable the following ARMv4 CPUs when TCG is available:
>
>   - StrongARM (SA1100/1110)
>   - OMAP1510 (TI925T)
>
> The following machines are no more built when TCG is disabled:
>
>   - cheetah              Palm Tungsten|E aka. Cheetah PDA (OMAP310)
>   - sx1                  Siemens SX1 (OMAP310) V2
>   - sx1-v1               Siemens SX1 (OMAP310) V1
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
