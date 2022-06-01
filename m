Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp3994680lfh;
        Wed, 1 Jun 2022 00:12:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyaAr8tX2gHi5rj2XqKfD5xOkoSx67udHhCo24lFuNidm6dV6O35a0tHKaj/sHUNnck4OU
X-Received: by 2002:a05:622a:48a:b0:2f3:fa4c:f091 with SMTP id p10-20020a05622a048a00b002f3fa4cf091mr50415041qtx.442.1654067521606;
        Wed, 01 Jun 2022 00:12:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654067521; cv=none;
        d=google.com; s=arc-20160816;
        b=ik+X9WbE4X7BuWpZEcJhcYBCl1cGfUQsZrB/tcMpLD0xZyJHofjHVo83+TwATGMBQW
         mp8iLRIeCRwZIg20h3MJWeG++hagB9VAKkhE/a80E3gUvsfnmueC0qO+b5fxn65fdTGA
         pufuew6z9tNpZ1CaUog3i8QbWZg7z6tycpbQ4Y/VjN+/nra47F4MRlTkUCJtz99MNjms
         s0jEData8AQutlyHryhs/E1xLzGoUX0FLndrfDsaSSMZyx84GlKI9Czv3dyIKYRybBxu
         DBB24kkzzTsLoGsKXdRnWkOPBZwQy+N/kJdmG+o87FVCWbJHqrroHNXUK4ERpFu16yGt
         DNdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=ih7xWLBBUxyQ2A1TiMJQxb8Tf1uCrR+uqm9yeUUdkVU=;
        b=LAB3FVavAOzi0TygBorcFPWG+CgrRH9hR2/NlOaxp+iF+9HktLA2fwWdK5/4UYTQDY
         7BGM3mptI7/zYUfvnyjs2EAE4o00MZAasZHve0En5XoTmIXlR/XVWkXfRDlqYtZURuza
         JfuYbin+xaacPDvnt6FlN1M0hOsWZB8z7wYQ9K9N0ECy4OKA2MUlLTTQEV6Vbn+sFT5I
         icLNIh0gYNZnGkx47toadLmvvbDS4xBGOEZQ47YVT0zsqNqNvR2tsTod9tdPfDcbo9Ow
         sskjNnhIAV4tXxEBAFw1hfAdkjBqJ+fEy2STfiEXVXIUfLnSCSCw54ohhKpXgj/jr6nZ
         cc8g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y16-20020a05620a25d000b0069fe7f301b5si521366qko.541.2022.06.01.00.12.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Jun 2022 00:12:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwIWP-0001q1-45
	for alex.bennee@linaro.org; Wed, 01 Jun 2022 03:12:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nwIUx-0001nH-Kv
 for qemu-arm@nongnu.org; Wed, 01 Jun 2022 03:10:31 -0400
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117]:36919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nwIUv-0003IZ-CJ
 for qemu-arm@nongnu.org; Wed, 01 Jun 2022 03:10:31 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.147])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id DC1F827C20;
 Wed,  1 Jun 2022 07:10:21 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 1 Jun 2022
 09:10:21 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0033362c8d4-2b5f-4d26-b275-f84bed73a068,
 A963F33A9D1A618F9A1E828761F10BD73193B711) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <983fc0e3-6166-74d4-1164-161c277e4a96@kaod.org>
Date: Wed, 1 Jun 2022 09:10:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC 0/1] i2c/aspeed: Add slave device handling in new register
 mode
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <zhdaniel@fb.com>,
 <troy_lee@aspeedtech.com>, <jamin_lin@aspeedtech.com>,
 <steven_lee@aspeedtech.com>, <k.jensen@samsung.com>, Joe Komlodi
 <komlodi@google.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>
References: <20220525205024.1158075-1-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220525205024.1158075-1-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: fe5d5f81-22b4-463b-9fdc-867078678a5a
X-Ovh-Tracer-Id: 1215127476620987381
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrkeelgdduudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeutdeltdeggeeludehteeuvddtjeefudeglefhffdttddvudetkefgleetvdfffeenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprghnughrvgifsegrjhdrihgurdgruh
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: uYTJn+TDsBES

[ Adding Joe ]

On 5/25/22 22:50, Peter Delevoryas wrote:
> The AST2600/AST1030 new register mode patches[1] and the I2C slave device
> patches[2] will be really useful, but we still need DMA slave device
> handling in the new register mode too for the use-cases I'm thinking of
> (OpenBIC Zephyr kernel using Aspeed SDK drivers[3]).
> 
> My test images are on Github[4]. They can be used with the ast1030-evb, or
> the oby35-cl and oby35-bb machines in the fb qemu branch[5].
> 
> I'm submitting this as an RFC cause I just want to see how other people
> expect these changes to be made based on the previously submitted "new
> register mode" and "old register mode slave device" patches.


Currently, my preferred approach would be to start with Joe's patchset
because the registerfields conversion is a huge effort and it's adding
new mode support which should cover the needs for the AST1030 SoC [1].

Troy, could you please confirm this is OK with you ? I have pushed
the patches on :

   https://github.com/legoater/qemu/commits/aspeed-7.1

Then, adding slave support for old [2] and new mode (this patch)
shouldn't be too much of a problem since they are small.

we lack a test case for this controller and writing a I2C Aspeed bus
driver for qtest is not an easy task.

It might be easier to start an ast2600-evb machine with a lightweight
userspace (buildroot, I can host that somewhere on GH) and run some I2C
get/set/detect commands from a python/expect framework, like avocado.
I2C devices can be added on the command line for the purpose.


Thanks,

C.

  
> Thanks,
> Peter
> 
> [1] https://patchwork.kernel.org/project/qemu-devel/list/?series=626028&archive=both
> [2] https://patchwork.kernel.org/project/qemu-devel/list/?series=627914&archive=both
> [3] https://github.com/AspeedTech-BMC/zephyr/blob/db3dbcc9c52e67a47180890ac938ed380b33f91c/drivers/i2c/i2c_aspeed.c#L1362-L1368
> [4] https://github.com/peterdelevoryas/OpenBIC/releases/tag/oby35-cl-2022.13.01
> [5] https://github.com/facebook/openbmc-qemu
> 
> Peter Delevoryas (1):
>    i2c/aspeed: Add slave device handling in new register mode
> 
>   hw/i2c/aspeed_i2c.c         | 118 ++++++++++++++++++++++++++++++++++--
>   include/hw/i2c/aspeed_i2c.h |  14 +++--
>   2 files changed, 124 insertions(+), 8 deletions(-)
> 

