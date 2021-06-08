Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id a3sm22231206wra.4.2021.06.08.08.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 08:36:02 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id EE3C81FF7E;
	Tue,  8 Jun 2021 16:36:01 +0100 (BST)
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-97-alex.bennee@linaro.org>
 <fdb8ac5d-e6c6-0e13-e8df-f1e3e022c98d@linaro.org>
 <87im2ol8xu.fsf@linaro.org>
 <3cef0694-0c9c-e0d8-2c30-86dc6978db4d@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, "open list:IDE"
 <qemu-block@nongnu.org>, qemu-arm@nongnu.org, Paolo Bonzini
 <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v16 96/99] tests/qtest: split the cdrom-test into
 arm/aarch64
Date: Tue, 08 Jun 2021 16:35:24 +0100
In-reply-to: <3cef0694-0c9c-e0d8-2c30-86dc6978db4d@redhat.com>
Message-ID: <87czswl672.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: H5Uyrl5euF9F


Thomas Huth <thuth@redhat.com> writes:

> On 08/06/2021 16.27, Alex Benn=C3=A9e wrote:
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>=20
>>> On 6/4/21 8:53 AM, Alex Benn=C3=A9e wrote:
>>>> The assumption that the qemu-system-aarch64 image can run all 32 bit
>>>> machines is about to be broken...
>>>
>>> Um, what?
>> Really what we want is to probe the -M (machines) that a binary
>> supports rather than just barfing the test because we've built a QEMU
>> that doesn't support all the random 32 bit machines.
>>=20
>>> r~
>>>
>>>
>>>
>>>   and besides it's not likely this is
>>>> improving out coverage by much. Test the "virt" machine for both arm
>>>> and aarch64 as it can be used by either architecture.
>> I think this point still stands though, I don't think we get much
>> from
>> running the cdrom test with realview et all on qemu-system-aarch64.
>
> In a lot of CI pipelines, we are either building aarch64 or arm, but
> not both, so I think it might be good to keep the tests in here.

We do test instantiating the cdrom with -M virt, exactly how many extra
lines of coverage do we get for the rest?

>
>  Thomas


--=20
Alex Benn=C3=A9e
