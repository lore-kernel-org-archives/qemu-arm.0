Received: by 10.80.166.35 with SMTP id d32csp2724735edc;
        Mon, 24 Oct 2016 09:11:42 -0700 (PDT)
X-Received: by 10.31.16.73 with SMTP id g70mr10316626vki.175.1477325502009;
        Mon, 24 Oct 2016 09:11:42 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id 4si5489523uar.217.2016.10.24.09.11.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Oct 2016 09:11:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47795 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1byhqf-0005yY-Ak
	for alex.bennee@linaro.org; Mon, 24 Oct 2016 12:11:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42947)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1byh8T-0003cr-MZ
	for qemu-devel@nongnu.org; Mon, 24 Oct 2016 11:26:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1byh8S-0002Dg-Js
	for qemu-devel@nongnu.org; Mon, 24 Oct 2016 11:26:01 -0400
Received: from mail-ua0-x234.google.com ([2607:f8b0:400c:c08::234]:33297)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1byh8S-0002Ca-Bd
	for qemu-devel@nongnu.org; Mon, 24 Oct 2016 11:26:00 -0400
Received: by mail-ua0-x234.google.com with SMTP id 6so21899284uat.0
	for <qemu-devel@nongnu.org>; Mon, 24 Oct 2016 08:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=c1hg7rfbHw/5fF+dVur4NrPmfcaeVPt/Ela2Orbvibo=;
	b=TS2E48j/2eKuqXOGfcjr6fOMgOiyRNxBgVyRQbPNo64RiUU7CG0IRELUP8sOHHvJur
	WL7gREi0wFYZ3ydVBmToG5KeXTbaukVqXCpQ3c4sU5jJZZ7ZDFVNgf2S82U59d6vMGlZ
	mZkPJc0FPfvjBhkhxNpvuZwO+rMNDMRHVYHew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=c1hg7rfbHw/5fF+dVur4NrPmfcaeVPt/Ela2Orbvibo=;
	b=Q/7p4NfObXEv9CGerIxYFoU1BavldjUMwrIc73WSAQNU/PgFzH8DzQaWMx8oZoxtWD
	q7j8aDKuBck+IUyzjPjqVHdD/CUdP53f5625h8ozLDH8yY7FnQWYR2VJNtT8tIR4RW3B
	LbfUdGU+PidbfGsX8WC7JReaMswf4VIQ5VVXCdIxZARmeoPx4Q5mobiDlUmbrvEBPe0U
	jNpHNc3nvpab3bvDaOdqtclvUFHATdWyMVkLeGbe268QE5kZU88WbC0fyDNdIZw3R1hQ
	lwi86zCO10mhrmM69/HxCanLMwkyIevazLGh5+cc8F2Yy5lQSaTWYYRloHgVYFyxoiPW
	wIFA==
X-Gm-Message-State: ABUngvcGocMI9c6FJQl6db9+1yc/JtBmTr19Zs/Z4fv6UFC0cwVQ0gA2zY8LdqTCcD0WbyUsP20TsMx0zxO8ldyv
X-Received: by 10.176.69.141 with SMTP id u13mr7761387uau.164.1477322759151;
	Mon, 24 Oct 2016 08:25:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Mon, 24 Oct 2016 08:25:38 -0700 (PDT)
In-Reply-To: <1476771285-3680-1-git-send-email-marcin.krzeminski@nokia.com>
References: <1476771285-3680-1-git-send-email-marcin.krzeminski@nokia.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Oct 2016 16:25:38 +0100
Message-ID: <CAFEAcA-QTUvqJvHwd11-UhGGiatH4PKkupthGh9Xzw3C1vHRGw@mail.gmail.com>
To: "Krzeminski, Marcin (Nokia - PL/Wroclaw)" <marcin.krzeminski@nokia.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::234
Subject: Re: [Qemu-devel] [v2] nvic: set pending status for not active
 interrupts
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: rfsw-patches@mlist.nokia.com, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pw4R9mPeFRHS

On 18 October 2016 at 07:14,  <marcin.krzeminski@nokia.com> wrote:
> From: Marcin Krzeminski <marcin.krzeminski@nokia.com>
>
> According to ARM DUI 0552A 4.2.10. NVIC set pending status
> also for disabled interrupts. This patch adds possibility
> to emulate this in Qemu.
>
> Signed-off-by: Marcin Krzeminski <marcin.krzeminski@nokia.com>

Thanks for rolling a v2. Unfortunately I think we don't
have the logic quite right yet...

> ---
> Changes for v2:
>     - add a dedicated unction for nvic
>     - update complete_irq
>  hw/intc/arm_gic.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
>
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index b30cc91..72e4c01 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -156,6 +156,21 @@ static void gic_set_irq_11mpcore(GICState *s, int irq, int level,
>      }
>  }
>
> +static void gic_set_irq_nvic(GICState *s, int irq, int level,
> +                                 int cm, int target)
> +{
> +    if (level) {
> +        GIC_SET_LEVEL(irq, cm);
> +        if (GIC_TEST_EDGE_TRIGGER(irq) || GIC_TEST_ENABLED(irq, cm)
> +                || !GIC_TEST_ACTIVE(irq, cm)) {
> +            DPRINTF("Set %d pending mask %x\n", irq, target);
> +            GIC_SET_PENDING(irq, target);
> +        }

Why is GIC_TEST_ENABLED() in this condition, when the idea is
that we don't care about the enabled status for whether we can
pend the interrupt?

I think this should actually just always do
   GIC_SET_PENDING(irq, target)
whenever level is high

because:
 (1) pending status can be set for disabled interrupts
 (2) edge-triggered IRQs definitely always re-pend on rising edge
 (3) I think level-triggered IRQs do too (it's a bit
     less clear in the docs, but DUI0552A 4.2.9 says we pend on
     a rising edge and doesn't say that applies only to edge
     triggered IRQs)

I don't have any real hardware to hand to test against, though.

> +    } else {
> +        GIC_CLEAR_LEVEL(irq, cm);
> +    }
> +}
> +
>  static void gic_set_irq_generic(GICState *s, int irq, int level,
>                                  int cm, int target)
>  {
> @@ -201,8 +216,10 @@ static void gic_set_irq(void *opaque, int irq, int level)
>          return;
>      }
>
> -    if (s->revision == REV_11MPCORE || s->revision == REV_NVIC) {
> +    if (s->revision == REV_11MPCORE) {
>          gic_set_irq_11mpcore(s, irq, level, cm, target);
> +    } else if (s->revision == REV_NVIC) {
> +        gic_set_irq_nvic(s, irq, level, cm, target);
>      } else {
>          gic_set_irq_generic(s, irq, level, cm, target);
>      }
> @@ -568,7 +585,7 @@ void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
>          return; /* No active IRQ.  */
>      }
>
> -    if (s->revision == REV_11MPCORE || s->revision == REV_NVIC) {
> +    if (s->revision == REV_11MPCORE) {
>          /* Mark level triggered interrupts as pending if they are still
>             raised.  */
>          if (!GIC_TEST_EDGE_TRIGGER(irq) && GIC_TEST_ENABLED(irq, cm)
> @@ -576,6 +593,12 @@ void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
>              DPRINTF("Set %d pending mask %x\n", irq, cm);
>              GIC_SET_PENDING(irq, cm);
>          }
> +    } else if (s->revision == REV_NVIC) {
> +        if (GIC_TEST_ENABLED(irq, cm) && GIC_TEST_LEVEL(irq, cm)
> +            && (GIC_TARGET(irq) & cm) != 0) {
> +            DPRINTF("Set nvic %d pending mask %x\n", irq, cm);
> +            GIC_SET_PENDING(irq, cm);
> +        }

Similarly, I think this should just be
    if (GIC_TEST_LEVEL(irq, cm) {
        GIC_SET_PENDING(irq, cm);
    }

because:
 (1) for the NVIC there is only one CPU and GIC_TARGET(irq) always
 indicates that IRQs target it
 (2) we don't care whether the interrupt is enabled when deciding
 whether it should be pended
 (3) we don't care whether the interrupt is level-triggered or
 edge-triggered for deciding whether to re-pend it
 (see statement R_XVWM in the v8M ARM ARM DDI0553A.c)

>      }
>
>      group = gic_has_groups(s) && GIC_TEST_GROUP(irq, cm);
> --
> 2.7.4

thanks
-- PMM
