Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id d30sm30226980wrc.92.2021.02.01.09.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 09:37:52 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 507551FF7E;
	Mon,  1 Feb 2021 17:37:52 +0000 (GMT)
References: <20210131115022.242570-1-f4bug@amsat.org>
 <20210131115022.242570-7-f4bug@amsat.org>
 <80af7db7-2311-7cc5-93a0-f0609b0222d0@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Thomas
 Huth <thuth@redhat.com>, Richard Henderson <rth@twiddle.net>, Fam Zheng
 <fam@euphon.net>, Claudio Fontana <cfontana@suse.de>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-block@nongnu.org, kvm@vger.kernel.org, Laurent
 Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org, Richard Henderson
 <richard.henderson@linaro.org>, John Snow <jsnow@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v6 06/11] target/arm: Restrict ARMv7 R-profile cpus to
 TCG accel
Date: Mon, 01 Feb 2021 17:37:22 +0000
In-reply-to: <80af7db7-2311-7cc5-93a0-f0609b0222d0@redhat.com>
Message-ID: <874kivvgcv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: /+0ts+aNhq8E


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 1/31/21 12:50 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>> KVM requires the target cpu to be at least ARMv8 architecture
>> (support on ARMv7 has been dropped in commit 82bf7ae84ce:
>> "target/arm: Remove KVM support for 32-bit Arm hosts").
>>=20
>> Beside, KVM only supports A-profile, thus won't be able to run
>> R-profile cpus.
>>=20
>> Only enable the following ARMv7 R-Profile CPUs when TCG is available:
>>=20
>>   - Cortex-R5
>>   - Cortex-R5F
>>=20
>> The following machine is no more built when TCG is disabled:
>>=20
>>   - xlnx-zcu102          Xilinx ZynqMP ZCU102 board with 4xA53s and 2xR5=
Fs
>>=20
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>>  default-configs/devices/aarch64-softmmu.mak | 1 -
>>  hw/arm/Kconfig                              | 2 ++
>>  target/arm/Kconfig                          | 4 ++++
>>  3 files changed, 6 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/default-configs/devices/aarch64-softmmu.mak b/default-confi=
gs/devices/aarch64-softmmu.mak
>> index 958b1e08e40..a4202f56817 100644
>> --- a/default-configs/devices/aarch64-softmmu.mak
>> +++ b/default-configs/devices/aarch64-softmmu.mak
>> @@ -3,6 +3,5 @@
>>  # We support all the 32 bit boards so need all their config
>>  include arm-softmmu.mak
>>=20=20
>> -CONFIG_XLNX_ZYNQMP_ARM=3Dy
>>  CONFIG_XLNX_VERSAL=3Dy
>>  CONFIG_SBSA_REF=3Dy
>> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
>> index 6c4bce4d637..4baf1f97694 100644
>> --- a/hw/arm/Kconfig
>> +++ b/hw/arm/Kconfig
>> @@ -360,8 +360,10 @@ config STM32F405_SOC
>>=20=20
>>  config XLNX_ZYNQMP_ARM
>>      bool
>> +    default y if TCG && ARM
>
> The correct line is:
>
>       "default y if TCG && AARCH64"

Ahh yes, TIL we had some R-profile cores in QEMU ;-)

with the fix:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
