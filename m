Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp5527359wrr;
        Thu, 14 Nov 2019 06:17:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqxRexzK37wXenInAz0x58L91PpVIZxliwp05r3j39QsLbGTyJDcbXI4FNOu7I7CZGS02tvt
X-Received: by 2002:a05:600c:1002:: with SMTP id c2mr8106703wmc.79.1573741021959;
        Thu, 14 Nov 2019 06:17:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573741021; cv=none;
        d=google.com; s=arc-20160816;
        b=MmlJIkmQNfE80Thh0+CJZZtCKodQAX1Rljl+47fN4XrYi6rNHExnLZvCOwDCF+/X3c
         lmoTzIHsW/J/AVC/EmjWZwPI86XSDK+Ee96QwJxi11F8R61RI3JajLFDsoHIp09mHZub
         ire/rgiN3BwtnMLN6rr/LOJYdEfFPPNND/82SgTdStUoAROUDp9AgIedUNVXTyoiFT9v
         9M1twko92AfRaFHcXotZz9OCkoeFdmzvVGjVzraR67glHO2FRLs1ZvlPufDhaRBysyA/
         6nVxAjBibx8n5muSb8BYDcg6vibE0Rpl774GGTFMv1aJlLUj0MRN5rK1s/Fe2bJH/7Lq
         m8Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=SadURD2Ckfd+k0elSzVJE9iDsxGyc+GY1rB29GWBBv0=;
        b=Qh2L6Kjece/3w6gIehqx7ilu4slof5aue7DsEozuPrcdyvLRLvrvoJdScelzhnUqgP
         Rrv0JVg9CSmg7DkQYG9br17d+wqMI+BPPpkwzbG6erwzrKxbn46QgjGlvD2no9e6aeWO
         q1FsW+Cr2+ZnFpSKvrQoOCaixkpUVdbDjbvK9JRpUWnPCXXDObufoFQl7ZodeIPeGZ5h
         PQgnk5iMqIpf1yyrbElaPrNBIaXYcix8PVCXrejo5bOgsbGL3TvsNiLfDqnccaU12xDK
         MkVJCmo5P3loaRYGQeLYDXIZbDrVlwHFvNJapSF2mWvMGd7vZGmJ7j/6sUeioMWd1X2w
         eWDw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of clg@kaod.org designates 178.32.125.228 as permitted sender) smtp.mailfrom=clg@kaod.org
Return-Path: <clg@kaod.org>
Received: from 12.mo6.mail-out.ovh.net (12.mo6.mail-out.ovh.net. [178.32.125.228])
        by mx.google.com with ESMTPS id f16si5159401wrw.126.2019.11.14.06.17.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Nov 2019 06:17:01 -0800 (PST)
Received-SPF: pass (google.com: domain of clg@kaod.org designates 178.32.125.228 as permitted sender) client-ip=178.32.125.228;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of clg@kaod.org designates 178.32.125.228 as permitted sender) smtp.mailfrom=clg@kaod.org
Received: from player692.ha.ovh.net (unknown [10.108.54.119])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id 76B2A1EC634
	for <alex.bennee@linaro.org>; Thu, 14 Nov 2019 15:17:01 +0100 (CET)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
	(Authenticated sender: clg@kaod.org)
	by player692.ha.ovh.net (Postfix) with ESMTPSA id 707C9BFD145D;
	Thu, 14 Nov 2019 14:16:54 +0000 (UTC)
Subject: Re: [PATCH v3 0/4] arm/aspeed: Watchdog and SDRAM fixes
To: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <20191113221301.8768-1-joel@jms.id.au>
 <CAFEAcA8AL6865u8KaY3HjRH19mTP=JUJ3FAgf9VezJYPOEbmBg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <3dbfb0eb-4ecb-35b4-9c8d-dec3fd6f083f@kaod.org>
Date: Thu, 14 Nov 2019 15:16:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8AL6865u8KaY3HjRH19mTP=JUJ3FAgf9VezJYPOEbmBg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 7051792592352807744
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudeffedgieefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpudelhedrvdduvddrvdelrdduieeinecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheiledvrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheprghlvgigrdgsvghnnhgvvgeslhhinhgrrhhordhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-TUID: iFhX/y/79LK3

On 14/11/2019 15:04, Peter Maydell wrote:
> On Wed, 13 Nov 2019 at 22:13, Joel Stanley <joel@jms.id.au> wrote:
>>
>> Three of these are fixes for ast2600 models that I found when testing
>> master. The forth is a usability improvement that is helpful when
>> diagnosing why a watchdog is biting.
>>
>> v3 adds some comments and fixes whitespace, and r-b from Alex. Thanks
>> for the review Alex.
>>
>> v2 fixes some review comments from Cédric and adds his r-b.
>>
>> Joel Stanley (4):
>>   aspeed/sdmc: Make ast2600 default 1G
>>   aspeed/scu: Fix W1C behavior
>>   watchdog/aspeed: Improve watchdog timeout message
>>   watchdog/aspeed: Fix AST2600 frequency behaviour
> 
> Were you wanting any of these (or any of the other aspeed
> patches currently on the list) to go into 4.2? None of them
> are specifically marked as for-4.2 bugfixes, and I don't
> know enough about aspeed to be able to judge their importance.

I think we are done for 4.2, although these are relatively 
simple fixes that could go in 4.2. Nothing critical. As you
wish.

We are preparing, and reviewing, the initial 5.0 patchset 
which will contain the I2C pool buffer model plus the fixes 
Joel and I sent.

Thanks,
C.
