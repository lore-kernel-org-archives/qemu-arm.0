Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5004368ejc;
        Mon, 27 Feb 2023 12:25:59 -0800 (PST)
X-Received: by 2002:a17:902:d709:b0:19c:ac96:1f5b with SMTP id w9-20020a170902d70900b0019cac961f5bmr48157ply.69.1677529559077;
        Mon, 27 Feb 2023 12:25:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677529559; cv=none;
        d=google.com; s=arc-20160816;
        b=jDrz01GUD8MP+5UbMQZt545+eQeeA96J1zQE6EZses3uwsIbgphYRQZTG4rwsePlQB
         82mVcRr+4Rxav1frrcVs/s2cbzS6KWlihP3r3Fx/mSq8TAYvX84T9xDAhYT6gb3k5Fkh
         PCx0eqNeJxs+vtOJNN2tbpKLlJsEu4hOrifq28uZt2KnlVxDUZAj20/Uslfia/RaoeCX
         BtPotVVNxfaRNO4udX00IgPcSrK31VV6h7Dj0xXdGpI9J9Yl6ZZgX+glBX5J78C/ec+3
         /zAj01G5Qy2OBhSuLBQMfScciU/fSINrlfz+fnP1iv9DoqtLGDdRfWskhpHZZ55tYGX5
         C8rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=BDeTj+J/22nMN720Gd3H2ETn00LmeBnchjc/wTnuog4=;
        b=L7In0ksVKP+8R/EEdJCqxg2m34cL/fWrHeU3Wb4d0luQNCL203O4iYmyfhp8GFvjrr
         mj29WaeRO6fo7C9R1LVdDlzJVZoCsc1a2KuCE66qXxkCzmGH80hHST8xWNOd2cHhbuGq
         kC7vJoSNm97ukiM7of3FNnYUQuqLiC+tKwT70iPvM9lc17XqYT9oRGrKF5S8ouLjjDA1
         wl42qbZdJZIybePpQc2pR9bHmWkO/ypAqzEZAqduNbjJR5gkTFonKr+9FGaDqNOfDWO/
         eOPZbM/2KNXCYyAuA4mWKAZlUoN4iuo68IBtE8XudNxO0Nm4NEsA2BqmH+ETUg8t3JA2
         z6ZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EAObgI2q;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id iy7-20020a170903130700b0019a826eea42sor2566975plb.198.2023.02.27.12.25.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 27 Feb 2023 12:25:59 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EAObgI2q;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BDeTj+J/22nMN720Gd3H2ETn00LmeBnchjc/wTnuog4=;
        b=EAObgI2qw74QHK+8hCkJz8AvIZZmBITIs/sYHA2Qlf0q57YpW/Dr7gUvwprNjgNAnn
         +tZotGe5/JI1mPTPCJRpK+sqr0VoxX5Fku22esRricaGbqDFSpqFRXKVIgNYAn9GkliW
         Oe9Dd22bF8X6W/0QHVVxzkPE/gHx6X2a8hxSBtmETuGQy4yQwP3yCW0Mo8hDvw6jVxbV
         Y2vIwM86mBNextdY4sttG0Wg+S3PF5SIwSirMluiN6LKsNGk1lNme2RkHCwC52QuLArf
         e9Xg5/aHPVqv6xyuWlZ0ByeYLl2EhBxOKbUv7CiCsssKfSyeLgGpXX5AfBheNrx1RH5D
         QWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BDeTj+J/22nMN720Gd3H2ETn00LmeBnchjc/wTnuog4=;
        b=UOBmEYsQ2mCPSgvXeki7IH47RcX3c9AGLNisn3fog/8aGBtObH0R/lTmh5zdx1zgtU
         nHDzHv0ChzXGwqyjBr19mye7+/3nqHw1QdFyn0VB7WFoS6kCuyDREh8cFgJQfgsdirGs
         uJ2jtP3iG/TekZLMElxkE2DYZA7Rje/1VnYE7nNdJu+F/lJvLia2h9j46RBhEFO7BClw
         FZaOIBk0w6Ljnhdq4LVOc2fVsGV8V3Yqj30cRtBM6zC+j97Xci4jbWG8o2qE3pfPuf72
         6TnqJCPaBVPtpvWFHgvlelraiPm11T5EkX2zglKPouGhUSEC99014NwzD5UTASMBWPmi
         BaWQ==
X-Gm-Message-State: AO0yUKU4hKcoehCWtowOsBKYjkBnzdTiiJ7D/nXyk53uRcCCszJtGC7h
	rMyGdwJTlhx+exHHJJS7tKTwh6vU
X-Google-Smtp-Source: AK7set+Ks0aC8CRh4CLuUfbNCHNObCKFD90fNX9o+WEpCa8NNy9bsMTnaB8yMj6nDUaS4c+izcebqA==
X-Received: by 2002:a17:902:820d:b0:19c:d505:cdba with SMTP id x13-20020a170902820d00b0019cd505cdbamr66339pln.62.1677529558562;
        Mon, 27 Feb 2023 12:25:58 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id u13-20020a170902714d00b00198e7d97171sm4989806plm.128.2023.02.27.12.25.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 12:25:58 -0800 (PST)
Message-ID: <e14f92fa-c3f2-6d14-2517-0ef41ff72911@linaro.org>
Date: Mon, 27 Feb 2023 10:25:53 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com> <Y/yY72L9wyjuv3Yz@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <Y/yY72L9wyjuv3Yz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: E8RdPGWPmfhu

On 2/27/23 01:50, Daniel P. Berrangé wrote:
> On Mon, Feb 27, 2023 at 12:10:49PM +0100, Thomas Huth wrote:
>> Hardly anybody still uses 32-bit x86 hosts today, so we should
>> start deprecating them to finally have less test efforts.
>> With regards to 32-bit KVM support in the x86 Linux kernel,
>> the developers confirmed that they do not need a recent
>> qemu-system-i386 binary here:
>>
>>   https://lore.kernel.org/kvm/Y%2ffkTs5ajFy0hP1U@google.com/
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   docs/about/deprecated.rst | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>> index 15084f7bea..98517f5187 100644
>> --- a/docs/about/deprecated.rst
>> +++ b/docs/about/deprecated.rst
>> @@ -196,6 +196,19 @@ CI coverage support may bitrot away before the deprecation process
>>   completes. The little endian variants of MIPS (both 32 and 64 bit) are
>>   still a supported host architecture.
>>   
>> +32-bit x86 hosts and ``qemu-system-i386`` (since 8.0)
>> +'''''''''''''''''''''''''''''''''''''''''''''''''''''
>> +
>> +Testing 32-bit x86 host OS support takes a lot of precious time during the
>> +QEMU contiguous integration tests, and considering that most OS vendors
>> +stopped shipping 32-bit variants of their x86 OS distributions and most
>> +x86 hardware from the past >10 years is capable of 64-bit, keeping the
>> +32-bit support alive is an inadequate burden for the QEMU project. Thus
>> +QEMU will soon drop the support for 32-bit x86 host systems and the
>> +``qemu-system-i386`` binary. Use ``qemu-system-x86_64`` (which is a proper
>> +superset of ``qemu-system-i386``) on a 64-bit host machine instead.
> 
> I feel like we should have separate deprecation entries for the
> i686 host support, and for qemu-system-i386 emulator binary, as
> although they're related they are independant features with
> differing impact.

Agreed.

> 32-bit x86 hosts
> ''''''''''''''''
> 
> Support for 32-bit x86 host deployments is increasingly uncommon in
> mainstream Linux distributions given the widespread availability of
> 64-bit x86 hardware. The QEMU project no longer considers 32-bit
> x86 support to be an effective use of its limited resources, and
> thus intends to discontinue it.
> 
> Current users of QEMU on 32-bit x86 hosts should either continue
> using existing releases of QEMU, with the caveat that they will
> no longer get security fixes, or migrate to a 64-bit platform
> which remains capable of running 32-bit guests if needed.
Ack.

> 
> ``qemu-system-i386`` binary removal
> '''''''''''''''''''''''''''''''''''
> 
> The ``qemu-system-x86_64`` binary can be used to run 32-bit guests
> by selecting a 32-bit CPU model, including KVM support on x86_64
> hosts. Once support for the 32-bit x86 host platform is discontinued,
> the ``qemu-system-i386`` binary will be redundant.

Missing "kvm" in this last sentence?  It is otherwise untrue for tcg.


> Current users are
> recommended to reconfigure their systems to use the ``qemu-system-x86_64``
> binary.

Ack.

> Same point for the next patch about 32-bit arm vs qemu-system-arm
> binary.

Ack.


r~
