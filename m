Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp281718lfc;
        Tue, 1 Sep 2020 23:53:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjGIwgpaUywdarXD1+2/stnV2II4B9ddw0adaVyBTdVXHN1ZDXEgxWqRmLH3rW1eeSMi+Z
X-Received: by 2002:a25:6808:: with SMTP id d8mr8350937ybc.265.1599029635766;
        Tue, 01 Sep 2020 23:53:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599029635; cv=none;
        d=google.com; s=arc-20160816;
        b=ngGNe+paC2HEPBeWblJtgXQpZi+xPGq7Hm6GRrpx6AZFk8bEzZXG8p2kjvwjFDPgWt
         pvOLWGX4ZMedDXHP/FR+bO+LatN4pvkO9NBdHz5puY4exDCcZ2TvHIhaWDAoOQqEuubS
         RljH4QEXvA34cNQenu8hPGpNSYKr06ef5zwyq7oJvjwQusO6PqW+Edzm1saS29mCZboC
         imw/R9jEvWpDatHdj3jS2cSIreuzW42F0IJMbJtGImDO60R/hS3WcLNNqUYpuSXIhmX+
         viWO0APVB/32k9ZZFJknoeAhqjt8LnfWbXLM9omG7jtYkcNM8pOh2NTlcEqnWzGnRJYz
         1q1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=l+JGF47E5OMi3EuWLTGz2vZP4atRqZRJUpKYyPiIa0M=;
        b=FgAA0yl4pukf/EtTEyg7com7Bd6dPFQsti7VwQCMFd5tiUk+fHidRDOwTd2wT//m9+
         ioGuQ3u6f/OCpMAeBXGmnP681tR1+JEjoz0ufT3uPT4hNaD7mZPEllBVoT/XHwMet6Il
         j/lXkrU2+TM86PbS1jh5J0PKYMQPfjzY+wLoFg/q82ogpMYFnKMjFnPu4QWZlUz95Tet
         Fgk/CHw8CuLPmWQiiJdpx47jf/GbuoPdqbIInbtTKHGjkRY2ZWwciocjtcqTJvDIT8fY
         gFoflc6f+m1GMAYixboNgu6iQ9X7Cp3GXGnECtv/qvkk+CQwwuynv/0E1AlIZ954fLmV
         XDaw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f124si3444612ybf.189.2020.09.01.23.53.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Sep 2020 23:53:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDMeZ-00069T-3o
	for alex.bennee@linaro.org; Wed, 02 Sep 2020 02:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kDMeF-00066e-8c; Wed, 02 Sep 2020 02:53:35 -0400
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:33189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kDMeC-0000QS-JB; Wed, 02 Sep 2020 02:53:34 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.123])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 83DAC5D06B68;
 Wed,  2 Sep 2020 08:53:19 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 2 Sep 2020
 08:53:18 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0048ac43cfe-bc6d-40ae-a34e-729923152ec4,
 725C0B02AD5EA5A9EE23B5614217EC25792C566F) smtp.auth=clg@kaod.org
Subject: Re: [PATCH 3/5] hw/ppc/ppc4xx_pci: Use ARRAY_SIZE() instead of magic
 value
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 <qemu-devel@nongnu.org>
References: <20200901104043.91383-1-f4bug@amsat.org>
 <20200901104043.91383-4-f4bug@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <0ffcf77e-9b1a-24e6-c763-4a94614b1549@kaod.org>
Date: Wed, 2 Sep 2020 08:53:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200901104043.91383-4-f4bug@amsat.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d9b36a0f-30f8-438e-9295-807c83e4cb17
X-Ovh-Tracer-Id: 4710202263967533886
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrudefkedguddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepfhegsghughesrghmshgrthdrohhrgh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 02:53:21
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.13,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-trivial@nongnu.org,
 Andrzej Zaborowski <balrogg@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Huacai Chen <chenhc@lemote.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 46XhHjmrBQLo

On 9/1/20 12:40 PM, Philippe Mathieu-Daudé wrote:
> Replace the magic '4' by ARRAY_SIZE(s->irq) which is more explicit.

We could also define the 'irq' array with PCI_NUM_PINS instead of 4.

> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>  hw/ppc/ppc4xx_pci.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
> index 3ea47df71fe..cd3f192a138 100644
> --- a/hw/ppc/ppc4xx_pci.c
> +++ b/hw/ppc/ppc4xx_pci.c
> @@ -320,7 +320,8 @@ static void ppc4xx_pcihost_realize(DeviceState *dev, Error **errp)
>  
>      b = pci_register_root_bus(dev, NULL, ppc4xx_pci_set_irq,
>                                ppc4xx_pci_map_irq, s->irq, get_system_memory(),
> -                              get_system_io(), 0, 4, TYPE_PCI_BUS);
> +                              get_system_io(), 0, ARRAY_SIZE(s->irq),
> +                              TYPE_PCI_BUS);
>      h->bus = b;
>  
>      pci_create_simple(b, 0, "ppc4xx-host-bridge");
> 

