Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1323073wrq;
        Thu, 12 Jul 2018 05:45:12 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdGHMFxsYFa8JAWU9JlUfrnEbHVPh1lUhqUtK8g5zWL2UQ1zAuPG40ziPdfDegg1AvDzIam
X-Received: by 2002:a37:d61b:: with SMTP id t27-v6mr1507973qki.244.1531399511964;
        Thu, 12 Jul 2018 05:45:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531399511; cv=none;
        d=google.com; s=arc-20160816;
        b=DjYgZ2Ko7WimhbX6F0tUmk06kUpwWw7GEdWydWII/HLWykfyEsI+SiTBCgtoi0oIRu
         Bl8GDxXrCUkMZYAQ5tdQHRqQ6uEDwS7gXEV0RO6pJyzx+KT1doYl72mlvex8R5rgo15w
         grAUQFsB+k3A3VgojPfV0MbZCRedDxjN1azdpHX4/ghTo1KvsIjHpa6jjl4XxVU2AQ+5
         SxjJpNHKXxoEv/xjmS+rJ8/2jH7gMNaww1ElqbwWyfNCUJCuCmWcIGlawUvMBw/NW39U
         +MOu5LXzLoraogOj5srrM4sEh7z87EpYJI0+fKdRR7ICJ/ur+Ob6mHQSqN5Uc4vyWOXq
         Qw9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=RkUVfSu9oHKOK3sAzMmxiBkeqtTBzwOCS+sJlmeKjKw=;
        b=CC6Fs/njAwZe6M5RnuXRVNM/8I3lLl5LXyEvGObyT7/bzZ4HQbTMhDTgjSqXpuHUE2
         l+WejuCe3W9wUePu+ENN6LyxS3eYkoG40rS8PaFw4DnQakmrieK3YxsUma1woReyG5b4
         hqgl1eFd7UjevWSQ9YOnWrz22aXEEtFZiNvHSzlU1Gy2UaarHgdGqpa8lgyFNaorVdxT
         g1jpBhrmq9O2vO5GsqKuts+KErix3eMTCPKC9BNKwxqq0YaMhw5RxZguPYaO0YphZFRz
         JcB1BS5aCAyLXxkje4F3a9m2mneRD7jiH5fsS1XPpQgoA5GW6/8KOJWmb/uybwkIMDbq
         KRRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="T/IUNSfj";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p13-v6si1717284qvi.256.2018.07.12.05.45.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 05:45:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="T/IUNSfj";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59282 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fday7-0004ye-If
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 08:45:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40747)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fday0-0004yE-FU
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 08:45:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdaxz-0004n1-Hb
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 08:45:04 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:40737)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fdaxz-0004mK-3o
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 08:45:03 -0400
Received: by mail-oi0-x243.google.com with SMTP id w126-v6so55483633oie.7
	for <qemu-arm@nongnu.org>; Thu, 12 Jul 2018 05:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RkUVfSu9oHKOK3sAzMmxiBkeqtTBzwOCS+sJlmeKjKw=;
	b=T/IUNSfjITSDU1DDgDXdZ4wZQJ3EGgjk8SN/86DbT2Id3YQ0asRIo5czvruhwp8UMN
	tE/UhMmrO0N7n+M/TwWwESkxij32AWBjzN16723lqpSJSvpsYs/ZhLZIrivitRrlb98E
	BnChcw9+EVabOCVzhq5lSc3IDU4DkOboJWst8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RkUVfSu9oHKOK3sAzMmxiBkeqtTBzwOCS+sJlmeKjKw=;
	b=hHCSnnG3OTkugi2uwlR+s3SRdpHOtIoGcRFFTmkRsb8gw4aES7xjB88BmvEQ67Vkyv
	3s/b6vte9xXzSiM6ciepiJc1m6mLOytJE1p30kPStVo5cPOmNo+sjoWB08ap2VWKxE2e
	CQEyZK7nwFSgge57UA/kcDseieUlEGWjBuhcXn0latLLqPHlaLo0apV8pB5pMgpWqQAc
	KpMhV8FUhsHOnFBuVdn/VrUH38OjUuKnujhvwObbSAAeJ5VwjH5nUwY9FRpku5yOUJSA
	/xWKt0x7NoPjJLzbBemkI1reJGDZ2wsfUIv0z13jYYcNY2+tzR5skMn7+iwGFmhlUD08
	3gNQ==
X-Gm-Message-State: AOUpUlHRbSEVh4pbpxMCOHdLQWY+x6wFS7MssTtR+8MlpVyIBB+YZ2EY
	HX3qTaEmpXNlEOOmlSPYAR8XelbwfJtuZJXtWaj8/Q==
X-Received: by 2002:aca:f5d1:: with SMTP id
	t200-v6mr2260053oih.12.1531399502279; 
	Thu, 12 Jul 2018 05:45:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 12 Jul 2018 05:44:41
	-0700 (PDT)
In-Reply-To: <20180629132954.24269-10-luc.michel@greensocs.com>
References: <20180629132954.24269-1-luc.michel@greensocs.com>
	<20180629132954.24269-10-luc.michel@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jul 2018 13:44:41 +0100
Message-ID: <CAFEAcA9u0q9YXEGd+NqSHVBtDO921jCyU_Qs8FQVqeHFwQNbAA@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH v3 09/20] intc/arm_gic: Add virtualization
 enabled IRQ helper functions
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: II03e50prWaU

On 29 June 2018 at 14:29, Luc Michel <luc.michel@greensocs.com> wrote:
> Add some helper functions to gic_internal.h to get or change the state
> of an IRQ. When the current CPU is not a vCPU, the call is forwarded to
> the GIC distributor. Otherwise, it acts on the list register matching
> the IRQ in the current CPU virtual interface.
>
> gic_clear_active can have a side effect on the distributor, even in the
> vCPU case, when the correponding LR has the HW field set.
>
> Use those functions in the CPU interface code path to prepare for the
> vCPU interface implementation.
>
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>

My review remarks on patch 7 will affect this patch a bit but
generally this looks good.

> +static inline void gic_clear_active(GICState *s, int irq, int cpu)
> +{
> +    if (gic_is_vcpu(cpu)) {
> +        uint32_t *entry = gic_get_lr_entry_nofail(s, irq, cpu);
> +        GICH_LR_CLEAR_ACTIVE(*entry);
> +
> +        if (GICH_LR_HW(*entry)) {
> +            /* Hardware interrupt. We must forward the deactivation request to
> +             * the distributor.
> +             */
> +            int phys_irq = GICH_LR_PHYS_ID(*entry);
> +            int rcpu = gic_get_vcpu_real_id(cpu);

You should check here that phys_irq is not one of the reserved
values >= GIC_MAXIRQ (ie 1020-1023). Otherwise the GIC_DIST_CLEAR_ACTIVE()
below will index off the end of the irq_state[] array.

(The current code for the physical GIC doesn't make this check, which
is a bit lax of it, but we should treat that as a separate bug rather
than trying to fix it here. I'll send a patch that fixes that for 3.0.)

> +
> +            /* This is equivalent to a NS write to DIR on the physical CPU
> +             * interface. Hence group0 interrupt deactivation is ignored if
> +             * the GIC is secure.
> +             */
> +            if (!s->security_extn || GIC_DIST_TEST_GROUP(phys_irq, 1 << rcpu)) {
> +                GIC_DIST_CLEAR_ACTIVE(phys_irq, 1 << rcpu);
> +            }
> +        }
> +    } else {
> +        GIC_DIST_CLEAR_ACTIVE(irq, 1 << cpu);
> +    }
> +}

>  #endif /* QEMU_ARM_GIC_INTERNAL_H */

thanks
-- PMM
