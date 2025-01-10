Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp418913njn;
        Fri, 10 Jan 2025 12:54:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVWmplB8y1/n0AKLPLI4MED9N3BJTaemXUvkRflA7EaMkHa7miFnWJwvyizejxgal7nbI3PfIZ4F8gDAw==@linaro.org
X-Received: by 2002:a17:903:32c3:b0:216:4e9f:4ed4 with SMTP id d9443c01a7336-21a83ffbe09mr190881435ad.36.1736542462885;
        Fri, 10 Jan 2025 12:54:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736542462; cv=none;
        d=google.com; s=arc-20240605;
        b=fF0qk6OZIQrjdE9RoRq/pIrruDOt7hX/ceBj9nPPvWeJfRqnoxGWwMghuBZgKhhzWd
         4UiqtKPD+iq2zwVRCnsY3SsTtSZ3bTx4JQTiv7lXTX64Mjg9WcxOMc7cj7b9hdDMoypo
         qbw9AIFu67G6Y7gmLu8Ubr4TspcCbE2MdiM9IQTib51GX/c1mZMfn/HaWQEdorAeU7L4
         xi2y/cOQQXWqdCTWnRwYWoNcDAxS8BC47+YMRZ7c+u7SfwMmiCie7y6csBe4jg8ancg9
         LPETZ30giW6jBuhtQNxGU86sHzzZf+4prk9e21WifkIhVUTw0YJDhCTaGh+iG0OkQnUS
         kykg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=rBjVEyS8kdEWVLcyJonVubcc3foMHZv9sZlQiYhexXM=;
        fh=NXKVf+y9xpo4r5zcxBExc1+WbeJbwE0VlNwkJgCnU5g=;
        b=Ao4+C68lfWQpU4KLHE5ES0SKCY+dn1mEQ7hR8B7Kx628o1biQ6eQegytJPVZ6wA45U
         BF+gRVzOrma7/exDX9yWto6FHktzbOxOpHYtqzyO/RR4WcRvbahRLoAe/Hwaddgv93hf
         mW2n4dAqrzdvF0oct8KyO1rLt6k+lG5mR0A1LPIvWn8iCSHBLbWVD0X5uNn/LShg5J+/
         XAZ7jMiG1Ltmr4Pf4TLhRyY+8SUjQVft+xjtqBss2bPoVW/YF56TFqvjkXqfnddVy9/w
         29ioGYPL/Zzzulk13ZjnGMi3cx7y6lgK2L9Itt/pzT8derlAz12H5n9fm15tWivkBaTD
         uVgQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=abiJ7lZB;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-21a916cfbcbsor34179855ad.4.2025.01.10.12.54.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 10 Jan 2025 12:54:22 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=abiJ7lZB;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736542462; x=1737147262; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rBjVEyS8kdEWVLcyJonVubcc3foMHZv9sZlQiYhexXM=;
        b=abiJ7lZBTF0SbNki22ay0px3RGl4m9pYdxRwaeEYpg8zB+AdId2aEotlnKsGa19YJg
         0UYedCbGSmMFwCPlb0QHRnWzmtoCQiAZD7bWTm+E/JRqrH76MDsPtjz3uQzEnTN+X7Ph
         qOmmeMandkhjCKf0YMF+H3i76/wBU1PLI/pPeUSruRoVGPZjJGmyXPdmh0+dqg0xe0H3
         rmvtZasUZ4uk0DZDY29NKl9JDlwfNuIQGfATNTLp030HtlX5LC/TKCIkB7AAj54dmHuS
         V5GhQnlYmE9ZjKb0u+VIxLfL0kWol/NT9VoswTFcm5SnPrN7oWKz/wo6YPv8iOHqprqm
         hWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736542462; x=1737147262;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rBjVEyS8kdEWVLcyJonVubcc3foMHZv9sZlQiYhexXM=;
        b=mxJyfCSe73baCf92AJR9w+n5Ed4mWKDiWnkx8ggH2LSyXvLl7Zfr1d8ni3t3vrbWKj
         TvF3AAG+9DtcVBdkJ63R7c+jKPVwVWqPF4gjDnjCZV9Yvtt23NAG6J9pNriG05P4G8Ld
         aeYGaPUk3N2gUaF6Aj54X+abLrKsLnl8REUgQdDhPeFHqtOxuXxNOAOtg/sF2Bo3daR+
         OpEf4Ad0aS7mVBYAxLJWRgisYU9jHddq1KpEyqJ1+y4jpB9kfyCmQjiv4e1/wJ86pn0O
         uui3CGtgh4ZwIrYaASYRTAz9BdA12lnrNvFzg+JgkLazFt95RFPVb1UUpRU6pxC7v+Pf
         5S3A==
X-Forwarded-Encrypted: i=1; AJvYcCWZOB7BT93mNWXGjbYd9ZkAbpaB0aOW2LoNelNGzo11Ue6g2A7W6pkTX1BAw+eRyuqQwQ82kbdSdALHVw==@linaro.org
X-Gm-Message-State: AOJu0Yy1zTEw096CYSNqfsW2k7aZuJiZYOLagrH0a17FjjZg2KtE4R3G
	Fc4/WBMUuknBdCpGFrNaWxa+g7sFqC3Jns1BsRopr9juCo0DsU8qXLU05h6VYQwehjIuu4V0Jrv
	ROjNliqj4
X-Gm-Gg: ASbGncubWmFtTHWYkk/0BJ/0llMu1QjN9N6oLaZ4vlxd6GcbFCtmDoHyYR5sgKzygc/
	GZZzD5VpM+bKjFytERuIpq5S4Ja79AE2/M744FfskFU6IOM2h1fsvI+tPQ8NuMm5cmc4b3yXtPH
	GnC8rqRoN6AASA29RIwGhZmcOU538+iQxrb5ayaI/nJa086aI8ghcNnmubo+C7GfkFazigDZUrz
	XFDKqhT5RKHBRamfUCm9J+sA2fm/ZMHyZ7mt+1XIMQkca6VKdsh7P7ycR9Yait1CQ0fzg==
X-Google-Smtp-Source: AGHT+IGeEwiREsp24qovdI7wZDrWh/J8z6c+jfHejXzHqKE4eu2i823v2NS9Z3hzGCwW3CFTYhEw0w==
X-Received: by 2002:a17:902:db0e:b0:215:a57e:88e7 with SMTP id d9443c01a7336-21a83f48cd6mr173206785ad.3.1736542462138;
        Fri, 10 Jan 2025 12:54:22 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f256e44sm17215635ad.216.2025.01.10.12.54.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 12:54:21 -0800 (PST)
Message-ID: <70b28370-228d-41e6-88cd-eda686d55b21@linaro.org>
Date: Fri, 10 Jan 2025 12:54:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] docs/system/arm/virt: mention specific migration
 information
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Fabiano Rosas <farosas@suse.de>, Yanan Wang <wangyanan55@huawei.com>,
 Zhao Liu <zhao1.liu@intel.com>, qemu-arm@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, alex.bennee@linaro.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20241219183211.3493974-1-pierrick.bouvier@linaro.org>
 <20241219183211.3493974-4-pierrick.bouvier@linaro.org>
 <CAFEAcA-LYWhtFaUanq_qS8nDEVdhDOhDR2kcKv8Ch_5fKSnv-Q@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <CAFEAcA-LYWhtFaUanq_qS8nDEVdhDOhDR2kcKv8Ch_5fKSnv-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 4a5Mh4lBKzYp

On 1/10/25 08:30, Peter Maydell wrote:
> On Thu, 19 Dec 2024 at 18:32, Pierrick Bouvier
> <pierrick.bouvier@linaro.org> wrote:
>>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>   docs/system/arm/virt.rst | 14 +++++++++++---
>>   1 file changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
>> index d25275c27ce..9f1457cf9a2 100644
>> --- a/docs/system/arm/virt.rst
>> +++ b/docs/system/arm/virt.rst
>> @@ -17,9 +17,17 @@ to have the same behaviour as that of previous QEMU releases, so
>>   that VM migration will work between QEMU versions. For instance the
>>   ``virt-5.0`` machine type will behave like the ``virt`` machine from
>>   the QEMU 5.0 release, and migration should work between ``virt-5.0``
>> -of the 5.0 release and ``virt-5.0`` of the 5.1 release. Migration
>> -is not guaranteed to work between different QEMU releases for
>> -the non-versioned ``virt`` machine type.
>> +of the 5.0 release and ``virt-5.0`` of the 5.1 release.
>> +
>> +When saving a VM using the ``virt`` model, the snapshot is automatically set to
>> +target the latest ``virt`` versioned model. When loading the VM with a more
>> +recent QEMU version, you'll need to set machine model to match the version of
>> +your snapshot. When loading it, QEMU will return an error with the expected
>> +``virt`` version you should set, so you don't need to record it.
> 
> I don't think we should be encouraging this -- our standard approach
> is "use the versioned machine types if you want migration", not
> "you can start with an unversioned type on the source end". So I've
> dropped this paragraph.
> 

That's fine for me, I don't have a strong opinion on this.
I just had a (good) surprise when I saved a vm with virt machine, and 
realised it's versioned by default. It's good to know that when you 
export a virt machine, you are guaranteed it's bound to a specific 
version, so you can always load it with new QEMU versions. This is what 
I tried to express with this paragraph.

>> +
>> +VM migration is not guaranteed when using ``-cpu max``, as features supported
>> +may change between QEMU versions. To ensure your VM can be migrated, it is
>> +recommended to use another cpu model instead.
> 
> This paragraph is good, though -- that 'max' doesn't work for migration
> is important, and we should definitely document that.
> 

Agree!

> thanks
> -- PMM
