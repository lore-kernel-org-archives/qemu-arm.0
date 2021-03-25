Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id r25sm3165003edv.78.2021.03.25.12.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 12:47:14 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3633B1FF7E;
	Thu, 25 Mar 2021 19:47:14 +0000 (GMT)
References: <20210323041238.133835-1-shashi.mallela@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Shashi Mallela <shashi.mallela@linaro.org>
Cc: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v1 0/8] GICv3 LPI and ITS feature implementation
Date: Thu, 25 Mar 2021 19:44:44 +0000
In-reply-to: <20210323041238.133835-1-shashi.mallela@linaro.org>
Message-ID: <87k0pv10e5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: OBI3njzlFnEu


Shashi Mallela <shashi.mallela@linaro.org> writes:

> This patchset implements qemu device model for enabling physical
> LPI support and ITS functionality in GIC as per GICv3 specification.
> Both flat table and 2 level tables are implemented.The ITS commands
> for adding/deleting ITS table entries,trigerring LPI interrupts are=20
> implemented.Translated LPI interrupt ids are processed by redistributor
> to determine priority and set pending state appropriately before
> forwarding the same to cpu interface.
> The ITS feature support has been added to sbsa-ref platform as well as
> virt platform,wherein the emulated functionality co-exists with kvm
> kernel functionality.

OK I've finished my first pass. I didn't want to keep repeating myself
with the later patches. So in summary:

  - use REG/FIELD to avoid the manual mask definition/manipulation
  - define registers in the patch that first uses them
  - check LOG_UNIMP vs LOG_GUEST_ERROR (and possibly assert if it
    shouldn't happen)
  - and of course pass the kvm-unit-tests ITS tests ;-)=20

Thanks,

>
> Shashi Mallela (8):
>   hw/intc: GICv3 ITS initial framework
>   hw/intc: GICv3 ITS register definitions added
>   hw/intc: GICv3 ITS command queue framework
>   hw/intc: GICv3 ITS Command processing
>   hw/intc: GICv3 ITS Feature enablement
>   hw/intc: GICv3 redistributor ITS processing
>   hw/arm/sbsa-ref: add ITS support in SBSA GIC
>   hw/arm/virt: add ITS support in virt GIC
>
>  hw/arm/sbsa-ref.c                      |   26 +-
>  hw/arm/virt.c                          |   10 +-
>  hw/intc/arm_gicv3.c                    |    6 +
>  hw/intc/arm_gicv3_common.c             |   16 +
>  hw/intc/arm_gicv3_cpuif.c              |   15 +-
>  hw/intc/arm_gicv3_dist.c               |   22 +-
>  hw/intc/arm_gicv3_its.c                | 1417 ++++++++++++++++++++
>  hw/intc/arm_gicv3_its_common.c         |   17 +-
>  hw/intc/arm_gicv3_its_kvm.c            |    2 +-
>  hw/intc/arm_gicv3_redist.c             |  155 ++-
>  hw/intc/gicv3_internal.h               |  176 ++-
>  hw/intc/meson.build                    |    1 +
>  include/hw/intc/arm_gicv3_common.h     |   14 +
>  include/hw/intc/arm_gicv3_its_common.h |   12 +-
>  target/arm/kvm_arm.h                   |    4 +-
>  15 files changed, 1869 insertions(+), 24 deletions(-)
>  create mode 100644 hw/intc/arm_gicv3_its.c


--=20
Alex Benn=C3=A9e
