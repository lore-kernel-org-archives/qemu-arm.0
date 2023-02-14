Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp969709ejb;
        Mon, 13 Feb 2023 23:06:27 -0800 (PST)
X-Google-Smtp-Source: AK7set+pwYXYpdQ7rij42yIfRPMKoqh6lrKBVesu7qDn3H3/zoHmLXIPS3kgMlnYGAaHmzL5Rg7l
X-Received: by 2002:a05:6214:250b:b0:53c:f76f:2e3c with SMTP id gf11-20020a056214250b00b0053cf76f2e3cmr3392970qvb.46.1676358387621;
        Mon, 13 Feb 2023 23:06:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676358387; cv=none;
        d=google.com; s=arc-20160816;
        b=RbTa2OZCntOzCDMb76NWNs2V9AsUOpmPKt10u700HhlCKpB4hnYWYgetxxvGo9Hd6G
         Y7XORWzjxs/Nx87TH1+kdH8dXNfx1atY/X+EK+7CtIphEs+UFvbNSnqBrXQTwYiTP1TN
         KttGtlS6LWsXpmv5rQbpo5kFKbXO0OlOsR1B7QgQSp7ok39iSv/hiWR9WV0c81MC5In/
         EWyF021TZEhJiuJeZ/4mR4neHqN7z6Gv0mnjnaqC+vV8ZGvU09Ts4nHTlEv1KMmkEvhf
         7lRkn2UjnxWiGR0wFchn9sM2KnLW8wOBnBfobFALHjR+KgAiiNSBvzGldOXWRhfGFwyE
         H7sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=rj4PP39EaY/fvTRMb0SoJhqoiO+oPoRJpmZtDeXXdRE=;
        b=BV7yXDQhN9q6qX8XFx4n5V9ypgSZMLZjudgRWlEDGep4RAyOuTdZVMRr6Rnbv/Wakq
         /IMSCwOhYZEbGijgF36ktQBDgSDY8yiVjBaqzju9tFf9qqcyRvBn3RtH0WliFsO5GEhf
         neSmk1uQJwGiRqUoDZiPma/4iE9YXw6r40S34238OtQxWL55c1GirCc7xFrmO+szE0kQ
         jUU3fjNcm3hmxcjTZ/ZqPg2uO8FnXwVP8vA3exy7/KhvBL+mw9j8O2KJINB01uVbD4XE
         Jl78TMDoWGYBqeZQDQKpIWs1m5232RzYtitm7TpQyhuyTBJXezjfhBcTb7ID9eSlHz/g
         qN/g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y18-20020a05620a25d200b00738e9df500bsi11848182qko.50.2023.02.13.23.06.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Feb 2023 23:06:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRpO4-0004XE-Bt; Tue, 14 Feb 2023 02:06:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pRpO2-0004SF-QR; Tue, 14 Feb 2023 02:05:58 -0500
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pRpO0-00051Y-Pv; Tue, 14 Feb 2023 02:05:58 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.179])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id AD60820440;
 Tue, 14 Feb 2023 07:05:53 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Tue, 14 Feb
 2023 08:05:53 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0010c9539f3-d58f-4d8a-bc41-54843a0f243a,
 D27BB99F68B8EC7888E3647E3ED2C6CF660736DE) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <7589543a-f108-fe88-489b-1f0bba896c5f@kaod.org>
Date: Tue, 14 Feb 2023 08:05:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1] Adding new machine Yosemitev2 in QEMU
Content-Language: en-US
To: karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>, QEMU Developers
 <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
References: <20230210125028.839131-1-pkarthikeyan1509@gmail.com>
 <e16436c5-585d-1a9b-1d62-249922e924c6@kaod.org>
 <CA+ezb7ifqiE-WJnBfDpn6-F17ukkarqnXTmMsSTNRGAHEnp0mA@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CA+ezb7ifqiE-WJnBfDpn6-F17ukkarqnXTmMsSTNRGAHEnp0mA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 54f00da6-d1a8-439a-ba31-cf389094681e
X-Ovh-Tracer-Id: 3661707972486859741
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudeivddguddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefgfefgfeetjeffteffjeehteeugefhieduteefjedtgfefudejteffveejheefgeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphhkrghrthhhihhkvgihrghnudehtdelsehgmhgrihhlrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.345,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1hY7/pNXVWfC

Hello,

[ adding the lists ]

>      > +static void fb_bmc_i2c_init(AspeedMachineState *bmc)
> 
>     The same routine name is proposed in the tiogapass patch :
> 
>     https://lore.kernel.org/qemu-devel/20230210122641.837614-1-pkarthikeyan1509@gmail.com/ <https://lore.kernel.org/qemu-devel/20230210122641.837614-1-pkarthikeyan1509@gmail.com/>
> 
>     Do you have plans to populate the I2C buses differently ?
> 
> 
> This is an initial patch we have been working on adding more specific configurations in the future.

OK. Then please rename the routine with a "yosemite" like prefix.

Thanks,

C.


