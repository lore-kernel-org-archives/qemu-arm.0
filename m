Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id l124sm17676421wmf.36.2019.06.17.07.49.02
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 07:49:02 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5B1391FF87;
	Mon, 17 Jun 2019 15:49:02 +0100 (BST)
References: <20190615154352.26824-1-philmd@redhat.com> <20190615154352.26824-22-philmd@redhat.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Samuel Ortiz
 <sameo@linux.intel.com>, Robert Bradford <robert.bradford@intel.com>
Subject: Re: [Qemu-arm] [PATCH v2 21/23] target/arm: Do not build TCG objects when TCG is off
In-reply-to: <20190615154352.26824-22-philmd@redhat.com>
Date: Mon, 17 Jun 2019 15:49:02 +0100
Message-ID: <87ef3s9sip.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 29rpCDReFbH+


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> From: Samuel Ortiz <sameo@linux.intel.com>
>
> We can now safely turn all TCG dependent build off when CONFIG_TCG is
> off. This allows building ARM binaries with --disable-tcg.
>
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Robert Bradford <robert.bradford@intel.com>
> [PMD: Rebased]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>
> We can also use:
>
>   ifeq ($(CONFIG_TCG),y)
>   ...
>   endif
>
> But long single line with macros from rules.mak are way easier to
> rebase. Now that this series is stable, I could change to ifeq if
> required.

Given you spent that time re-ordering stuff to keep it together I think
ifeq for blocks would be better. Some commentary in the Makefile.objs so
people know where to put their new files would also help.

>
>  target/arm/Makefile.objs | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
> index 5f3f965cc6..b8aa9c032a 100644
> --- a/target/arm/Makefile.objs
> +++ b/target/arm/Makefile.objs
> @@ -3,7 +3,7 @@ obj-y +=3D cpu.o helper.o gdbstub.o
>  obj-$(TARGET_AARCH64) +=3D cpu64.o gdbstub64.o
>
>  obj-$(CONFIG_SOFTMMU) +=3D machine.o arch_dump.o monitor.o arm-powerctl.o
> -obj-$(CONFIG_SOFTMMU) +=3D psci.o
> +obj-$(call land,$(CONFIG_TCG),$(CONFIG_SOFTMMU)) +=3D psci.o
>
>  obj-$(CONFIG_KVM) +=3D kvm.o
>  obj-$(call land,$(CONFIG_KVM),$(call lnot,$(TARGET_AARCH64))) +=3D kvm32=
.o
> @@ -31,12 +31,12 @@ target/arm/translate-sve.o: target/arm/decode-sve.inc=
.c
>  target/arm/translate.o: target/arm/decode-vfp.inc.c
>  target/arm/translate.o: target/arm/decode-vfp-uncond.inc.c
>
> -obj-y +=3D translate.o op_helper.o
> -obj-y +=3D crypto_helper.o
> -obj-y +=3D iwmmxt_helper.o vec_helper.o
> -obj-y +=3D neon_helper.o vfp_helper.o
> -obj-$(call lor,$(CONFIG_USER_ONLY),$(CONFIG_ARM_V7M)) +=3D v7m_helper.o
> +obj-$(CONFIG_TCG) +=3D translate.o op_helper.o
> +obj-$(CONFIG_TCG) +=3D crypto_helper.o
> +obj-$(CONFIG_TCG) +=3D iwmmxt_helper.o vec_helper.o
> +obj-$(CONFIG_TCG) +=3D neon_helper.o vfp_helper.o
> +obj-$(call lor,$(CONFIG_USER_ONLY),$(call land,$(CONFIG_TCG),$(CONFIG_AR=
M_V7M))) +=3D v7m_helper.o
>
> -obj-$(TARGET_AARCH64) +=3D translate-a64.o helper-a64.o
> -obj-$(TARGET_AARCH64) +=3D translate-sve.o sve_helper.o
> -obj-$(TARGET_AARCH64) +=3D pauth_helper.o
> +obj-$(call land,$(CONFIG_TCG),$(TARGET_AARCH64)) +=3D translate-a64.o he=
lper-a64.o
> +obj-$(call land,$(CONFIG_TCG),$(TARGET_AARCH64)) +=3D translate-sve.o sv=
e_helper.o
> +obj-$(call land,$(CONFIG_TCG),$(TARGET_AARCH64)) +=3D pauth_helper.o


--
Alex Benn=C3=A9e
