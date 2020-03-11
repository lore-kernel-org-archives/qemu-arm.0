Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id y15sm15432535wrq.89.2020.03.11.07.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 07:00:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D45CA1FF7E;
	Wed, 11 Mar 2020 14:00:37 +0000 (GMT)
References: <20200310213203.18730-1-nieklinnenbank@gmail.com>
 <20200310213203.18730-14-nieklinnenbank@gmail.com>
User-agent: mu4e 1.3.9; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 philmd@redhat.com, b.galvani@gmail.com, jasowang@redhat.com,
 imammedo@redhat.com, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>
Subject: Re: [PATCH v7 13/18] tests/boot_linux_console: Add a quick test for
 the OrangePi PC board
In-reply-to: <20200310213203.18730-14-nieklinnenbank@gmail.com>
Date: Wed, 11 Mar 2020 14:00:37 +0000
Message-ID: <8736afgfei.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 3L9zdRm7RkLH


Niek Linnenbank <nieklinnenbank@gmail.com> writes:

> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> This test boots a Linux kernel on a OrangePi PC board and verify
> the serial output is working.
>
> The kernel image and DeviceTree blob are built by the Armbian
> project (based on Debian):
> https://www.armbian.com/orange-pi-pc/
>
> If ARM is a target being built, "make check-acceptance" will
> automatically include this test by the use of the "arch:arm" tags.
>
> Alternatively, this test can be run using:
>
>   $ make check-venv
>   $ ./tests/venv/bin/avocado --show=3Dconsole,app run -t machine:orangepi=
-pc tests/acceptance/boot_linux_console.py
>   JOB ID     : 2e4d15eceb13c33672af406f08171e6e9de1414a
>   JOB LOG    : ~/job-results/job-2019-12-17T05.46-2e4d15e/job.log
>   (1/1) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_=
orangepi:
>   console: Uncompressing Linux... done, booting the kernel.
>   console: Booting Linux on physical CPU 0x0
>   console: Linux version 4.20.7-sunxi (root@armbian.com) (gcc version 7.2=
.1 20171011 (Linaro GCC 7.2-2017.11)) #5.75 SMP Fri Feb 8 09:02:10 CET 2019
>   console: CPU: ARMv7 Processor [410fc075] revision 5 (ARMv7), cr=3D50c53=
87d
>   console: CPU: div instructions available: patching division code
>   console: CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruc=
tion cache
>   console: OF: fdt: Machine model: Xunlong Orange Pi PC
>   console: Memory policy: Data cache writealloc
>   console: OF: reserved mem: failed to allocate memory for node 'cma@4a00=
0000'
>   console: cma: Failed to reserve 128 MiB
>   console: psci: probing for conduit method from DT.
>   console: psci: PSCIv0.2 detected in firmware.
>   console: psci: Using standard PSCI v0.2 function IDs
>   console: psci: Trusted OS migration not required
>   console: random: get_random_bytes called from start_kernel+0x8d/0x3c2 w=
ith crng_init=3D0
>   console: percpu: Embedded 18 pages/cpu @(ptrval) s41228 r8192 d24308 u7=
3728
>   console: Built 1 zonelists, mobility grouping on.  Total pages: 32480
>   console: Kernel command line: printk.time=3D0 console=3DttyS0,115200
>   PASS (8.59 s)
>   JOB TIME   : 8.81 s
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> [NL: rename in commit message Raspbian to Armbian, remove vm.set_machine(=
)]
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
