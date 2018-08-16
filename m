Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1923349wru;
        Thu, 16 Aug 2018 07:32:12 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwBWmjiCXoA2Vs7Smq6nGHjF6H73jRlenofHpNzslXpvRiJTE5zbgm8VYX6K2uLquVWAFNr
X-Received: by 2002:a37:bac7:: with SMTP id k190-v6mr27948664qkf.138.1534429932821;
        Thu, 16 Aug 2018 07:32:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534429932; cv=none;
        d=google.com; s=arc-20160816;
        b=bLk+duZmKtcf4tQ7EYKx02Eig/O1NqojnWQr+gV1C3xl+HLp0jqLaQKkYnbreQicqW
         pIGRLEnCT5y5hozijhJx5DhJI/yiBhBJvTSWhCZ6a815lsb5qvop7pcbXT7sNJlPoS41
         POuflYG9KQMaBjfYaRr7Mj0izFShjTU6ANWiJU8pB918L8ifJxZe4jzXIo6DnE9camrw
         xojwvZeunn4996O1W/POXpU2Cy7cH1N53mqous4U87nkzZ6X/0qDSgreFRPeTA+u/I9m
         vCVZGa73ixo8DDNSKEPwAypSQW/Eu3xi9aoIOWvtaoziikpNciBrg1U+RM8fsgshoHE6
         PlBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :arc-authentication-results;
        bh=kJx215yAASFM6xJmFkdnn0dTf0UDfE407HMEptJsQ9A=;
        b=cYzBjPbB05FdkDQZ578SPgo+hvhx9KuKTXAnESJd9P3nXDiitUdVVFKNRaNU0Myrkx
         GbpAFQzSzPxFUvcBCW0AsuYUfkYzXfbXYNokHH0y8FrO7+Gl9EdPAFuJ8HVxs896HQp3
         x+4xsTeUM5yv4J77aUVe5R0nI9Mi5MteF2LLLraHt6JyFVIvNoRO2VE4OoTn9VXQpT3q
         9kITuODa6Kc9xmbXqVljQEfayR/iWQFn8z/E/lDfhBUGFEmeR6518tVFi1mJ/YT9ZxYL
         GasIvHOBLHOJv0vBs2TkaklC2Y9prXhuCXyegLIxQbno4IaYTqS+Nx2ZFrqPZcWR/CyP
         +jog==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h46-v6si1119657qtb.233.2018.08.16.07.32.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 07:32:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56081 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqJJs-0000tt-CG
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 10:32:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44332)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mail@steffen-goertz.de>) id 1fqJ7a-0002Ue-8b
	for qemu-devel@nongnu.org; Thu, 16 Aug 2018 10:19:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mail@steffen-goertz.de>) id 1fqJ7U-0000VH-RH
	for qemu-devel@nongnu.org; Thu, 16 Aug 2018 10:19:30 -0400
Received: from steffen-goertz.de ([88.198.119.201]:42244)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mail@steffen-goertz.de>)
	id 1fqJ7L-0000Gy-1r; Thu, 16 Aug 2018 10:19:17 -0400
Received: from [172.20.123.198] (xdsl-84-44-128-60.netcologne.de
	[84.44.128.60])
	by steffen-goertz.de (Postfix) with ESMTPSA id D69564BFF2;
	Thu, 16 Aug 2018 16:18:57 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>
References: <20180803052137.10602-1-joel@jms.id.au>
	<20180803052137.10602-4-joel@jms.id.au>
	<CAFEAcA9o8JE-ZE3SLBTFrrNCgtJ85L6T7opPZnd0pJaZVkRdVA@mail.gmail.com>
From: =?UTF-8?Q?Steffen_G=c3=b6rtz?= <mail@steffen-goertz.de>
Openpgp: preference=signencrypt
Autocrypt: addr=mail@steffen-goertz.de; prefer-encrypt=mutual; keydata=
	xsBNBFISUmcBCADaBJoSxQkymObumw0/0Q9cJVLhGeAnrxWgzQWQeqABKy5bATao5X9OHCz2
	OSrYCySFjUpxXak16A7QVOAnF1yQ7hZboF9lCgD7qBLPaILTqnprFJnVDSnSWQbhL/DAVj9H
	zr6IMckK2IPwfBIHH5EHCnD4iMm46VyUsJ0uZkC/Vk6gVTBk7oNt3OOcX2L46JrBHtwlWmQS
	IVtIoMkY12OtL1XinYl8sCemHHbzH8i6SxU7RRMTJ9HVFMil53+iNB/8ijA0UOSIxUC+lqmu
	DTJs1AqDyOmeCzNfbWlUxKrL0k/l1Xzb4CrWfPkMr73uEatTlLzl10FIeLD8duS6pq83ABEB
	AAHNLlN0ZWZmZW4gR8O2cnR6IDxzdGVmZmVuLmdvZXJ0ekByd3RoLWFhY2hlbi5kZT7CwIEE
	EwECACsCGyMFCQlmAYAGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJSE0JxAhkBAAoJEKa4
	cHmNxsadzNwH/0YYsIpj2mXTUyvtFBTiaDQLcgkjAZHTiCOQdeEW4LH1H/BP2h8dtHPNbWHy
	0Qz784dW0cn/5zFes9pdM1GX3aCwz1J8evShHAYZDnqHJFDJICxQVecjUYN40QJyu/hQkMRZ
	rDzCTCOrRhhOg1FfLRRbu99+JyAa0n+dhqBchteShi7UakHZ/xWR4l6TqRUzTiMqNj5t0DCr
	ZxAXbBBFYXwkd4I4J/MXyrFPreeYBl5ZL9zcDeR8+YFT51Jy1FnbpqS8AzmEeE1MLkwTHb/+
	ay4tV1dzzkLEhwBdr62WtDq6OT8xi/b0DtZdkR3ql1wJoNdm6GVbZ39HjqpQ78JAuBnOwE0E
	UhJSZwEIAJm/T51dBsjaa9+iBJD0BUJsd1cXLtQMXDfPW7K3A2AH22JJnbQ1bZDiulFRp035
	VqOo7FJTG2ls4sDuI+BjdLYvt2tDEdECfS9bSPcdCFmwCflbnqfSbYz6NAoUMnxyS0TPe/ts
	5JL2g0dtF0HO8PTjOCabxAfOIrpOshHut4pVeLoLtbzYoARF5diMF/eq2tNEHKcylRQ54az4
	rlnynHa7ImHTgy2wsAVF6n9f1LP36w8pUefdzamXTA1+2RCDQFPIepU/C7dLaeuBp8+P/vE/
	VC5YDRh00lADhC+4QckFqiE04qjrnuBDgq/Yu9NgVygWkAs1+UGU5go31GGJO00AEQEAAcLA
	ZQQYAQIADwUCUhJSZwIbDAUJCWYBgAAKCRCmuHB5jcbGnVlGB/9i0/rLEuhXRVQVvH9/eDyp
	H6oCplgAi8A65Uea84x8EKFyzziH2VvOnnP5asM7yh6FMkIbNKmNivlj2w3001YxF/c7miC+
	PCelzzv+YlavcZa1PCgBTYkUeQcaOclCST4jcO8K/4owYkQdCfoak8B8fJkYOZJh0HL0daAw
	B5dsD3WjVaxB30+GtW+AQdj0ceBub36l2raeQyLZwL7XLaSpGi7c0PeUW9i3Z4LOGyrLfouf
	OZI9gV+gBQXra3FA6XFKn3he52JUXh17756rU7kpq1R5Ql0Xs6KOO+HvhAMkjbopAyBSmzD4
	CKCOI4XAIXHVlUjaHfRNDutHAwNMNxig
Message-ID: <07bdb32f-fcd2-c9d1-23ea-388d256e240e@steffen-goertz.de>
Date: Thu, 16 Aug 2018 16:19:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9o8JE-ZE3SLBTFrrNCgtJ85L6T7opPZnd0pJaZVkRdVA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 88.198.119.201
Subject: Re: [Qemu-devel] [PATCH v4 3/3] arm: Add BBC micro:bit machine
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?Q?Steffen_G=c3=b6rtz?= <contrib@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Jim Mussared <jim.mussared@gmail.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZYC9JMEosyGJ


>> +
>> +    arm_m_profile_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
>> +            NRF51_SOC(soc)->flash_size);
>> +}
>> +
>> +static void microbit_machine_init(MachineClass *mc)
>> +{
>> +    mc->desc = "BBC micro:bit";
>> +    mc->init = microbit_init;
>> +    mc->max_cpus = 1;
>> +}
>> +DEFINE_MACHINE("microbit", microbit_machine_init);
> 
> Your subclass of TYPE_MACHINE has extra state, so it can't
> use DEFINE_MACHINE (which creates a subclass whose instance_size
> is the same as the parent TYPE_MACHINE). You need to do this
> longhand:
> 

Hi Peter,

this is covered in <20180811090836.4024-1-contrib@steffen-goertz.de>

Steffen
