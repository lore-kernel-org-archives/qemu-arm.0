Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp27563wrg;
        Fri, 10 May 2019 09:35:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwWlO4y03Z9GczhJALRn4I2lktCyva6x5EsEwApJi84b1PcfEjC1XCost+jEJ/f0acd4MQl
X-Received: by 2002:a17:906:4e87:: with SMTP id v7mr3947729eju.150.1557506133102;
        Fri, 10 May 2019 09:35:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557506133; cv=none;
        d=google.com; s=arc-20160816;
        b=oxcbuWIEZDPbHGybUXsmbUnQ4V6hSA7juD3bI88iTBIa55Xnb40wP5/u/GwNYHKPOp
         dxn8l3lBZPO/ogzvpVyKMumJ5gCNM+/733IR6Pk+Ppi1aH5I7JZVOZ5r7D7y8jDQyI0h
         q06tW7fbiqXuuuWLFaE35L6p+e/g8/JOB71eaG6Ac+yxRFrmaQX2hnFva9XhYfecEUBK
         3b0t9txJumbStXnsfiNw043z/K96nK4nI1USfc/rjMNMNUsP/CZxXmLKL8VOwP9mUos8
         /7KcHQPLaDCeDdp1wHx4J85myJ3iR8hAUaJRRh+rVG4naczsKQ7/XVmMjs5IlyX7sJe9
         6UCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=LYwXj/zIKGqLD1lzPG3utwcn8WPCNvZ+A5GG/rMQKTU=;
        b=Nvx8chyfUs+hbzFCAOygxA0KgiX6WBaw2ih4jQ7fe1yyetVrRI2eQ1aUgi/mpRwM75
         4ce9Ddew70TYJOQVAyQdxq/5hrjQJ2ddIhyBVuiNm5YWhIzlqHilOBZYDQ5/w/FQ8ihc
         iIhJQqKfjmdaaGpP98a6QvRVSMGXW+TiJyJMREWWBQC+NxTxsTWn/lkva8M03AKX5F4h
         yr7SgnxtGJ6nbHzyY+OHl6j7TikVw7n1DE6mLy8ma1NuOYC33R255P6kYd5/3Io0MawW
         bPj9hTW3vvMbS0zutODh7CO96uu+m3Ds4Gf6GQrpCJ7c4cxiEKj5CvooUpB6f6dUDaIr
         MOMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZJq5voqt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f10si3529107edd.87.2019.05.10.09.35.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 May 2019 09:35:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZJq5voqt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:46452 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hP8Ue-0005w7-3k
	for alex.bennee@linaro.org; Fri, 10 May 2019 12:35:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41655)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hP8HV-0000OV-Us
	for qemu-arm@nongnu.org; Fri, 10 May 2019 12:21:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hP8HV-0005pL-1I
	for qemu-arm@nongnu.org; Fri, 10 May 2019 12:21:57 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:36121)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hP8HU-0005oi-P5
	for qemu-arm@nongnu.org; Fri, 10 May 2019 12:21:56 -0400
Received: by mail-pf1-x444.google.com with SMTP id v80so3497324pfa.3
	for <qemu-arm@nongnu.org>; Fri, 10 May 2019 09:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=LYwXj/zIKGqLD1lzPG3utwcn8WPCNvZ+A5GG/rMQKTU=;
	b=ZJq5voqtjhaaVMisl5B7cEwu4L0v+QMhTuvb4Gx82D8PtmetqWaSPZuJxSshA9CMpH
	hfqjiaOBaoRxHxaM2YZBA2MuoAXBK05sR3muNh6ExAHsEAiAwkbmke0Zd7JZUW5+Xo+P
	S3VRBPYTbA6qDnt1F09iDizKt7i+Uev4nCZwYVJl8TiOgfnw2IWtiUcb5a/3UvnM4Ik4
	qEKAcGCK299At8s3GKdvYIvMP6GkQHPyutBSjiCi0Kso4WB/IDOHm2ZDtgjEJhFuTO7H
	e+dzTC/KP2N7gMbOcdBJKBtq+E58lWpUugEDkYpxJayiInQoJiqux3qDMi7TSOHf7v98
	9drg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=LYwXj/zIKGqLD1lzPG3utwcn8WPCNvZ+A5GG/rMQKTU=;
	b=jNnOsMI6xb+06myOAQgwiHyqRyMRr1zNCuPKDKSWQCQO6utgl2qsaepK6FNSpqWJeC
	PvAdGqGatOjs2ZZ+FqEshRd6xVt5HzLScAhCWx+g6r8efTBzegEaU4dgShq0zdsD+9NX
	DMM7oeq9Vzl3LFWB5VwFOM1EnUq2Q+7e0TLLYuSkHL5dHvqbjpRblDDLpRl6MbOujQgp
	AG/Xz93xBCkOMwQsnjWc78breLeXdJlZu7Iva7+rR2n7DRZVfFS0idJRv0LvQCdmPTgB
	0ZMz4OXEWnmPqv4Oihld2D650bkCi0iSRzUNgGR4OhMkSSk39j9K6NHBrzp4MCVpKEmL
	YBZw==
X-Gm-Message-State: APjAAAXqLOUocevu3ONS6S5Icq7ApDK0KIh0+9vwk7blDxQuYUjnTsNT
	EQ4gJBt+sBqtzf3B9pQlHp8FKNs43k4=
X-Received: by 2002:a62:579b:: with SMTP id i27mr15796721pfj.205.1557505315450;
	Fri, 10 May 2019 09:21:55 -0700 (PDT)
Received: from [192.168.1.11] (97-113-13-231.tukw.qwest.net. [97.113.13.231])
	by smtp.gmail.com with ESMTPSA id
	s78sm16069720pfs.187.2019.05.10.09.21.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 May 2019 09:21:54 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190510012458.22706-1-richard.henderson@linaro.org>
	<20190510012458.22706-23-richard.henderson@linaro.org>
	<CAFEAcA9uwaev+Q=BgLBz+fgO6C7VGmw4Nxcozg2vm6TOm+LJww@mail.gmail.com>
	<dd180f6d-27e8-2f2b-a7ac-ed1d8bbc9498@linaro.org>
	<CAFEAcA-wXNKoen0bn8a7D=GzsyM38F1uummVbfVQ=B8haswCDA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <73e7038c-b40d-0f60-68ef-b3555c4e7576@linaro.org>
Date: Fri, 10 May 2019 09:21:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-wXNKoen0bn8a7D=GzsyM38F1uummVbfVQ=B8haswCDA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-arm] [PATCH v5 22/24] target/arm: Implement ARMv8.5-RNG
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q+SQfSZBEI3K

On 5/10/19 9:20 AM, Peter Maydell wrote:
> On Fri, 10 May 2019 at 17:17, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 5/10/19 9:01 AM, Peter Maydell wrote:
>>> Don't these need to be marked ARM_CP_IO for the benefit
>>> of -icount ?
>>
>> I don't think so.  There's no lock taken, as for mmio devices.  It's not not
>> related to time, virtual or otherwise.  There are no possible exceptions.  I
>> can't think of anything that would make icount care.
>>
>> Have I missed something?
> 
> If icount decides it needs to replay execution of the TB
> which the RNDR access is in, won't it get a different
> number back the second time it executes ?

Yes, it will.  I forgot about replay.


r~
