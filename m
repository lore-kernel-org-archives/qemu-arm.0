Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1996274wrd;
        Tue, 21 Aug 2018 07:42:38 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPxEJN3AzVE8JFJscxT9yvURu/F+WNe072evP0y9N7pNDf1MDvHiQ6tW4P9MNeClKUnoMhbo
X-Received: by 2002:aed:226b:: with SMTP id o40-v6mr42969050qtc.36.1534862558610;
        Tue, 21 Aug 2018 07:42:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534862558; cv=none;
        d=google.com; s=arc-20160816;
        b=QRfbbfUZKfc4rzccmR7vl6XW3n33U1LnJRPHq1mHriF3b2fQ8HPHEGeOiv87gltO1K
         RC1SvjIkl8PT2McBaVOK07MLCs5DCSc4FhksIoaX9DgEXf/URceQxAI4DVs+uzPipixT
         DOgwK+uJ/0igCo+xmxxTQ5U99RQcHJUFYNmziUGjcyyE99rcYtnjvveh6jIh0cJSDMA/
         kSDGKDUNkoGzm58rniAwhzKo9wE9MjwduBS/A+F43XkN0Xo96nONebsa82XHZVu48Sks
         khM2KecHvaza9DCFSOTCjHYbmsGswE0NAwyTTMFGT3BxGKSQQyixI/SWa3cjRrW4dzVq
         PO/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :arc-authentication-results;
        bh=PirYnrAoFt3yYX6A3mkczslD/of+CYc5OwNDKYrsEwM=;
        b=NZePfjc962Sv6jalsknPOpisA5ZEgWuAmfRUjNMuOxIsT/khLKNztFiWkE51ec9BRY
         Bb5D0Dee9IQW2PTBZCm6B99tPvjGChyMSu5Xlu2Rjd1aXODMw12kSk+I28UU4UUan1qE
         rxNEiAllWvc/tnJQP1+d5fkOdZqvdr+XSsbLipl0srBGc+9SJxOs9WKWUsTg0vYbZTpA
         NvOGjqsxkoEcPJOyNNqsAfCjlPrUzkXvaSWLFqPXSRg+Su2OntTL+o1Lv3KiW/Dp/RiK
         S8t2QH4C8ysDLjiAAcI3xhiHtYEsCdTOEfXFNdCi/7bQN3TgM3Vl/nL7eaJFgLmLF+Fl
         wCYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c2-v6si4026864qtb.13.2018.08.21.07.42.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Aug 2018 07:42:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54035 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fs7ri-0005T2-3R
	for alex.bennee@linaro.org; Tue, 21 Aug 2018 10:42:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49083)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mail@steffen-goertz.de>) id 1fs7ZL-0008EM-02
	for qemu-arm@nongnu.org; Tue, 21 Aug 2018 10:23:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mail@steffen-goertz.de>) id 1fs7ZH-0006OR-VL
	for qemu-arm@nongnu.org; Tue, 21 Aug 2018 10:23:38 -0400
Received: from steffen-goertz.de ([88.198.119.201]:43642)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mail@steffen-goertz.de>)
	id 1fs7ZH-0006NN-8V; Tue, 21 Aug 2018 10:23:35 -0400
Received: from [192.168.43.40] (tmo-102-6.customers.d1-online.com
	[80.187.102.6])
	by steffen-goertz.de (Postfix) with ESMTPSA id 74B2C4C3B9;
	Tue, 21 Aug 2018 16:23:13 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Steffen_G=c3=b6rtz?= <contrib@steffen-goertz.de>
References: <20180811090836.4024-1-contrib@steffen-goertz.de>
	<20180811090836.4024-4-contrib@steffen-goertz.de>
	<CAFEAcA-vtLpt-ScYpYPFqtQAnECuVqCW-DhKqVgoh6mAG=KfQw@mail.gmail.com>
From: =?UTF-8?Q?Steffen_G=c3=b6rtz?= <mail@steffen-goertz.de>
Openpgp: preference=signencrypt
Message-ID: <df1b1627-47e4-bffd-e73c-ffa3eb037b2a@steffen-goertz.de>
Date: Tue, 21 Aug 2018 12:03:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-vtLpt-ScYpYPFqtQAnECuVqCW-DhKqVgoh6mAG=KfQw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 88.198.119.201
Subject: Re: [Qemu-arm] [PATCH 3/7] arm: Add chip variant property to nRF51
 SoC
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Jim Mussared <jim@groklearning.com>, Stefan Hajnoczi <stefanha@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1TgZPf2Bm4pK

Hi Peter,

object_property_set_bool(soc, true, "realized", &error_abort);>>
>> -    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
>> -            NRF51_SOC(soc)->flash_size);
>> +    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename, 0x00);
> 
> Hmm. Using 0x00 here doesn't seem ideal.

i agree. The actual sizes for RAM/ROM are calculated in the SOC at the moment.
I do not really know what impact max_sz has here. I could set the it to the
maximum code size defined in the memory map of the NRF51 series. Another way would be 
to lift the calculation of the ROM size from the SOC to the Board. What would you propose?
>> +#define PAGE_SIZE       1024
> 
> Page size isn't really an obvious concept for M profile.

Flash pages are referred to here, not MMU pages. This constant is moved and renamed to NRF51_PAGE_SIZE in the upcoming revision. Would you suggest another name or can with stick with this?

> Why have these lines been changed? (Rule of thumb: don't include code
> reformatting or style cleanups in the same patch as substantive changes.)

These lines where > 80 chars before. I should rather suggest a change of Joel's patch series.

Thank you for your remarks.

Steffen
