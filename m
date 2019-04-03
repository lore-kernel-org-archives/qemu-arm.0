Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp383840wrx;
        Wed, 3 Apr 2019 08:35:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx0I94BefATjgyyBvzAbXRz42lMF28okNxAUmtAK8DyIIGRql78LVv37LvcWdAKRmfk1sEL
X-Received: by 2002:a0d:e0c3:: with SMTP id j186mr20057ywe.160.1554305737945;
        Wed, 03 Apr 2019 08:35:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554305737; cv=none;
        d=google.com; s=arc-20160816;
        b=gY9tQgCMFk25v1y82cR5VppUtyA7GXh1bunJIEWAJDkEeMRV4TD6k7eDMQb2QofJ9i
         5etKvlXxSkm33AkajGyOedyLZAgsWVVs/vpVdunmF18xvG7oP8HyXTND6U19jshefrZH
         JXPnRtrQ4c/LgSV4JBRRpcjbFsAOOEpp+mgE7Cg8afAQiW9TMNYjVkW+Eq+BS+Y2XxBN
         1trQ3YaLWVrJKf7lT5gDO/bD6KH7j423lDhS/gOa8S0YVAIia5EJ8ewlov1Hn7N63ZpM
         NLlgW6EXLRlvGUVVIyv3CSeday2UD7hAmCcYIZmxHOFCHjCThfWT/y3Myc7uJ5Krep2Q
         fxOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=AGx0LRujIyvoGmL2VB/6/JggQy14uDrLxEQCX/Ntxcc=;
        b=CaqUK913gidQEERbdS6padX+XoYzRDlz14FOydGJCVIBzJZTjpPivEBIdQ6mbOHK1W
         qqELVJe2TNBKsHZzgKT9T7Ncplix/ixjUAv8hN4jhzHNNHZ+ClLJJdU71GHL7UzeOXsa
         gyYuqcwK7gTQuD1cDYr49aLcMd9yteD/dOnWZTDuZEz0UedHvIvpP4FgRj+4d+hiQlZK
         ILoZr52rQuo4y9p5hgOvvaCVnZmFykdhMjU4xBoX0jXNwOWyhGF5V9+EVZ145rytRlVG
         YbjaCxXxxY00rP+yk7dCLnthfplHRe1ECalnCDIZZ65wZRALfUBrWAvcFHQOpb9uUzxp
         iEYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s185si10609405yws.99.2019.04.03.08.35.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Apr 2019 08:35:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53614 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hBhvM-00068Z-EA
	for alex.bennee@linaro.org; Wed, 03 Apr 2019 11:35:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49746)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1hBhvA-00067p-CG
	for qemu-arm@nongnu.org; Wed, 03 Apr 2019 11:35:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1hBhv3-0000jL-9h
	for qemu-arm@nongnu.org; Wed, 03 Apr 2019 11:35:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51992)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1hBhv2-0000By-0X; Wed, 03 Apr 2019 11:35:16 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 95B50307D850;
	Wed,  3 Apr 2019 15:35:10 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-127.rdu2.redhat.com
	[10.10.120.127])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5C575173C4;
	Wed,  3 Apr 2019 15:35:07 +0000 (UTC)
To: Xiang Zheng <zhengxiang9@huawei.com>, Markus Armbruster <armbru@redhat.com>
References: <20190325125142.11628-1-zhengxiang9@huawei.com>
	<CAFEAcA-O5+A0Q=14k2vrBg3KNM7MmqbcyhBoZZOe=AsyE-UDbw@mail.gmail.com>
	<19929558-9f2d-148a-4357-d48b46f8b62b@huawei.com>
	<87va06kvm6.fsf@dusky.pond.sub.org>
	<59f100b4-f6e9-973d-532b-58fb172a7009@redhat.com>
	<87imw5fv45.fsf@dusky.pond.sub.org>
	<abe1d9cd-85bb-2ef8-630f-af28cae6378c@redhat.com>
	<8736n9eb4s.fsf@dusky.pond.sub.org>
	<bf2decd3-b3cb-08eb-3449-b66f023b084a@huawei.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <c57135ae-41a9-ed7b-976b-bf8fe43596a2@redhat.com>
Date: Wed, 3 Apr 2019 17:35:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <bf2decd3-b3cb-08eb-3449-b66f023b084a@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Wed, 03 Apr 2019 15:35:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH] hw/arm/virt: use variable
 size of flash device to save memory
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Heyi Guo <guoheyi@huawei.com>,
	wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +b3mpBsuX9IO

On 04/03/19 16:12, Xiang Zheng wrote:
> Hi Laszlo and Markus,
> 
> Thanks for your useful suggestions and comments! :)
> 
> On 2019/3/27 2:36, Markus Armbruster wrote:
>> Laszlo Ersek <lersek@redhat.com> writes:
>>
>>> On 03/26/19 17:39, Markus Armbruster wrote:
>>>> Laszlo Ersek <lersek@redhat.com> writes:
>>>
>>>>> With the dynamic sizing in QEMU (which, IIRC, I had originally
>>>>> introduced still in the 1MB times, due to the split between the
>>>>> executable and varstore parts), both the 1MB->2MB switch, and the
>>>>> 2MB->4MB switch in the firmware caused zero pain in QEMU. And right now,
>>>>> 4MB looks like a "sweet spot", with some elbow room left.
>>>>
>>>> Explicit configuration would've been exactly as painless.  Even with
>>>> pflash sizes restricted to powers of two.
>>>
>>> I wrote the patch that ended up as commit 637a5acb46b3 -- with your R-b
>>> -- in 2013. I'm unsure if machine type properties existed back then, but
>>> even if they did, do you think I knew about them? :)
>>>
>>> You are right, of course; it's just that we can't tell the future.
>>
>> True!  All we can do is continue to design as well as we can given the
>> information, experience and resources we have, and when the inevitable
>> design mistakes become apparent, limit their impact.
>>
>> Some of the things we now consider mistakes we just didn't see.  Others
>> we saw (e.g. multiple pflash devices, unlike physical hardware), but
>> underestimated their impact.
>>
> 
> I thought about your comments and wrote the following patch (just for test)
> which uses a file mapping to replace the anonymous mapping. UEFI seems to work
> fine. So why not use a file mapping to read or write a pflash device?

Honestly I can't answer "why not do this". Maybe we should.

Regarding "why not do this *exactly as shown below*" -- probably because
then we'd have updates to the same underlying regular file via both
mmap() and write(), and the interactions between those are really tricky
(= best avoided).

One of my favorite questions over the years used to be posting a matrix
of possible mmap() and file descriptor r/w/sync interactions, with the
outcomes as they were "implied" by POSIX, and then asking at the bottom,
"is my understanding correct?" I've never ever received an answer to
that. :)

Also... although we don't really use them in practice, some QCOW2
features for pflash block backends are -- or would be -- nice. (Not the
internal snapshots or the live RAM dumps, of course.)

Thanks
Laszlo

> Except this way, I don't know how to share the pflash memory among VMs or
> reduce the consumption for resource. :(
> 
> ---8>---
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index ce2664a..12c78f2 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -898,6 +898,7 @@ static void create_one_flash(const char *name, hwaddr flashbase,
>      qdev_prop_set_uint16(dev, "id2", 0x00);
>      qdev_prop_set_uint16(dev, "id3", 0x00);
>      qdev_prop_set_string(dev, "name", name);
> +    qdev_prop_set_bit(dev, "prealloc", false);
>      qdev_init_nofail(dev);
> 
>      memory_region_add_subregion(sysmem, flashbase,
> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
> index 16dfae1..23a85bc 100644
> --- a/hw/block/pflash_cfi01.c
> +++ b/hw/block/pflash_cfi01.c
> @@ -92,6 +92,7 @@ struct PFlashCFI01 {
>      void *storage;
>      VMChangeStateEntry *vmstate;
>      bool old_multiple_chip_handling;
> +    bool prealloc;
>  };
> 
>  static int pflash_post_load(void *opaque, int version_id);
> @@ -731,11 +732,21 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
>      }
>      device_len = sector_len_per_device * blocks_per_device;
> 
> -    memory_region_init_rom_device(
> -        &pfl->mem, OBJECT(dev),
> -        &pflash_cfi01_ops,
> -        pfl,
> -        pfl->name, total_len, &local_err);
> +    if (pfl->blk && !pfl->prealloc) {
> +        memory_region_init_rom_device_from_file(
> +            &pfl->mem, OBJECT(dev),
> +            &pflash_cfi01_ops,
> +            pfl,
> +            pfl->name, total_len,
> +            blk_is_read_only(pfl->blk) ? RAM_SHARED : RAM_PMEM,
> +            blk_bs(pfl->blk)->filename, &local_err);
> +    } else {
> +        memory_region_init_rom_device(
> +            &pfl->mem, OBJECT(dev),
> +            &pflash_cfi01_ops,
> +            pfl,
> +            pfl->name, total_len, &local_err);
> +    }
>      if (local_err) {
>          error_propagate(errp, local_err);
>          return;
> @@ -899,6 +910,7 @@ static Property pflash_cfi01_properties[] = {
>      DEFINE_PROP_STRING("name", PFlashCFI01, name),
>      DEFINE_PROP_BOOL("old-multiple-chip-handling", PFlashCFI01,
>                       old_multiple_chip_handling, false),
> +    DEFINE_PROP_BOOL("prealloc", PFlashCFI01, prealloc, true),
>      DEFINE_PROP_END_OF_LIST(),
>  };
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 1625913..1b16d3b 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -804,6 +804,16 @@ void memory_region_init_rom_device_nomigrate(MemoryRegion *mr,
>                                               uint64_t size,
>                                               Error **errp);
> 
> +void memory_region_init_rom_device_from_file(MemoryRegion *mr,
> +                                             struct Object *owner,
> +                                             const MemoryRegionOps *ops,
> +                                             void *opaque,
> +                                             const char *name,
> +                                             uint64_t size,
> +                                             uint32_t ram_flags,
> +                                             const char *path,
> +                                             Error **errp);
> +
>  /**
>   * memory_region_init_iommu: Initialize a memory region of a custom type
>   * that translates addresses
> diff --git a/memory.c b/memory.c
> index 9fbca52..905956b 100644
> --- a/memory.c
> +++ b/memory.c
> @@ -1719,6 +1719,36 @@ void memory_region_init_rom_device_nomigrate(MemoryRegion *mr,
>      }
>  }
> 
> +void memory_region_init_rom_device_from_file(MemoryRegion *mr,
> +                                             Object *owner,
> +                                             const MemoryRegionOps *ops,
> +                                             void *opaque,
> +                                             const char *name,
> +                                             uint64_t size,
> +                                             uint32_t ram_flags,
> +                                             const char *path,
> +                                             Error **errp)
> +{
> +    DeviceState *owner_dev;
> +    Error *err = NULL;
> +    assert(ops);
> +    memory_region_init(mr, owner, name, size);
> +    mr->ops = ops;
> +    mr->opaque = opaque;
> +    mr->terminates = true;
> +    mr->rom_device = true;
> +    mr->destructor = memory_region_destructor_ram;
> +    mr->ram_block = qemu_ram_alloc_from_file(size, mr, ram_flags, path, &err);
> +    if (err) {
> +        mr->size = int128_zero();
> +        object_unparent(OBJECT(mr));
> +        error_propagate(errp, err);
> +        return ;
> +    }
> +    owner_dev = DEVICE(owner);
> +    vmstate_register_ram(mr, owner_dev);
> +}
> +
>  void memory_region_init_iommu(void *_iommu_mr,
>                                size_t instance_size,
>                                const char *mrtypename,
> 

