Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1331560wrq;
        Thu, 12 Jul 2018 05:55:13 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpc2jogtMXxpd9/iWiJ+JoIHzTvCADT0yPXGo512FAp6SpDnGj+LozhuyFKEYTRqMzP9h7Ad
X-Received: by 2002:a0c:a244:: with SMTP id f62-v6mr2188904qva.70.1531400113567;
        Thu, 12 Jul 2018 05:55:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531400113; cv=none;
        d=google.com; s=arc-20160816;
        b=Afx4XNPnnEMY5n9A50/ue6zcPAzcx3j0NAcFLWkXgBfLhfPHqCRJYDdDweNEKp0QKv
         Mb03bL4qSkgInqjtfY5Ny4c47uWRDt93Vp+QIGykz9G37dgXV/Wfqgul1d0LfdDxd3Q3
         muJ9yiHUTmSrA4FrvFIb3FXGX52ruQvLOZ1KOwTfbLMgYlbHmAhxjsr8WtYbwe1g/0Xa
         gIJbUls3A2HzqV8+WhjbvynWikLRJT/i6nVpm8EOlvAHDD1RJ84gmiAlNN2U2Mj/apAN
         2LtRQFaCUNc2Tb48mSyaOBgbESK0zc5UcXb2S+CUpltzTLqaSWiV+ErMXU3LqEytURJ8
         XHJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=xn4S55vUqvjpthgFm4pkan1ncFeFeuG1L11duDV0OIQ=;
        b=blmB3qDu0ZaNCBmhLiXmRjMgxqQ8HSQ7p8DoD3PzlojyDJAwbEf02HNKfd9KG2h/jv
         RfATh31WtX7lLYeBqW7xsv+DzCGghR3neyXFp5/Jj1HAFcsc9VSxZbU2N4o9RLECEqoj
         R7CzUTmuyHmknMM32EtotZQeaOAVy9ZUlbnHJ4u1sEM4faxF+m/pyayCt6e15rx07jsf
         JoHerLpmdkC6KMFw7IK5ycqVKWJJzAa4RfA9vm/EFXg89byLZCwkRPXMLAfVoi+ML0CH
         uKWoJihr7T3VaQ5FkPC2NhHfOy7fwhs6fWMLH20HeUNYCOKslyPFaQytD691ls77gVUf
         vmcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bu0Hvhfb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z5-v6si10011758qkl.2.2018.07.12.05.55.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 05:55:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bu0Hvhfb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59602 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdb7p-0007U5-3n
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 08:55:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46591)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdb7X-0007Tb-UK
	for qemu-devel@nongnu.org; Thu, 12 Jul 2018 08:54:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdb7X-0002IF-2D
	for qemu-devel@nongnu.org; Thu, 12 Jul 2018 08:54:56 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:34893)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fdb7W-0002I3-S8
	for qemu-devel@nongnu.org; Thu, 12 Jul 2018 08:54:54 -0400
Received: by mail-oi0-x241.google.com with SMTP id i12-v6so55563970oik.2
	for <qemu-devel@nongnu.org>; Thu, 12 Jul 2018 05:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xn4S55vUqvjpthgFm4pkan1ncFeFeuG1L11duDV0OIQ=;
	b=bu0HvhfbTjJi/0gG+q+P/hR/sEEciIaD5mPA7oZRiBp17GsoweGx0tpg7rqjX8FPHY
	Z7OKElpN45Y5LWyI2kxa2f8zVBGjO0Mcinyjk4MRSk6yDXX3nJ3svFLulFB7aRRrrkZF
	fWb/RU056NEepbMkB2VZVp9KMSc0FqnwoQJ1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xn4S55vUqvjpthgFm4pkan1ncFeFeuG1L11duDV0OIQ=;
	b=tZxs7niI6Jpw9tPCCnc/6wazqJV0SRXRG8OmgSZ4UUscNsBgmPXJMKx4gjIF4pRp9S
	l0lfB6iV0nxZzkkMugklIlHhbld3lFF0yEfuWNqHzVCT2G0tTpnYtxfgZFf32Ps3n3pU
	BTXAxiUN6U5SIlIGJUG7C92Hkc6ncVmxQa6wgt3WlSW4iH9CZ+Jpbez6Bk9Idj6BeA1J
	2B7IBBoLCBUhuxAR8oTReQPHAIrDio9UHksbYkgG+FTjvxpqQFavTV456+5hCRjf3k+p
	cb6r+7hvehDnjN2yvwF76gw/2XwQwjynavHPZKPe0zo/lSas/PaIWjUVtfIh8FSayaiV
	TNHg==
X-Gm-Message-State: AOUpUlFFMPbv9p4u5ydM2s4ot68NzQH6KsR+SroBfZ+48Luk+G4PZKFo
	akYBplr3UP6EdTQbTqtxfGcNXRCb5SlROCfLYHDEWw==
X-Received: by 2002:aca:5f0a:: with SMTP id
	t10-v6mr2031218oib.337.1531400094073; 
	Thu, 12 Jul 2018 05:54:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 12 Jul 2018 05:54:33
	-0700 (PDT)
In-Reply-To: <20180629132954.24269-11-luc.michel@greensocs.com>
References: <20180629132954.24269-1-luc.michel@greensocs.com>
	<20180629132954.24269-11-luc.michel@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jul 2018 13:54:33 +0100
Message-ID: <CAFEAcA_YxdvZGuBTKoMk+Wd4KP0LXfk1i+FvX-=3i=+aautRiA@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-devel] [PATCH v3 10/20] intc/arm_gic: Implement
 virtualization extensions in gic_(activate_irq|drop_prio)
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
Cc: Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u4+aEmC7rho8

On 29 June 2018 at 14:29, Luc Michel <luc.michel@greensocs.com> wrote:
> Implement virtualization extensions in gic_activate_irq() and
> gic_drop_prio() and in gic_get_prio_from_apr_bits() called by
> gic_drop_prio().
>
> When the current CPU is a vCPU:
>   - Use GIC_VIRT_MIN_BPR and GIC_VIRT_NR_APRS instead of their non-virt
>   counterparts,
>   - the vCPU APR is stored in the virtual interface, in h_apr.
>
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> ---
>  hw/intc/arm_gic.c | 45 ++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 36 insertions(+), 9 deletions(-)
>
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index d55a88bb33..d61c2dd557 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -276,16 +276,23 @@ static void gic_activate_irq(GICState *s, int cpu, int irq)
>       * and update the running priority.
>       */
>      int prio = gic_get_group_priority(s, cpu, irq);
> -    int preemption_level = prio >> (GIC_MIN_BPR + 1);
> +    int min_bpr = gic_is_vcpu(cpu) ? GIC_VIRT_MIN_BPR : GIC_MIN_BPR;
> +    int preemption_level = prio >> (min_bpr + 1);
>      int regno = preemption_level / 32;
>      int bitno = preemption_level % 32;
> +    uint32_t *papr = NULL;
>
> -    if (gic_has_groups(s) && gic_test_group(s, irq, cpu)) {
> -        s->nsapr[regno][cpu] |= (1 << bitno);
> +    if (gic_is_vcpu(cpu)) {
> +        assert(regno == 0);
> +        papr = &s->h_apr[gic_get_vcpu_real_id(cpu)];
> +    } else if (gic_has_groups(s) && gic_test_group(s, irq, cpu)) {
> +        papr = &s->nsapr[regno][cpu];
>      } else {
> -        s->apr[regno][cpu] |= (1 << bitno);
> +        papr = &s->apr[regno][cpu];
>      }
>
> +    *papr |= (1 << bitno);
> +
>      s->running_priority[cpu] = prio;
>      gic_set_active(s, irq, cpu);
>  }
> @@ -296,12 +303,22 @@ static int gic_get_prio_from_apr_bits(GICState *s, int cpu)
>       * on the set bits in the Active Priority Registers.
>       */
>      int i;
> -    for (i = 0; i < GIC_NR_APRS; i++) {
> -        uint32_t apr = s->apr[i][cpu] | s->nsapr[i][cpu];
> +    int min_bpr = gic_is_vcpu(cpu) ? GIC_VIRT_MIN_BPR : GIC_MIN_BPR;
> +    int nr_aprs = gic_is_vcpu(cpu) ? GIC_VIRT_NR_APRS : GIC_NR_APRS;
> +
> +    for (i = 0; i < nr_aprs; i++) {
> +        uint32_t apr;
> +
> +        if (gic_is_vcpu(cpu)) {
> +            apr = s->h_apr[gic_get_vcpu_real_id(cpu)];
> +        } else {
> +            apr = s->apr[i][cpu] | s->nsapr[i][cpu];
> +        }
> +
>          if (!apr) {
>              continue;
>          }
> -        return (i * 32 + ctz32(apr)) << (GIC_MIN_BPR + 1);
> +        return (i * 32 + ctz32(apr)) << (min_bpr + 1);

Since GIC_VIRT_NR_APRS is always 1, I think that rather than
merging the vcpu code into the loop here it would be clearer
to just special case it at the top of the function:

   if (gic_is_vcpu(cpu)) {
       uint32_t apr = s->h_apr[gic_get_vcpu_real_id(cpu)];
       if (apr) {
           return ctz32(apr) << (GIC_VIRT_MIN_BPR + 1);
       } else {
           return 0x100;
       }
   }


>      }
>      return 0x100;
>  }
> @@ -325,9 +342,19 @@ static void gic_drop_prio(GICState *s, int cpu, int group)
>       * might not do so, and interrupts that should not preempt might do so.
>       */
>      int i;
> +    int nr_aprs = gic_is_vcpu(cpu) ? GIC_VIRT_NR_APRS : GIC_NR_APRS;
> +
> +    for (i = 0; i < nr_aprs; i++) {
> +        uint32_t *papr = NULL;
> +
> +        if (gic_is_vcpu(cpu)) {
> +            papr = &s->h_apr[gic_get_vcpu_real_id(cpu)];
> +        } else if (group) {
> +            papr = &s->nsapr[i][cpu];
> +        } else {
> +            papr = &s->apr[i][cpu];
> +        }
>
> -    for (i = 0; i < GIC_NR_APRS; i++) {
> -        uint32_t *papr = group ? &s->nsapr[i][cpu] : &s->apr[i][cpu];
>          if (!*papr) {
>              continue;
>          }

Similarly here.

thanks
-- PMM
