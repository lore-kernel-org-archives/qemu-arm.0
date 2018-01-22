Received: by 10.28.71.27 with SMTP id u27csp2929472wma;
        Mon, 22 Jan 2018 07:27:11 -0800 (PST)
X-Google-Smtp-Source: AH8x2277Nh9VyJJl0jx0NPuoB2IFlA5E+mtxPyZcKMu+q9yFCIye4rqb4KNu99w6wbyqqt4WgtQM
X-Received: by 10.129.107.6 with SMTP id g6mr7749437ywc.133.1516634831763;
        Mon, 22 Jan 2018 07:27:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516634831; cv=none;
        d=google.com; s=arc-20160816;
        b=iseFLdACo3xfhnTVtVrBY3xKK6PlkwU3a3HuX03vowRYoxI2AXv/kL2ZP5GFx2E9EQ
         W/zzkyPQqbjOoP954mljtbp9LrebTaDwOwyo7nixyATlOXdb4QjKeYmAixgO/x9yKf+u
         JCZtr5x98DrGtnU+Zs9r/hr8tRT/e54HOYL4L4d7lwq2uBQKi4fLnG9TZQ+pli2w7Yzf
         e9+cP3YrDeGowjRfsCPNPP5vGaBMab8nEodD4Q9LHgxAYnV5PADxCCGM2anEAVho4OKN
         Kwih++UiFz900EXXj0c7KwdRDuvalavOROqxF9R/sO30pK7lR5UwuNjSzdXTvgk942Mw
         CorQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=gJrykdMH/wRmiD9gbFq5ayUwenBpQd8KYddebX7+Yg0=;
        b=grnKCMmD+pqGFJJyU/LmcerTVQu4TZ3+J5c3hFeV5ADJ3j5rFzpmkdzR+CI6Y0FvgW
         B/ulju7am+gN2lW5IAqcCXTfN1bGcPxsuRean0mg0TiqIgSoyILRt/+VeU9BvR0SVvgE
         zpYAVrEwbe4Y+tOG1qyFa6mGNGkOlWgRtqFqe+b1fGqNDxgITI40WKSF7O2ZghEL+98m
         1dG+l1O/x8wPtUqWvxwQSeqjhjV2wMd/xwe21hyuDat9ix2DryEwkISAhZEPkafuB7qq
         41zYMmaod5G9cWbRLhoEHnfATAU1r8CAlQtpQ7FmUUQgshaqD7hAL9fqq4Zbu8DRhiSQ
         gWqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=afZBW+P1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n67si2081209ybc.513.2018.01.22.07.27.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Jan 2018 07:27:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=afZBW+P1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48035 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ede07-0000cz-6L
	for alex.bennee@linaro.org; Mon, 22 Jan 2018 10:27:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58201)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eddyd-0008Ow-2W
	for qemu-devel@nongnu.org; Mon, 22 Jan 2018 10:25:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eddyc-0002Yg-6p
	for qemu-devel@nongnu.org; Mon, 22 Jan 2018 10:25:39 -0500
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:46514)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eddyb-0002Y5-Ma
	for qemu-devel@nongnu.org; Mon, 22 Jan 2018 10:25:37 -0500
Received: by mail-ot0-x243.google.com with SMTP id t35so7753108otd.13
	for <qemu-devel@nongnu.org>; Mon, 22 Jan 2018 07:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gJrykdMH/wRmiD9gbFq5ayUwenBpQd8KYddebX7+Yg0=;
	b=afZBW+P1C4rvWM9wRmQzdsrn5XP+UYQZyF4DGsYLSJGNdDIbD9tnofD/krzqleEZc/
	bqm6CPWeaojqRk8MzK1DJPSN+03EwZJdNkTSUDcu8ucWpPT+LYta498ihF4TsDVewmxX
	2q4tB5Uru3Ut+M7pFIUQfOi3Ex81LjS8KbQMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gJrykdMH/wRmiD9gbFq5ayUwenBpQd8KYddebX7+Yg0=;
	b=F+1x035E1XDiw10yhAaHjWI6s70q3e6Y25nXtu51PZf/aLF3YzUgNarytCfSpLcOUx
	czvbyifEvDj+evDK2l9qwVQe4MxOgCSqDNx6anvWyBCmxd/JYr9VYTNAz5WfZXQiFXom
	7RfXcB9Qg2lfIdjFMCkggkNldmpvxZG+JxNB8W3xnNR2M7u/gvB6tPpXWw0tW4mJMWC8
	LCW/lH1Hp+k8FjhCwSgWA7GbJN4NoadJvdgMuWPNEnLhDtm1IfI1oaYxSjRGj9OHjM+4
	ez06bl/KJLqmH7jXz1rGAObcL89G/6T//nnuMymfTzs+PV/Liq9+tTeaCV4Atkvb4jUs
	U2CA==
X-Gm-Message-State: AKwxytcLCbb7of6LCauQlTRDh77c8xh0qkGGyVa4jdZXqVJa2/rOINNK
	2Pu7aJ0fem82eDOIJtJ7rQp1AZevHO6lnRkCbob/zA==
X-Received: by 10.157.73.25 with SMTP id e25mr4464377otf.110.1516634737006;
	Mon, 22 Jan 2018 07:25:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.61.133 with HTTP; Mon, 22 Jan 2018 07:25:16 -0800 (PST)
In-Reply-To: <20180119145756.7629-5-luc.michel@greensocs.com>
References: <20180119145756.7629-1-luc.michel@greensocs.com>
	<20180119145756.7629-5-luc.michel@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Jan 2018 15:25:16 +0000
Message-ID: <CAFEAcA--EPT4Ja-k=YiiOvUDvT_SEHxoQJat2bCg3RTj_cO-5g@mail.gmail.com>
To: luc.michel@greensocs.com
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-devel] [PATCH 3/4] hw/intc/arm_gic: Fix group priority
 computation for group 1 IRQs
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Luc MICHEL <luc.michel@git.antfield.fr>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pH8BG230UVAD

On 19 January 2018 at 14:57,  <luc.michel@greensocs.com> wrote:
> From: Luc MICHEL <luc.michel@git.antfield.fr>
>
> When determining the group priority of a group 1 IRQ, if C_CTRL.CBPR is
> 0, the non-secure BPR value is used. However, this value must be
> incremented by one so that it matches the secure world number of
> implemented priority bits (NS world has one less priority bit compared
> to the Secure world).
>
> Signed-off-by: Luc MICHEL <luc.michel@git.antfield.fr>
> ---
>  hw/intc/arm_gic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index 713de3084f..d0a41a89ae 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -256,7 +256,7 @@ static int gic_get_group_priority(GICState *s, int cpu, int irq)
>      if (gic_has_groups(s) &&
>          !(s->cpu_ctlr[cpu] & GICC_CTLR_CBPR) &&
>          GIC_TEST_GROUP(irq, (1 << cpu))) {
> -        bpr = s->abpr[cpu];
> +        bpr = s->abpr[cpu] - 1;

I would suggest an "assert(bpr >= 0);" here. (We have a similar
assert for GICv3 in icv_gprio_mask() and icc_gprio_mask() in
arm_gicv3_cpuif.c.)

>      } else {
>          bpr = s->bpr[cpu];
>      }
> --
> 2.16.0

thanks
-- PMM
