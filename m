Received: by 10.223.197.9 with SMTP id q9csp2653842wrf;
        Mon, 9 Oct 2017 10:02:34 -0700 (PDT)
X-Received: by 10.55.166.77 with SMTP id p74mr10498034qke.264.1507568553972;
        Mon, 09 Oct 2017 10:02:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507568553; cv=none;
        d=google.com; s=arc-20160816;
        b=SqCCboi+NUFAf7K15wPoLhw6xBQOr7Mlyy9rNj+Z6LxMq650wgdySmJRGu8gWNOnwU
         Y+H+j/1Ym+W+RBdZ1qszQyz8bMuJtczGNGHhuvZncSt7mCJAY+OaA2/LCBtKEJ/b8BXl
         MQCiEhtd0cteZYZ/qBabguwtxV6Fc+eR16rzs8TTytEqc0Yg7YzNhD826cZFfG8rWBBN
         MzQprO59S1FMBSbdAOlpUmwiZ7O2AElHWRE6L7AdQhgkKwrCMT7DPpw09VoMtib9H979
         Xet/nNpPy5PuIMI/IZ7ef42RoSOF2Xdp/aCN/hThKNudPSiay2G2FReoBWopa04FaXum
         11SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=hpmdTa6otWt7JRf7tvLq8C++4/tzZs7iUJrnqs9Zt7c=;
        b=BT7pkKpPhMLhCS0KOJYWRlUYYgb/cocWeY2Osb/iEVDaUirXqFWElniAJFzOtR71xm
         kRc11seGYvd8gisRtcWaElmsXCjXOC8EL4tQpPB2xHDDt4xYzIoAliit0W2UcyLdIi+w
         iNzSP/XEUsrW4To4CvDCOyYqS96ZQ9P+ikfWNYrqZZ0e3Fgd2f/PMy5Q2qzLu3U4AO5d
         HJMOdjvjaaqj8ckprz61Jkfwr6wmIZb7xRrVHiafkQYUcdeblQhIn8egPKBkuAM4pdOO
         lAReML/cU70DV67et1aFXTw8myoNgzrk176hIR6DCDy4D7wMk3P9RmLxgI4FvwcDSA+B
         Cbzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a1CM+1Ov;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i3si1091493qkf.274.2017.10.09.10.02.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Oct 2017 10:02:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a1CM+1Ov;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58911 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1bRp-0006Rf-F1
	for alex.bennee@linaro.org; Mon, 09 Oct 2017 13:02:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1bRd-0006PJ-Lv
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 13:02:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1bRU-0008Oa-29
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 13:02:21 -0400
Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231]:57288)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e1bRT-0008O2-OD
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 13:02:12 -0400
Received: by mail-wm0-x231.google.com with SMTP id l68so25259813wmd.5
	for <qemu-arm@nongnu.org>; Mon, 09 Oct 2017 10:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hpmdTa6otWt7JRf7tvLq8C++4/tzZs7iUJrnqs9Zt7c=;
	b=a1CM+1Ov5zKM3Hui7P3NuaQybN5e7Vf3v318RtduaRGpvLc+/E+KbtMT9TJJ6u9u1E
	OcNPGIJOYkS880I9zYt7Aa3REk/05QpWn4HOQFYGTn2BdGqGBYz28iiVbSC68mMxNDca
	sPXMLO8H8DVIjqUK2g6oHQNS8UyFic7I0FENw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hpmdTa6otWt7JRf7tvLq8C++4/tzZs7iUJrnqs9Zt7c=;
	b=hCCltgbyW1MK/vlQ6sY9bKPJFD+zHWyZZ2FBKyIH9V57ET6Kt/PxU/LqhxAPXgv20w
	0UpqvJpFJI5N5SjuRsv5ZLy/RLvYXV3U5TStOUwqFF8XO3p/j9lsBnw5kPcgmpwCTOmp
	7u9lOS24ZBDboYnnW/KU81CfYUXURnxbNNJBzXi7GYDhvD4rcs2XygMksvC2XONOCp3M
	cXdcA0oyR5Qk5FebsZ3EfAPWcAvg5DiIkJAqz8/IeQ1BdKmLtf+5cGcr5+XVjizU2uQy
	JIC2e+0an3gp2hpmzvZ2Sm0zD95idQiE7PTZrcKGUtie+Oz8kCAoqdhp76kMh2Kjn6f2
	likw==
X-Gm-Message-State: AMCzsaXOob+63DBEY7o1mI6zgqrJFLdu5f0937ge1JfY4p5iwsaCk3Cm
	0Gg+xys5yZElX45qSbeAxkvJiS4iBVv3KYKNzqOqpw==
X-Google-Smtp-Source: AOwi7QABOGXBef0t7xFjE3jCo1YSPYlI3wGImjRlaKQC5HKtz8z58Ri23mlqBwyiVfie6fFpduavap0DatA+KiDUjJE=
X-Received: by 10.28.22.66 with SMTP id 63mr8536951wmw.11.1507568530411; Mon,
	09 Oct 2017 10:02:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Mon, 9 Oct 2017 10:01:49 -0700 (PDT)
In-Reply-To: <1504286483-23327-7-git-send-email-eric.auger@redhat.com>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
	<1504286483-23327-7-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Oct 2017 18:01:49 +0100
Message-ID: <CAFEAcA_kWEeNTNrAucGuMKfN0iMg9hZcM8KnS-cst+ehGVtqsA@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::231
Subject: Re: [Qemu-arm] [PATCH v7 06/20] hw/arm/smmuv3: Wired IRQ and GERROR
 helpers
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
Cc: Radha Mohan <mohun106@gmail.com>, Andrew Jones <drjones@redhat.com>,
	Trey Cain <tcain@qti.qualcomm.com>,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	"Michael S. Tsirkin" <mst@redhat.com>,
	jean-philippe.brucker@arm.com, Tomasz Nowicki <tn@semihalf.com>,
	Will Deacon <will.deacon@arm.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	robin.murphy@arm.com, wtownsen@redhat.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Prem Mallappa <prem.mallappa@gmail.com>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a4N7byuzotMB

On 1 September 2017 at 18:21, Eric Auger <eric.auger@redhat.com> wrote:
> We introduce some helpers to handle wired IRQs and especially
> GERROR interrupt. SMMU writes GERROR register on GERROR event
> and SW acks GERROR interrupts by setting GERRORn.
>
> The Wired interrupts are edge sensitive.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
>
> Is CMD_SYNC interrupt enabled somewhere?
> ---
>  hw/arm/smmuv3-internal.h | 20 ++++++++++++++++++
>  hw/arm/smmuv3.c          | 55 ++++++++++++++++++++++++++++++++++++++++++++++++
>  hw/arm/trace-events      |  2 ++
>  3 files changed, 77 insertions(+)
>
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index 488acc8..2b44ee2 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -198,4 +198,24 @@ static inline int smmu_enabled(SMMUV3State *s)
>      return smmu_read32_reg(s, SMMU_REG_CR0) & SMMU_CR0_SMMU_ENABLE;
>  }
>
> +/*****************************
> + * Interrupts
> + *****************************/
> +
> +#define smmu_evt_irq_enabled(s)                   \
> +    (smmu_read64_reg(s, SMMU_REG_IRQ_CTRL) & SMMU_IRQ_CTRL_EVENT_EN)
> +#define smmu_gerror_irq_enabled(s)                  \
> +    (smmu_read64_reg(s, SMMU_REG_IRQ_CTRL) & SMMU_IRQ_CTRL_GERROR_EN)
> +#define smmu_pri_irq_enabled(s)                 \
> +    (smmu_read64_reg(s, SMMU_REG_IRQ_CTRL) & SMMU_IRQ_CTRL_PRI_EN)
> +
> +#define SMMU_PENDING_GERRORS(s) \
> +    (smmu_read32_reg(s, SMMU_REG_GERROR) ^ \
> +     smmu_read32_reg(s, SMMU_REG_GERRORN))

Hiding this XOR inside a macro is very confusing.

> +
> +#define SMMU_CMDQ_ERR(s) (SMMU_PENDING_GERRORS(s) & SMMU_GERROR_CMDQ)
> +
> +void smmuv3_irq_trigger(SMMUV3State *s, SMMUIrq irq, uint32_t gerror_val);
> +void smmuv3_write_gerrorn(SMMUV3State *s, uint32_t gerrorn);
> +
>  #endif
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 0a7cd1c..468134f 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -29,6 +29,61 @@
>  #include "hw/arm/smmuv3.h"
>  #include "smmuv3-internal.h"
>
> +/**
> + * smmuv3_irq_trigger - pulse @irq if enabled and update
> + * GERROR register in case of GERROR interrupt
> + *
> + * @irq: irq type
> + * @gerror: gerror new value, only relevant if @irq is GERROR
> + */
> +void smmuv3_irq_trigger(SMMUV3State *s, SMMUIrq irq, uint32_t gerror_val)
> +{
> +    uint32_t pending_gerrors = SMMU_PENDING_GERRORS(s);
> +    bool pulse = false;
> +
> +    switch (irq) {
> +    case SMMU_IRQ_EVTQ:
> +        pulse = smmu_evt_irq_enabled(s);
> +        break;
> +    case SMMU_IRQ_PRIQ:
> +        pulse = smmu_pri_irq_enabled(s);
> +        break;
> +    case SMMU_IRQ_CMD_SYNC:
> +        pulse = true;
> +        break;
> +    case SMMU_IRQ_GERROR:
> +    {
> +        /* don't toggle an already pending error */
> +        bool new_gerrors = ~pending_gerrors & gerror_val;
> +        uint32_t gerror = smmu_read32_reg(s, SMMU_REG_GERROR);
> +
> +        smmu_write32_reg(s, SMMU_REG_GERROR, gerror | new_gerrors);

The SMMU toggles GERROR bits to indicate that they have been
set, it doesn't just set them to 1.

> +
> +        /* pulse the GERROR irq only if all fields were acked */
> +        pulse = smmu_gerror_irq_enabled(s) && !pending_gerrors;
> +        break;
> +    }
> +    }
> +    if (pulse) {
> +            trace_smmuv3_irq_trigger(irq,
> +                                     smmu_read32_reg(s, SMMU_REG_GERROR),
> +                                     SMMU_PENDING_GERRORS(s));
> +            qemu_irq_pulse(s->irq[irq]);

qemu_irq_pulse() is very rarely the right thing for an interrupt
line, but it looks like it's right here (per spec 3.18.2).

> +    }
> +}
> +
> +void smmuv3_write_gerrorn(SMMUV3State *s, uint32_t gerrorn)
> +{
> +    uint32_t pending_gerrors = SMMU_PENDING_GERRORS(s);
> +    uint32_t sanitized;
> +
> +    /* Make sure SW does not toggle irqs that are not active */

If it does, this is CONSTRAINED UNPREDICTABLE. That is worth
remarking in either a comment or a LOG_GUEST_ERROR warning.

> +    sanitized = gerrorn & pending_gerrors;

This isn't right -- if you want to sanitize the result
being written then you need to make it only change bits
that are in pending_errors, but this expression allows
the guest to write a 0 to a field that is for a non-pending
error. (Or you could just not sanitize at all, that's allowed
by the CONSTRAINED UNPREDICTABLE.)

> +
> +    smmu_write32_reg(s, SMMU_REG_GERRORN, sanitized);
> +    trace_smmuv3_write_gerrorn(gerrorn, sanitized, SMMU_PENDING_GERRORS(s));
> +}
> +
>  static void smmuv3_init_regs(SMMUV3State *s)
>  {
>      uint32_t data =
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index 8affbf7..c1ce8eb 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -17,3 +17,5 @@ smmu_set_translated_address(hwaddr iova, hwaddr pa) "iova = 0x%"PRIx64" -> pa =
>
>  #hw/arm/smmuv3.c
>  smmuv3_read_mmio(hwaddr addr, uint64_t val, unsigned size) "addr: 0x%"PRIx64" val:0x%"PRIx64" size: 0x%x"
> +smmuv3_irq_trigger(int irq, uint32_t gerror, uint32_t pending) "irq=%d gerror=0x%x pending gerrors=0x%x"
> +smmuv3_write_gerrorn(uint32_t gerrorn, uint32_t sanitized, uint32_t pending) "gerrorn=0x%x sanitized=0x%x pending=0x%x"
> --
> 2.5.5

thanks
-- PMM
