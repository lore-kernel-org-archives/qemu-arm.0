Received: by 10.25.205.13 with SMTP id d13csp709765lfg;
        Tue, 17 Jan 2017 13:52:53 -0800 (PST)
X-Received: by 10.237.32.70 with SMTP id 64mr16091912qta.163.1484689973284;
        Tue, 17 Jan 2017 13:52:53 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k54si17584247qtb.83.2017.01.17.13.52.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Jan 2017 13:52:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37853 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cTbgQ-0000qE-Hp
	for alex.bennee@linaro.org; Tue, 17 Jan 2017 16:52:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52633)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cTbei-0000Dc-3j
	for qemu-devel@nongnu.org; Tue, 17 Jan 2017 16:51:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cTbeh-0006GH-4m
	for qemu-devel@nongnu.org; Tue, 17 Jan 2017 16:51:04 -0500
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:36744)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1cTbee-0006Eb-QN; Tue, 17 Jan 2017 16:51:00 -0500
Received: by mail-oi0-x243.google.com with SMTP id u143so15815109oif.3;
	Tue, 17 Jan 2017 13:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=KJyLAVSsUEMQYCSJFHZRPb5Zg3T8j33QnO5w8oQSEEQ=;
	b=QTkLFf5H2iyRLEln/8AqPxDF/mdhR3MmPgJh9jXhPVXLTT4C6AjzceK2HcnL5k/MSn
	DjKrErZ0jEILVSySournYLcjVWvGrCEnd9GGuAq0XEiA/2iMdg8emc1Z4IwnjzIEvbGU
	/1VD1ZuzDj60/cojEbGIrSrHVdEU3a6pA95fV49PAR/afAq2w4EiMpE7KataCCJ4zdxM
	yHnp01/0rcvShF+hLR8xlh/0P/OezrVhoXB5vyR7BmJAj1t6wt7rxy4P5EhugO9p9uWU
	MKaxq07LZPZD5BfgJueYk4ZYanRFaGWl2N0eV1Elv47OjhvS+XC0wMXS4Fiiw1EWDz9D
	O3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=KJyLAVSsUEMQYCSJFHZRPb5Zg3T8j33QnO5w8oQSEEQ=;
	b=gHY2QGEbQcnXEjWkSQJ03CRdANKn6DKBo1zxvpBDCnc7nLjvRYcwPvmf6YFSFMGvfG
	CCHlJstNgAfWrIq6am245hcxazUe3fZdpgBIybWJtXCBvC1gZ0s67lBP0BHlRpQt691L
	tFkFj2my6LLaUZ774PW0vCrQl/tO/PtuRQyOCmFtJlxtv4kLv9X2dcSeCvRJFcofA9yt
	YUf1qDHUS0HtLXCpxS6RLv/phEhSBdAFWNIsFtPlG7iWpCilAGaOY4vLtgXipIzWiqRg
	w6JiZbWPF0NPBrc2GLIzAMhirstZSW0/anVD4JoPsj7qM/0UgeeEoipUFsbCqA0xfDwK
	qJ2A==
X-Gm-Message-State: AIkVDXKXCr4ipkSeiFC78gbQCo9ZFy7MAZHVAmnYc4JwgL7Os+cXJ4Hgh/Mx1+xTSjSI9uAHX0jTKZqTLwDfYw==
X-Received: by 10.202.236.11 with SMTP id k11mr18938485oih.166.1484689859994; 
	Tue, 17 Jan 2017 13:50:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.98.133 with HTTP; Tue, 17 Jan 2017 13:50:29 -0800 (PST)
In-Reply-To: <1483977924-14522-4-git-send-email-peter.maydell@linaro.org>
References: <1483977924-14522-1-git-send-email-peter.maydell@linaro.org>
	<1483977924-14522-4-git-send-email-peter.maydell@linaro.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 17 Jan 2017 13:50:29 -0800
X-Google-Sender-Auth: R51t7Dcw98WPY_wBsiVOQFZvPik
Message-ID: <CAKmqyKMwZkstNyKe32N=a0eZrrj6W_14t2meeOdmHHpnDovD8A@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-devel] [PATCH v2 03/18] target-arm: Expose output GPIO
 line for VCPU maintenance interrupt
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Andrew Jones <drjones@redhat.com>, Patch Tracking <patches@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XJ8RZSAeX4LT

On Mon, Jan 9, 2017 at 8:05 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> The GICv3 support for virtualization includes an outbound
> maintenance interrupt signal which is asserted when the
> CPU interface wants to signal to the hypervisor that it
> needs attention. Expose this as an outbound GPIO line from
> the CPU object which can be wired up as a physical interrupt
> line by the board code (as we do already for the CPU timers).
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

> ---
>  target/arm/cpu.h | 2 ++
>  target/arm/cpu.c | 3 +++
>  2 files changed, 5 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index ab119e6..764b511 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -555,6 +555,8 @@ struct ARMCPU {
>      QEMUTimer *gt_timer[NUM_GTIMERS];
>      /* GPIO outputs for generic timer */
>      qemu_irq gt_timer_outputs[NUM_GTIMERS];
> +    /* GPIO output for GICv3 maintenance interrupt signal */
> +    qemu_irq gicv3_maintenance_interrupt;
>
>      /* MemoryRegion to use for secure physical accesses */
>      MemoryRegion *secure_memory;
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index f5cb30a..8932086 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -466,6 +466,9 @@ static void arm_cpu_initfn(Object *obj)
>                                                  arm_gt_stimer_cb, cpu);
>      qdev_init_gpio_out(DEVICE(cpu), cpu->gt_timer_outputs,
>                         ARRAY_SIZE(cpu->gt_timer_outputs));
> +
> +    qdev_init_gpio_out_named(DEVICE(cpu), &cpu->gicv3_maintenance_interrupt,
> +                             "gicv3-maintenance-interrupt", 1);
>  #endif
>
>      /* DTB consumers generally don't in fact care what the 'compatible'
> --
> 2.7.4
>
>
