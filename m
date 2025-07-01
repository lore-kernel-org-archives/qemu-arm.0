Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3223109dye;
        Tue, 1 Jul 2025 08:04:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWshXm/+UxIVVQoB5Jy64RgXEfMatFzVYatIRZImKMc05yn5N9OoWso2/09p/XDAzC9+RDtJ6ifpz0e+A==@linaro.org
X-Google-Smtp-Source: AGHT+IElltPWCVL3G3DDaJTC3NgYz/8vzWatxrKuQ3wZBXnta4gTYPl76rsTMmxx12BGTHF28C/x
X-Received: by 2002:a05:620a:17a5:b0:7d4:4b29:6eb6 with SMTP id af79cd13be357-7d44b296f09mr2062266385a.40.1751382262171;
        Tue, 01 Jul 2025 08:04:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751382262; cv=none;
        d=google.com; s=arc-20240605;
        b=asUPBnewvDC1VgvcoBq742n7XRPzSD/bMZBNuEhzme1hudvRGScWBoRD5XZJk7tfuV
         NGtNSGJjxVvirjcxyyRk/rFEzYPHGhPi6B8oW2j6MZsnZyAewMM/VPseXsibstM/vSSx
         KpFuIyPrb4aiqNcBhxJOhKM6r/mYWz6CRHa4Q9SZctB3x4uQVdgIlm889C/KbmpwjeKz
         1S5W+5oH2tACId3c10rbBBOvT8RbjbMgEAjlv6z7x2Cg9WvWhhf0iNHHKDxRyrcfbIWU
         bxrUSFxeYGZ7enL9Ueavhmz7Tt8W7FWa4bqw7a2XwrURdTQ9I+2EJFPv1hhYG2zzuHKF
         CaIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=+V26RQ9dDGQgTbpoIwnPJwm4j3M31eZGmT8jXNJ3HNY=;
        fh=16/+7WGI/KoPOIqdsoQXPkeTGnjsTrUy1KcQrqhtDxY=;
        b=azUWZ0bwcSFLtdaQRTdd/BFGB9RfxyBzLP1lG1fvchY+zT2bqdaRjhXNumCVeswm1P
         hKrUzRs3jJZA7/teRuOdKHV8hS28kmIw0ylRv9yCOHH5S9tP595VZCc3wpmu3oUXTAvP
         jx6GmK4QjaDdwMe7v+pXVn/KjfdzT2OL6Uvy7F8HIHoPWnC4w/fI3iKt0CbKYyvNAdQp
         pT4OsQCxTrA7v8HI8ZeLzzeNFxggT2j3cXKZP4QMPayAn25EMVCPT/Kat+QFgWNAqMHD
         5nMhRmtx6kPoWgN0o0A0pJ/4rRlx+F8XCwQH1DZ8c//lOd0nNonJVSQUnZ3a9drAJEJR
         uDqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Cjbrml7k;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d443225326si1003698985a.178.2025.07.01.08.04.20
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 08:04:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Cjbrml7k;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751382260;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+V26RQ9dDGQgTbpoIwnPJwm4j3M31eZGmT8jXNJ3HNY=;
	b=Cjbrml7kroYB43VdqqgzU8nXxlX1SEoBeLOG9dCLQzQnQdaMy1zvWm+l264zO3+xkkfTxG
	8oi8gG7hCD+pshcoRIAQe1NCNMXYQcyiMSENJyfWldcAw81emC7vOChW7W88W+0DDNMmPU
	WofLYguVskX7KF4dFxlBAiNg+h94YmI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-57escZZYNoSYMXCJw-57uw-1; Tue, 01 Jul 2025 11:03:59 -0400
X-MC-Unique: 57escZZYNoSYMXCJw-57uw-1
X-Mimecast-MFC-AGG-ID: 57escZZYNoSYMXCJw-57uw_1751382235
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a52bfda108so2745162f8f.3
        for <alex.bennee@linaro.org>; Tue, 01 Jul 2025 08:03:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751382235; x=1751987035;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+V26RQ9dDGQgTbpoIwnPJwm4j3M31eZGmT8jXNJ3HNY=;
        b=kVLV8u/M496sdiPZalbPr0UNODnoSLPOuhx08SjDsqaggsgORBf98s7TDvEb6HQPV/
         aQmKzCLujqVGin5XVLMiGpP5RiPn6Z4ppRa98CEF8jjbdUiUHMrk/EkUopVYvundElK9
         NEF42HdFa+2/NClgIb65J1W6W/vwW7c1TIA5UuXIwYEQysJyu9+iegs+neZOk8fEGVxd
         CQeyTx1AY7HpA+2GNJJaas2KnigdYVz1escESUsd6J6pC74uetoIEwnMOcs+46vqSylS
         Dnbm8Xyj0Ox3iNu/3Rj/SJ6C16spmi4SM4llcRXtQ4DJRAIp8a6LKPjgqB8++GP/yxdx
         Bq0A==
X-Forwarded-Encrypted: i=1; AJvYcCWi86V6gEnnnUfrHixMghfzjsoOLMhQ6+6YStMsOgT5LFinJxizFop5IwJEuP80w4SH90JLj+z8Tp425w==@linaro.org
X-Gm-Message-State: AOJu0YwSjUERl58C02V/X9dbBKfL4xL9E1OO35fVu1pwM40HqOVtd7g9
	WbWU48d76a9QY834kNdzNzuBnRYlO+8ihm6eLHD2/GJbQ1VrB+9gFm1riW+Fad8vD70fNW4yTal
	WNLnRUAIuPP+ujds/S5d43OurdzwNWQpEsSxH51HPYRwwbWC1u4EYcKsZzw==
X-Gm-Gg: ASbGncvx/8s0brCxyMLJBtgu14mN7ibc5Opn+B52k+/7yytpAn38kYfKvJOEWXK4uyd
	58Zmqfb6qbpI09GC1bELroZw7h3+FIAbHsqXx1WvMe/5wu8tdXQs8QJD8cZWsHTvJKNqinciTjU
	nI4RzhFfpFipLTW/rf+DS/HUpoOgExg3WXMTlukSJCeNLrS46rl7ap42WdxbkHIY700DMN7xlwv
	tX50sJanywiLrWOFDhEWEk5yLRkWDIU8jTOqcwKWVrUvLyGWT7QDCTgsuGJuU3qkphC6qUdGbHr
	atKOwqfz/GRE/Ni5sovsyABWpPG8ubxtiy+/+Wj0OLpnzAYqh4zrLQfvCNl2i8EUr6blBA==
X-Received: by 2002:a05:6000:4009:b0:3a8:2f65:373f with SMTP id ffacd0b85a97d-3aa9fc2002dmr14430363f8f.16.1751382234602;
        Tue, 01 Jul 2025 08:03:54 -0700 (PDT)
X-Received: by 2002:a05:6000:4009:b0:3a8:2f65:373f with SMTP id ffacd0b85a97d-3aa9fc2002dmr14430281f8f.16.1751382233984;
        Tue, 01 Jul 2025 08:03:53 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c4acsm195314915e9.1.2025.07.01.08.03.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 08:03:53 -0700 (PDT)
Message-ID: <d36b7df3-50b0-4dda-ba27-b948d8de3a20@redhat.com>
Date: Tue, 1 Jul 2025 17:03:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH qemu v16 3/5] hw/arm/virt: Basic CXL enablement on
 pci_expander_bridge instances pxb-cxl
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, Fan Ni <fan.ni@samsung.com>,
 Peter Maydell <peter.maydell@linaro.org>, mst@redhat.com,
 Zhijian Li <lizhijian@fujitsu.com>, Itaru Kitayama
 <itaru.kitayama@linux.dev>, linuxarm@huawei.com, linux-cxl@vger.kernel.org,
 qemu-arm@nongnu.org, Yuquan Wang <wangyuquan1236@phytium.com.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250625161926.549812-1-Jonathan.Cameron@huawei.com>
 <20250625161926.549812-4-Jonathan.Cameron@huawei.com>
 <4ceea721-b633-499e-9fcd-735990ee0704@redhat.com>
 <20250701154110.00007675@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250701154110.00007675@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: q3EWr4d-JjQtQPtO0F79CmON0HVLb0PnwaU9KqtvAGw_1751382235
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: nSMQnE0M+q6t

Hi Jonathan,

On 7/1/25 4:41 PM, Jonathan Cameron wrote:
> On Tue, 1 Jul 2025 15:26:26 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
>
>> Hi Jonathan,
>>
>> On 6/25/25 6:19 PM, Jonathan Cameron via wrote:
>>> Code based on i386/pc enablement.
>>> The memory layout places space for 16 host bridge register regions after
>>> the GIC_REDIST2 in the extended memmap. This is a hole in the current
>>> map so adding them here has no impact on placement of other memory regions
>>> (tested with enough CPUs for GIC_REDIST2 to be in use.)  
>> Doesn't it depend on the init RAM size setting.
>> if the init RAM top + REDIST2 aligns to a 256MB boundary (size of the
>> PCI ECAM) aren't you likely to have no hole?
> Hi Eric,
>
> Is that possible?  I think the device_memory_base being force to align
> to a 1 GiB means that never happens.  That seems to occur even
> if there is no device_memory.  
>
>     device_memory_base =
>         ROUND_UP(vms->memmap[VIRT_MEM].base + ms->ram_size, GiB);
>     device_memory_size = ms->maxram_size - ms->ram_size + ms->ram_slots * GiB;
>
>     /* Base address of the high IO region */
>     memtop = base = device_memory_base + ROUND_UP(device_memory_size, GiB);
> //So here we are GiB aligned.
Yes you are totally right, even without device memory, base is 1GiB
aligned when entering virt_set_high_memmap. I forgot this alignment
enforcement.

So we are good. Sorry for the noise

> ...
>
>     if (base < vms->memmap[VIRT_MEM].base + LEGACY_RAMLIMIT_BYTES) {
>         base = vms->memmap[VIRT_MEM].base + LEGACY_RAMLIMIT_BYTES;
>     }
>
> //That's 256 GiB in or leave it alone as more than that but GiB aligned.
>
>    /* We know for sure that at least the memory fits in the PA space */
>     vms->highest_gpa = memtop - 1;
>
>     virt_set_high_memmap(vms, base, pa_bits);
>
>
> So I think I'm fine. I should call out that REDIST2 is GiB
> aligned though in this patch description.
>>
>>> The CFMWs are placed above the extended memmap.  Note the confusing
>>> existing variable highest_gpa is the highest_gpa that has been allocated
>>> at a particular point in setting up the memory map.  
>> what kind of improvement would you foresee wrt highest_gpa?
> This was mostly a response to Peter expressed that he was expecting
> highest_gpa to reflect the limit, not the highest yet seen.
>
> I'm not sure how to resolve that without having awkward naming
> like highest_gpa_sofar. There are existing comments where it is updated
> so I'm not thinking we need to change anything for this.

OK I understand now.

Eric
>
>
> Thanks for taking a look,
>
> Jonathan
>
