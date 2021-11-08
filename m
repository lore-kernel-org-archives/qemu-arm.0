Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id l4sm16251270wrv.94.2021.11.08.06.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 06:18:04 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E83ED1FF96;
	Mon,  8 Nov 2021 14:18:03 +0000 (GMT)
References: <07e63acb-b756-2586-2ba2-b54b837f7fc8@tribudubois.net>
 <CAFEAcA89YQ_vN-JpCeB+L==F5g1hM=CNMBzjaf5c3EHF19NVyQ@mail.gmail.com>
 <c8b89685-7490-328b-51a3-48711c140a84@tribudubois.net>
 <d19f6d2c-7505-b326-3a67-48c336f111e9@tribudubois.net>
 <dd45f94c-6110-7251-4f9f-5b4e1fbb73a4@tribudubois.net>
 <e0a1b786-4b1c-c608-495b-3fb839de2376@tribudubois.net>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Cc: Peter Maydell <peter.maydell@linaro.org>, QEMU Developers
 <qemu-devel@nongnu.org>, qemu-arm@nongnu.org
Subject: Re: Qemu and ARM secure state.
Date: Mon, 08 Nov 2021 14:14:45 +0000
In-reply-to: <e0a1b786-4b1c-c608-495b-3fb839de2376@tribudubois.net>
Message-ID: <87k0hik9yc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 32EGaPagbdNb


Jean-Christophe DUBOIS <jcd@tribudubois.net> writes:

> One small question/remark:
>
> According to the the "Arm Power State Coordinate Interface" (DEN0022D.b) =
document (chapter 5) PSCI calls can only be issued by
> "normal world" (EL1 or EL2). Therefore, should we be adding a test for th=
e current secure state in the arm_is_psci_call() function? This
> would prevent calling the built-in Qemu PSCI function if SMC is issued
> from secure state.

All that should be handled in:

  void HELPER(pre_smc)(CPUARMState *env, uint32_t syndrome)

which should cause things to be trapped if the CPU is in an invalid
state to execute the SMC instruction. If the exception is a valid SMC we
end up in arm_cpu_do_interrupt where we may divert to
arm_handle_psci_call.

--=20
Alex Benn=C3=A9e
