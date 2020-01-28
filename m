Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp486984lfp;
        Tue, 28 Jan 2020 05:44:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqzS41pN2xKQrAop1ocqddNit8v9FoWiRVwKPpCYJLHhwDVQLaisSlY8X/zf5EQjFmOPGZrV
X-Received: by 2002:a05:6402:1761:: with SMTP id da1mr3490042edb.41.1580219067843;
        Tue, 28 Jan 2020 05:44:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580219067; cv=none;
        d=google.com; s=arc-20160816;
        b=yQiuI4nIp0+4M55oK1oSypj2btcZ21Zb+GviX6wkvc1nhLwvlRmWSHGNducqhu38jd
         WEJcWkJpfYDgH2Rle6ZFUpqQAhQL9Gl96PsCjjCgm1CazKSfVYiMxXqLcYs+ym6tPVzZ
         zSxIlbdYDr8G0EgaqSiGBU3PebhdfWd2S8bp6v0krMp1wfQLQjM9VueHroRtU+QSAvN/
         S2FZzWTnb7qmh8/PfW6aSQk6w2GFdY314OFA0R1b6WndCyp/o1LvcdHSFFrStAwQzIK0
         c05Pv8S/sxqeaIBx9I1aB2vim9orurAvaGAn/vjyvq9vKSe0DTFO8mDY/9xQAdck5Hk6
         VgXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Hn1V9dao3s0n6SRjp1KNElxBAN/oRodnjrt1IoSuGl0=;
        b=GOSut4BzQ5jmLnkOq57jka0qIrI2/s92rOTMk1FycAVR93GVkHRXuPuSUkm4nDGuno
         E21f8R2VsP9jM5fI9TgRJyGCox/E4l3nluZb2L1MJLLfP23rGCPY7OmFvOb166+KwKtI
         o8XYg7UOX+5UQl93cAVF47gGR9iyMdyGPnQR2FkEHyz7Ym8YwG29edNQCd38+35+v4RP
         YhpRrdS3ZoKBEnNmA/lYYx34f+tbLEvd1s7C6OH4+PThLD/bCcJfl7741nWjQk1zI4Mz
         4r3NVNvVO8iN4lMRyfo/zvMyWlNEoTBERo9LH79QnrOJ2J1YFqcMm6cbKAFuuUWpmeMn
         FH+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="V/RwbKvz";
       spf=pass (google.com: domain of wainersm@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=wainersm@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <wainersm@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id n7si9788164edo.456.2020.01.28.05.44.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jan 2020 05:44:27 -0800 (PST)
Received-SPF: pass (google.com: domain of wainersm@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="V/RwbKvz";
       spf=pass (google.com: domain of wainersm@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=wainersm@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580219066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hn1V9dao3s0n6SRjp1KNElxBAN/oRodnjrt1IoSuGl0=;
	b=V/RwbKvzIvMJye/egcGMviXBWN9PA3OtcGuE2w57KWHySVirQS4ymbjOozx26W0RvvOrMe
	8hk5IFoDubJZAR75fIPkLDMX7Bl4LY4FaOrVwx8xzLB+EgFJyUO+4o4x5wazJuKOvtDquS
	Q96g5gRFmAOqrrioH0JTvTmcRBhr8PE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-zUfYqqyLOieeo0uZO6Fs6g-1; Tue, 28 Jan 2020 08:44:25 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AA8613EC;
	Tue, 28 Jan 2020 13:44:24 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-65.gru2.redhat.com [10.97.116.65])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9267D8703F;
	Tue, 28 Jan 2020 13:44:17 +0000 (UTC)
Subject: Re: [PATCH] tests/acceptance: Add a test for the canon-a1100 machine
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
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
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <f4362239-7dbd-def7-83dc-59836ed33340@redhat.com>
Date: Tue, 28 Jan 2020 11:44:15 -0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <9856cc15-2365-4609-5af9-f6582cb20ed8@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: zUfYqqyLOieeo0uZO6Fs6g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: pCotW+gUPltV


On 1/27/20 6:56 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Hey Wainer,
>
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
>>>>>> =C2=A0=C2=A0 tests/acceptance/machine_arm_canon-a1100.py | 33=20
>>>>>> +++++++++++++++++++++
>>
>>
>> What is the reason for not adding this case in boot_linux_console suite?
>
> Because there are too many tests in this file and it became hardly=20
> maintainable. Also it is easier to add a 'F:' entry in the MAINTAINERS=20
> file to each machine section.
>
>>>>>> =C2=A0=C2=A0 1 file changed, 33 insertions(+)
>>>>>> =C2=A0=C2=A0 create mode 100644 tests/acceptance/machine_arm_canon-a=
1100.py
>>>>>>
>>>>>> diff --git a/tests/acceptance/machine_arm_canon-a1100.py
>>>>>> b/tests/acceptance/machine_arm_canon-a1100.py
>>>>>> new file mode 100644
>>>>>> index 0000000000..3888168451
>>>>>> --- /dev/null
>>>>>> +++ b/tests/acceptance/machine_arm_canon-a1100.py
>>>>>> @@ -0,0 +1,33 @@
>>>>>> +# Functional test that boots the canon-a1100 machine with firmware
>>>>>> +#
>>>>>> +# Copyright (c) 2020 Red Hat, Inc.
>>>>>> +#
>>>>>> +# Author:
>>>>>> +#=C2=A0 Thomas Huth <thuth@redhat.com>
>>>>>> +#
>>>>>> +# This work is licensed under the terms of the GNU GPL, version=20
>>>>>> 2 or
>>>>>> +# later.=C2=A0 See the COPYING file in the top-level directory.
>>>>>> +
>>>>>> +from avocado_qemu import Test
>>>>>> +from avocado_qemu import wait_for_console_pattern
>>>>>> +from avocado.utils import archive
>>>>>> +
>>>>>> +class CanonA1100Machine(Test):
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 timeout =3D 90
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 def test_arm_canona1100(self):
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :avocado: tags=3Darch:ar=
m
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :avocado: tags=3Dmachine=
:canon-a1100
>>>>>
>>>>> To the maintainer taking this, please add:
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :a=
vocado: tags=3Dpflash_cfi02
>>>>
>>>> Should there be a "device:" between the "=3D" and the device name? At
>>>> least I can see some other files using "device:" for similar tags...
>>>
>>> Ah yes you are right, it is clearer.
>>
>>
>> Notice that avocado_qemu won't automatically convert that tag into=20
>> QEMU's -device option, If that is the intention...
>
> That could be useful, but currently my usage is 'avocado run -t=20
> device:pcnet32' to run all tests using the pcnet32 network device.
>
> I have pflash tests which I plan to use the same way.
>
> This is a hint to other maintainers, who don't have to look at each=20
> test to find the set of tests that suits them.
>
> IOW "As a maintainer of the device:pflash I'm interested to run all=20
> tests using this device, and while they pass I won't look at them".
>
> (This is how I expect maintainers to use the acceptance tests when I=20
> add some).


OK, understood. Thanks for sharing your usage of acceptance tests!

- Wainer

