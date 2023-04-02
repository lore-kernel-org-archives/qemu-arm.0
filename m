Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1668360ejb;
        Sun, 2 Apr 2023 00:34:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z0Ws/AalBOXCgUoKUH6duiOssf6/z5Ot25hRq6hFUCMSc+p/LJYR2xhHezCMyq8EDOpK0e
X-Received: by 2002:a05:6214:1250:b0:5bd:74a7:e6f0 with SMTP id r16-20020a056214125000b005bd74a7e6f0mr52139292qvv.20.1680420867938;
        Sun, 02 Apr 2023 00:34:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680420867; cv=none;
        d=google.com; s=arc-20160816;
        b=ynXi+eG5PgOg5mpb6mKeymlaj0GLGg2bZ54s4d2K1kYliHdOytjBlUA5rkYuiPqSKz
         yxsaI8BlY1iKfnUEzhMMlRktcoL3427trMeDdRT+8aJ6pYCanMDd4VAvvSPoHUzqQ9wr
         6xacAzWdY7Lp2skEBb9dYM75QLtEqzgmJZ8Ix7jxFY+n50M1hx3c5puXRQBD2MolldzU
         RrfNVRyaiQV0scMyYDmRcQQBk6gzVOYjULnUVRfmVIWzyiJUkHfwhmM98bd0BzL38PK4
         py8tqOwM1dcNBxWN2ugX3pXPeoVwaBHYfuOMPiZT72SvVjQalgY9s1JMZVcRqphGSqxK
         eCcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=YNrA5TiHoLoj0JJnBf6r3vO0Vc5XRnog4Ysc2cv7egI=;
        b=tXEDchr2rChQM8tndDNtW8WxYJPCV7ovWZlyg1xTagGgFDdxMw1NrxejpB5Ro5KUUF
         F61LC3JDtmzlBGROpW5Hwgum0BvfVSWVOaR1k0Lp21bskwgBoBsMYUJFKRlhhJm9XwMo
         peYJZivNrhP0AMYqd+or8dAnXGl5ibUd2zXWmzFncCfqxicZL38xcK0JHduA8fY8G/Un
         gVxboJJ5DtEBLyxsapEITGBdmCu0rPLk94gNFYq9ooQHX8IaCbitGQIbF9GikVjTIfed
         pAPhMMb7tlx8V46+Nud2vv/syVa9KM8B9KK7yO2o2wY8ZA26jg4ewrAjqaS5eoAz3bHk
         OnDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r14-20020a056214124e00b0056e9b9ee479si4426358qvv.243.2023.04.02.00.34.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 Apr 2023 00:34:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pisE7-0006Ld-Bj; Sun, 02 Apr 2023 03:34:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pisE0-0006IA-4G
 for qemu-arm@nongnu.org; Sun, 02 Apr 2023 03:34:04 -0400
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pisDx-0006pI-JV
 for qemu-arm@nongnu.org; Sun, 02 Apr 2023 03:34:03 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.132])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 1BBF52AAD0;
 Sun,  2 Apr 2023 07:33:49 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Sun, 2 Apr
 2023 09:33:48 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R0020e5b7008-cc78-4301-b78b-d02d998cea02,
 5726B3A818F0F25691B4B7F821350D5F32871618) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <74148c47-8232-02d3-2c37-d12c1fe156e2@kaod.org>
Date: Sun, 2 Apr 2023 09:33:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 00/16] i3c: aspeed: Add I3C support
Content-Language: en-US
To: Ben Dooks <qemu@fluff.org>, Joe Komlodi <komlodi@google.com>
CC: <qemu-devel@nongnu.org>, <venture@google.com>, <peter.maydell@linaro.org>, 
 Jeremy Kerr <jk@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>, Troy Lee
 <troy_lee@aspeedtech.com>, Graeme Gregory <quic_ggregory@quicinc.com>
References: <20230331010131.1412571-1-komlodi@google.com>
 <20230401172825.tvmfms6qbh3tmi5s@hetzy.fluff.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230401172825.tvmfms6qbh3tmi5s@hetzy.fluff.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 63d62cc2-2c1c-49e1-a2f1-3de21d6296c2
X-Ovh-Tracer-Id: 3448631415602056181
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeigedguddvfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkefhvefhheeiffduvefhfeeitefhleevudfgkedujeduieetfeffgfffvdelueelnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleekpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhesfhhluhhffhdrohhrghdpkhhomhhlohguihesghhoohhglhgvrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhvvghnthhurhgvsehgohhoghhlvgdrtghomhdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhjkhestghouggvtghonhhsthhruhgtthdrtghomhdrrghupdhjohgvlhesjhhmshdrihgurdgruhdprghnughrvgifsegrjh
 drihgurdgruhdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpthhrohihpghlvggvsegrshhpvggvughtvggthhdrtghomhdpqhhuihgtpghgghhrvghgohhrhiesqhhuihgtihhntgdrtghomhdpoffvtefjohhsthepmhhoheehvddpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7zUBaqEA3i4M

Hello,

On 4/1/23 19:28, Ben Dooks wrote:
> On Fri, Mar 31, 2023 at 01:01:15AM +0000, Joe Komlodi wrote:
>> Hi all,
>>
>> This series adds I3C bus support to QEMU and adds more functionality to the
>> Aspeed I3C controller.
>>
>> This implementation is a basic implementation that introduces IBIs
>> (including hot-join), CCCs, and SDR data transfer. As-is, it doesnt support
>> multi-controller buses or HDR transfers.
>>
>> First we add the I3C bus and controller model. With that added we
>> gradually extend the functionality of the Aspeed I3C controller so it
>> can do transfers.
>>
>> With that added, we add 2 targets. The first target is a mock I3C
>> target. It's intended to be a very simple target just to verify that I3C
>> is working on the guest. Internally, we've used it on Linux to verify
>> that i3C devices can be probed and can send/receive data and send IBIs.
>>
>> The second target is a remote target. The intention of this is to be
>> able to communicate to a target that exists outside of QEMU.
>>
>> Lastly we add hotplugging support. The hotplugging doesn't do anything too
>> complicated, it just adds the device attempting to hotplug to the bus. It is
>> the device's responsibility to hot-join and go through the DAA process to
>> participate on the bus.
>>
>> Thanks!
>> Joe
>>
>> Joe Komlodi (16):
>>    hw/misc/aspeed_i3c: Move to i3c directory
>>    hw/i3c: Add bus support
>>    hw/i3c/aspeed_i3c: Add more register fields
>>    hw/i3c/aspeed_i3c: Add more reset values
>>    hw/i3c/aspeed_i3c: Add register RO field masks
>>    hw/i3c/aspeed_i3c: Treat more registers as read-as-zero
>>    hw/i3c/aspeed_i3c: Use 32 bits on MMIO writes
>>    hw/i3c/aspeed_i3c: Add IRQ MMIO behavior
>>    hw/i3c/aspeed_i3c: Add data TX and RX
>>    hw/i3c/aspeed_i3c: Add IBI handling
>>    hw/i3c/aspeed_i3c: Add ctrl MMIO handling
>>    hw/i3c/aspeed_i3c: Add controller resets
>>    hw/i3c: Add Mock target
>>    hw/i3c: remote_i3c: Add model
>>    qtest: remote_i3c: Add remote I3C qtest
>>    hw/i3c: Add hotplug support
> 
> Isn't this the designware i3c ip block, and as such could we name
> it so? 

Currently, QEMU only has a model for a dummy Aspeed I3C variant so this is a
great addition.

> I was going to send an i2c only version of this but it seems you've beaten me 
> to it and got the i3c core going.

I gave the model a try adding a sensor on the legacy bus of an ast2600-evb
machine :

   -device tmp105,bus=aspeed.i3c.device.1-legacy-i2c,address=0x4d,id=tmp-test

Looks good. Next step would be to add some real I3C device model.


According to recent work on the kernel, it is indeed based on designware I3C :

   https://lore.kernel.org/all/20230331091501.3800299-1-jk@codeconstruct.com.au/

Jeremy, how different is it ? Could we introduce properties or sub classes,
to support both.


Thanks,


C.

> 
>>   hw/Kconfig                    |    1 +
>>   hw/arm/Kconfig                |    2 +
>>   hw/i3c/Kconfig                |   17 +
>>   hw/i3c/aspeed_i3c.c           | 2044 +++++++++++++++++++++++++++++++++
>>   hw/i3c/core.c                 |  646 +++++++++++
>>   hw/i3c/meson.build            |    6 +
>>   hw/i3c/mock-target.c          |  314 +++++
>>   hw/i3c/remote-i3c.c           |  469 ++++++++
>>   hw/i3c/trace-events           |   52 +
>>   hw/i3c/trace.h                |    1 +
>>   hw/meson.build                |    1 +
>>   hw/misc/aspeed_i3c.c          |  384 -------
>>   hw/misc/meson.build           |    1 -
>>   hw/misc/trace-events          |    6 -
>>   include/hw/arm/aspeed_soc.h   |    2 +-
>>   include/hw/i3c/aspeed_i3c.h   |  207 ++++
>>   include/hw/i3c/i3c.h          |  275 +++++
>>   include/hw/i3c/mock-target.h  |   60 +
>>   include/hw/i3c/remote-i3c.h   |   72 ++
>>   include/hw/misc/aspeed_i3c.h  |   48 -
>>   meson.build                   |    1 +
>>   tests/qtest/meson.build       |    1 +
>>   tests/qtest/remote-i3c-test.c |  610 ++++++++++
>>   23 files changed, 4780 insertions(+), 440 deletions(-)
>>   create mode 100644 hw/i3c/Kconfig
>>   create mode 100644 hw/i3c/aspeed_i3c.c
>>   create mode 100644 hw/i3c/core.c
>>   create mode 100644 hw/i3c/meson.build
>>   create mode 100644 hw/i3c/mock-target.c
>>   create mode 100644 hw/i3c/remote-i3c.c
>>   create mode 100644 hw/i3c/trace-events
>>   create mode 100644 hw/i3c/trace.h
>>   delete mode 100644 hw/misc/aspeed_i3c.c
>>   create mode 100644 include/hw/i3c/aspeed_i3c.h
>>   create mode 100644 include/hw/i3c/i3c.h
>>   create mode 100644 include/hw/i3c/mock-target.h
>>   create mode 100644 include/hw/i3c/remote-i3c.h
>>   delete mode 100644 include/hw/misc/aspeed_i3c.h
>>   create mode 100644 tests/qtest/remote-i3c-test.c
>>
>> -- 
>> 2.40.0.348.gf938b09366-goog
>>
>>
> 

