Received: by 10.25.77.65 with SMTP id a62csp370152lfb;
        Fri, 27 Jan 2017 10:34:39 -0800 (PST)
X-Received: by 10.237.60.218 with SMTP id e26mr9442899qtf.208.1485542079433;
        Fri, 27 Jan 2017 10:34:39 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k186si4081532qke.328.2017.01.27.10.34.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jan 2017 10:34:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47332 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cXBM4-0006nz-N3
	for alex.bennee@linaro.org; Fri, 27 Jan 2017 13:34:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43955)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cXBLZ-0006GZ-Ge
	for qemu-arm@nongnu.org; Fri, 27 Jan 2017 13:34:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cXBLY-0006I1-IO
	for qemu-arm@nongnu.org; Fri, 27 Jan 2017 13:34:05 -0500
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:35206)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1cXBLT-0006GF-OB; Fri, 27 Jan 2017 13:33:59 -0500
Received: by mail-ot0-x244.google.com with SMTP id 65so31849789otq.2;
	Fri, 27 Jan 2017 10:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=gH+qlfY1nsH6LGydz7rZZ9sky85yBGsVb3qZqUTIESE=;
	b=E7DSp2Bsj4s3S7Ylby1l6tQqe08kH/No7GiOn57kyzgJVmGrdtNoVVjHZoW6mKcQAD
	RQfXrWn7/rsw4kdw7IUH/mPR303+dS+e36E/4xp3b2N/rLQ5CCWNjx0RwT4gFzey/S51
	iemYHI9FtXi2R62S2YUHwMjnvDWvYTllSkRy0JydDpSHyZpgHiz41BN8HCMIAKlML9jc
	NhKZk9z15rj54aAsAvARfY39F5LDESqW0F5vgYiIvPW6a0YLTBjbLnR5QhQsDGQx8OHj
	XUBASJxlfY4PdVHJBYYWblsTr85vxfMEfFIXitRrYob/lULp7MV1WoITKU5W2ZZ7y4iX
	LsCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=gH+qlfY1nsH6LGydz7rZZ9sky85yBGsVb3qZqUTIESE=;
	b=HDtygpvEIku7aLQsmUDNRNBiqtCBCjOZH5WrnuaxapzL49dPPLpylJnJBRWPHIim+x
	QjHxgWHYVOwWL64M2cdHS6HnyB6TWTg1TddnRSpXUTliOLW/QvAr8d0KV/OVrjrT4SKs
	IYrhHiq5ceHJRe/1Djhm4b5d3v8hWeE47lAHMnr6dpdXrRUf339RIU7/ONXNlazSRRYK
	830GwIILMwHikPGQ0UdBwmQT80UPKErpCasiIC4XuGGD6keJLWHaDS7U/c6xj7K+MQmV
	mriPcTucZLxkBdt8r/AO9Q66GF5wcYev5yFlYd48idoqR1JXLoAbkarYGKs61hoaS8z+
	fJkg==
X-Gm-Message-State: AIkVDXJRRfaCPdfdXkZDIPWmYeWj4zMw67MjKpUL/XjbcZ9IiVzYoxd57lzQ+z86zvAVTHXIqYz7xJsbCa3LVw==
X-Received: by 10.157.10.42 with SMTP id 39mr4870101otg.276.1485542039090;
	Fri, 27 Jan 2017 10:33:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.98.133 with HTTP; Fri, 27 Jan 2017 10:33:28 -0800 (PST)
In-Reply-To: <1485443388-27253-3-git-send-email-armbru@redhat.com>
References: <1485443388-27253-1-git-send-email-armbru@redhat.com>
	<1485443388-27253-3-git-send-email-armbru@redhat.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 27 Jan 2017 10:33:28 -0800
X-Google-Sender-Auth: oRcOUs3_9VNdSfZVrJwjtiZ1i5s
Message-ID: <CAKmqyKMhptS+ntt-PQjY4rsO+mEUf079N0AhYiKF4XRfeKLZHQ@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 2/8] hw/arm/cubieboard
 hw/arm/xlnx-ep108: Fix units_per_default_bus
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-block@nongnu.org,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tU8UEnUNT4nU

On Thu, Jan 26, 2017 at 7:09 AM, Markus Armbruster <armbru@redhat.com> wrote:
> Machine types cubieboard, xlnx-ep108, xlnx-zcu102 have an onboard AHCI
> controller, but neglect to set their MachineClass member
> units_per_default_bus = 1.  This permits -drive if=ide,unit=1, which
> makes no sense for AHCI.  It also screws up index=N for odd N, because
> it gets desugared to unit=1,bus=N/2
>
> Doesn't really matter, because these machine types fail to honor
> -drive if=ide.  Add the missing units_per_default_bus = 1 anyway,
> along with a TODO comment on what needs to be done for -drive if=ide.
>
> Also set block_default_type = IF_IDE explicitly.  It's currently the
> default, but the next commit will change it to something more
> sensible, and we want to keep the IF_IDE default for these three
> machines.  See also the previous commit.
>
> Cc: Beniamino Galvani <b.galvani@gmail.com>
> Cc: Alistair Francis <alistair.francis@xilinx.com>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Looks fine to me.

Acked-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

> ---
>  hw/arm/cubieboard.c | 4 ++++
>  hw/arm/xlnx-ep108.c | 6 ++++++
>  2 files changed, 10 insertions(+)
>
> diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
> index dd19ba3..b98e1c4 100644
> --- a/hw/arm/cubieboard.c
> +++ b/hw/arm/cubieboard.c
> @@ -71,6 +71,8 @@ static void cubieboard_init(MachineState *machine)
>      memory_region_add_subregion(get_system_memory(), AW_A10_SDRAM_BASE,
>                                  &s->sdram);
>
> +    /* TODO create and connect IDE devices for ide_drive_get() */
> +
>      cubieboard_binfo.ram_size = machine->ram_size;
>      cubieboard_binfo.kernel_filename = machine->kernel_filename;
>      cubieboard_binfo.kernel_cmdline = machine->kernel_cmdline;
> @@ -82,6 +84,8 @@ static void cubieboard_machine_init(MachineClass *mc)
>  {
>      mc->desc = "cubietech cubieboard";
>      mc->init = cubieboard_init;
> +    mc->block_default_type = IF_IDE;
> +    mc->units_per_default_bus = 1;
>  }
>
>  DEFINE_MACHINE("cubieboard", cubieboard_machine_init)
> diff --git a/hw/arm/xlnx-ep108.c b/hw/arm/xlnx-ep108.c
> index 4ec590a..860780a 100644
> --- a/hw/arm/xlnx-ep108.c
> +++ b/hw/arm/xlnx-ep108.c
> @@ -106,6 +106,8 @@ static void xlnx_ep108_init(MachineState *machine)
>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->soc.spi[i]), 1, cs_line);
>      }
>
> +    /* TODO create and connect IDE devices for ide_drive_get() */
> +
>      xlnx_ep108_binfo.ram_size = ram_size;
>      xlnx_ep108_binfo.kernel_filename = machine->kernel_filename;
>      xlnx_ep108_binfo.kernel_cmdline = machine->kernel_cmdline;
> @@ -118,6 +120,8 @@ static void xlnx_ep108_machine_init(MachineClass *mc)
>  {
>      mc->desc = "Xilinx ZynqMP EP108 board";
>      mc->init = xlnx_ep108_init;
> +    mc->block_default_type = IF_IDE;
> +    mc->units_per_default_bus = 1;
>  }
>
>  DEFINE_MACHINE("xlnx-ep108", xlnx_ep108_machine_init)
> @@ -126,6 +130,8 @@ static void xlnx_zcu102_machine_init(MachineClass *mc)
>  {
>      mc->desc = "Xilinx ZynqMP ZCU102 board";
>      mc->init = xlnx_ep108_init;
> +    mc->block_default_type = IF_IDE;
> +    mc->units_per_default_bus = 1;
>  }
>
>  DEFINE_MACHINE("xlnx-zcu102", xlnx_zcu102_machine_init)
> --
> 2.7.4
>
>
