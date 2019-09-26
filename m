Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id b186sm9232360wmd.16.2019.09.26.08.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2019 08:27:48 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D86A11FF87;
	Thu, 26 Sep 2019 16:27:47 +0100 (BST)
References: <20190925233013.6449-1-alex.bennee@linaro.org>
 <CAFEAcA9vb5_Mi_axWpu7269Zg0xMLbiiV80ofLeyDpfws3G4nQ@mail.gmail.com>
 <20190926125817.GB19660@redhat.com>
 <ea6b671a-0c05-d880-3b9f-62a4f8626ec1@de.ibm.com>
 <19efe3ee-a532-cf66-a5a7-03a7c053737c@redhat.com>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, =?utf-8?Q?Daniel_P=2E?=
 =?utf-8?Q?_Berrang=C3=A9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, "open
 list\:RISC-V" <qemu-riscv@nongnu.org>, Richard Henderson
 <richard.henderson@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-discuss <qemu-discuss@nongnu.org>, qemu-s390x
 <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc@nongnu.org
Subject: Re: [RFC PATCH] configure: deprecate 32 bit build hosts
In-reply-to: <19efe3ee-a532-cf66-a5a7-03a7c053737c@redhat.com>
Date: Thu, 26 Sep 2019 16:27:47 +0100
Message-ID: <87d0fn9ix8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: RTVVFp2b3R0B


Thomas Huth <thuth@redhat.com> writes:

> On 26/09/2019 15.46, Christian Borntraeger wrote:
>>
>>
>> On 26.09.19 14:58, Daniel P. Berrang=C3=A9 wrote:
>>> On Thu, Sep 26, 2019 at 08:50:36AM +0100, Peter Maydell wrote:
>>>> On Thu, 26 Sep 2019 at 00:31, Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
>>>>>
>>>>> The 32 bit hosts are already a second class citizen especially with
>>>>> support for running 64 bit guests under TCG. We are also limited by
>>>>> testing as actual working 32 bit machines are getting quite rare in
>>>>> developers personal menageries. For TCG supporting newer types like
>>>>> Int128 is a lot harder with 32 bit calling conventions compared to
>>>>> their larger bit sized cousins. Fundamentally address space is the
>>>>> most useful thing for the translator to have even for a 32 bit guest a
>>>>> 32 bit host is quite constrained.
>>>>>
>>>>> As far as I'm aware 32 bit KVM users are even less numerous. Even
>>>>> ILP32 doesn't make much sense given the address space QEMU needs to
>>>>> manage.
>>>>
>>>> For KVM we should wait until the kernel chooses to drop support,
>>>> I think.
>>>
>>> What if the kernel is waiting for QEMU to drop support too ;-P
>>
>> For what its worth on kvm/s390 we never cared about implementing
>> 32 bit.
>
> Looking at tcg/s390/tcg-target.inc.c :
>
> ...
> /* We only support generating code for 64-bit mode.  */
> #if TCG_TARGET_REG_BITS !=3D 64
> #error "unsupported code generation mode"
> #endif
> ...
>
> ... it seems to me that TCG does not support 32-bit on s390 either. I
> think we can remove s390 (32-bit) from the list completely?

It's the same for riscv32 I think.

>
>  Thomas


--
Alex Benn=C3=A9e
