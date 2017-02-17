Received: by 10.25.77.65 with SMTP id a62csp69884lfb;
        Fri, 17 Feb 2017 01:05:57 -0800 (PST)
X-Received: by 10.55.92.198 with SMTP id q189mr5996810qkb.86.1487322357070;
        Fri, 17 Feb 2017 01:05:57 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q33si7083380qtd.32.2017.02.17.01.05.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Feb 2017 01:05:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52295 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ceeUG-0003lu-DD
	for alex.bennee@linaro.org; Fri, 17 Feb 2017 04:05:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ceeER-0005lp-Fv
	for qemu-devel@nongnu.org; Fri, 17 Feb 2017 03:49:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ceeEQ-0006uE-Bf
	for qemu-devel@nongnu.org; Fri, 17 Feb 2017 03:49:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34760)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ceeEK-0006oz-TK; Fri, 17 Feb 2017 03:49:29 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D33707E9CC;
	Fri, 17 Feb 2017 08:49:27 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-36.ams2.redhat.com
	[10.36.116.36])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1H8nOtS013940
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 17 Feb 2017 03:49:25 -0500
To: vijay.kilari@gmail.com, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	christoffer.dall@linaro.org
References: <1487313115-9510-1-git-send-email-vijay.kilari@gmail.com>
	<1487313115-9510-3-git-send-email-vijay.kilari@gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <1373f592-b2f3-e686-7517-51c51e7bb898@redhat.com>
Date: Fri, 17 Feb 2017 09:49:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1487313115-9510-3-git-send-email-vijay.kilari@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 17 Feb 2017 08:49:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v8 2/5] hw/intc/arm_gicv3_kvm: Add
 ICC_SRE_EL1 register to vmstate
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
Cc: marc.zyngier@arm.com, p.fedin@samsung.com, qemu-devel@nongnu.org,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TC3P66kWZpKJ

Hi,

On 17/02/2017 07:31, vijay.kilari@gmail.com wrote:
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
> +    return 0;
> +}
> +
> +static bool icc_sre_el1_reg_needed(void *opaque)
> +{
> +    GICv3CPUState *cs = opaque;
> +
> +    return cs->icc_sre_el1 != 0;
Don't you tell that the reset value is always != 0. In that case the
subsection will be always sent, right?

If we don't want to send it for TCG, shouldn't we compare against 0xf
(TCG reset value you mentioned in a previous email)

Thanks

Eric
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
> 
