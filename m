Received: by 10.25.77.65 with SMTP id a62csp2202839lfb;
        Tue, 7 Feb 2017 06:42:26 -0800 (PST)
X-Received: by 10.55.170.17 with SMTP id t17mr14300258qke.15.1486478546344;
        Tue, 07 Feb 2017 06:42:26 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k5si3093999qta.43.2017.02.07.06.42.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Feb 2017 06:42:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54450 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cb6yN-0008OC-MO
	for alex.bennee@linaro.org; Tue, 07 Feb 2017 09:42:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48359)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cb6vg-000645-NV
	for qemu-arm@nongnu.org; Tue, 07 Feb 2017 09:39:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cb6vf-00038l-Rg
	for qemu-arm@nongnu.org; Tue, 07 Feb 2017 09:39:36 -0500
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f]:35154)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cb6vf-00038I-Le
	for qemu-arm@nongnu.org; Tue, 07 Feb 2017 09:39:35 -0500
Received: by mail-wm0-x22f.google.com with SMTP id v186so14045615wmd.0
	for <qemu-arm@nongnu.org>; Tue, 07 Feb 2017 06:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DO9FrO6bmSTXWyHC8/qY+G2orLZmCmGFTifIp9Izpv8=;
	b=IWERN8y0yti+DmbxTj2hq0lxH+e3MEEfR8C6nTriAAayykzWkKoufbPN//wNJtItT/
	mUddftfHYvyGrHFy5b0Nrn2hIJaTFgTg+isQGvj9Yozpcmf3HYbAQ0v6G/Mh4NW5ntON
	1ScQVQMcwV+VcttMnmpYr7GbRffElq7P9JLRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DO9FrO6bmSTXWyHC8/qY+G2orLZmCmGFTifIp9Izpv8=;
	b=K+Gng5XLLl7sp9YlEKAvUik2/KT7QZwEiQMKZ9pWuyDiuxcU6zwLLVePGl8NOcVVgD
	VGv/r8ZsiJdg4xC7i4PbMh7fSDsmkTa/HAYp7lN5Xw8mh1hmLo8x9oQPwPO9Y6mspsRt
	OwN0kSpCJsQXVPeYlwXButNaIcZtGOAz9zmlOapAWDhVbzJkaEqd5FxqaVEhEiRdvfig
	upEZOHzllraal+rXaeKJBdCpoBxZcnlUBTobXwTk9tevIVuW7IxDGjamWD2SgEwtQR4E
	7Qp8IxE3gvItnlgKGU7EinRKGo5tTAMAiNUd7HRGpju9IAwLIe4/umnYJmXCngFx4AXL
	01sQ==
X-Gm-Message-State: AIkVDXI3oToURajWuEGGKPYS645eAzPJeum4FvJeIyGUFZahdDRWcRrANhBOUylhKUCE/Tb+CkZS0ILu53x4u861
X-Received: by 10.223.142.131 with SMTP id q3mr14035301wrb.195.1486478374447; 
	Tue, 07 Feb 2017 06:39:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Tue, 7 Feb 2017 06:39:13 -0800 (PST)
In-Reply-To: <1485879782-6075-3-git-send-email-vijay.kilari@gmail.com>
References: <1485879782-6075-1-git-send-email-vijay.kilari@gmail.com>
	<1485879782-6075-3-git-send-email-vijay.kilari@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2017 14:39:13 +0000
Message-ID: <CAFEAcA_K2TcihHTTrrr7kZ3pGZ3BNptDb0mt5Rc0YinkGD1eHQ@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22f
Subject: Re: [Qemu-arm] [PATCH v7 RESEND 2/5] hw/intc/arm_gicv3_kvm: Add
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
X-TUID: HNz9krCuu2Qk

On 31 January 2017 at 16:22,  <vijay.kilari@gmail.com> wrote:
> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>
> To Save and Restore ICC_SRE_EL1 register Add ICC_SRE_EL1 register
> to vmstate and GICv3CPUState struct.
>
> Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
> ---
>  hw/intc/arm_gicv3_common.c         | 1 +
>  include/hw/intc/arm_gicv3_common.h | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index 0f8c4b8..f3245d9 100644
> --- a/hw/intc/arm_gicv3_common.c
> +++ b/hw/intc/arm_gicv3_common.c
> @@ -68,6 +68,7 @@ static const VMStateDescription vmstate_gicv3_cpu = {
>          VMSTATE_UINT32(gicr_igrpmodr0, GICv3CPUState),
>          VMSTATE_UINT32(gicr_nsacr, GICv3CPUState),
>          VMSTATE_UINT8_ARRAY(gicr_ipriorityr, GICv3CPUState, GIC_INTERNAL),
> +        VMSTATE_UINT64(icc_sre_el1, GICv3CPUState),
>          VMSTATE_UINT64_ARRAY(icc_ctlr_el1, GICv3CPUState, 2),
>          VMSTATE_UINT64(icc_pmr_el1, GICv3CPUState),
>          VMSTATE_UINT64_ARRAY(icc_bpr, GICv3CPUState, 3),
> diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
> index 341a311..183c7f8 100644
> --- a/include/hw/intc/arm_gicv3_common.h
> +++ b/include/hw/intc/arm_gicv3_common.h
> @@ -166,6 +166,7 @@ struct GICv3CPUState {
>      uint8_t gicr_ipriorityr[GIC_INTERNAL];
>
>      /* CPU interface */
> +    uint64_t icc_sre_el1;
>      uint64_t icc_ctlr_el1[2];
>      uint64_t icc_pmr_el1;
>      uint64_t icc_bpr[3];

This breaks migration compatibility for TCG using GICv3; you
need to do something here with a VMState subsection so
the new register is only transferred if it's non-zero.

thanks
-- PMM
