Received: by 10.80.166.35 with SMTP id d32csp492283edc;
        Thu, 13 Oct 2016 09:59:37 -0700 (PDT)
X-Received: by 10.233.220.129 with SMTP id q123mr8285263qkf.290.1476377977921;
        Thu, 13 Oct 2016 09:59:37 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d21si4968603qtd.2.2016.10.13.09.59.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Oct 2016 09:59:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41940 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bujM0-0006n7-U1
	for alex.bennee@linaro.org; Thu, 13 Oct 2016 12:59:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50815)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bujLw-0006kC-0v
	for qemu-arm@nongnu.org; Thu, 13 Oct 2016 12:59:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bujLt-0005gl-Vw
	for qemu-arm@nongnu.org; Thu, 13 Oct 2016 12:59:30 -0400
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:34577)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bujLt-0005gD-Ps
	for qemu-arm@nongnu.org; Thu, 13 Oct 2016 12:59:29 -0400
Received: by mail-vk0-x230.google.com with SMTP id b186so86154044vkb.1
	for <qemu-arm@nongnu.org>; Thu, 13 Oct 2016 09:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=haqBnCcPy96ncxIqgd3ZmZsL1f6GbdCr2FocdASY6yY=;
	b=Bh02T1TCpGIVT2NbgzRdYs6FRjG0xDqSftX6Oz6278Dq5XrZXRemHItygtqiWzIyLN
	TuOQD2YomWilCKoitAl7peTrP0NG6DHQsqwas05UreCa02PyRGd/LKYtg2uD7pex2y0B
	5T95PS53ENTHScz6ct7UpFMsScQmJ25sBF83M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=haqBnCcPy96ncxIqgd3ZmZsL1f6GbdCr2FocdASY6yY=;
	b=j5x5tqZB+dTKVa/SAEqZ9j0gu4V3l68IpuD14sadadN8mYSIzqwMEg3IcyuxAr+PD2
	G4F40YwWNWJCGt0CKOxMN6/w331muZnJW8Kgpn3EBew7CGNuP35UWyCIdnw2Ug1WqrOv
	2PWo28baIwKNzYCiYzBhDZFPvA0zr5zAO+PqurcXJEgm1UuLmTP3YLaKKXKz15zVV+bs
	ccgq2zNQ8CoV/upjffFD40ycsfLHS7u3sZSst8TI8YzfnSX0nHMPIAt4+lOls7b7Pgrl
	CGYljblN1GjC6NHyv+rDXCrhRhsBL9cDCqU+3x3pLbyN+0t4ogq+Bn92itpTqgadjoZD
	n4Ag==
X-Gm-Message-State: AA6/9RmTzeLeBVfi9S+yJkECz560pyNeZ3wZ6HZM3jXgrSmDryGyt1aPo2joOQklybP1II5qmZn0ppK4n8LOZGZF
X-Received: by 10.31.64.75 with SMTP id n72mr4591692vka.170.1476377969065;
	Thu, 13 Oct 2016 09:59:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Thu, 13 Oct 2016 09:59:08 -0700 (PDT)
In-Reply-To: <1475833331-26882-1-git-send-email-marcin.krzeminski@nokia.com>
References: <1475833331-26882-1-git-send-email-marcin.krzeminski@nokia.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Oct 2016 17:59:08 +0100
Message-ID: <CAFEAcA92+He9Fir_FeJEtx+Emd-HqjtHGimUbCgUn7X6gjnk5Q@mail.gmail.com>
To: "Krzeminski, Marcin (Nokia - PL/Wroclaw)" <marcin.krzeminski@nokia.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Subject: Re: [Qemu-arm] [PATCH] nvic: allow to set pending status for not
 active interrupts
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
Cc: rfsw-patches@mlist.nokia.com, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XqPv8z8UOMO8

On 7 October 2016 at 10:42,  <marcin.krzeminski@nokia.com> wrote:
> From: Marcin Krzeminski <marcin.krzeminski@nokia.com>
>
> According to ARM DUI 0552A 4.2.10. NVIC set pending status
> also for disabled interrupts. This patch adds possibility
> to emulate this in Qemu.
>
> Signed-off-by: Marcin Krzeminski <marcin.krzeminski@nokia.com>
> ---
>  hw/intc/arm_gic.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index b30cc91..85be6e4 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -147,7 +147,8 @@ static void gic_set_irq_11mpcore(GICState *s, int irq, int level,
>  {
>      if (level) {
>          GIC_SET_LEVEL(irq, cm);
> -        if (GIC_TEST_EDGE_TRIGGER(irq) || GIC_TEST_ENABLED(irq, cm)) {
> +        if (GIC_TEST_EDGE_TRIGGER(irq) || GIC_TEST_ENABLED(irq, cm)
> +                || (!GIC_TEST_ACTIVE(irq, cm) &&  s->revision == REV_NVIC)) {
>              DPRINTF("Set %d pending mask %x\n", irq, target);
>              GIC_SET_PENDING(irq, target);
>          }
> --

Thanks for this patch. I agree that the current behaviour isn't
correct.

I think it would be cleaner to define a new gic_set_irq_nvic() which
has the NVIC specific behaviour, rather than sticking an "if this
is really an NVIC" check into this function.

You probably also want to check whether the logic for re-pending
level triggered interrupts in gic_complete_irq() also needs a
similar change:

    if (s->revision == REV_11MPCORE || s->revision == REV_NVIC) {
        /* Mark level triggered interrupts as pending if they are still
           raised.  */
        if (!GIC_TEST_EDGE_TRIGGER(irq) && GIC_TEST_ENABLED(irq, cm)
            && GIC_TEST_LEVEL(irq, cm) && (GIC_TARGET(irq) & cm) != 0) {
            DPRINTF("Set %d pending mask %x\n", irq, cm);
            GIC_SET_PENDING(irq, cm);
        }
    }

thanks
-- PMM
