Received: by 10.25.44.15 with SMTP id s15csp5151869lfs;
        Tue, 11 Jul 2017 10:45:49 -0700 (PDT)
X-Received: by 10.237.42.78 with SMTP id k14mr1557431qtf.58.1499795149092;
        Tue, 11 Jul 2017 10:45:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499795149; cv=none;
        d=google.com; s=arc-20160816;
        b=fBM9davfGkVYZIVfUgdT8PdyECS/RcKZvBvRgDqby9smID7J63ToRvf9JFdcIK9JAG
         iXbaImEnhOdfKYKx/C4QtUEo/FWQng1yV8UgWgbJJuRNDm1xuVhr+mZM1hGP23lo3E3j
         yrKHrMBbUwxOZm5jOu6/i3ECkDuGT4skdtmSwloS3btQFMzX86eVqZf2javyhZDY7RES
         aMmvep9VozMOip4Dk+Pi/UZxqRiu5vTX3zp1ypQtapR3Zt5hZTcW02LDDYLjbjHmkSH4
         sS6wKgjZqrforbLmtt/H/ZYE4kZOsydYTjv8Y4rdLCKoMuVmHPppMo2iw4jD3XJ+Vu4y
         KPag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=TMX7sviEyTWWXQwPW8oFnr7P3qzARHtfsMvpAPkiT/I=;
        b=YHucr7bWwiWMCxyv1eC5ys2/NELJz5ab/A8+oVaFcvst0xn5XxSeqG2LdbS5VnhSCc
         AeS9WoaGvaHdeXpVbUTSROGd4yrB7GKS0PnlmHxizBzRWxdaJQPo7jreiYXe6U9ifHmc
         xMlUgoVmFMd0j+GSUCtUH7mrFetZ1OfCG/YqB8HHCdfaXTBY4L8taFEmUkL2nDbLYYbI
         KuOFelBPK6RCWtqf2DnAFp5K134K/ASE1/bmR8BeS7GRAclTI3nmf73zjBXagIixNBF1
         TB6TxuIDVkUl0kC+rPCoR/NgArzraA1GYkOCNsLk9A84BhjS2kMMXu6jqMDpAlOwZvoR
         E7Jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=pniww8ux;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id s20si509719qtc.127.2017.07.11.10.45.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 10:45:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=pniww8ux;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48057 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUzEI-0004X9-8b
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 13:45:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52914)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dUzEC-0004W3-PH
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 13:45:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dUzEB-0007ze-Um
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 13:45:40 -0400
Received: from mail-qk0-f196.google.com ([209.85.220.196]:33372)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dUzE5-0007jD-QJ; Tue, 11 Jul 2017 13:45:33 -0400
Received: by mail-qk0-f196.google.com with SMTP id p21so1880667qke.0;
	Tue, 11 Jul 2017 10:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=TMX7sviEyTWWXQwPW8oFnr7P3qzARHtfsMvpAPkiT/I=;
	b=pniww8uxMobOndlhK+N9b8nkSj9lH7ogWJpvcMY3+1NkvfDybpl1BcO13g/WByEXw2
	5zSRKHTnSUqQfJ5Oz4UY8NkZvv7ZWW5WArgbt8fWrN0K8msH2XyctzbMS42jeyVCvfrY
	vGrpWIAPcr404S7gWLDeznJdxXRnLRdyN8mweqY5BPCFwM9Wiqp6pfv6BpRh0mOpkG+7
	7vASQULoOH/LtBCMihHFg5gmjHZ3TKEy2pbxgzhfsGy9Vu+YkK6lGCfub3sBYdumzYMo
	vZAEKyVAGxJpVgVL3X7Q7KaGofi4Y10brr4j4p5IhURJg1+2zXJerQcYYRqQM1VU26Ql
	cYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=TMX7sviEyTWWXQwPW8oFnr7P3qzARHtfsMvpAPkiT/I=;
	b=U2LYOtnFp97qqZpP/MT39MnuJRIp1ObUEcvvKWxp2wZvxhYdK7z6RBp9BN3fMW1sZC
	2I3UVNMI7LI1eiVBmpgTky4EDMm3TF6DGAlB8L5fwGX8q3kbvFr00Sn20BiFBI6ic4y4
	9rJtTfUuMKFIEf7k8gYLTPx1sfDctVqxEm2tsOQdw/IS4uLc+hlXSEX98sEO/VnSq0yZ
	Yq7/Sbfan2NfK/DzOH/Hzjn+7s/4sTL5z9dzqeoEe6DlcXFS8FQIJc1zelHMqVNF7DmW
	Z8QVINqF7mzuY2nSKRknlyqlBUtoMFiAhapWxPTTVoBenVmNxvU0q5K9w+CYv7kj8Aii
	vypQ==
X-Gm-Message-State: AIVw112Hx7Jdz0b15TDBKJGwpu+tEO3/ZtJ66f7Xx8/M2xDlVoEKKE2P
	seRf4nUL60EPXA==
X-Received: by 10.233.222.69 with SMTP id s66mr1394844qkf.30.1499795073141;
	Tue, 11 Jul 2017 10:44:33 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id 8sm491228qkx.28.2017.07.11.10.44.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Jul 2017 10:44:32 -0700 (PDT)
To: Alistair Francis <alistair23@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1499771839-32518-1-git-send-email-peter.maydell@linaro.org>
	<1499771839-32518-3-git-send-email-peter.maydell@linaro.org>
	<CAKmqyKPn+JEVWmpzypZt=8kH80aNa+aNAZLhPSWvHy+h5gyd=Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c5d5897a-2b01-c4b3-d759-051a8edcc4d4@amsat.org>
Date: Tue, 11 Jul 2017 14:44:29 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAKmqyKPn+JEVWmpzypZt=8kH80aNa+aNAZLhPSWvHy+h5gyd=Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.196
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/7] hw/char/cmsdk-apb-uart.c:
 Implement CMSDK APB UART
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G7Q0TOr8HWfc

On 07/11/2017 12:12 PM, Alistair Francis wrote:
> On Tue, Jul 11, 2017 at 1:17 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
[...]
>> +#include "qemu/osdep.h"
>> +#include "qemu/log.h"
>> +#include "qapi/error.h"
>> +#include "trace.h"
>> +#include "hw/sysbus.h"
>> +#include "hw/registerfields.h"
[...]
>> +REG32(DATA, 0)
>> +REG32(STATE, 4)
>> +    FIELD(STATE, TXFULL, 0, 1)
>> +    FIELD(STATE, RXFULL, 1, 1)
>> +    FIELD(STATE, TXOVERRUN, 2, 1)
>> +    FIELD(STATE, RXOVERRUN, 3, 1)
> 
> You used pasrt of the register API but not the second part. This seems
> like a greaet device to use the register API on.

He did not used the Register API (declared in hw/register.h) but only 
the Register Fields API ;)
