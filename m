Received: by 10.25.77.65 with SMTP id a62csp2203605lfb;
        Tue, 7 Feb 2017 06:44:20 -0800 (PST)
X-Received: by 10.237.35.84 with SMTP id i20mr16078785qtc.247.1486478659945;
        Tue, 07 Feb 2017 06:44:19 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b38si3092077qte.185.2017.02.07.06.44.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Feb 2017 06:44:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54455 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cb70D-00015G-Cx
	for alex.bennee@linaro.org; Tue, 07 Feb 2017 09:44:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49423)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cb6yy-0000Tw-J8
	for qemu-devel@nongnu.org; Tue, 07 Feb 2017 09:43:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cb6yu-0006d1-2e
	for qemu-devel@nongnu.org; Tue, 07 Feb 2017 09:43:00 -0500
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:35152)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cb6yt-0006ci-Sk
	for qemu-devel@nongnu.org; Tue, 07 Feb 2017 09:42:56 -0500
Received: by mail-wm0-x22d.google.com with SMTP id v186so14175665wmd.0
	for <qemu-devel@nongnu.org>; Tue, 07 Feb 2017 06:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jxeW+0W+3J9iIMhL0ITSQC6OOLSSN1cTMNSayjOsuF8=;
	b=Tlps/wYPvFMZaw2U6/QbSnOUW0L6kN8Vl2ayxa87QJzi/EUVEQsuJ/TuDwJ6ryh/pl
	BaHlbTn6eEe4rQK+DHTrkgULVQlxdvMw9UdnCLf6j6DEPg7ZbjPFv/GUmnZO/toEPt1l
	vfEzPEgpRXFDHWQTDvVXQoslHOsVbsuqYRtqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jxeW+0W+3J9iIMhL0ITSQC6OOLSSN1cTMNSayjOsuF8=;
	b=M7yFiCCol88Qp16TloyS5ePAAN3cs0RdGLF5dQ9xiLaRJt8JmC55QYczXAJBBRXouF
	+BuC+Y+XCzcY5i6sffwMIkP+NsmrLrWDW4/oZ3OjrPsVjoHzsUPxwmRYz9GPjKYZ/Aoh
	5em23BtbTZve6zGcW9kx3/JUjiNWTrT+U84G+oTi7Pl2QiIeaoqpDRDZlIzopUIx1jXd
	xMcsVl8BZjbBnTlaRiQq1XnMz/YAz812OyXvecGiyRJls6M9Re4OiMtjlzf9WcMTbGRw
	66k79yUdvTPkw+JQstR12A0/SXJboJB0ReTQVrAl9r8BVvfLUeFh2oUy8OS0nCnzsSkn
	IALA==
X-Gm-Message-State: AMke39lxm9qqfEiJ9cRcWXivlzw1iDhPUt4CNrwMZuydnWVq4AClMky5HLQylwgluxPV60a4lRuRsBFyXYLRf3Yd
X-Received: by 10.28.4.10 with SMTP id 10mr14615299wme.142.1486478574753; Tue,
	07 Feb 2017 06:42:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Tue, 7 Feb 2017 06:42:34 -0800 (PST)
In-Reply-To: <1485879782-6075-5-git-send-email-vijay.kilari@gmail.com>
References: <1485879782-6075-1-git-send-email-vijay.kilari@gmail.com>
	<1485879782-6075-5-git-send-email-vijay.kilari@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2017 14:42:34 +0000
Message-ID: <CAFEAcA-Kty3EynELrP88fgNoFj3njh1w6XZ5DOpNsTC7edPmng@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22d
Subject: Re: [Qemu-devel] [PATCH v7 RESEND 4/5] target-arm: Add
 GICv3CPUState in CPUARMState struct
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
Cc: Marc Zyngier <marc.zyngier@arm.com>, Pavel Fedin <p.fedin@samsung.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>,
	Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RRpwyaEaXxOj

On 31 January 2017 at 16:23,  <vijay.kilari@gmail.com> wrote:
> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>
> Add gicv3state void pointer to CPUARMState struct
> to store GICv3CPUState.
>
> In case of usecase like CPU reset, we need to reset
> GICv3CPUState of the CPU. In such scenario, this pointer
> becomes handy.
>
> This patch take care of only GICv3.
>
> Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
> ---
>  hw/intc/arm_gicv3_kvm.c | 8 ++++++++
>  target-arm/cpu.h        | 2 ++
>  2 files changed, 10 insertions(+)
>
> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
> index 77af32d..f91e0ac 100644
> --- a/hw/intc/arm_gicv3_kvm.c
> +++ b/hw/intc/arm_gicv3_kvm.c
> @@ -644,6 +644,14 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
>
>      gicv3_init_irqs_and_mmio(s, kvm_arm_gicv3_set_irq, NULL);
>
> +    for (i = 0; i < s->num_cpu; i++) {
> +        ARMCPU *cpu = ARM_CPU(qemu_get_cpu(i));
> +        CPUARMState *env = &cpu->env;
> +
> +        /* Store GICv3CPUState in CPUARMState gicv3state pointer */
> +        env->gicv3state = (void *)&s->cpu[i];
> +    }
> +
>      /* Try to create the device via the device control API */
>      s->dev_fd = kvm_create_device(kvm_state, KVM_DEV_TYPE_ARM_VGIC_V3, false);
>      if (s->dev_fd < 0) {

Please set the CPU's pointer to the GICv3 in arm_gicv3_common_realize(),
because that's where we set the GICv3's pointer to the CPU.
(We don't want the pointer to be specific to the KVM GICv3
anyway.)

thanks
-- PMM
