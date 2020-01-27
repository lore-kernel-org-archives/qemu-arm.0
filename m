Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3896284lfp;
        Mon, 27 Jan 2020 07:41:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqywbCzoA3xt+XLqc16BpAAbcsmHPoTDKJl2S9mlojPIfn5u6hvjQEHMvy8CoiJ2at+yyRUa
X-Received: by 2002:a17:906:cb94:: with SMTP id mf20mr14136769ejb.252.1580139705840;
        Mon, 27 Jan 2020 07:41:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580139705; cv=none;
        d=google.com; s=arc-20160816;
        b=VLyCGRdV675lB82Wv1fer+B04mi5ra/jH0gc6DchCMwgoHMiUM/oDEdVJkoy1rMa2M
         MJsH8crMVNkoR8RXkEqokmfbb+Gj1d9FOjqIaFGSWImlzx7kFD51FMcTfQzOvWbdErzR
         ugYrOi4GjyT5gcUuBhANBzXJewGe1VrbDDqxxJ6bue4l81t4uxZ9qgVW60QHJZoobkGg
         bHPAxrsgd00yXxDgrf5UXwAVT66xt5tbMEppI85gpfEpZXTJRFOZ0PugS6haGJg83gu1
         E5ZOsS3WfSw2DPtDxrp/7iT9awS2PdHfU1RRbF9CcrtKXHhpMPUqyqzHxBtz1DGXQFlr
         ymqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=DVzUni7ewIwP6z9v8ncO3zA63kArbnByKNOo8Y5gsR0=;
        b=CMoFgn8wkPAMZcGTeor8v6u3HStz87BuRiiKO8XRPnpIU1um0IuH87dGPQH1LNyIm8
         0xpk8JhBqK8sW22W9GBGf1sTjRr+9xDHMBWHwF8ohjcIG6Y0y84qUkVHpZWhm8bSlP0n
         +NxYSN1rp0jv+UBrvCsyp+2kDrhNLYjU3yh1Y3Pe4wtGhcZPrc12PpaZJz4Ir6dL+9h/
         PGnFLW55DkRfJoBGjYF/G8AX9CQAf6JUUj74Axg+H9ivGMtjKHj1+Zm1ASJOaxAG4Xp8
         02yoDocKVaFzTTCH8tDlddYXQslfmH4rjGtAdIVz9dgddGxK9jld+46HE7/bMA46JT1b
         J9Ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OEJGDXS8;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id cx15si4557846edb.566.2020.01.27.07.41.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 07:41:45 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OEJGDXS8;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580139704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DVzUni7ewIwP6z9v8ncO3zA63kArbnByKNOo8Y5gsR0=;
	b=OEJGDXS8PM+cJ6HBEfHhoHjRN/dkyxcYqddsIsc4lZspbKSjsyJi0O/9ej8+xNvF9B5bIw
	IzN7s4PFrEJrF/bJsMbjTeCW5S/OCG8IgV3gRmNJwElJ1OAcng0ZIZ52Dhy2q1xStQcho3
	wwpxil53NIJbMn2ebcxSvOkA8hqn/DI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-JsvoNANeNuiCKD0NzjrEdw-1; Mon, 27 Jan 2020 10:41:43 -0500
Received: by mail-wr1-f71.google.com with SMTP id z14so6295943wrs.4
        for <alex.bennee@linaro.org>; Mon, 27 Jan 2020 07:41:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zoUCgX8RIaPawpw4BUvJkUrNzheaDIFrA6A+bw72NYQ=;
        b=B22zJgMLyefqzWkdTB+lOrCjghtqd2wn6qlPDCDG8iylwOlTUAGZ8cY65yCJx8tNfA
         xzSvUdM0FnzVAOT8RWzNTuihZKuu25oTf3ej5eCKHT8jXtNM9itOyC+HHv6rRMMifpl1
         Ykn3H0uN/HuHQD/IGCNsReQs7BL7Zv9BWDEK2vdHFmzU2WbWsA2MCeSDawFbFK+GDyxI
         CbDz5hd6uxWOIXC/ethHJ1Vlt/tlFLkJwYu8+Bf1z+xnt2DZWcoZ4vzJy9g5P0YXk6AU
         S0zVQuupWLm0bn5Q50j3htFnMTjunstqh0mnS1a8UCTyMEjFOkucf60YTCgcj8KcNM2Q
         Yf7A==
X-Gm-Message-State: APjAAAV09wO1Yqs57PKWr1PYka3lGoiEHVF1qpl8LmuyLsq80vAZZZv0
	AgjNMw3A7JO1bPX9jeLsWqWVEBfwEIHbutO5LInXHoYICZwAxrksrTrDPOzEAFuYPA9jMgwLZE5
	jqkyr2B1bNpFNRoDU
X-Received: by 2002:a1c:1f51:: with SMTP id f78mr14331084wmf.60.1580139701581;
        Mon, 27 Jan 2020 07:41:41 -0800 (PST)
X-Received: by 2002:a1c:1f51:: with SMTP id f78mr14331058wmf.60.1580139701322;
        Mon, 27 Jan 2020 07:41:41 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.113])
        by smtp.gmail.com with ESMTPSA id d12sm21092269wrp.62.2020.01.27.07.41.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2020 07:41:40 -0800 (PST)
Subject: Re: [PATCH] tests/acceptance: Add a test for the canon-a1100 machine
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20200127144126.15515-1-thuth@redhat.com>
 <cd60a444-620e-3366-09e8-e9c8d72894ad@redhat.com>
 <c4976fd4-f1f0-c48b-aad4-4414564f8258@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <05f7e133-8ad3-8627-79a1-a046e6d42d16@redhat.com>
Date: Mon, 27 Jan 2020 16:41:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <c4976fd4-f1f0-c48b-aad4-4414564f8258@redhat.com>
Content-Language: en-US
X-MC-Unique: JsvoNANeNuiCKD0NzjrEdw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: YAf+8Qfg02CG

On 1/27/20 4:39 PM, Thomas Huth wrote:
> On 27/01/2020 16.18, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 1/27/20 3:41 PM, Thomas Huth wrote:
>>> The canon-a1100 machine can be used with the Barebox firmware. The
>>> QEMU Advent Calendar 2018 features a pre-compiled image which we
>>> can use for testing.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>  =C2=A0 tests/acceptance/machine_arm_canon-a1100.py | 33 ++++++++++++++=
+++++++
>>>  =C2=A0 1 file changed, 33 insertions(+)
>>>  =C2=A0 create mode 100644 tests/acceptance/machine_arm_canon-a1100.py
>>>
>>> diff --git a/tests/acceptance/machine_arm_canon-a1100.py
>>> b/tests/acceptance/machine_arm_canon-a1100.py
>>> new file mode 100644
>>> index 0000000000..3888168451
>>> --- /dev/null
>>> +++ b/tests/acceptance/machine_arm_canon-a1100.py
>>> @@ -0,0 +1,33 @@
>>> +# Functional test that boots the canon-a1100 machine with firmware
>>> +#
>>> +# Copyright (c) 2020 Red Hat, Inc.
>>> +#
>>> +# Author:
>>> +#=C2=A0 Thomas Huth <thuth@redhat.com>
>>> +#
>>> +# This work is licensed under the terms of the GNU GPL, version 2 or
>>> +# later.=C2=A0 See the COPYING file in the top-level directory.
>>> +
>>> +from avocado_qemu import Test
>>> +from avocado_qemu import wait_for_console_pattern
>>> +from avocado.utils import archive
>>> +
>>> +class CanonA1100Machine(Test):
>>> +
>>> +=C2=A0=C2=A0=C2=A0 timeout =3D 90
>>> +
>>> +=C2=A0=C2=A0=C2=A0 def test_arm_canona1100(self):
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :avocado: tags=3Darch:arm
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :avocado: tags=3Dmachine:ca=
non-a1100
>>
>> To the maintainer taking this, please add:
>>
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :avocado: =
tags=3Dpflash_cfi02
>=20
> Should there be a "device:" between the "=3D" and the device name? At
> least I can see some other files using "device:" for similar tags...

Ah yes you are right, it is clearer.
