Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp482342ejc;
        Thu, 19 Jan 2023 09:06:16 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsBqrdZNz/s8uEwHiveuaP5dDRNrgpB74ycnnKb2552y4hLr8eqzWSamrd0G/F2ZkyYXBlf
X-Received: by 2002:a05:7500:1b1b:b0:f0:155f:194e with SMTP id dp27-20020a0575001b1b00b000f0155f194emr1065343gab.14.1674147976561;
        Thu, 19 Jan 2023 09:06:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674147976; cv=none;
        d=google.com; s=arc-20160816;
        b=JjuJ1nFOt1CfiUC67+xvYfL3FDxQCweNdwQ3hR9FuU7WJRleGQFB27nL4OfQ+V2Uns
         /joTPfSrAIKsf5OWiRa7U6it2/jMC7J2z6Hrt17ruWoIK2v7lo2DyiHRdIodFSX/hklG
         DEQP4SGP/bzW0442dS10Gb9Ege9D85s8ymavBmYF/kdaN3gj9K3+wGCzOGde3a+FpKwJ
         wthL7SGZRrh7st6ASNXm8GvCpm7W4fTj1yPf1Lan+NbQtfsgV9koUPe/1uVqn+4YYHGz
         OWretSBvYgBpQFjA9J6LpXEL1WyPvanas8cs8JLJJYV+wW3xmlgIEztWkPAEKynRN4T4
         RThw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=UWzOXCdUD+Yv36E2mlv+VtotmBAQjBl+l2LotWjHVjA=;
        b=IemfDUF5OwBMFwxBvCm9UVU+kyYTNxMxAYgQx4DMRAjLr5HexKPHLNgpT2u3ih1Bo/
         LsoYMP2JxomMkETYY89bzaqj/xS+LB8Oo20rsk7sTLu3HlsfEsnjcP8DZiGlcj+zLYV8
         xcPagx5xa/4axKJlW2y57YBqw+n6a7Z6iNj3M5fzociTZkOOW73VhCu5ioK7FbKs8/Ww
         EtTMuOBajGWvaHWpaaHSTbLSt+d4N/QUcNrA1iJYtTGfS0yHT5iD5BdBqW72ygn1wMqM
         CrD19QNypYPJUH7wa468h5fmN8ZwZcej7gxlvxysiCHQ9XXOPPn7E/k/xb9UfjDL8mdL
         kgVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20210112.gappssmtp.com header.s=20210112 header.b=R1NIPwYJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 68-20020a670447000000b003b07583dee2si9763511vse.430.2023.01.19.09.06.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 09:06:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20210112.gappssmtp.com header.s=20210112 header.b=R1NIPwYJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIYLp-0005Sv-Ad; Thu, 19 Jan 2023 12:05:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pIYLo-0005Se-AD
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 12:05:20 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pIYLj-0003ES-CZ
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 12:05:20 -0500
Received: by mail-ej1-x636.google.com with SMTP id hw16so7323431ejc.10
 for <qemu-arm@nongnu.org>; Thu, 19 Jan 2023 09:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UWzOXCdUD+Yv36E2mlv+VtotmBAQjBl+l2LotWjHVjA=;
 b=R1NIPwYJcR6Elf/6rW3ejwp5ziCMCJYLocxck6gCX8BGG+CF28/tcEPArXWgP9dDF9
 rpZbdV1SfV9ct2PowFaP5ToaPI6jPMEbW5bpk6sR5Qs5Rzj6V4N81DLYz/b+AyEi3nep
 OBejk4CYsxMNG50roOJ+VbkHXmAy5aEoTBPxDGrdSTBEzPXxRFXrbaTMMDuQn2frmjD+
 V/6OR8OvPWTxBCegSEvpfFHda3D99tbVi51fr1bTPR9TwZVRLu9/048ybTD3Xf3cI1iM
 0AqsKMSeVCX+JwULR5syFyFOH/4ZjIxopc36RH8C1X+Et/ThVaQDcbPtarZQi67ON4gu
 fZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UWzOXCdUD+Yv36E2mlv+VtotmBAQjBl+l2LotWjHVjA=;
 b=IaHDpuSs7bujrNPodUDZLPFSuCyn6C4qx7iGEPXkuscGS+lYQyDH7ePbj1kypFeZvx
 5DCRrBoGK9KOxlHjQo6XoFHO89BpfAWgMNQXDN7TseCSXjVFqDXoLTjr7VxbiJlfILpZ
 +bYgPWJk9FzUTIam56rwDCn8VX4Ven29r1JIcbpILAx4p+YREs3xuodnLkW+pytSnmhr
 JmTC27awEul/pa7J8B/d1splDSErWpFkdMOJl/sqsbgsOcJ7wqxXdpXsN7nTiknj5sNv
 n4uW2aWnAPjgVhGgjAXGgl90tj6xIU4i2GMr7Ic80gn7dw9ebS2EV2LJGZkePLHJ2Y6k
 ziJQ==
X-Gm-Message-State: AFqh2kp5laJ1zHm80GWqju7wP4+4c9TsPVeNZskpC5k6iRUZvzQyCSSW
 Fdr9f7khwKIH+eyns8xatC3vQLXgz70b6Ie9Ot0bDA==
X-Received: by 2002:a17:906:606:b0:877:60aa:7090 with SMTP id
 s6-20020a170906060600b0087760aa7090mr446024ejb.451.1674147912843; Thu, 19 Jan
 2023 09:05:12 -0800 (PST)
MIME-Version: 1.0
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-5-armbru@redhat.com>
 <CANCZdfrU4zVcepMj=B5EVUz-qhCDhMYDs+cYS5yfW1-G01PsbA@mail.gmail.com>
 <87r0vqpjbt.fsf@pond.sub.org>
In-Reply-To: <87r0vqpjbt.fsf@pond.sub.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 19 Jan 2023 10:05:01 -0700
Message-ID: <CANCZdfrLF6Lecrd9VLTu-iDGWFCUJRM1veMejE2oX3ZAVEMBjg@mail.gmail.com>
Subject: Re: [PATCH v4 04/19] bsd-user: Clean up includes
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, pbonzini@redhat.com, 
 kwolf@redhat.com, hreitz@redhat.com, kevans@freebsd.org,
 berrange@redhat.com, 
 groug@kaod.org, qemu_oss@crudebyte.com, mst@redhat.com, philmd@linaro.org, 
 peter.maydell@linaro.org, alistair@alistair23.me, jasowang@redhat.com, 
 jonathan.cameron@huawei.com, kbastian@mail.uni-paderborn.de, 
 quintela@redhat.com, dgilbert@redhat.com, michael.roth@amd.com, 
 kkostiuk@redhat.com, tsimpson@quicinc.com, palmer@dabbelt.com, 
 bin.meng@windriver.com, qemu-block@nongnu.org, qemu-arm@nongnu.org, 
 qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000a59ef205f2a0efeb"
Received-SPF: none client-ip=2a00:1450:4864:20::636;
 envelope-from=wlosh@bsdimp.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FG/dWgmztYzs

--000000000000a59ef205f2a0efeb
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 19, 2023 at 9:42 AM Markus Armbruster <armbru@redhat.com> wrote:

> Warner Losh <imp@bsdimp.com> writes:
>
> > On Thu, Jan 19, 2023 at 12:00 AM Markus Armbruster <armbru@redhat.com>
> > wrote:
> >
> >> Clean up includes so that osdep.h is included first and headers
> >> which it implies are not included manually.
> >>
> >> This commit was created with scripts/clean-includes.
> >>
> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> >> ---
> >>  bsd-user/bsd-proc.h               | 4 ----
> >>  bsd-user/qemu.h                   | 1 -
> >>  bsd-user/arm/signal.c             | 1 +
> >>  bsd-user/arm/target_arch_cpu.c    | 2 ++
> >>  bsd-user/freebsd/os-sys.c         | 1 +
> >>  bsd-user/i386/signal.c            | 1 +
> >>  bsd-user/i386/target_arch_cpu.c   | 3 +--
> >>  bsd-user/main.c                   | 4 +---
> >>  bsd-user/strace.c                 | 1 -
> >>  bsd-user/x86_64/signal.c          | 1 +
> >>  bsd-user/x86_64/target_arch_cpu.c | 3 +--
> >>  11 files changed, 9 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/bsd-user/bsd-proc.h b/bsd-user/bsd-proc.h
> >> index 68b66e571d..a1061bffb8 100644
> >> --- a/bsd-user/bsd-proc.h
> >> +++ b/bsd-user/bsd-proc.h
> >> @@ -20,11 +20,7 @@
> >>  #ifndef BSD_PROC_H_
> >>  #define BSD_PROC_H_
> >>
> >> -#include <sys/types.h>
> >> -#include <sys/stat.h>
> >> -#include <sys/time.h>
> >>  #include <sys/resource.h>
> >>
> >
> > Did you test this on FreeBSD 12? FreeBSD 13 has started to climb the hill
> > where all includes are independent, but much of that hasn't been merged
> to
> > 12 yet. sys/types.h, at least, is documented as a prereq for both
> > sys/stat.h and sys/resource.h.
> >
> > I know many of these are in os-dep.h, and I've had trouble in the
> bsd-user
> > fork with that and the layout of the code which has arguably way too much
> > in the .h files.
>
> No, I didn't test on FreeBSD 12.
>

OK. Fair enough. If it passes the CI tests, then it's likely fine (though
if I hit issues, I'll submit patches).


> Any .c must include qemu/osdep.h *first*.  Any further inclusions of
> headers qemu/osdep.h includes already are no-ops unless the headers in
> question lack multiple inclusion guards.
>

OK.


> > Also, why didn't you move sys/resource.h and other such files to
> os-dep.h?
> > I'm struggling to understand the rules around what is or isn't included
> > where?
>
> This series is "run scripts/clean-includes, split it into reviewable
> chunks, tidy up blank lines".  Moving more includes into qemu/osdep.h is
> out of scope.
>

OK. Fair point. I'm happy with that answer since it tells me I could move
things there too, if need be.


> I sympathize with your complaint that QEMU does too much in headers in
> general, and in qemu/osdep.h in particular.
>

Yea, I'm not entirely sure  it's a complaint, or if it's an observation of
difficulties relative to other code bases... I go back and forth on my
opinion of it...


> >> -#include <unistd.h>
> >>
> >>  /* exit(2) */
> >>  static inline abi_long do_bsd_exit(void *cpu_env, abi_long arg1)
> >> diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> >> index be6105385e..0ceecfb6df 100644
> >> --- a/bsd-user/qemu.h
> >> +++ b/bsd-user/qemu.h
> >> @@ -17,7 +17,6 @@
> >>  #ifndef QEMU_H
> >>  #define QEMU_H
> >>
> >> -#include "qemu/osdep.h"
> >>  #include "cpu.h"
> >>  #include "qemu/units.h"
> >>  #include "exec/cpu_ldst.h"
> >> diff --git a/bsd-user/arm/signal.c b/bsd-user/arm/signal.c
> >> index 2b1dd745d1..9734407543 100644
> >> --- a/bsd-user/arm/signal.c
> >> +++ b/bsd-user/arm/signal.c
> >> @@ -17,6 +17,7 @@
> >>   *  along with this program; if not, see <http://www.gnu.org/licenses/
> >.
> >>   */
> >>
> >> +#include "qemu/osdep.h"
> >>  #include "qemu.h"
> >>
> >>  /*
> >> diff --git a/bsd-user/arm/target_arch_cpu.c
> >> b/bsd-user/arm/target_arch_cpu.c
> >> index 02bf9149d5..fe38ae2210 100644
> >> --- a/bsd-user/arm/target_arch_cpu.c
> >> +++ b/bsd-user/arm/target_arch_cpu.c
> >> @@ -16,6 +16,8 @@
> >>   *  You should have received a copy of the GNU General Public License
> >>   *  along with this program; if not, see <http://www.gnu.org/licenses/
> >.
> >>   */
> >> +
> >> +#include "qemu/osdep.h"
> >>  #include "target_arch.h"
> >>
> >>  void target_cpu_set_tls(CPUARMState *env, target_ulong newtls)
> >> diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
> >> index 309e27b9d6..1676ec10f8 100644
> >> --- a/bsd-user/freebsd/os-sys.c
> >> +++ b/bsd-user/freebsd/os-sys.c
> >> @@ -17,6 +17,7 @@
> >>   *  along with this program; if not, see <http://www.gnu.org/licenses/
> >.
> >>   */
> >>
> >> +#include "qemu/osdep.h"
> >>  #include "qemu.h"
> >>  #include "target_arch_sysarch.h"
> >>
> >> diff --git a/bsd-user/i386/signal.c b/bsd-user/i386/signal.c
> >> index 5dd975ce56..a3131047b8 100644
> >> --- a/bsd-user/i386/signal.c
> >> +++ b/bsd-user/i386/signal.c
> >> @@ -17,6 +17,7 @@
> >>   *  along with this program; if not, see <http://www.gnu.org/licenses/
> >.
> >>   */
> >>
> >> +#include "qemu/osdep.h"
> >>  #include "qemu.h"
> >>
> >>  /*
> >> diff --git a/bsd-user/i386/target_arch_cpu.c
> >> b/bsd-user/i386/target_arch_cpu.c
> >> index d349e45299..2a3af2ddef 100644
> >> --- a/bsd-user/i386/target_arch_cpu.c
> >> +++ b/bsd-user/i386/target_arch_cpu.c
> >> @@ -17,9 +17,8 @@
> >>   *  along with this program; if not, see <http://www.gnu.org/licenses/
> >.
> >>   */
> >>
> >> -#include <sys/types.h>
> >> -
> >>  #include "qemu/osdep.h"
> >> +
> >>  #include "cpu.h"
> >>  #include "qemu.h"
> >>  #include "qemu/timer.h"
> >> diff --git a/bsd-user/main.c b/bsd-user/main.c
> >> index 6f09180d65..41290e16f9 100644
> >> --- a/bsd-user/main.c
> >> +++ b/bsd-user/main.c
> >> @@ -18,12 +18,10 @@
> >>   *  along with this program; if not, see <http://www.gnu.org/licenses/
> >.
> >>   */
> >>
> >> -#include <sys/types.h>
> >> -#include <sys/time.h>
> >> +#include "qemu/osdep.h"
> >>  #include <sys/resource.h>
> >>  #include <sys/sysctl.h>
> >>
> >> -#include "qemu/osdep.h"
> >>  #include "qemu/help-texts.h"
> >>  #include "qemu/units.h"
> >>  #include "qemu/accel.h"
> >> diff --git a/bsd-user/strace.c b/bsd-user/strace.c
> >> index a77d10dd6b..96499751eb 100644
> >> --- a/bsd-user/strace.c
> >> +++ b/bsd-user/strace.c
> >> @@ -20,7 +20,6 @@
> >>  #include <sys/select.h>
> >>  #include <sys/syscall.h>
> >>  #include <sys/ioccom.h>
> >> -#include <ctype.h>
> >>
> >>  #include "qemu.h"
> >>
> >> diff --git a/bsd-user/x86_64/signal.c b/bsd-user/x86_64/signal.c
> >> index c3875bc4c6..46cb865180 100644
> >> --- a/bsd-user/x86_64/signal.c
> >> +++ b/bsd-user/x86_64/signal.c
> >> @@ -16,6 +16,7 @@
> >>   *  along with this program; if not, see <http://www.gnu.org/licenses/
> >.
> >>   */
> >>
> >> +#include "qemu/osdep.h"
> >>  #include "qemu.h"
> >>
> >>  /*
> >> diff --git a/bsd-user/x86_64/target_arch_cpu.c
> >> b/bsd-user/x86_64/target_arch_cpu.c
> >> index be7bd10720..1d32f18907 100644
> >> --- a/bsd-user/x86_64/target_arch_cpu.c
> >> +++ b/bsd-user/x86_64/target_arch_cpu.c
> >> @@ -17,9 +17,8 @@
> >>   *  along with this program; if not, see <http://www.gnu.org/licenses/
> >.
> >>   */
> >>
> >> -#include <sys/types.h>
> >> -
> >>  #include "qemu/osdep.h"
> >> +
> >>  #include "cpu.h"
> >>  #include "qemu.h"
> >>  #include "qemu/timer.h"
> >>
> >
> > I suppose these are fine. How do I run the cleanup script? I have 2x the
> > number of files not upstream in the bsd-user fork that I'd like to
> cleanup
> > as well and they are likely a bigger mess and I'll just upstream them in
> > the messy state unless I understand how to keep the neat :).
>
> I used
>
>     $ scripts/clean-includes --check-dup-head --all
>
> Which resulted in a big mess I didn't dare to submit for review :)  So I
> split it up.  Easiest way was to identify useful sets of files, add
> files that include headers from the set, transitively, then run
>
>     $ scripts/clean-includes FILES...
>
> --check-dup-head reports possible duplicate inclusions.  It is prone to
> false positives.  That's why it merely reports them.  You may want to
> not use it for now.
>
> There's a big usage comment at the beginning of the script.
>
> Hope this helps!
>

It does. After your changes land, I'll merge, and run this on the branch. I
have a few changes queued up, and have been contemplating changes to my
upstreaming workflow to speed the process along...

So I'm happy with it. Thanks for the cleanup and the time to answer my
questions.

Reviewed-by: Warner Losh <imp@bsdimp.com>

Warner

--000000000000a59ef205f2a0efeb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 19, 2023 at 9:42 AM Marku=
s Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Warn=
er Losh &lt;<a href=3D"mailto:imp@bsdimp.com" target=3D"_blank">imp@bsdimp.=
com</a>&gt; writes:<br>
<br>
&gt; On Thu, Jan 19, 2023 at 12:00 AM Markus Armbruster &lt;<a href=3D"mail=
to:armbru@redhat.com" target=3D"_blank">armbru@redhat.com</a>&gt;<br>
&gt; wrote:<br>
&gt;<br>
&gt;&gt; Clean up includes so that osdep.h is included first and headers<br=
>
&gt;&gt; which it implies are not included manually.<br>
&gt;&gt;<br>
&gt;&gt; This commit was created with scripts/clean-includes.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redh=
at.com" target=3D"_blank">armbru@redhat.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 bsd-user/bsd-proc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 4 ----<br>
&gt;&gt;=C2=A0 bsd-user/qemu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
&gt;&gt;=C2=A0 bsd-user/arm/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 1 +<br>
&gt;&gt;=C2=A0 bsd-user/arm/target_arch_cpu.c=C2=A0 =C2=A0 | 2 ++<br>
&gt;&gt;=C2=A0 bsd-user/freebsd/os-sys.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 1 +<br>
&gt;&gt;=C2=A0 bsd-user/i386/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 1 +<br>
&gt;&gt;=C2=A0 bsd-user/i386/target_arch_cpu.c=C2=A0 =C2=A0| 3 +--<br>
&gt;&gt;=C2=A0 bsd-user/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 4 +---<br>
&gt;&gt;=C2=A0 bsd-user/strace.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 1 -<br>
&gt;&gt;=C2=A0 bsd-user/x86_64/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 1 +<br>
&gt;&gt;=C2=A0 bsd-user/x86_64/target_arch_cpu.c | 3 +--<br>
&gt;&gt;=C2=A0 11 files changed, 9 insertions(+), 13 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/bsd-user/bsd-proc.h b/bsd-user/bsd-proc.h<br>
&gt;&gt; index 68b66e571d..a1061bffb8 100644<br>
&gt;&gt; --- a/bsd-user/bsd-proc.h<br>
&gt;&gt; +++ b/bsd-user/bsd-proc.h<br>
&gt;&gt; @@ -20,11 +20,7 @@<br>
&gt;&gt;=C2=A0 #ifndef BSD_PROC_H_<br>
&gt;&gt;=C2=A0 #define BSD_PROC_H_<br>
&gt;&gt;<br>
&gt;&gt; -#include &lt;sys/types.h&gt;<br>
&gt;&gt; -#include &lt;sys/stat.h&gt;<br>
&gt;&gt; -#include &lt;sys/time.h&gt;<br>
&gt;&gt;=C2=A0 #include &lt;sys/resource.h&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt; Did you test this on FreeBSD 12? FreeBSD 13 has started to climb the h=
ill<br>
&gt; where all includes are independent, but much of that hasn&#39;t been m=
erged to<br>
&gt; 12 yet. sys/types.h, at least, is documented as a prereq for both<br>
&gt; sys/stat.h and sys/resource.h.<br>
&gt;<br>
&gt; I know many of these are in os-dep.h, and I&#39;ve had trouble in the =
bsd-user<br>
&gt; fork with that and the layout of the code which has arguably way too m=
uch<br>
&gt; in the .h files.<br>
<br>
No, I didn&#39;t test on FreeBSD 12.<br></blockquote><div><br></div><div>OK=
. Fair enough. If it passes the CI tests, then it&#39;s likely fine (though=
 if I hit issues, I&#39;ll submit patches).</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
Any .c must include qemu/osdep.h *first*.=C2=A0 Any further inclusions of<b=
r>
headers qemu/osdep.h includes already are no-ops unless the headers in<br>
question lack multiple inclusion guards.<br></blockquote><div><br></div><di=
v>OK.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
&gt; Also, why didn&#39;t you move sys/resource.h and other such files to o=
s-dep.h?<br>
&gt; I&#39;m struggling to understand the rules around what is or isn&#39;t=
 included<br>
&gt; where?<br>
<br>
This series is &quot;run scripts/clean-includes, split it into reviewable<b=
r>
chunks, tidy up blank lines&quot;.=C2=A0 Moving more includes into qemu/osd=
ep.h is<br>
out of scope.<br></blockquote><div><br></div><div>OK. Fair point. I&#39;m h=
appy with that answer since it tells me I could move things there too, if n=
eed be.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
I sympathize with your complaint that QEMU does too much in headers in<br>
general, and in qemu/osdep.h in particular.<br></blockquote><div><br></div>=
<div>Yea, I&#39;m not entirely sure=C2=A0 it&#39;s a complaint, or if it&#3=
9;s an observation of difficulties relative to other code bases... I go bac=
k and forth on my opinion of it...</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
&gt;&gt; -#include &lt;unistd.h&gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 /* exit(2) */<br>
&gt;&gt;=C2=A0 static inline abi_long do_bsd_exit(void *cpu_env, abi_long a=
rg1)<br>
&gt;&gt; diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h<br>
&gt;&gt; index be6105385e..0ceecfb6df 100644<br>
&gt;&gt; --- a/bsd-user/qemu.h<br>
&gt;&gt; +++ b/bsd-user/qemu.h<br>
&gt;&gt; @@ -17,7 +17,6 @@<br>
&gt;&gt;=C2=A0 #ifndef QEMU_H<br>
&gt;&gt;=C2=A0 #define QEMU_H<br>
&gt;&gt;<br>
&gt;&gt; -#include &quot;qemu/osdep.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;cpu.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;qemu/units.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;exec/cpu_ldst.h&quot;<br>
&gt;&gt; diff --git a/bsd-user/arm/signal.c b/bsd-user/arm/signal.c<br>
&gt;&gt; index 2b1dd745d1..9734407543 100644<br>
&gt;&gt; --- a/bsd-user/arm/signal.c<br>
&gt;&gt; +++ b/bsd-user/arm/signal.c<br>
&gt;&gt; @@ -17,6 +17,7 @@<br>
&gt;&gt;=C2=A0 =C2=A0*=C2=A0 along with this program; if not, see &lt;<a hr=
ef=3D"http://www.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">ht=
tp://www.gnu.org/licenses/</a>&gt;.<br>
&gt;&gt;=C2=A0 =C2=A0*/<br>
&gt;&gt;<br>
&gt;&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;qemu.h&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 /*<br>
&gt;&gt; diff --git a/bsd-user/arm/target_arch_cpu.c<br>
&gt;&gt; b/bsd-user/arm/target_arch_cpu.c<br>
&gt;&gt; index 02bf9149d5..fe38ae2210 100644<br>
&gt;&gt; --- a/bsd-user/arm/target_arch_cpu.c<br>
&gt;&gt; +++ b/bsd-user/arm/target_arch_cpu.c<br>
&gt;&gt; @@ -16,6 +16,8 @@<br>
&gt;&gt;=C2=A0 =C2=A0*=C2=A0 You should have received a copy of the GNU Gen=
eral Public License<br>
&gt;&gt;=C2=A0 =C2=A0*=C2=A0 along with this program; if not, see &lt;<a hr=
ef=3D"http://www.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">ht=
tp://www.gnu.org/licenses/</a>&gt;.<br>
&gt;&gt;=C2=A0 =C2=A0*/<br>
&gt;&gt; +<br>
&gt;&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;target_arch.h&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 void target_cpu_set_tls(CPUARMState *env, target_ulong newtl=
s)<br>
&gt;&gt; diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c=
<br>
&gt;&gt; index 309e27b9d6..1676ec10f8 100644<br>
&gt;&gt; --- a/bsd-user/freebsd/os-sys.c<br>
&gt;&gt; +++ b/bsd-user/freebsd/os-sys.c<br>
&gt;&gt; @@ -17,6 +17,7 @@<br>
&gt;&gt;=C2=A0 =C2=A0*=C2=A0 along with this program; if not, see &lt;<a hr=
ef=3D"http://www.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">ht=
tp://www.gnu.org/licenses/</a>&gt;.<br>
&gt;&gt;=C2=A0 =C2=A0*/<br>
&gt;&gt;<br>
&gt;&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;qemu.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;target_arch_sysarch.h&quot;<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/bsd-user/i386/signal.c b/bsd-user/i386/signal.c<br>
&gt;&gt; index 5dd975ce56..a3131047b8 100644<br>
&gt;&gt; --- a/bsd-user/i386/signal.c<br>
&gt;&gt; +++ b/bsd-user/i386/signal.c<br>
&gt;&gt; @@ -17,6 +17,7 @@<br>
&gt;&gt;=C2=A0 =C2=A0*=C2=A0 along with this program; if not, see &lt;<a hr=
ef=3D"http://www.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">ht=
tp://www.gnu.org/licenses/</a>&gt;.<br>
&gt;&gt;=C2=A0 =C2=A0*/<br>
&gt;&gt;<br>
&gt;&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;qemu.h&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 /*<br>
&gt;&gt; diff --git a/bsd-user/i386/target_arch_cpu.c<br>
&gt;&gt; b/bsd-user/i386/target_arch_cpu.c<br>
&gt;&gt; index d349e45299..2a3af2ddef 100644<br>
&gt;&gt; --- a/bsd-user/i386/target_arch_cpu.c<br>
&gt;&gt; +++ b/bsd-user/i386/target_arch_cpu.c<br>
&gt;&gt; @@ -17,9 +17,8 @@<br>
&gt;&gt;=C2=A0 =C2=A0*=C2=A0 along with this program; if not, see &lt;<a hr=
ef=3D"http://www.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">ht=
tp://www.gnu.org/licenses/</a>&gt;.<br>
&gt;&gt;=C2=A0 =C2=A0*/<br>
&gt;&gt;<br>
&gt;&gt; -#include &lt;sys/types.h&gt;<br>
&gt;&gt; -<br>
&gt;&gt;=C2=A0 #include &quot;qemu/osdep.h&quot;<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 #include &quot;cpu.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;qemu.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;qemu/timer.h&quot;<br>
&gt;&gt; diff --git a/bsd-user/main.c b/bsd-user/main.c<br>
&gt;&gt; index 6f09180d65..41290e16f9 100644<br>
&gt;&gt; --- a/bsd-user/main.c<br>
&gt;&gt; +++ b/bsd-user/main.c<br>
&gt;&gt; @@ -18,12 +18,10 @@<br>
&gt;&gt;=C2=A0 =C2=A0*=C2=A0 along with this program; if not, see &lt;<a hr=
ef=3D"http://www.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">ht=
tp://www.gnu.org/licenses/</a>&gt;.<br>
&gt;&gt;=C2=A0 =C2=A0*/<br>
&gt;&gt;<br>
&gt;&gt; -#include &lt;sys/types.h&gt;<br>
&gt;&gt; -#include &lt;sys/time.h&gt;<br>
&gt;&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt;&gt;=C2=A0 #include &lt;sys/resource.h&gt;<br>
&gt;&gt;=C2=A0 #include &lt;sys/sysctl.h&gt;<br>
&gt;&gt;<br>
&gt;&gt; -#include &quot;qemu/osdep.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;qemu/help-texts.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;qemu/units.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;qemu/accel.h&quot;<br>
&gt;&gt; diff --git a/bsd-user/strace.c b/bsd-user/strace.c<br>
&gt;&gt; index a77d10dd6b..96499751eb 100644<br>
&gt;&gt; --- a/bsd-user/strace.c<br>
&gt;&gt; +++ b/bsd-user/strace.c<br>
&gt;&gt; @@ -20,7 +20,6 @@<br>
&gt;&gt;=C2=A0 #include &lt;sys/select.h&gt;<br>
&gt;&gt;=C2=A0 #include &lt;sys/syscall.h&gt;<br>
&gt;&gt;=C2=A0 #include &lt;sys/ioccom.h&gt;<br>
&gt;&gt; -#include &lt;ctype.h&gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #include &quot;qemu.h&quot;<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/bsd-user/x86_64/signal.c b/bsd-user/x86_64/signal.c<b=
r>
&gt;&gt; index c3875bc4c6..46cb865180 100644<br>
&gt;&gt; --- a/bsd-user/x86_64/signal.c<br>
&gt;&gt; +++ b/bsd-user/x86_64/signal.c<br>
&gt;&gt; @@ -16,6 +16,7 @@<br>
&gt;&gt;=C2=A0 =C2=A0*=C2=A0 along with this program; if not, see &lt;<a hr=
ef=3D"http://www.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">ht=
tp://www.gnu.org/licenses/</a>&gt;.<br>
&gt;&gt;=C2=A0 =C2=A0*/<br>
&gt;&gt;<br>
&gt;&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;qemu.h&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 /*<br>
&gt;&gt; diff --git a/bsd-user/x86_64/target_arch_cpu.c<br>
&gt;&gt; b/bsd-user/x86_64/target_arch_cpu.c<br>
&gt;&gt; index be7bd10720..1d32f18907 100644<br>
&gt;&gt; --- a/bsd-user/x86_64/target_arch_cpu.c<br>
&gt;&gt; +++ b/bsd-user/x86_64/target_arch_cpu.c<br>
&gt;&gt; @@ -17,9 +17,8 @@<br>
&gt;&gt;=C2=A0 =C2=A0*=C2=A0 along with this program; if not, see &lt;<a hr=
ef=3D"http://www.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">ht=
tp://www.gnu.org/licenses/</a>&gt;.<br>
&gt;&gt;=C2=A0 =C2=A0*/<br>
&gt;&gt;<br>
&gt;&gt; -#include &lt;sys/types.h&gt;<br>
&gt;&gt; -<br>
&gt;&gt;=C2=A0 #include &quot;qemu/osdep.h&quot;<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 #include &quot;cpu.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;qemu.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;qemu/timer.h&quot;<br>
&gt;&gt;<br>
&gt;<br>
&gt; I suppose these are fine. How do I run the cleanup script? I have 2x t=
he<br>
&gt; number of files not upstream in the bsd-user fork that I&#39;d like to=
 cleanup<br>
&gt; as well and they are likely a bigger mess and I&#39;ll just upstream t=
hem in<br>
&gt; the messy state unless I understand how to keep the neat :).<br>
<br>
I used<br>
<br>
=C2=A0 =C2=A0 $ scripts/clean-includes --check-dup-head --all<br>
<br>
Which resulted in a big mess I didn&#39;t dare to submit for review :)=C2=
=A0 So I<br>
split it up.=C2=A0 Easiest way was to identify useful sets of files, add<br=
>
files that include headers from the set, transitively, then run<br>
<br>
=C2=A0 =C2=A0 $ scripts/clean-includes FILES...<br>
<br>
--check-dup-head reports possible duplicate inclusions.=C2=A0 It is prone t=
o<br>
false positives.=C2=A0 That&#39;s why it merely reports them.=C2=A0 You may=
 want to<br>
not use it for now.<br>
<br>
There&#39;s a big usage comment at the beginning of the script.<br>
<br>
Hope this helps!<br></blockquote><div><br></div><div>It does. After your ch=
anges land, I&#39;ll merge, and run this on the branch. I have a few change=
s queued up, and have been contemplating changes to my upstreaming workflow=
 to speed the process along...</div><div><br></div><div>So I&#39;m happy wi=
th it. Thanks for the cleanup and the time to answer my questions.</div><di=
v><br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.=
com">imp@bsdimp.com</a>&gt;</div><div><br></div><div>Warner=C2=A0</div></di=
v></div>

--000000000000a59ef205f2a0efeb--
