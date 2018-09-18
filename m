Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp4783419wrd;
        Mon, 17 Sep 2018 22:21:57 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYaUcOcjgrrNskeOrgKf+K/dSt7y54aVTl3GhdvPHdju5RAhVZXjpgUmmMPISYnfAeNANwf
X-Received: by 2002:a62:2646:: with SMTP id m67-v6mr29247952pfm.254.1537248117684;
        Mon, 17 Sep 2018 22:21:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537248117; cv=none;
        d=google.com; s=arc-20160816;
        b=IeDXb+/cytapw4pLIhkdgsPVYcf57XKq2Zm9i0I0e/QjUxw8r7e8wetICImnuLTjE/
         qqkjfo2bEn+7qcvzAFiOujopKZYlJ1w6vxaUt6sNsLqAgq5B2doqRHhh4mOqOwiRGTwr
         kAB5Aaiahkb0+a0g/JqzsVS9I7tfxnouQSgQFqZGBAaRNvMgkLLIpQGra4rQ20Ntz+28
         OTNw7I1WurFQSGjivaktFQUm8D781BzH70fQgeJEm4O2LOxuUUVDR5Dqzw5bxQ84Fiw9
         jI0xk7gP1L4inwbtcnflxGwsG59Cvu8LrG4fhYRCW1AacWYDF3BkMaBSPMTBbauPJrKm
         oJzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=RaglMiAxGDuZNKPU+x17MzW1aQExIukWNbirndHeg38=;
        b=OXU7JKOA9AmS5snSnFacr55shQ6V0BO3vw0ttL9fbjLR5LBXkqbheOuBJFUvX3H3hU
         ACvAFIpYNZZHshlt+/OwTXtGU0rNF7s9VRCOnENzL+nw5KuyoBftDzfLZC3Tb72D37OJ
         4PcTJ6/p1uFILQSITnXqEMi8ndmwDQosAyEHoMoJv6J/NBwm0kmO6mSO3yxfceNIdHnA
         7c/L0KpOJpEs1lJ5hWY3BnJZM1CogT1D8hnv8q3nM4fC0SJBGYPEDJqAPuNIAxROKlse
         hMageJ2kbVIDKkSrWzwcNOrTe26z9GcSDLgU5oHIowRczXW4WAsnj3WrxtuaTkwk3GQP
         WzFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=fCyVJevY;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id w5-v6si17158588plz.175.2018.09.17.22.21.57;
        Mon, 17 Sep 2018 22:21:57 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=fCyVJevY;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728645AbeIRKws (ORCPT <rfc822;francois.ozog@linaro.org>
        + 4 others); Tue, 18 Sep 2018 06:52:48 -0400
Received: from ozlabs.org ([203.11.71.1]:58179 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726759AbeIRKws (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 18 Sep 2018 06:52:48 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
        id 42Drvh5XyMz9sCs; Tue, 18 Sep 2018 15:21:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1537248112;
        bh=wuUji62M66H/YRMIegdsCn1XMcpZeW+rz7/eEpsf9W4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fCyVJevY8zThtwyjAsxMWcwHMZS9c/I0Ii1pJrdmRbVY4EUJXLHpxd2Tg3poPrdmi
         1gyNPF/Xl2hbiw+MoA068hdAmYMrSm2e2bHOeHpz0B6qkUqWy7Y9viTo0ZaPmfJg9n
         zp4Hw3k5UumZTFkBAB3s31vZ4ALENmikpqdUmZzM=
Date:   Tue, 18 Sep 2018 14:12:19 +1000
From:   David Gibson <david@gibson.dropbear.id.au>
To:     "Emilio G. Cota" <cota@braap.org>
Cc:     qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
        Aleksandar Markovic <amarkovic@wavecomp.com>,
        Alexander Graf <agraf@suse.de>,
        Anthony Green <green@moxielogic.com>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Chris Wulff <crwulff@gmail.com>,
        Cornelia Huck <cohuck@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Guan Xuetao <gxt@mprc.pku.edu.cn>,
        James Hogan <jhogan@kernel.org>, kvm@vger.kernel.org,
        Laurent Vivier <laurent@vivier.eu>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Marek Vasut <marex@denx.de>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Michael Walle <michael@walle.cc>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
        qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
        Richard Henderson <rth@twiddle.net>,
        Stafford Horne <shorne@gmail.com>
Subject: Re: [PATCH 35/35] exec: push BQL down to cpu->cpu_exec_interrupt
Message-ID: <20180918041219.GF30868@umbus.fritz.box>
References: <20180917163103.6113-1-cota@braap.org>
 <20180917163103.6113-36-cota@braap.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yH1ZJFh+qWm+VodA"
Content-Disposition: inline
In-Reply-To: <20180917163103.6113-36-cota@braap.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: YxoV0TgciLgR


--yH1ZJFh+qWm+VodA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 17, 2018 at 12:31:03PM -0400, Emilio G. Cota wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
>=20
> Most interrupt requests do not need to take the BQL, and in fact
> most architectures do not need it at all. Push the BQL acquisition
> down to target code.
>=20
> Cc: Aleksandar Markovic <amarkovic@wavecomp.com>
> Cc: Alexander Graf <agraf@suse.de>
> Cc: Anthony Green <green@moxielogic.com>
> Cc: Artyom Tarasenko <atar4qemu@gmail.com>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Chris Wulff <crwulff@gmail.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>
> Cc: James Hogan <jhogan@kernel.org>
> Cc: kvm@vger.kernel.org
> Cc: Laurent Vivier <laurent@vivier.eu>
> Cc: Marcelo Tosatti <mtosatti@redhat.com>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Cc: Michael Walle <michael@walle.cc>
> Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-ppc@nongnu.org
> Cc: qemu-s390x@nongnu.org
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Stafford Horne <shorne@gmail.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Emilio G. Cota <cota@braap.org>

ppc parts
Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  docs/devel/multi-thread-tcg.txt |  7 +++++--
>  accel/tcg/cpu-exec.c            |  9 +--------
>  target/arm/cpu.c                | 15 ++++++++++++++-
>  target/i386/seg_helper.c        |  3 +++
>  target/ppc/excp_helper.c        |  2 ++
>  target/s390x/excp_helper.c      |  3 +++
>  6 files changed, 28 insertions(+), 11 deletions(-)
>=20
> diff --git a/docs/devel/multi-thread-tcg.txt b/docs/devel/multi-thread-tc=
g.txt
> index 782bebc28b..422de4736b 100644
> --- a/docs/devel/multi-thread-tcg.txt
> +++ b/docs/devel/multi-thread-tcg.txt
> @@ -231,8 +231,11 @@ BQL. Currently ARM targets serialise all ARM_CP_IO r=
egister accesses
>  and also defer the reset/startup of vCPUs to the vCPU context by way
>  of async_run_on_cpu().
> =20
> -Updates to interrupt state are also protected by the BQL as they can
> -often be cross vCPU.
> +The CPUClass callbacks cpu_exec_interrupt and do_interrupt are invoked
> +without BQL protection.  Accesses to the interrupt controller from
> +the vCPU thread, for example while processing CPU_INTERRUPT_HARD, must
> +either call qemu_mutex_lock_iothread/qemu_mutex_unlock_iothread or use
> +a separate mutex.
> =20
>  Memory Consistency
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index b649e3d772..f5e08e79d1 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -524,7 +524,7 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
> =20
>      if (unlikely(atomic_read(&cpu->interrupt_request))) {
>          int interrupt_request;
> -        qemu_mutex_lock_iothread();
> +
>          interrupt_request =3D atomic_read(&cpu->interrupt_request);
>          if (unlikely(cpu->singlestep_enabled & SSTEP_NOIRQ)) {
>              /* Mask out external interrupts for this step. */
> @@ -533,7 +533,6 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
>          if (interrupt_request & CPU_INTERRUPT_DEBUG) {
>              cpu_reset_interrupt(cpu, CPU_INTERRUPT_DEBUG);
>              cpu->exception_index =3D EXCP_DEBUG;
> -            qemu_mutex_unlock_iothread();
>              return true;
>          }
>          if (replay_mode =3D=3D REPLAY_MODE_PLAY && !replay_has_interrupt=
()) {
> @@ -543,7 +542,6 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
>              cpu_reset_interrupt(cpu, CPU_INTERRUPT_HALT);
>              cpu->halted =3D 1;
>              cpu->exception_index =3D EXCP_HLT;
> -            qemu_mutex_unlock_iothread();
>              return true;
>          }
>  #if defined(TARGET_I386)
> @@ -554,14 +552,12 @@ static inline bool cpu_handle_interrupt(CPUState *c=
pu,
>              cpu_svm_check_intercept_param(env, SVM_EXIT_INIT, 0, 0);
>              do_cpu_init(x86_cpu);
>              cpu->exception_index =3D EXCP_HALTED;
> -            qemu_mutex_unlock_iothread();
>              return true;
>          }
>  #else
>          else if (interrupt_request & CPU_INTERRUPT_RESET) {
>              replay_interrupt();
>              cpu_reset(cpu);
> -            qemu_mutex_unlock_iothread();
>              return true;
>          }
>  #endif
> @@ -585,9 +581,6 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
>                 the program flow was changed */
>              *last_tb =3D NULL;
>          }
> -
> -        /* If we exit via cpu_loop_exit/longjmp it is reset in cpu_exec =
*/
> -        qemu_mutex_unlock_iothread();
>      }
> =20
>      /* Finally, check if we need to exit to the main loop.  */
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index e2c492efdf..246ea13d8f 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -347,7 +347,8 @@ static void arm_cpu_reset(CPUState *s)
>      hw_watchpoint_update_all(cpu);
>  }
> =20
> -bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
> +/* call with the BQL held */
> +static bool arm_cpu_exec_interrupt_locked(CPUState *cs, int interrupt_re=
quest)
>  {
>      CPUClass *cc =3D CPU_GET_CLASS(cs);
>      CPUARMState *env =3D cs->env_ptr;
> @@ -401,6 +402,16 @@ bool arm_cpu_exec_interrupt(CPUState *cs, int interr=
upt_request)
>      return ret;
>  }
> =20
> +bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
> +{
> +    bool ret;
> +
> +    qemu_mutex_lock_iothread();
> +    ret =3D arm_cpu_exec_interrupt_locked(cs, interrupt_request);
> +    qemu_mutex_unlock_iothread();
> +    return ret;
> +}
> +
>  #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
>  static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_reque=
st)
>  {
> @@ -409,6 +420,7 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, =
int interrupt_request)
>      CPUARMState *env =3D &cpu->env;
>      bool ret =3D false;
> =20
> +    qemu_mutex_lock_iothread();
>      /* ARMv7-M interrupt masking works differently than -A or -R.
>       * There is no FIQ/IRQ distinction. Instead of I and F bits
>       * masking FIQ and IRQ interrupts, an exception is taken only
> @@ -422,6 +434,7 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, =
int interrupt_request)
>          cc->do_interrupt(cs);
>          ret =3D true;
>      }
> +    qemu_mutex_unlock_iothread();
>      return ret;
>  }
>  #endif
> diff --git a/target/i386/seg_helper.c b/target/i386/seg_helper.c
> index 0dd85329db..2fdfbd3c37 100644
> --- a/target/i386/seg_helper.c
> +++ b/target/i386/seg_helper.c
> @@ -19,6 +19,7 @@
>   */
> =20
>  #include "qemu/osdep.h"
> +#include "qemu/main-loop.h"
>  #include "cpu.h"
>  #include "qemu/log.h"
>  #include "exec/helper-proto.h"
> @@ -1324,7 +1325,9 @@ bool x86_cpu_exec_interrupt(CPUState *cs, int inter=
rupt_request)
>  #if !defined(CONFIG_USER_ONLY)
>      if (interrupt_request & CPU_INTERRUPT_POLL) {
>          cpu_reset_interrupt(cs, CPU_INTERRUPT_POLL);
> +        qemu_mutex_lock_iothread();
>          apic_poll_irq(cpu->apic_state);
> +        qemu_mutex_unlock_iothread();
>          /* Don't process multiple interrupt requests in a single call.
>             This is required to make icount-driven execution deterministi=
c. */
>          return true;
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 8b2cc48cad..57acba2a80 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -885,10 +885,12 @@ bool ppc_cpu_exec_interrupt(CPUState *cs, int inter=
rupt_request)
>      CPUPPCState *env =3D &cpu->env;
> =20
>      if (interrupt_request & CPU_INTERRUPT_HARD) {
> +        qemu_mutex_lock_iothread();
>          ppc_hw_interrupt(env);
>          if (env->pending_interrupts =3D=3D 0) {
>              cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
>          }
> +        qemu_mutex_unlock_iothread();
>          return true;
>      }
>      return false;
> diff --git a/target/s390x/excp_helper.c b/target/s390x/excp_helper.c
> index 931c0103c8..f2a93abf01 100644
> --- a/target/s390x/excp_helper.c
> +++ b/target/s390x/excp_helper.c
> @@ -480,10 +480,13 @@ bool s390_cpu_exec_interrupt(CPUState *cs, int inte=
rrupt_request)
>                 the parent EXECUTE insn.  */
>              return false;
>          }
> +        qemu_mutex_lock_iothread();
>          if (s390_cpu_has_int(cpu)) {
>              s390_cpu_do_interrupt(cs);
> +            qemu_mutex_unlock_iothread();
>              return true;
>          }
> +        qemu_mutex_unlock_iothread();
>          if (env->psw.mask & PSW_MASK_WAIT) {
>              /* Woken up because of a floating interrupt but it has alrea=
dy
>               * been delivered. Go back to sleep. */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--yH1ZJFh+qWm+VodA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlugeyMACgkQbDjKyiDZ
s5K4aA/+JPWJUKxpJYrtTEhIrJr9YRun/hjLvUDw3GzwfhCc+2QJKkJIbjkU6yV4
/B3/gbsz3PppoM1OzF0r3KJLgqU2T7PZVSAl+8SA3uza4pCq/gW1oi7t3+HjCuKc
z8pWQyIgTo7BpC5lijrEtGKLi902Ida4yzZGHTTJ/hK2rb/7k8R9sJEO1PlQOgJy
DUBeQ8DdzTLjVzbSAc2t7KxtLHjgW9+yZE91VohR07D4e9ruOfzLupn+lGa0ijTd
jOvqPkR4j8qU855Z9nBgfFBL7s4/GhpkSyLL5WCuxdK3rytBmy/nVQBMff+ji71d
bCez9jtB1OdIokiT+ZPDNvfM5R6k9juAEEB3+Va3sN1EYlwsKrAbxx1ywlwp8uvK
mQw5ZNk2cQEKE7/F4M83cQl9u9OiFoartDcz1QvGtHfZGF3p6DjD/Mq0BqHZQFC/
Unr0lsN49QSJ1k5dCWdBCMgQcw4NPMKolcC80KB0rR996Z+wrbYGuPTB2tEqRxzl
sNYzL+iAJIPx4pIOulldNL7mIIHAsN/JOAGyQ/PIth/HH+xGsm6HtgJtRA2HHYCR
J/p5H1wntKQUghwpsuB2QzIA/Ay7GwRmgvS1d0+G3bHpkr6hBpUaS72QKQ7O+njW
TGEesLqjoJPcT2oky601s0zGM319i5DgzBtjn4qUNfvGXdFmxtA=
=mssK
-----END PGP SIGNATURE-----

--yH1ZJFh+qWm+VodA--
