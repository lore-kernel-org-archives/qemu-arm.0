Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp755454ejc;
        Thu, 2 Mar 2023 23:36:29 -0800 (PST)
X-Google-Smtp-Source: AK7set+xo8VgrNcEt5LSffHqmFf/l56Dxp7KHaclHlWASpbhjaHAtDy90kkm7Pc3k1bk1FwtxK92
X-Received: by 2002:a17:907:6e03:b0:888:a72f:1599 with SMTP id sd3-20020a1709076e0300b00888a72f1599mr926873ejc.11.1677828989187;
        Thu, 02 Mar 2023 23:36:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677828989; cv=none;
        d=google.com; s=arc-20160816;
        b=O/AGvfAZzXdy/4F+0Xxf14Q0RhUbBy/mlFm5ASd3q3Bf5KYKsewyiQcS1sNZEWXbdT
         fW5w+NJbXQ7/gFr5iesCGSZijZ3/5SiqfKyMHBT+LQrSoCzRJ0c6MqTvRqB3J5RqfRL2
         7ERzAebJl77NO78Qe+GulOU7OnC7G4Q1ILZKHfRlTfms3U8iUoZQuJT4LMtXZ80Jb2Ca
         uMnCsdzpeUrTj5tR0tyb6Ad3ac5R98911nVSr8AmENUHHwa5tDYoC2J0G3NufBSAD9Uz
         BJ1EHNySXF+UOfVaZ27AAdt9kFzgq2RqtYQvooM1NAhZXvj95A+kfYY6z/sH338rFAWE
         upOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=YqyFTRlmVYRz5ObkrkzuCnVGtE9KoVvtsCrfZj31l2s=;
        b=ymKGOatszbgRSHP6qUF3bUD71V52vqbxAhThVu0ArFmlod1dtAkSFzxDeJ9KBzlA5a
         ZBF/NgNoZAcvKZnp0GLHvlySgzWKhC2MvCNLD+W6ynIifBTMHiHjraNO1XBICUGofLcX
         aIorpct98DVALVI+m7wva+CH6tQ+8Io10CFpHvMwyDQsAe8qo/fNectAjzEjUSibpsAm
         XEWNmDQFDdAHDFyYL9cRcmZ+PCJJdIls+x6H/dmNjVXqpUXgAcSuBYEP6wq+KpuL2MuN
         BhrhY0zwbefexelVCtMWsifwjGiWjDt6njjNDYpYrs6LeeNVsoSmgKBtYokhJS5eQ56t
         ioQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LfRZkCUF;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id rl16-20020a170907217000b008bc4c766f92si1663658ejb.242.2023.03.02.23.36.28
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 23:36:29 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LfRZkCUF;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677828988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YqyFTRlmVYRz5ObkrkzuCnVGtE9KoVvtsCrfZj31l2s=;
	b=LfRZkCUFq0uI/+bCbo6V+7HN3ovnmk5JPSq8tZiBGGyTrQhmVqkm3te46tK7CU6vUpwUMO
	C07VRddQL/RMs6uXBLdqM5C4OiJWMuroaJZGkNmCHGeDajJFnUvieSGrkTgtiQS6NRMC2u
	HKUTB+93Uw0jlWwdJFHZnUoMz4HUaKE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-186-cjOvlx0NOyeshWqezLvNfw-1; Fri, 03 Mar 2023 02:36:26 -0500
X-MC-Unique: cjOvlx0NOyeshWqezLvNfw-1
Received: by mail-wm1-f71.google.com with SMTP id m28-20020a05600c3b1c00b003e7d4662b83so2458059wms.0
        for <alex.bennee@linaro.org>; Thu, 02 Mar 2023 23:36:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YqyFTRlmVYRz5ObkrkzuCnVGtE9KoVvtsCrfZj31l2s=;
        b=7Km2WnwXr3c+Gua+dA4DwSHe+GS+xtUtuG3JbA0nfGPQIj3bHBq8FSs6PtIzY1D1GA
         TFGLalLiLr+fwy1GQ4SzjCRnmbpbJU6Bp7GEHPONmdn1+b0CWpLQh8O9LRfFN986U25U
         7CylU3yXJqov6flw5s/eS2zc8oXnE6RG7w9yYNFFbIWPqSu8aOn/ItaYVBE+7zbKYv1v
         eUb21SBtIQNxknJPp2NUAdw2EkcsQQvn6i3s6b9LiAgkPOkkiNVK0yOySi55z/Qy8QNT
         ejHRFLwxtU0ErT5yFtnV8SX2epu5TM6XvDcK3MhekJJE8VNpoq1939w8IxhLuNSpL4NS
         QsuQ==
X-Gm-Message-State: AO0yUKU3SxxFVpm0x4FaNVG+GCr4XJ2UhhnGKGKwLAJCKx9qtGrsFv/g
	Hs1zTCbTogjqbD35BPJbTBQMPxMljtlZGpw+C7RSQkdpuwdfwlYszTo8nxPB/lxbVqfBncx/30e
	DhGeE1go2pTEixP/0
X-Received: by 2002:a5d:5544:0:b0:242:1809:7e17 with SMTP id g4-20020a5d5544000000b0024218097e17mr786025wrw.6.1677828985659;
        Thu, 02 Mar 2023 23:36:25 -0800 (PST)
X-Received: by 2002:a5d:5544:0:b0:242:1809:7e17 with SMTP id g4-20020a5d5544000000b0024218097e17mr786014wrw.6.1677828985284;
        Thu, 02 Mar 2023 23:36:25 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-176-203.web.vodafone.de. [109.43.176.203])
        by smtp.gmail.com with ESMTPSA id o16-20020a056000011000b002c703d59fa7sm1378189wrx.12.2023.03.02.23.36.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 23:36:24 -0800 (PST)
Message-ID: <29a8a698-b056-714a-3a94-c591e5b55c44@redhat.com>
Date: Fri, 3 Mar 2023 08:36:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 4/6] docs/about/deprecated: Deprecate the
 qemu-system-arm binary
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>
References: <20230302163106.465559-1-thuth@redhat.com>
 <20230302163106.465559-5-thuth@redhat.com>
 <733a61bc-0e41-a864-c7fa-f177b35afa25@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <733a61bc-0e41-a864-c7fa-f177b35afa25@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: QD2sjCM/4kZH

On 02/03/2023 23.16, Philippe Mathieu-Daudé wrote:
> On 2/3/23 17:31, Thomas Huth wrote:
>> qemu-system-aarch64 is a proper superset of qemu-system-arm,
>> and the latter was mainly still required for 32-bit KVM support.
>> But this 32-bit KVM arm support has been dropped in the Linux
>> kernel a couple of years ago already, so we don't really need
>> qemu-system-arm anymore, thus deprecated it now.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   docs/about/deprecated.rst | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>> index a30aa8dfdf..21ce70b5c9 100644
>> --- a/docs/about/deprecated.rst
>> +++ b/docs/about/deprecated.rst
>> @@ -45,6 +45,16 @@ run 32-bit guests by selecting a 32-bit CPU model, 
>> including KVM support
>>   on x86_64 hosts. Thus users are recommended to reconfigure their systems
>>   to use the ``qemu-system-x86_64`` binary instead.
>> +``qemu-system-arm`` binary (since 8.0)
>> +''''''''''''''''''''''''''''''''''''''
>> +
>> +``qemu-system-aarch64`` is a proper superset of ``qemu-system-arm``. The
>> +latter was mainly a requirement for running KVM on 32-bit arm hosts, but
>> +this 32-bit KVM support has been removed some years ago already (see:
> 
> s/some/few/?

I can also use "three years ago" since the patch had been merged in March 2020.

>> +https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=541ad0150ca4 
>>
>> +). Thus the QEMU project will drop the ``qemu-system-arm`` binary in a
>> +future release. Use ``qemu-system-aarch64`` instead.
> 
> If we unify, wouldn't it be simpler to name the single qemu-system
> binary emulating various ARM architectures as 'qemu-system-arm'?

That would be more intuitive for people who are completely new to QEMU, but 
I guess it will cause a lot of "you broke my script that uses the -aarch64 
binary" troubles again. So I think it's likely better to not go down that road.

  Thomas
