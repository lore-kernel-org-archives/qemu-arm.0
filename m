Received: by 2002:a17:906:cd17:b0:9b2:89ee:1eb8 with SMTP id oz23csp1984774ejb;
        Mon, 9 Oct 2023 06:55:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmy9f9WvosdBU0gB2gcIevlR3APD2B9F6n4/4C0NMbCGZC1ee7xkVlp2GvkIrFA4ZZcdj6
X-Received: by 2002:a05:622a:38e:b0:403:b088:5d3 with SMTP id j14-20020a05622a038e00b00403b08805d3mr16120516qtx.17.1696859732171;
        Mon, 09 Oct 2023 06:55:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696859732; cv=none;
        d=google.com; s=arc-20160816;
        b=xgvHr9zi6YjVCdEdFIF65WEjh8fNK3d1AGKlcIqcSYiLezu0SvKLgpbfKxuLxZG0wr
         vLRKcSxEG8gvmf58rN8TJTNOjUMsn73h4RcOQCL0PvUWf66ywenhXFnHv9XXA6GJyoef
         S1okI7KRPwIDlphdrd6yy8kXVrxqtPIp4UBhyoK5/UmmoF7DlIkPryucdrVATM/ThGWS
         oupiRafUCDGBS/emWIJ2gT+xWRD7slNj7eiM7NM2orQC6+d2aWN3bXOe5A/jsxPju4Gl
         61UBiWjVGnjWpXc3T64hY54V44At68opEKIL3+k2KkvbvTP2dPaxWmIikPBCRRqWresG
         +NsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:organization
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=N6twfO3yqRgTzT5YQZu6+KoQxXtSnswIhfjKrGDya4o=;
        fh=B6hYtw/BbyOqu6OjGRBKzIZ+XNWqkJzkX6KeV9DY8XU=;
        b=ZkUhG2fBciZW5/Va8EK8hWtFBz6CGprFEI7N1Zmy6x2k5wUmpfw73vwuRkAFVLgmhO
         mDojYq3pPH9RqZw1yZ3Ao4MftyQrbuNyD4i4nPDykj8km5HBbE8r8ui0pwbLjpcX18lx
         0bOtkHLOg7aPk7IxGP7U8Ln0+EjNbBfrghAKjcu2bOPGqymwZkwMWQPkNKxS2HuJtqbE
         pixZZxES5wYCacrZ4cJtL/0WOug8i/b5HLsM+CgkIfJo39/JtFvhfSDkhhzOIPnt8HGt
         3/wr7t4G9ix6DVWSbkWbtMSAVyJO0aTOODfffSQ2frOWXCRezYlHzwY0XE9UiUA+C3DA
         aRww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=as2cjMNm;
       spf=pass (google.com: domain of david@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=david@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <david@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id l17-20020a05622a175100b00419767946aasi6138748qtk.113.2023.10.09.06.55.31
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 06:55:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of david@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=as2cjMNm;
       spf=pass (google.com: domain of david@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=david@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696859731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N6twfO3yqRgTzT5YQZu6+KoQxXtSnswIhfjKrGDya4o=;
	b=as2cjMNmrYveaD0eI2eXt8wdYwq9OmPCR9sXiXMbUetH+/19CHkl8FDWIkNYtAar8WELF6
	F4TMgEwZGv1+PBH9HRi/auhE5pNI4l8htBqow0F56dRZUQRcMedofu/AdvB46ChpdLBSTa
	dV/Ljol2/YtITyvsTNlGl1kOZYJK6Ds=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-VtvOAlEEO3ezLe5ZsGycWw-1; Mon, 09 Oct 2023 09:55:25 -0400
X-MC-Unique: VtvOAlEEO3ezLe5ZsGycWw-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-406de77fb85so25277005e9.0
        for <alex.bennee@linaro.org>; Mon, 09 Oct 2023 06:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696859724; x=1697464524;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N6twfO3yqRgTzT5YQZu6+KoQxXtSnswIhfjKrGDya4o=;
        b=Cw+xqgxUi6VNoGGB1dSmsuu9k1XNQs+xqSzhERqwaMi0IpfJFg09/AOyu5KXgSEktE
         z92hC5RNeLZ4v0RrQwpXUwQRgzXGOU91HByBKHyKKCaKDK/CWi5n5AroyGbaTrfetJ0A
         rqRPt8a8pnxhNeDqcN9VuTEr3J18R/dFEl/RYd1L+gNE3zfHSSU73zfwKeRa9qYMIUmZ
         Y7P6bk6viH1sGtK2xUdCEn2Jp4F0oCm3Ad1CbGjRD/I4oNr3TY2cx+9S7X2q209y3lXM
         OkgeNCfBU4Uydjjik8nl0N9ie6IqtxkiTp26ysYzfi91tRmdJHiuzHwF6+94sjngpHtw
         oFwg==
X-Gm-Message-State: AOJu0YyC0Uv7nIG9rMn5qzCwDHBBBVC6mIakAyhjr1dnRlYYkogKbpgs
	csFOsye3sadRwRZu0bY6T6kMqi14m95a3d3eACXER+NGSBNS+q4S2CC3hSZCUA/Qu1zTbi9WyoD
	v5PQ72e09+3D27144
X-Received: by 2002:a7b:cd0a:0:b0:405:3ae6:2400 with SMTP id f10-20020a7bcd0a000000b004053ae62400mr13924603wmj.23.1696859724336;
        Mon, 09 Oct 2023 06:55:24 -0700 (PDT)
X-Received: by 2002:a7b:cd0a:0:b0:405:3ae6:2400 with SMTP id f10-20020a7bcd0a000000b004053ae62400mr13924566wmj.23.1696859723919;
        Mon, 09 Oct 2023 06:55:23 -0700 (PDT)
Return-Path: <david@redhat.com>
Received: from ?IPV6:2003:cb:c733:6400:ae10:4bb7:9712:8548? (p200300cbc7336400ae104bb797128548.dip0.t-ipconnect.de. [2003:cb:c733:6400:ae10:4bb7:9712:8548])
        by smtp.gmail.com with ESMTPSA id l17-20020a1ced11000000b0040588d85b3asm13447466wmh.15.2023.10.09.06.55.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 06:55:23 -0700 (PDT)
Message-ID: <be019441-793f-bbf1-2b7e-aa32005ead80@redhat.com>
Date: Mon, 9 Oct 2023 15:55:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V3 03/10] hw/acpi: Add ACPI CPU hotplug init stub
To: Salil Mehta <salil.mehta@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Cc: "maz@kernel.org" <maz@kernel.org>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "andrew.jones@linux.dev" <andrew.jones@linux.dev>,
 "philmd@linaro.org" <philmd@linaro.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "mst@redhat.com"
 <mst@redhat.com>, "will@kernel.org" <will@kernel.org>,
 "gshan@redhat.com" <gshan@redhat.com>, "rafael@kernel.org"
 <rafael@kernel.org>, "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
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
 "maobibo@loongson.cn" <maobibo@loongson.cn>,
 "lixianglai@loongson.cn" <lixianglai@loongson.cn>,
 Linuxarm <linuxarm@huawei.com>
References: <20231009112812.10612-1-salil.mehta@huawei.com>
 <20231009112812.10612-4-salil.mehta@huawei.com>
 <8a80612f-07d3-6302-31f9-232d9ce393a1@redhat.com>
 <08840ea0a68e46b1a9d98d1e3544f43b@huawei.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <08840ea0a68e46b1a9d98d1e3544f43b@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 6Ucbk/wRdSSC

On 09.10.23 15:49, Salil Mehta wrote:
>> From: David Hildenbrand <david@redhat.com>
>> Sent: Monday, October 9, 2023 1:23 PM
>> To: Salil Mehta <salil.mehta@huawei.com>; qemu-devel@nongnu.org; qemu-
>> arm@nongnu.org
>> Cc: maz@kernel.org; jean-philippe@linaro.org; Jonathan Cameron
>> <jonathan.cameron@huawei.com>; lpieralisi@kernel.org;
>> peter.maydell@linaro.org; richard.henderson@linaro.org;
>> imammedo@redhat.com; andrew.jones@linux.dev; philmd@linaro.org;
>> eric.auger@redhat.com; oliver.upton@linux.dev; pbonzini@redhat.com;
>> mst@redhat.com; will@kernel.org; gshan@redhat.com; rafael@kernel.org;
>> alex.bennee@linaro.org; linux@armlinux.org.uk;
>> darren@os.amperecomputing.com; ilkka@os.amperecomputing.com;
>> vishnu@os.amperecomputing.com; karl.heubaum@oracle.com;
>> miguel.luis@oracle.com; salil.mehta@opnsrc.net; zhukeqian
>> <zhukeqian1@huawei.com>; wangxiongfeng (C) <wangxiongfeng2@huawei.com>;
>> wangyanan (Y) <wangyanan55@huawei.com>; jiakernel2@gmail.com;
>> maobibo@loongson.cn; lixianglai@loongson.cn; Linuxarm <linuxarm@huawei.com>
>> Subject: Re: [PATCH V3 03/10] hw/acpi: Add ACPI CPU hotplug init stub
>>
>> On 09.10.23 13:28, Salil Mehta wrote:
>>> ACPI CPU hotplug related initialization should only happen if
>> ACPI_CPU_HOTPLUG
>>> support has been enabled for particular architecture. Add
>> cpu_hotplug_hw_init()
>>> stub to avoid compilation break.
>>>
>>> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
>>> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>>> ---
>>>    hw/acpi/acpi-cpu-hotplug-stub.c | 6 ++++++
>>>    1 file changed, 6 insertions(+)
>>>
>>> diff --git a/hw/acpi/acpi-cpu-hotplug-stub.c b/hw/acpi/acpi-cpu-hotplug-
>> stub.c
>>> index 3fc4b14c26..c6c61bb9cd 100644
>>> --- a/hw/acpi/acpi-cpu-hotplug-stub.c
>>> +++ b/hw/acpi/acpi-cpu-hotplug-stub.c
>>> @@ -19,6 +19,12 @@ void legacy_acpi_cpu_hotplug_init(MemoryRegion
>> *parent, Object *owner,
>>>        return;
>>>    }
>>>
>>> +void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
>>> +                         CPUHotplugState *state, hwaddr base_addr)
>>> +{
>>> +    return;
>>> +}
>>
>> While at it, can we prefix that function with acpi?
> 
> I can do that but it has to be done at other places as well
> such as in hw/acpi/cpu_hotplug.c <acpi_switch_to_modern_cphp()>
> 

$ git grep cpu_hotplug_hw_init
hw/acpi/cpu.c:void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
hw/acpi/cpu_hotplug.c:    cpu_hotplug_hw_init(parent, gpe_cpu->device, cpuhp_state, io_port);
include/hw/acpi/cpu.h:void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,

Might want to do that as a separate patch, agreed.

-- 
Cheers,

David / dhildenb
