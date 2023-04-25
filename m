Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3469795ejm;
        Tue, 25 Apr 2023 05:53:20 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZODYWrTSjAJ24v9Rfr7kIBQhx3klWXsAbOMRkfZYtyS2pzKAO4BjAlHquEkjmjEI1X2tOX
X-Received: by 2002:ac8:4e42:0:b0:3f0:a5a5:cb86 with SMTP id e2-20020ac84e42000000b003f0a5a5cb86mr9125523qtw.49.1682427199873;
        Tue, 25 Apr 2023 05:53:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682427199; cv=none;
        d=google.com; s=arc-20160816;
        b=EwhKqLGweKvQoi5OyFzeSVtsQtCic8Yg4z6muaw2pP+oH59IPVtp6TVBQ1Hlr9fzzR
         eCEeyfMMZDExDGkmEVzXExltgio0vfLJcVPvHr+5AbPVo0AH5hiBcnFjRd3gen9w/o8p
         AM3V6jPJiCXpQSy/kjP/5g5xYLmuvI2eRAtrqchZTKT360w88GVLofRrnb5BdeMZCWW+
         GyiKInXiU4CKrzMgY1xQBbauKBGb2RjCs1FHrTB7s51vNAGkeO/EDVRMAqk9b06ShYnV
         DY4ioeOouIwoVnEKRe6fIu4DHOkAeCMtWUMQc6UMZFCKuVU6oow4/6gAV0ZLm8L2PUWp
         D70Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=RaL6sH7t1WI71+khXyV1GrHEXL+9m1DJtOebMAgKW7Y=;
        b=pMkY49SWQDt02JtEGj0q3daqlxoASK3Q4//5pXMnXYuHtV1LfcTEagROcJRVi1pdVX
         b3FyRczgV22Mq8eBvBdIzS0NwSf8sfgFScJs1ubBNukPZIJWaB60n1Z/JmW3LaNJh7wm
         pzaHIQvHTOXGxLmCo6Hpw8OBZvoSL80wh68Fog2QCE2kpnK+WWwQYKua9FGXx+wHDVir
         Cga1DVo/sZxt+cuvgs7v4K2OJEp638r5RLp2/arqSUw5mR7zfoQHEbXft/kzrGPXg4YI
         p3VLh+bfb4Kw5f9KyunoQKlBAqnHV60zRuP7o2z1KSIjodIISQwgYumBNWgSyIzRWSCE
         juxg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 141-20020a370393000000b0074a60b26c74si8446367qkd.87.2023.04.25.05.53.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 05:53:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1prIAN-00087D-59; Tue, 25 Apr 2023 08:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1prIAL-00086L-AE; Tue, 25 Apr 2023 08:53:05 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1prIAJ-0002N7-7m; Tue, 25 Apr 2023 08:53:05 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.206])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 42D1320CF3;
 Tue, 25 Apr 2023 12:52:52 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 25 Apr
 2023 14:52:51 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S001abe40e6b-2165-4091-ba2d-060f27566bed,
 E2DA695E8528D19917B6C34AE59FCE5C6A1E9775) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <a217426b-d042-02ff-faaa-11b69c92b858@kaod.org>
Date: Tue, 25 Apr 2023 14:52:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/3] hw/arm: Fix raspi, aspeed bootloaders on big-endian
 hosts
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>
References: <20230424152717.1333930-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230424152717.1333930-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 696b0d86-6a85-4ad3-b631-952235c171b0
X-Ovh-Tracer-Id: 14781939877118380905
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfeduvddgheejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeduueefkeeigffgudekvdffvdelvdejieelveeiiedvkeevfeejleevuefhteetleenucffohhmrghinhepphgrthgthhgvfidrohhrghenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtjedpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhqvghmuhdqshhtrggslhgvsehnohhnghhnuhdrohhrghdpphhhihhlmhgusehlihhnrghrohdrohhrghdprghnughrvgifsegrjhdrihgurdgruhdpjhhovghlsehjmhhsrdhiugdrrghupdfovfetjfhoshhtpe
 hmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: g/G7aUVGkInc

On 4/24/23 17:27, Peter Maydell wrote:
> Both the raspi and aspeed boards load their secondary CPU bootloader
> code in a way that only works on little-endian hosts. This patchset
> fixes that by making them both use the write_bootloader() function
> in boot.c, which gets endianness-handling right.
> 
> Patches 1 and 2 are essentially a patch from Cédric from a few
> months ago:
> https://patchew.org/QEMU/20230119123449.531826-1-clg@kaod.org/20230119123449.531826-9-clg@kaod.org/
> I've split it into two patches and tweaked it a bit.
> 
> These fixes let us run the avocado tests for these boards on
> big-endian hosts.

LGTM, the aspeed tests ran fine on a ppc64/debian host (pseries VM).

Tested-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> thanks
> -- PMM
> 
> Cédric Le Goater (2):
>    hw/arm/boot: Make write_bootloader() public as arm_write_bootloader()
>    hw/arm/aspeed: Use arm_write_bootloader() to write the bootloader
> 
> Peter Maydell (1):
>    hw/arm/raspi: Use arm_write_bootloader() to write boot code
> 
>   include/hw/arm/boot.h | 49 +++++++++++++++++++++++++++++++++
>   hw/arm/aspeed.c       | 38 +++++++++++++------------
>   hw/arm/boot.c         | 35 ++++++-----------------
>   hw/arm/raspi.c        | 64 +++++++++++++++++++++++--------------------
>   4 files changed, 111 insertions(+), 75 deletions(-)
> 

