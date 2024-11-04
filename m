Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2210091njc;
        Mon, 4 Nov 2024 07:53:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXzWK9hoSQnjZeTSNK157/GGzM3sRbELu63FvPKOw49AhXc242I8N0XjHcJimyaUL8A60lxUV/xyLn0Rg==@linaro.org
X-Google-Smtp-Source: AGHT+IF146eEt/xbjZj8W69zreQRlQXmLLe+r+Tc9tPWj8a+CF9LLV7lQj/htNVFd5a7rMsUCaX5
X-Received: by 2002:a05:6102:3594:b0:4a4:8651:3c3f with SMTP id ada2fe7eead31-4a956b0ecb4mr11339478137.0.1730735581239;
        Mon, 04 Nov 2024 07:53:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730735581; cv=none;
        d=google.com; s=arc-20240605;
        b=Z6a8p7u1VlfzIsf3IfndmUijmBPn5SN/ei3J4QGySi8ATnoTkkhMCC0x9qtTOrDhqO
         NC5yByJE4OUv32MOAx19u9DECbM4RkONQP1E9pelGDz1ZTaaWZNOL29BiHPiSY1Rjao9
         CT6MFC85rIg2QPM6BmOnC3t2S/mtBZuyKOuqsufYvaLz5uzE/L/KJPCObqGbOgGAZxXR
         GDlxZREjQFWe9nnwwwjg+OXS794FveuToPp+XIBZyNZA/7rVPThRabl7O+oKywDNJCKB
         lDOHZv/l/fcbDV3cPH+ndQvM/s7S5dxeNOzS/6YbPOIV5WATS757mykuLZGfzOeCblts
         RKDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=7mUA65axYf94RHzQ+FsEaE5eP349wKq6vreKY/gkmjE=;
        fh=eOG3v5cl5vc5sYq+sq+pWJNIuw/B2LPswfZS4OfADRo=;
        b=EIFKqE2/ZexADfr0cUB6OJgXFDePq+dGj09vGes85hsiWGIX4YBbSFyFeotYScpBpP
         XtF1uFeEjvv0aqDp0dJ0I0CP74RMS4VpUXYjkEERHRWDdwBQTxuFwBDMBLt3esldG83/
         1aq6HoUdlaTjnvlSD0heFMUnyLhsUDfJJK5Y1VZEiifO6PaIA6TRsr7ur9SyJht1i2lq
         cD0LuDsxJ3SvvRGxc5Smg2TCU8m1KZM8J5gfoX8xb+MIIIE3anb8M6ibhe80Fi5/MTlG
         N1efXOcjMPoyY1n3DLKl4ogiid6XUUBuyMzy72/xkSXRM1Rcqt/lvV69tDodWQwfFTAJ
         dbpA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="L5V/tJN6";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ada2fe7eead31-4a957531436si2276379137.284.2024.11.04.07.53.01
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 07:53:01 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="L5V/tJN6";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730735580;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7mUA65axYf94RHzQ+FsEaE5eP349wKq6vreKY/gkmjE=;
	b=L5V/tJN6XNTAAMzg8dyia4u6KLrGPMOuSRtmXVlnCnNH1cmlvwScVKMltjBJUtWukzFISm
	sIhvuhqeKUN/r7jnLBMjC9btfW4SJxO8ou73MilazJFJmrcjvRY8s8HdHWGyfFWF9qrDNP
	npQcpfl+IoFFMieK3SMn5YpqSfoD5+0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-3KEzPQTLNuC92eT_YkGCgw-1; Mon, 04 Nov 2024 10:52:59 -0500
X-MC-Unique: 3KEzPQTLNuC92eT_YkGCgw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-431673032e6so26534505e9.0
        for <alex.bennee@linaro.org>; Mon, 04 Nov 2024 07:52:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730735578; x=1731340378;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7mUA65axYf94RHzQ+FsEaE5eP349wKq6vreKY/gkmjE=;
        b=v7oo7nSgJcHV+CLUSWk12Kp22IeU0twgisEA4yCr30+lsiJKP+aK2gc59lF7pXR56E
         +qz8R++0SZuGlQKVOPSnOBFWxHFqZuaQ1PfMZ9iZrpZcXSybMtfEzMciQtj7TixtTDi4
         D+LWnvNcTejuwdjjgeGORt1f0fZdlrLFCZ2qoRbE6m+N2apq9DuVS43yW+25Q2KUzYHj
         eBRVfKLM+O+6Mjw3x8oDn5pgMdBmvNeUzvljBuMZ+JOlhWxf2JOezkt9jvjEdjwngsK1
         lpUrQKaUcj74kgkARWNygXHVBLir8PXo4+LmA8Vt3TYleIE4+QpLzHdKqWg8DKDRkRQC
         6RlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXw0G62exT74h9zIpVAzN9LQHFsGjQBu36Fbx2PC2Ec+hzKDO2srx3lG9lNSeDnfGthO4M2lZzzlrFSZg==@linaro.org
X-Gm-Message-State: AOJu0Yw6PDiJUq/JlHFQh24GVVdLjoiXNkfnyyqvx7aaTygILSmb0IXn
	O8w1vrqsIeYxW4Lk/VZ+9BGZ/LMXWk5phS4zRoLDo+EX7vhroOaJYJdWsydrBV/qN4fKlBSrBy7
	nqBEypS8V/WMRxX0Lw6ZBE8wCwbpFU8gq2evfAs1pTsE0fol5F6btvvDTLXZoxA==
X-Received: by 2002:a05:600c:a01:b0:42c:ba83:3f01 with SMTP id 5b1f17b1804b1-431bb984e8cmr179170775e9.8.1730735577942;
        Mon, 04 Nov 2024 07:52:57 -0800 (PST)
X-Received: by 2002:a05:600c:a01:b0:42c:ba83:3f01 with SMTP id 5b1f17b1804b1-431bb984e8cmr179170445e9.8.1730735577520;
        Mon, 04 Nov 2024 07:52:57 -0800 (PST)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d698144sm162050515e9.39.2024.11.04.07.52.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 07:52:56 -0800 (PST)
Message-ID: <0007b45a-0278-4dad-8b8f-a65bd0506dc2@redhat.com>
Date: Mon, 4 Nov 2024 16:52:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [RFC 00/21] kvm/arm: Introduce a customizable aarch64 KVM host
 model
To: Kashyap Chamarthy <kchamart@redhat.com>
Cc: eric.auger.pro@gmail.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev, peter.maydell@linaro.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 oliver.upton@linux.dev, sebott@redhat.com,
 shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
 shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
 pbonzini@redhat.com
References: <20241025101959.601048-1-eric.auger@redhat.com>
 <ZxuwZw2plMI6dNyE@pinwheel>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <ZxuwZw2plMI6dNyE@pinwheel>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: 3G+jLRiMvOpc

Hi Kashyap,
On 10/25/24 16:51, Kashyap Chamarthy wrote:
> On Fri, Oct 25, 2024 at 12:17:19PM +0200, Eric Auger wrote:
>
> Hi Eric,
>
> I'm new to Arm, so please bear with my questions :)
>
>> This RFC series introduces a KVM host "custom" model.
> (a) On terminology: as we know, in the x86 world, QEMU uses these
>     terms[1]:
>
>     - Host passthrough
>     - Named CPU models
>     - Then there's the libvirt abstraction, "host-model", that aims to
>       provide the best of 'host-passthrough' + named CPU models.
>
>     Now I see the term "host 'custom' model" here.  Most
>     management-layer tools and libvirt users are familiar with the
>     classic terms "host-model" or "custom".  If we now say "host
>     'custom' model", it can create confusion.  I hope we can settle on
>     one of the existing terms, or create a new term if need be.
>
>     (I'll share one more thought on how layers above libvirt tend to use
>     the term "custom", as a reply to patch 21/21, "arm/cpu-features:
>     Document custom vcpu model".)
agreed, as replied earlier, custom terminology most probably will be
dropped.
>
> (b) The current CPU features doc[2] for Arm doesn't mention "host
>     passthrough" at all.  It is only implied by the last part of this
>     paragraph, from the section titled "A note about CPU models and
>     KVM"[3]:
>
>       "Named CPU models generally do not work with KVM. There are a few
>       cases that do work [...] but mostly if KVM is enabled the 'host'
>       CPU type must be used."
indeed
>
>     Related: in your reply[4] to Dan in this series, you write: "Having
>     named models is the next thing".  So named CPU models will be a
>     thing in Arm, too?  Then the above statement in the Arm
>     'cpu-features' will need updating :-)

Yes named models implementing a baseline are the end goal.
>
> [...]
>
>> - the QEMU layer does not take care of IDREG field value consistency.
>>   The kernel neither. I imagine this could be the role of the upper
>>   layer to implement a vcpu profile that makes sure settings are
>>   consistent. Here we come to "named" models. What should they look
>>   like on ARM?
> Are there reasons why they can't be similar to how x86 reports in
> `qemu-system-x86 -cpu help`?  
>
> E.g. If it's an NVIDIA "Grace A02" (Neoverse-V2) host, it can report:
>
>     [gracehopper] $> qemu-kvm -cpu help
>     Available CPUs:
>       gracehopper-neoverse-v2
>       cortex-a57 (deprecated)
>       host
>       max
>
> Or whatever is the preferred nomenclature for ARM.  It also gives users
> of both x86 and ARM deployments a consistent expectation.  
>
> Currently on a "Grace A02" ("Neoverse-V2") machine, it reports:
>
>     [gracehopper] $> qemu-kvm -cpu help
>     Available CPUs:
>       cortex-a57 (deprecated)
>       host
>       max
>
> I see it's because there are no named models yet on ARM :-)
yes this is definitively because on ARM there is no such named KVM model
besides cortex-a57 on aarch64.
on x86 does it return the closest named model?

Thanks

Eric
>
> [...]
>
> [1] https://www.qemu.org/docs/master/system/i386/cpu.html
> [2] https://www.qemu.org/docs/master/system/arm/cpu-features.html
> [3] https://www.qemu.org/docs/master/system/arm/cpu-features.html#a-note-about-cpu-models-and-kvm
> [4] https://lists.nongnu.org/archive/html/qemu-arm/2024-10/msg00891.html
>
>
