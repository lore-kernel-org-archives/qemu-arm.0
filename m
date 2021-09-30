Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp430931lfp;
        Thu, 30 Sep 2021 09:23:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOd37mKHxwUOynvxF8dn9afTsMInN0heDDArJtSFA19ZXryz2esTTWsOimA/vMvwE5zb+P
X-Received: by 2002:a1c:98c6:: with SMTP id a189mr111006wme.59.1633019001950;
        Thu, 30 Sep 2021 09:23:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633019001; cv=none;
        d=google.com; s=arc-20160816;
        b=koRaE9RU+tXVKVHhSz1fVbNZLbTpq9LF580ByCeW7EiTAnwN3JxJxBw7gyCoomHYaL
         MSaidu9aYpS6vguxxB9bf0azisRcN20maFARM3zjV9ARIfwcUeg1wKT7yhG9Mw47ngL4
         jhl00TFkvfFiYy6/TUX61pKea2Oo3C/G250SwWe+nXO6WLnaJRnNbVcYr09XIJWGnM34
         oLyq6BBeuusuETc08JU/7CJrdWH3ixmi5KIaCgUJY9qQyGtv7n8IRgS+RtiJX73EM5Jx
         GfAGsBU9ZYT8Xg8f/57wIk5yYrB+d8r/BunFG0QiLuk9O33G0dkOndW/+TChEz9FoRtH
         iDQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=KaleDUTkQ3Mg5wL2gwMhqsx+6Vdq1OqBnrbzvsrR4o4=;
        b=qVlcfbHrGlybE4TRoWsdS65WHO1R/zsY9Z9kMjldRusfWlGNiLHcLGQpowwNaLjCHp
         z8alLLlUcceNu9BODJEuL3vR+I71VckIUQU6yucyRP/jWOoNZpuJv1hcnRcHUhgknUMC
         HGPfOj1gPZZyCE0WAUBO9pkzv1GVk/tC23lTzELqoi8kSEi4cOPjUtTpBhI2JfujtzOJ
         CroTIFo39pl2cld7gvJeLqNVReFERRRVGv0l48uZ5nea6MpNajGONoThYx02egvkwgrr
         PHeBQJuQTiq75BELTF0GvBw/iIE5+g7tDnYxxK7vBHYazeHDuJkpXD7YJjBSthstdSkj
         6gyA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i5si3519589wra.329.2021.09.30.09.23.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Sep 2021 09:23:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVyq8-0002m5-W0
	for alex.bennee@linaro.org; Thu, 30 Sep 2021 12:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mVyoq-0008MI-1G; Thu, 30 Sep 2021 12:22:00 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:58021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mVyon-0001zF-Sl; Thu, 30 Sep 2021 12:21:59 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.252])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id B207DC15F04F;
 Thu, 30 Sep 2021 18:21:53 +0200 (CEST)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 30 Sep
 2021 18:21:53 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0052ccebcd3-c199-49c4-8917-22e0d282d937,
 7F6F77616FEFA4DE1E608E9282B3397E3DBDA81F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <1fbe4ef9-ffd1-8032-c989-4316e0acbd1a@kaod.org>
Date: Thu, 30 Sep 2021 18:21:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH 1/1] hw: aspeed_adc: Add initial Aspeed ADC support
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
References: <20210930004235.1656003-1-pdel@fb.com>
 <20210930004235.1656003-2-pdel@fb.com>
 <76c9714a-4c25-27f7-7d26-c471919e8a8f@kaod.org>
 <1CD4D960-272F-4D4F-AAE8-F42C1772662A@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <1CD4D960-272F-4D4F-AAE8-F42C1772662A@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c64f4836-8c07-4c22-ad0a-5b8f8b9bd289
X-Ovh-Tracer-Id: 16438420116662684594
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudekgedgleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepueevledvjeetgeetfeeiveeftefffedvvdeikeetveelfeeglefgueetvdefvdefnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepfhegsghughesrghmshgrthdrohhrgh
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.127,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Amithash Prasad <amithash@fb.com>,
 Cameron Esfahani via <qemu-devel@nongnu.org>,
 "patrick@stwcx.xyz" <patrick@stwcx.xyz>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Dan Zhang <zhdaniel@fb.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z094O3sEoSxb


>> FYI, these series was sent by Andrew in 2017 and I have been keeping
>> it alive since in the aspeed-x.y branches :
>>
>> * memory: Support unaligned accesses on aligned-only models
>>   https://github.com/legoater/qemu/commit/1960ba6bde27b91edb5336985a9210260a4c8938
>>
>>   That was requested by Phil I think.
>>
>> * hw/adc: Add basic Aspeed ADC model
>>   https://github.com/legoater/qemu/commit/1eff7b1cf10d1777635f7d2cef8ecb441cc607c4
>>
>>   This is the initial patch. I added multi-engine support recently
>>   for the fuji.
>>
>> * hw/arm: Integrate ADC model into Aspeed SoC
>>   https://github.com/legoater/qemu/commit/3052f9d8ccdaf78b753e53574b7e8cc2ee01429f
>>
>>   That one is trivial.
>>
>>
>> Overall comments :
>>
>> I prefer the 'regs' array approach of your proposal.
> 
> Ok (I was just following patterns from aspeed_scu.c), I’ll keep that aspect.
> 
>>
>> I think the AspeedADCEngine should appear as a QOM object. Check
>> the patches above.
> 
> I see, I’ll make sure to test this.

The engines are behind the same BAR and they share the IRQ. So
it makes sense I think. And it shows up nicely under the monitor :

     ...
     000000001e6e7000-000000001e6e7fff (prio 0, i/o): aspeed.xdma
     000000001e6e9000-000000001e6e9fff (prio 0, i/o): aspeed.adc
       000000001e6e9000-000000001e6e90ff (prio 0, i/o): aspeed.adc.engine.0
       000000001e6e9100-000000001e6e91ff (prio 0, i/o): aspeed.adc.engine.1
     000000001e700000-000000001e700fff (prio -1000, i/o): aspeed.video
     ...


     /adc (aspeed.adc-ast2600)
       /aspeed.adc[0] (memory-region)
       /engine[0] (aspeed.adc.engine)
         /aspeed.adc.engine.0[0] (memory-region)
       /engine[1] (aspeed.adc.engine)
         /aspeed.adc.engine.1[0] (memory-region)
       /unnamed-gpio-in[0] (irq)
       /unnamed-gpio-in[1] (irq)


>> To move on, maybe, you could rework the initial series and take
>> ownership ?
>>
> 
> Yeah definitely! I’ll resubmit once I’ve reworked it. I don’t intend
> to include the unaligned-access support though, at least not w/ the ADC
> changes.

Yeah. This can come later.

Thanks,

C.

