Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a04csm22165834f8f.23.2025.05.22.02.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 02:28:12 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 800F05F8AD;
	Thu, 22 May 2025 10:28:11 +0100 (BST)
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
In-Reply-To: <199e7486-7d05-459b-ad51-cb9b130f299f@daynix.com> (Akihiko
	Odaki's message of "Thu, 22 May 2025 16:40:13 +0900")
References: <20250521164250.135776-1-alex.bennee@linaro.org>
	<20250521164250.135776-13-alex.bennee@linaro.org>
	<4d300cca-3ac2-4072-a35c-0b6aef970b26@daynix.com>
	<87bjrl87p5.fsf@draig.linaro.org>
	<83945c43-bfb2-4469-90bd-e3a7c2ca5d89@daynix.com>
	<CAAjaMXZ8acKBSGHvcQOcOnzBDCjFU1SOjse7pHtHWxNeREc2gg@mail.gmail.com>
	<199e7486-7d05-459b-ad51-cb9b130f299f@daynix.com>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Thu, 22 May 2025 10:28:11 +0100
Message-ID: <875xht805w.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: KTF8KhV0fUIV

Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> On 2025/05/22 16:31, Manos Pitsidianakis wrote:
>> On Thu, May 22, 2025 at 10:03=E2=80=AFAM Akihiko Odaki <akihiko.odaki@da=
ynix.com> wrote:
>>>
>>> On 2025/05/22 15:45, Alex Benn=C3=A9e wrote:
>>>> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>>>>
>>>>> On 2025/05/22 1:42, Alex Benn=C3=A9e wrote:
>>>>>> From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>>>>>> This commit fixes an indefinite hang when using VIRTIO GPU blob
>>>>>> objects
>>>>>> under TCG in certain conditions.
>>>>>> The VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB VIRTIO command creates a
>>>>>> MemoryRegion and attaches it to an offset on a PCI BAR of the
>>>>>> VirtIOGPUdevice. The VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB command unma=
ps
>>>>>> it.
>>>>>> Because virglrenderer commands are not thread-safe they are only
>>>>>> called on the main context and QEMU performs the cleanup in three st=
eps
>>>>>> to prevent a use-after-free scenario where the guest can access the
>>>>>> region after it=E2=80=99s unmapped:
>>>>>> 1. From the main context, the region=E2=80=99s field finish_unmappin=
g is
>>>>>> false
>>>>>>       by default, so it sets a variable cmd_suspended, increases the
>>>>>>       renderer_blocked variable, deletes the blob subregion, and unp=
arents
>>>>>>       the blob subregion causing its reference count to decrement.
>>>>>> 2. From an RCU context, the MemoryView gets freed, the FlatView gets
>>>>>>       recalculated, the free callback of the blob region
>>>>>>       virtio_gpu_virgl_hostmem_region_free is called which sets the
>>>>>>       region=E2=80=99s field finish_unmapping to true, allowing the =
main thread
>>>>>>       context to finish replying to the command
>>>>>> 3. From the main context, the command is processed again, but this
>>>>>> time
>>>>>>       finish_unmapping is true, so virgl_renderer_resource_unmap can=
 be
>>>>>>       called and a response is sent to the guest.
>>>>>> It happens so that under TCG, if the guest has no timers configured
>>>>>> (and
>>>>>> thus no interrupt will cause the CPU to exit), the RCU thread does n=
ot
>>>>>> have enough time to grab the locks and recalculate the FlatView.
>>>>>> That=E2=80=99s not a big problem in practice since most guests will =
assume a
>>>>>> response will happen later in time and go on to do different things,
>>>>>> potentially triggering interrupts and allowing the RCU context to ru=
n.
>>>>>> If the guest waits for the unmap command to complete though, it bloc=
ks
>>>>>> indefinitely. Attaching to the QEMU monitor and force quitting the g=
uest
>>>>>> allows the cleanup to continue.
>>>>>> There's no reason why the FlatView recalculation can't occur right
>>>>>> away
>>>>>> when we delete the blob subregion, however. It does not, because whe=
n we
>>>>>> create the subregion we set the object as its own parent:
>>>>>>        memory_region_init_ram_ptr(mr, OBJECT(mr), "blob", size, data=
);
>>>>>> The extra reference is what prevents freeing the memory region
>>>>>> object in
>>>>>> the memory transaction of deleting the subregion.
>>>>>> This commit changes the owner object to the device, which removes
>>>>>> the
>>>>>> extra owner reference in the memory region and causes the MR to be
>>>>>> freed right away in the main context.
>>>>>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>>>>>> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>>>>>> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>>>> Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>>>> Message-Id: <20250410122643.1747913-3-manos.pitsidianakis@linaro.org>
>>>>>> Cc: qemu-stable@nongnu.org
>>>>>> ---
>>>>>>     hw/display/virtio-gpu-virgl.c | 2 +-
>>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>> diff --git a/hw/display/virtio-gpu-virgl.c
>>>>>> b/hw/display/virtio-gpu-virgl.c
>>>>>> index 71a7500de9..8fbe4e70cc 100644
>>>>>> --- a/hw/display/virtio-gpu-virgl.c
>>>>>> +++ b/hw/display/virtio-gpu-virgl.c
>>>>>> @@ -112,7 +112,7 @@ virtio_gpu_virgl_map_resource_blob(VirtIOGPU *g,
>>>>>>         vmr->g =3D g;
>>>>>>         mr =3D g_new0(MemoryRegion, 1);
>>>>>>     -    memory_region_init_ram_ptr(mr, OBJECT(mr), "blob", size,
>>>>>> data);
>>>>>> +    memory_region_init_ram_ptr(mr, OBJECT(g), "blob", size, data);
>>>>>>         memory_region_add_subregion(&b->hostmem, offset, mr);
>>>>>>         memory_region_set_enabled(mr, true);
>>>>>>
>>>>>
>>>>> I suggest dropping this patch for now due to the reason I pointed out
>>>>> for the first version of this series.
>>>>
>>>> This fixes an actual bug - without it we get a hang.
>>>>
>>>
>>> I understand that but it also introduces a regression; "[PATCH v3 14/20]
>>> ui/gtk-gl-area: Remove extra draw call in refresh" is also a similar ca=
se.
>>>
>>> Ideally such a bug should be fixed without regression, but I understand
>>> it is sometimes difficult to do that and postponing the bug resolution
>>> until figuring out the correct way does not make sense.
>>>
>>> In such a case, a bug should be fixed minimizing the regression and the
>>> documentation of the regression should be left in the code.
>>>
>>> In particular, this patch can cause use-after-free whether TCG is used
>>> or not. Instead, I suggest to avoid freeing memory regions at all on
>>> TCG. It will surely leak memory, but won't result in use-after-free at
>>> least and the other accelerators will be unaffected.
>>>
>>> Regards,
>>> Akihiko Odaki
>> We tested this fix with ASAN and didn't see anything. Do you have a
>> test case in mind that can reproduce this use-after-free? It'd help
>> make a certain decision on whether to drop this patch or not. I'm not
>> doubting that this can cause a use-after-free by the way, it's just
>> that it is hypothetical only. If it causes a use-after-free for sure
>> we should definitely drop it.
>
> No, I don't have a test case and it should rarely occur. More
> concretely, a UAF occurs if the guest accesses the memory region while
> trying to unmap it. It is just a theory indeed, but the theory says
> the UAF is possible.

I have a test case this fixes which I think trumps a theoretical UAF
without a test case.

Why would the guest attempt to access after triggering the free itself?
Wouldn't it be correct to fault the guest for violating its own memory
safety rules?

>>> Instead, I suggest to avoid freeing memory regions at all on
>>> TCG. It will surely leak memory, but won't result in use-after-free at
>>> least and the other accelerators will be unaffected.
>> Leaking memory for blob objects is also not ideal, since they are
>> frequently allocated. It's memory-safe but the leak can accumulate
>> over time.
>>
>
> Memory safety and leak free cannot be compatible unless RCU is fixed.
> We need to choose either of them.

How can the guest access something that is now unmapped? The RCU should
only run after the flatview has been updated.

>
> Regards,
> Akihiko Odaki

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
