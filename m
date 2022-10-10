Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp2505049ocg;
        Mon, 10 Oct 2022 08:13:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6BFcbEAV1rC9b9FxmtVefOiy+pXC2o7UZWbXtKxaSbFixznX6Vy89YFXv1ffJ99h2wP5aY
X-Received: by 2002:a05:620a:294f:b0:6cf:920e:4f3a with SMTP id n15-20020a05620a294f00b006cf920e4f3amr13146826qkp.66.1665414834618;
        Mon, 10 Oct 2022 08:13:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665414834; cv=none;
        d=google.com; s=arc-20160816;
        b=LOAUNS4j1Y4r1LR5+OnPZNgqnAidMUfavCnsW/T09apzixcjwO2S8AJ1/4sfVwYNV+
         Xpik0EMu4rWDdBVVOKSCepDiD7fctsPgnFObhQXnw30F5FrQA3eVOgqbqVXSum5VPENc
         6kKvjOuSLwr3fncWopmnmnoDUY3MvfwbVHJOWQ/+YHgjA3RxHCgauNopm0P6R5WuxHPW
         clGe+vOSooloB1dqzuObxFZpXe4nw6J7WzdFKcKEnajyJampZ/+iZI/ZJ7oTHg3cTB4S
         moTDGGpPC5xDKb6GjqvShJFeI8wrfa9PK7F00twZl96kJ2+//eH5WZ+GwtKxCkdZRzrr
         X2qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=4Vec2/ObFqcksoINL4QN+PD3qFmXXZtJchBJcWPieH8=;
        b=YEaGs+fwvlnYwLalZRQbRwXBH9ZDePObHbdNDroG29tkkjbBRgChmW3SaV/KZBsDrg
         YeDbydqXtRvf3MJJhFwX5hk+MlR3QpWHPdDkgphhyZlSlaCRNELZ9xErNMe5YAAZwuSM
         Wyx9oYBhF8cWGIOMGjE5APCl037rWIt0osShHgF/uYmCMldUNXF+Rap6l+nzK2HGqkOG
         ru4IhqFd0Y/iPEZ8e+SrEphOUo00uv8FT1qCcZ+N3Ppcami1sfPUQSKmOk2P2udD6FP6
         j0CDB2EtunCK9y8XT5kLzGRrDdF3ac1Qenom1UN1gZIDzifRP3Tc+X8D3FdYjKH9Zkba
         GNPA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kl25-20020a056214519900b004b19a05f627si5149377qvb.151.2022.10.10.08.13.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Oct 2022 08:13:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ohuTa-0001BF-5l
	for alex.bennee@linaro.org; Mon, 10 Oct 2022 11:13:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ohuGb-00015s-55
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 11:00:32 -0400
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253]:51955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ohuGX-0002CS-R3
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 11:00:28 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.33])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id A46F82078F;
 Mon, 10 Oct 2022 15:00:20 +0000 (UTC)
Received: from kaod.org (37.59.142.110) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Mon, 10 Oct
 2022 17:00:19 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S0045fbb0147-b96c-4290-95b7-0ece3d767eb0,
 8F9D85B4748BB0730094C5680DDBB13DC71FBC21) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <16c83e92-6331-f93c-c092-965b55fb0215@kaod.org>
Date: Mon, 10 Oct 2022 17:00:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 4/8] m25p80: Add the mx25l25635f SFPD table
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
CC: Francisco Iglesias <frasse.iglesias@gmail.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <qemu-block@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>, Iris Chen
 <irischenlj@fb.com>
References: <20220722063602.128144-1-clg@kaod.org>
 <20220722063602.128144-5-clg@kaod.org> <20221007144431.GE20384@fralle-msi>
 <6726971b-b862-2959-5e7e-c059be2bb07d@kaod.org>
 <d6d2575b520fedb47a5fa7c1031c4ff7@walle.cc>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <d6d2575b520fedb47a5fa7c1031c4ff7@walle.cc>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 183c0834-66b6-457d-8bc4-8d527636e7f4
X-Ovh-Tracer-Id: 3712091994356419506
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejgedgjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejleegleejjefhveejjefglefhheevteeftedtvdevfffguddujeelhfeiudejtdenucffohhmrghinhepvhgvlhhirgdrnhgvthenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehirhhishgthhgvnhhljhesfhgsrdgtohhmpdfovfetjfhoshhtpehmohehhedv
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo552.mail-out.ovh.net
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.007,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: r1Ms1zv+Dmhi

On 10/10/22 11:58, Michael Walle wrote:
> Am 2022-10-10 08:23, schrieb Cédric Le Goater:
>> On 10/7/22 16:44, Francisco Iglesias wrote:
> 
>>>> --- a/hw/block/m25p80.c
>>>> +++ b/hw/block/m25p80.c
>>>> @@ -234,6 +234,8 @@ static const FlashPartInfo known_devices[] = {
>>>>       { INFO("mx25l12855e", 0xc22618,      0,  64 << 10, 256, 0) },
>>>>       { INFO6("mx25l25635e", 0xc22019,     0xc22019,  64 << 10, 512, 0),
>>>>         .sfdp_read = m25p80_sfdp_mx25l25635e },
>>>> +    { INFO6("mx25l25635f", 0xc22019,     0xc22019,  64 << 10, 512, 0),
>>>
>>> I think I'm not seeing the extended id part in the datasheet I've found so
>>> might be that you can switch to just INFO and _ext_id 0 above
>>
>> This was added by commit 6bbe036f32dc ("m25p80: Return the JEDEC ID twice for
>> mx25l25635e") to fix a real breakage on HW.
> 
>  From my experience, the ID has a particular length, at least three bytes
> and if you read past that length for some (all?) devices the id bytes just
> get repeated. I.e. the counter in the device will just wrap to offset 0
> again. 
At the time, I did some specific tests on these mx25l25635e chips and
this how they behaved. I can not check anymore as I don't have access
to these systems.

> If you want to emulate the hardware correctly, you would have to
> take that into consideration.

But this is not the case for all chips, most return 0 and don't
wrap around. I just did on w25q512jvq and w25q256 chips with a 6.0.

> But I don't think it's worth it, OTOH there seems to be some broken
> software which rely on that (undefined?) behavior.

I can't really tell :/ The driver (kernel based Linux 2.6.28) reads
4 bytes and expect the last to be the Manufacturer id: 0xC2. That's
valid for this chip.

Setting an extended ID in the flash info is an alternative :

   { INFO("mx25l25635e", 0xc22019,     0xc200,  ...

which does not seem to break other machines using mx25l25635e, with
recent kernels at least.

To reproduce, grab :

   http://smbserver.frankfurt.de.velia.net/ipmi/SMT_X11_158.bin

Run :

   qemu-system-arm -M supermicrox11-bmc -nic user -drive file=./SMT_X11_158.bin,format=raw,if=mtd -nographic -serial mon:stdio
   ...
   BMC flash ID:0xc21920c2
    platform_flash: MX25L25635E (32768 Kbytes)
   Creating 7 MTD partitions on "spi0.0":
   ...

C.
