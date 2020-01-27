Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3894140lfp;
        Mon, 27 Jan 2020 07:39:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqxpRtL9qN7uVqe/Eg+JfpKNh6pjyauxC6V8UxLvy9BpNFj+8lvkK7KJoPFsif/5HcechGAT
X-Received: by 2002:a25:2f51:: with SMTP id v78mr12414188ybv.379.1580139567065;
        Mon, 27 Jan 2020 07:39:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580139567; cv=none;
        d=google.com; s=arc-20160816;
        b=QFuhfKXX+qUZLSvgiZPQFu6lrQfTHppPv6BDZF/nqTQfZ3EHBgQc7ncmGmaGWB4CeD
         /BT8qOH7N7kbaRY1AaMciT39EfWGQry0YVIkMTIzCFkeENu83lVXt6bdQEOJE0GdFNbe
         oO7WZrovL4zwPEvdDL8bM+CQ6VYgQdodYfjcNKw25HL78iyo3C1v0h44FUe81BJ/zjoo
         MM3pKTRj2GfV9UzLsUQYLwPqlAUIpzsmvPRjSBZAKjuVOFoixAiLnrV5uSi0WpQZ05J8
         WPFa767N33DX7kLtSfWOV+biVyDr5K7KzWf46a/NQS73K5ti6Pr0Jeq2jqBpwBmiqlrA
         c5yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=jQs9KlunjJne6iaccbTLtY9Fo/2axkW4mD4egK/4l9M=;
        b=DJI+f2cg1PTLOSry5kuGDqXoXtcXV0YL0/dqWXdDsIVCih5txXrdxenyaZr+5Cf6mX
         fTh6b6S8oXSgCFtz4Pznlfc8ulY4STssxsFMQj/vV7ERcN5THfU/DktJcBwJugLjbSyD
         yAyUEV0JHXMGtshlENG9C9l8udHujHmQo/TxkIDqsDaFZ9/hOUhb4DeGFi4H7Frurrc0
         Tj+DoPjtidOCW37D0a/4CSjkiJn31gYoPPG+Nu89wkHhlK/+/K1XnOJkHMnsC641ShxU
         czGC6gFrgPCONbJnN/1FpwhnvxnJDhGF0c/4WwkgoW0YdW+0TDWIvFSykfKdph8TA9L6
         M3Qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Uzao6MBH;
       spf=pass (google.com: domain of thuth@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id i17si8562653yba.234.2020.01.27.07.39.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 07:39:27 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Uzao6MBH;
       spf=pass (google.com: domain of thuth@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580139566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
	bh=jQs9KlunjJne6iaccbTLtY9Fo/2axkW4mD4egK/4l9M=;
	b=Uzao6MBH20urs6dCzirRVbiTLForEO7LYZnU3nCsZETvwbHTyUAALD9liw+RsNKtGc7Bt+
	uroFqHpHJoWA3M6wQx3pPJTSkHNkvUtPXhaqqtcRT/7LLOjRz1VNgCvIX1vRFfOqaoKI1z
	YmQxnPfcEO+HPAVlk/Z/3FL1vfws+is=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-s3wsw1wkNMq7TwfYUIVE7Q-1; Mon, 27 Jan 2020 10:39:22 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 624528B7883;
	Mon, 27 Jan 2020 15:39:20 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-117-94.ams2.redhat.com [10.36.117.94])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA71460BF4;
	Mon, 27 Jan 2020 15:39:11 +0000 (UTC)
Subject: Re: [PATCH] tests/acceptance: Add a test for the canon-a1100 machine
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20200127144126.15515-1-thuth@redhat.com>
 <cd60a444-620e-3366-09e8-e9c8d72894ad@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <c4976fd4-f1f0-c48b-aad4-4414564f8258@redhat.com>
Date: Mon, 27 Jan 2020 16:39:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <cd60a444-620e-3366-09e8-e9c8d72894ad@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: s3wsw1wkNMq7TwfYUIVE7Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: R5vrMP4Q6HYS

On 27/01/2020 16.18, Philippe Mathieu-Daud=C3=A9 wrote:
> On 1/27/20 3:41 PM, Thomas Huth wrote:
>> The canon-a1100 machine can be used with the Barebox firmware. The
>> QEMU Advent Calendar 2018 features a pre-compiled image which we
>> can use for testing.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>> =C2=A0 tests/acceptance/machine_arm_canon-a1100.py | 33 ++++++++++++++++=
+++++
>> =C2=A0 1 file changed, 33 insertions(+)
>> =C2=A0 create mode 100644 tests/acceptance/machine_arm_canon-a1100.py
>>
>> diff --git a/tests/acceptance/machine_arm_canon-a1100.py
>> b/tests/acceptance/machine_arm_canon-a1100.py
>> new file mode 100644
>> index 0000000000..3888168451
>> --- /dev/null
>> +++ b/tests/acceptance/machine_arm_canon-a1100.py
>> @@ -0,0 +1,33 @@
>> +# Functional test that boots the canon-a1100 machine with firmware
>> +#
>> +# Copyright (c) 2020 Red Hat, Inc.
>> +#
>> +# Author:
>> +#=C2=A0 Thomas Huth <thuth@redhat.com>
>> +#
>> +# This work is licensed under the terms of the GNU GPL, version 2 or
>> +# later.=C2=A0 See the COPYING file in the top-level directory.
>> +
>> +from avocado_qemu import Test
>> +from avocado_qemu import wait_for_console_pattern
>> +from avocado.utils import archive
>> +
>> +class CanonA1100Machine(Test):
>> +
>> +=C2=A0=C2=A0=C2=A0 timeout =3D 90
>> +
>> +=C2=A0=C2=A0=C2=A0 def test_arm_canona1100(self):
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :avocado: tags=3Darch:arm
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :avocado: tags=3Dmachine:can=
on-a1100
>=20
> To the maintainer taking this, please add:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :avocado: ta=
gs=3Dpflash_cfi02

Should there be a "device:" between the "=3D" and the device name? At
least I can see some other files using "device:" for similar tags...

 Thomas
