Received: by 10.25.159.131 with SMTP id i125csp164872lfe;
        Wed, 30 Nov 2016 00:16:49 -0800 (PST)
X-Received: by 10.200.50.97 with SMTP id y30mr28498993qta.203.1480493809024;
        Wed, 30 Nov 2016 00:16:49 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g87si37027278qkh.156.2016.11.30.00.16.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 Nov 2016 00:16:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41895 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cC04O-0004eT-Gr
	for alex.bennee@linaro.org; Wed, 30 Nov 2016 03:16:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cC04K-0004dh-7E
	for qemu-arm@nongnu.org; Wed, 30 Nov 2016 03:16:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cC04H-0002xX-1p
	for qemu-arm@nongnu.org; Wed, 30 Nov 2016 03:16:44 -0500
Received: from 4.mo69.mail-out.ovh.net ([46.105.42.102]:48442)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cC04G-0002uR-QW
	for qemu-arm@nongnu.org; Wed, 30 Nov 2016 03:16:40 -0500
Received: from player699.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo69.mail-out.ovh.net (Postfix) with ESMTP id 1262DD105
	for <qemu-arm@nongnu.org>; Wed, 30 Nov 2016 09:16:39 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: postmaster@kaod.org)
	by player699.ha.ovh.net (Postfix) with ESMTPSA id 89C65240080;
	Wed, 30 Nov 2016 09:16:31 +0100 (CET)
To: Alastair D'Silva <alastair@au1.ibm.com>, qemu-arm@nongnu.org
References: <20161130053629.23340-1-alastair@au1.ibm.com>
	<20161130053629.23340-7-alastair@au1.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <31f8bcf5-825f-3ea5-8457-f96eb08a75cd@kaod.org>
Date: Wed, 30 Nov 2016 09:16:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161130053629.23340-7-alastair@au1.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 10008687224089316119
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeekgdduudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.42.102
Subject: Re: [Qemu-arm] [PATCH v2 6/6] arm: Add an RX8900 RTC to the ASpeed
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
X-TUID: CTq90O2lKoGi

On 11/30/2016 06:36 AM, Alastair D'Silva wrote:
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> Connect an RX8900 RTC to i2c12 of the AST2500 SOC at address 0x32
> 
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>  hw/arm/aspeed.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index c7206fd..8de95f2 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -166,7 +166,19 @@ static const TypeInfo palmetto_bmc_type = {
>  
>  static void ast2500_evb_init(MachineState *machine)
>  {
> +    AspeedSoCState *soc;
> +    I2CBus *i2c12;
> +    DeviceState *rx8900;
> +
>      aspeed_board_init(machine, &aspeed_boards[AST2500_EVB]);
> +
> +    soc = ASPEED_SOC(object_resolve_path_component(OBJECT(machine), "soc"));
> +
> +    i2c12 = aspeed_i2c_get_bus((DeviceState *)&soc->i2c, 11);
> +    rx8900 = i2c_create_slave(i2c12, "rx8900", 0x32);
> +
> +    qdev_connect_gpio_out_named(rx8900, "rx8900-interrupt-out", 0,
> +            qdev_get_gpio_in(DEVICE(&soc->vic), 22));
>  }
>  
>  static void ast2500_evb_class_init(ObjectClass *oc, void *data)
> 

I think it would be nicer to define a handler under AspeedBoardConfig,
something like : 

	int (*i2c_init)(AspeedBoardState *bmc);

when a board needs I2C devices. The handler would be called 
from aspeed_board_init() directly. This is similar to what 
we do for the flash modules but we didn't have to add a 
specific handler for the flash.

Thoughts ?


C.



