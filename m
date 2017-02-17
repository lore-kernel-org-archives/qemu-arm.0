Received: by 10.25.77.65 with SMTP id a62csp183650lfb;
        Fri, 17 Feb 2017 05:56:06 -0800 (PST)
X-Received: by 10.200.54.84 with SMTP id n20mr8423082qtb.79.1487339766638;
        Fri, 17 Feb 2017 05:56:06 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c190si7516239qkf.293.2017.02.17.05.56.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Feb 2017 05:56:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53881 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cej14-0003I0-5g
	for alex.bennee@linaro.org; Fri, 17 Feb 2017 08:56:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41734)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cej0X-00030v-Nu
	for qemu-arm@nongnu.org; Fri, 17 Feb 2017 08:55:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cej0W-0005wo-R3
	for qemu-arm@nongnu.org; Fri, 17 Feb 2017 08:55:33 -0500
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233]:36308)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cej0W-0005w2-K3
	for qemu-arm@nongnu.org; Fri, 17 Feb 2017 08:55:32 -0500
Received: by mail-wm0-x233.google.com with SMTP id c85so15714662wmi.1
	for <qemu-arm@nongnu.org>; Fri, 17 Feb 2017 05:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=31Dv7oCe860pwZ9Cxvhn51/JVBZm0SPPAhFs9XzHSc4=;
	b=OMX3kK9Z/QaQjzjO8H+NlErV94mcvQQNajUbO+AUoYPLCDrlcmLMt/PzLQ6msVZcT1
	lGXyRzReFUi1Bl6CInipp9c9LkSvBZW72DQETKzo6tZwJbPQso9LjcRw04s4I2hc4pkq
	P/SgPMNTpK16pJHsePHeLssGhY7MFYmi8EcHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=31Dv7oCe860pwZ9Cxvhn51/JVBZm0SPPAhFs9XzHSc4=;
	b=EaEUD0/q6wH/IDQ05GuGYguZOPyfzz6GiMXnNku8KNzHjrhHc3mjy/PnpXGnqAE/th
	ZwtKn9Z4BzLa1KUK4YCdtzho4E6uYS1Upu4bSAYdd1pKM5gOZHIakn2NKuCG2xnRu+R1
	7i+NwE/1895YPgrn2LgPt945ucFbVNo1Lp6y0pG1PpOBYUuoIiRDKAi3FRYAjIHx1Wit
	lflwCa4uP+bCrNKOjrtRMsjJTyd1bqheUd149Eiill952gcrFm95AH5HtWzYRgnSMtCR
	WmL1koEdYvh8O2WMCyWhdFEXDrEp0QyWaEROfzejbpWa0v05Iz+NjTPzsXCBSBl3rjUU
	2ZUQ==
X-Gm-Message-State: AMke39lRLtgh1iUfYNp7v9MbD1OGGuoNc+Z64FBq5cFACVczh+MSv4u1R404FrehQoRjUC1JOOt5xm+iicHa++mf
X-Received: by 10.28.55.199 with SMTP id e190mr3517955wma.92.1487339731340;
	Fri, 17 Feb 2017 05:55:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 17 Feb 2017 05:55:10 -0800 (PST)
In-Reply-To: <1487313115-9510-3-git-send-email-vijay.kilari@gmail.com>
References: <1487313115-9510-1-git-send-email-vijay.kilari@gmail.com>
	<1487313115-9510-3-git-send-email-vijay.kilari@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Feb 2017 13:55:10 +0000
Message-ID: <CAFEAcA8618+LGejFq6SpBEwGrNpfamBBX3MFWjss-ZxJ7Xk8mg@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::233
Subject: Re: [Qemu-arm] [PATCH v8 2/5] hw/intc/arm_gicv3_kvm: Add
 ICC_SRE_EL1 register to vmstate
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
Cc: Marc Zyngier <marc.zyngier@arm.com>, Pavel Fedin <p.fedin@samsung.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>,
	Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MUHbKhBQVNiS

On 17 February 2017 at 06:31,  <vijay.kilari@gmail.com> wrote:
> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>
> To Save and Restore ICC_SRE_EL1 register introduce vmstate
> subsection and load only if non-zero.
> Also initialize icc_sre_el1 with to 0x7 in pre_load
> function.
>
> Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
> ---
>  hw/intc/arm_gicv3_common.c         | 32 ++++++++++++++++++++++++++++++++
>  include/hw/intc/arm_gicv3_common.h |  1 +
>  2 files changed, 33 insertions(+)
>
> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index 16b9b0f..e62480e 100644
> --- a/hw/intc/arm_gicv3_common.c
> +++ b/hw/intc/arm_gicv3_common.c
> @@ -70,6 +70,34 @@ static const VMStateDescription vmstate_gicv3_cpu_virt = {
>      }
>  };
>
> +static int icc_sre_el1_reg_pre_load(void *opaque)
> +{
> +    GICv3CPUState *cs = opaque;
> +
> +    /* By default enable SRE and disable IRQ & FIQ bypass. */
> +    cs->icc_sre_el1 = 0x7;

Why do we need the pre_load function? I would have
expected that reset would have given us these defaults
already.

> +    return 0;
> +}
> +
> +static bool icc_sre_el1_reg_needed(void *opaque)
> +{
> +    GICv3CPUState *cs = opaque;
> +
> +    return cs->icc_sre_el1 != 0;

I expected this to say "we need to transfer the value if
it isn't 0x7" (since the current situation of migration
is "we assume that the value is 0x7").

Something should probably fail inbound migration for TCG
if the value isn't 0x7, for that matter.

Is there a situation where KVM might allow a value other
than 0x7?

> +}
> +
> +const VMStateDescription vmstate_gicv3_cpu_sre_el1 = {
> +    .name = "arm_gicv3_cpu/sre_el1",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .pre_load = icc_sre_el1_reg_pre_load,
> +    .needed = icc_sre_el1_reg_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT64(icc_sre_el1, GICv3CPUState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static const VMStateDescription vmstate_gicv3_cpu = {
>      .name = "arm_gicv3_cpu",
>      .version_id = 1,
> @@ -100,6 +128,10 @@ static const VMStateDescription vmstate_gicv3_cpu = {
>      .subsections = (const VMStateDescription * []) {
>          &vmstate_gicv3_cpu_virt,
>          NULL
> +    },
> +    .subsections = (const VMStateDescription * []) {
> +        &vmstate_gicv3_cpu_sre_el1,
> +        NULL
>      }
>  };
>
> diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
> index 4156051..bccdfe1 100644
> --- a/include/hw/intc/arm_gicv3_common.h
> +++ b/include/hw/intc/arm_gicv3_common.h
> @@ -172,6 +172,7 @@ struct GICv3CPUState {
>      uint8_t gicr_ipriorityr[GIC_INTERNAL];
>
>      /* CPU interface */
> +    uint64_t icc_sre_el1;
>      uint64_t icc_ctlr_el1[2];
>      uint64_t icc_pmr_el1;
>      uint64_t icc_bpr[3];
> --
> 1.9.1

thanks
-- PMM
