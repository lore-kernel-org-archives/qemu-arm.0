Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp454495ejc;
        Wed, 11 Oct 2023 17:18:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZ+ELrkJiQBaaPKQRbchVfI6pv0YAWwCALmn949vFglfXjDIXsBZ7Kn1wK07wsbbQgfraS
X-Received: by 2002:a05:622a:11d1:b0:418:15b9:8290 with SMTP id n17-20020a05622a11d100b0041815b98290mr28941411qtk.53.1697069910759;
        Wed, 11 Oct 2023 17:18:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697069910; cv=none;
        d=google.com; s=arc-20160816;
        b=n0mUDQxEtu5fH9vAFdr7f+ehUIwVsI8FurCpZgZb7U7ckQKGLQf5QFYFDugwCaoaQX
         QeAhAtM0TdYuVMRjnXlb9lrPUjgywEPkBSJTpM+GM+4MXtRt0+YEYA9rxdCYJ3hLLH05
         +lzGIkgfNXDr6UsDbRpar7ZXpkfjLhHf+PMhtakQokb/Em45WdpWqc84aequ5yveLHCF
         4fJRFIOaDaby4zRa6LLJ36GwgoD/QrlHfxVDoF6z8vKUQ+85MKJ3ODXZy5CRgI2x7Eeh
         JuU1r2jCM9mamXbUKpSiGJrd2BA6fUdA+1VX0zGzno+KfTQGAKhCs02I2QcxWBNGskqw
         Pa/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=sDlZjU/yvB4WX2Ore1U3k6oEDJit8P3VKDQDTSId1Z8=;
        fh=h6tbn/kBzLHF62YMUNcyJt+MJ7jOvFn2pM1Tw4ECJmI=;
        b=B5HadLuTbjyu1WwAPtMUCkbPd4Dc+/6zXJgvy6/yDOD9ApEDAVodgQRxTp64L2XanC
         G58tmhKC2nX5a+aRA5pHjxL7OzmRWzJbscDgAwPYP5mBVHDrPzldrYypqCL6xpK8Ai6O
         3CDT85HjjS7aVV7TJMf+WqupRzQx6yYavpWfCUz0hm3zeC9FQJpVft6965SYb/USjOs2
         aTStsHXXJ1PmHNVnbVyCp8ngRgLqoy41yIHYLOhGpWnSuX8hZrq0hGXGdBkyEPZ/Q89c
         prIpz2z36uZ+/0bHFSftex9Yf41U6UlihEyqCtK2MbuIXWPceam5fD+H1QtPqPsA4C3b
         7mgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WhIfsFsI;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id i4-20020ac85c04000000b004181aa26b1esi10360794qti.196.2023.10.11.17.18.30
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 17:18:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WhIfsFsI;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697069910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sDlZjU/yvB4WX2Ore1U3k6oEDJit8P3VKDQDTSId1Z8=;
	b=WhIfsFsIG04eDprlOnMarFSCwT5wBTQAxulPCGeqOrB1Cy+giCH2ZqozsFXcqjF5l7oMf0
	elTQqV7+dXiLl/lUt1zF6ekhxzZV2qkY1P6zBzdq7XUwhWpBr6xJslq6JX7oR6BTZbWUxs
	6frFKUp17CoF0mwvxQIqfjtjrsPD4HE=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213-DmTRBuPdOWK2jam3C2iz1A-1; Wed, 11 Oct 2023 20:18:28 -0400
X-MC-Unique: DmTRBuPdOWK2jam3C2iz1A-1
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-6c0f174540cso559408a34.2
        for <alex.bennee@linaro.org>; Wed, 11 Oct 2023 17:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697069908; x=1697674708;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sDlZjU/yvB4WX2Ore1U3k6oEDJit8P3VKDQDTSId1Z8=;
        b=pQ++eyQdkLzPnb4zyAfgIBRh1AGq5lnolEUA+HEeNrVf0Euny1Vqgfybsld0xKRDsG
         N5ToNqEE/Ty5kXDR+rNnrSA2XXOlfEVrLzIkr1bNWwJft/sdBjRidhI+nzZZFakviYe6
         ieqT7eVNpcQ3rcECksZ/eRS2pEHStgTzeh1MksvDtFKlTB3qO9jZqinN4Em87eQmdIXg
         Wv1jY5cHjFd8Z5c7hKsLSURfDmsnraSapg202gVYYG8KaLHoCKwM5rOt2CRcZAViRGG+
         EzqbolGk/qjD+ASXg+XJamK3po/cvA0etX/N0uC3xQnxDLWaZuGhU9vSlC/iltJNSgeD
         WsGA==
X-Gm-Message-State: AOJu0YwKm71TbF8plx+9OCX11R9+J6Ka2AUqn8aKRGkeIiQFHYBUx+72
	gzbTyXhAzqwGLwCQU7W7D1wWBqYjsm5IjcYZIyF2WHK3ZaNAwbUxiq8KjUCEJu2q7d6M/Js/J8+
	xWmvzxLWBN6Sj1xLu
X-Received: by 2002:a05:6358:7e46:b0:13c:c84b:88b9 with SMTP id p6-20020a0563587e4600b0013cc84b88b9mr16857679rwm.15.1697069908008;
        Wed, 11 Oct 2023 17:18:28 -0700 (PDT)
X-Received: by 2002:a05:6358:7e46:b0:13c:c84b:88b9 with SMTP id p6-20020a0563587e4600b0013cc84b88b9mr16857656rwm.15.1697069907655;
        Wed, 11 Oct 2023 17:18:27 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15? ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
        by smtp.gmail.com with ESMTPSA id v5-20020aa78505000000b00696ca62d5f5sm10668777pfn.8.2023.10.11.17.18.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 17:18:27 -0700 (PDT)
Message-ID: <b8c13adb-ce1e-41fc-daa0-4aa31bf5f7a0@redhat.com>
Date: Thu, 12 Oct 2023 10:18:14 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V5 8/9] physmem: Add helper function to destroy CPU
 AddressSpace
To: Salil Mehta <salil.mehta@opnsrc.net>, Salil Mehta
 <salil.mehta@huawei.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com,
 oliver.upton@linux.dev, pbonzini@redhat.com, mst@redhat.com,
 will@kernel.org, rafael@kernel.org, alex.bennee@linaro.org,
 linux@armlinux.org.uk, darren@os.amperecomputing.com,
 ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com,
 karl.heubaum@oracle.com, miguel.luis@oracle.com, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, linuxarm@huawei.com
References: <20231011194355.15628-1-salil.mehta@huawei.com>
 <20231011194355.15628-9-salil.mehta@huawei.com>
 <69098d56-8b68-2734-ef40-7338386d7fa9@redhat.com>
 <e73217f7-e6c2-81e7-0174-54ef575ebbce@opnsrc.net>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <e73217f7-e6c2-81e7-0174-54ef575ebbce@opnsrc.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: PZkIWjSwVeIk

Hi Salil,

On 10/12/23 10:04, Salil Mehta wrote:
> On 12/10/2023 00:31, Gavin Shan wrote:
>> On 10/12/23 05:43, Salil Mehta wrote:

[...]

>>> +void cpu_address_space_destroy(CPUState *cpu, int asidx)
>>> +{
>>> +    CPUAddressSpace *cpuas;
>>> +
>>> +    assert(asidx < cpu->num_ases);
>>> +    assert(asidx == 0 || !kvm_enabled());
>>> +    assert(cpu->cpu_ases);
>>> +
>>
>> The two asserts on @asidx and @cpu->cpu_ases can be combined
>> to one so that these 3 asserts can be combined to two.
>>
>>         /* Only one address space is supported by KVM */
>>         assert(asidx == 0 || !kvm_enabled());
>>         assert(asidx >= 0 && asidx < cpu->cpu_ases_count)
> 
> We can do that.
> 
> I am not in favor to remove  'assert(cpu->cpu_ases);' as this can save lot of debugging.
> 

Ok, It's fine to keep 'assert(cpu->cpu_ases)', but 'assert(asidx >= 0)' is
still needed? For example, the wrong chunk of memory will be release when
@asidx is smaller than zero, which is out-of-bound to @cpu->cpu_ases[]

Thanks,
Gavin
