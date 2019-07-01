Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2787426wru;
        Mon, 1 Jul 2019 08:45:00 -0700 (PDT)
X-Received: by 2002:a1c:ddd6:: with SMTP id u205mr16898492wmg.54.1561995900717;
        Mon, 01 Jul 2019 08:45:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561995900; cv=none;
        d=google.com; s=arc-20160816;
        b=YMTRq9tPjgIs/kEGgmghlMJOmywc/pYzjS1ksNaIU2RTU3i1NgOMy7XMDuOBDDj044
         /GezxbFYUY/BljZDfXLeD/YvEwKkpPmUUFa1orjOl1/wruvh57RDfd3AZ11TILj/8TVS
         oFr9HpWiEBKLYfErp7SVj5yF/T0ym+MZW0VoTVtVOEP76mQ8GJIYwu99M2Z1YRn2tzM5
         aMlUmOhuf9fBQ0+Xq/6ZyUP0MU4+Jx7+t6l6NxQXE16gBddsG5868ooQBCptdiu6Cybu
         McuoqoiYToIw2rn6y1pHSxrhztec2Szac7kfbZilhENHaa67HunFcf2Buht4RJrvKaxw
         p2dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=UN3o+6UDPS3ZrABJXsjH4Uy8Wz/9XvwPA/jAWAdkpjE=;
        b=Z3b8bWwMJHkIm22n8WFp93nn/3dLWoIgVpYBxySCZS9EhTlRz1yPb5VaKEAyxmntS0
         e4KEm4WrIkKNdHpmihrz6pKyPo4s+MkCVYpdG27byz00o8horELCJKnRbLEKzeFUWRZp
         RehW7+ol482ia6JGAgKm2q3sLn3eEjumfTAC90pnOdUgyouRRDEMvksLULAV7lQlXfTF
         ygrEZoOtva+Tf07dW2vPoU8Tzqq3JHRvZiWyFsCKylOhsJNcxF2r7A3lNjPO3+MCGFQy
         +QyNFR31rcDNsKlK6Y2xuFbqG8T6zwFlCCKNnH5aKu919fY87U2xF3uEavhtaw3MUyM5
         VsDA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b4sor8181247wrj.14.2019.07.01.08.45.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 01 Jul 2019 08:45:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UN3o+6UDPS3ZrABJXsjH4Uy8Wz/9XvwPA/jAWAdkpjE=;
        b=gZdIWWLP1GHVmEeoO4ozUt2reuETZ1fNOjUf3J2qimwKadAKMnI/o7oWQZgAqbZblo
         YUbBi2iint2Ss9IUxyPxtcVT4fdfMTodPaQjGyuEkzS1qHZ17oGHNhVrJdKNwvvhSrzR
         N05ySNUbn05YLk/W9U1U6DSRe+egdtKHcit46Q9/AEm58e5Gicpg1U69qYu2Cr2/eg3b
         UaPKGa7QUI+cpxkC9l6Z3pOo/ppplb3urhW025S0RGIv3znT6bUb5LQqBY+J9M7Kcaqh
         ZwVqDwm60BtvjlZj7LXTTkEOk015VpJQLL9N3SFNLx1tgKQHqtT6J9K2rgPmAa2COK9t
         0zUg==
X-Gm-Message-State: APjAAAX16YIA+aFvyHkMzapcvodFNQASLHN4K0+zA7vvoyih77TLpBvc
	cp4BHKoG3izre3wfhO/rjCzegA==
X-Google-Smtp-Source: APXvYqxTrhbST95SxLtqvUE5CalXJXJC1wCH03YLGHpkpBudkxD24uJaHSijK/ZLcML4yK8R7R/IPQ==
X-Received: by 2002:adf:dd8c:: with SMTP id x12mr19718536wrl.212.1561995900343;
        Mon, 01 Jul 2019 08:45:00 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.38] (183.red-88-21-202.staticip.rima-tde.net. [88.21.202.183])
        by smtp.gmail.com with ESMTPSA id h6sm10819669wre.82.2019.07.01.08.44.58
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 08:44:59 -0700 (PDT)
Subject: Re: [PATCH v3 00/27] Support disabling TCG on ARM
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Yang Zhong
 <yang.zhong@intel.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Rob Bradford <robert.bradford@intel.com>,
 Samuel Ortiz <sameo@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>
References: <20190701132516.26392-1-philmd@redhat.com>
 <CAFEAcA93x6zkbHe1hdg0c8cbo9ErSByP+g6UvwZefxn-6346zg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <6222de8e-5b4e-db05-a453-ae4920c2002a@redhat.com>
Date: Mon, 1 Jul 2019 17:44:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA93x6zkbHe1hdg0c8cbo9ErSByP+g6UvwZefxn-6346zg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: LEY3S83g5E6Y

On 7/1/19 5:41 PM, Peter Maydell wrote:
> On Mon, 1 Jul 2019 at 14:25, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> Paolo motived me to salvage this (other!) previous series fromi
>> Samuel Ortiz (NEMU project).
>>
>> v1 cover from Samuel [1]:
>>
>>   This patchset allows for building and running ARM targets with TCG
>>   disabled. It splits the target/arm/helper.c file into logical TCG and
>>   non TCG dependent files so that one can build and run QEMU binaries with
>>   or without TCG enabled.
>>
>>   The rationale behind this work comes from the NEMU project where we're
>>   trying to only support x86 and ARM 64-bit architectures, without
>>   including the TCG code base. We can only do so if we can build and run
>>   ARM binaries with TCG disabled.
> 
> I have applied to target-arm.next:
>  1-12
>  14-17
>  19-21
> 
> I had comments about 13 and 18. 22 has a conflict when I try to apply it:
> I think this is just accidental because the functions it's moving are
> next to changes in patch 13 so there's a minor textual conflict, so it
> would be fine with a fixed-up version of patch 13.
> 23-27 are still RFC status so I think best left for the next release.

Thanks a LOT!

I was not expecting this to be merged for this release,
this is very appreciated :)

Regards,

Phil.
