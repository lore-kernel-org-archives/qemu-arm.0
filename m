Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp3802141wrq;
        Tue, 10 Jul 2018 10:10:30 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfE5LxnsqfMqIWZZzrxPbl3dlT3CdFLWLiTHzyCezXKSr0BjD+bMZ8zQpEXcSOQzul4ojZN
X-Received: by 2002:ac8:2996:: with SMTP id 22-v6mr1928882qts.259.1531242630783;
        Tue, 10 Jul 2018 10:10:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531242630; cv=none;
        d=google.com; s=arc-20160816;
        b=WpJRezO6/0ewvUabwT/vrq35s4/7SuAgL6a78+CefzjUgOTQTFYtElAcRbEotdYsFl
         z6Z4c+8PjJap6ghZ/gcXntoqgdQ5dDEpcm9DqeUqH70BKinpv9vi67i5lNO2KqB35cDm
         4OraFRxO+yUAOEzFIRzk3oJrg4CpztVwbrm4zuNg/hxKC6nP11yLq82EHad/67uYmae7
         xExBHOtNMNVK0J0Fo+hU0LbfQ6QF1U/H8iQNvhm8ajZWkUTvnMoWDPt3JUjlK/wVKz0E
         oQ/N89tiT57zzGX5plAkKmdFDg4em4EDpFoLczvMZ0PXOuRW9Byz7WiYai5vIrrRNQTe
         nhlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=xRZ6UNv1T9VrBvrhIwGu7hCea/XhXeuFoo7bwDYp5JU=;
        b=AzcqjJ+AZDTayHc6aczIalTZhohsJyKUxvWeHemp4dmIUl9ViadhUAsyVApxCjY7/V
         CdugwDFNFIUuR9/qKTvP5BBopLar17PeoN36+dstF64sbIHzB1r497OQyOvgqxuvJoob
         eJZIe7snL7rttyBgyZyTJ0hTsI2uzgz4RZr9TXi2+1yyZIKeJlLK2UtRSK4rbssh/SFc
         fYfIt+Ib02S1+oJKLIQauLz633En9TaMhshrD3Je7//cuYexnShOfWyL9hmAd0kps5a9
         rU1hI8l/8PR+2SE3DDOIdxYDZPtKlxpnYQqrH2/yq9E6dIqH1kOmvsYAHmxTrB+O0yOv
         CdSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=O6eQ4cUi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y56-v6si6911603qtk.390.2018.07.10.10.10.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Jul 2018 10:10:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=O6eQ4cUi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49022 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fcw9m-0006UK-AT
	for alex.bennee@linaro.org; Tue, 10 Jul 2018 13:10:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41173)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fcw9c-0006U3-Cs
	for qemu-arm@nongnu.org; Tue, 10 Jul 2018 13:10:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fcw9b-0000jc-8E
	for qemu-arm@nongnu.org; Tue, 10 Jul 2018 13:10:20 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:37924)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fcw9b-0000jO-2Z
	for qemu-arm@nongnu.org; Tue, 10 Jul 2018 13:10:19 -0400
Received: by mail-oi0-x244.google.com with SMTP id v8-v6so44042182oie.5
	for <qemu-arm@nongnu.org>; Tue, 10 Jul 2018 10:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xRZ6UNv1T9VrBvrhIwGu7hCea/XhXeuFoo7bwDYp5JU=;
	b=O6eQ4cUiQteVIuLsxJqhri9FCxMYo9Byh9NejtKkGm7PJ8fRpW/f6RJGI+3O2vOwVN
	iWILtH2GR9fFkJUtbR/6sws/7jY2l6/7y5Opru6TSE54JibMw/kftZk7E851JQ23Jqoj
	hu+cyEIVFHgFbT9DIq8xyLBmqN1zVLW80IpyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xRZ6UNv1T9VrBvrhIwGu7hCea/XhXeuFoo7bwDYp5JU=;
	b=Z89W5Ak0gV4hnO5INSL6Bz0ZRWrrhWvw9uEShe8psiledKH8phc+Id23Y/cCb7rLfr
	X8DZimVKkp8nG74OcQHiw4+uLurvvldhXHi9ktBGsmMGmxvMI93wMheX7hmTStC0gSbU
	4Bb2qNz4EG927na3M3l2CXgOky0UDx0q8ePAoY/Yj1f3jT6ghT6XK7zhyvJzatImWsCJ
	0Zr4A8ARLhMu/I4czRHV07iN2yotQ+AypSebiOGmw0RPmvrKwjycPX45dmutq1wtVfm1
	7B6UfMj9SyiKuf93Rl6IWqbUu2XdCHOt3TSK7o13g1UJSVB45iLhCa+e0FhRskGfzxrN
	QASw==
X-Gm-Message-State: APt69E0G+QPP8/DJ2s/R88r36aEHFJZv17CU06xrewK59uFRbzoeSacg
	CbmQuZS9OiIR7n1b6FC1G1W7Xc8RF5iLjER9V62gVw==
X-Received: by 2002:aca:ce0f:: with SMTP id
	e15-v6mr30163465oig.13.1531242616780; 
	Tue, 10 Jul 2018 10:10:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Tue, 10 Jul 2018 10:09:56
	-0700 (PDT)
In-Reply-To: <20180629132954.24269-2-luc.michel@greensocs.com>
References: <20180629132954.24269-1-luc.michel@greensocs.com>
	<20180629132954.24269-2-luc.michel@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Jul 2018 18:09:56 +0100
Message-ID: <CAFEAcA_MRBtqwKzk1KMLpDLO7vRsrenYjzuC4_EX=N0YvZXF=w@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH v3 01/20] intc/arm_gic: Implement write to
 GICD_ISACTIVERn and GICD_ICACTIVERn registers
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
X-TUID: S5a9aacrhoYF

On 29 June 2018 at 14:29, Luc Michel <luc.michel@greensocs.com> wrote:
> Implement write access to GICD_ISACTIVERn and GICD_ICACTIVERn registers
> in the GICv2. Those registers allow to set or clear the active state of
> an IRQ in the distributor.
>
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> ---
>  hw/intc/arm_gic.c | 41 +++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 39 insertions(+), 2 deletions(-)
>
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index ea0323f969..5755a4fb2c 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -982,9 +982,46 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
>                  GIC_CLEAR_PENDING(irq + i, ALL_CPU_MASK);
>              }
>          }
> +    } else if (offset < 0x380) {
> +        /* Interrupt Set Active.  */

These are read-only for the GICv1 and 11MPCore, so we need
to guard this code with a check on s->revision == 2:
           if (s->revision != 2) {
               goto bad_reg;
           }

> +        irq = (offset - 0x300) * 8 + GIC_BASE_IRQ;
> +        if (irq >= s->num_irq) {
> +            goto bad_reg;
> +        }
> +
> +        /* This register is banked per-cpu for PPIs */
> +        int cm = irq < GIC_INTERNAL ? (1 << cpu) : ALL_CPU_MASK;
> +
> +        for (i = 0; i < 8; i++) {
> +            if (s->security_extn && !attrs.secure &&
> +                !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
> +                continue; /* Ignore Non-secure access of Group0 IRQ */
> +            }
> +
> +            if (value & (1 << i)) {
> +                GIC_DIST_SET_ACTIVE(irq + i, cm);

You don't introduce this macro until patch 2, so this patch
has to go after that, so that we still compile at all points
in the patch sequence.

> +            }
> +        }
>      } else if (offset < 0x400) {
> -        /* Interrupt Active.  */
> -        goto bad_reg;
> +        /* Interrupt Clear Active.  */
> +        irq = (offset - 0x380) * 8 + GIC_BASE_IRQ;
> +        if (irq >= s->num_irq) {
> +            goto bad_reg;
> +        }

These registers only exist for GICv2, so again a check
on s->revision is required.

You also need to implement reading of GICD_ICACTIVERn for
GICv2 -- the code in gic_dist_readb() only implements reads of
GICD_ISACTIVERn (which is all that GICv1 needed).

> +
> +        /* This register is banked per-cpu for PPIs */
> +        int cm = irq < GIC_INTERNAL ? (1 << cpu) : ALL_CPU_MASK;
> +
> +        for (i = 0; i < 8; i++) {
> +            if (s->security_extn && !attrs.secure &&
> +                !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
> +                continue; /* Ignore Non-secure access of Group0 IRQ */
> +            }
> +
> +            if (value & (1 << i)) {
> +                GIC_DIST_CLEAR_ACTIVE(irq + i, cm);
> +            }
> +        }
>      } else if (offset < 0x800) {
>          /* Interrupt Priority.  */
>          irq = (offset - 0x400) + GIC_BASE_IRQ;
> --
> 2.17.1

Looks good otherwise.

thanks
-- PMM
