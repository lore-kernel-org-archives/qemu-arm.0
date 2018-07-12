Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1314217wrq;
        Thu, 12 Jul 2018 05:35:03 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfcBbp9ldnTcYIkclff2Nc8mDsCSN/SsNE7a3UUIr/zR24RRLKRja7+Dg6jmRuboLvvymV9
X-Received: by 2002:a37:61cd:: with SMTP id v196-v6mr1582459qkb.101.1531398903787;
        Thu, 12 Jul 2018 05:35:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531398903; cv=none;
        d=google.com; s=arc-20160816;
        b=hjkzDe11MhHiJOAjX+kARPPg1O12+qC9TaxcDw3epXnQbTmlhUpef03MX4i+pGZwGc
         Pwj/IOBweJIVK6uG3eZJVAySLaemhTh1p9lQsRIB3/AC1C3oEtkRdZorFA35GibQbuYp
         /PtG4BDQh22zHSZXPxPU/+FtCUN427cvoOHGEu/LtJvfE85rob091cW8UPUL5WF42ADc
         bmSPUMli3+UCpq2pBcgTCjU1l0X5GWcAX4hF9xnjVMNBoTpnTM5ffJi2XQXNqTdxkS3g
         aPgQXpO+n36hakmMgVTT0wIh+L8YQkTDNvZPUUs+bFkfHF0hDhE1h7F8I+yYStlPTTu4
         Y4VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=YysGqlWKO16UV7yaKuehziQxNUXRd/KD87gmgTT8VoM=;
        b=VN+s3n/Lo3n5hrF4PiI0VkbgHZYdVMKpUTFYdb2zwH6mXURWSU366it4ot6WcRwy+Q
         xMswEVh307vSzon81oVIe5TWdx/YzKBR3YfnXCVfcCD75exWUqy2XT1ASA9pyHcgfVZi
         9ZvzCa1NeO9k49q5ZsOCZQeWv2ygSXq5pnIdTYzV2qEb1kwkXm6JjG8JENGVE/16MDSP
         U0jpQYnDvU6biV/aqedpoLagizXM2ZR8Dp0DRx5r/l2JCxiZvX9lvSNvWa3g/D1CdYhJ
         xLMbus9L8Ws+ZiHA/oW4P3thUGzdAQnFxwDVZDGZ8x/S3aj4DJa5ENG1R+ziaWzHA9G7
         efpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Qcg1ywEN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j4-v6si2269060qte.29.2018.07.12.05.35.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 05:35:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Qcg1ywEN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59240 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdaoJ-0002LP-AG
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 08:35:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38641)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdao5-0002IQ-E1
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 08:34:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdao4-0006x2-Kk
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 08:34:49 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:40596)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fdao4-0006wN-Gk
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 08:34:48 -0400
Received: by mail-oi0-x244.google.com with SMTP id w126-v6so55430005oie.7
	for <qemu-arm@nongnu.org>; Thu, 12 Jul 2018 05:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YysGqlWKO16UV7yaKuehziQxNUXRd/KD87gmgTT8VoM=;
	b=Qcg1ywEN5JKK7x6YSutUBBT8prycO3knfR0fFd57cWP0Qc5HdQy8MBiJTm0AIul+/5
	CFVgdGbdcxaEf7qkkEScF1azpBClF/uaHyaOUwMxrzfdUFQiUSgTT/ejXokNZWx0nh+v
	Yl4ucRATDxIqdDR6fe+H4BJy7xznxtB3I7KkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YysGqlWKO16UV7yaKuehziQxNUXRd/KD87gmgTT8VoM=;
	b=TmdhG4W7Tw3V4xh7UBoslPZ6y5/kSlDU9S1BnJVp7L6GAvflGLtsv02LZIuLKjvpU5
	hpEVq/BRY/jvB++KxaS6y+byWD3U0OJ8CW19PAbeyQYwcrWkXEc61kwoAotiBEH75ChD
	OaGZncbBiRrMS+UEwLhi0q+84VpK4iaAmlpQT9a02+5LvlhQQDRzLp63GhYfsE4Ov6mH
	G0761WjCpf7hIx11/aqQ4BByBRR/uPztEZ+bsMO9uiPrBQXFEVuT8t86SLEUV+WXqjR5
	IcmOD0QpwFRvWCswPztN0cL8NQ8TT07AygOlsiQwoUTiREhW6nXSGVOvDwrT9r0IXWK5
	QkZg==
X-Gm-Message-State: AOUpUlFOLK5GWhegjUgFa4pdMNQQfZH7kKnNBFgieER/GcTspD8sAKb6
	2XnM1XhLFKj/G8n+Ek2+QyElS1OokPAzVfd48TPz5g==
X-Received: by 2002:aca:5f0a:: with SMTP id
	t10-v6mr1960971oib.337.1531398887681; 
	Thu, 12 Jul 2018 05:34:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 12 Jul 2018 05:34:27
	-0700 (PDT)
In-Reply-To: <20180629132954.24269-13-luc.michel@greensocs.com>
References: <20180629132954.24269-1-luc.michel@greensocs.com>
	<20180629132954.24269-13-luc.michel@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jul 2018 13:34:27 +0100
Message-ID: <CAFEAcA9KLckO343yv86oQGN3kvEj918oLhLuxakqXNtR=C0CVQ@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH v3 12/20] intc/arm_gic: Implement
 virtualization extensions in gic_complete_irq
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
X-TUID: DCcbKZeOHMYO

On 29 June 2018 at 14:29, Luc Michel <luc.michel@greensocs.com> wrote:
> Implement virtualization extensions in the gic_complete_irq() function.
> When a guest tries to end an IRQ that does not exist in the LRs, the
> EOICount field of the virtual interface HCR register is incremented by
> one, and the request is ignored.
>
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> ---
>  hw/intc/arm_gic.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index a7577ac073..434dc9c7b2 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -605,6 +605,15 @@ static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
>      int group;
>
>      DPRINTF("EOI %d\n", irq);
> +    if (gic_is_vcpu(cpu) && !gic_virq_is_valid(s, irq, cpu)) {
> +        /* This vIRQ does not have a valid LR entry. Increment EOICount and
> +         * ignore the write.
> +         */
> +        int rcpu = gic_get_vcpu_real_id(cpu);
> +        s->h_hcr[rcpu] += 1 << R_GICH_HCR_EOICount_SHIFT;
> +        return;
> +    }
> +

This check and handling of EOICount must also be done in
gic_deactivate_irq() -- see my comments on patch 7.

thanks
-- PMM
