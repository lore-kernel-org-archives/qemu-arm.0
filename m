Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1871993ejb;
        Mon, 27 Mar 2023 05:34:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350aeuNxt9kFzYA6PNY3dMjm+IgY2TXs3D26yGs7N4R7nwMx0FZMXT85mdbTR8p61o/Fbr2Ul
X-Received: by 2002:a05:622a:651:b0:3bf:d7f8:4f85 with SMTP id a17-20020a05622a065100b003bfd7f84f85mr20269822qtb.12.1679920484034;
        Mon, 27 Mar 2023 05:34:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679920484; cv=none;
        d=google.com; s=arc-20160816;
        b=s0QkZVJXqOvQ4bwbXkkh7tK7/moVzh6X6E30wwy2traSfyNTmTD3uhIf/jeblPGkqy
         /IgiKFX/aWz08iSDTD2E6cCRbqttTEI27aKR7RHafHHPq/RWAxd9ZL0cwU/YonVQSzgJ
         0HgfUbG7/QfUl08isfQ7GmrMTeAej0YxgYFVnQvMQCML0nQF//sFIJWcfepGWJqOOQEX
         dutxvoA5Ja4AdNnuPIV85XpBMxuKAU/+q6XH40ZfnGupSB8Rga70skMmSeGHrRHyuHTb
         W5GvuCbjuPI1UWAZFpii8RSGUTluzjAuAMVghFna033CTiuQRW2RBSRGInlWW/JIY1Mv
         7PTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=IYZQDE0RmjtHZ6PY8eQTN8cK6jtKsHRl0CTw57dpj3w=;
        b=08Xju45K9dor/EDUQe9HfDsINVgyaewD2b7t++enNEbfDNdhS203MSyIipuHWKNQik
         qg4tFV8UVz3snEsQEZumXzqIHXq1LdG9puimKTN0UhYpq/lB4vC+epwXc5sQK91GeBY7
         HNk4UWzLiUknJtT4JL9ZZ0dtX8EjBwrhbuYSt+rXlKfkG/jjkn8vTGXRyLSLPaDFmXOC
         +GTshkbn9aHIju4Y0iZdH8JzY6UrJF6xU/OWq3mYk55whH9J8yxTm8S4fBK7K6I017lU
         AHxtk5XcQ8ikzvGLIa0te1JOwAREa5waUaAol8pOh1vyqEYoZEZR7rv7LY+4dvs4WSgI
         DBXA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i4-20020a05620a404400b00746b2d7bccdsi9641096qko.506.2023.03.27.05.34.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Mar 2023 05:34:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pgm3D-0005aT-A7; Mon, 27 Mar 2023 08:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pgm3A-0005a9-Vj
 for qemu-arm@nongnu.org; Mon, 27 Mar 2023 08:34:13 -0400
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pgm39-0004iq-Ck
 for qemu-arm@nongnu.org; Mon, 27 Mar 2023 08:34:12 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.21])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id DAFC62AA4C;
 Mon, 27 Mar 2023 12:34:04 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 27 Mar
 2023 14:34:04 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002dd298c66-e207-47ac-8a7d-e6da7941e07f,
 A6C3435B678E6C193C864925704A598F32E2E8B9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <29f7e479-2e2c-a9d6-d5f1-440cdfce0cb7@kaod.org>
Date: Mon, 27 Mar 2023 14:34:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 4/7] hw/ipmi: Refactor IPMI interface
Content-Language: en-US
To: Hao Wu <wuhaotsh@google.com>, <minyard@acm.org>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <venture@google.com>,
 <Avi.Fishman@nuvoton.com>, <kfting@nuvoton.com>, <hskinnemoen@google.com>,
 <titusr@google.com>, <peter.maydell@linaro.org>, Joel Stanley
 <joel@jms.id.au>, Frederic Barrat <frederic.barrat@fr.ibm.com>
References: <20230324230904.3710289-1-wuhaotsh@google.com>
 <20230324230904.3710289-5-wuhaotsh@google.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230324230904.3710289-5-wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 31aa0fe1-2e2a-4df7-bc54-53cc38afce23
X-Ovh-Tracer-Id: 10177009262024100856
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehvddgheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeuuddtteelgeejhfeikeegffekhfelvefgfeejveffjeeiveegfeehgfdtgfeitdenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopeifuhhhrghothhshhesghhoohhglhgvrdgtohhmpdhmihhnhigrrhgusegrtghmrdhorhhgpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhvvghnthhurhgvsehgohhoghhlvgdrtghomhdptehvihdrhfhishhhmhgrnhesnhhuvhhothhonhdrtghomhdpkhhfthhinhhgsehnuhhvohhtohhnrdgtohhmpdhhshhkihhnnhgvmhhovghnsehgohhoghhlvgdrtghomhdpthhithhushhrsehgohhoghhlvgdrtghomhdpph
 gvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhjohgvlhesjhhmshdrihgurdgruhdpfhhrvgguvghrihgtrdgsrghrrhgrthesfhhrrdhisghmrdgtohhmpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
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
X-TUID: spdX9j+WhcjQ

Hello Hao,

On 3/25/23 00:09, Hao Wu wrote:
> This patch refactors the IPMI interface so that it can be used by both
> the BMC side and core-side simulation.
> 
> Detail changes:
> (1) Split IPMIInterface into IPMIInterfaceHost (for host side
>      simulation) and IPMIInterfaceClient (for BMC side simulation).
> (2) rename handle_rsp -> handle_msg so the name fits both BMC side and
>      Core side.
> (3) Add a new class IPMICore. This class represents a simulator/external
>      connection for both BMC and Core side emulation.
> (4) Change the original IPMIBmc to IPMIBmcHost, representing host side
>      simulation.
> (5) Add a new type IPMIBmcClient representing BMC side simulation.
> (6) Appy the changes to  the entire IPMI library.

'IPMIBmcHost' is a BMC object model (internal or external) and
'IPMIBmcClient' is a host object model ?

[ ... ]

> @@ -267,15 +267,15 @@ void pnv_bmc_set_pnor(IPMIBmc *bmc, PnvPnor *pnor)
>    * Instantiate the machine BMC. PowerNV uses the QEMU internal
>    * simulator but it could also be external.
>    */
> -IPMIBmc *pnv_bmc_create(PnvPnor *pnor)
> +IPMIBmcHost *pnv_bmc_create(PnvPnor *pnor)
>   {
>       Object *obj;
>   
>       obj = object_new(TYPE_IPMI_BMC_SIMULATOR);
>       qdev_realize(DEVICE(obj), NULL, &error_fatal);
> -    pnv_bmc_set_pnor(IPMI_BMC(obj), pnor);
> +    pnv_bmc_set_pnor(IPMI_BMC_HOST(obj), pnor);
>   
> -    return IPMI_BMC(obj);
> +    return IPMI_BMC_HOST(obj);

QEMU PowerNV machines model the host side of OpenPOWER systems which
have an Aspeed SoC based BMC for management. The routine above creates
an Aspeed *BMC* object model for the PowerNV *host* machine. I find
'IPMIBmcHost' confusing. It shouldn't have a 'Host' suffix I think.

'IPMIBmcClient' sounds ok, or 'IPMIBmcPeer' maybe.

Thanks,

C.

