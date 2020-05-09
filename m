Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1278099lfb;
        Sat, 9 May 2020 13:01:42 -0700 (PDT)
X-Received: by 2002:a05:6402:d0a:: with SMTP id eb10mr7193433edb.60.1589054502775;
        Sat, 09 May 2020 13:01:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589054502; cv=none;
        d=google.com; s=arc-20160816;
        b=UemPmD3ns8JjLnghjXjtucYj5ux08H2TmaoR6oMu4xAA+cy8hnJ+c2SfoFh3ugmJDM
         0oThppQ2YVRffarshUMHffGe5vHGevsQ82aQqhFUuMYpbs4bDAA29+HIV8dxZ/0vMN4f
         iqB6+JRiRWl72mxg4Ri+4ew0jf5h67rCMxWpggIGgfn2Q0pcYNJhV1bBYNc/JsWYZfm8
         hetdoR2nnviy1tzFbE0bzqf9T4qilDliy+dY/BbQ5nbuLbylfUe0WsMfFunks7b64R0Z
         Std5ApoKXHZv4ihPrvAX3MYRmJcGKmHqp1p5roIMZMwvAEefWgJ53cdaLsCzep2KE7DU
         aXAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=OxfL0UPSJno+2EUjjhpNsjBaPYzXLE/oZ40gfSPjXpE=;
        b=FYd3sANF55vfjkv7CYe+unAYJ4K3JTAlxzIFzg4Lgq1W3L//QpHhlqFMWl5olDuRjD
         0C2N3pq4Ew8gBO2zk+RJs1enkwFiDbR8C1z+ebcTuSu6HfqHpkMNKPSOz1czXZsQh6wy
         Pua6gh1xT6aFIzXDs3k9QUpowRVvUTJ0hgarO5B5d0x/IlpckrKamoLpjCwPv+gWqc5y
         adjiTwzG+4jwMOXPRQ6nAz1nOQeCAwW9y8EzUXh7ITXj+Behf1vURVkx/9Woi2SIxoRX
         0JKwtYLCggCo8ucQjJGUF1B824A8HucUkBEGg5wmO7lDPZuwm9UirT8ERutzkJFU0EG0
         DrhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s24sor5004536edc.7.2020.05.09.13.01.42
        (Google Transport Security);
        Sat, 09 May 2020 13:01:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OxfL0UPSJno+2EUjjhpNsjBaPYzXLE/oZ40gfSPjXpE=;
        b=lCoWXini1YBzGC7FFgkl+NXQbvpnfAULORVBPdgzVN+YGUtL4bV0mwzsm/5blXJ/sO
         KFYZWkDGcgnX65RvushcAZ1aPmwEsf/Kv5drIaW9nh7Z52UDYD+bX9QtAFUMHFghc6G8
         2J5HflYW9AjCvq4UM9EQ9fRmmxZJVHmQpVhAo0s/FgWivrGEXTXZBriHAxvQyDs/cYZX
         AedF//leF3oco0snqbsZwVAjNPNWrktYRzLr2ni69eoLDAZcysbF96+Q2cICQhAfy+YT
         XKDYqPssrrbI6htJxozcMAzTLkUv9EvAzt99xhLUI5x4heUNGsIY70AvuDFmbEolva47
         2XOA==
X-Gm-Message-State: AGi0Pubc0qXzGc1+xL4Pi5+nX1759ZUxOuf6PFjqm+aV06FVpx/AbD1J
	B7DaiYUC5bxN8bn6fPtPRq97NKqkTbuvGQJOPyA=
X-Google-Smtp-Source: APiQypJmeQftIJvvC+BxNCOoNrPcjZ7VoK69GaJv7Xj8mt5c1GYVfjptAJTsW9Qjjj70Cf+t1v5R70xJENcn/VmWzyA=
X-Received: by 2002:a50:c3c2:: with SMTP id i2mr7108561edf.93.1589054502343;
 Sat, 09 May 2020 13:01:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200509130910.26335-1-f4bug@amsat.org> <20200509130910.26335-10-f4bug@amsat.org>
 <ba3d3ba1-09bf-17a0-2116-549fa92e1ed6@amsat.org>
In-Reply-To: <ba3d3ba1-09bf-17a0-2116-549fa92e1ed6@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Sat, 9 May 2020 22:01:30 +0200
Message-ID: <CAAdtpL5KT0H3+yVRgzCwVaLYUUSCBW8vK4X3cHX_N91NPkUFBg@mail.gmail.com>
Subject: Re: [PATCH 09/11] target/cpu: Restrict handlers using hwaddr type to system-mode
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
	Eduardo Habkost <ehabkost@redhat.com>
Cc: Chris Wulff <crwulff@gmail.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	David Hildenbrand <david@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
	Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, 
	"qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>, Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>, 
	David Gibson <david@gibson.dropbear.id.au>, Artyom Tarasenko <atar4qemu@gmail.com>, 
	"open list:vfio-ccw" <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Stafford Horne <shorne@gmail.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Richard Henderson <rth@twiddle.net>, "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Cornelia Huck <cohuck@redhat.com>, 
	Roman Bolshakov <r.bolshakov@yadro.com>, Laurent Vivier <laurent@vivier.eu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: NgKtYeo5pHho

On Sat, May 9, 2020 at 6:08 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
> On 5/9/20 3:09 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > Restrict the following handlers to system-mode:
> > - do_unaligned_access
> > - do_transaction_failed
> > - get_phys_page_debug
> > - get_phys_page_attrs_debug
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
> >   include/hw/core/cpu.h           |  8 +++++---
> >   target/alpha/cpu.h              |  4 +++-
> >   target/arm/cpu.h                |  6 +++---
> >   target/arm/internals.h          |  4 ++++
> >   target/cris/cpu.h               |  2 ++
> >   target/hppa/cpu.h               |  2 +-
> >   target/i386/cpu.h               |  2 ++
> >   target/m68k/cpu.h               |  7 ++++++-
> >   target/microblaze/cpu.h         |  5 ++++-
> >   target/mips/internal.h          |  2 +-
> >   target/nios2/cpu.h              |  5 ++++-
> >   target/openrisc/cpu.h           |  3 ++-
> >   target/ppc/cpu.h                |  2 +-
> >   target/riscv/cpu.h              | 20 ++++++++++----------
> >   target/sh4/cpu.h                |  2 +-
> >   target/sparc/cpu.h              |  2 ++
> >   target/xtensa/cpu.h             | 12 +++++++-----
> >   target/hppa/cpu.c               |  4 +++-
> >   target/ppc/translate_init.inc.c |  2 +-
> >   19 files changed, 62 insertions(+), 32 deletions(-)
> >
> > diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> > index 5bf94d28cf..ed09d056d1 100644
> > --- a/include/hw/core/cpu.h
> > +++ b/include/hw/core/cpu.h
> > @@ -167,6 +167,7 @@ typedef struct CPUClass {
> >       int reset_dump_flags;
> >       bool (*has_work)(CPUState *cpu);
> >       void (*do_interrupt)(CPUState *cpu);
> > +#ifndef CONFIG_USER_ONLY
>
> I forgot once Peter Maydell told me we can't do that for some reason I
> don't remember.
>
> At least this changes the sizeof(CPUClass), so we get:
>
> qom/object.c:315:type_initialize: assertion failed: (parent->class_size
> <=3D ti->class_size)
>
> So we can't poison the hwaddr type? (final patch of this series).

Well, this works...:

-- >8 --
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -167,6 +167,7 @@ typedef struct CPUClass {
     int reset_dump_flags;
     bool (*has_work)(CPUState *cpu);
     void (*do_interrupt)(CPUState *cpu);
+#ifndef CONFIG_USER_ONLY
     void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
                                 MMUAccessType access_type,
                                 int mmu_idx, uintptr_t retaddr);
@@ -174,6 +175,12 @@ typedef struct CPUClass {
                                   unsigned size, MMUAccessType access_type=
,
                                   int mmu_idx, MemTxAttrs attrs,
                                   MemTxResult response, uintptr_t retaddr)=
;
+    hwaddr (*get_phys_page_debug)(CPUState *cpu, vaddr addr);
+    hwaddr (*get_phys_page_attrs_debug)(CPUState *cpu, vaddr addr,
+                                        MemTxAttrs *attrs);
+#else
+    void (*reserved[4])(CPUState *cpu, ...);
+#endif /* CONFIG_USER_ONLY */
     bool (*virtio_is_big_endian)(CPUState *cpu);
     int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
                            uint8_t *buf, int len, bool is_write);
@@ -189,9 +196,6 @@ typedef struct CPUClass {
     bool (*tlb_fill)(CPUState *cpu, vaddr address, int size,
                      MMUAccessType access_type, int mmu_idx,
                      bool probe, uintptr_t retaddr);
-    hwaddr (*get_phys_page_debug)(CPUState *cpu, vaddr addr);
-    hwaddr (*get_phys_page_attrs_debug)(CPUState *cpu, vaddr addr,
-                                        MemTxAttrs *attrs);
     int (*asidx_from_attrs)(CPUState *cpu, MemTxAttrs attrs);
     int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg);
     int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
---

Ugly?

>
> >       void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
> >                                   MMUAccessType access_type,
> >                                   int mmu_idx, uintptr_t retaddr);
> > @@ -174,6 +175,10 @@ typedef struct CPUClass {
> >                                     unsigned size, MMUAccessType access=
_type,
> >                                     int mmu_idx, MemTxAttrs attrs,
> >                                     MemTxResult response, uintptr_t ret=
addr);
> > +    hwaddr (*get_phys_page_debug)(CPUState *cpu, vaddr addr);
> > +    hwaddr (*get_phys_page_attrs_debug)(CPUState *cpu, vaddr addr,
> > +                                        MemTxAttrs *attrs);
> > +#endif /* CONFIG_USER_ONLY */
> >       bool (*virtio_is_big_endian)(CPUState *cpu);
> >       int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
> >                              uint8_t *buf, int len, bool is_write);
> > @@ -189,9 +194,6 @@ typedef struct CPUClass {
> >       bool (*tlb_fill)(CPUState *cpu, vaddr address, int size,
> >                        MMUAccessType access_type, int mmu_idx,
> >                        bool probe, uintptr_t retaddr);
> > -    hwaddr (*get_phys_page_debug)(CPUState *cpu, vaddr addr);
> > -    hwaddr (*get_phys_page_attrs_debug)(CPUState *cpu, vaddr addr,
> > -                                        MemTxAttrs *attrs);
> >       int (*asidx_from_attrs)(CPUState *cpu, MemTxAttrs attrs);
> >       int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg)=
;
> >       int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
> [...]
