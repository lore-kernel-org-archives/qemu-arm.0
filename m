Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1815533lfj;
        Mon, 16 May 2022 00:33:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+xpXifMTMxMXrYKPkmxacQZD6ZafCGP7IOlLR0sxXjiJacpt9RLi57FLsF1s9LfqE8h1D
X-Received: by 2002:a05:622a:188e:b0:2f3:dc9f:946 with SMTP id v14-20020a05622a188e00b002f3dc9f0946mr14291158qtc.682.1652686430139;
        Mon, 16 May 2022 00:33:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652686430; cv=none;
        d=google.com; s=arc-20160816;
        b=bU7X4PpcKh9BfBoblh+wU48FyZ+uuj4kT3AERP6vqzbNbhlSMbCKc9cOqxRtVJwJ4U
         Mq7mXk4cHi4I+l2uHfBJTIWrslHcOBPMRjwPVRybxRZwY2w9BNklmlW3w1BCbCMUYNar
         X262WxaKJIbIiGNwlLmQcgQzQzl8j6My4hrzzdNw7oyPJJ+pfI07q2W+FOeYCAdlA0bO
         qRMW81YoV6NwKQ3O+qMcefgtI80q6Ys/5NkpzKfxiSrL4QzdwlOfV/CMGJMI7F2oCT78
         eaG0gzM3MakmHMqVJUR8LA39QdLJBr4YHF1nxKok+Nk21mcTD/yf6DKXmDS+qQpLViqJ
         a6Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=9yV6cGYovDafDvEq6V+PU3Q8GMdrq7wfvXeH0Y/RACU=;
        b=DdeNgJ8V3kw4qIpdDhU8KQRnbVx7FD0rd5q44ItQ0Lcv0cM0Eejm04t0UIEnk2YerT
         63av52pTPqsFnvijGylLLWDJAbwWVlFpEXPjw7Fa39ASoO9csMNY/F8FOlCMUHpGWjmg
         rYd+D3LF8TkkujlaFbnwnZqn8vNnzMKS3s9WV9oL/s2U0E1LDQwQ3X3Ypbr/oHzcocqb
         eiBLOh8MwOHf2ia6x1ojNGTUZ/14maWzxscN3lDX1/DcY8D3ssOOiH6snx3C9HLj/sFV
         yYCGygxRCKhY/Sq4oXaP8JuQFJDRSkuTzc+DxRnVBs/HA5V4WzB62gqtEm3wrUUz1Z6y
         G2Iw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s21-20020a05622a019500b002f3bbbe6bebsi5546206qtw.486.2022.05.16.00.33.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 May 2022 00:33:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nqVEj-0007KQ-Hj
	for alex.bennee@linaro.org; Mon, 16 May 2022 03:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nqV3j-0004Ew-Ls
 for qemu-arm@nongnu.org; Mon, 16 May 2022 03:22:27 -0400
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117]:56515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nqV3h-0008Qb-Dx
 for qemu-arm@nongnu.org; Mon, 16 May 2022 03:22:27 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.180])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id A0C3826B29;
 Mon, 16 May 2022 07:22:23 +0000 (UTC)
Received: from kaod.org (37.59.142.108) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Mon, 16 May
 2022 09:22:22 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-108S002a6839763-3245-402c-bf7b-2f24d5b9d825,
 182B8575423FAF1F37CDABDABB9637A2CFA4B440) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <c57591b0-604b-1a98-102d-17cac1732db9@kaod.org>
Date: Mon, 16 May 2022 09:22:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 5/5] hw: aspeed: Init all UART's with serial devices
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
CC: <irischenlj@fb.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>,
 <zev@bewilderbeest.net>, <openbmc@lists.ozlabs.org>, <andrew@aj.id.au>,
 <peter.maydell@linaro.org>, <joel@jms.id.au>, Jamin Lin
 <jamin_lin@aspeedtech.com>
References: <20220516062328.298336-1-pdel@fb.com>
 <20220516062328.298336-6-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220516062328.298336-6-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.108]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 4103372d-cd80-4613-b592-a061500577f9
X-Ovh-Tracer-Id: 18135714226604182450
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrheeggdduvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhfeevveegueejhfettdeuvdejtefgkeffkeejgeeuteejgfduieelhedttefhtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehjrghmihhnpghlihhnsegrshhpvggvughtvggthhdrtghomh
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dgF4LAJfxRoX

On 5/16/22 08:23, Peter Delevoryas wrote:
> Background:
> 
> AspeedMachineClass.uart_default specifies the serial console UART, which
> usually corresponds to the "stdout-path" in the device tree.
> 
> The default value is UART5, since most boards use UART5 for this:
> 
>      amc->uart_default = ASPEED_DEV_UART5;
> 
> Users can override AspeedMachineClass.uart_default in their board's machine
> class init to specify something besides UART5. For example, for fuji-bmc:
> 
>      amc->uart_default = ASPEED_DEV_UART1;
> 
> We only connect this one UART, of the 5 UART's on the AST2400 and AST2500
> and the 13 UART's on the AST2600 and AST1030, to a serial device that QEMU
> users can use. None of the other UART's are initialized, and the only way
> to override this attribute is by creating a specialized board definition,
> requiring QEMU source code changes and rebuilding.
> 
> The result of this is that if you want to get serial console output on a
> board that uses UART3, you need to add a board definition. This was
> encountered by Zev in OpenBMC. [1]
> 
> Changes:
> 
> This commit initializes all of the UART's present on each Aspeed chip with
> serial devices and allows the QEMU user to connect as many or few as they
> like to serial devices. For example, you can still run QEMU and just connect
> stdout to the machine's default UART, without specifying any additional
> serial devices:
> 
>      qemu-system-arm -machine fuji-bmc \
>          -drive file=fuji.mtd,format=raw,if=mtd \
>          -nographic
> 
> However, if you don't want to add a special machine definition, you can now
> manually configure UART1 to connect to stdout and get serial console output,
> even if the machine's default is UART5:
> 
>      qemu-system-arm -machine ast2600-evb \
>          -drive file=fuji.mtd,format=raw,if=mtd \
>          -serial null -serial mon:stdio -display none
> 
> In the example above, the first "-serial null" argument is connected to
> UART5, and "-serial mon:stdio" is connected to UART1.
> 
> Another example: you can get serial console output from Wedge100, which uses
> UART3, by reusing the palmetto AST2400 machine and rewiring the serial
> device arguments:
> 
>      qemu-system-arm -machine palmetto-bmc \
>          -drive file=wedge100.mtd,format=raw,if=mtd \
>          -serial null -serial null -serial null \
>          -serial mon:stdio -display none
> 
> There is a slight change in behavior introduced with this change: now, each
> UART's memory-mapped IO region will have a serial device model connected to
> it. Previously, all reads and writes to those regions would be ineffective
> and return zero values, but now some values will be nonzero, even when the
> user doesn't connect a serial device backend (like a socket, file, etc). For
> example, the line status register might indicate that the transmit buffer is
> empty now, whereas previously it might have always indicated it was full.
> 
> [1] https://lore.kernel.org/openbmc/YnzGnWjkYdMUUNyM@hatter.bewilderbeest.net/
> [2] https://github.com/facebook/openbmc/releases/download/v2021.49.0/fuji.mtd
> [3] https://github.com/facebook/openbmc/releases/download/v2021.49.0/wedge100.mtd
> 
> Signed-off-by: Peter Delevoryas <pdel@fb.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/arm/aspeed_soc.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 912798a9c9..30574d4276 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -546,9 +546,18 @@ qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev)
>   void aspeed_soc_uart_init(AspeedSoCState *s)
>   {
>       AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
> +    int i, uart;
>   
>       /* Attach an 8250 to the IO space as our UART */
>       serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
>                      aspeed_soc_get_irq(s, s->uart_default), 38400,
>                      serial_hd(0), DEVICE_LITTLE_ENDIAN);
> +    for (i = 1, uart = ASPEED_DEV_UART1; i < sc->uarts_num; i++, uart++) {
> +        if (uart == s->uart_default) {
> +            uart++;
> +        }
> +        serial_mm_init(get_system_memory(), sc->memmap[uart], 2,
> +                       aspeed_soc_get_irq(s, uart), 38400,
> +                       serial_hd(i), DEVICE_LITTLE_ENDIAN);
> +    }
>   }

