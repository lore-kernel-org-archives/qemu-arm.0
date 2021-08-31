Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp5046687lfb;
        Tue, 31 Aug 2021 06:41:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzokCnqIJ80CgomDaqmlZWnuyowp3WEWtOraWcn0Y27KYpoitD9w8NPJOf/hiACa4tCDj7f
X-Received: by 2002:a67:df85:: with SMTP id x5mr18728755vsk.17.1630417315120;
        Tue, 31 Aug 2021 06:41:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630417315; cv=none;
        d=google.com; s=arc-20160816;
        b=aUHs0TYo+9qysc6gk3auYzFGcJwO7MMhjhtwtdjbABbYLKgiiKDDuvwjxw8QzR/9xd
         E+nU3U1b6947tcu6fkWpJvWKc4i7dZrH1YeC0yiNczZ0/Bw/dj/occhUV1DU6yVlXJkl
         k8Qjstl8rljnNk5pYLO1fsU5iJMb+jZDmh+77QC9QRoM9pI5x1aZdxEYcdnQNYMVq5vt
         uuVzNOp93iUAbzp7OLPEcIyA0p6rmFp+YLAbSxXQHx27XaWZwkntkMe0w8zLQKohpZLN
         9t+9NZN2z/e3Jijo5mcZCmJ5oVuIXeihIe3v9EsV56M9Y82gER9mquO7EeW+bZhv5u3R
         4mSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=oW5i81T85I4+KialVI0JER4xH73VDwJrvUMQK8tRSY0=;
        b=ltu/GuXuxJbuNH/pFOKgYwb140+rFPghzMoCM4fMiatenKGXU8c8oLs11uzSwt23Hp
         8wWs78ai7pBYU/GDBpaqlI/8fFT+szqEC4WTtWjDzy8RZdWWFBPCutKG1c88lBnN56pf
         292pDyv15CYHwZK6dpfpJU0sB51UxXAxgVVuI8BuElXXxwEAx5NTEV+3EIKdtYJuLJbp
         R5ASRU8Yj19qCMSpKXLKTyr/O/dV1dyJNFwC4bt1eHhYGR1tgU2nbiqdKE9g7t8uhiY+
         r7215yn1qdmEGqakOAq5TD8z4oaQ5QA+4bea5TcDmiHY+tUy7Ox9Z51hljLoi4bemmoQ
         vRIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 184si6480659vka.8.2021.08.31.06.41.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Aug 2021 06:41:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mL41S-0005UV-DF
	for alex.bennee@linaro.org; Tue, 31 Aug 2021 09:41:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mL3uV-0001u5-Qw; Tue, 31 Aug 2021 09:34:43 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:44049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mL3uS-0000yV-VQ; Tue, 31 Aug 2021 09:34:43 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.35])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 86D26BBBCAE9;
 Tue, 31 Aug 2021 15:34:36 +0200 (CEST)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 31 Aug
 2021 15:34:35 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R00194eb615d-1c82-4c44-b249-ebb91bdfa188,
 3D02C4E7E229260F021FFF691A6C377EE278DEFF) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 2/5] hw/arm/aspeed: Select console UART from machine
To: Andrew Jeffery <andrew@aj.id.au>, Peter Delevoryas <pdel@fb.com>
References: <20210827210417.4022054-1-pdel@fb.com>
 <20210827210417.4022054-3-pdel@fb.com>
 <7a53d5e9-52c2-a06b-1385-fd71a96d7486@kaod.org>
 <BYAPR15MB3032BA6C3556797AC2A3461CACC99@BYAPR15MB3032.namprd15.prod.outlook.com>
 <547b5f32-0858-1882-fb8b-c60056cdbfd4@kaod.org>
 <d3d43c7a-1f37-4489-a07b-bf561e4e36a1@www.fastmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <a802ecb1-aa49-fd4c-5bd2-2bb19af56ac9@kaod.org>
Date: Tue, 31 Aug 2021 15:34:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d3d43c7a-1f37-4489-a07b-bf561e4e36a1@www.fastmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 536ab2ba-0c01-4360-85d7-712f474091c5
X-Ovh-Tracer-Id: 3453135017623325603
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvuddgieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheeutdehgefhvdehtdeuleetgedvfeeukedtfeeihfffffeiuddutdduhffgvedtnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegrnhgurhgvfiesrghjrdhiugdrrghu
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.932,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Cameron Esfahani via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hI9KAk2OKpOm

On 8/31/21 1:23 PM, Andrew Jeffery wrote:
> Hi Cédric, Peter,
> 
> On Tue, 31 Aug 2021, at 20:09, Cédric Le Goater wrote:
>> On 8/28/21 5:58 PM, Peter Delevoryas wrote:
>>> I think I’m a little confused on this part. What I meant by “most machines just use UART5” was that most DTS’s use “stdout-path=&uart5”, but fuji uses “stdout-path=&uart1”. I /do/ see that SCU510 includes a bit related to UART, but it’s for disabling booting from UART1 and UART5. I just care about the console aspect, not booting.
>>
>> The UART can be switched with SCU70[29] on the AST2500, btw.
> 
> If it helps, neither the AST2600's "Boot from UART" feature nor the 
> AST2[456]00's "Debug UART" feature are related to which UART is used as 
> the BMC console by u-boot and/or the kernel - the latter is entirely a 
> software thing.

ok. 

I don't think we should initialize all 5 UARTs of SoC and let the user define 
all the expected devices on the command. Unless we want to do something like
'macs_mask' ? but at the SoC level. It might be overkill for the need.

My suggestion is have the Aspeed board tell the SoC which uart was selected 
for the console. That can be done with an extra "serial-dev" int property at 
the SoC level, defaults to ASPEED_DEV_UART5, like for the machine. 

The serial init needs a change  : 

    /* UART - attach an 8250 to the IO space as our UART5 */
    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5), 38400,
                   serial_hd(0), DEVICE_LITTLE_ENDIAN);

but it stays where it is currently, under the SoC.

> The "Debug UART" is a hardware backdoor, a UART-to-AHB bridge 
> implemented by the SoC. It provides a shell environment that allows you 
> to issue transactions directly on the AHB if you perform a magic knock. 
> I have a driver for it implemented here:
> 
> https://github.com/amboar/cve-2019-6260/blob/master/src/debug.c
> 
> SCU70[29] on the AST2500 selects whether this backdoor is exposed on 
> UART1 or UART5.
> 
> The "Boot from UART" feature is implemented in the AST2600 ROM code as 
> a fallback for loading the SPL if fetching it from SPI-NOR or the eMMC 
> fails, or the SPL is incorrectly signed for secure-boot.
>
> I think Peter is on the right track with this patch?

Yes. nearly. Sorry for the confusion on how to handle this Peter. A machine 
*and* a SoC property should to the trick. 

'amc->serial_dev' is a good idea. You need a similar one under the SoC.

Thanks for the feedback Andrew,

C. 
