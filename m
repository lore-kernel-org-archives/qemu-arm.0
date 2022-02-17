Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id b19sm53399edd.91.2022.02.17.09.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 09:38:31 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id AA7C420329;
	Thu, 17 Feb 2022 17:38:30 +0000 (GMT)
References: <20220210040423.95120-1-richard.henderson@linaro.org>
 <CAFEAcA_m1Hobh8M+RBto_uECQdq1BN7nvMFOsCbrkL773MEr1Q@mail.gmail.com>
User-agent: mu4e 1.7.7; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v2 00/15] target/arm: Implement LVA, LPA, LPA2 features
Date: Thu, 17 Feb 2022 17:37:53 +0000
In-reply-to: <CAFEAcA_m1Hobh8M+RBto_uECQdq1BN7nvMFOsCbrkL773MEr1Q@mail.gmail.com>
Message-ID: <87v8xd9yw9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 2ii7NfjEQwXD


Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 10 Feb 2022 at 04:04, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Changes for v2:
>>   * Introduce FIELD_SEX64, instead of open-coding w/ sextract64.
>>   * Set TCR_EL1 more completely for user-only.
>>   * Continue to bound tsz within aa64_va_parameters;
>>     provide an out-of-bound indicator for raising AddressSize fault.
>>   * Split IPS patch.
>>   * Fix debug registers for LVA.
>>   * Fix long-format fsc for LPA2.
>>   * Fix TLBI page shift.
>>   * Validate TLBI granule vs TCR granule.
>>
>> Not done:
>>   * Validate translation levels which accept blocks.
>>
>> There is still no upstream kernel support for FEAT_LPA2,
>> so that is essentially untested.
>
> This series seems to break 'make check-acceptance':
>
>  (01/59) tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv2:
> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
> Timeout reached\nOriginal status: ERROR\n{'name':
> '01-tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv2',
> 'logdir': '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tes=
ts/results/j...
> (900.74 s)
>  (02/59) tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv3:
> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
> Timeout reached\nOriginal status: ERROR\n{'name':
> '02-tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv3',
> 'logdir': '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tes=
ts/results/j...
> (900.71 s)
>
> UEFI runs in the guest and seems to launch the kernel, but there's
> no output from the kernel itself in the logfile. Last thing it
> prints is:
>
> EFI stub: Booting Linux Kernel...
> EFI stub: EFI_RNG_PROTOCOL unavailable, no randomness supplied
> EFI stub: Using DTB from configuration table
> EFI stub: Exiting boot services and installing virtual address map...
> SetUefiImageMemoryAttributes - 0x000000007F500000 - 0x0000000000040000
> (0x0000000000000008)
> SetUefiImageMemoryAttributes - 0x000000007C190000 - 0x0000000000040000
> (0x0000000000000008)
> SetUefiImageMemoryAttributes - 0x000000007C140000 - 0x0000000000040000
> (0x0000000000000008)
> SetUefiImageMemoryAttributes - 0x000000007F4C0000 - 0x0000000000030000
> (0x0000000000000008)
> SetUefiImageMemoryAttributes - 0x000000007C0F0000 - 0x0000000000040000
> (0x0000000000000008)
> SetUefiImageMemoryAttributes - 0x000000007BFB0000 - 0x0000000000040000
> (0x0000000000000008)
> SetUefiImageMemoryAttributes - 0x000000007BE00000 - 0x0000000000030000
> (0x0000000000000008)
> SetUefiImageMemoryAttributes - 0x000000007BDC0000 - 0x0000000000030000
> (0x0000000000000008)
>
> This ought to be followed by the usual kernel boot log
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x000f0510]
> etc but it isn't. Probably the kernel is crashing in early bootup
> before it gets round to printing anything.

As this test runs under -cpu max it is likely exercising the new
features (and failing).

--=20
Alex Benn=C3=A9e
