Received: by 10.223.188.70 with SMTP id a6csp1118785wrh;
        Wed, 23 Aug 2017 12:26:39 -0700 (PDT)
X-Received: by 10.55.99.215 with SMTP id x206mr5373908qkb.334.1503516399603;
        Wed, 23 Aug 2017 12:26:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503516399; cv=none;
        d=google.com; s=arc-20160816;
        b=jB/3IRdQyqMLJX2ibmdMoAlHPs3e0bEogmJQzAi496pp5+eB5f/ZkiOYJ8VoW9ay3y
         n3IbC7+y1/6+uuJr562h8vcOqWfIstMkofFni1gnPyuMphqlZwhZ9XcfzP4HjUrof4+E
         ZuU+y6kwRgzN/VcIj/7TEGk6cR92p2FH+VbjOf41q6xCn/O8WQ9Ii5/KhXEYJwzdMpT9
         TsLKEzgpDdKqbYp8koy0t8PI0yFb/y2Kp15Fmat5kTDtvD+49IsXelHnNxVN1PqDTB5R
         9NESMrql/ekTOy1K50kcEsxtSKTpRmHPtZBubKT3bMfrsDrr/BJRpQvZ8qJxwQDpeUZM
         Oayg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=X73KQKwRm1PRHViQKyouROxAxawyieELpwjyicvr/Eg=;
        b=VCfA9mmuqmjs44arfzkmq2/VBxWxYg3sqC/oqhT0TgjqYC5e3NX2zRBjtjy0L0Ei+s
         wpYxrEBgN87/q2hGiQeXa4frTlnoP55HUHTl7DnFDevK3+9q1ZPtfbhfmtBjwj/3+BRc
         T2Y1ZdmdkpZPYdI+uJmeXOb1Z7D9KNtSKDsOYfnfCP7OSpHV8SQFoAvRzyMYKCmyCs8f
         dwQ8lEMHuRvE7OlgtcWc0o3l+mnoVAFWc1+qGREn4u1KUGBhd3enpyL4Oh1McAHvU+6t
         ZewfEhyxoXhAqgC7SXSYC57o9036KFP7IrYELqHMj/a2xvFZjOERbNinJ7PtNGqiqdvB
         g+3g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w28si2022137qtw.517.2017.08.23.12.26.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Aug 2017 12:26:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45384 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkbIT-0003TW-AU
	for alex.bennee@linaro.org; Wed, 23 Aug 2017 15:26:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60252)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1dkbIL-0003SC-QW
	for qemu-arm@nongnu.org; Wed, 23 Aug 2017 15:26:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1dkbII-0002Lh-Kr
	for qemu-arm@nongnu.org; Wed, 23 Aug 2017 15:26:29 -0400
Received: from mel.act-europe.fr ([194.98.77.210]:44199
	helo=smtp.eu.adacore.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <frederic.konrad@adacore.com>)
	id 1dkbII-0002LN-Dk; Wed, 23 Aug 2017 15:26:26 -0400
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 9675A82439;
	Wed, 23 Aug 2017 21:26:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at eu.adacore.com
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uKLUyB8BwMyu; Wed, 23 Aug 2017 21:26:25 +0200 (CEST)
Received: from localhost.localdomain (182667ea.cst.lightpath.net
	[24.38.103.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id 4093A8137A;
	Wed, 23 Aug 2017 21:26:24 +0200 (CEST)
To: Thomas Huth <thuth@redhat.com>
References: <1503414375-21009-1-git-send-email-thuth@redhat.com>
	<27da1dae-1e2f-559a-d8f0-c7e15289363e@adacore.com>
	<d5be8092-dc56-14aa-b950-d82e7f959ec1@redhat.com>
From: KONRAD Frederic <frederic.konrad@adacore.com>
Message-ID: <ee875a77-c10e-cb36-6932-2dc60bf08365@adacore.com>
Date: Wed, 23 Aug 2017 21:26:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <d5be8092-dc56-14aa-b950-d82e7f959ec1@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 194.98.77.210
Subject: Re: [Qemu-arm] [PATCH] hw/misc/auxbus.c: Mark the aux-to-i2c-bridge
 device as non-hotpluggable
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QUafPbFZzGr/



On 08/23/2017 07:22 AM, Thomas Huth wrote:
> On 22.08.2017 20:15, KONRAD Frederic wrote:
>> Hi Thomas,
>>
>> Looking to this seems there is a second issue:
>> The aux-to-i2c-bridge device should connect on a TYPE_AUX_BUS.
>>
>> I don't think there isn't any on integratorcp..
>>
>> Anyway the patch you sent fix this issue indirectly and as far as
>> I remember I wasn't able to make this I2C bridge an
>> TYPE_AUX_DEVICE as it's a special device and it is internal (only
>> instantiated at the bus creation).
> 
> If it is intended to be completely internal only (i.e. also not for use
> with the "-device" parameter), then it should even be marked with
> "user_creatable = false"! ... if you got some spare minutes, could you
> maybe sent a patch for that? I'm not familiar with that code, so I'm
> always having trouble to give the reasoning for setting a
> "user_creatable = false" somewhere...
> 
>   Thanks,
>    Thomas
> 

Ok will do!

Thanks,
Fred
