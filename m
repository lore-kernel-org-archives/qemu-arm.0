Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id w97sm29784250wrc.20.2017.03.14.09.55.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Mar 2017 09:55:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 0DA6E3E02DF;
	Tue, 14 Mar 2017 16:55:34 +0000 (GMT)
References: <20170313180432.7067-1-krzk@kernel.org>
User-agent: mu4e 0.9.19; emacs 25.2.9
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, qemu-devel@nongnu.org, Igor Mitsyanko <i.mitsyanko@gmail.com>
Subject: Re: [Qemu-arm] [PATCH v2 0/5] hw: arm: exynos: Bring up secondary CPU + CPUIDLE issue
In-reply-to: <20170313180432.7067-1-krzk@kernel.org>
Date: Tue, 14 Mar 2017 16:55:34 +0000
Message-ID: <87mvcnpzll.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: PNbRNFZDPqli


Krzysztof Kozlowski <krzk@kernel.org> writes:

> Hi,
>
<snip>
>
> Overview of the problem
> =======================
> On Exynos4210, by default Linux kernel uses cpuidle driver which tries
> to enter low power mode, called AFTR (Arm Off, Top Running).  On real
> hardware this brings some power savings.  This AFTR mode requires second
> CPU to be off, so the driver (coupled cpuidle driver) when system is idle:
> 1. Turns off second CPU,
> 2. Enters AFTR on CPU0.
>
> However the QEMU system is then totally unresponsive (e.g. on serial console)
> and RCU stalls appear from time to time.  I spent some time on it and did not
> find the real cause behind the lag.  Maybe it is because the second CPU
> does not really power down itself and system just burns the cycles under spin
> locks?

Was this tested post the MTTCG merge? Maybe there is an interaction
between power saving/halting the vCPU?

I mention this because I already made some minor tweaks for handing the
WFI instruction in MTTCG. See commit c22edfebff. You can test this by
forcing the original behaviour by adding:

  -accel tcg,thread=single

to your command line.

>
> Looking at recent stable kernels:
>  - 3.10, 3.16 - works fine with two CPUs (no CPUIDLE driver),
>  - 4.1 and newer - stalls and are unresponsive due to CPUIDLE being enabled.
>
> The cpuidle driver is not relying on DTS. It is just enabled in exynos_defconfig
> and works.
>
> Workarounds
> ===========
> 1. Boot with only 1 cpu
> 2. Build a kernel with disabled CONFIG_CPU_IDLE
>
>
>
> Best regards,
> Krzysztof
>
> Krzysztof Kozlowski (5):
>   hw/intc/exynos4210_gic: Fix GIC memory mappings for secondary CPU
>   hw/intc/exynos4210_gic: Use more meaningful name for local variable
>   hw/timer/exynos4210_mct: Fix checkpatch style errors
>   hw/timer/exynos4210_mct: Cleanup indentation and empty new lines
>   hw/timer/exynos4210_mct: Remove unused defines
>
>  hw/intc/exynos4210_gic.c  | 33 +++++++++++++++++++------------
>  hw/timer/exynos4210_mct.c | 50 ++++++++++++++++++++---------------------------
>  2 files changed, 41 insertions(+), 42 deletions(-)


--
Alex Bennée
