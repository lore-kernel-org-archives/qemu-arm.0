Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4491707lfk;
        Mon, 7 Feb 2022 06:33:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHadyEagufXkzC6502TbARP5/WWpPPtmKsq6eH2dj7M3bjr545RCqgFtcS66CmoU58Lo0C
X-Received: by 2002:a05:690c:3a0:: with SMTP id bh32mr27787ywb.59.1644244416151;
        Mon, 07 Feb 2022 06:33:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644244416; cv=none;
        d=google.com; s=arc-20160816;
        b=cX2C5sLs0OtzDPWMSkq5bl5PYwfNHqmZ3jLmf+k2SGqpzkOtoOEuN13vxvKH81fuBH
         WBxPxPD4LEXXhV3KsPnft7ZEusLHR4hkZoKbThBUGOLp32prCwHXOXnP2YGhLZW+uRlB
         qODYRZ56yUJN6GYEoV4+iZg4jjqPtLtK+yRS3gVKERA6LobM68vGJDEEv9KF8O07isqh
         ZJ1ws6nqvc3niPAPvS/L3PBoomUEf7bnXD3kM3ayzNhDeDwEmRmqmjwvJCgcWvwed1FN
         7i03dAErwgctwGzBlLDfZ/ZUz7kj8es4r3zOykJjPEGSPcqpAEVDDeTiu/QGV1NEGiLp
         WpKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:subject:user-agent:mime-version:date
         :message-id;
        bh=TUqegQnIC1ahAvqnJHoA4ZQ8T23t4/HN2h4jHw6VQso=;
        b=l2ySdnO5BTuemeUpy9lZbUtjxjUyzoxY2J9jDn0ov3P5ktu4lHlWOBzYIvjhLGOfny
         jdShp5i092SAmKI3sTLw+1CpQoV9nBoYTI8d2viK6X4DGnzUVvsebq7pyfQ+i1QUXRRU
         WS3IVzpBZPyVZLMr0cZ7ClMX68BasOzGw05qB1uGbgR7hob+o7ATNcyFaEWMJG+a9zsp
         pB7LbaUTLilYwpTwJ7hg4Ai6tA00nBlkM646flEaKnCcrR6rjP3uh/1j/+bNCgwp5CHE
         9IZN3G/7WJCVNZ3XhF9kDQQwLLUYadhtCMRseMg3a6u+vqRrmrlRy+VUKDZA1CyGtkur
         FLcw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n137si4399978ybg.402.2022.02.07.06.33.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Feb 2022 06:33:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nH55D-0004px-JF
	for alex.bennee@linaro.org; Mon, 07 Feb 2022 09:33:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1nH4tY-00016r-5F; Mon, 07 Feb 2022 09:21:32 -0500
Received: from mail.csgraf.de ([85.25.223.15]:33676 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1nH4tT-0005Tm-AV; Mon, 07 Feb 2022 09:21:29 -0500
Received: from [0.0.0.0] (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com
 [3.122.114.9]) by csgraf.de (Postfix) with ESMTPSA id 5EB826080AD5;
 Mon,  7 Feb 2022 15:21:17 +0100 (CET)
Message-ID: <2c67bde5-65b2-0af0-afde-7353a4fe2a1b@csgraf.de>
Date: Mon, 7 Feb 2022 15:21:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 06/16] hw/arm/xlnx-zcu102: Don't enable PSCI conduit when
 booting guest in EL3
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
 <20220127154639.2090164-7-peter.maydell@linaro.org>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <20220127154639.2090164-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Rob Herring <robh@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Andre Przywara <andre.przywara@arm.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Yanan Wang <wangyanan55@huawei.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, sstabellini@kernel.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, michal.simek@xilinx.com,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DWj5Mc0/CJj6


On 27.01.22 16:46, Peter Maydell wrote:
> Change the Xilinx ZynqMP-based board xlnx-zcu102 to use the new
> boot.c functionality to allow us to enable psci-conduit only if
> the guest is being booted in EL1 or EL2, so that if the user runs
> guest EL3 firmware code our PSCI emulation doesn't get in its
> way.
>
> To do this we stop setting the psci-conduit property on the CPU
> objects in the SoC code, and instead set the psci_conduit field in
> the arm_boot_info struct to tell the common boot loader code that
> we'd like PSCI if the guest is starting at an EL that it makes
> sense with.
>
> Note that this means that EL3 guest code will have no way
> to power on secondary cores, because we don't model any
> kind of power controller that does that on this SoC.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>


It's been a while since I worked with ZynqMP, but typically your ATF in 
EL3 will want to talk to a microblaze firmware blob on the PMU.

I only see a stand alone PMU machine for microblaze and a PMU IRQ 
handling I/O block in QEMU, but nothing that would listen to the events. 
So I'm fairly sure it will be broken after this patch - and really only 
worked by accident before.

I've added Michal Simek and Stefano Stabellini (both Xilinx) to CC to 
clarify and determine the best path forward here - either disallow EL3 
in the model or build proper PMU emulation in QEMU which then handles 
those PSCI triggered IPI events.


Alex

[1] 
https://github.com/Xilinx/arm-trusted-firmware/blob/master/plat/xilinx/zynqmp/plat_psci.c


> ---
> Again, if anybody knows the real-hardware EL3 behaviour for
> CPUs that would be great.
> ---
>   hw/arm/xlnx-zcu102.c |  1 +
>   hw/arm/xlnx-zynqmp.c | 13 ++++++++-----
>   2 files changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
> index 45eb19ab3b7..4c84bb932aa 100644
> --- a/hw/arm/xlnx-zcu102.c
> +++ b/hw/arm/xlnx-zcu102.c
> @@ -236,6 +236,7 @@ static void xlnx_zcu102_init(MachineState *machine)
>       s->binfo.ram_size = ram_size;
>       s->binfo.loader_start = 0;
>       s->binfo.modify_dtb = zcu102_modify_dtb;
> +    s->binfo.psci_conduit = QEMU_PSCI_CONDUIT_SMC;
>       arm_load_kernel(s->soc.boot_cpu_ptr, machine, &s->binfo);
>   }
>   
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 1c52a575aad..17305fe7b76 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -215,7 +215,10 @@ static void xlnx_zynqmp_create_rpu(MachineState *ms, XlnxZynqMPState *s,
>   
>           name = object_get_canonical_path_component(OBJECT(&s->rpu_cpu[i]));
>           if (strcmp(name, boot_cpu)) {
> -            /* Secondary CPUs start in PSCI powered-down state */
> +            /*
> +             * Secondary CPUs start in powered-down state.
> +             * TODO: check this is what EL3 firmware expects.
> +             */
>               object_property_set_bool(OBJECT(&s->rpu_cpu[i]),
>                                        "start-powered-off", true, &error_abort);
>           } else {
> @@ -435,12 +438,12 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>       for (i = 0; i < num_apus; i++) {
>           const char *name;
>   
> -        object_property_set_int(OBJECT(&s->apu_cpu[i]), "psci-conduit",
> -                                QEMU_PSCI_CONDUIT_SMC, &error_abort);
> -
>           name = object_get_canonical_path_component(OBJECT(&s->apu_cpu[i]));
>           if (strcmp(name, boot_cpu)) {
> -            /* Secondary CPUs start in PSCI powered-down state */
> +            /*
> +             * Secondary CPUs start in powered-down state.
> +             * TODO: check this is what EL3 firmware expects.
> +             */
>               object_property_set_bool(OBJECT(&s->apu_cpu[i]),
>                                        "start-powered-off", true, &error_abort);
>           } else {
