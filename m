Received: by 10.103.86.20 with SMTP id k20csp92787vsb;
        Mon, 19 Dec 2016 13:54:49 -0800 (PST)
X-Received: by 10.200.56.228 with SMTP id g33mr19441931qtc.140.1482184489727;
        Mon, 19 Dec 2016 13:54:49 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k20si638050qta.182.2016.12.19.13.54.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Dec 2016 13:54:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47909 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cJ5tP-0000Np-Cl
	for alex.bennee@linaro.org; Mon, 19 Dec 2016 16:54:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42461)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cJ5tK-0000MT-Li
	for qemu-arm@nongnu.org; Mon, 19 Dec 2016 16:54:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cJ5tJ-0005ty-Sr
	for qemu-arm@nongnu.org; Mon, 19 Dec 2016 16:54:42 -0500
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:36155)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1cJ5tJ-0005tj-Oe; Mon, 19 Dec 2016 16:54:41 -0500
Received: by mail-oi0-x241.google.com with SMTP id u15so21394083oie.3;
	Mon, 19 Dec 2016 13:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=F4P3fTL47iVKPlv3JdwCDmoWyXqRPxPNXCOWTcfq9I0=;
	b=EkqwXPYmqI7N6uKx68/EmSk5wUT+8QMKqgYAOq5voUctWy1oiYNnUJfg/f/hpQ5w6R
	FrySBrZFFmZI/Jq0sU9B1qHMCNlAGS2XV0KajBZ2lOmGMqAiSbfbAJth8PMKWSGaC0bX
	WwRouhEZOX6fejxIKIyhEs+2192w/cJ4A/MluW9Xc0FRZBcj9iEBzwkN91Cn3cg8i+d/
	/0eJcFfHAZ6AgRIILnTlcaUF8m6gk8N8EB/eGl8bmYHhhedjGXIH07CXl3Gh1y6Z15PS
	lLBtXwb+wVqaSiUCji2YNkr10jxKYTKERYaq0zblZBETO6LJIuLX5P4aylYt11XUc2Rq
	EwjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=F4P3fTL47iVKPlv3JdwCDmoWyXqRPxPNXCOWTcfq9I0=;
	b=dS/a3IezTs6GZFkvAeBn+QBZ7E11FhNpR7DijFQbXeodwFyI+bLeqb9JOn6L2K9uCr
	apcwTxg5agD1Gc4z0VqKgelL/FyqarFqgN9Wm0wqA9AIo+nla3MMTjAq7trgG9j47OGq
	u1Gf0UW9oIFXu9NsVBZjx6lw+D24IDPeT+qPOfioKbSqNdHBSubDR1J8gTt4RAqbn2oa
	dFB6jrDbV3phmfVr0Prkt5TcOp7SbThngXqk3bm8NeTebnhO2kIqm96s5BMstIV0sz4V
	cF70Ut/J7Ch6W3G0HpTM4FnjupbGMCGnhrjY8s9kPnKNc1u5jXhv95ktV/UyffpHCR5M
	ZDuQ==
X-Gm-Message-State: AIkVDXLrTz8wqs+yp/iXdDEg8v0pJ1pgKzpADOP0eE9w/W4bKAjhjmfcyiaRJr6rDQBSaWcMgPrItDo/bdzsTQ==
X-Received: by 10.157.35.71 with SMTP id k7mr11351365otd.140.1482184481006;
	Mon, 19 Dec 2016 13:54:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.96.6 with HTTP; Mon, 19 Dec 2016 13:54:10 -0800 (PST)
In-Reply-To: <1481625384-15077-10-git-send-email-peter.maydell@linaro.org>
References: <1481625384-15077-1-git-send-email-peter.maydell@linaro.org>
	<1481625384-15077-10-git-send-email-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 19 Dec 2016 13:54:10 -0800
Message-ID: <CAKmqyKPcO3SS6ZF7+3_a-oPeXvg1N3-zhhwj1krvew7NmpcgUw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 09/23] hw/intc/arm_gic: Add
 external IRQ lines for VIRQ and VFIQ
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
Cc: Andrew Jones <drjones@redhat.com>, Patch Tracking <patches@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tFbW5UeVu6k9

On Tue, Dec 13, 2016 at 2:36 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> Augment the GIC's QOM device interface by adding two
> new sets of sysbus IRQ lines, to signal VIRQ and VFIQ to
> each CPU.
>
> We never use these, but it's helpful to keep the v2-and-earlier
> GIC's external interface in line with that of the GICv3 to
> avoid board code having to add extra code conditional on which
> version of the GIC is in use.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

> ---
>  include/hw/intc/arm_gic_common.h | 2 ++
>  hw/intc/arm_gic_common.c         | 6 ++++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/include/hw/intc/arm_gic_common.h b/include/hw/intc/arm_gic_common.h
> index f4c349a..af3ca18 100644
> --- a/include/hw/intc/arm_gic_common.h
> +++ b/include/hw/intc/arm_gic_common.h
> @@ -55,6 +55,8 @@ typedef struct GICState {
>
>      qemu_irq parent_irq[GIC_NCPU];
>      qemu_irq parent_fiq[GIC_NCPU];
> +    qemu_irq parent_virq[GIC_NCPU];
> +    qemu_irq parent_vfiq[GIC_NCPU];
>      /* GICD_CTLR; for a GIC with the security extensions the NS banked version
>       * of this register is just an alias of bit 1 of the S banked version.
>       */
> diff --git a/hw/intc/arm_gic_common.c b/hw/intc/arm_gic_common.c
> index 0a1f56a..4a8df44 100644
> --- a/hw/intc/arm_gic_common.c
> +++ b/hw/intc/arm_gic_common.c
> @@ -110,6 +110,12 @@ void gic_init_irqs_and_mmio(GICState *s, qemu_irq_handler handler,
>      for (i = 0; i < s->num_cpu; i++) {
>          sysbus_init_irq(sbd, &s->parent_fiq[i]);
>      }
> +    for (i = 0; i < s->num_cpu; i++) {
> +        sysbus_init_irq(sbd, &s->parent_virq[i]);
> +    }
> +    for (i = 0; i < s->num_cpu; i++) {
> +        sysbus_init_irq(sbd, &s->parent_vfiq[i]);
> +    }
>
>      /* Distributor */
>      memory_region_init_io(&s->iomem, OBJECT(s), ops, s, "gic_dist", 0x1000);
> --
> 2.7.4
>
>
