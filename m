Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp4058835wrq;
        Mon, 11 Jun 2018 06:39:28 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLgds/QlY+vXQYoaubHPLmJeeFIVlN0gjbD+OKCwDPv4XVDPpyKgevuzY/3qNRzN3DjdxHa
X-Received: by 2002:aed:3c78:: with SMTP id u53-v6mr7746631qte.201.1528724368355;
        Mon, 11 Jun 2018 06:39:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528724368; cv=none;
        d=google.com; s=arc-20160816;
        b=RlVblmxscH+0HLpu4QotipR4ACJ16BMm1zUqQ0NNL65x9QABfg3cJpTirD99fxhn5B
         ifUjncI8LHsKONqyPVAdEi0yvjtJk7BiGAtyeuHBNnZYFZhAe2LI9moJLQuvq1fN+q55
         /f62rbhMVwaONLKAb+8z/iKeEYRR0pVkdvim0dJtH/xrIiDTYL6XV0NgH4V5ejt4k2MY
         XFMFkZz3nnfsYAcrD6B9FcbZ4spUE/pd5IbCHQNiFArnw0v8KTAsF+MO4zTjAtotBLad
         uLpWu9thfK4KcC28xP42DkvVywzThvmbn73/jEF2SpqRQJjhYZaZk9HQlcyXu3j9wyWn
         CSAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=mnC0RE8R0zd1NbxvAxwI0DXcdia3hcXNirlrdUu70ko=;
        b=tFk0+WeX62LHVCW2LGWCk56bUVubowIKE9IuPULrsBgSQTfB4FeQYLHOBth+LxQ/F1
         k9TKHYrD1He1XdIP1mKGv3rewm+p8qG7oX+8E3n6Kb5HsHjecVzwclVZKmtsgSB19+Q0
         8En/Dj3ziHLSVCaU3xzljC9Y8ELgRZSfoGZk6zDWOF9DhJf9AZdFNRtoavQIxZpMV5GB
         azGBBO7f2wrcBRmJGv+QKpTRp5//sKHXvpq22n3WxeEDu+kEsZCqA4ThL7oZt0X5UEFg
         /wSuBNPR+KhGbzJcuOge0z6MdG6Amc1pQLXqiNpdHU1da2eSzUfXbnUMNw7EAYMt2LzB
         y+LA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dl2GsoUE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t4-v6si9662670qvi.6.2018.06.11.06.39.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jun 2018 06:39:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dl2GsoUE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48893 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fSN2d-0006qC-RK
	for alex.bennee@linaro.org; Mon, 11 Jun 2018 09:39:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41249)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fSN2U-0006pl-F9
	for qemu-arm@nongnu.org; Mon, 11 Jun 2018 09:39:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fSN2T-0005kC-5t
	for qemu-arm@nongnu.org; Mon, 11 Jun 2018 09:39:18 -0400
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:43453)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fSN2S-0005ju-VS
	for qemu-arm@nongnu.org; Mon, 11 Jun 2018 09:39:17 -0400
Received: by mail-ot0-x243.google.com with SMTP id i19-v6so23782885otk.10
	for <qemu-arm@nongnu.org>; Mon, 11 Jun 2018 06:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mnC0RE8R0zd1NbxvAxwI0DXcdia3hcXNirlrdUu70ko=;
	b=dl2GsoUEUaN7NTTwiD42rNZGq3Suiy04fifUg3oJlxjja6b1Z2SMissFCJoS2fAWav
	ix5Ia3PyeNp076RCQT3f8H9kpWPUVwyzgeDHdRhQWB1NPKL1fa6DLoHPeeG9uo1o3Tpg
	BxyrPXXwFcns4GI3CoT978/h9mjpvmlhGmU3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mnC0RE8R0zd1NbxvAxwI0DXcdia3hcXNirlrdUu70ko=;
	b=oDZLsiyL2cTtHVVonl2di/gtb9UdNb6j32BYhtuIXlqXzfPDWFRnCsVHKPJgXE3LoP
	GqlEdFNHTw99GNlAbEN6XuINTxVGUDamu1BfgsSdpvffRTU533dNQuXhsvyBhdzz0B8I
	7VErb8OFXNQVsV+8nJ0eByjvuPzt00p2sjr0Xn6kbN/Uunb2s6zqoiDu4Cq2723XMEIa
	7BEZ64XooBecxKhXf+10t29U+wXJctI/ywDC7BpU1+nbJ1PW+dfGnhTNl90wpWN9XMS2
	4sVDpL64lkFlFJ0SL8bwEiRWiKcYIBelFQ75Z25t4yBcjMiYUlUazftCJj1u7KRIIyeI
	J5GA==
X-Gm-Message-State: APt69E3jYbhsCF0xoT4+740rK8QxzbFtZW0lUxivVH2KML09bO54B1vi
	AIyqW0wgIhzcbr+wSRxgMcFNKFuHLhgr7fyD9JXFJQ==
X-Received: by 2002:a9d:34db:: with SMTP id
	t27-v6mr10736333otd.316.1528724355867; 
	Mon, 11 Jun 2018 06:39:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Mon, 11 Jun 2018 06:38:55
	-0700 (PDT)
In-Reply-To: <20180606093101.30518-4-luc.michel@greensocs.com>
References: <20180606093101.30518-1-luc.michel@greensocs.com>
	<20180606093101.30518-4-luc.michel@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Jun 2018 14:38:55 +0100
Message-ID: <CAFEAcA9Oh+faKrBwDb7LAG=drkQTtbtoOrV_WUqa7twJi974yQ@mail.gmail.com>
To: luc.michel@greensocs.com
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-arm] [PATCH 3/6] intc/arm_gic: Add the virtualization
 extensions to the GIC state
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
X-TUID: U4OXurKgoB7W

On 6 June 2018 at 10:30,  <luc.michel@greensocs.com> wrote:
> From: Luc MICHEL <luc.michel@greensocs.com>
>
> Add the necessary parts of the virtualization extensions state to the
> GIC state. We choose to increase the size of the CPU interfaces state to
> add space for the vCPU interfaces (the GIC_NCPU_VCPU macro). This way,
> we'll be able to reuse most of the CPU interface code for the vCPUs.
>
> The vCPUs are numbered from GIC_NCPU to (GIC_NCPU * 2) - 1. The
> `gic_is_vcpu` function help to determine if a given CPU id correspond to
> a physical CPU or a virtual one.
>
> The GIC VMState is updated to account for this modification. We add a
> subsection for the virtual interface state. The virtual CPU interfaces
> state however cannot be put in the subsection because of some 2D arrays
> in the GIC state. This implies an increase in the VMState version id.
>
> For the in-kernel KVM VGIC, since the exposed VGIC does not implement
> the virtualization extensions, we report an error if the corresponding
> property is set to true.
>
> Signed-off-by: Luc MICHEL <luc.michel@greensocs.com>
> ---

> +/* Note: We cannot put the vCPUs state in this subsection because of some 2D
> + * arrays that mix CPU and vCPU states. */
> +static const VMStateDescription vmstate_gic_virt_state = {
> +    .name = "arm_gic_virt_state",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = gic_virt_state_needed,
> +    .fields = (VMStateField[]) {
> +        /* Virtual interface */
> +        VMSTATE_UINT32_ARRAY(h_hcr, GICState, GIC_NCPU),
> +        VMSTATE_UINT32_ARRAY(h_misr, GICState, GIC_NCPU),
> +        VMSTATE_UINT32_2DARRAY(h_lr, GICState, GIC_NR_LR, GIC_NCPU),
> +        VMSTATE_UINT64_ARRAY(h_eisr, GICState, GIC_NCPU),
> +        VMSTATE_UINT64_ARRAY(h_elrsr, GICState, GIC_NCPU),
> +        VMSTATE_UINT32_ARRAY(h_apr, GICState, GIC_NCPU),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static const VMStateDescription vmstate_gic = {
>      .name = "arm_gic",
> -    .version_id = 12,
> -    .minimum_version_id = 12,
> +    .version_id = 13,
> +    .minimum_version_id = 13,

This breaks migration compatibility, which we can't do for the GIC
(it is used by some KVM VM configs, where we strongly care about
compatibility).

>      .pre_save = gic_pre_save,
>      .post_load = gic_post_load,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32(ctlr, GICState),
> -        VMSTATE_UINT32_ARRAY(cpu_ctlr, GICState, GIC_NCPU),
> +        VMSTATE_UINT32_ARRAY(cpu_ctlr, GICState, GIC_NCPU_VCPU),

If you want to put the VCPU state in the same array as the CPU state
like this, you need to use subarrays, so here
           VMSTATE_UINT32_SUB_ARRAY(cpu_ctlr, GICState, 0, GIC_NCPU),
and in the vmstate_gic_virt_state
           VMSTATE_UINT32_SUB_ARRAY(cpu_ctlr, GICState, GIC_NCPU, GIC_NCPU)

Similarly for the other arrays. You'll need a patch adding
VMSTATE_UINT16_SUB_ARRAY to vmstate.h:

#define VMSTATE_UINT16_SUB_ARRAY(_f, _s, _start, _num)                \
    VMSTATE_SUB_ARRAY(_f, _s, _start, _num, 0, vmstate_info_uint16, uint16_t)

>          VMSTATE_STRUCT_ARRAY(irq_state, GICState, GIC_MAXIRQ, 1,
>                               vmstate_gic_irq_state, gic_irq_state),
>          VMSTATE_UINT8_ARRAY(irq_target, GICState, GIC_MAXIRQ),
>          VMSTATE_UINT8_2DARRAY(priority1, GICState, GIC_INTERNAL, GIC_NCPU),
>          VMSTATE_UINT8_ARRAY(priority2, GICState, GIC_MAXIRQ - GIC_INTERNAL),
>          VMSTATE_UINT8_2DARRAY(sgi_pending, GICState, GIC_NR_SGIS, GIC_NCPU),
> -        VMSTATE_UINT16_ARRAY(priority_mask, GICState, GIC_NCPU),
> -        VMSTATE_UINT16_ARRAY(running_priority, GICState, GIC_NCPU),
> -        VMSTATE_UINT16_ARRAY(current_pending, GICState, GIC_NCPU),
> -        VMSTATE_UINT8_ARRAY(bpr, GICState, GIC_NCPU),
> -        VMSTATE_UINT8_ARRAY(abpr, GICState, GIC_NCPU),
> -        VMSTATE_UINT32_2DARRAY(apr, GICState, GIC_NR_APRS, GIC_NCPU),
> +        VMSTATE_UINT16_ARRAY(priority_mask, GICState, GIC_NCPU_VCPU),
> +        VMSTATE_UINT16_ARRAY(running_priority, GICState, GIC_NCPU_VCPU),
> +        VMSTATE_UINT16_ARRAY(current_pending, GICState, GIC_NCPU_VCPU),
> +        VMSTATE_UINT8_ARRAY(bpr, GICState, GIC_NCPU_VCPU),
> +        VMSTATE_UINT8_ARRAY(abpr, GICState, GIC_NCPU_VCPU),
> +        VMSTATE_UINT32_2DARRAY(apr, GICState, GIC_NR_APRS, GIC_NCPU_VCPU),

The 2D array is more painful. You need to describe it as a set of
1D slices, something like
           VMSTATE_UINT32_SUB_ARRAY(apr, GICState, 0, GIC_NCPU),
           VMSTATE_UINT32_SUB_ARRAY(apr, GICState, GIC_NCPU_VCPU, GIC_NCPU),
           VMSTATE_UINT32_SUB_ARRAY(apr, GICState, GIC_NCPU_VCPU * 2, GIC_NCPU),
           [...]
           VMSTATE_UINT32_SUB_ARRAY(apr, GICState, GIC_NCPU_VCPU * n, GIC_NCPU),
where n is GIC_NR_APRS - 1

and then the other slices in the vmstate_gic_virt_state.

But conveniently the only 2D array is for the APR registers, which
you don't actually want to have state for for the virtualization
extensions anyway. The only state here is in the GICH_APR, and
(as per the recommendation in the spec in the GICV_APRn documentation)
the GICV_APRn should just be either RAZ/WI or aliases of GICH_APR,
with no state of their own to migrate.

More generally, there's something odd going on here. The way the
GIC virtualization extensions are defined, there are registers
which expose the state to the guest (the GIC virtual CPU interface),
and there are registers which expose the state to the hypervisor
(the GIC virtual interface), but the underlying state is identical.
In the spec all the various fields in the virtual CPU interface
are defined as aliases to register fields in the virtual interface
(for instance GICV_PMR is an alias of GICH_VMCR.VMPriMask).

So you don't want to be migrating the data twice -- depending on
the implementation we either hold the state in struct fields that
look like the CPU interface, and the virtual interface register
read and write code does the mapping to access the right parts of
those, or we can do it the other way round and store the state in
struct fields matching the virtual interface registers, with the
read and write functions for the virtual CPU interface doing the
mapping. But we don't want struct fields and migration state
descriptions for both.

>          VMSTATE_UINT32_2DARRAY(nsapr, GICState, GIC_NR_APRS, GIC_NCPU),
>          VMSTATE_END_OF_LIST()
> +    },
> +    .subsections = (const VMStateDescription * []) {
> +        &vmstate_gic_virt_state,
> +        NULL
>      }
>  };

thanks
-- PMM
