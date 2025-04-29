Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed49c2fsm752361666b.124.2025.04.29.03.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 03:28:49 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 1BEF45F863;
	Tue, 29 Apr 2025 11:28:49 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>,
  kvm@vger.kernel.org,  Paolo Bonzini <pbonzini@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  qemu-arm@nongnu.org,
  anjo@rev.ng,
  richard.henderson@linaro.org
Subject: Re: [PATCH 05/13] target/arm/kvm_arm: copy definitions from kvm
 headers
In-Reply-To: <20250429050010.971128-6-pierrick.bouvier@linaro.org> (Pierrick
	Bouvier's message of "Mon, 28 Apr 2025 22:00:02 -0700")
References: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
	<20250429050010.971128-6-pierrick.bouvier@linaro.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 29 Apr 2025 11:28:49 +0100
Message-ID: <87msbz45y6.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: xSEWy0nfDrW/

Pierrick Bouvier <pierrick.bouvier@linaro.org> writes:

> "linux/kvm.h" is not included for code compiled without
> COMPILING_PER_TARGET, and headers are different depending architecture
> (arm, arm64).
> Thus we need to manually expose some definitions that will
> be used by target/arm, ensuring they are the same for arm amd aarch64.
>
> As well, we must but prudent to not redefine things if code is already
> including linux/kvm.h, thus the #ifndef COMPILING_PER_TARGET guard.
>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>  target/arm/kvm_arm.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index c8ddf8beb2e..eedd081064c 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -16,6 +16,21 @@
>  #define KVM_ARM_VGIC_V2   (1 << 0)
>  #define KVM_ARM_VGIC_V3   (1 << 1)
>=20=20
> +#ifndef COMPILING_PER_TARGET
> +
> +/* we copy those definitions from asm-arm and asm-aarch64, as they are t=
he same
> + * for both architectures */
> +#define KVM_ARM_IRQ_CPU_IRQ 0
> +#define KVM_ARM_IRQ_CPU_FIQ 1
> +#define KVM_ARM_IRQ_TYPE_CPU 0
> +typedef unsigned int __u32;
> +struct kvm_vcpu_init {
> +    __u32 target;
> +    __u32 features[7];
> +};
> +
> +#endif /* COMPILING_PER_TARGET */
> +

I'm not keen on the duplication. It seems to be the only reason we have
struct kvm_vcpu_init is for kvm_arm_create_scratch_host_vcpu() where the
only *external* user passes in a NULL.

If kvm_arm_create_scratch_host_vcpu() is made internal static to
target/arm/kvm.c which will should always include the real linux headers
you just need a QMP helper.

For the IRQ types is this just a sign of target/arm/cpu.c needing
splitting into TCG and KVM bits?


>  /**
>   * kvm_arm_register_device:
>   * @mr: memory region for this device

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
