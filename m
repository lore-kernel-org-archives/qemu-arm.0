Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3035431lfb;
        Sun, 5 Sep 2021 07:46:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyww1q2H5e4sgA2uu2rgpknHZJzxxwU8JyaUh9EhExO/F91dijzBN9Rp8D59U/0vY51nb3d
X-Received: by 2002:a92:c145:: with SMTP id b5mr5862143ilh.150.1630853202245;
        Sun, 05 Sep 2021 07:46:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630853202; cv=none;
        d=google.com; s=arc-20160816;
        b=JMXHcTZKFNcWkC031nmX0rO4jS78bnIqqXy+hj0U6h8uK3bMKmTEanZ7uuADxB3qcX
         oyiMXWHS2WQsEpD47lNk+HI2P9t/gYQXdRCeJ6QkCIs5BUmRqK7UzNJfJEWKBz9E07Vt
         hcZcHS2zJD+fa/r3A136tY/dqOIj1NAOSXnD/i/cg2H5nGvov7p0XMpZtvPtDNiQwvXs
         p1BMlT7qXFqqncrT3vGp2vHKk3ZEEOVwkU22a9yOIfUqEvrawaxbWWVxQyApQ8Vh/JUx
         v98k4jb1wIPkYiBJK5VXvQoSuk4R+4FH5m/3u6OWCypTYtvvyUnxX8J7frvMjH2GUkkP
         hLcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=uAAJhg60yg8xmp+1mXXA3fw7AcQmLgvZ9hnIp/FwxMs=;
        b=B48RZ8rwd7h9YA3GasXAiOVrpJ8NVYcRPHv0G1Ok/WUHf3Qqw+WmkYLgl2CnvAvRRV
         nq38KzUeP63Aw33RumzSk/ZMrTp84T+TQ8BL3qmgy+YOWMq8YM9L5uTTetgJ/4dcE2d4
         wKU8r+2ECmcukG8wD0pNu1f00xnewukGPFnYvuixKjw8jN2nMxNtCnvRHmkULD9d7f8w
         cY2KwS7MP4AFRQRkOgfw7MoDKWd1+UQCze8qNEaoUqEcPjWSExJnNtaZZtnH5Xlq5aj4
         psMHO/ClRikivUiprPMlSWep9l2JqscxTHob1kKyrCq70AszURLheLUPy+ZSqJ9tTjo5
         YrVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x4si4732130ilj.121.2021.09.05.07.46.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Sep 2021 07:46:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMtPt-0000N5-K6
	for alex.bennee@linaro.org; Sun, 05 Sep 2021 10:46:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mMtNL-0006bD-QW
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 10:44:03 -0400
Received: from smtpout2.3005.mail-out.ovh.net ([46.105.54.81]:53931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mMtNJ-0001Rt-OT
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 10:44:03 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.134])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id A6C1413EC96;
 Sun,  5 Sep 2021 14:43:57 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Sun, 5 Sep
 2021 16:43:57 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003dc9135f6-aa1a-48aa-9531-d0a9738e66d4,
 66A9BF958F2B7C6001B822A929017098407F6BEC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PULL 00/14] aspeed queue
To: Peter Delevoryas <pdel@fb.com>
References: <20210903194108.131403-1-clg@kaod.org>
 <beab1f50-d8f5-b3d3-5612-15e5f74eb961@amsat.org>
 <9ef56813-94f9-a1cb-aba5-9d2e2a081d23@kaod.org>
 <24abcdb3-e666-477b-a3e7-746326640bca@amsat.org>
 <cb42b5f4-0484-2192-5c93-fe20bbb39ef1@kaod.org>
 <A1FBA6CB-6D97-4EC3-A4AD-90CE687A08D7@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <1a14daac-2964-3b08-3346-95e4799605b3@kaod.org>
Date: Sun, 5 Sep 2021 16:43:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <A1FBA6CB-6D97-4EC3-A4AD-90CE687A08D7@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 4c3fcb6c-54ff-4990-8a83-def2a9b56aab
X-Ovh-Tracer-Id: 15541077891513092969
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudefuddgjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheeutdehgefhvdehtdeuleetgedvfeeukedtfeeihfffffeiuddutdduhffgvedtnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepphguvghlsehfsgdrtghomh
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout2.3005.mail-out.ovh.net
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.832,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N7MzdcfWWoh4

On 9/5/21 4:34 PM, Peter Delevoryas wrote:
> 
> 
>> On Sep 5, 2021, at 1:51 AM, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> ﻿On 9/5/21 1:03 AM, Philippe Mathieu-Daudé wrote:
>>>> On 9/4/21 7:33 AM, Cédric Le Goater wrote:
>>>> On 9/3/21 10:41 PM, Philippe Mathieu-Daudé wrote:
>>>>> Hi Peter,
>>>>>
>>>>> On 9/3/21 9:40 PM, Cédric Le Goater wrote:
>>>>>> The following changes since commit 8880cc4362fde4ecdac0b2092318893118206fcf:
>>>>>>
>>>>>>  Merge remote-tracking branch 'remotes/cschoenebeck/tags/pull-9p-20210902' into staging (2021-09-03 08:27:38 +0100)
>>>>>>
>>>>>> are available in the Git repository at:
>>>>>>
>>>>>>  https://github.com/legoater/qemu/ tags/pull-aspeed-20210903
>>>>>>
>>>>>> for you to fetch changes up to 907796622b2a6b945c87641d94e254ac898b96ae:
>>>>>>
>>>>>>  hw/arm/aspeed: Add Fuji machine type (2021-09-03 18:43:16 +0200)
>>>>>>
>>>>>> ----------------------------------------------------------------
>>>>>> Aspeed patches :
>>>>>>
>>>>>> * MAC enablement fixes (Guenter)
>>>>>> * Watchdog  and pca9552 fixes (Andrew)
>>>>>> * GPIO fixes (Joel)
>>>>>> * AST2600A3 SoC and DPS310 models (Joel)
>>>>>> * New Fuji BMC machine (Peter)
>>>>>>
>>>>>> ----------------------------------------------------------------
>>>>>
>>>>>> Peter Delevoryas (3):
>>>>>>      hw/arm/aspeed: Initialize AST2600 UART clock selection registers
>>>>>>      hw/arm/aspeed: Allow machine to set UART default
>>>>>>      hw/arm/aspeed: Add Fuji machine type
>>>>>
>>>>> I have a pending question with the last patch, do you mind holding
>>>>> this PR until it is resolved with Cédric and the patch author please?
>>>>>
>>>>> Thanks,
>>>>>
>>>>> Phil.
>>>>>
>>>>
>>>> I guess we can drop the following from the commit log : 
>>>>
>>>>    git clone https://github.com/facebook/openbmc
>>>>    cd openbmc
>>>>    ./sync_yocto.sh
>>>>    source openbmc-init-build-env fuji build-fuji
>>>>    bitbake fuji-image
>>>>    dd if=/dev/zero of=/tmp/fuji.mtd bs=1M count=128
>>>>    dd if=./tmp/deploy/images/fuji/flash-fuji of=/tmp/fuji.mtd \
>>>>        bs=1k conv=notrunc
>>>>    
>>>>    git clone --branch aspeed-next https://github.com/peterdelevoryas/qemu
>>>>    cd qemu
>>>>    ./configure --target-list=arm-softmmu --disable-vnc
>>>>    make -j $(nproc)
>>>>    ./build/arm-softmmu/qemu-system-arm \
>>>>        -machine fuji-bmc \
>>>>        -drive file=/tmp/fuji.mtd,format=raw,if=mtd \
>>>>        -serial stdio \
>>>>        -nic user,hostfwd=::2222-:22
>>>>    sshpass -p 0penBmc ssh root@localhost -p 2222
>>>
>>> Sounds good. Eventually document that in docs/system/arm/aspeed.rst
>>> in a follow up patch?
>>>
>>> Regards,
>>>
>>> Phil.
>>>
>>
>>
>> Peter D, 
>>
>> Could you please resend the "hw/arm/aspeed: Add Fuji machine type"
>> patch addressing Phil's comment. I will resend a PR with the 
>> update.
>>
>> Thanks,
>>
>> C. 
>>
>>
> 
> Oh! Yes, I can do that, sorry, I wasn’t sure if it was necessary to resend or if it could be fixed inline or something. I’ll send that within the next 24 hrs, removing the selected text from the commit description.

I didn't either. 

Thanks, 

C.
