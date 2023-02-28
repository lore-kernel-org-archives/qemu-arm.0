Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5488689ejc;
        Mon, 27 Feb 2023 23:52:57 -0800 (PST)
X-Google-Smtp-Source: AK7set/bC8aCscLHv2qckIyKJXN19NycUcXYBlmYnrlZdnSBB+ZsvFia/YuTpXsmKn5PfCDHdosL
X-Received: by 2002:a05:6214:5287:b0:56e:9c74:74b7 with SMTP id kj7-20020a056214528700b0056e9c7474b7mr3795744qvb.23.1677570777321;
        Mon, 27 Feb 2023 23:52:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677570777; cv=none;
        d=google.com; s=arc-20160816;
        b=Zk7yuJEkY4Q18YvwXUAa53wMQAhCo2kCX7IC2ose12Xqc8lunYsbtZbtVtvXMolsKG
         nxL/6fLKmGfm3SSH5OH7N/HwgjforaCCeTAgxSEMcYiyWz5mDyV/4fDIPfuy3yEtY/9q
         PA+Sc+I3Yq5d5+chxEjrqYtvLTt4sZj+Ww/S1v2GprBGRFSmJ1PD5RrKUbt1hG2nUGp4
         /NPmu0lYOJTU8cVN4E80xUuHA86t6ml6PFDWyOmGucu2xJRJCT7HjYrdh6MU/3F9WNLm
         C2+aetv6kcqyMo5JMogqYgaHlfRuTA8/ImDW5Gsyy/2lndQuoR3xt4Bs+f0vLDyAG8MU
         HvmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=RR2BvpBOXOzqZ7NvVjkZwdvjAhudEm7tI8s4OdXgmN4=;
        b=Bh4VsCRPLySxf8ESV17yMTdrnEpQFwDNoTaA1BzNGtVH3noja/3/5yFQ+ZGmQmp+48
         POKW7ZiWk4/PjCh3VBNCAydQPTTigh/ux5vq2ewu3e5zOBDytK6+GGwFaVYJIi9mXRDU
         SkYM5Bnn5GcA6ssNVcswhgBKxjBJkbMa8NIhprb5001+YpaJLFdCaSNJrYfSJPOXHy6w
         17MZ7czY2+SEcO6AgIDjrjyJKa7FGsKRBCca2UUGZG3idf8exWXo/EWiVFpQioLRh/ww
         aCzsKO48813bbJUjsrYDuayVHEvCp7pSK06I04FQCCz0I9SYVZ1mBovZcNrj2aPei6jB
         BF0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RqqToOBb;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id s129-20020ae9de87000000b00742cd14db36si1273148qkf.362.2023.02.27.23.52.57
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 23:52:57 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RqqToOBb;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677570776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RR2BvpBOXOzqZ7NvVjkZwdvjAhudEm7tI8s4OdXgmN4=;
	b=RqqToOBbZyxU/AuQ+lyNqrIMl1Dh/X/bAjRiK42UX3RI+9C+hFgozpFZh7293r3G3hOVrU
	1vkMWc2mt0yjRVnePDqF29Vxb6kWVofign4zA0mmoQfR2mLDQmPrul4yKpcJddz4p189xE
	OvVrH/eFcXkcLJtJ2AjRabNq96owx0g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-644-IfAPz4L2O6eGgSU8793kXg-1; Tue, 28 Feb 2023 02:52:53 -0500
X-MC-Unique: IfAPz4L2O6eGgSU8793kXg-1
Received: by mail-wm1-f72.google.com with SMTP id az39-20020a05600c602700b003e97eb80524so6546054wmb.4
        for <alex.bennee@linaro.org>; Mon, 27 Feb 2023 23:52:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RR2BvpBOXOzqZ7NvVjkZwdvjAhudEm7tI8s4OdXgmN4=;
        b=DCXBOvKwsCGRvb85dZ55DtrHoXWKa5kdtCTGe3IRkFZe2x8iDx1xWmMwYoGEQujF/k
         JGHyC3aYY1zZAYuhiltfBc4r34LHCILn76P618IBU/S35SMlGYKtkGxq3AdFG4lT+png
         RoOPE8z7sxCu57VcsSWSj5xZXxcnhv9RKHx7m/SdhqoqHoKq2ibt+1SRpIQ8FysdZlvU
         7yDjFURKuR2V0lr0fOLr60M5ax4IRBGw3ZjKJ13EQE4cFw4oL+N7IgxTKWJEdGJRtpjS
         nLFfmf/bds/9GWBrMJx1XoanVzYk8JdYSGDCR3Ikk9et1Nu94ylPiBz12DliK7CTG1Re
         EhFQ==
X-Gm-Message-State: AO0yUKXLXbAs9D9FspDu0Sw8yXLfZZLXhkchyYUYDy0gIQcFccJhsY3G
	Ve+hxVn3t3fI+aCoZGCtjrHBwModzMbMJ71aU4DOXBksKIKgLD3qLRH3uTxd7HplYi4S3EaR/5y
	T7J+GXth92nQkNWrm
X-Received: by 2002:a05:600c:4f45:b0:3e2:24a0:ba26 with SMTP id m5-20020a05600c4f4500b003e224a0ba26mr1281592wmq.16.1677570771145;
        Mon, 27 Feb 2023 23:52:51 -0800 (PST)
X-Received: by 2002:a05:600c:4f45:b0:3e2:24a0:ba26 with SMTP id m5-20020a05600c4f4500b003e224a0ba26mr1281570wmq.16.1677570770820;
        Mon, 27 Feb 2023 23:52:50 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-177-75.web.vodafone.de. [109.43.177.75])
        by smtp.gmail.com with ESMTPSA id d10-20020a05600c3aca00b003eb369abd92sm10529537wms.2.2023.02.27.23.52.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 23:52:50 -0800 (PST)
Message-ID: <697e536d-eb65-32d9-279f-b2e6ab5e718a@redhat.com>
Date: Tue, 28 Feb 2023 08:52:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com> <Y/yY72L9wyjuv3Yz@redhat.com>
 <e14f92fa-c3f2-6d14-2517-0ef41ff72911@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <e14f92fa-c3f2-6d14-2517-0ef41ff72911@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: iTbgh92gbp/x

On 27/02/2023 21.25, Richard Henderson wrote:
> On 2/27/23 01:50, Daniel P. Berrangé wrote:
>> On Mon, Feb 27, 2023 at 12:10:49PM +0100, Thomas Huth wrote:
>>> Hardly anybody still uses 32-bit x86 hosts today, so we should
>>> start deprecating them to finally have less test efforts.
>>> With regards to 32-bit KVM support in the x86 Linux kernel,
>>> the developers confirmed that they do not need a recent
>>> qemu-system-i386 binary here:
>>>
>>>   https://lore.kernel.org/kvm/Y%2ffkTs5ajFy0hP1U@google.com/
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   docs/about/deprecated.rst | 13 +++++++++++++
>>>   1 file changed, 13 insertions(+)
>>>
>>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>>> index 15084f7bea..98517f5187 100644
>>> --- a/docs/about/deprecated.rst
>>> +++ b/docs/about/deprecated.rst
>>> @@ -196,6 +196,19 @@ CI coverage support may bitrot away before the 
>>> deprecation process
>>>   completes. The little endian variants of MIPS (both 32 and 64 bit) are
>>>   still a supported host architecture.
>>> +32-bit x86 hosts and ``qemu-system-i386`` (since 8.0)
>>> +'''''''''''''''''''''''''''''''''''''''''''''''''''''
>>> +
>>> +Testing 32-bit x86 host OS support takes a lot of precious time during the
>>> +QEMU contiguous integration tests, and considering that most OS vendors
>>> +stopped shipping 32-bit variants of their x86 OS distributions and most
>>> +x86 hardware from the past >10 years is capable of 64-bit, keeping the
>>> +32-bit support alive is an inadequate burden for the QEMU project. Thus
>>> +QEMU will soon drop the support for 32-bit x86 host systems and the
>>> +``qemu-system-i386`` binary. Use ``qemu-system-x86_64`` (which is a proper
>>> +superset of ``qemu-system-i386``) on a 64-bit host machine instead.
>>
>> I feel like we should have separate deprecation entries for the
>> i686 host support, and for qemu-system-i386 emulator binary, as
>> although they're related they are independant features with
>> differing impact.
> 
> Agreed.

OK, fair, I'll rework my patch according to your suggestion, Daniel.

>> 32-bit x86 hosts
>> ''''''''''''''''
>>
>> Support for 32-bit x86 host deployments is increasingly uncommon in
>> mainstream Linux distributions given the widespread availability of
>> 64-bit x86 hardware. The QEMU project no longer considers 32-bit
>> x86 support to be an effective use of its limited resources, and
>> thus intends to discontinue it.
>>
>> Current users of QEMU on 32-bit x86 hosts should either continue
>> using existing releases of QEMU, with the caveat that they will
>> no longer get security fixes, or migrate to a 64-bit platform
>> which remains capable of running 32-bit guests if needed.
> Ack.
> 
>>
>> ``qemu-system-i386`` binary removal
>> '''''''''''''''''''''''''''''''''''
>>
>> The ``qemu-system-x86_64`` binary can be used to run 32-bit guests
>> by selecting a 32-bit CPU model, including KVM support on x86_64
>> hosts. Once support for the 32-bit x86 host platform is discontinued,
>> the ``qemu-system-i386`` binary will be redundant.
> 
> Missing "kvm" in this last sentence?  It is otherwise untrue for tcg.

I assume that Daniel only thought of 32-bit x86 hosts here, but indeed, it's 
untrue for non-x86 32-bit hosts. So this really should refer to KVM on 
32-bit x86 hosts instead. I'll rephrase it in v2.

  Thomas
