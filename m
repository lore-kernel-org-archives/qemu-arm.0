Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id z13sm2652219wjr.47.2015.12.08.04.02.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Dec 2015 04:02:12 -0800 (PST)
Received: from zen.linaro.local (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id C18753E01DB;
	Tue,  8 Dec 2015 12:02:11 +0000 (GMT)
References: <1447345251-22625-1-git-send-email-alex.bennee@linaro.org> <1447345251-22625-7-git-send-email-alex.bennee@linaro.org> <CAFEAcA9q1MpiM4vM+RH-YQ2RpB=eV-Xgyw1-yw6qHG0hbem6_Q@mail.gmail.com>
User-agent: mu4e 0.9.15; emacs 24.5.50.4
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org, Christoffer Dall <christoffer.dall@linaro.org>, Zhichao Huang <zhichao.huang@linaro.org>, kvm-devel <kvm@vger.kernel.org>, arm-mail-list <linux-arm-kernel@lists.infradead.org>, "kvmarm\@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v9 6/6] tests/guest-debug: introduce basic gdbstub tests
In-reply-to: <CAFEAcA9q1MpiM4vM+RH-YQ2RpB=eV-Xgyw1-yw6qHG0hbem6_Q@mail.gmail.com>
Date: Tue, 08 Dec 2015 12:02:11 +0000
Message-ID: <87poyhp2rg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 0wwi/NtxhCQ7


Peter Maydell <peter.maydell@linaro.org> writes:

> On 12 November 2015 at 16:20, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>> From: Alex Benn=C3=A9e <alex@bennee.com>
>>
>> The aim of these tests is to combine with an appropriate kernel
>> image (with symbol-file vmlinux) and check it behaves as it should.
>> Given a kernel it checks:
>>
>>   - single step
>>   - software breakpoint
>>   - hardware breakpoint
>>   - access, read and write watchpoints
>>
>> On success it returns 0 to the calling process.
>>
>> I've not plumbed this into the "make check" logic though as we need a
>> solution for providing non-host binaries to the tests. However the test
>> is structured to work with pretty much any Linux kernel image as it
>> uses the basic kernel_init code which is common across architectures.
>
> Do these tests pass if you run them on the TCG QEMU, just out
> of interest?

You'll be glad to know they do.

> I'm not a great fan of tests that aren't in 'make check'
> because IME they just bitrot, but as you say we have no
> sensible approach for handling tests that need to run real
> guest code :-(

I was pondering if a git sub-project with large file support would work.
We could add pre-built binaries to the tree with appropriate meta-data
(src tree, version, config) to rebuild if required.

There would be some degree of trust implied in the original builder
though. Maybe a signed commit?

>
> thanks
> -- PMM


--
Alex Benn=C3=A9e
