Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4234787lfa;
        Tue, 8 Jun 2021 02:07:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOg78/gHCKGcP4iDlYdPUqx74iagt+mYYnqDBw5TPe318ZzAis2afgHXB56AaI/0l/cSot
X-Received: by 2002:aa7:c9c5:: with SMTP id i5mr24317157edt.160.1623143240334;
        Tue, 08 Jun 2021 02:07:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623143240; cv=none;
        d=google.com; s=arc-20160816;
        b=kGSDnuYyTYh4wyttl/Y5poGABBUkgoFiwvU71L14RWQK31hnSxXvcPnhDPx8eAZIcG
         pjDVGTtKrJdG6NFKPP2ls0TV4sZY46ebf79PZGsSUQIQiQFGHRQGiSW3a5ufACb1EroR
         UzJu+IL/K9tk7H4rXgTrKanwTvBO3p0PLnJAP3qW5faTjpJfYHevgyeQVxqPNkVQC6bF
         Oj9gIjScaXP3ApP3356AUwGuxH8vemqg7dSCLvGUgpi7eSwloZe7zoqzcvAcrptWyLIa
         rgyhz5ALvMug8u7Y20BUO4XnsXZfu8sq3I3uhaOCh+9QrLTXjLvfgGYWD2CgxQT3EqTc
         cp3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=hVwGFAFFERJ2mkxTdg+lhbpFQYLK/yIsBintzYulUNY=;
        b=bVK0DLfSU1A2viTw7gH4rfONccW2A20rRTUlz0vmqPB7kg6xX3RJn5hP2Vj8PXS606
         BvO8JgwC07kUhszd3oS6BN2bA7RxPm9OftjmL7zDtgTCV9Oz+hgXv4hW6gWKJaa3Ty58
         +pzcqXpizcRdbN/VsnlMWjFYtIWQP0YEsPMDBmD3MvwJhLD3HA9jfqIRvL6KK547woUu
         AsRZLSLZ5RomgwF0tUhLVfnganTZnNy6BpuDJgFsi7tyZTCN8W7H8W69bb9hr47n558Y
         +evup9kAp5p7YyKesns1eo2fMpncb2OjIjISul5IyYW+Wj5LlV7bcMHzorh0XsADTdpg
         FODQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TxuR9Dt6;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id dj4si6572430edb.230.2021.06.08.02.07.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Jun 2021 02:07:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TxuR9Dt6;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623143239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hVwGFAFFERJ2mkxTdg+lhbpFQYLK/yIsBintzYulUNY=;
	b=TxuR9Dt6Ek4gRdwN1Tu7om8ieQDGsGnjZ5AZcfxQpzu3fSwk5TAojL3rNb1HzWeMb37BJg
	Dl8OXQ2ZBw8Qfmnvb4J4i1GGv5UdHYGupLCFKgOKOkR16ZiQLO89PIChhwvSRif+QzFJYa
	GjHXOXXg/950Dx3XhAQfyzMth/501sM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-fqTTyFGBOQyCxxo1h2AOKA-1; Tue, 08 Jun 2021 05:07:15 -0400
X-MC-Unique: fqTTyFGBOQyCxxo1h2AOKA-1
Received: by mail-wm1-f72.google.com with SMTP id n2-20020a05600c3b82b02901aeb7a4ac06so928755wms.5
        for <alex.bennee@linaro.org>; Tue, 08 Jun 2021 02:07:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hVwGFAFFERJ2mkxTdg+lhbpFQYLK/yIsBintzYulUNY=;
        b=lR8wVjMgI63Pd7hNdzFc34v0avEfYvS2CLwwvQK7iKNjGEKApXY3dhTji56FuFqPNa
         eENXIARb4Evbzyl/9Hc7Rf/TEsjnarv+lHQ+zQqZmCaoxOYGCiBldHCTvyeyj6wWjMUC
         fmy904BWKRr8X67izXCQhXZ9miGdjSbyYmyBa3olFA4eiFNAYdFMus1jzQV4VNaV6wR3
         mAIMroAIbCRp3pflhH0V3sHL2tkOOznkMiUND6FWo4Q5x2LR36CBx9vwnq5sBde6gEa8
         hFoE3/ubUF2q5dsUrK5NRVRbgDz/+4b2zIsjLS06WR0DH8asMhMRHvP1o75036xjAbg/
         Q6Dg==
X-Gm-Message-State: AOAM532emBPTh0hWBF4V0gAh62fdHrFtFhRK/N/vgpHm5tyRdNjIF3Kx
	1tTxE9mrqTFkEEWpXi963tizg7GqoblAkHyfG0EMhc7DkAZXZZd/wKm8hXZAf/kcLsXNrpVXpZa
	JgkHLgzDmLZLw40Ej
X-Received: by 2002:a7b:c19a:: with SMTP id y26mr3099696wmi.132.1623143234549;
        Tue, 08 Jun 2021 02:07:14 -0700 (PDT)
X-Received: by 2002:a7b:c19a:: with SMTP id y26mr3099684wmi.132.1623143234412;
        Tue, 08 Jun 2021 02:07:14 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
        by smtp.gmail.com with ESMTPSA id n42sm2032003wms.29.2021.06.08.02.07.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 02:07:13 -0700 (PDT)
Subject: Re: [PATCH v16 02/99] accel: Introduce 'query-accels' QMP command
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-3-alex.bennee@linaro.org>
 <14b256ef-4fc2-302c-45b1-295c26aa76ce@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <70c80ba3-e842-6a34-c9c9-8b24efef2bd7@redhat.com>
Date: Tue, 8 Jun 2021 11:07:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <14b256ef-4fc2-302c-45b1-295c26aa76ce@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: ppfkWEUFGCA4

On 6/7/21 3:07 PM, Thomas Huth wrote:
> On 04/06/2021 17.51, Alex Bennée wrote:
>> From: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
>> Introduce the 'query-accels' QMP command which returns a list
>> of built-in accelerator names.
>>
>> - Accelerator is a QAPI enum of all existing accelerators,
>>
>> - AcceleratorInfo is a QAPI structure providing accelerator
>>    specific information. Currently the common structure base
>>    provides the name of the accelerator, while the specific
>>    part is empty, but each accelerator can expand it.
>>
>> - 'query-accels' QMP command returns a list of @AcceleratorInfo
>>
>> For example on a KVM-only build we get:
>>
>>      { "execute": "query-accels" }
>>      {
>>          "return": [
>>              {
>>                  "name": "qtest"
>>              },
>>              {
>>                  "name": "kvm"
>>              }
>>          ]
>>      }
>>
>> Note that we can't make the enum values or union branches conditional
>> because of target-specific poisoning of accelerator definitions.
>>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>> Tested-by: Alex Bennée <alex.bennee@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Message-Id: <20210505125806.1263441-3-philmd@redhat.com>
>> ---
> [...]
>> +static const bool accel_builtin_list[ACCELERATOR__MAX] = {
>> +    [ACCELERATOR_QTEST] = true,
>> +#ifdef CONFIG_TCG
>> +    [ACCELERATOR_TCG] = true,
>> +#endif
>> +#ifdef CONFIG_KVM
>> +    [ACCELERATOR_KVM] = true,
>> +#endif
>> +#ifdef CONFIG_HAX
>> +    [ACCELERATOR_HAX] = true,
>> +#endif
>> +#ifdef CONFIG_HVF
>> +    [ACCELERATOR_HVF] = true,
>> +#endif
>> +#ifdef CONFIG_WHPX
>> +    [ACCELERATOR_WHPX] = true,
>> +#endif
>> +#ifdef CONFIG_XEN_BACKEND
>> +    [ACCELERATOR_XEN] = true,
>> +#endif
> 
> Nit: Use alphabetical order here, too, just like you did in the enum?

This has been drastically simplified by Markus using target-specific
machine code in v8.
