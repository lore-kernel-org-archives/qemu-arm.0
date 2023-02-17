Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1280558ejb;
        Fri, 17 Feb 2023 00:23:52 -0800 (PST)
X-Google-Smtp-Source: AK7set8k2eYKYwx5pe3sgJVWiQbqoe2UQYY5+jah8B1F/EiLAptSW8Go8ScOnePeh/WWojXAGj61
X-Received: by 2002:a05:622a:153:b0:3bb:855a:9ed7 with SMTP id v19-20020a05622a015300b003bb855a9ed7mr14124875qtw.42.1676622232025;
        Fri, 17 Feb 2023 00:23:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676622232; cv=none;
        d=google.com; s=arc-20160816;
        b=z5zWCs8aKGpTmwFtpFNshWFYC3FY8dHzgBu/eIGe4oLF+YEH3glR2NeniBPgRnuVjq
         hNSPy1T/80K4PXGn6gB9L9ODYQgOho4X2RSmgKf5HB4VTzBoYIF3Wtl6xpQ/y2FzH4vP
         NEnFZOWjbyu2id/ltES9WGgmF1LW4s6+fg/fYwtJN59Z8RpDRFq2kSfrs7IFUfOZakRY
         bsxkQOazuKsb1af0XgbXsLjuYjPRAyBhQTyuR6ivIcbRvCYbPkkujiqaoQgpLg7QuSLR
         w+JyW4NJ03a75O0UEzvw6r4eIvWN/9Yz1P4tbgraR+qzAHDZzyKB8+HnBi5e0V+BAoqs
         Sjow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=ofK12P/yK7AeiB3ujwlIPG/d3MEijBiEbrNsLcG06g4=;
        b=y3kDx58ysX9HX4byn/WwLeUywx1Ju1TPupQI86ZgCUPVb91x5YTlV5Xg+nEoM+Wwyb
         wD4ArgpyneYvdyeZ5zQNCwSZlKxeNADsXp1PaXVuo1HQXyT3VZRPkM3h1ksjqu1+/qER
         1eXCT+2zUUumDeteX8G0mQlUJ57KEAW9uLmTp0PR0psu0SHv23+ndRHsXDghdouxmNZK
         L6PDCaZWupoVR5zF5FAsUP0RiEPUJYd999BEcICpJZvN9+2+p1CsdVEPmF5VpgatUMir
         KEwPTEobGaAWliSo1B8mdMdlqJizgX4eUWK40STo6u4QyfBB2YCEK+P/5e10dS8uiqX+
         iZnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h3-20020a05622a170300b003b86d02dfd1si3181915qtk.571.2023.02.17.00.23.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Feb 2023 00:23:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSw1L-0005Mt-83; Fri, 17 Feb 2023 03:23:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pSw1I-0005Lz-71; Fri, 17 Feb 2023 03:23:05 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pSw1G-0003PO-Ov; Fri, 17 Feb 2023 03:23:03 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.188])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 11097213CA;
 Fri, 17 Feb 2023 08:22:59 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 17 Feb
 2023 09:22:58 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004521db92a-a9cf-4962-a71c-0fef03280aed,
 D8AD3BA2C27EEBE7B4560DA8411A9B1E3CFED360) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <4191f562-dd19-af39-e678-46d27d53c0e4@kaod.org>
Date: Fri, 17 Feb 2023 09:22:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 0/8] aspeed: I2C fixes, -drive removal (first step)
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <qemu-block@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Peter
 Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>
References: <20230214171830.681594-1-clg@kaod.org>
 <87fsb7e8m3.fsf@pond.sub.org> <9dacf24f-3797-591b-b2af-ae08a0c01259@kaod.org>
 <87fsb79ke8.fsf@pond.sub.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <87fsb79ke8.fsf@pond.sub.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 47d71b00-add0-4b82-bc5e-6d4ba6fa667b
X-Ovh-Tracer-Id: 4134867408950758252
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudeikedguddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepuedutdetleegjefhieekgeffkefhleevgfefjeevffejieevgeefhefgtdfgiedtnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegrrhhmsghruhesrhgvughhrghtrdgtohhmpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhqvghmuhdqsghlohgtkhesnhhonhhgnhhurdhorhhgpdhjohgvlhesjhhmshdrihgurdgruhdprghnughrvgifsegrjhdrihgurdgruhdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhphhhilhhmugeslhhinhgrrhhordhorhhgpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpoh
 huth
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.351,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zrPiV4zJF1N8


>> The next step would be to get rid of the drive_get(IF_MTD) internal
>> API, which means finding a way to attach block backend devices from
>> the command line to the default flash devices. This should be done
>> at machine init time and the blockdev should have some 'bus@addr'
>> identifier. I lack the knowledge on how this could be done.
> 
> Possibly interesting for you: commit e0561e60f17 "hw/arm/virt: Support
> firmware configuration with -blockdev".

I see. The mapping device<->blk is moved at the machine level with
an option. The same could be done for the Aspeed machines with "fmc0",
"spi0", identifiers.

I think we should deprecate the "fmc-model" and "spi-model" machine
options. They become useless with -nodefaults correctly implemented.

Thanks,
  

