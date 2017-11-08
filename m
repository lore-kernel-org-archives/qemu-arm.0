Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 2sm1580563wrq.83.2017.11.08.03.02.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Nov 2017 03:02:50 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 90CF23E009E;
	Wed,  8 Nov 2017 11:02:50 +0000 (GMT)
References: <20171107150558.22131-1-alex.bennee@linaro.org> <20171107150558.22131-7-alex.bennee@linaro.org> <20171108103416.GA8971@e103592.cambridge.arm.com>
User-agent: mu4e 1.0-alpha0; emacs 26.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Dave Martin <Dave.Martin@arm.com>
Cc: "peter.maydell\@linaro.org" <peter.maydell@linaro.org>, "qemu-devel\@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm\@nongnu.org" <qemu-arm@nongnu.org>
Subject: Re: [RISU PATCH 06/10] configure: support CPPFLAGS
In-reply-to: <20171108103416.GA8971@e103592.cambridge.arm.com>
Date: Wed, 08 Nov 2017 11:02:50 +0000
Message-ID: <87lgjhqbhh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: WViwKGATLTOx


Dave Martin <Dave.Martin@arm.com> writes:

> On Tue, Nov 07, 2017 at 03:05:54PM +0000, Alex Benn=C3=A9e wrote:
>> Useful for accessing API's that are still brewing, e.g:
>>
>>   CROSS_PREFIX=3Daarch64-linux-gnu- \
>>     CPPFLAGS=3D-I/home/alex/lsrc/qemu/risu.git/sve-headers/include \
>>     ../configure
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  README    | 6 ++++++
>>  configure | 1 +
>>  2 files changed, 7 insertions(+)
>>
>> diff --git a/README b/README
>> index 9946e6e..fbe408d 100644
>> --- a/README
>> +++ b/README
>> @@ -26,6 +26,12 @@ Most useful is
>>     need this if you're not building on the target system
>>     (Example: CROSS_PREFIX=3Darm-linux-gnueabihf- )
>>
>> +Another useful flag is
>> + CPPFLAGS=3D which specified pre-processor flags, usually -I statements
>> +   for specifying extra include paths. Use this is you need something
>
> s/is/if/
>
>> +   from new kernel headers not installed on your system.
>> +   (Example: CPPFLAGS=3D-I/path/to/sve-kernel-headers/include)
>> +
>
> You should probably point out that the path should refer to headers
> installed by running 'make headers_install' in the Linux source.  This
> means we really test the uapi headers properly, and I don't get spurious
> bug reports about bad headers ;)

Will do. Thanks.
>
> [...]
>
> Cheers
> ---Dave


--
Alex Benn=C3=A9e
