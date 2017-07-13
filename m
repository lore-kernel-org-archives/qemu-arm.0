Received: by 10.25.44.15 with SMTP id s15csp2446353lfs;
        Thu, 13 Jul 2017 10:20:05 -0700 (PDT)
X-Received: by 10.237.35.239 with SMTP id k44mr5989251qtc.125.1499966405816;
        Thu, 13 Jul 2017 10:20:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499966405; cv=none;
        d=google.com; s=arc-20160816;
        b=wITubJxvAlsDhzmKmq65Ba5R3PFO6JLkzhiVUkqj2Tr7DmQrVSN2Pzw4j/G0LFYIBL
         /i7AgAlfTPayz7lNyowbjHW56lY8y8pbdUW609+YhqdNxqiuacIgjJEcO07I7JILgPdE
         A2n86NyipOLJu8KXopFkfToGjyXDAZtEuMqSGsCxGTh4sR9gWGZckFv6iKCfJxiv+QPi
         bb52UAhh1j1h5ZnzzfnZEz9ZgRqrEi4zFWRcSa+aSXevB87eWe5fX9LV9H1jhn6FQU9S
         wGjt5MegLTCAKzYkN+rlyM3U4OggjiMmOo9gFM4DhXnjwnznLROm7JztRD4l6ilSP5Fl
         muQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=iZDwxAzgSA0hiNAxRkB6K2wtgQJbsEnxUZXb83Ucpoc=;
        b=KV7ORlT28vWtbxqT5IDsIce0EPCW5dLxUVrFevrUtYTYn39mcfoe1OFm6FWYYumTDF
         k0VMSIKHk2zCSdRHbPF84AubzH/+ffLaEvWMsvFOuSLzgKOe0pOWbOg9bATqPpSK2JdZ
         1/aocRwvTLEZlMG4Zjkk6JQT+cDy/KhRNigIaaO3mO+6vVV8zOfD3tb4mHmkLg2E0uSg
         O9+EM2dLTWa3ygO3XwJyBy99NlUxLLsXTKrhB7SCed/qqWwci/uyWKHauqweQe+QleW3
         Na2WzMe052DUTTks43iAGsOkVOYM5mKeXcRxqG29/Zb2Qx27houAXUTCeJvJUMXTBIlf
         QbCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.b=Iua+ye/S;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q6si5570549qtg.84.2017.07.13.10.20.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Jul 2017 10:20:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.b=Iua+ye/S;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33215 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVhmV-0000cE-0A
	for alex.bennee@linaro.org; Thu, 13 Jul 2017 13:20:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57056)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dVhkz-0008BH-GR
	for qemu-devel@nongnu.org; Thu, 13 Jul 2017 13:18:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dVhky-0005fs-I9
	for qemu-devel@nongnu.org; Thu, 13 Jul 2017 13:18:29 -0400
Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229]:37167)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dVhky-0005fS-AP
	for qemu-devel@nongnu.org; Thu, 13 Jul 2017 13:18:28 -0400
Received: by mail-wm0-x229.google.com with SMTP id i127so33082284wma.0
	for <qemu-devel@nongnu.org>; Thu, 13 Jul 2017 10:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iZDwxAzgSA0hiNAxRkB6K2wtgQJbsEnxUZXb83Ucpoc=;
	b=Iua+ye/SBbLXh0EuSAK8LSi37IYj1U0N3lu5qH1QI4TxxAi5D8bmSAsICt5YEf/JEi
	0qcq88yg+1q/rHG1mueO1BGblrKZ52AqCAReci/qH+dZMpU5VeeE0Fo1SN6Bl2veVmnj
	yMhUY/Cgblg0F7OHIA7B585yH6M34DI2WtAAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iZDwxAzgSA0hiNAxRkB6K2wtgQJbsEnxUZXb83Ucpoc=;
	b=WtnEv236T4qFdl2jOF6ne0R+3+5PTqHOpaiqivLm3u2N0bI3GpSEmaSeYQ8LB208IY
	IrL6pn1ZOBHel9Kh8LZOt1M5DczZaCr5Idk1MjJLRwglcnX/DySBl6cikujN09WfA3tL
	Cfr46jXWC4iocxHebvs+lgL/y1idtynK3mTJf+38p+gehpmIrvaxPspBodKHj1Jni/wY
	rlLXP1+oOfv2TllEZHItNZ4qaa7AuhP239SAFnwhhrLsSMJ+bnoIb6OwAY6L+pum3iML
	mOujL63p/fyztuuQp52j7NYfmGuIBHmUWwrQJU+iTsFJ7cuGJVZK1HhuegvjFOyaGV6W
	trPA==
X-Gm-Message-State: AIVw113g3LwTKXtJXFFjwbaKkr2lL/uYW0S3PMGZkpj480EeG34q5VG2
	WKLyef2nsKVKI4JHU38rjA041WnNw4xD
X-Received: by 10.28.129.205 with SMTP id c196mr3059699wmd.120.1499966307203; 
	Thu, 13 Jul 2017 10:18:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Thu, 13 Jul 2017 10:18:06 -0700 (PDT)
In-Reply-To: <87d194xnyp.fsf@dusky.pond.sub.org>
References: <1499788408-10096-1-git-send-email-peter.maydell@linaro.org>
	<1499788408-10096-3-git-send-email-peter.maydell@linaro.org>
	<87lgnt99xz.fsf@dusky.pond.sub.org>
	<CAFEAcA-oEZZgPDOayLpZ1_aC0hEeOcYBL3+XejtJXnt4wDyqow@mail.gmail.com>
	<87d194xnyp.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jul 2017 18:18:06 +0100
Message-ID: <CAFEAcA-XrYnnzH58LkyObyJH-eGuEHK-BuQkRjwFbZmMr1oeXQ@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::229
Subject: Re: [Qemu-devel] [PATCH 2/3] qdev: support properties which don't
 set a default value
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B4TBJRY6KH65

On 13 July 2017 at 18:10, Markus Armbruster <armbru@redhat.com> wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> On 12 July 2017 at 12:22, Markus Armbruster <armbru@redhat.com> wrote:
>>> Peter Maydell <peter.maydell@linaro.org> writes:
>>>
>>>> In some situations it's useful to have a qdev property which doesn't
>>>> automatically set its default value when qdev_property_add_static is
>>>> called (for instance when the default value is not constant).
>>>>
>>>> Support this by adding a flag to the Property struct indicating
>>>> whether to set the default value.  This replaces the existing test
>>>> for whether the PorpertyInfo set_default_value function pointer is
>>>
>>> PropertyInfo
>>>
>>>> NULL, and we set the .set_default field to true for all those cases
>>>> of struct Property which use a PropertyInfo with a non-NULL
>>>> set_default_value, so behaviour remains the same as before.
>>>>
>>>> We define two new macros DEFINE_PROP_SIGNED_NODEFAULT and
>>>> DEFINE_PROP_UNSIGNED_NODEFAULT, to cover the most plausible use cases
>>>> of wanting to set an integer property with no default value.
>>>
>>> Your text makes me wonder what is supposed to set the default value
>>> then.  Glancing ahead to PATCH 3, it looks like method instance_init()
>>> is.  Can you think of a scenario where something else sets it?
>>
>> OK, proposed extra paragraph for commit message:
>>
>> This gives us the semantics of:
>>  * if .set_default is true and .info->set_default_value is not NULL,
>>    then .defval is used as the the default value of the property
>
> If I read your patch correctly, then this should be "if .set_default is
> true, then .info->set_default_value() must not be null, and .defval is
> used ..."

Yes.

thanks
-- PMM
