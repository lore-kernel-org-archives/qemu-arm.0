Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp197274lfg;
        Thu, 18 Mar 2021 02:47:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3YsRq7jIYYR5NXuk71wxfxRSka/pU9OWEUW6L/n091G00DblNolb5+V0pJ7IPmBoaBoSZ
X-Received: by 2002:a17:906:e84:: with SMTP id p4mr9191636ejf.248.1616060868395;
        Thu, 18 Mar 2021 02:47:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616060868; cv=none;
        d=google.com; s=arc-20160816;
        b=PEuWyxv+18pEGvTLp9AXDpMW98prJMq3qAzEbB8Fxflm6/V77lDh1vfvmjWuL9x1jm
         gej9UyNGD94K+ywkiGMfm+wdiawrHOavymzkgkQbjwCxdPQoFBGBHmtMcBPoL0gweyFN
         uptjih+0rJxuzsUhHNK/DTMIT//zDvmAlwpCDZpoYEOLjEXFQ5/cSrp2qkUtBVjasVrY
         PUNwWi0FlCVYrQwa1ZPpU3ntYCxm9LS88a8xPnteFzKJX/gxbti6XFm2HTmIwXp2N183
         j9lmuhA0TR6BYCTMb6kHOw+G3KiLgFSHOYiOzclYQi6hK2QEMhRJCV8hZgSv4yqDcxnZ
         CCfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=JV9sqzwjuIWWkjAlPeqwh3S36d4Ez/5cA5CChM5NmGs=;
        b=oHxAMfVJX++pRFeWfKr3/zNdhfXV+AjKhPtSLQcbrcANov4VIl5pUQvrBYAyKQ59Uc
         zcGDIX9+EzC3/B2IaI2xTNcrjyhMXhM4aAreLlu8pyfUZJIgEMWK0v0ZUB2DAo7jyqsE
         cfIAGQyifkibiLXEM0cWC+AjgQheZWet9zAwzVInjvqNBpC6T6ElLZgkYx3+mW5oFfoD
         16bNogEgSpd5zayZLcMTSKjpvKvJadBIx6uDiSv8syhU/PcH+VcrqNavx+OfRpWRi16S
         iKnM63YdvzY7/4OnH37Oz7moFeqmnZs9jTVU47O25g9VEt44i+NTXBJKutyV1kYxsNnY
         m8dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="WXy/2F6+";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id de22si1116408edb.314.2021.03.18.02.47.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Mar 2021 02:47:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="WXy/2F6+";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616060867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JV9sqzwjuIWWkjAlPeqwh3S36d4Ez/5cA5CChM5NmGs=;
	b=WXy/2F6+Nusug2H55z6zyoDElVjMtuq7W7YvUnvscQ8PKxBUMyUHJgsNO047+Dnqat82lI
	pZ97Iz/PMwdlEtHuJzynHmkVCjYwatGPtrf6+PTzNlU5Cw39zXbCiVG+3mH5M5juDTAh5I
	sstE5jcpqjZbNN4/Ozt5GAiJ+NCzsnU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-dlhnMYEgOteTMWo1pR-aKw-1; Thu, 18 Mar 2021 05:47:45 -0400
X-MC-Unique: dlhnMYEgOteTMWo1pR-aKw-1
Received: by mail-wm1-f70.google.com with SMTP id s192so11563906wme.6
        for <alex.bennee@linaro.org>; Thu, 18 Mar 2021 02:47:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JV9sqzwjuIWWkjAlPeqwh3S36d4Ez/5cA5CChM5NmGs=;
        b=o8j727BHvhJ0IJv3h4hzeI4XH+YaN4afsoXpAYVdelIeSbJZ202K7xkL12dSTSt6Rr
         /zMBHETEj/vnsYlTYZ7PEatTc0bdb1uoY9eIfLo3eNoO8KCs5AwPPQj1T2nyc7dMDtw9
         ILioBHOujEUgRoHMPrO9rBlYyOzDmujESUjkhK6APUCrn50M8v6X4twRe7Lqpm0S8h2u
         QyWAj1jW+6h01ZClfSFnPR83Qi0l83FVMjRlEwqnMaSBS1OesK9ydwhBI1pxKCFpuEGL
         3z5HXk106LS4/c0pA7kzOJv6Jk8wt53HPdvPmeTwCDv30T0MMJb5MYqz94+ZgKqkAKKx
         Ytyw==
X-Gm-Message-State: AOAM53050OHpUzdUnS6gdxtA30T9pLiRGcS0ABwNEkqr/nlgz7LV3jwi
	bgNeU9U97MWjJCnZPdVF8XYD0NLu2VnE7npz1MQfHqd0KW0QZ0tJbD5Ea6WlJueUly0V2hojnzO
	lglxJiRVdDuyNkzYl
X-Received: by 2002:a1c:a5c7:: with SMTP id o190mr2809734wme.172.1616060864515;
        Thu, 18 Mar 2021 02:47:44 -0700 (PDT)
X-Received: by 2002:a1c:a5c7:: with SMTP id o190mr2809721wme.172.1616060864391;
        Thu, 18 Mar 2021 02:47:44 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net. [88.21.201.17])
        by smtp.gmail.com with ESMTPSA id i16sm4014251wmq.3.2021.03.18.02.47.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Mar 2021 02:47:43 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] target/arm: Restrict v7A TCG cpus to TCG accel
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Claudio Fontana <cfontana@suse.de>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Andrew Jones <drjones@redhat.com>
References: <20210221222617.2579610-1-f4bug@amsat.org>
 <20210221222617.2579610-4-f4bug@amsat.org>
 <c395479b-d2e0-a862-3446-4afef601ca1f@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8a302c84-b69c-b0c2-de45-607dd1f686a6@redhat.com>
Date: Thu, 18 Mar 2021 10:47:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <c395479b-d2e0-a862-3446-4afef601ca1f@suse.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: FJfHvI9lfK45

Hi Peter,

On 3/11/21 11:43 AM, Claudio Fontana wrote:
> On 2/21/21 11:26 PM, Philippe Mathieu-Daudé wrote:
>> KVM requires the target cpu to be at least ARMv8 architecture
>> (support on ARMv7 has been dropped in commit 82bf7ae84ce:
>> "target/arm: Remove KVM support for 32-bit Arm hosts").
>>
>> A KVM-only build won't be able to run TCG cpus, move the
>> v7A CPU definitions to cpu_tcg.c.
>>
>> Reported-by: Peter Maydell <peter.maydell@linaro.org>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> 
> Here I think it's better to keep the "a15" cpu around,
> until we fix the board configuration situation.
> 
> I added a patch that does that into my KVM-only build series, to avoid the resulting breakages.

Actually I got a downstream report that this break migration from QEMU
5.2 to QEMU 6.0.

I first thought it was on an old kernel (with 32-bit KVM enabled),
but not, it is for Aarch64 VMs on recent KVM (without 32-bit support)
but the 'virt' machines were started with default Cortex-A15 CPU...

    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");

I'm not sure upstream should care about this case, but I though
maybe you could give me hints about the best way to keep old VMs
working, as this likely affects any distribution. Obviously not
upgrading QEMU is not a solution :)

The simplest seems to revert 82bf7ae84ce and this patch, but I
doubt this will be enough.

Maybe there is some clever thing to do before reverting 82bf7ae84ce,
that could also benefit upstream, by doing something with versioned
machines? I have no idea (yet) how that work and if it could work.

Thanks,

Phil.
