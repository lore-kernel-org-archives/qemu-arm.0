Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C71CA600A
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 08:19:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEMri-00061c-3k; Wed, 07 Oct 2026 04:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1xEHDY-0002V7-Ez
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 22:17:39 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1xEHDQ-0006Sp-MM
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 22:17:14 -0400
Received: by mail-qt1-x829.google.com with SMTP id
 d75a77b69052e-53391786e55so17699611cf.2
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 19:12:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791339159; cv=none;
 d=google.com; s=arc-20260327;
 b=LuoabTA0piBBUInvaOl/yJ4qp1J7tx72o/roavcYTZ4Kqiv6yGVP7DUF9x5dvF7uos
 0+fNSzyzSdW9jmhSs0YQmLCK3wmXPlOzT/kRQdlR9d88ILynm9iQptQhDQFWk4Ar8OfP
 T2PujQNaKGyQccyVBuMrpZT1QAb/Y93rqgMKRiD1buxZ2DXYIGOURNjJ2jdN+YhhBveF
 7zygtYH1BFpT93KjfR/ahsERfdkwAwPjm9bVEHK3sIkZHPpH5qMicmplObRrE5yxGPMJ
 Sm788+2iP9xH12lR8NGSYjRgsOdF1xnz4F8jTVn++p0TkThkHHQU5RKN94+4vMGA+Dmq
 oOtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=vCUogBX76A4PNkRqpBF2c8Vgx8g3b73735jcch5yTeY=;
 fh=kTgBFPgNvKaUWYyflk94ve6c3IOdcknQKHQ6/Z3FC8Y=;
 b=WaO8k4A+P0KbUlWu/TbN+LFFqMFemmEjcMJDRfIgocDpoYBR6pc3+B+wDoXJR9gkyn
 JoeKIQKPDWhtH1jmLuFAY/9+Al5hOvr/cYyVhXafFCgrrCjhX2VVzaCv6pYYvoPar//O
 2J/bKzs4WSu0E8wL5lXhEU5zyRy3YX2luMRxsR14tF6V6epUmdl3af73BCo9uXz363FZ
 K2Gw4SVIaTBQ+E3BWOwSgo4twXXaKWKAITGR5tLhlK0GIo3n/5jDvmtHRIGtsQQJ6d9o
 e52C3dwkRr+fzP2bWSexxbNA38uPdrGfmF49l9jNBkZGPkLoSDPkQaJ0JMRhgGdMgEUO
 ZPrQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1791339159; x=1791943959; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=vCUogBX76A4PNkRqpBF2c8Vgx8g3b73735jcch5yTeY=;
 b=K6eAuhDHSRlq3tSSRCabXNxktpAq20s4Vd4tXI+VMH2HHDThcM/oxtmaKVt0nhsqtx
 bGlyji1OR3CDZLY3HVMOUZeuG9lHbpNAmKEHkrK3K9Ag3nt/gwl+n6VacL31SXnGfRf4
 OkndZ3V+U1LsbrZ4dwdlNstR5onvpGrA0eYFNIG9uQk1tOakjofbQ9wp34egUx4qe1KG
 yjQxlvLnTducq4ZfbFN/g8960jStYQjUKti2HSSgGXRpiutvHM6QTLXlJXieybacIr/i
 nyzC7eg7/iStRGIiGdNS/QJ9J0NeCW4729REm/NzIysHILrMI4gioUe5UQq3iXb/wXuP
 JhvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791339159; x=1791943959;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=vCUogBX76A4PNkRqpBF2c8Vgx8g3b73735jcch5yTeY=;
 b=qsW9Udtu/MyfMiCKj//DKmOHbNso/b0s/DHgDZRnbJncayBPgNB7BYig83UoySAXPQ
 TBbVC1EdZnu8KyGkvzNlHSaMOGmtxfd9vs3hS7txSJrvqkpDdFuy08xbumzOHsKpDKqJ
 n65rFyrUFyIi4dQbktGf3dxdDRzHJhQGD9bJWQkchVXr/2Ahkg1AKfkkURF+vPkIiJ0D
 I6UTEm/junArlY4+HG5F4nol0hkcg1FQcZ1yowDwSOWr0IdNgL3CfEssXiQ/+bC75H+k
 KgkO/OZzGl9njOdAT8YCcgWRuXBRAwUo0l7myzZpHgO6KNpo0F/7N/qLJ0DuB4o6lZ7/
 i1Kg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxjYeBtNV+CM2FKIAtijR9Wngh7XF336hZML4hCjM87wZGGjUu+aoL2w3PsB1uJv2UuVYuY89mRqQ==@nongnu.org
X-Gm-Message-State: AFuF++mTzzpXEKlObJEH8bk17bb5qLdT8ec5gZoHxr9BTuxBwSSOAgVL
 u6ujQ+kRlJglUT6/8gwK/cUUfM4UM6ljj9eWrepWDDEaP/gyi9V4JLs4lovPtBB+wY8BxJchSf5
 NzMv2JgsO5rL5LaA11M63eTo3D2T7A7xCjZRf
X-Gm-Gg: AYBFou3j81/qSYXMYqdv/+fYmmx+wn/XnNC4jh98u7YWQaLh1zjG17wMB2VvS0b9a//
 vhpBrubzYM75j4icyjhrdLSrMR+8Cbp/W0wOSetP52ZqXqm3Iz1Pmh1h9aFkFFksMXtfdG5stZp
 9Y1and0QP/JTOQven1Apc6ef+O9oS1kDyvw+meQ5bvHklsbVq1celAKz2IOsxpgREVDwjbH2UBt
 Ty6IPS+5fnS/7VfV72dy9duon5KmCxZk2gSVMZsMpry5NmVxOHGh1UTBiymirqjC3o0qytatEMd
 pVnL+CZ7UzGHeWsKx5jm5rgPIhmr/4oZmFQkP9RnFOKa5fP5MvOxwQPWw+mc8FSQEjeo5gKsQe5
 avots4H90MCM=
X-Received: by 2002:a05:693c:83d9:10b0:343:80af:5ab0 with SMTP id
 5a478bee46e88-3514e3285e3mr1583202eec.25.1791297111054; Tue, 06 Oct 2026
 07:31:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260911-query-reg-v1-0-0c04f0c02cf3@redhat.com>
 <1b9d9cef-8f65-4e96-9e7b-fd136f64a75d@oss.qualcomm.com>
 <33ad7803-82ad-49f0-b39d-d3a23807ab75@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <33ad7803-82ad-49f0-b39d-d3a23807ab75@rsg.ci.i.u-tokyo.ac.jp>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 6 Oct 2026 18:31:38 +0400
X-Gm-Features: AclHuK-kbtdLOIWlDva4Svd6YVmMvahlYS-c4-tOA45DeYixouliCXuXbbxC1Rc
Message-ID: <CAJ+F1C+0A4_VU3aNk=fWwvR=MPbe3Zw2zyeFnyCGmJET6fAoKg@mail.gmail.com>
Subject: Re: [PATCH 00/10] monitor/hmp: replace MonitorDef with GDB registers
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dave@treblig.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Chinmay Rath <rathc@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, 
 Glenn Miles <milesg@linux.ibm.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Helge Deller <deller@gmx.de>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qt1-x829.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Akihiko

On Thu, Oct 1, 2026 at 12:03=E2=80=AFPM Akihiko Odaki
<odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
>
> On 2026/10/01 2:18, Philippe Mathieu-Daud=C3=A9 wrote:
> > Cc'ing Akihiko who worked on gdbstub.
> >
> > On 11/9/26 14:27, Marc-Andr=C3=83=C2=A9 Lureau wrote:
> >> Hi,
> >>
> >> HMP monitor supports printing $register expression. The lookup
> >> was done via GDB stub registers, and supplementary MonitorDef
> >> HMP-specific tables.
> >>
> >> Migrate HMP registers to use the GDB infrastructure and remove the
> >> legacy HMP MonitorDef. Use a "qemu-debug" register group, as they are
> >> aliases or synthetic registers, but gdb doesn't seem to care.
>
> Unfortunately, these aliases and synthetic registers appear to have
> several problems:
>
> - GDB already provides writable pseudo-registers for SPARC64's asi and
>    pstate. The new QEMU registers shadow them but ignore writes, breaking
>    previously supported functionality. See:
>
> https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dblob;f=3Dgdb/sparc64=
-tdep.c;h=3D93db3417a2a9f64790acab33288eb05764112e0b;hb=3D6a5e5259790e5a854=
ddbb69eb486b9245fcfeee8#l976
>
> - GDB caches each raw register independently. Updating one alias can
>    leave another stale, causing incorrect reads or skipped writes.
>
> - The new raw aliases do not inherit the original registers' unwind
>    rules, leading to incorrect register values when selecting older
>    call frames.
>
> The latter two issues also affect the RISC-V aliases and cannot be
> resolved merely by changing QEMU's register read/write callbacks. I
> therefore think we need to retain HMP-specific handling for these aliases=
.

Thanks for the feedback and findings! Would it be an option to have
qemu/pseudo registers use a prefixed name like "qemu.", then it
shouldn't conflict with GDB. HMP would need to try with it if not
found. Wdyt?

Alternatively, keep the monitor specific register lookup, as a secondary pa=
th.

> Regards,
> Akihiko Odaki
>
> >>
> >> Known behavioural changes on RISC-V: CSR lookup is now case-sensitive
> >> and vector registers now report "unkown register" instead of a
> >> target-specific message ("Unable to print the value of vector vreg 'v0=
'
> >> from this API")
> >>
> >> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >> ---
> >> Marc-Andr=C3=A9 Lureau (10):
> >>        hmp: don't crash on invalid register
> >>        gdbstub: fix next register base after register gaps
> >>        gdbstub: set feature->base_reg for dynamic features
> >>        target/i386: expose segment limits via GDB
> >>        monitor/hmp: add CPUClass::get_pc fallback for HMP $pc
> >>        target/m68k: expose system registers via GDB
> >>        target/sparc64: expose system registers via GDB
> >>        target/riscv: bypass smstateen check in debugger mode
> >>        target/riscv: expose register aliases via GDB
> >>        monitor/hmp: remove legacy MonitorDef infrastructure
> >>
> >>   configs/targets/i386-softmmu.mak          |   2 +-
> >>   configs/targets/m68k-softmmu.mak          |   2 +-
> >>   configs/targets/riscv32-linux-user.mak    |   2 +-
> >>   configs/targets/riscv32-softmmu.mak       |   2 +-
> >>   configs/targets/riscv64-bsd-user.mak      |   2 +-
> >>   configs/targets/riscv64-linux-user.mak    |   2 +-
> >>   configs/targets/riscv64-softmmu.mak       |   2 +-
> >>   configs/targets/sparc64-softmmu.mak       |   2 +-
> >>   configs/targets/x86_64-softmmu.mak        |   2 +-
> >>   gdbstub/gdb-xml/i386-segments.xml         |  14 +++
> >>   gdbstub/gdb-xml/m68k-system.xml           |  32 +++++++
> >>   gdbstub/gdb-xml/riscv-32bit-alias.xml     | 105 ++++++++++++++++++++=
++
> >>   gdbstub/gdb-xml/riscv-32bit-fpu-alias.xml |  40 +++++++++
> >>   gdbstub/gdb-xml/riscv-64bit-alias.xml     | 105 ++++++++++++++++++++=
++
> >>   gdbstub/gdb-xml/riscv-64bit-fpu-alias.xml |  46 ++++++++++
> >>   gdbstub/gdb-xml/sparc64-system.xml        |  22 +++++
> >>   gdbstub/gdbstub.c                         |  14 +--
> >>   include/hw/core/cpu.h                     |   2 +-
> >>   include/hw/core/sysemu-cpu-ops.h          |  16 ----
> >>   include/monitor/hmp.h                     |   6 --
> >>   include/qemu/typedefs.h                   |   1 -
> >>   monitor/hmp.c                             |  52 ++---------
> >>   target/arm/gdbstub.c                      |   8 +-
> >>   target/arm/gdbstub64.c                    |  10 ++-
> >>   target/i386/cpu.c                         |  32 -------
> >>   target/i386/gdbstub.c                     |  24 +++++
> >>   target/m68k/cpu.c                         |  22 -----
> >>   target/m68k/helper.c                      |  47 ++++++++++
> >>   target/ppc/gdbstub.c                      |   2 +-
> >>   target/riscv/cpu.c                        |   1 -
> >>   target/riscv/gdbstub.c                    |  52 ++++++++++-
> >>   target/riscv/internals.h                  |   3 -
> >>   target/riscv/monitor.c                    | 140
> >> ------------------------------
> >>   target/riscv/tcg/csr.c                    |   3 +-
> >>   target/sparc/cpu.c                        |  19 ----
> >>   target/sparc/gdbstub.c                    |  38 ++++++++
> >>   target/xtensa/cpu.c                       |   2 +-
> >>   37 files changed, 562 insertions(+), 314 deletions(-)
> >> ---
> >> base-commit: 209b2afaface001c7d4d981e38f186afe7b24a50
> >> change-id: 20260910-query-reg-80cd59cf4707
> >>
> >> Best regards,
> >> --
> >> Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >>
> >>
> >
>
>

