Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82d75bsm1255284766b.56.2025.06.05.04.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 04:57:54 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 540E25F782;
	Thu, 05 Jun 2025 12:57:53 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org,  Sriram Yagnaraman
 <sriram.yagnaraman@ericsson.com>,  "Michael S. Tsirkin" <mst@redhat.com>,
  Dmitry Osipenko <dmitry.osipenko@collabora.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>,  John
 Snow <jsnow@redhat.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
  Pierrick Bouvier <pierrick.bouvier@linaro.org>,  Peter Xu
 <peterx@redhat.com>,  Fabiano Rosas <farosas@suse.de>,
  qemu-arm@nongnu.org,  Thomas Huth <thuth@redhat.com>,  Alexandre Iooss
 <erdnaxe@crans.org>,  Gustavo Romero <gustavo.romero@linaro.org>,  Markus
 Armbruster <armbru@redhat.com>,  David Hildenbrand <david@redhat.com>,
  Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Laurent Vivier
 <lvivier@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
  Mahmoud Mandour <ma.mandourr@gmail.com>,  Manos Pitsidianakis
 <manos.pitsidianakis@linaro.org>,  qemu-stable@nongnu.org
Subject: Re: [PATCH v4 09/17] hw/display: re-arrange memory region tracking
In-Reply-To: <1a86b86d-145a-44fc-9f87-2804767fb109@daynix.com> (Akihiko
	Odaki's message of "Thu, 5 Jun 2025 17:34:03 +0900")
References: <20250603110204.838117-1-alex.bennee@linaro.org>
	<20250603110204.838117-10-alex.bennee@linaro.org>
	<1a86b86d-145a-44fc-9f87-2804767fb109@daynix.com>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Thu, 05 Jun 2025 12:57:53 +0100
Message-ID: <87o6v2764e.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: E75hQkKaWvbt

Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> On 2025/06/03 20:01, Alex Benn=C3=A9e wrote:
>> QOM objects can be embedded in other QOM objects and managed as part
>> of their lifetime but this isn't the case for
>> virtio_gpu_virgl_hostmem_region. However before we can split it out we
>> need some other way of associating the wider data structure with the
>> memory region.
>> Fortunately MemoryRegion has an opaque pointer. This is passed down
>> to
>> MemoryRegionOps for device type regions but is unused in the
>> memory_region_init_ram_ptr() case. Use the opaque to carry the
>> reference and allow the final MemoryRegion object to be reaped when
>> its reference count is cleared.
>> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Message-Id: <20250410122643.1747913-2-manos.pitsidianakis@linaro.org>
>> Cc: qemu-stable@nongnu.org
>> ---
>>   include/system/memory.h       |  1 +
>>   hw/display/virtio-gpu-virgl.c | 23 ++++++++---------------
>>   2 files changed, 9 insertions(+), 15 deletions(-)
>> diff --git a/include/system/memory.h b/include/system/memory.h
>> index fc35a0dcad..90715ff44a 100644
>> --- a/include/system/memory.h
>> +++ b/include/system/memory.h
>> @@ -784,6 +784,7 @@ struct MemoryRegion {
>>       DeviceState *dev;
>>         const MemoryRegionOps *ops;
>> +    /* opaque data, used by backends like @ops */
>>       void *opaque;
>>       MemoryRegion *container;
>>       int mapped_via_alias; /* Mapped via an alias, container might be N=
ULL */
>> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl=
.c
>> index 145a0b3879..71a7500de9 100644
>> --- a/hw/display/virtio-gpu-virgl.c
>> +++ b/hw/display/virtio-gpu-virgl.c
>> @@ -52,17 +52,11 @@ virgl_get_egl_display(G_GNUC_UNUSED void *cookie)
>>     #if VIRGL_VERSION_MAJOR >=3D 1
>>   struct virtio_gpu_virgl_hostmem_region {
>> -    MemoryRegion mr;
>> +    MemoryRegion *mr;
>>       struct VirtIOGPU *g;
>>       bool finish_unmapping;
>>   };
>>   -static struct virtio_gpu_virgl_hostmem_region *
>> -to_hostmem_region(MemoryRegion *mr)
>> -{
>> -    return container_of(mr, struct virtio_gpu_virgl_hostmem_region, mr);
>> -}
>> -
>>   static void virtio_gpu_virgl_resume_cmdq_bh(void *opaque)
>>   {
>>       VirtIOGPU *g =3D opaque;
>> @@ -73,14 +67,12 @@ static void virtio_gpu_virgl_resume_cmdq_bh(void *op=
aque)
>>   static void virtio_gpu_virgl_hostmem_region_free(void *obj)
>>   {
>>       MemoryRegion *mr =3D MEMORY_REGION(obj);
>> -    struct virtio_gpu_virgl_hostmem_region *vmr;
>> +    struct virtio_gpu_virgl_hostmem_region *vmr =3D mr->opaque;
>>       VirtIOGPUBase *b;
>>       VirtIOGPUGL *gl;
>>   -    vmr =3D to_hostmem_region(mr);
>> -    vmr->finish_unmapping =3D true;
>> -
>>       b =3D VIRTIO_GPU_BASE(vmr->g);
>> +    vmr->finish_unmapping =3D true;
>>       b->renderer_blocked--;
>>         /*
>> @@ -118,8 +110,8 @@ virtio_gpu_virgl_map_resource_blob(VirtIOGPU *g,
>>         vmr =3D g_new0(struct virtio_gpu_virgl_hostmem_region, 1);
>>       vmr->g =3D g;
>> +    mr =3D g_new0(MemoryRegion, 1);
>
> This patch does nothing more than adding a separate allocation for
> MemoryRegion. Besides there is no corresponding g_free(). This patch
> can be simply dropped.

As the patch says the MemoryRegion is now free'd when it is
de-referenced. Do you have a test case showing it leaking?


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
