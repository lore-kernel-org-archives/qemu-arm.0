Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4730573njc;
        Tue, 27 May 2025 04:03:09 -0700 (PDT)
X-Received: by 2002:a05:6a21:3a89:b0:218:59b:b2f4 with SMTP id adf61e73a8af0-2188c3c66d0mr18445614637.42.1748343788996;
        Tue, 27 May 2025 04:03:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748343788; cv=none;
        d=google.com; s=arc-20240605;
        b=j6JDbNkeQNjBfGchwqVG5bA0zeT3Qv1IxgMAESsv6uj6B6Po2WA+8qxw0FUe2P6dP0
         AwQUO0YsnS7/oIto4ZNc+lBk+bDqU99gkFlpHY2PeJ7kGglWaCsomvzr6QIEJahUn++C
         fzCgpBc7omXooUTjgFzeNA25Og9s9RmMqoK5M00gDBhGx0AcEn4X5o2Y3Ll40DYSwf2j
         Ma6ScS+32TMlpZzO+3NoxCCxiwgR5BG7QhnGPZx8Sgw/79cbitWn59Cn9dN1hnCzc6qQ
         dh5ULzvf91+ZETBGeEKAMzJWOABBxufEl1ou4uvfLaceujzxhyPLk58swzngHDh4YGrB
         FabQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=dhBAGDy5ge1xAxqK0/JlkV+qIGKgfocICelKGqAniqY=;
        fh=vz/Wu4DZUmj/fvUnyKW4Lbak49ERl7A7MmX3qqu4zJY=;
        b=AkET5rBP+HDB6F5gsW+9Yt9GByrBzLk2yFqJK5iha+JzZqwmUrBFwgCqN203zrkM5W
         2uByNe1u1lSFvcnLOJCECZsQYiWZnnG+LvXBfpIrZM1Y2XF8i/ee/bHhUiTOsee/TSfG
         sk3OkCotPwYbZhvZq4ijaIOoMee8uJqgrnOD24hYL1IkjmPxN+dm01KVIKbRhpabAG9l
         rlyIiUko9XO6VyXLiNzh07GK30d+CP4faipqzq035vNvBHn9/PwcDpi09Edj4CLoFVAE
         ydY7dn6yPE7sKJyqYLRxeU0JUQ0CzS+UtzSX5RcnPj2uWa/foReTngQlV7OacnyH+4uA
         ia3A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=guY9ep1E;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-742a97f2b6fsor18239176b3a.6.2025.05.27.04.03.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 27 May 2025 04:03:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=guY9ep1E;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1748343788; x=1748948588; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dhBAGDy5ge1xAxqK0/JlkV+qIGKgfocICelKGqAniqY=;
        b=guY9ep1EwXYAup17OVtF+dLpHhdhq/uLX9KhcH6xjiTLGBm1f99k3y1Y6Kns3DYfvw
         vNRHbddGqwYghEXV4BZAoy9rb1IN4kKq4IHeGpspl+zEeB3UPoEd67bdGM4o+eB76NQh
         sx1xVd0eywPKW1+HkIw1fEPMVEO0H8jNzBlP6c0vxBj3CdSvONMQ+HLuZvPc+EK0Hc2P
         maxT59Cc40lhpAqaDVyBh8TbLCdhVmh8JDkf65denvrqVVI+VO0T5voSI1QTMFSyg29z
         YvC6Us7DF+bFGMQBH4BYWByHItF1E1WtVyN599t8LgAYolszS+M15S6+jBqEjHi8FkLa
         xWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748343788; x=1748948588;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dhBAGDy5ge1xAxqK0/JlkV+qIGKgfocICelKGqAniqY=;
        b=Vk1mlPrTwV20iKUZfnmF/zo2Nun4i1oMZVn8eoX+NPaU0D+aqP2up7OghFvsIC8L5l
         Zf38AHKzar6fiS+TON/c8yNEBuQFoLC6wqr2cEuVXipG0SfUPaA0yf3J+GxbTfYPW7jP
         ySGeh8hX+fR+mUzABgY3qUjq+asRZsLo6SlK7q0kW0gGD5Wh0ZE221j64f4qv5ZLbeDw
         kJG3+TWOgDd77FWcxsXZM615lvuipubwvcAm/5MiOqTIH2IvHtRqkBxVNPmHHdlrNx11
         8ubGQiRTNKRKRbDGUNyCkM7qV91JWR3bFKd7xmfndr8aVMyoN2274cz9cvfzN0KY5gse
         uMag==
X-Gm-Message-State: AOJu0YyROm7G73wykokMiG323qUjhjYHTf4lI8uKhl+c00H6lT2ZyZvk
	RTkNjuYtSBghBMuyrHc3XTO/q2Qfy0kEi09Bfc5bKHuJzh90jFMfNPNJk2cJwzk4wW3aFyp0cXI
	2x/B6
X-Gm-Gg: ASbGncvbS/3mNWIExQRTN+WgWBU9lTs049KZ5WNbQIQMjsG7UX4aRWnWT7lYoV4EILP
	BjspzxU6Y2ZK8ai0Ql88H+C1plmIn4PtdHV43duJP8kTV08LqyLl+J21PNt0IUyQrIS+E8Hb4uV
	xcNjJxmbWdeiQNjH02zht1H6HW8fbCxWkGhJhANsHCpML5cjI/FEEOEC/uYPozh6KWvO1hU5NQN
	CrAqw5vpksg5gMAT65tbFhftCVb5AHTTfVx1LL/WYSloONsVjRBH3aZ+ndgkjRYzPGEv4lBSKuD
	bXk3FNJqx/iM0ySDa/j45QEk9YfR/wuZ0BwScHkCYkuSDsn3M1fSBKFl3pjSTin/yLsuN1tWZZ6
	d0/jKSJDaaLhX7lmdpUGr5FsABcx3gA==
X-Google-Smtp-Source: AGHT+IHs5Us98HvdCfta1J00ev5HbDgyhC3CIgEoXZgBQq+zJM0yMXjmnz92SvIF/1THi05DsRUk6Q==
X-Received: by 2002:a05:6a00:21c2:b0:73e:5aa:4f64 with SMTP id d2e1a72fcca58-745fde9f3b7mr17828762b3a.10.1748343788221;
        Tue, 27 May 2025 04:03:08 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from ?IPV6:2400:4050:b783:b00:4952:3c52:120a:27e9? ([2400:4050:b783:b00:4952:3c52:120a:27e9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2c47f887efsm581227a12.47.2025.05.27.04.03.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 04:03:07 -0700 (PDT)
Message-ID: <e9285843-0487-4754-a348-34f1a852b24c@daynix.com>
Date: Tue, 27 May 2025 20:03:03 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/20] virtio-gpu: fix hang under TCG when unmapping
 blob
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-devel@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Markus Armbruster <armbru@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-stable@nongnu.org
References: <20250521164250.135776-1-alex.bennee@linaro.org>
 <20250521164250.135776-13-alex.bennee@linaro.org>
 <4d300cca-3ac2-4072-a35c-0b6aef970b26@daynix.com>
 <87bjrl87p5.fsf@draig.linaro.org>
 <83945c43-bfb2-4469-90bd-e3a7c2ca5d89@daynix.com>
 <CAAjaMXZ8acKBSGHvcQOcOnzBDCjFU1SOjse7pHtHWxNeREc2gg@mail.gmail.com>
 <199e7486-7d05-459b-ad51-cb9b130f299f@daynix.com>
 <875xht805w.fsf@draig.linaro.org>
 <d5c429eb-d583-4b9d-85c1-b0636e789e9c@daynix.com>
 <871psanzbl.fsf@draig.linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <871psanzbl.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: o6Qy5d6kn1Db

On 2025/05/27 19:05, Alex Bennée wrote:
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> 
>> On 2025/05/22 18:28, Alex Bennée wrote:
>>> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>>>
>>>> On 2025/05/22 16:31, Manos Pitsidianakis wrote:
>>>>> On Thu, May 22, 2025 at 10:03 AM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>>>>>
>>>>>> On 2025/05/22 15:45, Alex Bennée wrote:
>>>>>>> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>>>>>>>
>>>>>>>> On 2025/05/22 1:42, Alex Bennée wrote:
>>>>>>>>> From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> <snip>
>>>>>> In such a case, a bug should be fixed minimizing the regression and the
>>>>>> documentation of the regression should be left in the code.
>>>>>>
>>>>>> In particular, this patch can cause use-after-free whether TCG is used
>>>>>> or not. Instead, I suggest to avoid freeing memory regions at all on
>>>>>> TCG. It will surely leak memory, but won't result in use-after-free at
>>>>>> least and the other accelerators will be unaffected.
>>>>>>
>>>>>> Regards,
>>>>>> Akihiko Odaki
>>>>> We tested this fix with ASAN and didn't see anything. Do you have a
>>>>> test case in mind that can reproduce this use-after-free? It'd help
>>>>> make a certain decision on whether to drop this patch or not. I'm not
>>>>> doubting that this can cause a use-after-free by the way, it's just
>>>>> that it is hypothetical only. If it causes a use-after-free for sure
>>>>> we should definitely drop it.
>>>>
>>>> No, I don't have a test case and it should rarely occur. More
>>>> concretely, a UAF occurs if the guest accesses the memory region while
>>>> trying to unmap it. It is just a theory indeed, but the theory says
>>>> the UAF is possible.
>>> I have a test case this fixes which I think trumps a theoretical UAF
>>> without a test case.
>>> Why would the guest attempt to access after triggering the free
>>> itself?
>>> Wouldn't it be correct to fault the guest for violating its own memory
>>> safety rules?
>>
>> docs/devel/secure-coding-practices.rst says "Unexpected accesses must
>> not cause memory corruption or leaks in QEMU".
> 
> Agreed.
> 
>> I'm not completely sure whether it is safe without concurrent accesses
>> either. In particular, KVM does not immediately update the guest
>> memory mapping, so it may result in a time window where the guest
>> memory is mapped to an unmapped host memory region, and I suspect that
>> could cause a problem. That also motivates limiting the scope of the
>> change to TCG.
> 
> Surely it does:
> 
>          memory_region_set_enabled(mr, false);
>          memory_region_del_subregion(&b->hostmem, mr);
> 
> will trigger a rebuilding of the flatview - so after the memory region
> is deleted any guest access should trigger a fault to the guest. Only
> then do we unparent the memory region and finish the clean-up.

I wrongly assumed it waits for RCU, but I found it is not true.

It is still not true that any guest access will trigger a fault to the 
guest. QEMU's internal AddressSpace keeps the old FlatView until the RCU 
changes, and some device may still have a DMA mapping.

> 
> I don't think we want to have different paths for KVM and TCG here as it
> will further complicate already complicated code.

Complexity is not a problem here. Any concurrent code has complexity 
needed for correctness and reliability. We should add complexity if 
needed for reliablity; otherwise, we should remove it (even if it's 
already simple).

> 
>>>>>> Instead, I suggest to avoid freeing memory regions at all on
>>>>>> TCG. It will surely leak memory, but won't result in use-after-free at
>>>>>> least and the other accelerators will be unaffected.
>>>>> Leaking memory for blob objects is also not ideal, since they are
>>>>> frequently allocated. It's memory-safe but the leak can accumulate
>>>>> over time.
>>>>>
>>>>
>>>> Memory safety and leak free cannot be compatible unless RCU is fixed.
>>>> We need to choose either of them.
>>> How can the guest access something that is now unmapped? The RCU
>>> should
>>> only run after the flatview has been updated.
>>
>> This patch bypasses RCU. That's why it solves the hang even though the
>> RCU itself is not fixed.
>>
>> Let me summarize the theory and the actual behavior below:
>>
>> The theory is that RCU satisfies the common requirement of concurrent
>> algorithms. More concretely:
>> 1) It is race-free; for RCU, it means it prevents use-after-free.
>> 2) It does not prevent forward progress.
>>
>> The patch message suggests 2) is not satisfied. A proper fix would be
>> to change RCU to satisfy 2).
> 
> Its mutually incompatible with virglrenderer - we have to block all
> commands until the virgl resource is freed and we can't do that until
> the memory region is unplugged.
> 
> So yes we do bypass RCU for this but by explicitly un-parenting the
> resource once the mapping has been removed.

The problem is that RCU doesn't free the memory region when all commands 
are blocked.

If we fix RCU, RCU will free the memory region, the virgl resource will 
be freed then, and the commands will be unblocked.

> 
>> However, this patch workarounds the problem by circumventing RCU,
>> which solves 2) but it regresses 1).
> 
> I'm still not seeing how this happens and without a test case to
> demonstrate it happening I can't hold this patch in limbo forever.

Not a test case that runs on the guest, but adding the following change 
to QEMU will demonstrate the issue:

diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 145a0b387956..c97cd2dfd7b3 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -182,7 +182,11 @@ virtio_gpu_virgl_unmap_resource_blob(VirtIOGPU *g,
          /* memory region owns self res->mr object and frees it by 
itself */
          memory_region_set_enabled(mr, false);
          memory_region_del_subregion(&b->hostmem, mr);
+        memory_region_ref(OBJECT(mr));
+        int k = b->renderer_blocked;
          object_unparent(OBJECT(mr));
+        assert(k == b->renderer_blocked);
+        memory_region_unref(OBJECT(mr));
      }

      return 0;

memory_region_ref() and memory_region_unref() emulates the begin and end 
of a DMA operation on mr, respectively. In a real world scenario, 
address_space_map() and address_space_unmap() call these functions.

If the code is correct, object_unparent() should not free the memory 
region while the DMA operation is ongoing, so the renderer will be kept 
blocked. assert(k == b->renderer_blocked) checks that.

My proposal is to limit the impact of the regression as possible as we 
can and to document it, not to postpone the solution until figuring out 
the problem in RCU.

> 
>> My suggestion is to document and to limit the impact of 1) by:
>> a) Limiting the scope of the change to TCG.
>> b) Not freeing memory regions, which will prevent use-after-free while
>> leaking memory.
>>
>> Manos said b) can be problematic because mappings are frequently
>> created. Whether b) makes sense or not depends on the probability and
>> impact of UAF and memory leak
> 
> Not freeing memory regions would lead to a DoS attack instead. I don't
> think we can just accumulate region like that.

UAF also results in DoS, and it can have a bigger consequence due to 
memory corruption. Memory leak is usually safer than UAF.

The question is whether memory leak causes a practical problem; it makes 
sense to opt to UAF if the accumulation happens too quickly; we at least 
know that UAF is rare.

Regards,
Akihiko Odaki
