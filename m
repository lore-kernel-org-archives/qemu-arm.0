Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4207379lfp;
        Mon, 27 Jan 2020 12:57:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqxRWkejowOnNlfXDLqLayOoRkYUSpFvDoxUj154FBZO/NFiQqCJuLtHkZkYhZjZkrD5uMoV
X-Received: by 2002:a17:906:1c5b:: with SMTP id l27mr397421ejg.143.1580158625688;
        Mon, 27 Jan 2020 12:57:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580158625; cv=none;
        d=google.com; s=arc-20160816;
        b=yOLD78jHgKGFX6vnSizHhsgObqtVPS8KXygwwbfP10C9LS/sob+/7VFF8gA9vRXlpT
         5SjHKoksggxRd4+D0ul/xWwjxYhiXaUdHStusKth7j1jwPwm/A0KXvnPGbXRAFnW85+G
         d7pSGGTyNTRhCKFc6KhFNeM0Mtkp8aV9B0AMu4jJSA91ct4YE58YGf4uRan7qMMvIwLL
         N3IrFaJ+kiGvi4ZP6HDP6Hh58JpqZD2paYzurOtusaunBagJy/HBEaUb53tZb07/7dKu
         vjskM2LdcoF2cZDR3OJpQvAak7ZIiF43IrDvX8+HdkoD4eZZjKroOXonxq/7+r34sTpZ
         93Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=8DzTevrK882ZAAansiIv9LXYymsZC7ykzvhnI8lEgFQ=;
        b=pYruqJzDP5Hda4loatqhP2h3mxqGSV3ex+8XyUUFZUzS3YX6F+BwcIu9IuAREKJuCc
         s1vXkj8Pnme1BNwKcCEKXTbPzK9T9UlAL6TGEbwBk5GOTc2kfBrakrtvZA0iVx+bv66v
         BZaNr3h3PlPHIqFaMmivAEmXKnsXJPU7J7niNR/6N5OJu0YYkllSKjadax/5iex7JLHp
         p3d9QqXfSuwfmstSR4h7IpyDU+jHPiFsmPGgmaYifZl8AcIBjKHivq8bzbHLcwA/z5b7
         gWhD1fDPFyS2jMoQjLYQacjNxrBheDxWwo+tgBzNzk9tfAxDwXBDlScP6JTgrDJBafBI
         9fiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Cao2BRsu;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id o19si8731074edv.396.2020.01.27.12.57.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 12:57:05 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Cao2BRsu;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580158624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8DzTevrK882ZAAansiIv9LXYymsZC7ykzvhnI8lEgFQ=;
	b=Cao2BRsu9CqdAF06LeyRt+bb74I/cYNyH5KRv1WWepB0k4MEK66n1nre3gkUbsdPVVu/U3
	JE2j/jp3qiNgQlbh7bGzD4aA1vb6uHQjdHN7AqGE7wC0IaPWOlPrABq0Fn/F0ND7i9T+Mr
	2xi71qTOVXpeJBOOxgh7Y1ZFf1AI4r4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-B5gclQV4NTitX6N2oFhNfg-1; Mon, 27 Jan 2020 15:57:02 -0500
Received: by mail-wm1-f69.google.com with SMTP id t16so8268wmt.4
        for <alex.bennee@linaro.org>; Mon, 27 Jan 2020 12:57:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aaNVEPVlebJIt8gBQDTRyy49xw8jN7LxnJaQ8qBYIkw=;
        b=rtAnMwXC81v5iM7XarHkFzKyxJotxAV3UD8yD29Gi8ASWHzTVP/qeoHfQhqcEE0+na
         WY9IKvCcowIh6AacBeGGPOvLeotY+X07kkAWh5dEWKjab5mCAHuBf0kK/4NSx4YPVozX
         vmmNe1yUq6sNFLyBMNTUTSvMYmh97vaEpe8bjqpJCLEBEUS6fZKpYwMHfWZ1et8uoU58
         jxfiiU1w71qaNuMLsGU+tt5BnHZHEzTnWbvpRNrGTEqaH8d6B9eODI+QZmeHTrCTtVEr
         03dbRcablOVuq+/E+lUw2qQuxfCZVY8S/4dscDFFXdaDqnZ7+2QDPpSiBLSbFSh7cata
         QqUw==
X-Gm-Message-State: APjAAAW/uPkqeEcwWGg5Rvq7wxlacCH18V7RNVDHfTRhP8gnKxHXKq1X
	8q+SCG/WvC6zbItls3dMKmKKfFpt5sqQCVrp2gK2zXP9ToDmqYMHxJQ03y4MuJQwJ+Xqu1tw05m
	g4FI2+MtgLQ3Lnkst
X-Received: by 2002:a7b:c94a:: with SMTP id i10mr547827wml.88.1580158620895;
        Mon, 27 Jan 2020 12:57:00 -0800 (PST)
X-Received: by 2002:a7b:c94a:: with SMTP id i10mr547810wml.88.1580158620607;
        Mon, 27 Jan 2020 12:57:00 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.113])
        by smtp.gmail.com with ESMTPSA id a5sm15589wmb.37.2020.01.27.12.56.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2020 12:57:00 -0800 (PST)
Subject: Re: [PATCH] tests/acceptance: Add a test for the canon-a1100 machine
To: Wainer dos Santos Moschetta <wainersm@redhat.com>,
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9856cc15-2365-4609-5af9-f6582cb20ed8@redhat.com>
Date: Mon, 27 Jan 2020 21:56:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <2a303987-ad19-538b-98ce-a2cb83d8fade@redhat.com>
Content-Language: en-US
X-MC-Unique: B5gclQV4NTitX6N2oFhNfg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: 60ud/VqFIUJN

Hey Wainer,

On 1/27/20 6:45 PM, Wainer dos Santos Moschetta wrote:
> On 1/27/20 1:41 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 1/27/20 4:39 PM, Thomas Huth wrote:
>>> On 27/01/2020 16.18, Philippe Mathieu-Daud=C3=A9 wrote:
>>>> On 1/27/20 3:41 PM, Thomas Huth wrote:
>>>>> The canon-a1100 machine can be used with the Barebox firmware. The
>>>>> QEMU Advent Calendar 2018 features a pre-compiled image which we
>>>>> can use for testing.
>>>>>
>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>>> ---
>>>>> =C2=A0=C2=A0 tests/acceptance/machine_arm_canon-a1100.py | 33=20
>>>>> +++++++++++++++++++++
>=20
>=20
> What is the reason for not adding this case in boot_linux_console suite?

Because there are too many tests in this file and it became hardly=20
maintainable. Also it is easier to add a 'F:' entry in the MAINTAINERS=20
file to each machine section.

>>>>> =C2=A0=C2=A0 1 file changed, 33 insertions(+)
>>>>> =C2=A0=C2=A0 create mode 100644 tests/acceptance/machine_arm_canon-a1=
100.py
>>>>>
>>>>> diff --git a/tests/acceptance/machine_arm_canon-a1100.py
>>>>> b/tests/acceptance/machine_arm_canon-a1100.py
>>>>> new file mode 100644
>>>>> index 0000000000..3888168451
>>>>> --- /dev/null
>>>>> +++ b/tests/acceptance/machine_arm_canon-a1100.py
>>>>> @@ -0,0 +1,33 @@
>>>>> +# Functional test that boots the canon-a1100 machine with firmware
>>>>> +#
>>>>> +# Copyright (c) 2020 Red Hat, Inc.
>>>>> +#
>>>>> +# Author:
>>>>> +#=C2=A0 Thomas Huth <thuth@redhat.com>
>>>>> +#
>>>>> +# This work is licensed under the terms of the GNU GPL, version 2 or
>>>>> +# later.=C2=A0 See the COPYING file in the top-level directory.
>>>>> +
>>>>> +from avocado_qemu import Test
>>>>> +from avocado_qemu import wait_for_console_pattern
>>>>> +from avocado.utils import archive
>>>>> +
>>>>> +class CanonA1100Machine(Test):
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 timeout =3D 90
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 def test_arm_canona1100(self):
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :avocado: tags=3Darch:arm
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :avocado: tags=3Dmachine:=
canon-a1100
>>>>
>>>> To the maintainer taking this, please add:
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :av=
ocado: tags=3Dpflash_cfi02
>>>
>>> Should there be a "device:" between the "=3D" and the device name? At
>>> least I can see some other files using "device:" for similar tags...
>>
>> Ah yes you are right, it is clearer.
>=20
>=20
> Notice that avocado_qemu won't automatically convert that tag into=20
> QEMU's -device option, If that is the intention...

That could be useful, but currently my usage is 'avocado run -t=20
device:pcnet32' to run all tests using the pcnet32 network device.

I have pflash tests which I plan to use the same way.

This is a hint to other maintainers, who don't have to look at each test=20
to find the set of tests that suits them.

IOW "As a maintainer of the device:pflash I'm interested to run all=20
tests using this device, and while they pass I won't look at them".

(This is how I expect maintainers to use the acceptance tests when I add=20
some).
