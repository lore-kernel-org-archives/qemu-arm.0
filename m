Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp2856710lfg;
        Tue, 22 Jun 2021 01:54:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyws6z/1A9jjDqdMeGK2ub1H4KhWMOeY6O0L97H/gnGaS7U6nGIG2vFT4ETPXFoZXZTd579
X-Received: by 2002:a02:a99e:: with SMTP id q30mr2843865jam.69.1624352083015;
        Tue, 22 Jun 2021 01:54:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624352083; cv=none;
        d=google.com; s=arc-20160816;
        b=yrNRxWGRcACCezzjKLfzOGSkz/+yYivFIFOVWe1fk5oqHD9+qt3Sc9P5pNfernPa6z
         RCwzY9MZDtV1b4dFuHELXsC9c7KwtyvOvB8ZAKCkS0imWomSVH5n4utfp1Pe+pg5vxcA
         FbHaAuTQ8ThETHQxxXBa34Jts+7mqp8xYt9t6sxo3nmuB8GD4eQlWSqInbVSyZ6Wfe4L
         sReEG9xISrrtiDb6DIXWobYSZv/vgAPrFoJE9gLauePxjFSQ+z8Pj/SDE0i3MdUEz/VL
         ccOwo3JUOPFj6BdZx65aTyNx5rgEzAk6OeCsJOY6vkZot7wA2fE9zR0I6d0ItxflwRrH
         6qSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=HVX1/71wBchz9YblH10D+zie241bi+gGY4yzK4cr+yU=;
        b=AR3+A/Ap3GXcr3Q2yjNDzyQOZtONVj4rcDmdOMCZO/Oe/KIDRGz621HB7ot17c3dW8
         suEM2MyZohBXFYbGAlEemieUWrzUVAllWXLdqAS/i/0tVI1sakiD3OmPkPokZsEbotvl
         r0mitjbWs1JLMtkkYUejTQjPu/Wvdf4BvmF8hIxWWGp1412O8v7b+hWdPDvj1mCDqIzL
         bEff1J++mvZnKoPMnU93UWe5pNkGvD1vH1O6hGlg5UaZkL5G07C+kYTSKRllnUdtWEec
         obO5i8Jn6bU6+HXdPQezHjC0Zq9R2nP9wAEkKZ5cuQAOXfs+KKqzEC7DIwFF6pF2vE92
         ZmfA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w15si14574156ilm.28.2021.06.22.01.54.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Jun 2021 01:54:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lvcB8-0002jp-Be
	for alex.bennee@linaro.org; Tue, 22 Jun 2021 04:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lvcAy-0002jT-Jd
 for qemu-arm@nongnu.org; Tue, 22 Jun 2021 04:54:32 -0400
Received: from 8.mo51.mail-out.ovh.net ([46.105.45.231]:33145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lvcAw-0001r2-88
 for qemu-arm@nongnu.org; Tue, 22 Jun 2021 04:54:32 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.137])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id C690D2AA478;
 Tue, 22 Jun 2021 10:53:58 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.10; Tue, 22 Jun
 2021 10:53:25 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0053433db20-4487-466d-bf3e-fc1f9a42290f,
 05C0DFBD0479AF6D6D6C6191138746449F03B0F5) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [PATCH 2/2] docs/system/arm: Add quanta-gbs-bmc reference
To: Peter Maydell <peter.maydell@linaro.org>, Patrick Venture
 <venture@google.com>
References: <20210615192848.1065297-1-venture@google.com>
 <20210615192848.1065297-3-venture@google.com>
 <CAFEAcA9=L1F-DGW+1g5K6dC9XDMUJyrLf4PWJq9nQ3XthG7nZg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <664619f3-b3ca-276f-e947-a37a21a9f80e@kaod.org>
Date: Tue, 22 Jun 2021 10:53:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9=L1F-DGW+1g5K6dC9XDMUJyrLf4PWJq9nQ3XthG7nZg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c6533944-5a62-4e81-bc20-bc80f8638f6c
X-Ovh-Tracer-Id: 11891191866657704812
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfeeguddgtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgedvieejfedvhfduhfffueevheeludffhfdvkeehleegtddttdfhieegveeghfffnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrgh
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
 Havard Skinnemoen <hskinnemoen@google.com>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /xznYtFkxj+i

On 6/21/21 3:31 PM, Peter Maydell wrote:
> On Tue, 15 Jun 2021 at 20:29, Patrick Venture <venture@google.com> wrote:
>>
>> Add line item reference to quanta-gbs-bmc machine.
>>
>> Signed-off-by: Patrick Venture <venture@google.com>
>> ---
>>  docs/system/arm/nuvoton.rst | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
>> index ca011bd479..197d149f66 100644
>> --- a/docs/system/arm/nuvoton.rst
>> +++ b/docs/system/arm/nuvoton.rst
>> @@ -1,4 +1,4 @@
>> -Nuvoton iBMC boards (``npcm750-evb``, ``quanta-gsj``)
>> +Nuvoton iBMC boards (``*-bmc``, ``npcm750-evb``, ``quanta-gsj``)
>>  =====================================================
>>
>>  The `Nuvoton iBMC`_ chips (NPCM7xx) are a family of ARM-based SoCs that are
>> @@ -18,6 +18,7 @@ segment. The following machines are based on this chip :
>>  The NPCM730 SoC has two Cortex-A9 cores and is targeted for Data Center and
>>  Hyperscale applications. The following machines are based on this chip :
>>
>> +- ``quanta-gbs-bmc``    Quanta GBS server BMC
>>  - ``quanta-gsj``        Quanta GSJ server BMC
> 
> Why aren't we consistent about the names of the machines here?
> This suggests that either we should have called the new board
> 'quanta-gbs', not 'quanta-gbs-bmc', or we should deprecate
> 'quanta-gsj' and rename it 'quanta-gsj-bmc' ...

Indeed, the latter would be the best option. 

Thanks,

C. 

