Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp1833850wre;
        Thu, 24 May 2018 05:59:58 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKL1Sqs52CCe263+cL6xR4o7G2yQR4X4wWm1IJB/+UFlSXmob5BopQadAhSzkXm7kX0pTs+z
X-Received: by 2002:ac8:2b50:: with SMTP id 16-v6mr7068492qtv.260.1527166798140;
        Thu, 24 May 2018 05:59:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527166798; cv=none;
        d=google.com; s=arc-20160816;
        b=Hl82y/4H4Hr2ufMgvfaE9HFMHM+2YIJOMQxAhWxbebfc8iYOkZrz7JZvJlS3aMtUI6
         +4KTl3X1nuC5EkND+pcX5e3ez9DBnjZJB11QyoXTKnrgvAzm4U+0JkDXG6LSkFM0cpH3
         THlFNTAeY/XUCPsAtV1DxME1Jau+TXx6L4zb2WykF3qRXBYBsQE9Tdp4M9UcoJNOVy1N
         XCjOXokmp9k5HVy18T4P16oh5igBl0h5nFoGxGxT0tGjGadbsQIu9yv8VNgtZCn7RMqu
         sb5HPm8c0UmnI0tVaAfXkup+fdJZWcJKKnV7Ehy+BnmQXFXltH4Vt3ohNvrV+40fiMlQ
         WwFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=IfyxMzsvA40lKXL7xyWWTFESCs88CBTKIpQH530YwjU=;
        b=jw0C/5+hiD/wzJ9XdCIl/AKfhJHej8y6i1FyNQG7/tV1e082AFy0C3n4gZyCZi4rqB
         w1mzz2VfBlJQCGb0yo0yU2i8YD/eftB2eetmywpsES6/TPa6YcvWvmg8d6QeFStXJKAT
         IBmfalH44oStJ3XzsCfGtP6h8KWtMMIjfoOXwsNlmBDtE0N7Q0Gzw1BWoqVFXtWtkCKt
         slEklGLoUdv19mhceFuuKfiuxRKkO8Jjf+G+3tjnPlKghRoRLwrockKxWHv2cmX11WFj
         JygOqL7lFpQWYfKQsXqPQdrjuLzAThHd3SIlFyqteRzA9rwfMcVudDwXqdA1gJwYeFYP
         fYCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f9-v6si4088714qvh.216.2018.05.24.05.59.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 May 2018 05:59:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38543 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLpqX-0000ta-NV
	for alex.bennee@linaro.org; Thu, 24 May 2018 08:59:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43666)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1fLpqN-0000tS-Al
	for qemu-arm@nongnu.org; Thu, 24 May 2018 08:59:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1fLpqK-00089K-AN
	for qemu-arm@nongnu.org; Thu, 24 May 2018 08:59:47 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48416 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1fLpqK-00083S-59; Thu, 24 May 2018 08:59:44 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 011EF402178A;
	Thu, 24 May 2018 12:59:41 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-121-84.rdu2.redhat.com
	[10.10.121.84])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 219C82166BB2;
	Thu, 24 May 2018 12:59:39 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1527091418-11874-1-git-send-email-eric.auger@redhat.com>
	<ec6bc0b3-5f0b-bf0c-7d9b-0382e114ee9e@redhat.com>
	<bf99311a-823d-34e8-1892-be27534afc32@redhat.com>
	<22c4e504-a7b4-e6dd-b2cc-618d306b6f0c@redhat.com>
	<CAFEAcA9LMV_-vVAwUkuY=uw2Gf6XLvsgmi8y0PgHPJnQZkWC0w@mail.gmail.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <550464ac-5155-6311-d0f7-92c7c0813f82@redhat.com>
Date: Thu, 24 May 2018 14:59:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9LMV_-vVAwUkuY=uw2Gf6XLvsgmi8y0PgHPJnQZkWC0w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Thu, 24 May 2018 12:59:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Thu, 24 May 2018 12:59:41 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'lersek@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 0/2] ARM virt: Support up to 256
 PCIe buses
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
Cc: Andrew Jones <drjones@redhat.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Auger Eric <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sVEPGbmT/Z2Z

On 05/24/18 11:11, Peter Maydell wrote:
> On 23 May 2018 at 21:52, Laszlo Ersek <lersek@redhat.com> wrote:
>> On 05/23/18 22:40, Auger Eric wrote:
>>> On 05/23/2018 07:45 PM, Laszlo Ersek wrote:
>>
>>>> Regarding the second patch, I do believe we need "more sophistication"
>>>> there. For example, I guess it could be possible to distinguish "-cpu
>>>> cortex-a15" from "-cpu cortex-a57" somehow, and stick with the low/small
>>>> ECAM in the former case. (The 32-bit firmware already runs on cortex-a15
>>>> only, and not on cortex-a57, according to my testing.)
>>>
>>> So we should detect we are in ACPI boot  + aarch32 mode to force legacy
>>> ECAM region, right?
>>
>> Agree about the aarch32 subcondition.
>>
>> However, "ACPI vs. DT" is not the right "other" subcondition here;
>> instead we should (minimally) check "firmware vs. no firmware". See the
>> "firmware_loaded" boolean field.
> 
> Won't it also break a guest which is just Linux loaded not via
> firmware which is an aarch32 kernel without LPAE support?

Does such a thing exist? (I honestly have no clue.)

If it does, then there are two options:
- don't enable the new ECAM range by default (always take an explicit
option),
- offer both ECAM ranges and let the guest pick one (I should add that I
have no idea whether exposing such *alternatives* is possible via DT and
ACPI; i.e., "pick one but not both").

Thanks
Laszlo
