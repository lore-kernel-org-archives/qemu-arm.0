Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1374550lff;
        Sun, 19 Jan 2020 02:49:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqwtm34NmfyVRnMgkMetAdnN7TzJ5ZyQyp8dDNCNeGp2x5YqWJ3RkqzzbjNVS6vmgItsIvW7
X-Received: by 2002:aa7:cd59:: with SMTP id v25mr12976317edw.137.1579430990346;
        Sun, 19 Jan 2020 02:49:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579430990; cv=none;
        d=google.com; s=arc-20160816;
        b=bvuHU6SmBgJkyX8phiInvsiCQ8JdRlTjHQzQlkBvwWVT2bEOQk4gK8CeU4M6FRK+Yp
         3sFVtSWrbYPkAEV8MWAQMhGdQclkhd5IaptNqdFLzO5bBzMcjisIXgxoQUJiQnsMCqKi
         RYlKV4UigBPqNR6xgPS5eZOcD5ew4G+dxruk8skrs2ry0hOcr174nWr7D8/3C7nSL1IM
         uHtFYVqSukl7Yh91soWr5VVySIi5v8rhTGriRgjuQqp58GT3owqHGLvxWAreTA+20N8U
         TH6e4BezraOYu3YA0axH8M2qLaCXzd6HLP+pvVhdAViwwl/iUBjZR04bvEkc+bpjHFvi
         uvLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=uZ4I75RjV0r5tZOlYSAMMyFlzeFc+kY+0C6NuGWHp8M=;
        b=DPAQB1MiABULbqPZAGfwzVjOgytV0y6xrhmkgUl0cix6C6DY+WtSD+QPMhU4A1+lNc
         fhFmJ3My4SrrXsxWvzOqmSxxFCvpobot5ZefhZEB+XfDP/rPJk1MxeMR8w4olm2HUE+e
         ke7OlUaPV+Ou7GUh6t6DZL+XghsJL344htnwrhSadkgS53TuqTXUG1gCywvrv6J3AbV3
         ytB8PlSy7KY9RlvD2bOe9XbMQRXM8qUsIXRvcoLiqtsm0p618joVQl6CggT6+pUuj6rQ
         RNijyZm3gp6xCLpJDkhqKcboKrmouTwtxZg2TmZk3guiqyfzwGhpgCOJ2x/Cveu6GkId
         7Aww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j4si19970232edy.247.2020.01.19.02.49.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 19 Jan 2020 02:49:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1it89N-0000i2-6w
	for alex.bennee@linaro.org; Sun, 19 Jan 2020 05:49:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51727)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhukeqian1@huawei.com>) id 1it89B-0000hv-VE
 for qemu-arm@nongnu.org; Sun, 19 Jan 2020 05:49:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhukeqian1@huawei.com>) id 1it899-0004X2-VK
 for qemu-arm@nongnu.org; Sun, 19 Jan 2020 05:49:37 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2687 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhukeqian1@huawei.com>)
 id 1it899-0004JR-Kq; Sun, 19 Jan 2020 05:49:35 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 02CC9994C8FC5C0F5679;
 Sun, 19 Jan 2020 18:49:24 +0800 (CST)
Received: from [127.0.0.1] (10.173.221.230) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0;
 Sun, 19 Jan 2020 18:49:17 +0800
Subject: Re: [PATCH v2] hw/arm: Adjust some coding styles about memory hotplug
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200117063822.57918-1-zhukeqian1@huawei.com>
 <CAFEAcA_Cji9poXhv1=cje3r2uwz+X_iYo8TmTxP_wP1CRV-b9g@mail.gmail.com>
From: zhukeqian <zhukeqian1@huawei.com>
Message-ID: <d7586e9c-2bad-c679-3c6a-66e07a3c6d2d@huawei.com>
Date: Sun, 19 Jan 2020 18:49:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_Cji9poXhv1=cje3r2uwz+X_iYo8TmTxP_wP1CRV-b9g@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.221.230]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm <qemu-arm@nongnu.org>, wanghaibin.wang@huawei.com,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z/QgnnZeOxGv


On 2020/1/17 19:07, Peter Maydell wrote:
> On Fri, 17 Jan 2020 at 06:41, Keqian Zhu <zhukeqian1@huawei.com> wrote:
>>
>> From: zhukeqian <zhukeqian1@huawei.com>
>>
>> There is extra indent in ACPI GED plug cb. And we can use
>> existing helper function to trigger hotplug handler plug.
>>
>> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>> ---
>>
>> v1->v2:
>>  - Add Igor's R-b
>>
>> Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> Cc: Igor Mammedov <imammedo@redhat.com>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  hw/acpi/generic_event_device.c | 2 +-
>>  hw/arm/virt.c                  | 6 +++---
>>  2 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
>> index 9cee90cc70..55eb29d80a 100644
>> --- a/hw/acpi/generic_event_device.c
>> +++ b/hw/acpi/generic_event_device.c
>> @@ -175,7 +175,7 @@ static void acpi_ged_device_plug_cb(HotplugHandler *hotplug_dev,
>>      AcpiGedState *s = ACPI_GED(hotplug_dev);
>>
>>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
>> -            acpi_memory_plug_cb(hotplug_dev, &s->memhp_state, dev, errp);
>> +        acpi_memory_plug_cb(hotplug_dev, &s->memhp_state, dev, errp);
>>      } else {
>>          error_setg(errp, "virt: device plug request for unsupported device"
>>                     " type: %s", object_get_typename(OBJECT(dev)));
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 39ab5f47e0..656b0081c2 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1934,7 +1934,6 @@ static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>>  static void virt_memory_plug(HotplugHandler *hotplug_dev,
>>                               DeviceState *dev, Error **errp)
>>  {
>> -    HotplugHandlerClass *hhc;
>>      VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
>>      Error *local_err = NULL;
>>
>> @@ -1943,8 +1942,9 @@ static void virt_memory_plug(HotplugHandler *hotplug_dev,
>>          goto out;
>>      }
>>
>> -    hhc = HOTPLUG_HANDLER_GET_CLASS(vms->acpi_dev);
>> -    hhc->plug(HOTPLUG_HANDLER(vms->acpi_dev), dev, &error_abort);
>> +    hotplug_handler_plug(HOTPLUG_HANDLER(vms->acpi_dev),
>> +                         dev, &error_abort);
>> +
>>  out:
>>      error_propagate(errp, local_err);
>>  }
> 
> These two changes are unrelated (one is just a whitespace
> fixup, and it's in an entirely different file to the other
> one, which is making an actual code change). I think they
> should not be in the same patch.
> 
> thanks
> -- PMM
> 
Ok, I will reform this patch.

Thanks,
Keqian
> .
> 

