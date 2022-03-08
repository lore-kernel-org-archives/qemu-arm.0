Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2154408lfo;
        Tue, 8 Mar 2022 00:14:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJymCFn3oP/56QwXd/x8v+yY6TeSaLk7/Ws9on9U+IjYDQUW+apTdpzyL8/klstbGDWWGgsI
X-Received: by 2002:a05:620a:1a10:b0:649:e26:6b47 with SMTP id bk16-20020a05620a1a1000b006490e266b47mr9544966qkb.143.1646727264901;
        Tue, 08 Mar 2022 00:14:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646727264; cv=none;
        d=google.com; s=arc-20160816;
        b=fmuWHqlBo9gF/tBz9667D7pvNyFFJOKxk9t/FyzDiYo6FAF11mEfhQW/Dw8fJEtspy
         h/cmh1U4a4RIFRe2dhvVi4uyejoQI8X7vMNn3uw2GGNATbOzwjsDmLadGGD1q+hCQQ5x
         /rKOQWS25cjm9wHknjN2L9+PQLefOuIiheYoRsfkBm3uAYB4zTtTn05GqAHLqmJNOumO
         R4xr0OKE5q42mzqoP0PD6Yet1dJlY/H80TIzNRS3aFvHzbLXx/Tum0Z940Fo7FqDEjMg
         WMAv/pvnCWshKbaCL8v4knv7x8LTcOvGJ+rka4byUF7tWiYwB6nyGAOs5glS8SHO2qlt
         yMVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=AvnPw3tSydY7OXdYJVzK/DZGHUMhkfeoBGHMtHa9XHw=;
        b=ICyd900xTe2jW9EEi/NZhBwuzqbHlmlwGvWuWtJoPuc785QJ635j0y20LxovHe5fiP
         vX+6fyvOOJA5bcCv0+4jxmY7zN8/FrOST2+jZtSKN6QimvhLM2lBFl7KPu+6dd82fyTN
         Bfn8roHcLQ8Y1EzsdZILzObJYIJbQem+5wI1sC3xtxm2dMjAdFtt1suJIogyCy+jbS0R
         oU5woaI7sH7dL8KynykwxT/Rm2cQ5UvAJ045ISrrG/b0sigh6TlGMulIIlTb/VVMEIg1
         uE1r01867s9f0f2jTQFyFwpOcTN4o0u+qLs6Grrw18iLoFLZZblE0S0MlR1mRU0zR96E
         lu+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k17-20020ac84751000000b002e06753cf67si2050663qtp.238.2022.03.08.00.14.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Mar 2022 00:14:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRUzA-0000Fm-Dt
	for alex.bennee@linaro.org; Tue, 08 Mar 2022 03:14:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nRUz0-0000FL-Qj; Tue, 08 Mar 2022 03:14:14 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:48735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nRUyy-0005za-T7; Tue, 08 Mar 2022 03:14:14 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.206])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 6E9D6E75622F;
 Tue,  8 Mar 2022 09:14:08 +0100 (CET)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 8 Mar
 2022 09:14:07 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0031cfb967d-7ece-47b4-b5e0-33c4471af5c0,
 03E3C14593CA27F822F61C3AD678835CDD198C87) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <2b9aed65-5cdf-0647-dc25-7cc9d488aaa6@kaod.org>
Date: Tue, 8 Mar 2022 09:14:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] hw/arm/aspeed: add Bletchley machine type
Content-Language: en-US
To: Patrick Williams <patrick@stwcx.xyz>
References: <20220305000656.1944589-1-patrick@stwcx.xyz>
 <20220305000656.1944589-2-patrick@stwcx.xyz>
 <790dd79a-4c5e-207e-86a9-9351694f0427@kaod.org> <YiZySh+cdxL7ddKI@heinlein>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <YiZySh+cdxL7ddKI@heinlein>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 23be9215-86d2-4674-be96-fb1253592289
X-Ovh-Tracer-Id: 1175439504974056230
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudduhedgudduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HZPSInWIso/r


>> There are two flash devices on the FMC. I can fix it inline since
>> it is the only change I would request.
> 
> Yes, there are.  I think all of the Facebook systems have dual FMC, for
> redundancy in hardware, but we can get by in QEMU with just a single one.

yes, the kernel will complain though and I don't know how robust
the spi-nor based driver is. I think you sent a patch for a related
issue.

The newer spi-mem driver should be fine.
  
> I'll see however you fix it up and see I can update all the other systems as
> well.  

ok. may be for 7.1 then.

> We have an internal patch to expand the CS on FMC to 2 but we haven't
> upstreamed it yet and I'm worried it will break some users w.r.t. the CLI
> changing for adding images.  

Yes. That's the problem. I am afraid some CI systems will break with
these change in a newer QEMU. The command line options will need to
adapt.

> My recollection is that the Romulus CI on OpenBMC relies on the PNOR 
> being the 2nd argument.

That's the initial assumption made years ago. First mtd device is FMC,
second is the PNOR. It is reaching its limits.

I am looking at improving the command line argument to support:

   -drive file=<file>,format=raw,id=drive0 -device mx66l1g45g,bus=ssi.0,drive=drive0

which we would clearly define the topology. Adding a cs=[0-5] or and
addr=[0-5] is the next step.

Thanks,

C.
