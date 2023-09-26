Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp1075572ejc;
        Tue, 26 Sep 2023 06:02:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpmchw1Gz50Y0/191BLyltfadlX9UQzFha04jYlmHewCeHLJwIo/B6DoDS7J0WFfGltsoh
X-Received: by 2002:a4a:818a:0:b0:57b:6a40:8a9e with SMTP id c10-20020a4a818a000000b0057b6a408a9emr7777087oog.7.1695733347760;
        Tue, 26 Sep 2023 06:02:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695733347; cv=none;
        d=google.com; s=arc-20160816;
        b=G8I3NuQDilKLqH24vZ817zpm/HN+VbNBGUadTHS3YcY1bLe95YOOYBTRtNMhWc0SFZ
         SbeujCepVthHMheDIDkkQ3aAHcsLHSDnq1wy+0v9ps7iXwn27dX0gL/DKxOoF4wYEHwK
         5UAwRfdaGNOG4ZpwAe7GEOIyckCYOpTCGQfJdiN5xXlRU6LJTrtQ7dem8v/cGjSTlNCj
         l+aknJ//WA4lK2tb8P4EPmapyrQMy+9B3WlG8hgEjW8THuDKcaVW7SMf8NXmedQ5Yh7A
         Tn0P6kKJX4w83+vkg6FRmTTSYyY38XYVaUVrFg8NvHPSSkruU18K9dZovvolzPkhPSKZ
         fxyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=cLYH0hdKHcK02tpQjpVHA2HCpf838KhRsp6zodnoDSU=;
        fh=SWcHnUuHK2UOZxVGHzedFQMDTVUcLskSjTuJS3Hg50Y=;
        b=V0n0EqxR/eBjL4KelHtlqF7FDMRFqAikQKVaZ5sZfp/WQQ1QxnOq5V76yuoRhaiHpZ
         JMKsLwsmh/O2M6e+rchIKZxzsxXbMqp0ph+u8ZwOfaDtq/yd/Fd7wTMvbc6zMW+QpWvn
         dnTgU94jp8Pq86ksmM6q1Bp3BmWtGr8e6MvAkAPQZjCs08EeUaGjctabknKsUoj7lXIe
         Xww8TqRGxBsxjwoTM1TA0eQkVcpMGea6F1DhwuP9w7KGvj4LEBqw50kzkltT0eqT60fU
         7eYbg/grdd/5AVq3aa4O9Id9eEUCqMCUWeuHMKYACgOHbVZWZpHKOSR9ctFkTELHy48J
         kvYg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of lixianglai@loongson.cn designates 114.242.206.163 as permitted sender) smtp.mailfrom=lixianglai@loongson.cn
Return-Path: <lixianglai@loongson.cn>
Received: from mail.loongson.cn (mail.loongson.cn. [114.242.206.163])
        by mx.google.com with ESMTP id bp12-20020a056820198c00b0057b8f4831d2si3531286oob.41.2023.09.26.06.02.24;
        Tue, 26 Sep 2023 06:02:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of lixianglai@loongson.cn designates 114.242.206.163 as permitted sender) client-ip=114.242.206.163;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of lixianglai@loongson.cn designates 114.242.206.163 as permitted sender) smtp.mailfrom=lixianglai@loongson.cn
Received: from loongson.cn (unknown [10.20.42.32])
	by gateway (Coremail) with SMTP id _____8Dx_+tc1hJlm7YsAA--.19063S3;
	Tue, 26 Sep 2023 21:02:20 +0800 (CST)
Received: from [10.20.42.32] (unknown [10.20.42.32])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxPC9S1hJlrcgSAA--.1924S2;
	Tue, 26 Sep 2023 21:02:12 +0800 (CST)
Subject: Re: [PATCH RFC V2 24/37] hw/acpi: Update ACPI GED framework to
 support vCPU Hotplug
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Salil Mehta <salil.mehta@huawei.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "maz@kernel.org"
 <maz@kernel.org>, "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "andrew.jones@linux.dev" <andrew.jones@linux.dev>,
 "david@redhat.com" <david@redhat.com>, "philmd@linaro.org"
 <philmd@linaro.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "will@kernel.org" <will@kernel.org>, "ardb@kernel.org" <ardb@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "gshan@redhat.com" <gshan@redhat.com>, "rafael@kernel.org"
 <rafael@kernel.org>, "borntraeger@linux.ibm.com"
 <borntraeger@linux.ibm.com>, "alex.bennee@linaro.org"
 <alex.bennee@linaro.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
 "ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
 "vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
 "karl.heubaum@oracle.com" <karl.heubaum@oracle.com>,
 "miguel.luis@oracle.com" <miguel.luis@oracle.com>,
 "salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>,
 zhukeqian <zhukeqian1@huawei.com>,
 "wangxiongfeng (C)" <wangxiongfeng2@huawei.com>,
 "wangyanan (Y)" <wangyanan55@huawei.com>,
 "jiakernel2@gmail.com" <jiakernel2@gmail.com>,
 "maobibo@loongson.cn" <maobibo@loongson.cn>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
 <20230926100436.28284-25-salil.mehta@huawei.com>
 <20230926070112-mutt-send-email-mst@kernel.org>
 <f68a5ccc153f4971b5fbe681095a7624@huawei.com>
 <20230926075838-mutt-send-email-mst@kernel.org>
From: lixianglai <lixianglai@loongson.cn>
Message-ID: <b5d15a63-57f8-f136-827f-c0dfbd9eb6bf@loongson.cn>
Date: Tue, 26 Sep 2023 21:02:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20230926075838-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-CM-TRANSID:AQAAf8DxPC9S1hJlrcgSAA--.1924S2
X-CM-SenderInfo: 5ol0xt5qjotxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW3AFyxuF48tryDAw4xJr4xAFc_yoWxJFWrpF
	ZFqF4Y9rWDGr12ya1Iqr9IyFyDKw4UA3yxWrZIyr17KFyqgryakF10gr15WFyftr93GF4U
	ZwnIvrZa93y5tFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q
	6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUtVW8ZwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Wrv_Gr1UMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4ZqXDU
	UUU
X-TUID: socQ1fmtCVn6


Hi Michael S. Tsirkin :
> On Tue, Sep 26, 2023 at 11:37:38AM +0000, Salil Mehta wrote:
>>> From: Michael S. Tsirkin <mst@redhat.com>
>>> Sent: Tuesday, September 26, 2023 12:02 PM
>>> To: Salil Mehta <salil.mehta@huawei.com>
>>> Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org; maz@kernel.org; jean-
>>> philippe@linaro.org; Jonathan Cameron <jonathan.cameron@huawei.com>;
>>> lpieralisi@kernel.org; peter.maydell@linaro.org;
>>> richard.henderson@linaro.org; imammedo@redhat.com; andrew.jones@linux.dev;
>>> david@redhat.com; philmd@linaro.org; eric.auger@redhat.com;
>>> will@kernel.org; ardb@kernel.org; oliver.upton@linux.dev;
>>> pbonzini@redhat.com; gshan@redhat.com; rafael@kernel.org;
>>> borntraeger@linux.ibm.com; alex.bennee@linaro.org; linux@armlinux.org.uk;
>>> darren@os.amperecomputing.com; ilkka@os.amperecomputing.com;
>>> vishnu@os.amperecomputing.com; karl.heubaum@oracle.com;
>>> miguel.luis@oracle.com; salil.mehta@opnsrc.net; zhukeqian
>>> <zhukeqian1@huawei.com>; wangxiongfeng (C) <wangxiongfeng2@huawei.com>;
>>> wangyanan (Y) <wangyanan55@huawei.com>; jiakernel2@gmail.com;
>>> maobibo@loongson.cn; lixianglai@loongson.cn
>>> Subject: Re: [PATCH RFC V2 24/37] hw/acpi: Update ACPI GED framework to
>>> support vCPU Hotplug
>>>
>>> On Tue, Sep 26, 2023 at 11:04:23AM +0100, Salil Mehta wrote:
>>>> ACPI GED shall be used to convey to the guest kernel about any CPU hot-
>>> (un)plug
>>>> events. Therefore, existing ACPI GED framework inside QEMU needs to be
>>> enhanced
>>>> to support CPU hotplug state and events.
>>>>
>>>> Co-developed-by: Salil Mehta <salil.mehta@huawei.com>
>>> Co-developed with yourself?
>>>
>>> didn't you co-develop this with xianglai li?
>> No, our effort is quite old ARM patch-set existed since the year 2020
>> without any change. Please check the original patch-set here:
>>
>> https://lore.kernel.org/qemu-devel/20200613213629.21984-11-salil.mehta@huawei.com/
>>
>>
>> To be fair to the authors, it will not be right to add another SOB here.
>>
> I see. And what's the difference with patches that xianglai li posted?
> Are they both rebases of the same old patch then?
>
The two patches in front of me in the patch I sent were indeed Salil 
Mehta's patches from rebase,

which were explained in the cover letter of my patch.


I apologize for any misunderstanding this may have caused.

Thanks,

Xianglai.


>>> Just include his S.O.B then, and drop the non-standard Co-developed-by.
>> Co-developed-by Tag has been added to ensure main authors of the patch
>> get highlighted clearly.
> I think I don't know the patch provenance at this point.
>
>>>
>>>
>>>> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
>>>> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
>>>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>>>> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
>>>
>>>
>>>> ---
>>>>   hw/acpi/generic_event_device.c | 10 ++++++++++
>>>>   1 file changed, 10 insertions(+)
>>>>
>>>> diff --git a/hw/acpi/generic_event_device.c
>>> b/hw/acpi/generic_event_device.c
>>>> index ad252e6a91..0266733a54 100644
>>>> --- a/hw/acpi/generic_event_device.c
>>>> +++ b/hw/acpi/generic_event_device.c
>>>> @@ -12,6 +12,7 @@
>>>>   #include "qemu/osdep.h"
>>>>   #include "qapi/error.h"
>>>>   #include "hw/acpi/acpi.h"
>>>> +#include "hw/acpi/cpu.h"
>>>>   #include "hw/acpi/generic_event_device.h"
>>>>   #include "hw/irq.h"
>>>>   #include "hw/mem/pc-dimm.h"
>>>> @@ -239,6 +240,8 @@ static void acpi_ged_device_plug_cb(HotplugHandler
>>> *hotplug_dev,
>>>>           } else {
>>>>               acpi_memory_plug_cb(hotplug_dev, &s->memhp_state, dev,
>>> errp);
>>>>           }
>>>> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
>>>> +        acpi_cpu_plug_cb(hotplug_dev, &s->cpuhp_state, dev, errp);
>>>>       } else {
>>>>           error_setg(errp, "virt: device plug request for unsupported
>>> device"
>>>>                      " type: %s", object_get_typename(OBJECT(dev)));
>>>> @@ -253,6 +256,8 @@ static void acpi_ged_unplug_request_cb(HotplugHandler
>>> *hotplug_dev,
>>>>       if ((object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) &&
>>>>                          !(object_dynamic_cast(OBJECT(dev),
>>> TYPE_NVDIMM)))) {
>>>>           acpi_memory_unplug_request_cb(hotplug_dev, &s->memhp_state, dev,
>>> errp);
>>>> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
>>>> +        acpi_cpu_unplug_request_cb(hotplug_dev, &s->cpuhp_state, dev,
>>> errp);
>>>>       } else {
>>>>           error_setg(errp, "acpi: device unplug request for unsupported
>>> device"
>>>>                      " type: %s", object_get_typename(OBJECT(dev)));
>>>> @@ -266,6 +271,8 @@ static void acpi_ged_unplug_cb(HotplugHandler
>>> *hotplug_dev,
>>>>       if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
>>>>           acpi_memory_unplug_cb(&s->memhp_state, dev, errp);
>>>> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
>>>> +        acpi_cpu_unplug_cb(&s->cpuhp_state, dev, errp);
>>>>       } else {
>>>>           error_setg(errp, "acpi: device unplug for unsupported device"
>>>>                      " type: %s", object_get_typename(OBJECT(dev)));
>>>> @@ -277,6 +284,7 @@ static void acpi_ged_ospm_status(AcpiDeviceIf *adev,
>>> ACPIOSTInfoList ***list)
>>>>       AcpiGedState *s = ACPI_GED(adev);
>>>>
>>>>       acpi_memory_ospm_status(&s->memhp_state, list);
>>>> +    acpi_cpu_ospm_status(&s->cpuhp_state, list);
>>>>   }
>>>>
>>>>   static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits
>>> ev)
>>>> @@ -291,6 +299,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev,
>>> AcpiEventStatusBits ev)
>>>>           sel = ACPI_GED_PWR_DOWN_EVT;
>>>>       } else if (ev & ACPI_NVDIMM_HOTPLUG_STATUS) {
>>>>           sel = ACPI_GED_NVDIMM_HOTPLUG_EVT;
>>>> +    } else if (ev & ACPI_CPU_HOTPLUG_STATUS) {
>>>> +        sel = ACPI_GED_CPU_HOTPLUG_EVT;
>>>>       } else {
>>>>           /* Unknown event. Return without generating interrupt. */
>>>>           warn_report("GED: Unsupported event %d. No irq injected", ev);
>>>> --
>>>> 2.34.1
