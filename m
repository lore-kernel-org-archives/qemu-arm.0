Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad88acd2576sm109698866b.79.2025.05.27.03.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 03:05:35 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 4A3DD5F80B;
	Tue, 27 May 2025 11:05:34 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
  qemu-devel@nongnu.org,  Pierrick Bouvier <pierrick.bouvier@linaro.org>,
  Thomas Huth <thuth@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
  John Snow <jsnow@redhat.com>,  Fabiano Rosas <farosas@suse.de>,  Peter Xu
 <peterx@redhat.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
  Alexandre Iooss <erdnaxe@crans.org>,  Markus Armbruster
 <armbru@redhat.com>,  David Hildenbrand <david@redhat.com>,  Laurent
 Vivier <lvivier@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
  Peter Maydell <peter.maydell@linaro.org>,  qemu-arm@nongnu.org,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Mahmoud Mandour
 <ma.mandourr@gmail.com>,  Sriram Yagnaraman
 <sriram.yagnaraman@ericsson.com>,  Dmitry Osipenko
 <dmitry.osipenko@collabora.com>,  Gustavo Romero
 <gustavo.romero@linaro.org>,  "Michael S. Tsirkin" <mst@redhat.com>,
  qemu-stable@nongnu.org
Subject: Re: [PATCH v3 12/20] virtio-gpu: fix hang under TCG when unmapping
 blob
In-Reply-To: <d5c429eb-d583-4b9d-85c1-b0636e789e9c@daynix.com> (Akihiko
	Odaki's message of "Thu, 22 May 2025 18:54:21 +0900")
References: <20250521164250.135776-1-alex.bennee@linaro.org>
	<20250521164250.135776-13-alex.bennee@linaro.org>
	<4d300cca-3ac2-4072-a35c-0b6aef970b26@daynix.com>
	<87bjrl87p5.fsf@draig.linaro.org>
	<83945c43-bfb2-4469-90bd-e3a7c2ca5d89@daynix.com>
	<CAAjaMXZ8acKBSGHvcQOcOnzBDCjFU1SOjse7pHtHWxNeREc2gg@mail.gmail.com>
	<199e7486-7d05-459b-ad51-cb9b130f299f@daynix.com>
	<875xht805w.fsf@draig.linaro.org>
	<d5c429eb-d583-4b9d-85c1-b0636e789e9c@daynix.com>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Tue, 27 May 2025 11:05:34 +0100
Message-ID: <871psanzbl.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: d9K0Lw5L9bYR

Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> On 2025/05/22 18:28, Alex Benn=C3=A9e wrote:
>> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>>=20
>>> On 2025/05/22 16:31, Manos Pitsidianakis wrote:
>>>> On Thu, May 22, 2025 at 10:03=E2=80=AFAM Akihiko Odaki <akihiko.odaki@=
daynix.com> wrote:
>>>>>
>>>>> On 2025/05/22 15:45, Alex Benn=C3=A9e wrote:
>>>>>> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>>>>>>
>>>>>>> On 2025/05/22 1:42, Alex Benn=C3=A9e wrote:
>>>>>>>> From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
<snip>
>>>>> In such a case, a bug should be fixed minimizing the regression and t=
he
>>>>> documentation of the regression should be left in the code.
>>>>>
>>>>> In particular, this patch can cause use-after-free whether TCG is used
>>>>> or not. Instead, I suggest to avoid freeing memory regions at all on
>>>>> TCG. It will surely leak memory, but won't result in use-after-free at
>>>>> least and the other accelerators will be unaffected.
>>>>>
>>>>> Regards,
>>>>> Akihiko Odaki
>>>> We tested this fix with ASAN and didn't see anything. Do you have a
>>>> test case in mind that can reproduce this use-after-free? It'd help
>>>> make a certain decision on whether to drop this patch or not. I'm not
>>>> doubting that this can cause a use-after-free by the way, it's just
>>>> that it is hypothetical only. If it causes a use-after-free for sure
>>>> we should definitely drop it.
>>>
>>> No, I don't have a test case and it should rarely occur. More
>>> concretely, a UAF occurs if the guest accesses the memory region while
>>> trying to unmap it. It is just a theory indeed, but the theory says
>>> the UAF is possible.
>> I have a test case this fixes which I think trumps a theoretical UAF
>> without a test case.
>> Why would the guest attempt to access after triggering the free
>> itself?
>> Wouldn't it be correct to fault the guest for violating its own memory
>> safety rules?
>
> docs/devel/secure-coding-practices.rst says "Unexpected accesses must
> not cause memory corruption or leaks in QEMU".

Agreed.

> I'm not completely sure whether it is safe without concurrent accesses
> either. In particular, KVM does not immediately update the guest
> memory mapping, so it may result in a time window where the guest
> memory is mapped to an unmapped host memory region, and I suspect that
> could cause a problem. That also motivates limiting the scope of the
> change to TCG.

Surely it does:

        memory_region_set_enabled(mr, false);
        memory_region_del_subregion(&b->hostmem, mr);

will trigger a rebuilding of the flatview - so after the memory region
is deleted any guest access should trigger a fault to the guest. Only
then do we unparent the memory region and finish the clean-up.

I don't think we want to have different paths for KVM and TCG here as it
will further complicate already complicated code.=20

>>>>> Instead, I suggest to avoid freeing memory regions at all on
>>>>> TCG. It will surely leak memory, but won't result in use-after-free at
>>>>> least and the other accelerators will be unaffected.
>>>> Leaking memory for blob objects is also not ideal, since they are
>>>> frequently allocated. It's memory-safe but the leak can accumulate
>>>> over time.
>>>>
>>>
>>> Memory safety and leak free cannot be compatible unless RCU is fixed.
>>> We need to choose either of them.
>> How can the guest access something that is now unmapped? The RCU
>> should
>> only run after the flatview has been updated.
>
> This patch bypasses RCU. That's why it solves the hang even though the
> RCU itself is not fixed.
>
> Let me summarize the theory and the actual behavior below:
>
> The theory is that RCU satisfies the common requirement of concurrent
> algorithms. More concretely:
> 1) It is race-free; for RCU, it means it prevents use-after-free.
> 2) It does not prevent forward progress.
>
> The patch message suggests 2) is not satisfied. A proper fix would be
> to change RCU to satisfy 2).

Its mutually incompatible with virglrenderer - we have to block all
commands until the virgl resource is freed and we can't do that until
the memory region is unplugged.

So yes we do bypass RCU for this but by explicitly un-parenting the
resource once the mapping has been removed.

> However, this patch workarounds the problem by circumventing RCU,
> which solves 2) but it regresses 1).

I'm still not seeing how this happens and without a test case to
demonstrate it happening I can't hold this patch in limbo forever.

> My suggestion is to document and to limit the impact of 1) by:
> a) Limiting the scope of the change to TCG.
> b) Not freeing memory regions, which will prevent use-after-free while
> leaking memory.
>
> Manos said b) can be problematic because mappings are frequently
> created. Whether b) makes sense or not depends on the probability and
> impact of UAF and memory leak

Not freeing memory regions would lead to a DoS attack instead. I don't
think we can just accumulate region like that.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
