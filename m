Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id j15sm446965ejx.199.2022.02.04.01.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 01:27:59 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 777271FFB7;
	Fri,  4 Feb 2022 09:27:58 +0000 (GMT)
References: <20220203155304.2648009-1-valentinghita@google.com>
 <87tudfsv80.fsf@linaro.org>
 <CAKddhtYyZrEFveatS-o1YORdrUa-o53fBe3kwo9RVjXB2ovpyw@mail.gmail.com>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Valentin Ghita <valentinghita@google.com>
Cc: qemu-devel@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Peter
 Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: Re: [PATCH] armv7m_nvic: set DHCSR.DEBUGEN when debugger is attached
Date: Fri, 04 Feb 2022 09:17:26 +0000
In-reply-to: <CAKddhtYyZrEFveatS-o1YORdrUa-o53fBe3kwo9RVjXB2ovpyw@mail.gmail.com>
Message-ID: <87czk3rnfl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: GdZw0RgjEZxI


Valentin Ghita <valentinghita@google.com> writes:

> On Thu, Feb 3, 2022 at 7:42 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>
>  Valentin Ghita <valentinghita@google.com> writes:
>
>  > The DEBUGEN bit is set by the debugger when it is connected to the
>  > core.  Software can use this bit to check if a debug session is active.
>  >
>  > Add a function in gdbstub to check if the debugger is attached to a CPU
>  > and use this information when the DHCSR register is read in armv7m_nvi=
c.
>  >
>  > Signed-off-by: Valentin Ghita <valentinghita@google.com>
>
>  Nack - use of the gdbstub should be transparent to the guest. It is not
>  trying to model any real JTAG/External debug hardware here.
>
> The goal was to support the following piece of code:
>
> if (DHCSR.C_DEBUGEN) {
>     __asm ("bkpt");
> }
>=20=20
> And I have another patch which handles the bkpt exception when the DEBUGEN
> bit is set, by interrupting the CPU.
>
> Any suggestions on how we can achieve this?

Assuming you are happy for the device to act as though a external
debugger is attached regardless of the gdbstub state you could use a CPU
property on the command line to enable this behaviour. We have some
examples for SVE for the 64 bit CPUs (see object_property_add for
sve-max-vq). So something like:

  -cpu cortex-m3,dhscr=3Dtrue

You would probably want to model the behaviour of DHSCR.C_HALT as well
because that is something the core might do to itself if it detects it
is running under debug.

For completeness you might want to model the read values from the point
of view of the gdbstub although it wouldn't provide any view into the
system you can't already see as far as I can tell.

>
> Thank you,
> Valentin.
>
>  > ---
>  >  gdbstub.c              | 10 ++++++++++
>  >  hw/intc/armv7m_nvic.c  |  4 ++++
>  >  include/exec/gdbstub.h |  6 ++++++
>  >  3 files changed, 20 insertions(+)
>  >
>  > diff --git a/gdbstub.c b/gdbstub.c
>  > index 3c14c6a038..d4e39db8e7 100644
>  > --- a/gdbstub.c
>  > +++ b/gdbstub.c
>  > @@ -3585,6 +3585,16 @@ int gdbserver_start(const char *device)
>  >      return 0;
>  >  }
>  >=20=20
>  > +bool gdb_attached(CPUState *cpu)
>  > +{
>  > +    GDBProcess *process =3D gdb_get_cpu_process(cpu);
>  > +    if (process !=3D NULL) {
>  > +        return process->attached;
>  > +    }
>  > +
>  > +    return false;
>  > +}
>  > +
>  >  static void register_types(void)
>  >  {
>  >      type_register_static(&char_gdb_type_info);
>  > diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
>  > index 13df002ce4..d6fff94bca 100644
>  > --- a/hw/intc/armv7m_nvic.c
>  > +++ b/hw/intc/armv7m_nvic.c
>  > @@ -21,6 +21,7 @@
>  >  #include "sysemu/runstate.h"
>  >  #include "target/arm/cpu.h"
>  >  #include "exec/exec-all.h"
>  > +#include "exec/gdbstub.h"
>  >  #include "exec/memop.h"
>  >  #include "qemu/log.h"
>  >  #include "qemu/module.h"
>  > @@ -1510,6 +1511,9 @@ static uint32_t nvic_readl(NVICState *s, uint32_=
t offset, MemTxAttrs attrs)
>  >          }
>  >          /* We provide minimal-RAS only: RFSR is RAZ/WI */
>  >          return 0;
>  > +    case 0xdf0: /* DHCSR */
>  > +        /* Bit 0: DEBUGEN. */
>  > +        return gdb_attached(CPU(cpu)) ? 1 : 0;
>  >      case 0xf34: /* FPCCR */
>  >          if (!cpu_isar_feature(aa32_vfp_simd, cpu)) {
>  >              return 0;
>  > diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
>  > index a024a0350d..383f4e5224 100644
>  > --- a/include/exec/gdbstub.h
>  > +++ b/include/exec/gdbstub.h
>  > @@ -177,6 +177,12 @@ static inline uint8_t * gdb_get_reg_ptr(GByteArra=
y *buf, int len)
>  >   */
>  >  int gdbserver_start(const char *port_or_device);
>  >=20=20
>  > +/**
>  > + * gdb_attached: check if GDB is attached to a given CPU.
>  > + * @cpu: the CPU to check if GDB is attached to.
>  > + */
>  > +bool gdb_attached(CPUState *cpu);
>  > +
>  >  /**
>  >   * gdb_has_xml:
>  >   * This is an ugly hack to cope with both new and old gdb.
>
>  --=20
>  Alex Benn=C3=A9e


--=20
Alex Benn=C3=A9e
