Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp2150096lfk;
        Tue, 6 Jul 2021 06:10:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3AUfQlj+Ah437ycsKdtJwHq9917mtFQHNTuH63Vb9nr45Zrzj6pCoxQ0AZ1oNYrdxfF30
X-Received: by 2002:a17:906:2cca:: with SMTP id r10mr17918128ejr.298.1625577044794;
        Tue, 06 Jul 2021 06:10:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625577044; cv=none;
        d=google.com; s=arc-20160816;
        b=NiBse5qF5rDNmisYHKmRw9a/116tLqMSeSnEBF9x4o/tzc9pnSLwuBnRfo28VrQcAE
         yFSr2EEKpB3S+axqW457spjJNqLPV53nLbaxLjjNVOYUdTnLVH1tKTVprgSkfrAtEnJa
         TTXCf/bYBxgKUZAmeKxlu8Opfd4yULxyq/l9Z6ZtYE14NQF3Npc8kcjYbX6cQPJgF5+H
         Jtyff4E1FpHrCweN2CBootTEIw/jaWy0ynnX+k480ikSnLaS+exDn+Ehm4cKwaSuiKKk
         EWha7rvRD54SkaPdIBuZ0CV8A95v28wB805ArMLKNpLTg6+sEg1XbapEA1pbeZo6uD/C
         tSBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=TMpkbsahDUoPNW6bU3wGQy5aTTdc5WS4J0g54W45ySQ=;
        b=HNHtgD4E1t5d+ckoytjHwlUet358kIvYSTObvc8tKGE80tMJ3wwK4LBF6FcguLOYE/
         wScQHpVXYMCvQgPCqD0x1tk2CeN0et+ezjyOp1lWyZI/Na2AZbKzlRzNaXYxDJ1Bp/Zs
         ZFUsg/No9rfYHS4dAyXmlu5UIvgpSqblFKWx7BHhScPPHewIiYVcDTUM98pboMTXDTMl
         HIAHs3pfQPohuz8szOHUS4uNEUvPnP1BvVVYkWn0siUw8CaivT1A+pk8AOi9GaeEFpmx
         G6JUGtlXCcSUrhh+09M5xRBzEH/g3/Hli9M6NLW0OBgz7eHViVJI/e0pDK/n/9Vle0uX
         YiLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FZgGOgYx;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id p8si17802742edj.74.2021.07.06.06.10.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Jul 2021 06:10:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FZgGOgYx;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1625577043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TMpkbsahDUoPNW6bU3wGQy5aTTdc5WS4J0g54W45ySQ=;
	b=FZgGOgYxdfLvfQofPBwy5g4DbVdnELe6Ikcetopvi8fvFzboc3m/dTCBAH3M0M/sLv7sUg
	930HoC7FcSCNXUngnyrgkT9mYFe1+Ub85WhTSTSKMq5Aq3oyfpBXB2Y4B9SNJeLXA9tGwf
	WaCyMwqLEvWpN+L57+rgS2itp6LN9NU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-xcZh3YFmOfa1WlcIrudIgw-1; Tue, 06 Jul 2021 09:10:41 -0400
X-MC-Unique: xcZh3YFmOfa1WlcIrudIgw-1
Received: by mail-wm1-f69.google.com with SMTP id m31-20020a05600c3b1fb02902082e9b2132so1079386wms.5
        for <alex.bennee@linaro.org>; Tue, 06 Jul 2021 06:10:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TMpkbsahDUoPNW6bU3wGQy5aTTdc5WS4J0g54W45ySQ=;
        b=QykpHKYXvJIYYN8Zr91viaKpFqy+MSF0KeCdfoyVGTI4rHyDopr0noE4fiHyzp3OIr
         ETYZYhd6YVzgA+BgPK0jIniXTK11TqqOglEvMivrm3g/udGytOENe0kJmLpjbZ0J/Woy
         ie7L+nBx044Tj4kTVznHE8FZqwo6P7AJe7Hp4KF/v/qpgnLmzDIVkbJqLzG2Gcuj68fB
         C26qdxHTTcbKAtiCIuw+gAWCqqiwvob4/nPeyrywNDQLHCNayfGqs8UeBzqtjkVyNbw9
         MEjX3UbSOK/2WJeMzY9UDPdhdjh+mXiRQjtUmYAF5adUrzaJ63fiNPB5FIgw2K4naZ8D
         oJkQ==
X-Gm-Message-State: AOAM530YYXeZ5YYEt35hStsFmYeH18L+3nhqnho9+B4sUHSrvEDCuBe6
	7oNqwqgvQJcFA4e8c5PC33BnAD9nutQhUQdDD7W+UtUTeCA8zFZ+SMlyGpnNnR9thqbnCpG7/VQ
	M/VHNmnXI2TsQEuoF
X-Received: by 2002:a7b:c852:: with SMTP id c18mr20144792wml.128.1625577040232;
        Tue, 06 Jul 2021 06:10:40 -0700 (PDT)
X-Received: by 2002:a7b:c852:: with SMTP id c18mr20144749wml.128.1625577040045;
        Tue, 06 Jul 2021 06:10:40 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from thuth.remote.csb (pd9575e24.dip0.t-ipconnect.de. [217.87.94.36])
        by smtp.gmail.com with ESMTPSA id g15sm16459930wrs.50.2021.07.06.06.10.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jul 2021 06:10:39 -0700 (PDT)
Subject: Re: [PATCH v1 1/5] meson: Introduce target-specific Kconfig
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 pbonzini@redhat.com, Aurelien Jarno <aurelien@aurel32.net>
References: <20210621152120.4465-1-alex.bennee@linaro.org>
 <20210621152120.4465-2-alex.bennee@linaro.org>
 <c3d33a80-b3bb-5aa5-50c7-7c1a379814ba@redhat.com>
 <8d018805-8e1f-4c1e-b1a4-45a34c8d2e63@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <bd97210a-04d4-939f-b3b7-1e250d7d250a@redhat.com>
Date: Tue, 6 Jul 2021 15:10:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8d018805-8e1f-4c1e-b1a4-45a34c8d2e63@amsat.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: EyiEEmAPNWTX

On 06/07/2021 14.47, Philippe Mathieu-Daudé wrote:
> On 7/6/21 12:52 PM, Thomas Huth wrote:
>> On 21/06/2021 17.21, Alex Bennée wrote:
>>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>
>>> Add a target-specific Kconfig. We need the definitions in Kconfig so
>>> the minikconf tool can verify they exit. However CONFIG_FOO is only
>>
>> s/exit/exist/ ?
>>
>>> enabled for target foo via the meson.build rules.
>>>
>>> Two architecture have a particularity, ARM and MIPS:
>>> their 64-bit version include the 32-bit subset.
>>
>> Why do you mention these here, but not x86, Sparc, PPC and RISC-V which
>> also have 32-bit and 64-bit variants?
> 
> Because we consider them as different targets, they don't include
> (kselect) the subset.

And why is that done this way? There is certainly a big difference between 
Sparc and Sparc64, but for x86 and PPC, the 64-bit variant is a superset of 
the 32-bit variant, so why is it done different here compared to ARM and MIPS?

  Thomas


>>
>> The patch itself looks fine to me, so once you've clarified the commit
>> message:
>>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>
>>
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> Message-Id: <20210131111316.232778-6-f4bug@amsat.org>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>
>>> ---
>>> vajb:
>>>     - removed targets that no longer exist
>>>     - reword commit message to show why we need the Kconfigs
>>> ---
> 
>>> diff --git a/target/arm/Kconfig b/target/arm/Kconfig
>>> new file mode 100644
>>> index 0000000000..3f3394a22b
>>> --- /dev/null
>>> +++ b/target/arm/Kconfig
>>> @@ -0,0 +1,6 @@
>>> +config ARM
>>> +    bool
>>> +
>>> +config AARCH64
>>> +    bool
>>> +    select ARM
> 
>>> diff --git a/target/mips/Kconfig b/target/mips/Kconfig
>>> new file mode 100644
>>> index 0000000000..6adf145354
>>> --- /dev/null
>>> +++ b/target/mips/Kconfig
>>> @@ -0,0 +1,6 @@
>>> +config MIPS
>>> +    bool
>>> +
>>> +config MIPS64
>>> +    bool
>>> +    select MIPS
> 
