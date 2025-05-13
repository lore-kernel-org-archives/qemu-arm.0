Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp592779njb;
        Tue, 13 May 2025 08:16:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCViLnFWvYlnsOen4qxvD0I7KvzpsmdbnnkmXRWybnwWgiTaHPGBP//QscOQ6wgeIZuL+DYju6H5J2gA8Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGPc+GMqKB5hBywXqUVxq5l9qJ+wYOUTGAPL1kw2jq08fHqnGfCA/bjCv8FTeITPLEONU66
X-Received: by 2002:a05:6000:2ce:b0:39a:c8a8:4fdc with SMTP id ffacd0b85a97d-3a1f6437880mr14262463f8f.16.1747149397898;
        Tue, 13 May 2025 08:16:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747149397; cv=none;
        d=google.com; s=arc-20240605;
        b=BWAF63MUIEd7VBrFDyR/onQQo7RBT7ivuIQJCK+m3Wrmew3sPzxOuYYsGphWS3q3Fu
         WBzBW7lSi+yQgXE2ANfc+zma3W17AFkOtdQ0MsMm3Jh6m4c9VFNpDeJGxANH+mRcxC5r
         4nzv5K5yRq5zSNHH+M3ARnXPlf24GnRJCI4i2qVqRcWmF6uF4MUtZBv0iyfwwUkBq/Qu
         c8GYFxmhBuc0N+vUWm2KNtNDguWSGyaMlvduIMAJ5EsJAi9BcRJbk3uxg5uOyRNa19Jk
         fgmMVtuaruB4mQhciGytgPr8lq633hHMrOy5WPuR7BlK6wG5IfVOdQTFKXSFVRDgOI8W
         aFbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=/XoJ42U2y/9zd0YP7um9oFc+AhPWl/ZEz6pZ6QwMtwA=;
        fh=SNEoNKIHlzrqDZNWkE/KXxIup6LUBTVeev3TkBzzq4c=;
        b=ORng49gq9GIx7bgXYseNGSDOMDoF57FAOxVMNNxLftM8riiS9IJFKYvf+kVkTzea3t
         8fnoFwqqMJ9Y724ZvuUent9yWuxNq1GGyb0zofupMNtiwuFGl08V0HWM8Pxx0tG3cAF5
         k8Oj+l3Kh4zvdgEm5t4k3Sff4Cy8zfArQ048Su1irReV/sRytUL105t5AWme9v7/xRTc
         v5EWfhYr6Hc4T9FHCvDbhZJ2sL57qFCP9bire9CQAAJbOUEzrXvey1lrOEg8FnY19dgL
         qgBA/oTDsMWwrxtHRCx48TGNZc8t/bXv/we1QHKaqQibqHnXb1o1gOCdg9Fha4i89sFH
         hYMw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=edVE0MQU;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a1f5a5e5dbsi7922054f8f.32.2025.05.13.08.16.37
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 08:16:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=edVE0MQU;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747149396;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/XoJ42U2y/9zd0YP7um9oFc+AhPWl/ZEz6pZ6QwMtwA=;
	b=edVE0MQUj5kIjJYyc2XBE84QUrCUI+zOi0FX+jFRPazpNOzsnL/lFzZ3I8YFYHgik/8E19
	ThGqsbf6JvLr54UgoWy5tfokiqvmgPKf5seuuZhebY7AVdZNjr40tO+IxBuIspaxQlqCC7
	sNoNmrF7lwA3XMU13mkLw4bKgFDURJo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-X0UEktQGMAyEymMSRk4Kzw-1; Tue, 13 May 2025 11:16:35 -0400
X-MC-Unique: X0UEktQGMAyEymMSRk4Kzw-1
X-Mimecast-MFC-AGG-ID: X0UEktQGMAyEymMSRk4Kzw_1747149394
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a0b7124b5fso3741070f8f.2
        for <alex.bennee@linaro.org>; Tue, 13 May 2025 08:16:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747149394; x=1747754194;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/XoJ42U2y/9zd0YP7um9oFc+AhPWl/ZEz6pZ6QwMtwA=;
        b=HUu+X+KKUJIAINCGtJHZNdnNHcBtV8pji5noZczgPQ/ORMjzusm20ds26xk0KnJ8jd
         KOhv6jAgkXwevSTySwRiA32PHfweFD6dXpPU8KXW87AVaq/ALhIvHaMVnq3BaxxSw1Eg
         hgy1+sZAhbkXbATIfaoMZlWIAPa8UK3Pd+MC43YV5SVzTL6ABWE4ZoUBYeks+OSTwpBF
         7BWC3fLSx/hUD80uFYp1Cb2FSg2ETkJvT70+6gxEhp8hep4sPPkhN4pTi4tA4r+GelsO
         MWX2ob/RUso6PCgqKWmu/f2aEBgnWsusJYUkxCm5YZjDcmgf5u0KBQtVt7nXfo12AvUR
         jkcA==
X-Forwarded-Encrypted: i=1; AJvYcCV4FQPEyPnJuxQYZTUyapjSHrCrZESQi3kObvObfTtKCOmaSatUWkSAEEWvBmKkHActP+CiElPlPrnAaw==@linaro.org
X-Gm-Message-State: AOJu0Yx5LcDe9RMmzlMHyAxITDkdzN7U7k0Zqr3C8LDxtL2VoHW2QaBD
	r9z6auYyukwpvv4iSkMrxIFBaW4IlGYcTKknxuLSWYdsq/KCr/9Qz4dmMKsMPQKdU1I1KDn4zGR
	OWDqlHrZTdLydudMbS38aEv2USEj6AzR6pyEENue2bN3c1tekFyvACA==
X-Gm-Gg: ASbGncvMmpFUN7qkZ1/6La7pRCYzDjKI7lj/jZz6r6KZurO/Wk7Zr0TqhWVN8/ViMmB
	hlCEdVSx/UJLy+wh9iIhLu1NzVWj17NgyjtyLOC1jzDK4l0s8RWYwpZlJSVPMjj5UsQCNc96s0P
	wgCAYECarEomaOl1N5EBX0dDYxH6M3f01kUPVc+Fg7MXuP8UHb6KLs9WWLJ/95xJAYvBUL6fS/b
	l9ScZlHdLjmlKC+uUVvkMOVZVK7XbDWoZ+/h76TqwFtlNTEFi4IPRU0ThLipTKWyL90YW8Cvm+Q
	ziboljv9eGbIutcilglS/OMD9VL3p5KcVWMbkatdtee/5pRb+jhLzvgnlTo=
X-Received: by 2002:a5d:598e:0:b0:39c:2688:612b with SMTP id ffacd0b85a97d-3a1f64277femr15647010f8f.7.1747149394195;
        Tue, 13 May 2025 08:16:34 -0700 (PDT)
X-Received: by 2002:a5d:598e:0:b0:39c:2688:612b with SMTP id ffacd0b85a97d-3a1f64277femr15646959f8f.7.1747149393817;
        Tue, 13 May 2025 08:16:33 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecb46sm16707990f8f.30.2025.05.13.08.16.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 08:16:33 -0700 (PDT)
Message-ID: <b62b7529-e782-41d6-91d4-c59af1b92020@redhat.com>
Date: Tue, 13 May 2025 17:16:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v3 04/10] kvm: kvm_get_writable_id_regs
To: Cornelia Huck <cohuck@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com
Cc: agraf@csgraf.de, shahuang@redhat.com, mark.rutland@arm.com,
 philmd@linaro.org, pbonzini@redhat.com
References: <20250414163849.321857-1-cohuck@redhat.com>
 <20250414163849.321857-5-cohuck@redhat.com>
 <4f370fae-8234-48ca-97e2-3b7038092974@redhat.com> <878qn0po69.fsf@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <878qn0po69.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KpGjCJIldlvCQpH6dAexafhvogvBaCJ3W7TGvsqDktY_1747149394
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: yuFrPQFy6bwj



On 5/13/25 4:42 PM, Cornelia Huck wrote:
> On Tue, May 13 2025, Eric Auger <eric.auger@redhat.com> wrote:
>
>> Hi Connie,
>>
>> On 4/14/25 6:38 PM, Cornelia Huck wrote:
>>> Add an helper to retrieve the writable id reg bitmask. The
>>> status of the query is stored in the CPU struct so that an
>>> an error, if any, can be reported on vcpu realize().
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>>> ---
>>>  target/arm/cpu.h     | 26 ++++++++++++++++++++++++++
>>>  target/arm/kvm.c     | 32 ++++++++++++++++++++++++++++++++
>>>  target/arm/kvm_arm.h |  7 +++++++
>>>  3 files changed, 65 insertions(+)
>>>
>>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>>> index d27134f4a025..bbee7ff2414a 100644
>>> --- a/target/arm/cpu.h
>>> +++ b/target/arm/cpu.h
>>> @@ -856,6 +856,26 @@ typedef struct {
>>>      uint32_t map, init, supported;
>>>  } ARMVQMap;
>>>  
>>> +typedef enum ARMIdRegsState {
>>> +    WRITABLE_ID_REGS_UNKNOWN,
>>> +    WRITABLE_ID_REGS_NOT_DISCOVERABLE,
>>> +    WRITABLE_ID_REGS_FAILED,
>>> +    WRITABLE_ID_REGS_AVAIL,
>>> +} ARMIdRegsState;
>>> +
>>> +/*
>>> + * The following structures are for the purpose of mapping the output of
>>> + * KVM_ARM_GET_REG_WRITABLE_MASKS that also may cover id registers we do
>>> + * not support in QEMU
>>> + * ID registers in op0==3, op1=={0,1,3}, crn=0, crm=={0-7}, op2=={0-7},
>>> + * as used by the KVM_ARM_GET_REG_WRITABLE_MASKS ioctl call.
>>> + */
>>> +#define NR_ID_REGS (3 * 8 * 8)
>> We may rename this define to better associate to the KVM API. I tend to
>> mix it with NUM_ID_IDX now ;-)
>> maybe something like KVM_NR_EXPOSED_ID_REGS
> The kernel calls it KVM_FEATURE_ID_RANGE_SIZE, but I'd like to avoid
> adding 'KVM' in the name, as it is basically a range of registers and
> nothing really KVM specific... maybe ID_REG_RANGE_SIZE?
what about NR_ID_REG_MASKS
because it is masks actually.
>
>>> +
>>> +typedef struct IdRegMap {
>>> +    uint64_t regs[NR_ID_REGS];
>>> +} IdRegMap;
>> I would add a comment saying this is the mask array, just to prevent the
>> reading from thinking it is the actual reg content.
> "More comments" seems to be a theme :) I'll go ahead and add them where
> it makes sense.
yeah. I am sorry. previously we had a single indexing and on top of that
we have several kinds of definitions for id regs and writable masks.
Even for me who contributed to that mess it can be difficult to parse so
I imagine it can be painful to read for other readers too ;-)

Eric
>
>>> +
>>>  /* REG is ID_XXX */
>>>  #define FIELD_DP64_IDREG(ISAR, REG, FIELD, VALUE)                       \
>>>      ({                                                                  \
>>> @@ -1044,6 +1064,12 @@ struct ArchCPU {
>>>       */
>>>      bool host_cpu_probe_failed;
>>>  
>>> +    /*
>>> +     * state of writable id regs query used to report an error, if any,
>>> +     * on KVM custom vcpu model realize
>>> +     */
>>> +    ARMIdRegsState writable_id_regs;
>> maybe rename into writable_id_reg_status that would better reflect what
>> it is.
> Indeed.
>
