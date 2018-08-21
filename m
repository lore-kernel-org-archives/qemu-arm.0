Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1996746wrd;
        Tue, 21 Aug 2018 07:43:06 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZ5wBuz/kW13dnpPMp3WzKjfiQAkrp9eUtLyd/w5h/rPPggRMZR5XzZ1iBNE7xvDfWA8TDD
X-Received: by 2002:ac8:3630:: with SMTP id m45-v6mr15325810qtb.210.1534862585963;
        Tue, 21 Aug 2018 07:43:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534862585; cv=none;
        d=google.com; s=arc-20160816;
        b=leKm4Ubm13kboGfeHFnOvOrlcAFswq/H0WaQyf6agpP85/nVPahfytXuFeoDhe8GCh
         YhJOdlX/XgtlIpV5n7X2TSsaruOK8TFJgE1HEy2H4z8Y0GDgZq68Gje7cWp78LPmQOKE
         0bnERlFCPXUjrJ/yABpCAfFsOrQNIGdhgg28DoIzRbopAD9u1+XaKmcOI8rwKguO5t1a
         iJ+uVdb+tu5FON9yqZSNw+6S4iC682JJii/Bb6j7EztVJ4Q++B7M8ADySta7iV1MqeI/
         Id9UB22M5kfikMi68okpCqMW2DgQKCYJlVJfdwuuzUvjuFrSilWn2cwV24JMJeA2D+jr
         hsSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :arc-authentication-results;
        bh=6hRT+Kes+3IyLZykuE2VWoC6zqfZlzwQVKzlzGUUXMA=;
        b=hhhB/HAX+3lylZ8uqE1flCmScT/pN10d23r1FYEpADJDPXzfbaWjZ9QUnvFGFK/byJ
         CUHmPkUo+KPZeGGLJtO5/wm7p6oSq5306s9sCPrthSDjC3tpw0P95NQJzNuSMYJmQRVc
         YfmrikfWhADb62VbYWGcRnIXuKKYclRKzIxwhvT1z4z1Lzc5Jx1KCunkgo+5/Q4bFoe/
         QxB2Q03ywh1ib8PAkO1BxiMHkIRA5ik9nn2pjiVf48JlcBzaPVKHtqR0kBwrgslZPeDI
         Zeqy1Vy67OPg1M2UftebxqyeK84RdL89mK9SECbtcl7Ozf2dYZVcdLZbIvNrDdqnw8V2
         LnSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q5-v6si9625401qkf.160.2018.08.21.07.43.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Aug 2018 07:43:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54037 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fs7s9-0005cD-Fs
	for alex.bennee@linaro.org; Tue, 21 Aug 2018 10:43:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49116)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mail@steffen-goertz.de>) id 1fs7ZN-0008Fp-8C
	for qemu-devel@nongnu.org; Tue, 21 Aug 2018 10:23:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mail@steffen-goertz.de>) id 1fs7ZM-0006Rr-Ei
	for qemu-devel@nongnu.org; Tue, 21 Aug 2018 10:23:41 -0400
Received: from steffen-goertz.de ([88.198.119.201]:43658)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mail@steffen-goertz.de>)
	id 1fs7ZH-0006OI-VB; Tue, 21 Aug 2018 10:23:37 -0400
Received: from [192.168.43.40] (tmo-102-6.customers.d1-online.com
	[80.187.102.6])
	by steffen-goertz.de (Postfix) with ESMTPSA id 907DD4C664;
	Tue, 21 Aug 2018 16:23:14 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Steffen_G=c3=b6rtz?= <contrib@steffen-goertz.de>
References: <20180811090836.4024-1-contrib@steffen-goertz.de>
	<20180811090836.4024-7-contrib@steffen-goertz.de>
	<CAFEAcA_=8r_X_rLfwJovEkusBb6hmaG5Ns8YQxQMLL4z0KpHXw@mail.gmail.com>
From: =?UTF-8?Q?Steffen_G=c3=b6rtz?= <mail@steffen-goertz.de>
Openpgp: preference=signencrypt
Message-ID: <6c13fca2-6f16-adb0-1072-7601abefd18d@steffen-goertz.de>
Date: Tue, 21 Aug 2018 13:43:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_=8r_X_rLfwJovEkusBb6hmaG5Ns8YQxQMLL4z0KpHXw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 88.198.119.201
Subject: Re: [Qemu-devel] [PATCH 6/7] arm: Instantiate nRF51 peripherals
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
Cc: Jim Mussared <jim@groklearning.com>, Stefan Hajnoczi <stefanha@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ITb4oCqmsT/X

Hi Peter,
>> +
>> +static uint64_t clock_read(void *opaque, hwaddr addr, unsigned int size)
>> +{
>> +    qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " [%u]\n",
>> +                  __func__, addr, size);
>> +    return 1;
>> +}
>> +
>> +static void clock_write(void *opaque, hwaddr addr, uint64_t data,
>> +                        unsigned int size)
>> +{
>> +    qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " <- 0x%" PRIx64 " [%u]\n",
>> +                  __func__, addr, data, size);
>> +}
>> +
>> +static const MemoryRegionOps clock_ops = {
>> +    .read = clock_read,
>> +    .write = clock_write
>> +};
> 
> You don't need to roll your own "do nothing but log" device:
> you can use the TYPE_UNIMPLEMENTED_DEVICE to do this.
> 
Until we have a more proper STUB for POWER/CLOCK/MPU peripherals we actually need this,
because the unimplemented device will return 0 on reads which will cause guest code to stall.

Agree to and regarded the rest of your remarks.

Steffen
