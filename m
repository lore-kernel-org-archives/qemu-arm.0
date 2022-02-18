Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp637811lfq;
        Fri, 18 Feb 2022 03:26:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyBi5K0WuI7px4vLgNzyY5/o0vPQnkPEyoiQj1GpNdBi2Ch5hZF4H4sZkUEHvhlH1362pxP
X-Received: by 2002:a25:8546:0:b0:61e:1d34:ec71 with SMTP id f6-20020a258546000000b0061e1d34ec71mr6527700ybn.259.1645183588288;
        Fri, 18 Feb 2022 03:26:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645183588; cv=none;
        d=google.com; s=arc-20160816;
        b=D5wTNBHJhzPBN76cuzf+jNtZhwTUe30fm9e7yBscM3T5EZaoos3K80Hvgu8nUWn1Rw
         qlUIwhUbt/EWGfZKXiA2Q0/hVguut7mIrCAcrHgGK3Oll7SXer/oyWXoh4UA6+7RRJIG
         NfIPljLg2KLhWylpd4q6dwYUpW2nEOw588ShsA3jDNOvS0RFvDn1VkKNliRoDO0oigPQ
         LSs5pJcgDmg8qhbZfChxxr7gIr5nJ+9fM4bhV2Pcz6Fmnghk126xYjR9TFTE3MbvXpjD
         EH5DDZU08jJXQOSNTtfrGwo+6SzQsqUSXmoueUF3OycZXnl/jz3F3rk8h0Gx9QolW0+S
         QdNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=5O95J1V3kONvR1BO1twzYvSqoiqbknCE3A318KnDwpw=;
        b=QK2KYFgig0O0zruNYuRO/jrdklPAK1iL5EpCW4S7JdahjzBy61jwXzfo8m7sptU2zf
         XmQ1mDpX7lJo88aZ3iSm95RKgzzSJRnbDXn0Ty+fDWouxI7RqgPDE9vb7D5tEJnVVOY7
         DAOOH+J0ldIbVT0fe8d8XwG0LEO3bUDRcMGZtlXLGYaXNtRfE55Y9GaKBgohNf0X14FK
         B4YpDnRvOHlhNVq6+VdSMMPjHweQxT7fSlN02Z0aPAezu+s7cLTooKh4M8frDHpiXAYn
         HhsEr0OSt4MIMnCwmtM+QMaKQvap3GAei9pVV4sHIRIWmdk9cHvRfXTWXlz9XJUtmX8m
         hlvw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b4si8096890ywh.8.2022.02.18.03.26.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Feb 2022 03:26:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nL1P9-0008P3-Ko
	for alex.bennee@linaro.org; Fri, 18 Feb 2022 06:26:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nL0kZ-0002ex-DA
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 05:44:32 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:33267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nL0kN-0006gF-UX
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 05:44:31 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.235])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id C525BE11B4FE;
 Fri, 18 Feb 2022 11:44:16 +0100 (CET)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 18 Feb
 2022 11:44:16 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0038dab4bc2-a2d3-4688-9e8d-1d06ab4f34f1,
 07432D932CF505C4D002BA4105FABD7408393EAD) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f7088ee7-7811-3477-f1c8-5aaef4ef072e@kaod.org>
Date: Fri, 18 Feb 2022 11:44:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 0/7] aspeed extensions
Content-Language: en-US
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220218081815.641169-1-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220218081815.641169-1-clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 26a7bc64-0a3e-4c74-8ca1-81df44de8045
X-Ovh-Tracer-Id: 8682940084219186083
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrkedtgddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghu
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Iyha6g6yaBEJ

Peter,

On 2/18/22 09:18, Cédric Le Goater wrote:
> Hi,
> 
> Here is a set of extensions for the Aspeed machines, the most
> important ones being the removal of a deprecated machine and a simple
> model for the Secure Boot Controller, both from Joel.

I have a PR ready to be sent if there are no further comments.

Thanks,

C.
