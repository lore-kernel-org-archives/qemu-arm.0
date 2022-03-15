Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2656174lfo;
        Mon, 14 Mar 2022 23:30:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxS6mhmSWgBiM9RV2K3VpN+MrbXsIeWeFYXSWdZgekVK7+BJ6UWV0kZ1YceL+WL9iHGhYxo
X-Received: by 2002:a05:6214:10c6:b0:432:4bb4:cc4 with SMTP id r6-20020a05621410c600b004324bb40cc4mr20377300qvs.46.1647325807053;
        Mon, 14 Mar 2022 23:30:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647325807; cv=none;
        d=google.com; s=arc-20160816;
        b=gD/rlmgM1zEbuVhyBIMzfdIvBjElYvLBfDS0vs/vLteSKA1NsixAfHojNEjCiB5q3c
         DV1mp2a8bumFQLs7T/ItWqZbmslhdPtuazyYxooGoo8wW53MaEVgzV1ol/aBlW0e/d4/
         MNEUD7AtwCJ1z44pLoXWL+HWbQxT8CFEEdlKG+zbVdZsrzvRlnzfDzgsZ2pLO760bALX
         mv0ibjZ6hxgfMYDizq39loSzhWzRMrnVbRYZoETt+cvcC/zGfrBJN3brvzWWuPa6/jHG
         FjjIKc3fvquwMyYY4o1aLcx7JHZO0UBH7SyTYgWEkHybl1unuono8wG5Vc9dU1OL2u80
         7VsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=vucm00x6zNUxgku9xlpeJCTmbBGK5xwsKub1PjP3QSg=;
        b=keSOlSBt7V793H7jn07KKGvewjqKWCKBw5+3QhVsFVWs883IHgt5Bvys44eCcgxZyO
         eveaFCyDdnZtB0oKAIaEmnU7/TZcan2lrzLJN0qtOurovmEoVqh8WrTDFAaRiY0lMPSV
         p4hpAeFoTqmIOyC2SNvc9JCwTMhqLrMYc3Wkg7WtZV9V2cj0pC8Kmihmncm8TG423163
         E9qILiiYgRS4qcsmZPOwra6+Tl6j3Ttg03pGF8P7YlqoRqOynhDFmcIXURSmVW18ZMtF
         ApJN9ft9hGm2Lo2oZ4JYPB7gCjaWHf5ZZthkPzniptRMIz4OjbkX2ZnugraB5+YccUvR
         l+pQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p1-20020ac84601000000b002e077bc5837si7632794qtn.325.2022.03.14.23.30.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Mar 2022 23:30:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nU0h4-0002Kg-Fn
	for alex.bennee@linaro.org; Tue, 15 Mar 2022 02:30:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nU0gX-0002ES-W5
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 02:29:34 -0400
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253]:55271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nU0gU-0006Xk-OQ
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 02:29:33 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.216])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 5C6BA1FE40;
 Tue, 15 Mar 2022 06:29:27 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 15 Mar
 2022 07:29:26 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003010998b5-56ce-4d74-b8c2-927eba34aa74,
 5DBA5639B77BD7FE35D3F16CFE7686729AB21D01) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <0e9a658b-883f-37e6-5572-6303037b2116@kaod.org>
Date: Tue, 15 Mar 2022 07:29:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v1 1/1] hw: aspeed_scu: Add AST2600 hpll calculation
 function
Content-Language: en-US
To: Steven Lee <steven_lee@aspeedtech.com>
References: <20220314095449.22089-1-steven_lee@aspeedtech.com>
 <20220314095449.22089-2-steven_lee@aspeedtech.com>
 <bd116f19-2110-b4be-8c17-845051d0e2d0@kaod.org>
 <20220315024257.GA6162@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220315024257.GA6162@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: dad34a3f-1013-4fc6-b0dd-fde0c0154e1d
X-Ovh-Tracer-Id: 3622864428434688876
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddvledgleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepjhgrmhhinhgplhhinhesrghsphgvvgguthgvtghhrdgtohhm
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
 Troy Lee <troy_lee@aspeedtech.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lBC2Jx7EQV6a

Hello Steven,

[ ... ]
> I was wondering if the following implementation is good to you.
> 
> 1 Modify aspeed_scu_get_apb_freq() as below
>   	uint32_t aspeed_scu_get_apb_freq(AspeedSCUState *s)
>   	{
>   	    return ASPEED_SCU_GET_CLASS(s)->get_apb(s);
>   	}
> 
> 2. Introduce 2 APB class handlers: aspeed_2400_scu_get_apb_freq() and aspeed_2600_scu_get_apb_freq()
> 
> 3. Add new attribute get_apb in AspeedSCUClass.
> 
> 4. In aspeed_2400_scu_class_init() and aspeed_2500_scu_class_init()
> 	asc->get_apb = aspeed_2400_scu_get_apb_freq;
> 
>     In aspeed_2600_scu_class_init()
> 	asc->get_apb = aspeed_2600_scu_get_apb_freq;

yes. that's the idea.

[ ... ]

>>>    static uint32_t aspeed_scu_get_clkin(AspeedSCUState *s)
>>>    {
>>> -    if (s->hw_strap1 & SCU_HW_STRAP_CLK_25M_IN) {
>>> +    AspeedSCUClass *asc = ASPEED_SCU_GET_CLASS(s);
>>> +
>>> +    if (s->hw_strap1 & SCU_HW_STRAP_CLK_25M_IN ||
>>> +        asc->calc_hpll == aspeed_2600_scu_calc_hpll) {
>>
>> Indeed, the AST2600 CLKIN is always 25Mhz. Instead of testing ->calc_hpll,
>> I would introduce a class attribute, something like 'bool is_25Mhz'.
>>
>> This change should be in a second patch though.
>>
> 
> will add a new attribute for clkin in the second patch.

yes. 'clkin_25Mhz' may be.

Thanks,

C.
