Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id k27sm478316wms.41.2021.12.06.13.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 13:12:31 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 575EC1FF96;
	Mon,  6 Dec 2021 21:12:30 +0000 (GMT)
References: <c76bde31-8f3b-2d03-b7c7-9e026d4b5873@huawei.com>
 <87bl1zxaeu.fsf@linaro.org> <7d137a2403be43b7a1c5857e96866403@huawei.com>
 <87v905wq6d.fsf@linaro.org> <35631f7cceb141879aa7475ccaf81acb@huawei.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vasilev Oleg <vasilev.oleg@huawei.com>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>, Konobeev Vladimir
 <konobeev.vladimir@huawei.com>, Plotnik Nikolay
 <plotnik.nikolay@huawei.com>, Richard Henderson
 <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, Andrey Shinkevich <andrey.shinkevich@huawei.com>,
 "Emilio G. Cota" <cota@braap.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "Chengen (William, FixNet)" <chengen@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Suggestions for TCG performance improvements
Date: Mon, 06 Dec 2021 21:09:38 +0000
In-reply-to: <35631f7cceb141879aa7475ccaf81acb@huawei.com>
Message-ID: <87a6hdmo8x.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: xfb6sdZQD6QL


Vasilev Oleg <vasilev.oleg@huawei.com> writes:

> On 12/3/2021 8:32 PM, Alex Benn=C3=A9e wrote:
>> Vasilev Oleg <vasilev.oleg@huawei.com> writes:
>>
>>> On 12/2/2021 7:02 PM, Alex Benn=C3=A9e wrote:
>>>
>>>> Vasilev Oleg <vasilev.oleg@huawei.com> writes:
> ...skipped...
>>>> I did ponder a debug mode which would keep the last N tables dropped by
>>>> tlb_mmu_resize_locked and then measure the differences in the entries
>>>> before submitting the free to an rcu tasks.
>>>>> The mentioned paper[4] also describes other possible improvements.
>>>>> Some of those are already implemented (such as victim TLB and dynamic
>>>>> size for TLB), but others are not (e.g. TLB lookup uninlining and
>>>>> set-associative TLB layer). Do you think those improvements
>>>>> worth trying?
>>>> Anything is worth trying but you would need hard numbers. Also its all
>>>> too easy to target micro benchmarks which might not show much differen=
ce
>>>> in real world use.=20
>>> The  mentioned paper presents some benchmarking, e. g. linux kernel
>>> compilation and some other stuff. Do you think those shouldn't be
>>> trusted?
>> No they are good. To be honest it's the context switches that get you.
>> Look at "info jit" between a normal distro and a initramfs shell. Places
>> where the kernel is switching between multiple maps means a churn of TLB
>> data.
>>
>> See my other post with a match of "msr ttrb"
> Sorry, couldn't find what you are referring to. Could you, please, share
> a link?

It was an enhancement to the libinsns.so plugin to gauge how often
certain instructions are run:

  Subject: [RFC PATCH  0/2] insn plugin tweaks for measuring frequency
  Date: Fri,  3 Dec 2021 14:44:19 +0000
  Message-Id: <20211203144421.1445232-1-alex.bennee@linaro.org>

I think the msr ttrb[10]_el1 is a key instruction because that triggers
a flush if the ASID changes. On my initramfs setup with a simple login
shell that doesn't happen, on a full distro there is context switching
all the time which causes extra flushes.

--=20
Alex Benn=C3=A9e
