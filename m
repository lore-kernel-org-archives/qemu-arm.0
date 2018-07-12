Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1378993wrq;
        Thu, 12 Jul 2018 06:37:53 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcPgclt0qwLtSAmJ89X/yNcj9keWrTIGfI7fi5kQNTyLQ0sPJgbhngcUeD4Ji4DWheDNtK9
X-Received: by 2002:a37:c3cf:: with SMTP id r76-v6mr1779185qkl.150.1531402673347;
        Thu, 12 Jul 2018 06:37:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531402673; cv=none;
        d=google.com; s=arc-20160816;
        b=l377FxWVeGgg7nu6jijRaYnfy3cVc9D7VZHyagtk5gr/7S/KxEMjdCmEQd84fFaodv
         zuYcOFCx1w0dSt+Xyv1r6Mkx51e7QB9rDfpDcIooEOGtEeYMDGFemZg3nbFyXJ8el/st
         WDzIv/0fb870gle5yxKrrOb0Zd8l4o5M6ogoWW/4vQ4gkqBx7HFXAHPgdWSKWUDV1W29
         FgEdc24IcMBHJjFeYY/Ptwa7ROBa+h3+pfAxcYh9fhcia+0B4fGV99d+ujRKrkFalVkT
         D0cuKNaTJypQouS+d4u+/oN74dAN+8hnbmpBC8EBJYnaM2xIH1GdIu9r3zlKvczwJQUV
         rxqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=lubzPBMhWYqPENIm71oCYeBGYcOn/jD4wgscFCKwCGU=;
        b=aF4EWCptAmNnfL0OoCbvu2KvH7n0ggpBvZjZfzjnZfUzt5YfW/ow2Y6lDXkJbCUZh6
         e8znMnhw2rCUh7fx07xRaxaEbA8ghGHoYUg87DGQ+MBEHai/Ee5YWaTkpUodgjckJ7KV
         0DDPAI9QkKSoCtoyFrcvu7Xrd7adxcbao6XFH1g6dwhQz6krdiuXPg5NqBk1Vd2o4y6L
         OYLlMVWaf7T0w5GztUv/IeAJXynUEmrA/0s/04tm3wR3lTWNm0oFWPqjmcvDPkF0YHkQ
         a26cSubZQwbs1vR7nZqXw8ONsLbFTWnLW2x9hHRpM1GPeo82MT24g/+EDQFzZGfSxxgL
         wdRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RzQf+v8K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q132-v6si98977qka.315.2018.07.12.06.37.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 06:37:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RzQf+v8K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60063 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdbn6-0007h8-PX
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 09:37:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33108)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdbmu-0007fP-Cq
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 09:37:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdbmt-0006CU-FM
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 09:37:40 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:42411)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fdbmt-0006Bd-8q
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 09:37:39 -0400
Received: by mail-oi0-x244.google.com with SMTP id n84-v6so55797076oib.9
	for <qemu-arm@nongnu.org>; Thu, 12 Jul 2018 06:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lubzPBMhWYqPENIm71oCYeBGYcOn/jD4wgscFCKwCGU=;
	b=RzQf+v8KHxbf1ZnwxAy9mSeaiAZa19lqQQcH5UMYCRWecc1h61cAeg2H3OvXQSt4Fg
	PWCXd9UtIceJ+Do7Nlg1BWM3sBvGLxn1CfjSrYMQSvE+Kyn2oh3q7xpPyw/0cyubqXpq
	i351PyUYv3K9buCQGp5Zghm79oDmWrID9MWxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lubzPBMhWYqPENIm71oCYeBGYcOn/jD4wgscFCKwCGU=;
	b=ua24PclUITXkjP3xaUsle+x0Bww4Wlum0OvhNIHeEjk03icEIlsdGhw5ZzJARMtyR1
	vK0KWNQdueXJEOvubA3/4Mef+Sv04eZ834iFyUbzI7PN7JeH6GYRRKmoEnHCJBcPE8IJ
	JFg4xjhpNcB9mvGlTEujceJlbX1IQM/YDJXOp8/4UWZn5QYNgako1juEql1+sPjUBayn
	nq182aP2IhUiy5G00rLnDW1hsT9rQyCUFzPmtbfZBepE1Rx7M6AlLL/O62ulOX/hSgw+
	5VJW/3XCM0y8TpI7nDRiYpEjlpkhs/KAQ2MPiUJOZASKtSlAzcTCP9J5tUfC6E8MC0Gn
	GhGA==
X-Gm-Message-State: AOUpUlEcsqKqYwZZS9QZNuAZma2Ie/69GLpCT94rK0rlpQQt1vJ6G0m5
	XZnzh///DopKz7HzFNGYn26nC4LGqJKS4JYTuJrcQg==
X-Received: by 2002:aca:f409:: with SMTP id
	s9-v6mr2557706oih.102.1531402658533; 
	Thu, 12 Jul 2018 06:37:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 12 Jul 2018 06:37:17
	-0700 (PDT)
In-Reply-To: <20180629132954.24269-15-luc.michel@greensocs.com>
References: <20180629132954.24269-1-luc.michel@greensocs.com>
	<20180629132954.24269-15-luc.michel@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jul 2018 14:37:17 +0100
Message-ID: <CAFEAcA_R9zp7EBtFetH5Q1Dnzj-kjPzDKRsBAo9aVnMZ3PW0VA@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH v3 14/20] intc/arm_gic: Wire the vCPU
 interface
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
X-TUID: zdVrUODX4QEg

On 29 June 2018 at 14:29, Luc Michel <luc.michel@greensocs.com> wrote:
> Add the read/write functions to handle accesses to the vCPU interface.
> Those accesses are forwarded to the real CPU interface, with the CPU id
> being converted to the corresponding vCPU id (vCPU id = CPU id +
> GIC_NCPU).
>
> As for the CPU interface, we create a base region for the vCPU interface
> that fetches the current vCPU id using the current_cpu global variable, and
> one mirror region per vCPU which maps to that specific vCPU id. This is
> required by the GIC architecture specification.


>  static void arm_gic_realize(DeviceState *dev, Error **errp)
>  {
>      /* Device instance realize function for the GIC sysbus device */
> @@ -1531,7 +1590,7 @@ static void arm_gic_realize(DeviceState *dev, Error **errp)
>      }
>
>      /* This creates distributor and main CPU interface (s->cpuiomem[0]) */

Can we also update this comment to indicate what virt-related
memory regions are being created?

> -    gic_init_irqs_and_mmio(s, gic_set_irq, gic_ops, NULL);
> +    gic_init_irqs_and_mmio(s, gic_set_irq, gic_ops, gic_virt_ops);
>
>      /* Extra core-specific regions for the CPU interfaces. This is
>       * necessary for "franken-GIC" implementations, for example on
> @@ -1547,6 +1606,16 @@ static void arm_gic_realize(DeviceState *dev, Error **errp)
>                                &s->backref[i], "gic_cpu", 0x100);
>          sysbus_init_mmio(sbd, &s->cpuiomem[i+1]);
>      }
> +
> +    if (s->virt_extn) {

...and a comment about what these regions are for.

What requires these per-core regions anyway? There's no way to
specify them in the device tree bindings for Linux, which AFAIK
only cares about using the "vcpu i/f for this core" registers.
I don't think the GIC-400 has these. (It does have per-cpu
aliases of the GICH_* registers, but this patchset doesn't seem
to implement those.)

> +        for (i = 0; i < s->num_cpu; i++) {
> +            memory_region_init_io(&s->vcpuiomem[i + 1], OBJECT(s),
> +                                  &gic_vcpu_ops, &s->backref[i],
> +                                  "gic_vcpu", 0x2000);
> +            sysbus_init_mmio(sbd, &s->vcpuiomem[i + 1]);
> +        }
> +    }
> +
>  }

thanks
-- PMM
