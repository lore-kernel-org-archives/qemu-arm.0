Received: by 10.28.4.212 with SMTP id 203csp4142607wme;
        Tue, 8 May 2018 06:05:01 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqGmfXlsCInhLNt3QQlDs4x5Yerwm8w8duJ1ZpUUOLqxTOKfsivGrHhPxV7k8YKxN2HPpZA
X-Received: by 2002:ac8:108d:: with SMTP id a13-v6mr37542881qtj.214.1525784701665;
        Tue, 08 May 2018 06:05:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525784701; cv=none;
        d=google.com; s=arc-20160816;
        b=iU4khe+1tIg6aENiDAyV4S9l3MPDj2oymK3UxKar4pZhwW7+hedFUWjsckGlvRyELN
         OwP0q0/xIcOnSY133iWms3IvP3ViMYN37mSHjR5kz/fvD9jqEv+lx/LKE3N5S3/ll1+k
         LFMTjHtNWkBoEwivMTg9amElRBOFzxmWRQE7wITJFSVeovqHaqnBud/y1xRvdUYGnzb4
         Txo9/uRx8trM6aoJlz3yf/ZDlSvwRgaQnQKc9HgPcBVQQuIg5q8uf5FAER9eM5TRLIuk
         2VHpC7b8OrTcj04DU8t8UiZe2dFsmsc/iddWDnDcOHo/He0YAf3h2jmPIh1uZ9UX37VD
         QL6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=+HUB0ui9czOKwn0fhB/Xf+/alIEKN8j2EEay42R3REY=;
        b=OVT9D2FiXwloi6/ZM5Y3/suq3wjBy23fClz2bDrXd6nzG8szFbnXKYUgF/dJSOO1GS
         t437RpcXJvSfat17pqYFAE0tCzVFGghZfuFlCTlwJwSHOLeGqBWkw27djuwQghe41BY6
         gxDW1RybP2jadQOBFu/lyDkhb26IuiljmkA4rQ3CM8AffIeOuOhT8Fwq5L6AXSr9WL9K
         iKlo9dBFLGZ/ppKak6whVB8loIY92wDbGAs9Bcd7nc64QZZlaShhWPqLXz9gDKIaBbeS
         HvmXoHO36pnkgr7+Wk3AfW3S/kxduUIrBYP7Mqgo8Jiu4ejFdP3FeiNqTwvlJA51bF8J
         08xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jOAUSXmM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l2-v6si19583176qvo.196.2018.05.08.06.05.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 May 2018 06:05:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jOAUSXmM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51137 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fG2If-00071b-9J
	for alex.bennee@linaro.org; Tue, 08 May 2018 09:05:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50209)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fG2IL-00071G-1B
	for qemu-devel@nongnu.org; Tue, 08 May 2018 09:04:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fG2IH-0004nF-9K
	for qemu-devel@nongnu.org; Tue, 08 May 2018 09:04:41 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:40849)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fG2IH-0004mr-5b; Tue, 08 May 2018 09:04:37 -0400
Received: by mail-qt0-x243.google.com with SMTP id h2-v6so40846332qtp.7;
	Tue, 08 May 2018 06:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+HUB0ui9czOKwn0fhB/Xf+/alIEKN8j2EEay42R3REY=;
	b=jOAUSXmM/woRnHfeJnMfiWuSXBs7CkGUfCTsAFZHQ7HIrs7the3sXZm/CIQYVSVHGF
	4M2pgryTpVOzLo2416kakYTAB+9Dsd540XTVqxOjU56PvxbGXGTYS3qCbTYjDU47eDM8
	EyHMN2aaMSqFew4nnA4XP6+TU0qpXlqK7wrzTD6n/smOqO2kf57vkE18eyPqIn7kA/f/
	rJqDRSIssrQTbELIdGoJptmorZ1h9b8m11ZHFuEvnnRb/7ke9E3k9n+qXBgBCAP3j3Pc
	muPJcKNCD4JH0vAzrzY3E6xMF4mrUg6SQFAtJskkQFvklo1n10zQn2Tps/7uLNdLT7wE
	rbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=+HUB0ui9czOKwn0fhB/Xf+/alIEKN8j2EEay42R3REY=;
	b=tYDGrtplEn3D8vEbspjmtcws6ICNdqxw4TGDzrTzrOX+5YhnZkRmhfgut/rGkCXcRl
	ZZ7bkNax7nq74pjeff5XnEWg/ctsXrOB8vit63k7sCztA4ln3DCG9OoRe+lKlismOTIn
	NWKsDeZrlzo/AhRI2ENbv4q5oQHD1esisHqjtwcD4pPdQf1AcPI3qN+1L0CULBo0yuse
	w+HTMvgZQYmuD2u07I4vyHsO1Dzltbjyj3HkTCfFVTb//x7vrRJniMlhPxxLz5SQbP24
	QF3PCHuKDjiexIplAs6VgEjT2CteziYFQ8lsIFlq+hzuELxb9GC3PEGfsjeWq8/5K6RY
	tlmw==
X-Gm-Message-State: ALQs6tBCNQiLaOfEuJQspCWROYI9UGoUjLy4BdXFIdef83L2BkmKNtqe
	pMJG05C2ffGn5kg9MwCaaQg=
X-Received: by 2002:a0c:a3c3:: with SMTP id
	v61-v6mr29673788qvv.72.1525784676629; 
	Tue, 08 May 2018 06:04:36 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	x127sm17947061qke.87.2018.05.08.06.04.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 May 2018 06:04:36 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
References: <20180427110137.19304-1-peter.maydell@linaro.org>
	<CAFEAcA-X1-D4G4KLmXrTpQ_Yz6O3Pyzj63ir3MjiR4ZkqOF=kw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <f01b4c93-efe1-572a-5e14-7d0ca3d40ac2@amsat.org>
Date: Tue, 8 May 2018 10:04:33 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-X1-D4G4KLmXrTpQ_Yz6O3Pyzj63ir3MjiR4ZkqOF=kw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH] hw/arm/iotkit.c: fix minor
 memory leak
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
Cc: "patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R9EURuNKmbaE

On 05/08/2018 06:16 AM, Peter Maydell wrote:
> ping for review?
> 
> thanks
> -- PMM
> 
> On 27 April 2018 at 12:01, Peter Maydell <peter.maydell@linaro.org> wrote:
>> Coverity (CID1390573) spots that we forgot to free the
>> gpioname strings in a loop in the iotkit realize function.
>> Correct the error.
>>
>> This isn't a significant leak, because this function
>> only ever runs once.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>> ---
>>  hw/arm/iotkit.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/arm/iotkit.c b/hw/arm/iotkit.c
>> index c5f0a5b98a..234185e8f7 100644
>> --- a/hw/arm/iotkit.c
>> +++ b/hw/arm/iotkit.c
>> @@ -517,6 +517,7 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
>>                                qdev_get_gpio_in(DEVICE(&s->ppc_irq_orgate), i));
>>          qdev_connect_gpio_out_named(DEVICE(ppc), "irq", 0,
>>                                      qdev_get_gpio_in(devs, 0));
>> +        g_free(gpioname);
>>      }
>>
>>      iotkit_forward_sec_resp_cfg(s);
>> --
>> 2.17.0
> 
