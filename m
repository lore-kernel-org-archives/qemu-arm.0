Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2674493wru;
        Tue, 17 Jul 2018 06:33:27 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpc41jtjY/puUmZRzgUYKhLnZNb9u46IgNmCZYGI4N5N25UW7oIzhARfrBCc9n1ltabGAoRa
X-Received: by 2002:aed:3c55:: with SMTP id u21-v6mr1540880qte.198.1531834407789;
        Tue, 17 Jul 2018 06:33:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531834407; cv=none;
        d=google.com; s=arc-20160816;
        b=cAdav3Ps/sV0ahKLy2Faf2d2TlKgBEHBx/wt1iiY0KwcHUZj1xw8HyJsbsVrO0FlBM
         EShAuuo+Dj300ijNzIWefsLtFpuf7a7SGfZ6AOeNLAxx4NlIl0uTfkwi5IlCIwthvR7G
         ADgv1vfVfCz9d0y+WcvXBgnSd4pvPakqLiaqXtpGUe4mOm5nXmEHL7uI+vKmKOVwJvL4
         yNXLxgu6fO89L9vPahq6NKaRFiwTQpjEiVVOg8R/hwKoHO1x5ORGmrQxsKc7l7zK9C1n
         lMXKnRDUVGMT7KLyzkkO8+cXgscQ5yCt8+hJ9yECMHfhBEsqLuVPJkYcZojpNCJggD/S
         L6ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=go7yovmxCSeJW1ypPfMTopUV7sgB5ecVdUs0Ms4D+OM=;
        b=UqELe25JefMvnEb/ifmmxJHSfF54ziEUBP01Ry+5INRpQKLYT4a5Hy1uPujpZaTWeP
         uvZA1EgN/W6cyfsFfOpbOf3gmRP9X4JFsJcgoMBslFFhyBpcAhVNTMvGjMZMr5V+GWJs
         Joja7vmH8aCQ57IwF0l12wLeze+nKXe9BYsoy9XukQahFnYm61kuvzq1KIJml149vzJ3
         Mbim2vZsrX/MLXPYrWAOLFmGsxbkPqt1IUomnpAmAMDh391akznn9xUH5WXGXXX22Odp
         hjoRqiJzYgEr12FV3jBqeYx5AM8uf1lpCFc+uROWnquU1RFiUvYqXS8xjkZXKxsWgDEz
         U2+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MYblXqtc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j54-v6si881902qtj.68.2018.07.17.06.33.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Jul 2018 06:33:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MYblXqtc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59321 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ffQ6Z-0002Tf-BZ
	for alex.bennee@linaro.org; Tue, 17 Jul 2018 09:33:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48271)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ffQ6S-0002TA-FH
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 09:33:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ffQ6R-00086K-Cv
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 09:33:20 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:34986)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ffQ6R-00085h-6v
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 09:33:19 -0400
Received: by mail-oi0-x241.google.com with SMTP id i12-v6so2028829oik.2
	for <qemu-arm@nongnu.org>; Tue, 17 Jul 2018 06:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=go7yovmxCSeJW1ypPfMTopUV7sgB5ecVdUs0Ms4D+OM=;
	b=MYblXqtcrdCBqa8ACQa5W/mDv0IMvdIzu3/MV+sHahMRZAoV7MqiWbWQgapNXTBN7U
	SplYkrCMdbcG/LRKQotsMbGCgcYmKV5nGrs/fjR/gwNbPpcCWz6d3lOeN/DOMF4YmmQR
	Rtp2YFwR8PY/zh2D3MYCUUS4j0E4g8AkFJbu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=go7yovmxCSeJW1ypPfMTopUV7sgB5ecVdUs0Ms4D+OM=;
	b=AeDqfN2GVVr3MeQYVqYt4TPeScC0GVgAwfLxdGobMh/qmaX9ihgAMjpendulhrdJ9m
	JVQbIQEDbpfrUSSflOAV/x9tvxmSHreu01mTNoRWzzcVXtJfcceJXlIbcGO5OhLi824j
	Mc9jj6gNNrVJRbPR4vca05LzhKidtuGSDQllMCvZv+Cybs0RPjmzAyAmD4Vkp3qQPGbK
	sYwI+/bFyy6Oq51EWx8v8wB8dqYhszAHxon5OfQNxqxnGWNfIqYDQ8HHK9oetwQpVJ7m
	eh/N+wuxzj3Mf1AWhzJWiuZWqGdL3fpt6+H5Yrb7YBtGlP6iNy0S1qVLE2l9kbJOetAN
	/z4g==
X-Gm-Message-State: AOUpUlEjd7rAtJlfwvIoLpMBnRLdeKtpJxO2ZbnKNyj8oOPeMpgAtMDp
	uphJ4lxOsimcVjEgjo7WAtaDSplnKMC5BN8aKgubPw==
X-Received: by 2002:aca:f5d1:: with SMTP id
	t200-v6mr1743169oih.12.1531834398341; 
	Tue, 17 Jul 2018 06:33:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Tue, 17 Jul 2018 06:32:57
	-0700 (PDT)
In-Reply-To: <20180714171601.5734-13-luc.michel@greensocs.com>
References: <20180714171601.5734-1-luc.michel@greensocs.com>
	<20180714171601.5734-13-luc.michel@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jul 2018 14:32:57 +0100
Message-ID: <CAFEAcA9dQEaONA3AkqnyY3PnkMHNcjc=MiBwoF99oHp-BJuRFA@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH v4 12/20] intc/arm_gic: Implement
 virtualization extensions in gic_(deactivate|complete_irq)
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
X-TUID: eGEpFWFixPYl

On 14 July 2018 at 18:15, Luc Michel <luc.michel@greensocs.com> wrote:
> Implement virtualization extensions in the gic_deactivate_irq() and
> gic_complete_irq() functions.  When a guest tries to deactivat or end an

"deactivate"

> IRQ that does not exist in the LRs, the EOICount field of the virtual
> interface HCR register is incremented by one, and the request is
> ignored.
>
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> ---
>  hw/intc/arm_gic.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index be9e2594d9..50cbbfbe24 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -590,6 +590,15 @@ static void gic_deactivate_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
>          return;
>      }
>
> +    if (gic_is_vcpu(cpu) && !gic_virq_is_valid(s, irq, cpu)) {
> +        /* This vIRQ does not have an LR entry which is either active or
> +         * pending and active. Increment EOICount and ignore the write.
> +         */
> +        int rcpu = gic_get_vcpu_real_id(cpu);
> +        s->h_hcr[rcpu] += 1 << R_GICH_HCR_EOICount_SHIFT;
> +        return;
> +    }

It's a bit hard to tell from the amount of context in the diff,
but I think this check is being done too late in this function.
It needs to happen before we do any operations on the irq we're
passed (eg checking which group it is).

> +
>      if (gic_cpu_ns_access(s, cpu, attrs) && !group) {
>          DPRINTF("Non-secure DI for Group0 interrupt %d ignored\n", irq);
>          return;
> @@ -604,6 +613,15 @@ static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
>      int group;
>
>      DPRINTF("EOI %d\n", irq);
> +    if (gic_is_vcpu(cpu) && !gic_virq_is_valid(s, irq, cpu)) {
> +        /* This vIRQ does not have an LR entry which is either active or
> +         * pending and active. Increment EOICount and ignore the write.
> +         */
> +        int rcpu = gic_get_vcpu_real_id(cpu);
> +        s->h_hcr[rcpu] += 1 << R_GICH_HCR_EOICount_SHIFT;
> +        return;
> +    }

This isn't consistent with the deactivate code about whether we
do this check before the "irq >= s->num_irq" check or after.

I think the correct answer is "before", because the number of
physical interrupts in the GIC shouldn't affect the valid
range of virtual interrupts.

There is also an edge case here: if the VIRQ written to the
EOI or DIR registers is a special interrupt number (1020..1023),
then should we increment the EOI count or not? The GICv2 spec
is not entirely clear on this point, but it does say in the
GICH_HCR.EOICount docs that "EOIs that do not clear a bit in
the Active Priorities register GICH_APR do not cause an increment",
and the GICv3 spec is clear so my recommendation is that for
1020..1023 we should ignore the write and not increment EOICount.

That bit about "EOIs that do not clear a bit in GICH_APR do
not increment EOICount" also suggests that our logic for DIR
and EOI needs to be something like:

  if (vcpu) {
      if (irq > 1020) {
          return;
      }
      clear GICH_HCR bit;
      if (no bit cleared) {
          return;
      }
      if (!gic_virq_is_valid()) {
          increment EOICount;
          return;
      }
      clear active bit in LR;
  }

?

> +
>      if (irq >= s->num_irq) {
>          /* This handles two cases:
>           * 1. If software writes the ID of a spurious interrupt [ie 1023]
> --
> 2.18.0
>

thanks
-- PMM
