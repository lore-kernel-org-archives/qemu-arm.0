Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2556557wrp;
        Mon, 23 Sep 2019 04:43:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx+SwoZEqwPGcE31kpPHM4oZZ2cYILB7OBjizveqIcmn09NuWx2QwEs8VdynZPqdFhZQTAX
X-Received: by 2002:a17:906:1f03:: with SMTP id w3mr29403008ejj.31.1569239021747;
        Mon, 23 Sep 2019 04:43:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569239021; cv=none;
        d=google.com; s=arc-20160816;
        b=mLZAZMW9uXpBnC2PWQCqfvZ+gGxqqbvOeedvQ8ROrokaGvTE+S7i88cqd3oygxh/oY
         tqKj51oswNceSbM/z4ZSvrR43oQs8HTs2xTXApRQpigY9B4PIn4hCjXbswvyfYX/T02B
         snBZ2cWOpubEOvsvAanmrczMuXjYuQHhJAPM1jFBgw1uLRyAqciGWAYmOP6fEbk54ftx
         cdc93qUoENbnHYd0IliyJLnUjN8slWjNcA9ZNuPgoMDJohu5d92q7hRBEZkw/TmGvG+A
         WxejdEmu56wCYUgrTkR5kxcv8t+T2eCKZsIalVnwE3ksmu+qOA4nyYoYEBVYo3yHCIA6
         4jMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=EiUQzn3o0By68Ijuskv0/6DFzZw2oONtzEdPGW8igjk=;
        b=boWsJVsKyzXjDZ6AM49i7ffhHgJTtOi6Wz6AjOKQtORtNswff8AaQR+IwK2pYfDLUz
         /LwWlaNIgmoFjJQaciIWF2RGrQc6d8Hc/PtYJcFPVJoZb/QIdzVRPfPsM5JEHx+kI2UR
         6DQl6gmjsZR80A85gr/EGsFiqPtjWqbfYk8DufoHqqFhjKe4TbNY7WSgoNQ9TE4SuJey
         ahPUuFrmmyj5WOXQf30qHtd9SeXExnsqR5QqvsK/UGwQIScc5wz3Cc8EjiCZm8eF+tNO
         Hwe8fD7GoFYpvGJ9P+az81B92kvQhhBbvcnFEnFfUIuESyNR7p4Y+mmSE7waBY18pRwS
         uBDg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pg17si4739082ejb.288.2019.09.23.04.43.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Sep 2019 04:43:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCMkm-0002aQ-IL
	for alex.bennee@linaro.org; Mon, 23 Sep 2019 07:43:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43468)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iCMkX-0002Xr-B9
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 07:43:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iCMkV-0002uq-7I
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 07:43:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47362)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iCMkU-0002uK-V9; Mon, 23 Sep 2019 07:43:23 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 13C7430A76BE;
 Mon, 23 Sep 2019 11:43:21 +0000 (UTC)
Received: from [10.36.116.30] (ovpn-116-30.ams2.redhat.com [10.36.116.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB3C81001947;
 Mon, 23 Sep 2019 11:43:09 +0000 (UTC)
Subject: Re: [PATCH v3 1/2] vfio: Turn the container error into an Error handle
To: Peter Xu <peterx@redhat.com>
References: <20190923065552.10602-1-eric.auger@redhat.com>
 <20190923065552.10602-2-eric.auger@redhat.com> <20190923075145.GA12806@xz-x1>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <765755f6-4447-9322-d276-567d844ed50c@redhat.com>
Date: Mon, 23 Sep 2019 13:43:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190923075145.GA12806@xz-x1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Mon, 23 Sep 2019 11:43:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, mst@redhat.com, aik@ozlabs.ru,
 qemu-devel@nongnu.org, alex.williamson@redhat.com, qemu-arm@nongnu.org,
 pbonzini@redhat.com, david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S3i64WjLUuk7

Hi Peter,

On 9/23/19 9:51 AM, Peter Xu wrote:
> On Mon, Sep 23, 2019 at 08:55:51AM +0200, Eric Auger wrote:
>> The container error integer field is currently used to store
>> the first error potentially encountered during any
>> vfio_listener_region_add() call. However this fails to propagate
>> detailed error messages up to the vfio_connect_container caller.
>> Instead of using an integer, let's use an Error handle.
>>
>> Messages are slightly reworded to accomodate the propagation.
> 
> Thanks for working on this.  Mostly good at least to me, though I
> still have a few nitpickings below.
> 
>> @@ -543,6 +545,9 @@ static void vfio_listener_region_add(MemoryListener *listener,
>>                                 hostwin->max_iova - hostwin->min_iova + 1,
>>                                 section->offset_within_address_space,
>>                                 int128_get64(section->size))) {
>> +                error_setg(&err, "Overlap with existing IOMMU range "
>> +                                 "[0x%"PRIx64",0x%"PRIx64"]", hostwin->min_iova,
>> +                                 hostwin->max_iova - hostwin->min_iova + 1);
>>                  ret = -1;
> 
> This line seems to be useless now after we dropped the integer version
> of container->error and start to use Error*.
correct
> 
>>                  goto fail;
>>              }
>> @@ -550,6 +555,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
>>  
>>          ret = vfio_spapr_create_window(container, section, &pgsize);
>>          if (ret) {
>> +            error_setg_errno(&err, -ret, "Failed to create SPAPR window");
>>              goto fail;
>>          }
>>  
>> @@ -559,7 +565,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
>>  #ifdef CONFIG_KVM
>>          if (kvm_enabled()) {
>>              VFIOGroup *group;
>> -            IOMMUMemoryRegion *iommu_mr = IOMMU_MEMORY_REGION(section->mr);
>> +            IOMMUMemoryRegion *iommu_mr = IOMMU_MEMORY_REGION(mr);
>>              struct kvm_vfio_spapr_tce param;
>>              struct kvm_device_attr attr = {
>>                  .group = KVM_DEV_VFIO_GROUP,
>> @@ -594,18 +600,17 @@ static void vfio_listener_region_add(MemoryListener *listener,
>>      }
>>  
>>      if (!hostwin_found) {
>> -        error_report("vfio: IOMMU container %p can't map guest IOVA region"
>> -                     " 0x%"HWADDR_PRIx"..0x%"HWADDR_PRIx,
>> -                     container, iova, end);
>> +        error_setg(&err, "Container %p can't map guest IOVA region"
>> +                   " 0x%"HWADDR_PRIx"..0x%"HWADDR_PRIx, container, iova, end);
>>          ret = -EFAULT;
> 
> Same here.
OK
> 
>>          goto fail;
>>      }
> 
> [...]
> 
>> @@ -688,10 +694,14 @@ fail:
>>       */
>>      if (!container->initialized) {
>>          if (!container->error) {
>> -            container->error = ret;
>> +            error_propagate_prepend(&container->error, err,
>> +                                    "Region %s: ", memory_region_name(mr));
>> +        } else {
>> +            error_free(err);
>>          }
>>      } else {
>> -        hw_error("vfio: DMA mapping failed, unable to continue");
>> +        error_reportf_err(err,
>> +                          "vfio: DMA mapping failed, unable to continue: ");
> 
> Probably need to keep hw_error() because it asserts inside.  Maybe an
> error_report_err() before hw_error()?
that's correct.
> 
>>      }
>>  }
>>  
>> @@ -1251,6 +1261,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>>      container = g_malloc0(sizeof(*container));
>>      container->space = space;
>>      container->fd = fd;
>> +    container->error = NULL;
>>      QLIST_INIT(&container->giommu_list);
>>      QLIST_INIT(&container->hostwin_list);
>>  
>> @@ -1308,9 +1319,9 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>>                                       &address_space_memory);
>>              if (container->error) {
>>                  memory_listener_unregister(&container->prereg_listener);
>> -                ret = container->error;
>> -                error_setg(errp,
>> -                    "RAM memory listener initialization failed for container");
>> +                ret = -1;
>> +                error_propagate_prepend(errp, container->error,
>> +                    "RAM memory listener initialization failed: ");
> 
> (I saw that we've got plenty of prepended prefixes for an error
>  messages.  For me I'll disgard quite a few of them because the errors
>  will directly be delivered to the top level user, but this might be
>  too personal as a comment)
That's true we have a lot of prefix messages.

The output message now is:

"vfio 0000:89:00.0: failed
to setup container for group 2: memory listener initialization failed:
Region smmuv3-iommu-memory-region-0-6: device 01.00.0 requires iommu MAP
notifier which is not currently supported"

Alex, any opinion?

Thanks

Eric


> 
> Thanks,
> 
>>                  goto free_container_exit;
>>              }
>>          }
> 
