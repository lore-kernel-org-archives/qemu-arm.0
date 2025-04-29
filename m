Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41c934sm827865466b.8.2025.04.29.14.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 14:19:32 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 0E33C5FAEE;
	Tue, 29 Apr 2025 22:19:32 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: qemu-devel@nongnu.org,  Akihiko Odaki <akihiko.odaki@daynix.com>,
  Thomas Huth <thuth@redhat.com>,  Alexandre Iooss <erdnaxe@crans.org>,
  "Michael S. Tsirkin" <mst@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  David Hildenbrand <david@redhat.com>,  Pierrick
 Bouvier <pierrick.bouvier@linaro.org>,  qemu-arm@nongnu.org,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Peter Xu
 <peterx@redhat.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  Mahmoud Mandour
 <ma.mandourr@gmail.com>,  Manos Pitsidianakis
 <manos.pitsidianakis@linaro.org>,  qemu-stable@nongnu.org
Subject: Re: [PATCH 8/9] virtio-gpu: fix hang under TCG when unmapping blob
In-Reply-To: <8b123991-21f2-47b5-851d-6b53fbfaa691@collabora.com> (Dmitry
	Osipenko's message of "Tue, 29 Apr 2025 21:48:02 +0300")
References: <20250428125918.449346-1-alex.bennee@linaro.org>
	<20250428125918.449346-9-alex.bennee@linaro.org>
	<8b123991-21f2-47b5-851d-6b53fbfaa691@collabora.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 29 Apr 2025 22:19:31 +0100
Message-ID: <87o6we3bto.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: DIJG1buDuGO9

Dmitry Osipenko <dmitry.osipenko@collabora.com> writes:

> On 4/28/25 15:59, Alex Benn=C3=83=C2=A9e wrote:
>> From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>>=20
>> This commit fixes an indefinite hang when using VIRTIO GPU blob objects
>> under TCG in certain conditions.
>>=20
>> The VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB VIRTIO command creates a
>> MemoryRegion and attaches it to an offset on a PCI BAR of the
>> VirtIOGPUdevice. The VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB command unmaps
>> it.
>>=20
>> Because virglrenderer commands are not thread-safe they are only
>> called on the main context and QEMU performs the cleanup in three steps
>> to prevent a use-after-free scenario where the guest can access the
>> region after it=E2=80=99s unmapped:
>>=20
>> 1. From the main context, the region=E2=80=99s field finish_unmapping is=
 false
>>    by default, so it sets a variable cmd_suspended, increases the
>>    renderer_blocked variable, deletes the blob subregion, and unparents
>>    the blob subregion causing its reference count to decrement.
>>=20
>> 2. From an RCU context, the MemoryView gets freed, the FlatView gets
>>    recalculated, the free callback of the blob region
>>    virtio_gpu_virgl_hostmem_region_free is called which sets the
>>    region=E2=80=99s field finish_unmapping to true, allowing the main th=
read
>>    context to finish replying to the command
>>=20
>> 3. From the main context, the command is processed again, but this time
>>    finish_unmapping is true, so virgl_renderer_resource_unmap can be
>>    called and a response is sent to the guest.
>>=20
>> It happens so that under TCG, if the guest has no timers configured (and
>> thus no interrupt will cause the CPU to exit), the RCU thread does not
>> have enough time to grab the locks and recalculate the FlatView.
>>=20
>> That=E2=80=99s not a big problem in practice since most guests will assu=
me a
>> response will happen later in time and go on to do different things,
>> potentially triggering interrupts and allowing the RCU context to run.
>> If the guest waits for the unmap command to complete though, it blocks
>> indefinitely. Attaching to the QEMU monitor and force quitting the guest
>> allows the cleanup to continue.
>>=20
>> There's no reason why the FlatView recalculation can't occur right away
>> when we delete the blob subregion, however. It does not, because when we
>> create the subregion we set the object as its own parent:
>>=20
>>     memory_region_init_ram_ptr(mr, OBJECT(mr), "blob", size, data);
>>=20
>> The extra reference is what prevents freeing the memory region object in
>> the memory transaction of deleting the subregion.
>>=20
>> This commit changes the owner object to the device, which removes the
>> extra owner reference in the memory region and causes the MR to be
>> freed right away in the main context.
>>=20
>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Message-Id: <20250410122643.1747913-3-manos.pitsidianakis@linaro.org>
>> Cc: qemu-stable@nongnu.org
>> ---
>>  hw/display/virtio-gpu-virgl.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl=
.c
>> index 71a7500de9..8fbe4e70cc 100644
>> --- a/hw/display/virtio-gpu-virgl.c
>> +++ b/hw/display/virtio-gpu-virgl.c
>> @@ -112,7 +112,7 @@ virtio_gpu_virgl_map_resource_blob(VirtIOGPU *g,
>>      vmr->g =3D g;
>>      mr =3D g_new0(MemoryRegion, 1);
>>=20=20
>> -    memory_region_init_ram_ptr(mr, OBJECT(mr), "blob", size, data);
>> +    memory_region_init_ram_ptr(mr, OBJECT(g), "blob", size, data);
>>      memory_region_add_subregion(&b->hostmem, offset, mr);
>>      memory_region_set_enabled(mr, true);
>>=20=20
>
> This change makes QEMU to crash.

What is your command line to cause the crash?

>
> AFAICT, it effectively reverts code to old bugged version [1] that was
> rejected in the past.
>
> +Akihiko Odaki
>
> [1]
> https://lore.kernel.org/qemu-devel/20230915111130.24064-10-ray.huang@amd.=
com/

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
