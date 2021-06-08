Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id w23sm3530006wmi.0.2021.06.08.07.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 07:42:31 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 64CEF1FF7E;
	Tue,  8 Jun 2021 15:42:31 +0100 (BST)
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-97-alex.bennee@linaro.org>
 <83b32ad3-18a6-c9d4-6561-c3c880234e09@redhat.com>
 <8f6c0b14-16da-4699-a279-fcbacd1e862d@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, "open list:IDE" <qemu-block@nongnu.org>
Subject: Re: [PATCH v16 96/99] tests/qtest: split the cdrom-test into
 arm/aarch64
Date: Tue, 08 Jun 2021 15:41:23 +0100
In-reply-to: <8f6c0b14-16da-4699-a279-fcbacd1e862d@redhat.com>
Message-ID: <87fsxsl8o8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: yjretG58H/L/


Thomas Huth <thuth@redhat.com> writes:

> On 08/06/2021 15.42, John Snow wrote:
>> On 6/4/21 11:53 AM, Alex Benn=C3=A9e wrote:
>>> The assumption that the qemu-system-aarch64 image can run all 32 bit
>>> machines is about to be broken and besides it's not likely this is
>> What's changing? I'm not deeply familiar with aarch64. Why is this
>> assumption about to be broken?
>
> That's also quite a surprise to me. Do you have any pointers?

It's at the top of the series. If you build qemu-system-aarch64 with a
custom config you won't be able to instantiate those machines. Ideally
it would probe and maybe fail safe if the binary doesn't support the
model. Is that possible in qtest?

>
>>> improving out coverage by much. Test the "virt" machine for both arm
>>> and aarch64 as it can be used by either architecture.
>>>
>> Sounds fine to me, but I didn't write this part of the test. Thomas,
>> you wrote this section IIRC -- does this reduce coverage in any
>> meaningful way?
>
> I think we built only aarch64 in a couple of our CI pipelines,
> assuming that it covers all normal arm machines, too ... so we might
> want to revisit our CI pipelines to check whether we then need more
> test coverage for qemu-system-arm instead. But apart from that, the
> patch looks ok to me.
>
>  Thomas


--=20
Alex Benn=C3=A9e
