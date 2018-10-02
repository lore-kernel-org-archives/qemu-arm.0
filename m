Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5634751wrt;
        Tue, 2 Oct 2018 16:29:07 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61c/lspiVg858wIuVZxlY+wy5DqoJaI4+JoAVdsvwWeoyErWCoLJycKkskR3RlMiho74XGB
X-Received: by 2002:a05:6214:114e:: with SMTP id b14mr11877590qvt.169.1538522947761;
        Tue, 02 Oct 2018 16:29:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538522947; cv=none;
        d=google.com; s=arc-20160816;
        b=T6/aYCZzdrEJ1cjQfkuC4PNzFf7OmbsT0mMZ+wp0Sad1PmsmoaTJFOLjtgiM7NE9W+
         g9r+IY7pt/kP2lV2xWgGeEf8lycnwmXPp0uLOWbSlimRWxXhP+UnIrbVRxnx6vnhkgIS
         tNltydY4nLbz3fGb5rl/5E/Q46pYjY0eTkMvTYkvLZkYi5k254197+lotVWDNaNBaJkq
         ouyzLrPkp1cqqIOG4iKPh9SfGuShHN9+FOHepS9xu2XHvKWKFRIfjwg8rPfqzJ6aAwpu
         sKv28AatN/RkFnogkuysI4uLd5tsry+6QAs9fpHBezw9nX1DMXjK5gYcgB0FbqGr4Sil
         u3qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=vMwBU4J4i4XYAPXeAL2mWoI6FriNk3n57mhxzEFiI4s=;
        b=FJRVtB2uUUgnBk1tgf+5r5rfLlkXqYz6AyrosnaoCH8hbzGEZpSK7PX7gYR67SExLD
         DJRnY0CgZoo68t3ZRdJ42KUtcI4LNzARZaKuvFcPJhT7jeoY5vWvtT0R74QS/EZDw5+B
         ylWJNVjMljXLE2vZUCHZpygTEfnO3j3IFQsrc/KlNnLW1P/OFWZJFDRYydAKR6/VYvmp
         3rqeOC7+LrVzS36NEEOpj4dhHiP71Mi2nZZf327oQ5SfVDcHRAP0XRtOQjf3TFWJsD+D
         ww5yYxRtda4mN8gnXBxfJ8FQYGx6Ffg1mbWvJYV1eVjEmREol4Jr/NJfOmTv38g4gs0d
         Vn+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i10-v6si1756987qtm.305.2018.10.02.16.29.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 16:29:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46227 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7U6F-0003PQ-8y
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 19:29:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43975)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g7U5k-0003DE-9j
	for qemu-devel@nongnu.org; Tue, 02 Oct 2018 19:28:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g7U5Z-0007CW-Nx
	for qemu-devel@nongnu.org; Tue, 02 Oct 2018 19:28:30 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37047)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g7U5U-000730-JN
	for qemu-devel@nongnu.org; Tue, 02 Oct 2018 19:28:23 -0400
Received: by mail-wr1-f65.google.com with SMTP id u12-v6so4043099wrr.4
	for <qemu-devel@nongnu.org>; Tue, 02 Oct 2018 16:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=vMwBU4J4i4XYAPXeAL2mWoI6FriNk3n57mhxzEFiI4s=;
	b=Kq/+p/YeAbpHBqJ7DG6ONrmM31f9G/52N0i3arEWEIb1CmDSdLKDNxykEYQWWt6ejT
	Vd9zUGS2vCxH4rGTOjOWGME/1DkpAjMQ9QiKSeCb1cs7J3sUfQQv9crD3R5a9ou6P53R
	M/yfrfX9fwGX1J7WSSBkqHg5LkHQKqIFqdHLnRdMblfC6UhHtcdu2hGHxl3UjMUy/Af5
	n5xdRKglP20O39mZL3TiVfIZ7aj19wBPcVFQqLpj8u7gVvrUOez8XY/jFfFTpxsCPf6i
	I7AkZkRKMXBbZSR5pBZ/RGEKU6vSUCJDAnWDxPeCKaV1ssNjXk3BPHcq/qEAR0lgk5EJ
	rPbA==
X-Gm-Message-State: ABuFfoiysndl7QgI8ikFTX58TKjfTgyrmuqN9u0cmFDTb08zmUqS9JuP
	py8P2pyFlK1BP4aNF9e9KYeCfA==
X-Received: by 2002:adf:f00d:: with SMTP id
	j13-v6mr10885014wro.88.1538522896610; 
	Tue, 02 Oct 2018 16:28:16 -0700 (PDT)
Received: from [192.168.2.51] (26.red-83-32-208.dynamicip.rima-tde.net.
	[83.32.208.26]) by smtp.gmail.com with ESMTPSA id
	a105-v6sm43498837wrc.23.2018.10.02.16.28.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Oct 2018 16:28:15 -0700 (PDT)
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20181002142443.30976-1-damien.hedde@greensocs.com>
	<20181002142443.30976-10-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <66b12ef2-5e26-907d-7df8-d0982d7016d5@redhat.com>
Date: Wed, 3 Oct 2018 01:28:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181002142443.30976-10-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-devel] [PATCH v5 9/9] hw/arm/xilinx_zynq: connect uart
 clocks to slcr
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, konrad@adacore.com,
	luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E/V/QhoD7X0h

On 10/2/18 4:24 PM, Damien Hedde wrote:
> Add the connection between the slcr's output clocks and the uarts inputs.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>  hw/arm/xilinx_zynq.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index f1496d2927..88f61c6a18 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -166,7 +166,7 @@ static void zynq_init(MachineState *machine)
>      MemoryRegion *address_space_mem = get_system_memory();
>      MemoryRegion *ext_ram = g_new(MemoryRegion, 1);
>      MemoryRegion *ocm_ram = g_new(MemoryRegion, 1);
> -    DeviceState *dev;
> +    DeviceState *dev, *slcr;
>      SysBusDevice *busdev;
>      qemu_irq pic[64];
>      int n;
> @@ -212,9 +212,10 @@ static void zynq_init(MachineState *machine)
>                            1, 0x0066, 0x0022, 0x0000, 0x0000, 0x0555, 0x2aa,
>                                0);
>  
> -    dev = qdev_create(NULL, "xilinx,zynq_slcr");
> -    qdev_init_nofail(dev);
> -    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xF8000000);
> +    /* Create slcr, keep a pointer to connect clocks */
> +    slcr = qdev_create(NULL, "xilinx,zynq_slcr");
> +    qdev_init_nofail(slcr);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(slcr), 0, 0xF8000000);
>  
>      dev = qdev_create(NULL, TYPE_A9MPCORE_PRIV);
>      qdev_prop_set_uint32(dev, "num-cpu", 1);
> @@ -235,8 +236,12 @@ static void zynq_init(MachineState *machine)
>      sysbus_create_simple("xlnx,ps7-usb", 0xE0002000, pic[53-IRQ_OFFSET]);
>      sysbus_create_simple("xlnx,ps7-usb", 0xE0003000, pic[76-IRQ_OFFSET]);
>  
> -    cadence_uart_create(0xE0000000, pic[59 - IRQ_OFFSET], serial_hd(0));
> -    cadence_uart_create(0xE0001000, pic[82 - IRQ_OFFSET], serial_hd(1));
> +    dev = cadence_uart_create(0xE0000000, pic[59 - IRQ_OFFSET], serial_hd(0));
> +    qdev_connect_clock(dev, "busclk", slcr, "uart0_amba_clk", &error_abort);
> +    qdev_connect_clock(dev, "refclk", slcr, "uart0_ref_clk", &error_abort);
> +    dev = cadence_uart_create(0xE0001000, pic[82 - IRQ_OFFSET], serial_hd(1));
> +    qdev_connect_clock(dev, "busclk", slcr, "uart1_amba_clk", &error_abort);
> +    qdev_connect_clock(dev, "refclk", slcr, "uart1_ref_clk", &error_abort);
>  
>      sysbus_create_varargs("cadence_ttc", 0xF8001000,
>              pic[42-IRQ_OFFSET], pic[43-IRQ_OFFSET], pic[44-IRQ_OFFSET], NULL);
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
