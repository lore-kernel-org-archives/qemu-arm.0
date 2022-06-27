Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2506387lft;
        Mon, 27 Jun 2022 09:33:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sxFQG7YvdR2c7k/dWeLdZRSjkjT7VvnSk3N6eqBeolqXz7uDY0C6sHJqLdJiGGBMrR/i9w
X-Received: by 2002:a05:620a:5d:b0:6af:65e:b879 with SMTP id t29-20020a05620a005d00b006af065eb879mr8165453qkt.364.1656347620000;
        Mon, 27 Jun 2022 09:33:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656347619; cv=none;
        d=google.com; s=arc-20160816;
        b=QTsWY9H9lIR4dQyg9m50DJ62j6tWE8V5BQqUteKx/fQqVurLZVMzjtTMImrtR8+Fuy
         7f3kOTVZE1oMIivMZhnAVWaYGx4w7RI9Xn5/rJzYE4iTwc8G6CgOahHILMtr95Fr+iJz
         VYca1zQvlUfGILHTP3TJLIsyrIZgueNnHiqzbL+U2sirwBgNEp2aRnZvh9qIOIjjvdzL
         t3sz8KsvwHOSLdAtXFo2APchlkCxs5RLp+4gnonY0NpxeTiN+D03GtUrWHhey+QM1OXa
         /GfY7pUFOzCucOBZL4zGD1XNnTwYDPnhJDCHMBllzDZRGp2OqYp32o1APlOBjJ/0bFDl
         EFuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=aIuJniQY1gz0XEQXqVMU8k5aEsv8tpcaZUQL5XvjQic=;
        b=sXOLCd8Ki9oKEHvTijiN92S6y43vhMJGLrMpatr+jCIKF0nGDApSMxoGRshCsIRvvR
         aHXaDDZ3qtUaAZhIPTeHif0wsVR4yg9khCor7D8LPzykQM2TyR9Ae5fhRwUaF4eB2iaW
         LI6M3Eo8u2spx39Lqa47vyJEQ+KZk52V5TfTrICE3a0rjX2kcdYCRVhhuAaqFg2kBmgx
         Eq7ddnV0nrcnJMSQxmiVC29A9J2yCd+i3PdmUnUcLbFUe2AVTdhXelmlA7iaI/RKfPXR
         4SapYIXE5ULy/FmaPDWxKI73PfeGJtGCYkFRMxUMHNDXz/1dHYc6+WG5fGFlH8BXVsC4
         J/rg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k7-20020ac85fc7000000b002f93e27b8d5si5643495qta.41.2022.06.27.09.33.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 09:33:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o5rgB-0001Ur-E1
	for alex.bennee@linaro.org; Mon, 27 Jun 2022 12:33:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o5rfp-0001Qa-1f
 for qemu-arm@nongnu.org; Mon, 27 Jun 2022 12:33:17 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:47081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o5rfm-0004j4-O3
 for qemu-arm@nongnu.org; Mon, 27 Jun 2022 12:33:16 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.167])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id B472E111DC919;
 Mon, 27 Jun 2022 18:33:08 +0200 (CEST)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 27 Jun
 2022 18:33:07 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R00438de6169-8622-491a-8a5c-195e37d4bd23,
 659C98CE65B422D4D127A36693B7EAD6442F0B22) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f4866421-06b2-a2b5-5c60-8a3cf3457e9e@kaod.org>
Date: Mon, 27 Jun 2022 18:33:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 0/7] Add Qualcomm BMC machines
Content-Language: en-US
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, Peter Maydell
 <peter.maydell@linaro.org>, Titus Rwantare <titusr@google.com>, Andrew
 Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Patrick Venture
 <venture@google.com>, Hao Wu <wuhaotsh@google.com>
CC: Graeme Gregory <quic_ggregory@quicinc.com>, Maheswara Kurapati
 <quic_mkurapat@quicinc.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220627154703.148943-1-quic_jaehyoo@quicinc.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220627154703.148943-1-quic_jaehyoo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 3b7343b0-0e1b-42aa-b585-bd22f36849f3
X-Ovh-Tracer-Id: 15835782191662140405
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudeghedguddtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleelieeigfekfeeitddvieegteeuteekffekleehuefgteetgedvkefghefggfeknecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhohedvle
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: P/HZB4AEfTeD

Hello Titus,

On 6/27/22 17:46, Jae Hyun Yoo wrote:
> Hello,
> 
> I'm sending a series to add Qualcomm BMC machines that are equipped with
> Aspeed AST2600 SoC. Also, this series adds MAX31785 fan controller device
> emulation. Please help to review.
> 
> Thanks,
> 
> Jae
> 
> Changes in v2:
> * Fixed a typo in QCOM DC-SCM V1 HW strap value comment. (Rebecca)
> * Removed a useless change which is reverted by the next patch. (Joel)
> * Changed machine name to 'qcom-firework-bmc'. (Cedric)
> * Dropped FRU eeprom initialization part. (Patrick)
> * Fixed comment for a case of PB_ALL_PAGES. (Titus)
> * Removed an error log printing when it handles PB_ALL_PAGES. (Jae)
> * Fixed a typo in copyright in max31785.c. (Rebecca)
> * Fixed indentation issues in max31785.c. (Titus)
> * Fixed license identifier style and refined indentation of defines. (Jae)
> * Added PMBUS and MAX31785 config selection under ASPEED_SOC. (Titus)
> * Moved machine updating part from the previous patch. (Cedric)
> * Refined code to avoid retouching by the next patch. (Joel)
> 
> Graeme Gregory (1):
>    hw/arm/aspeed: add Qualcomm Firework BMC machine
> 
> Jae Hyun Yoo (2):
>    hw/arm/aspeed: add support for the Qualcomm DC-SCM v1 board
>    hw/arm/aspeed: firework: add I2C MUXes for VR channels
> 
> Maheswara Kurapati (4):
>    hw/i2c: pmbus: Page #255 is valid page for read requests.
>    hw/sensor: add Maxim MAX31785 device
>    hw/arm/aspeed: Add MAX31785 Fan controllers
>    hw/arm/aspeed: firework: Add Thermal Diodes
> 
>   hw/arm/Kconfig        |   2 +
>   hw/arm/aspeed.c       |  95 ++++++-
>   hw/i2c/pmbus_device.c |   6 +-
>   hw/sensor/Kconfig     |   4 +
>   hw/sensor/max31785.c  | 573 ++++++++++++++++++++++++++++++++++++++++++
>   hw/sensor/meson.build |   1 +
>   6 files changed, 674 insertions(+), 7 deletions(-)
>   create mode 100644 hw/sensor/max31785.c

Will you handle the pmbus/sensor patches or would you mind if I took them
through the aspeed branch ?

Thanks,

C.
  

