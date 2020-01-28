Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp398074lfp;
        Tue, 28 Jan 2020 04:16:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqwwnI8+xSAra24bU6LJqE5NGU+35mTQlYT3OmLdfaAOPkxz+m2TTKP3072SPZ6Y6pgimgIY
X-Received: by 2002:a17:906:9246:: with SMTP id c6mr2863264ejx.226.1580213806563;
        Tue, 28 Jan 2020 04:16:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580213806; cv=none;
        d=google.com; s=arc-20160816;
        b=krm/gJzauVXWTIOxMW2nI2+5MWWxr/gn3hBcdTZmnWkQign8fJjSQTtEVnWZ3fl3bu
         JDQVOp9akieZta/ENp/IwNEYlz8tvLm0JXefdzabrVjB0tvKM3LQGnwrb4mhndKl+TL+
         5drzFjkPZycCZurw2eAneFkkfH9RBc6f613d9jUWz7mSDJ6Mv4cA78YWu28sLsBPrawC
         VGfS4CD4KzZPr7SZ773imhkblcU314+8oInvOrzg5MXMgTNgKgQd/Q5wP29YWlN3//GO
         WBvoD9ANbjxef/+4pcZvbwYsNuESmUFy8kmmFNUWItIpDAI4HiDUvV5IkZltOm560jB+
         AItA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=q6gUrwN2AZjCBQs0Mq9KS9CzBrHVLDSRXxFIuYn4DZo=;
        b=XQJHsaTetoqw5fkCGaUZ6TVCKOkj5poKYUECHOh28p91Lil1m6+BzEVrq7JmNKw3Ln
         kBuC6RUcOQpJMMmt4tya/enMwbBX/e97IhvVYDw2N7O/MQzWXzOzcVwS8zD0vaq823UJ
         8TsUVNhbP6nnNnch3lV/R/BRS12xRHpXFvLLbqUoB8V29znJNde/NTq/Esh/EhSK1j7P
         smlVQZ1/28gJsDs3pGxn98T8NqWMq1kCpwIRXcfHMvB0ZmfJNemPk/crROZkHbQACJvJ
         BxowKDNGP9ouaXnygw7bCKK1gcc0BsWY707gia6ddCFQfdGkPnMEmt8zwKyRwZATgY47
         ojTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Nf5TY6W2;
       spf=pass (google.com: domain of thuth@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id w7si1374735ejq.528.2020.01.28.04.16.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jan 2020 04:16:46 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Nf5TY6W2;
       spf=pass (google.com: domain of thuth@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580213805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
	bh=q6gUrwN2AZjCBQs0Mq9KS9CzBrHVLDSRXxFIuYn4DZo=;
	b=Nf5TY6W2UhNyxlMjKLkv83BazBoVQN70GGAiqJQvNnaPGVo9kfzDzs10Vm63F8Wpob7JEj
	/QQ7J9RgjtLkHPkKEmT/bxX/3c8elT/xrUpyFNhzDVezy4/NRdaWiKl7+VuITPb3nLQrYg
	1JfdDy9lWqD4pN4Yw5LB1K+6zWUW/4M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-HXVbC5CMMmimxHD9cMPX7Q-1; Tue, 28 Jan 2020 07:16:44 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB450800EBB;
	Tue, 28 Jan 2020 12:16:42 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-117-147.ams2.redhat.com [10.36.117.147])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3254319C58;
	Tue, 28 Jan 2020 12:16:34 +0000 (UTC)
Subject: Re: [PATCH] tests/acceptance: Add a test for the canon-a1100 machine
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20200127144126.15515-1-thuth@redhat.com>
 <cd60a444-620e-3366-09e8-e9c8d72894ad@redhat.com>
 <c4976fd4-f1f0-c48b-aad4-4414564f8258@redhat.com>
 <05f7e133-8ad3-8627-79a1-a046e6d42d16@redhat.com>
 <2a303987-ad19-538b-98ce-a2cb83d8fade@redhat.com>
 <9856cc15-2365-4609-5af9-f6582cb20ed8@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <6b5cba1d-4aba-cd59-74a8-880a8d800a35@redhat.com>
Date: Tue, 28 Jan 2020 13:16:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <9856cc15-2365-4609-5af9-f6582cb20ed8@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: HXVbC5CMMmimxHD9cMPX7Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Bb0Mds3Bve45

On 27/01/2020 21.56, Philippe Mathieu-Daud=C3=A9 wrote:
> Hey Wainer,
>=20
> On 1/27/20 6:45 PM, Wainer dos Santos Moschetta wrote:
>> On 1/27/20 1:41 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>>> On 1/27/20 4:39 PM, Thomas Huth wrote:
>>>> On 27/01/2020 16.18, Philippe Mathieu-Daud=C3=A9 wrote:
>>>>> On 1/27/20 3:41 PM, Thomas Huth wrote:
>>>>>> The canon-a1100 machine can be used with the Barebox firmware. The
>>>>>> QEMU Advent Calendar 2018 features a pre-compiled image which we
>>>>>> can use for testing.
>>>>>>
>>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>>>> ---
>>>>>> =C2=A0=C2=A0 tests/acceptance/machine_arm_canon-a1100.py | 33
>>>>>> +++++++++++++++++++++
>>
>>
>> What is the reason for not adding this case in boot_linux_console suite?
>=20
> Because there are too many tests in this file and it became hardly
> maintainable. Also it is easier to add a 'F:' entry in the MAINTAINERS
> file to each machine section.

Additionally, this is not a test with a Linux kernel, it uses the
Barebox firmware instead. So boot_*linux*_console.py sounds like the
wrong place for this test.

 Thomas
