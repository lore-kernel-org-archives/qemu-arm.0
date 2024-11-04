Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2148002njc;
        Mon, 4 Nov 2024 06:27:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW7ikwUU2uAhl5xC0SMDpLOiUFQuNUuOKPuCyaPPjujMBisxv7/DBHfEdwa8cjV9RAwX30SuIqtE0Xm+A==@linaro.org
X-Google-Smtp-Source: AGHT+IHT9PLgSkNQPEtTL6wCGkekqEAlsmy8Oont7MScpWksjkI+92L50D8qKnpS+S7WlxE5myqj
X-Received: by 2002:ad4:4487:0:b0:6d3:411a:91e8 with SMTP id 6a1803df08f44-6d3411a9324mr232994856d6.53.1730730452899;
        Mon, 04 Nov 2024 06:27:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730730452; cv=none;
        d=google.com; s=arc-20240605;
        b=ev1qqBV8JKWQbkb90Krasy5ydu3IJzvPEjQR5RM/48PICNvghmPNsYRn91NeOaNQa5
         fMWrFyQFkojUl3XsS+Nu6ZvPO3Y/JPDGzsWBaNAzpCBRktufGuwB/tPQMRTzC5ycx5Iq
         WKtYy3t4gdfjcIQTVa/m5YTaVHqvZbBGr1nKmEkEAmulwuuF/yybNCpfPeW/0Z883fDd
         mCorqojtArYomauk2LlbDz4PRa9dcryOcuN3X3GuIsgSgJNoC40B/PwegpH9X0WtoAXz
         vRau/XVUzaZ4Az7SYaNsZfz/LzV+ap7X6yywfR97ptd89DLXD3j70/ZEmJ7dYn9OazaS
         KurA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=oTGEwhCT8hhD7r51rSqL2rFj/gm7aU24XxE68FPJ2XE=;
        fh=Kz3BP7WIL1Aw5/eDPp+oLlK5A3WwEEy+z8O5phhh8+0=;
        b=bZ3malmRl4znsYQblrn4GRlbD4FBEm9I6kvVV/UuFgiMThHz0iE4W1FZhxSofPoLzN
         Rnd9LUjD7kiFNIknN/ImF8gHzLL6/HUHjqlOWc6M1W4v/DCBn+DsBSn4nvUsuOmcUu1y
         xOdp1HEEQc7izQwtrMh/ZZsGzsmuYEAsgj2ZiYKwoIYyHQ7freitnslsyFrySk51XNBa
         k7pshSyImoXcYRoF2ohZH7YNBThsovNOKO1/mU/4oIMUfwnbSV0pRm2MFBhvj0AXj0It
         63rDY/2YBwy3DxvwOFZ63y85Gvs49oFgrneIzTLwx+hhYRaG6PMnmSYRxf+5ymbZz7Kl
         v3GA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QbA5003c;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d353fd055asi107101606d6.126.2024.11.04.06.27.32
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 06:27:32 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QbA5003c;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730730452;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oTGEwhCT8hhD7r51rSqL2rFj/gm7aU24XxE68FPJ2XE=;
	b=QbA5003ci74i7IaBwdHHChiQWFuBdkNg++k7fTuL+j9Tq7jHHkl/HZ/poD5x4BuA9AGqfr
	OJZbSnZk9J+TkBBipN1NZzphw5Mj0owzu+9SwzGfF9ylUct9oEj4gSxLvwREkKAEtMngoK
	9Rcok4YUghUXIfaE/uzpjX/ywKRPCGg=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-370-BP1h2RbNOrCW_7GU8zZolw-1; Mon, 04 Nov 2024 09:27:29 -0500
X-MC-Unique: BP1h2RbNOrCW_7GU8zZolw-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-53b1eef7359so2740900e87.3
        for <alex.bennee@linaro.org>; Mon, 04 Nov 2024 06:27:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730730448; x=1731335248;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oTGEwhCT8hhD7r51rSqL2rFj/gm7aU24XxE68FPJ2XE=;
        b=idD/zZsm06qURi4xB3hJlLOR2kHx9I6i/YpoYuawyvVqOOGUr7P9WPSjUZUWAs74vk
         POXCBIy6c62uhFkjzRjHa4fqbm7W352BGz1qW+wZHLN+2pEsH281iYLq/OJXa94QrHkb
         rILm/xPjxTDBWgaWzMspRM+b4pZ7avJfGMIJ/ObhxOvtJNicxG01G2I389LvFYbnwTsv
         ckRai/UizwT1W8tYEuRpZxC7SA+//R8Bf40OLCcLg5RTh/Lqh8GxcwLHkVYBp4tKDpDt
         Wi0DvbPwgLfbrbhPa1VTkpjubwcsNZQkXJil/aBnG5m5i53h2S9cnS0mcNc3aZvNH37I
         89jg==
X-Forwarded-Encrypted: i=1; AJvYcCU1z1u+ojH0kRMHb3ZeZmEsRIJCIA1vpeeWxrF7CSJOorXc0mJx05229HzffCeVZr1yr0NIlr6/Qsrgdg==@linaro.org
X-Gm-Message-State: AOJu0Yxs4ByK6WZKnphfYUOfGdrV/OzY9ayA1lpwCwh2ZjSR1tBnFZRz
	nx38bHIfdCDsBxQWI5G/rAC6NGzL0ozmVfVc/Ym5h7QjteiVHt4XktNXSViBik4RQpv6w2LexwO
	W8feC5bRcWaTkmOCcSpMzbcQlMSp6/UF3ReG5Wk1ghjxddCnYp1NQKw==
X-Received: by 2002:a05:6512:1590:b0:534:543e:1895 with SMTP id 2adb3069b0e04-53b34c5f77bmr15041795e87.39.1730730447667;
        Mon, 04 Nov 2024 06:27:27 -0800 (PST)
X-Received: by 2002:a05:6512:1590:b0:534:543e:1895 with SMTP id 2adb3069b0e04-53b34c5f77bmr15041771e87.39.1730730447145;
        Mon, 04 Nov 2024 06:27:27 -0800 (PST)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116abf3sm13362914f8f.101.2024.11.04.06.27.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 06:27:26 -0800 (PST)
Message-ID: <63c232c2-a325-48d6-8ed4-753a7c6e3b4e@redhat.com>
Date: Mon, 4 Nov 2024 15:27:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [RFC 18/21] arm/cpu: Introduce a customizable kvm host cpu model
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: eric.auger.pro@gmail.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev, richard.henderson@linaro.org,
 alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 abologna@redhat.com, jdenemar@redhat.com, shahuang@redhat.com,
 mark.rutland@arm.com, philmd@linaro.org, pbonzini@redhat.com
References: <20241025101959.601048-1-eric.auger@redhat.com>
 <20241025101959.601048-19-eric.auger@redhat.com>
 <ZxuX4i9NjVRizB72@redhat.com>
 <cb6c8f62-c5dc-416d-865f-fbdf96164dac@redhat.com>
 <Zxub7ol4p8P_sWF8@redhat.com>
 <CAFEAcA_wQu17y0PyQwxw0wuf2H5y2VE5aX16nLP2-u7QUP2ggA@mail.gmail.com>
 <Zx-9WxXkmkMuGIlQ@redhat.com>
 <CAFEAcA9w0mb5bcU8p+fScQony-=oqLmNurGWpnL_sBneQCzxUg@mail.gmail.com>
 <Zx_EGxj2aqc_2-kY@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Zx_EGxj2aqc_2-kY@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ZfvjrFWE7ODc

Hi Daniel,

On 10/28/24 18:04, Daniel P. Berrangé wrote:
> On Mon, Oct 28, 2024 at 04:48:18PM +0000, Peter Maydell wrote:
>> On Mon, 28 Oct 2024 at 16:35, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>> On Mon, Oct 28, 2024 at 04:16:31PM +0000, Peter Maydell wrote:
>>>> On Fri, 25 Oct 2024 at 14:24, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>>> On Fri, Oct 25, 2024 at 03:18:25PM +0200, Eric Auger wrote:
>>>>>> On 10/25/24 15:06, Daniel P. Berrangé wrote:
>>>>>>> Also, is this naming convention really the same one that users
>>>>>>> will see when they look at /proc/cpuinfo to view features ? It
>>>>>> No it is not. I do agree that the custom cpu model is very low level. It
>>>>>> is very well suited to test all series turning ID regs as writable but
>>>>>> this would require an extra layer that adapts /proc/cpuinfo feature
>>>>>> level to this regid/field abstraction.
>>>>>>
>>>>>> In /cpu/proc you will see somethink like:
>>>>>>  Features    : fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp
>>>>>> asimdhp cpuid asimdrdm lrcpc dcpop asimddp
>>>>> Right, IMHO, this is the terminology that QEMU must use in user
>>>>> facing APIs.
>>>> /proc/cpuinfo's naming is rather weird for historical
>>>> reasons (for instance there is only one FEAT_FP16 feature
>>>> but cpuinfo lists "fphp" and "asimdhp" separately).
>>> There's plenty of wierd history in x86 too. In this
>>> case I might suggest just picking one of the two
>>> common names, and ignoring the other.
>>>
>>> If we really wanted to, we could alias the 2nd name
>>> to the first, but its likely not worth the bother.
>> Or we could use the standard set of architectural
>> feature names, and not have the problem at all, and not
>> have to document what we mean by our nonstandard names.
>> (cpuinfo names do actually mostly line up with the
>> standard names, just not 100%. Similarly gcc/clang command
>> line options are mostly the architectural feature name.)
> Ah, right, yes. Sorry I mis-understood you originally to be suggesting
> the same low level names as this patch.
If my understanding is correct, Peter suggested to rely on the
terminology used in

https://developer.arm.com/documentation/109697/2024_09

the doc pointed to by Oliver.

So I think the next step is to understand how those "high level" features do map onto low level ID register field values. I think a high level feature can map onto separate fields in separate ID regs. This may not be the most common case though. 

Thanks

Eric

>
> With regards,
> Daniel
