Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4028318lfp;
        Mon, 27 Jan 2020 09:45:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqxkoEj3jA0gITbqhG5AfHGsL9Fv5eH7+yuYpvKn09Z60mWfA3ipZefyZvuVtXRGNNPhZG6f
X-Received: by 2002:a81:a38e:: with SMTP id a136mr7661314ywh.503.1580147132626;
        Mon, 27 Jan 2020 09:45:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580147132; cv=none;
        d=google.com; s=arc-20160816;
        b=u24KQs5Zoa8qEfmxRz3Th3HRmZPoCPP/5C3P6LLWcX8lc7yWpYa/m1z1GAEiAFL45M
         d2dbmpFcFPAv/yFyafWeWmJwOmTGv9QcdeLS6EcbT4AFij1lDfJoJWTIVAuUghkcxal8
         pPdINADdwvIikAbqGNnEqoQD6MFK/jPgyaGO+sidmyhQZR7JnnRUCDGRyuxYApFxXV9/
         3BXCDeU0J+mLqAlrzENUf5GhtwPXctmBK8aYjErowyJ8M3L1oNi7fGub9g51n6kidbGX
         VQF8GxzDX2rVj8JNX3FtMF9/BZHuMP3nkeb5ar8+OPbYx+SRBS6fcimA1YqygRuv0+wn
         w3KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=VSGfOssOTucN2+HAUd/XYOyoe5e6O3EVKoc7YRzPJeA=;
        b=NbWn2rQlq2yxRm9k3QZhE3HLTT9F/xBRYBsE7efObKgxMGfulqefnTzNu6rx3RBuDr
         czo2tMFObJZxoJUff0YbhdB2Ww5jda3Zuw5W9gqJrLRqHPLDGy+20tMsLR6yXOFGeL7D
         TDGyG/vXX/h0QMeBYktePekvmyCTNCinjeJ+vHAx7u2D13cljl7hZdC+2IkA0JM+XHzN
         d5ts5yoPVuWX+fpUWoukBz1WuKnBh6EbVxO45M3izOJevg1GxQhUqAuIGW3TIALke2Q7
         ReHmJNr18W8S4chsm3DCwp3PMO9WiRDODhFnpb7H/VDBIeiK2Xk2ux0wxE68zRpJ2Awz
         Yi+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BEDnWK4h;
       spf=pass (google.com: domain of wainersm@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=wainersm@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <wainersm@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id 73si8117023ywo.395.2020.01.27.09.45.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 09:45:32 -0800 (PST)
Received-SPF: pass (google.com: domain of wainersm@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BEDnWK4h;
       spf=pass (google.com: domain of wainersm@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=wainersm@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580147132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VSGfOssOTucN2+HAUd/XYOyoe5e6O3EVKoc7YRzPJeA=;
	b=BEDnWK4hPU7uW9LnmM+ed4RCVP66mZlWYuivdzFAuQOe01N8VnfNLXxKJCMgbx1WVnkDVw
	9eGlwI29gZ+056iZapoi/6CNyZ8nVb/TVs6B3/2/TcrIWMMl5kEIG0PD4/V+zrFp+sa8nY
	mAr7wJQyzt2X+tTLVtqJt7vpXpti4tc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-hPNdAvmyMNmLB8LOn5kxtQ-1; Mon, 27 Jan 2020 12:45:28 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A841813E8;
	Mon, 27 Jan 2020 17:45:27 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-27.gru2.redhat.com [10.97.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 09F42863CF;
	Mon, 27 Jan 2020 17:45:21 +0000 (UTC)
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
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <2a303987-ad19-538b-98ce-a2cb83d8fade@redhat.com>
Date: Mon, 27 Jan 2020 15:45:20 -0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <05f7e133-8ad3-8627-79a1-a046e6d42d16@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: hPNdAvmyMNmLB8LOn5kxtQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: Wk94tPTePxMg


On 1/27/20 1:41 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> On 1/27/20 4:39 PM, Thomas Huth wrote:
>> On 27/01/2020 16.18, Philippe Mathieu-Daud=C3=A9 wrote:
>>> On 1/27/20 3:41 PM, Thomas Huth wrote:
>>>> The canon-a1100 machine can be used with the Barebox firmware. The
>>>> QEMU Advent Calendar 2018 features a pre-compiled image which we
>>>> can use for testing.
>>>>
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>> =C2=A0=C2=A0 tests/acceptance/machine_arm_canon-a1100.py | 33=20
>>>> +++++++++++++++++++++


What is the reason for not adding this case in boot_linux_console suite?


>>>> =C2=A0=C2=A0 1 file changed, 33 insertions(+)
>>>> =C2=A0=C2=A0 create mode 100644 tests/acceptance/machine_arm_canon-a11=
00.py
>>>>
>>>> diff --git a/tests/acceptance/machine_arm_canon-a1100.py
>>>> b/tests/acceptance/machine_arm_canon-a1100.py
>>>> new file mode 100644
>>>> index 0000000000..3888168451
>>>> --- /dev/null
>>>> +++ b/tests/acceptance/machine_arm_canon-a1100.py
>>>> @@ -0,0 +1,33 @@
>>>> +# Functional test that boots the canon-a1100 machine with firmware
>>>> +#
>>>> +# Copyright (c) 2020 Red Hat, Inc.
>>>> +#
>>>> +# Author:
>>>> +#=C2=A0 Thomas Huth <thuth@redhat.com>
>>>> +#
>>>> +# This work is licensed under the terms of the GNU GPL, version 2 or
>>>> +# later.=C2=A0 See the COPYING file in the top-level directory.
>>>> +
>>>> +from avocado_qemu import Test
>>>> +from avocado_qemu import wait_for_console_pattern
>>>> +from avocado.utils import archive
>>>> +
>>>> +class CanonA1100Machine(Test):
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 timeout =3D 90
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 def test_arm_canona1100(self):
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :avocado: tags=3Darch:arm
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :avocado: tags=3Dmachine:c=
anon-a1100
>>>
>>> To the maintainer taking this, please add:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :avo=
cado: tags=3Dpflash_cfi02
>>
>> Should there be a "device:" between the "=3D" and the device name? At
>> least I can see some other files using "device:" for similar tags...
>
> Ah yes you are right, it is clearer.


Notice that avocado_qemu won't automatically convert that tag into=20
QEMU's -device option, If that is the intention...

Thanks!

- Wainer


>
>
