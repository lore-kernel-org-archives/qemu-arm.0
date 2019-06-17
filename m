Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id y44sm11200461wrd.13.2019.06.17.04.37.34
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 04:37:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id DB9761FF87;
	Mon, 17 Jun 2019 12:37:33 +0100 (BST)
References: <20190615154352.26824-1-philmd@redhat.com> <20190615154352.26824-4-philmd@redhat.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v2 03/23] target/arm: Makefile cleanup (KVM)
In-reply-to: <20190615154352.26824-4-philmd@redhat.com>
Date: Mon, 17 Jun 2019 12:37:33 +0100
Message-ID: <878su0bfya.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: AUVRL1EnZBNq


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Group KVM objects together.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/Makefile.objs | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
> index 3269dda613..626e340f55 100644
> --- a/target/arm/Makefile.objs
> +++ b/target/arm/Makefile.objs
> @@ -1,14 +1,15 @@
>  obj-y +=3D arm-semi.o
>  obj-$(CONFIG_SOFTMMU) +=3D machine.o psci.o arch_dump.o monitor.o
> -obj-$(CONFIG_KVM) +=3D kvm.o
> -obj-$(call land,$(CONFIG_KVM),$(call lnot,$(TARGET_AARCH64))) +=3D kvm32=
.o
> -obj-$(call land,$(CONFIG_KVM),$(TARGET_AARCH64)) +=3D kvm64.o
> -obj-$(call lnot,$(CONFIG_KVM)) +=3D kvm-stub.o
>  obj-y +=3D helper.o cpu.o
>  obj-y +=3D gdbstub.o
>  obj-$(TARGET_AARCH64) +=3D cpu64.o gdbstub64.o
>  obj-$(CONFIG_SOFTMMU) +=3D arm-powerctl.o
>
> +obj-$(CONFIG_KVM) +=3D kvm.o
> +obj-$(call land,$(CONFIG_KVM),$(call lnot,$(TARGET_AARCH64))) +=3D kvm32=
.o
> +obj-$(call land,$(CONFIG_KVM),$(TARGET_AARCH64)) +=3D kvm64.o
> +obj-$(call lnot,$(CONFIG_KVM)) +=3D kvm-stub.o
> +
>  DECODETREE =3D $(SRC_PATH)/scripts/decodetree.py
>
>  target/arm/decode-sve.inc.c: $(SRC_PATH)/target/arm/sve.decode $(DECODET=
REE)


--
Alex Benn=C3=A9e
