Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id z19-20020a7bc7d3000000b003edef091b17sm4871686wmk.37.2023.05.04.05.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 05:47:59 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D1FEE1FFBA;
	Thu,  4 May 2023 13:47:58 +0100 (BST)
References: <20230503193833.29047-1-farosas@suse.de>
 <20230503193833.29047-2-farosas@suse.de>
 <3f8ed21a-6c05-e7a4-ab9a-c8f6ca041013@redhat.com>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH 1/3] target/arm: Use CONFIG_SEMIHOSTING instead of TCG
 for semihosting
Date: Thu, 04 May 2023 13:32:58 +0100
In-reply-to: <3f8ed21a-6c05-e7a4-ab9a-c8f6ca041013@redhat.com>
Message-ID: <87cz3gs1oh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: tDFf4zDWIAsX


Paolo Bonzini <pbonzini@redhat.com> writes:

> On 5/3/23 21:38, Fabiano Rosas wrote:
>> When building --without-default-devices, the semihosting code will not
>> be available, so check the proper config.
>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
>
> for this change; however, there are two more related issues:
>
> 1) you still want to leave out the code if !TCG, because KVM is not able
> to exit to userspace on semihosting calls as far as I understand

Correct.

> 2) I am not sure why CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy appears in
> config/targets/{arm,riscv32,riscv64}-softmmu/default.mak.

I think we need to be clearer in the development guide when things are
triggered by config/devices/ and when they are triggered by default
rules in Kconfig.

After Fabino's series the delta between
config/aarch64-softmmu/minimal.mk and config/aarch64-softmmu/default.mk
is pretty small.

I guess minimal.mk should be renamed to virt.mk, sbsa-ref dropped from
it (as you can't run it under KVM) and what controls which devices the
virt platform can use?

Should it be:

CONFIG_PCI_DEVICES=3Dy
CONFIG_VIRTIO_PCI=3Dy

to ensure we can plug and play all the various VirtIO bits we need for
the KVM/Xen use case?

>
> Putting things together you also need something like
>
> diff --git a/semihosting/Kconfig b/semihosting/Kconfig
> index eaf3a20ef5b2..671020a33426 100644
> --- a/semihosting/Kconfig
> +++ b/semihosting/Kconfig
> @@ -4,4 +4,5 @@ config SEMIHOSTING
>    config ARM_COMPATIBLE_SEMIHOSTING
>         bool
> +       default y if (ARM && TCG) || RISCV32 || RISCV64
>         select SEMIHOSTING
> diff --git a/configs/devices/arm-softmmu/default.mak b/configs/devices/ar=
m-softmmu/default.mak
> index 1b49a7830c7e..5e7a17d05bf8 100644
> --- a/configs/devices/arm-softmmu/default.mak
> +++ b/configs/devices/arm-softmmu/default.mak
> @@ -41,5 +41,4 @@ CONFIG_FSL_IMX25=3Dy
>  CONFIG_FSL_IMX7=3Dy
>  CONFIG_FSL_IMX6UL=3Dy
>  CONFIG_SEMIHOSTING=3Dy
> -CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy
>  CONFIG_ALLWINNER_H3=3Dy
> diff --git a/configs/devices/riscv32-softmmu/default.mak b/configs/device=
s/riscv32-softmmu/default.mak
> index d847bd5692ec..94a236c9c25b 100644
> --- a/configs/devices/riscv32-softmmu/default.mak
> +++ b/configs/devices/riscv32-softmmu/default.mak
> @@ -3,8 +3,6 @@
>  # Uncomment the following lines to disable these optional devices:
>  #
>  #CONFIG_PCI_DEVICES=3Dn
> -CONFIG_SEMIHOSTING=3Dy
> -CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy
>    # Boards:
>  #
> diff --git a/configs/devices/riscv64-softmmu/default.mak b/configs/device=
s/riscv64-softmmu/default.mak
> index bc69301fa4a6..3f6805944849 100644
> --- a/configs/devices/riscv64-softmmu/default.mak
> +++ b/configs/devices/riscv64-softmmu/default.mak
> @@ -3,8 +3,6 @@
>  # Uncomment the following lines to disable these optional devices:
>  #
>  #CONFIG_PCI_DEVICES=3Dn
> -CONFIG_SEMIHOSTING=3Dy
> -CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy
>    # Boards:
>  #
>
> Paolo
>
>> Fixes: 29d9efca16 ("arm/Kconfig: Do not build TCG-only boards on a KVM-o=
nly build")
>> Signed-off-by: Fabiano Rosas<farosas@suse.de>
>> ---
>>   target/arm/helper.c       | 4 ++--
>>   target/arm/tcg/m_helper.c | 2 +-
>>   2 files changed, 3 insertions(+), 3 deletions(-)


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
