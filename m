Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3269055dye;
        Tue, 1 Jul 2025 09:12:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW7Fnf2vsE7mQwN7LlOUBd3FxmP63hl46qHQlaBpy5cbjnadNKcpHktWw5urzGE959hmu6Qsnv7++1QfQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEhKl3AkKS/2azl3HQFLk2AbSMdS1OfXfGEiJEC49JD+caAin9CWp0pwFe+jdCGYmdAdFwl
X-Received: by 2002:a05:620a:2544:b0:7d3:92bd:21b8 with SMTP id af79cd13be357-7d466dfc972mr593529585a.17.1751386366502;
        Tue, 01 Jul 2025 09:12:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751386366; cv=none;
        d=google.com; s=arc-20240605;
        b=TeP8/xGcs2Wt7/Ob7J5qwLMpUGLKnN4ztvT9Gn+wZiCpj7+zaTd5NlKnNHkFTaE/ZN
         0e2rCb6BQo5kl695gQR8+tEdpxyVZ7U9pVAsCWt8z8KRPi2YmrrJVjKh4Wvn/gSJwE3m
         9pCztBbTrYwoVNit9Z23yBe7jspYCI42A7s2P89Ww4fhq/ICFFDccpuXsJ7jCSGiUX3p
         FCmFxvz1emPXJZW8Vzs28Bndr/vicLXz+WgIZ+9YmzWN1TlMUCrKXgPJaik5imj0PIYT
         6IW6VS4kKh0bhHnxZ6fYfH3eF9GEgkwt+yu3ZSZeBLAPABosoEnW3Vy0SzGRCjWpDnrL
         2oEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=5NkSCYgm+5mmXaHIh6/iab5ImzUVQL7sPGLKwXT8E+0=;
        fh=DBBOKTSS/oz54yxKNo3vt+GxzAxkjxAciHOnoeFUqlA=;
        b=JvWuktD8VR3NTyFfsuxkEWP3gpNNLdsmG+UxDW+9gZdD/o4ztuUPmay7nFwH0i4xJ1
         o4ahqwNn4UoJ/xm3yrACK1YrJ8UfGIlb5oiwOsrHqadbNCIEe2q0ao1j2GuiiLgplFCZ
         5kIaGQeZtOx3esBz27SrpTL3bjnFB5PJfTmW5f+6JSYne4dDjldvMOvnXkq2JSeVoRcs
         b3WVKbln5eo4ppPWXugYdddNYWwAXnQMG8Cma+NFtP1soZJkSKFn0GbViNYn/3lF57sb
         OgI0czOMHe3kM3Bp8kip7wjexZDtsLW+VNGYdm18/NXaq6tArTocL/KIQ2buIaROhp9+
         1UvA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TVlc0oHo;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d4432769bcsi1106264485a.465.2025.07.01.09.12.44
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 09:12:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TVlc0oHo;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751386364;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5NkSCYgm+5mmXaHIh6/iab5ImzUVQL7sPGLKwXT8E+0=;
	b=TVlc0oHoYafhTvo06PWM96+bu3uNcUeznVcw/0Q7gORdZIgKu1D+enAsVvq80ZfW4Cb3X+
	OenZ0ZDl7rNW/z7jsmWKss1C72Q4sw580YpIyYAxn80/wCwg9hZUeW8dMQ8twZxJCcH16t
	Ctqxeaq+d7hadwQI2R8hpDDZXyAo9mg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-aAVkuoMZN8meLkcHZY3TGg-1; Tue, 01 Jul 2025 12:12:43 -0400
X-MC-Unique: aAVkuoMZN8meLkcHZY3TGg-1
X-Mimecast-MFC-AGG-ID: aAVkuoMZN8meLkcHZY3TGg_1751386362
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-451d2037f1eso20489215e9.0
        for <alex.bennee@linaro.org>; Tue, 01 Jul 2025 09:12:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751386361; x=1751991161;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5NkSCYgm+5mmXaHIh6/iab5ImzUVQL7sPGLKwXT8E+0=;
        b=FmikHAe2y/dJQdx69MjuWf5CmZ6xoJhac/B7tFIMFp63Ep+UR3OgmieHQyYc1dNog6
         yEsWzJKrXfBetTTn9hlrGm4woSFbiT2XBJ/fYn+PdPtTSr/wcyjeyMuuHApRtspqB945
         MMhx4X8r2Bo1/PVKS72Tugb4UUDs5bSXzXEoYpcrOMuWj9mJsUmooiUyQ+dtPvHwtujO
         dN5arfebTjmcV/rip2XRJXPMOMWaSPJoE0EXAP+hPCd4YyECH7z4fBxk6tfgMJcZxPiM
         ppJhi6KUeONrlf4JV+zVEaSoqn/o54VFUqArBIZexI/HPISMrdD5FUN61BeqDoT8PKUN
         f2wQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+2w9d+39hoHq7rWt5/jgFqjoBSE4pTA9mAdAngubxyt1Zq9C9GvaFnCiQluoimBOlwDvfylHV51F3Sg==@linaro.org
X-Gm-Message-State: AOJu0Yy1yySyV1hdhGhp1yKXzIOEfhTtKT8bOTePJESyWXV//xz9Nz2a
	kYDiTGh2Pk/x5yAdEoFn7KUz30GxBjQb5VQ9oj66v5vpYSFmQ+3vO+ZfJ6FUD0aiLiNk70dKuBp
	wVXV9RmCWZRwMyHXD3VgATO6oFAk5OQMRRVN0r3wGCWR837R0Wha/JXCoigJPrEa9JQ==
X-Gm-Gg: ASbGncvwa8BS9+nKEDBgdFp+rF9Tr/GKFGG74IzosBMvhrrFdsYgZp5pq975t5tpmUF
	HD2dhPRaytAnrbc8isQdk4GzjjlvHBHu318Im6Zmc4oSzeBKWpnSWvbUqiAh56R0vUpIak/8K7s
	XixIftnpiI6XHgX3OZajzg3SDunCGYEUt1TAnI3ILyLvG0YT838V5LgeNN+sto1xGYhgXeOSSbC
	7PSoKyoiNPSv/vfYi71io9FBug1B1J1O9HC0/tyu6horOKKZ7xf9yERRkSGsu9SpEJDSwA2wWdf
	8rFK8YH2tQb7KsS3yULzVbHyzLjtQWaNaNF95zKDWsEkhDhnMFeg4qoDqZqFAWSOFFdapQ==
X-Received: by 2002:a05:600c:3b22:b0:43d:77c5:9c1a with SMTP id 5b1f17b1804b1-4538ee3343dmr201835565e9.4.1751386361493;
        Tue, 01 Jul 2025 09:12:41 -0700 (PDT)
X-Received: by 2002:a05:600c:3b22:b0:43d:77c5:9c1a with SMTP id 5b1f17b1804b1-4538ee3343dmr201834985e9.4.1751386360971;
        Tue, 01 Jul 2025 09:12:40 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c1easm198790095e9.3.2025.07.01.09.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 09:12:40 -0700 (PDT)
Message-ID: <954f10cf-3de4-4067-878c-f0bb07e9dbe0@redhat.com>
Date: Tue, 1 Jul 2025 18:12:39 +0200
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
 <128e59be-4038-4a19-8cca-3be3d6446e0e@redhat.com>
 <20250701165222.0000068f@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250701165222.0000068f@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xL_wMcdPxzeOdkByGQIOmcOSxVtrNQEXBwnW5Bu8cnc_1751386362
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: vgTZ7uRfN1Qi


Hi Jonathan,
On 7/1/25 5:52 PM, Jonathan Cameron wrote:
> On Tue, 1 Jul 2025 17:34:36 +0200
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
>>>
>>> The CFMWs are placed above the extended memmap.  Note the confusing
>>> existing variable highest_gpa is the highest_gpa that has been allocated
>>> at a particular point in setting up the memory map.
>>>
>>> The cxl_devices_state.host_mr is provides a small space in which to place  
>> s/is//
> Fixed. Thanks.
>>> the individual host bridge register regions for whatever host bridges are
>>> allocated via -device pxb-cxl on the command line. The existing dynamic
>>> sysbus infrastructure is not reused because pxb-cxl is a PCI device not
>>> a sysbus one but these registers are directly in the main memory map,
>>> not the PCI address space.
>>>
>>> Only create the CEDT table if cxl=on set for the machine. Default to off.
>>>
>>> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>>> ---
>>> @@ -1895,6 +1917,9 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
>>>      if (device_memory_size > 0) {
>>>          machine_memory_devices_init(ms, device_memory_base, device_memory_size);
>>>      }
>>> +    vms->highest_gpa = cxl_fmws_set_memmap(ROUND_UP(vms->highest_gpa + 1,
>>> +                                                    256 * MiB),
>>> +                                           BIT_ULL(pa_bits)) - 1;  
>> in hw/cxl/cxl-host.c, there seems to be a loop on fw windows? I guess
>> those windows only exist if cxl option is set. In the positive,
>> highest_gpa will be changed only if the option is set, which is fine.
>> Indeed we have requested_ipa_size = 64 - clz64(vms->highest_gpa). So we
>> shall not modify this if cxl is not set.
so do you confirm highest_gpa is unchanged in case cxl/fmw option is not
set ?
>>
>> What I am a bit concerned with is that it"consumes" some high memory
>> without making it explicit in extended_memmap. Shouldn't we book some
>> dedicated space there? Sorry I am jumping very late in the review, maybe
>> turning things worse & noisy :-( Eric
> No problem with late review - whilst it looks late we had a several year
> gap at one point in updating this series!
>
> How much to book?  It's effectively infinite much like device memory.
> Would be odd to book the minimum which is 256MiB given any useful system
> is going to have a lot more than that (they are usually a few TiB but
> may be much larger than that).
>
> Would a comment after 
>    [VIRT_HIGH_PCIE_MMIO] =     { 0x0, DEFAULT_HIGH_PCIE_MMIO_SIZE }, 
> such as
>    /* Any CXL Fixed memory windows come here */
> be enough?
yes at least it deserves a comment I think. Then it must be understood
that it may prevent new regions from being added in the high mem range.
I am definitively not the most knowledgeable guy to decide whether it is
critical. I have not checked CCA impact on the layout for instance.

Thanks

Eric
>
>  
>
