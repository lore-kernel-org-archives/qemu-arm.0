Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp573829lfc;
        Tue, 19 Nov 2019 06:05:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqyg5FdDl/PREX5C7YyiJ8FCNyWD4jAQt2xkqJg6LY5XcOF+5+YzeAMKHKWuNn0G5TRuDsL5
X-Received: by 2002:a1c:4489:: with SMTP id r131mr5686367wma.132.1574172358150;
        Tue, 19 Nov 2019 06:05:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574172358; cv=none;
        d=google.com; s=arc-20160816;
        b=ILQt5Y2Icd5wsFEgLOWb2ve+ZBy8pWu7Cx6L0rEZ9UR7U+ouNHBWX05iiR0wVvcYcv
         fI5iARUX1TBv2SrBoLC/Cf23zBxLFZ8cQKYVIh27aVAiXRdPDKj1C4mfHmyvxW9d0uAm
         DWX2Eq7jo8GSfwitpxK8Dvp4FuE1qHeneHNrc+aLIwFgZ2urdH72KbQninxTXv3Y8JlW
         NFjwuQ27VDfSQnU4fX++53mcfVhaKk70xh6QLwd3sR5tlokcPgzXoohl7F2Q9VoyaCIL
         /oNkN+oVM9KaCZCBZPlQvklBFDPIBWF58n8qCjZbd8wnTIfaVXvdIwwcUljNcYAoEhiI
         VvAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=I1uLcqzeihIm43I0TQYmKX+AgTLk3Fo2qWADKut8nrg=;
        b=s5OZDWFpsAGegblOeM4wLjPnKh1nnGpF+lEcd63WbJvRk17LUZZy2CYQuUY5//eR05
         kOEjom03aUcHOHvqQpjAtS9dehL0tVFscwi/mjQ/iyAruQ8Wr1s4wEcOpXHxJh9O8cBo
         HgMvayNnVERe7Cl/J8OPuTcjYOLQyMkxAN2PoVpIsfdetXGQKrmHU4NTCufr9VY2VfEn
         hh4qRNdZL7AJGOOAuJYMISHecRzhg4yt8mwecr+T2S+x4hUTCyC+q94v23UmMWvUlqMe
         fwnR3jOdbk7RUT04BozGi6tlo3hD/XfaXAdtnxIYULrQso3mv73/dxwnAkA7QkeIEBG5
         rzPA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of clg@kaod.org designates 46.105.35.78 as permitted sender) smtp.mailfrom=clg@kaod.org
Return-Path: <clg@kaod.org>
Received: from 19.mo5.mail-out.ovh.net (19.mo5.mail-out.ovh.net. [46.105.35.78])
        by mx.google.com with ESMTPS id g19si21158448wrb.247.2019.11.19.06.05.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Nov 2019 06:05:58 -0800 (PST)
Received-SPF: pass (google.com: domain of clg@kaod.org designates 46.105.35.78 as permitted sender) client-ip=46.105.35.78;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of clg@kaod.org designates 46.105.35.78 as permitted sender) smtp.mailfrom=clg@kaod.org
Received: from player772.ha.ovh.net (unknown [10.108.54.13])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id ACC2D25AA0E
	for <alex.bennee@linaro.org>; Tue, 19 Nov 2019 15:05:57 +0100 (CET)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
	(Authenticated sender: clg@kaod.org)
	by player772.ha.ovh.net (Postfix) with ESMTPSA id 6361BC44350D;
	Tue, 19 Nov 2019 14:05:50 +0000 (UTC)
Subject: Re: [PATCH v3 0/4] arm/aspeed: Watchdog and SDRAM fixes
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
References: <20191113221301.8768-1-joel@jms.id.au>
 <CAFEAcA8AL6865u8KaY3HjRH19mTP=JUJ3FAgf9VezJYPOEbmBg@mail.gmail.com>
 <3dbfb0eb-4ecb-35b4-9c8d-dec3fd6f083f@kaod.org>
 <CAFEAcA82Nf=2tEyfgX5=_pi19C7PC8YODX2XCC=NafT6SUP38Q@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <7c64292d-26f6-ba1f-3300-e15e0afb6bad@kaod.org>
Date: Tue, 19 Nov 2019 15:05:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA82Nf=2tEyfgX5=_pi19C7PC8YODX2XCC=NafT6SUP38Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17781618704199027520
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudegkedgheelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpudelhedrvdduvddrvdelrdduieeinecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejjedvrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheprghlvgigrdgsvghnnhgvvgeslhhinhgrrhhordhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-TUID: 4Q65nlBERPzl

On 19/11/2019 14:44, Peter Maydell wrote:
> On Thu, 14 Nov 2019 at 14:17, Cédric Le Goater <clg@kaod.org> wrote:
>> We are preparing, and reviewing, the initial 5.0 patchset
>> which will contain the I2C pool buffer model plus the fixes
>> Joel and I sent.
> 
> OK. I currently have in my 'maybe I should do something with this'
> list these patchsets:
> aspeed/i2c: Add support for pool and DMA transfer modes
> arm/aspeed: Watchdog and SDRAM fixes
> aspeed: AST2600 SMC fixes and tacoma-bmc machine
> aspeed: rework inter model link properties
> 
> (I had a quick scan through and there's nothing in any of
> them that looked odd to me, though I haven't done a detailed
> review). Should I just assume that you'll send out a rollup
> patchset with all of those once 5.0 is out ? Alternatively
> I could apply them to the target-arm.for-5.0 branch I'm
> currently keeping, which will become the first target-arm
> pullreq once 5.0 reopens, if you prefer (and if you've
> got on-list reviewed-by tags for them all).

I have a larger list of patches with reviewed-by : 

Cédric Le Goater - aspeed: Change the "nic" property definition
Cédric Le Goater - aspeed: Change the "scu" property definition
PanNengyuan - gpio: fix memory leak in aspeed_gpio_init()
Cédric Le Goater - aspeed: Add support for the tacoma-bmc board
Cédric Le Goater - aspeed: Remove AspeedBoardConfig array and use AspeedMachineClass
Cédric Le Goater - aspeed/smc: Add AST2600 timings registers
Cédric Le Goater - aspeed/smc: Do not map disabled segment on the AST2600
Cédric Le Goater - aspeed/smc: Restore default AHB window mapping at reset
Joel Stanley - watchdog/aspeed: Fix AST2600 frequency behaviour
Joel Stanley - watchdog/aspeed: Improve watchdog timeout message
Joel Stanley - aspeed/scu: Fix W1C behavior
Joel Stanley - aspeed/sdmc: Make ast2600 default 1G
Cédric Le Goater - aspeed/i2c: Add trace events
Cédric Le Goater - aspeed/i2c: Add support for DMA transfers
Cédric Le Goater - aspeed: Add a DRAM memory region at the SoC level
Cédric Le Goater - aspeed/i2c: Check SRAM enablement on AST2500
Cédric Le Goater - aspeed/i2c: Add support for pool buffer transfers


Tests run fine on travis.

I will send them this afternoon.

Thanks,
C. 
