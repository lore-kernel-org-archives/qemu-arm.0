Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp4783440wrd;
        Mon, 17 Sep 2018 22:21:59 -0700 (PDT)
X-Google-Smtp-Source: ANB0Vdb64qnJKHw7bK3wPmqa/fhxRbjEzf9mFwyDm8c69yxiEv22XhKE9iWwf8R24BWRbO3PgIlh
X-Received: by 2002:a62:2744:: with SMTP id n65-v6mr29251736pfn.125.1537248119219;
        Mon, 17 Sep 2018 22:21:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537248119; cv=none;
        d=google.com; s=arc-20160816;
        b=o9Mhx85Wm7GPmjoxjYBRU5XzBJQOyZVnCR5WDngYr61+qx3m3e6NOeaJ2RtQT+PPqj
         tWnayHwTvm3k/7Pe6cAkcOI7+HBrCVAuAvBSdsE0k6SSYCRQxoiZJsKbHtgQqCbqOvvK
         yCzLex+ewqit/0lbbgyw07YphCWiXLbOO2NsIvOQASMZBWGTdgYv1DOzGPxKdKT+hRxr
         kz/NrilX1mU+KM/sQ+Ad9pdrNR78ev8hBBgzZ0DFTeK8wX9PdSS21VDycVn5quM5IuJI
         l0B4bUK8Es56O5cXrYFy7k+WHu0u5wKzXi8u0dysDncX3JJlJ7lMphYA/na7ryH3l0Kt
         wQAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=WdvPE5xih0FnPkFkXUuKDNuFpgQrsFXlbQH6paoN+fU=;
        b=D82x41Cm851+xqsdpGgtKj8Akb5KnfB4ZDyKC/c6dNI7XZBdRiT+xKVR7cdEu0JBRm
         nnXTA+52YbeoZkYT/zIQSb+lY0CIlEPiJF/gF3c7XkgPrnH4gsVU336Lc+i/W9iWa+Tp
         FPASWeKLWhTdL56PlI2kcrZdd4KKgfuQsYTIVkvi0YBflpyfSjHBFNbMP3ToSfHkuC4+
         tZn4dSECyAlEhwuuDnxkJ/RsbuSxm6wmEgx4UBx9sAtVrYAfp0Z4yfdWUKcYgZ20fL9z
         f+BgRQWXaT4uvHs1hTwDLbHBEyHY+7Kv18iRpALD5ADcqdSsiVOY7wc6k/d3aMnMc79T
         E3kA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=R3utexIY;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id w5-v6si17158588plz.175.2018.09.17.22.21.58;
        Mon, 17 Sep 2018 22:21:59 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=R3utexIY;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728652AbeIRKwu (ORCPT <rfc822;francois.ozog@linaro.org>
        + 4 others); Tue, 18 Sep 2018 06:52:50 -0400
Received: from ozlabs.org ([203.11.71.1]:33045 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728574AbeIRKwt (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 18 Sep 2018 06:52:49 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
        id 42Drvj0FWXz9shl; Tue, 18 Sep 2018 15:21:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1537248113;
        bh=Ev+ad4iZM84ssMZKvtkmFf2RraWOs37wtlAUN9rhvuE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R3utexIYJcXZ3tWCAKD+THPI8ZFiT+R34Xmc08SNXVTynzI8DkLxvLtSDfNIE4KAk
         irYu2Yiawq6YI5pl4sjubHFU31FnySuUVpQzt8P62HeGKPujVAV5Y0nrhE3qp/p2w4
         +z66j3uhr4ttwZlGALot9dUZXPtVlX3jFVvrfpGo=
Date:   Tue, 18 Sep 2018 14:11:11 +1000
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
Subject: Re: [PATCH 34/35] exec: push BQL down to cpu->do_interrupt
Message-ID: <20180918041111.GE30868@umbus.fritz.box>
References: <20180917163103.6113-1-cota@braap.org>
 <20180917163103.6113-35-cota@braap.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vv4Sf/kQfcwinyKX"
Content-Disposition: inline
In-Reply-To: <20180917163103.6113-35-cota@braap.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: vDea8Usgm2Oo


--vv4Sf/kQfcwinyKX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 17, 2018 at 12:31:02PM -0400, Emilio G. Cota wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
>=20
> cpu->do_interrupt can now be called with BQL held (from
> cpu->cpu_exec_interrupt) or without (from cpu_handle_exception).
>=20
> Only a few targets rely on global device state in cc->do_interrupt;
> add checks to those targets to acquire the BQL if not already held.
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
>  accel/tcg/cpu-exec.c       |  2 --
>  target/arm/helper.c        | 28 ++++++++++++++++++++++++++--
>  target/ppc/excp_helper.c   |  8 +++++++-
>  target/s390x/excp_helper.c | 14 +++++++++++++-
>  target/sh4/helper.c        | 14 +++++++++++++-
>  target/xtensa/helper.c     | 16 ++++++++++++++--
>  6 files changed, 73 insertions(+), 9 deletions(-)
>=20
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 2383763f9b..b649e3d772 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -497,9 +497,7 @@ static inline bool cpu_handle_exception(CPUState *cpu=
, int *ret)
>  #else
>          if (replay_exception()) {
>              CPUClass *cc =3D CPU_GET_CLASS(cpu);
> -            qemu_mutex_lock_iothread();
>              cc->do_interrupt(cpu);
> -            qemu_mutex_unlock_iothread();
>              cpu->exception_index =3D -1;
>          } else if (!replay_has_interrupt()) {
>              /* give a chance to iothread in replay mode */
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 22dbc42305..548278da14 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -7644,7 +7644,8 @@ gen_invep:
>      return false;
>  }
> =20
> -void arm_v7m_cpu_do_interrupt(CPUState *cs)
> +/* call with the BQL held */
> +static void arm_v7m_cpu_do_interrupt_locked(CPUState *cs)
>  {
>      ARMCPU *cpu =3D ARM_CPU(cs);
>      CPUARMState *env =3D &cpu->env;
> @@ -7828,6 +7829,17 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
>      v7m_exception_taken(cpu, lr, false, ignore_stackfaults);
>  }
> =20
> +void arm_v7m_cpu_do_interrupt(CPUState *cs)
> +{
> +    if (qemu_mutex_iothread_locked()) {
> +        arm_v7m_cpu_do_interrupt_locked(cs);
> +    } else {
> +        qemu_mutex_lock_iothread();
> +        arm_v7m_cpu_do_interrupt_locked(cs);
> +        qemu_mutex_unlock_iothread();
> +    }
> +}
> +
>  /* Function used to synchronize QEMU's AArch64 register set with AArch32
>   * register set.  This is necessary when switching between AArch32 and A=
Arch64
>   * execution state.
> @@ -8482,8 +8494,9 @@ static inline bool check_for_semihosting(CPUState *=
cs)
>   * Do any appropriate logging, handle PSCI calls, and then hand off
>   * to the AArch64-entry or AArch32-entry function depending on the
>   * target exception level's register width.
> + * Call with the BQL held.
>   */
> -void arm_cpu_do_interrupt(CPUState *cs)
> +static void arm_cpu_do_interrupt_locked(CPUState *cs)
>  {
>      ARMCPU *cpu =3D ARM_CPU(cs);
>      CPUARMState *env =3D &cpu->env;
> @@ -8534,6 +8547,17 @@ void arm_cpu_do_interrupt(CPUState *cs)
>      }
>  }
> =20
> +void arm_cpu_do_interrupt(CPUState *cs)
> +{
> +    if (qemu_mutex_iothread_locked()) {
> +        arm_cpu_do_interrupt_locked(cs);
> +    } else {
> +        qemu_mutex_lock_iothread();
> +        arm_cpu_do_interrupt_locked(cs);
> +        qemu_mutex_unlock_iothread();
> +    }
> +}
> +
>  /* Return the exception level which controls this address translation re=
gime */
>  static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
>  {
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 70ac10e23b..8b2cc48cad 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -742,7 +742,13 @@ void ppc_cpu_do_interrupt(CPUState *cs)
>      PowerPCCPU *cpu =3D POWERPC_CPU(cs);
>      CPUPPCState *env =3D &cpu->env;
> =20
> -    powerpc_excp(cpu, env->excp_model, cs->exception_index);
> +    if (qemu_mutex_iothread_locked()) {
> +        powerpc_excp(cpu, env->excp_model, cs->exception_index);
> +    } else {
> +        qemu_mutex_lock_iothread();
> +        powerpc_excp(cpu, env->excp_model, cs->exception_index);
> +        qemu_mutex_unlock_iothread();
> +    }
>  }
> =20
>  static void ppc_hw_interrupt(CPUPPCState *env)
> diff --git a/target/s390x/excp_helper.c b/target/s390x/excp_helper.c
> index f2b92d7cbc..931c0103c8 100644
> --- a/target/s390x/excp_helper.c
> +++ b/target/s390x/excp_helper.c
> @@ -378,7 +378,8 @@ static void do_mchk_interrupt(CPUS390XState *env)
>      load_psw(env, mask, addr);
>  }
> =20
> -void s390_cpu_do_interrupt(CPUState *cs)
> +/* call with the BQL held */
> +static void s390_cpu_do_interrupt_locked(CPUState *cs)
>  {
>      QEMUS390FLICState *flic =3D QEMU_S390_FLIC(s390_get_flic());
>      S390CPU *cpu =3D S390_CPU(cs);
> @@ -457,6 +458,17 @@ try_deliver:
>      }
>  }
> =20
> +void s390_cpu_do_interrupt(CPUState *cs)
> +{
> +    if (qemu_mutex_iothread_locked()) {
> +        s390_cpu_do_interrupt_locked(cs);
> +    } else {
> +        qemu_mutex_lock_iothread();
> +        s390_cpu_do_interrupt_locked(cs);
> +        qemu_mutex_unlock_iothread();
> +    }
> +}
> +
>  bool s390_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>  {
>      if (interrupt_request & CPU_INTERRUPT_HARD) {
> diff --git a/target/sh4/helper.c b/target/sh4/helper.c
> index c699b8c0a1..6c508cd006 100644
> --- a/target/sh4/helper.c
> +++ b/target/sh4/helper.c
> @@ -79,7 +79,8 @@ int cpu_sh4_is_cached(CPUSH4State * env, target_ulong a=
ddr)
>  #define MMU_DADDR_ERROR_READ     (-12)
>  #define MMU_DADDR_ERROR_WRITE    (-13)
> =20
> -void superh_cpu_do_interrupt(CPUState *cs)
> +/* call with the BQL held */
> +static void superh_cpu_do_interrupt_locked(CPUState *cs)
>  {
>      SuperHCPU *cpu =3D SUPERH_CPU(cs);
>      CPUSH4State *env =3D &cpu->env;
> @@ -211,6 +212,17 @@ void superh_cpu_do_interrupt(CPUState *cs)
>      }
>  }
> =20
> +void superh_cpu_do_interrupt(CPUState *cs)
> +{
> +    if (qemu_mutex_iothread_locked()) {
> +        superh_cpu_do_interrupt_locked(cs);
> +    } else {
> +        qemu_mutex_lock_iothread();
> +        superh_cpu_do_interrupt_locked(cs);
> +        qemu_mutex_unlock_iothread();
> +    }
> +}
> +
>  static void update_itlb_use(CPUSH4State * env, int itlbnb)
>  {
>      uint8_t or_mask =3D 0, and_mask =3D (uint8_t) - 1;
> diff --git a/target/xtensa/helper.c b/target/xtensa/helper.c
> index c9a6132700..ecafecdd3f 100644
> --- a/target/xtensa/helper.c
> +++ b/target/xtensa/helper.c
> @@ -26,6 +26,7 @@
>   */
> =20
>  #include "qemu/osdep.h"
> +#include "qemu/main-loop.h"
>  #include "qemu/units.h"
>  #include "cpu.h"
>  #include "exec/exec-all.h"
> @@ -251,8 +252,8 @@ static void handle_interrupt(CPUXtensaState *env)
>      }
>  }
> =20
> -/* Called from cpu_handle_interrupt with BQL held */
> -void xtensa_cpu_do_interrupt(CPUState *cs)
> +/* Call with the BQL held */
> +static void xtensa_cpu_do_interrupt_locked(CPUState *cs)
>  {
>      XtensaCPU *cpu =3D XTENSA_CPU(cs);
>      CPUXtensaState *env =3D &cpu->env;
> @@ -305,6 +306,17 @@ void xtensa_cpu_do_interrupt(CPUState *cs)
>      }
>      check_interrupts(env);
>  }
> +
> +void xtensa_cpu_do_interrupt(CPUState *cs)
> +{
> +    if (qemu_mutex_iothread_locked()) {
> +        xtensa_cpu_do_interrupt_locked(cs);
> +    } else {
> +        qemu_mutex_lock_iothread();
> +        xtensa_cpu_do_interrupt_locked(cs);
> +        qemu_mutex_unlock_iothread();
> +    }
> +}
>  #else
>  void xtensa_cpu_do_interrupt(CPUState *cs)
>  {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--vv4Sf/kQfcwinyKX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAluget8ACgkQbDjKyiDZ
s5Jnjg/9HyXf1xjHWwOGPJ1/IL/dw4xWdvDj+smTvkPFmH/3lopsBUCNndgew15e
MQoqG3ojEc0G+/TfrGNtyPBo+tnBC1XB77rNIbE3Ll2LLZ+wSl/IZYTJejjqIeDo
3Qeym0fhtSlRfda79dsrJLRN58MyeIbbxPn9rO2zFuo93blAfoYpfTVJaxT8KoIL
rTJHv3co+SbZAaOFSI9Ez63WwVejDu54qka1WyXCN6ZL+v2qcbQR9NBuEXP7AGh+
Et+PcCq5a3oaMqIDVlCKjXiTVW6vqpjO9ABA+BCyaRZDN4Boy6Ltro26qRYtSzuB
M8WQA9b+TtB72nEIFbD5x1zpGH3uRIb1gyt2JHWSMtzYY+sGndDO+A1tnwMqjCHv
5CfbdavOFro9IUSkGvMWHbV5wlfP6QCa63cViyUpSiXS3cCmM1xYkU+SPays3yZ+
qKoeRxCJK5971Y9WlaweGtPZay3muKpa3j3Atb7W6aPf+nkFlUT7cLHq+HQuJX+w
64cj11tHxmGh7ARBKONTUPKZVqi5HNAezR4D97Q6g8p4d1mCvGpiI1Y5baxbuANG
ycksUdH++HTJRYXXwwY1DbuSYT6lWe+x7Fm1wRcGEgWR1O6ctk643nJUphkRG3RW
39QYGjPuCTZOTZUz88+166ko9hthkaqrZ5ultkMHvt2I8fjCQOE=
=Jh5n
-----END PGP SIGNATURE-----

--vv4Sf/kQfcwinyKX--
