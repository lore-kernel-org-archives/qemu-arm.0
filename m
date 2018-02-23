Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id a14sm3563312wra.27.2018.02.23.08.45.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Feb 2018 08:45:59 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 1EF413E0260;
	Fri, 23 Feb 2018 16:45:59 +0000 (GMT)
References: <20180223154613.2096-1-alex.bennee@linaro.org> <20180223154613.2096-5-alex.bennee@linaro.org> <20180223161723.GF31076@redhat.com>
User-agent: mu4e 1.1.0; emacs 26.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, richard.henderson@linaro.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-devel] [PATCH v1 4/8] new contrib/generate_all.sh: batch risugen script
In-reply-to: <20180223161723.GF31076@redhat.com>
Date: Fri, 23 Feb 2018 16:45:58 +0000
Message-ID: <878tbjac3d.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: WY6deBJ+eCt3


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Fri, Feb 23, 2018 at 03:46:09PM +0000, Alex Benn=C3=A9e wrote:
>> This is a simple script for generating all instructions in a given
>> RISU file. You can split up the batch size by passing a -n N command
>> line options. For example:
>>
>>   ./contrib/generate_all.sh -n 2 hp.risu testcases.armv8.2_hp
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  contrib/generate_all.sh | 96 ++++++++++++++++++++++++++++++++++++++++++=
+++++++
>>  1 file changed, 96 insertions(+)
>>  create mode 100755 contrib/generate_all.sh
>>
>> diff --git a/contrib/generate_all.sh b/contrib/generate_all.sh
>> new file mode 100755
>> index 0000000..1e6b847
>> --- /dev/null
>> +++ b/contrib/generate_all.sh
>> @@ -0,0 +1,96 @@
>> +#!/bin/bash
>> +#
>> +# Generate all patterns in a given RISU file
>> +#
>> +# Copyright (c) 2017 Linaro Limited
>> +# All rights reserved. This program and the accompanying materials
>> +# are made available under the terms of the Eclipse Public License v1.0
>> +# which accompanies this distribution, and is available at
>> +# http://www.eclipse.org/legal/epl-v10.html
>
> Really ? Why this license not our standard GPLv2+, or BSD if it is wanted
> to be a public-domain-ish license ?

I just chose what RISU is licensed under - but there is no reason I
couldn't make it something else.

>
> Regards,
> Daniel


--
Alex Benn=C3=A9e
