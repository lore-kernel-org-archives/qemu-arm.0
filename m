Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id o10sm4138410wri.15.2021.12.03.09.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 09:31:39 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id BAABF1FF96;
	Fri,  3 Dec 2021 17:31:38 +0000 (GMT)
References: <c76bde31-8f3b-2d03-b7c7-9e026d4b5873@huawei.com>
 <87bl1zxaeu.fsf@linaro.org> <7d137a2403be43b7a1c5857e96866403@huawei.com>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vasilev Oleg <vasilev.oleg@huawei.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Richard Henderson
 <richard.henderson@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 "Emilio G. Cota" <cota@braap.org>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Plotnik Nikolay <plotnik.nikolay@huawei.com>, Andrey Shinkevich
 <andrey.shinkevich@huawei.com>, Konobeev Vladimir
 <konobeev.vladimir@huawei.com>, "Chengen (William, FixNet)"
 <chengen@huawei.com>
Subject: Re: Suggestions for TCG performance improvements
Date: Fri, 03 Dec 2021 17:27:18 +0000
In-reply-to: <7d137a2403be43b7a1c5857e96866403@huawei.com>
Message-ID: <87v905wq6d.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: c941dxRtefqC


Vasilev Oleg <vasilev.oleg@huawei.com> writes:

> On 12/2/2021 7:02 PM, Alex Benn=C3=A9e wrote:
>
>> Vasilev Oleg <vasilev.oleg@huawei.com> writes:
>>
>>> I've discovered some MMU-related suggestions in the 2018 letter[2], and
>>> those seem to be still not implemented (flush still uses memset[3]).
>>> Do you think we should go forward with implementing those?
>> I doubt you can do better than memset which should be the most optimised
>> memory clear for the platform. We could consider a separate thread to
>> proactively allocate and clear new TLBs so we don't have to do it at
>> flush time. However we wouldn't have complete information about what
>> size we want the new table to be.
>>
>> When a TLB flush is performed it could be that the majority of the old
>> table is still perfectly valid.=20
>
> In that case, do you think it would be possible instead of flushing
> TLBs, store it somewhere and bring it back when the address space
> changes back?

It would need a new interface into cputlb but I don't see why not.

>
>> However we would need a reliable mechanism to work out which entries in =
the table could be kept.=20
>
> We could invalidate entries in those stored TLBs the same way we
> invalidate the active TLB. If we are going to have new thread to
> manage TLB allocation, invalidation could also be offloaded to those.
>
>> I did ponder a debug mode which would keep the last N tables dropped by
>> tlb_mmu_resize_locked and then measure the differences in the entries
>> before submitting the free to an rcu tasks.
>>> The mentioned paper[4] also describes other possible improvements.
>>> Some of those are already implemented (such as victim TLB and dynamic
>>> size for TLB), but others are not (e.g. TLB lookup uninlining and
>>> set-associative TLB layer). Do you think those improvements
>>> worth trying?
>> Anything is worth trying but you would need hard numbers. Also its all
>> too easy to target micro benchmarks which might not show much difference
>> in real world use.=20
>
> The  mentioned paper presents some benchmarking, e. g. linux kernel
> compilation and some other stuff. Do you think those shouldn't be
> trusted?

No they are good. To be honest it's the context switches that get you.
Look at "info jit" between a normal distro and a initramfs shell. Places
where the kernel is switching between multiple maps means a churn of TLB
data.

See my other post with a match of "msr ttrb"

>
>> The best thing you can do at the moment is give the
>> guest plenty of RAM so page updates are limited because the guest OS
>> doesn't have to swap RAM around.
>>
>> Another optimisation would be looking at bigger page sizes. For example
>> the kernel (in a Linux setup) usually has a contiguous flat map for
>> kernel space. If we could represent that at a larger granularity then
>> not only could we make the page lookup tighter for kernel mode we could
>> also achieve things like cross-page TB chaining for kernel functions.
>
> Do I understand correctly that currently softmmu doesn't treat
> hugepages any special, and you are suggesting we add such support, so
> that a particular region of memory occupies less TLBentries? This
> probably means TLB lookup would become quite a bit more complex.
>
>>> Another idea for decreasing occurence of TLB refills is to make TBs key
>>> in htable independent of physical address. I assume it is only needed
>>> to distinguish different processes where VAs can be the same.
>>> Is that assumption correct?
>
> This one, what do you think? Can we replace physical address as part
> of a key in TB htable with some sort of address space identifier?

Hmm maybe - so a change in ASID wouldn't need a total flush?

>
>>> Do you have any other ideas which parts of TCG could require our
>>> attention w.r.t the flamegraph I attached?
>> It's been done before but not via upstream patches but improving code
>> generation for hot loops would be a potential performance win.=20
>
> I am not sure optimizing the code generation itself would help much,
> at least in our case. The flamegraph I attached to previous letter
> shows that only about 10% of time qemu spends in generated code. The
> rest is helpers, searching for next block, TLB-related stuff and so
> on.
>
>> That would require some changes to the translation model to allow for
>> multiple exit points and probably introducing a new code generator
>> (gccjit or llvm) to generate highly optimised code.
>
> This, however, could bring a lot of performance gain, translation blocks =
would become bigger, and we would spend less time searching for the next bl=
ock.
>
>>> I am also CCing my teammates. We are eager to improve the QEMU TCG
>>> performance for our needs and to contribute our patches to upstream.
>> Do you have any particular goal in mind or just "better"? The current
>> MTTCG scaling tends to drop off as we go above 10-12 vCPUs due to the
>> cost of synchronous flushing across all those vCPUs.
>
> We have some internal ways to measure performance, but we are looking
> for alternative metric, that we could share and you could reproduce.
> Sysbench in threads mode is the closed we have found so far by
> comparing flamegraphs, but we are testing more benchmarking software.

OK.

>
>>> [1]: https://github.com/akopytov/sysbench
>>> [2]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg562103.html
>>> [3]:=20
>>> https://github.com/qemu/qemu/blob/14d02cfbe4adaeebe7cb833a8cc71191352cf=
03b/accel/tcg/cputlb.c#L239
>>> [4]: https://dl.acm.org/doi/pdf/10.1145/2686034
>>>
>>> [2. flamegraph.svg --- image/svg+xml; flamegraph.svg]...
>>>
>>> [3. callgraph.svg --- image/svg+xml; callgraph.svg]...
>>>
> Thanks,
> Oleg


--=20
Alex Benn=C3=A9e
