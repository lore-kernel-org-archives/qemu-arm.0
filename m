Received: by 10.25.150.194 with SMTP id y185csp2126610lfd;
        Tue, 22 Nov 2016 08:56:38 -0800 (PST)
X-Received: by 10.55.92.199 with SMTP id q190mr22626853qkb.303.1479833798094;
        Tue, 22 Nov 2016 08:56:38 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m38si9514806qtf.200.2016.11.22.08.56.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Nov 2016 08:56:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56669 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c9EN3-0000v1-JG
	for alex.bennee@linaro.org; Tue, 22 Nov 2016 11:56:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45651)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1c9EMx-0000ur-7Q
	for qemu-arm@nongnu.org; Tue, 22 Nov 2016 11:56:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1c9EMs-0007nH-9j
	for qemu-arm@nongnu.org; Tue, 22 Nov 2016 11:56:31 -0500
Received: from 1.mo69.mail-out.ovh.net ([178.33.251.173]:36743)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1c9EMs-0007m2-36
	for qemu-arm@nongnu.org; Tue, 22 Nov 2016 11:56:26 -0500
Received: from player798.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo69.mail-out.ovh.net (Postfix) with ESMTP id D4E94BDDF
	for <qemu-arm@nongnu.org>; Tue, 22 Nov 2016 17:56:23 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player798.ha.ovh.net (Postfix) with ESMTPSA id 0BDC05400AA;
	Tue, 22 Nov 2016 17:56:14 +0100 (CET)
To: Alastair D'Silva <alastair@au1.ibm.com>, qemu-arm@nongnu.org
References: <1479357400-17441-1-git-send-email-alastair@au1.ibm.com>
	<1479357400-17441-5-git-send-email-alastair@au1.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <948f93ef-50d3-a450-c69f-faefd078f00d@kaod.org>
Date: Tue, 22 Nov 2016 17:56:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1479357400-17441-5-git-send-email-alastair@au1.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 8698139734211529495
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrvdehgdelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.33.251.173
Subject: Re: [Qemu-arm] [PATCH 4/4] arm: Add an RX8900 RTC to the ASpeed
 board
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	Alastair D'Silva <alastair@d-silva.org>, qemu-devel@nongnu.org,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZfNO5sDRLPYD

On 11/17/2016 05:36 AM, Alastair D'Silva wrote:
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> Connect an RX8900 RTC to i2c12 of the AST2500 SOC at address 0x32

If this is a board device, we should include it under a machine routine.

Is that for the palmetto ? The ast2500 does not have a RTC.

Thanks,

C. 

> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>  hw/arm/aspeed.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index c7206fd..554ae20 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -100,6 +100,8 @@ static void aspeed_board_init(MachineState *machine,
>  {
>
>      AspeedBoardState *bmc;
>      AspeedSoCClass *sc;
> +    I2CBus *i2c12;
> +    DeviceState *rx8900;
>  
>      bmc = g_new0(AspeedBoardState, 1);
>      object_initialize(&bmc->soc, (sizeof(bmc->soc)), cfg->soc_name);
> @@ -137,6 +139,12 @@ static void aspeed_board_init(MachineState *machine,
>      aspeed_board_binfo.ram_size = ram_size;
>      aspeed_board_binfo.loader_start = sc->info->sdram_base;
>  
> +    i2c12 = aspeed_i2c_get_bus((DeviceState *)&bmc->soc.i2c, 11);
> +    rx8900 = i2c_create_slave(i2c12, "rx8900", 0x32);
> +
> +    qdev_connect_gpio_out_named(rx8900, "rx8900-interrupt-out", 0,
> +            qdev_get_gpio_in(DEVICE(&bmc->soc.vic), 22));
> +
>      arm_load_kernel(ARM_CPU(first_cpu), &aspeed_board_binfo);
>  }
>  
> 

