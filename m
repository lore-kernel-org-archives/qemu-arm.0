Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp197278lfp;
        Tue, 28 Jan 2020 00:24:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqyLGn7Rix65gecEpMoU9Mec3yE0EAjmHgPt1SVDQQ+qlm8lMe/7SFNn5Qfo09cuRe0bVvZ6
X-Received: by 2002:a05:620a:6cc:: with SMTP id 12mr21789733qky.307.1580199889355;
        Tue, 28 Jan 2020 00:24:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580199889; cv=none;
        d=google.com; s=arc-20160816;
        b=omH5rRCU9bpIxijITpRhVb8whsvm0CXOAMeZW7MoM8k9lrQm6i7IiVaTd9yfh6gmKz
         wH4jZOo/TopLCo0KO7BXgp3ioShlik8XeumwKb+ic2a20tKbrzPJej4OvmblUsfGCmHY
         7919E83xBsA9oCfBLs9ho5QiDbp7VovRbGTGLX3xn2MkB1v1CasD4108+oqCT/tVHyHB
         cvP3vtKSOvYrULyYJritCKUR0I0ZwV/EX5DKZeZ6LNXEfldePiwhwuRaKTvzy1zlaM2J
         osUb+B93RCnolOCFGEbuC+iGMT2qLNfec+TXx9exe0LHRoAzMVtxT9iO2Wb41YHUPo3O
         flyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=VbMZ1PVA2JQRa7jPzZgJQp6E7BVS/1mjrlQ6mX+fVF4=;
        b=ydTGG3rUhQ8Yf6AmzS0/DxGoItsPje98MZjLrHPGNE0KBinqVWzepz7+2ljadjnGo4
         /d4v543+Y3nwITytnG72vdjmb11xOdEoTZ2ebvjOlMbzP4VVUX9aJnWTTIm1+yFn38M1
         JCy1RbbnKqEfUthp+Nnpo+ctOrNQdArHfwd1t/2Ifkp+0cJB90UjjLdoHefDx2qkiGGB
         MCMPGdWv3XCTjMmoRLvR8s38iHlcUsXWKqYwHdvcy6wV7Su6cxRzVqoIUsxZuoYU9LtD
         xpRNqmXX9qOLsDDoHx2P4N2wdjyzhRqCUpsJbwAB030UwhmhzcpOq+Ch26arggrqzHwf
         Z3KQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u35si11427257qtd.394.2020.01.28.00.24.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2020 00:24:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iwMAy-0007nE-QY
	for alex.bennee@linaro.org; Tue, 28 Jan 2020 03:24:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48268)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iwMAr-0007n1-PR
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 03:24:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iwMAq-0007Op-Ie
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 03:24:41 -0500
Received: from 9.mo173.mail-out.ovh.net ([46.105.72.44]:35811)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iwMAq-0007MT-CS
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 03:24:40 -0500
Received: from player692.ha.ovh.net (unknown [10.110.208.202])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 3B28612DF6A
 for <qemu-arm@nongnu.org>; Tue, 28 Jan 2020 09:24:37 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player692.ha.ovh.net (Postfix) with ESMTPSA id 03B71E9186F7;
 Tue, 28 Jan 2020 08:24:28 +0000 (UTC)
Subject: Re: [PATCH v3 1/5] hw/sd: Configure number of slots exposed by the
 ASPEED SDHCI model
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200114103433.30534-1-clg@kaod.org>
 <20200114103433.30534-2-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <149987eb-a657-b7e0-7ca8-198281ed1713@kaod.org>
Date: Tue, 28 Jan 2020 09:24:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200114103433.30534-2-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 17277215546196396864
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrfeefgdduudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheiledvrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgh
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.72.44
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cDZngYDsyrFZ

Hello Peter, 

[ ... ]

> +static Property aspeed_sdhci_properties[] = {
> +    DEFINE_PROP_UINT8("num-slots", AspeedSDHCIState, num_slots, 0),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>  static void aspeed_sdhci_class_init(ObjectClass *classp, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(classp);
> @@ -181,6 +187,7 @@ static void aspeed_sdhci_class_init(ObjectClass *classp, void *data)
>      dc->realize = aspeed_sdhci_realize;
>      dc->reset = aspeed_sdhci_reset;
>      dc->vmsd = &vmstate_aspeed_sdhci;
> +    dc->props = aspeed_sdhci_properties;

This will require a change to use device_class_set_props(). 

Do you want a resend ?  

Thanks,

C.
