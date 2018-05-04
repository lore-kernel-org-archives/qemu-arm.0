Received: by 10.28.4.212 with SMTP id 203csp449749wme;
        Fri, 4 May 2018 01:12:42 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqLwfUeMyFb0gMHlnZ42uBiItGY32KxelAOvRaY02gyeCut09iXkaswfzw+lerErhYbabp2
X-Received: by 10.28.118.9 with SMTP id r9mr18799092wmc.111.1525421562392;
        Fri, 04 May 2018 01:12:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525421562; cv=none;
        d=google.com; s=arc-20160816;
        b=Z2qBRNLF3zzKKLnEpJSwXVEHbwnoTOtljIveCGCxavL4e8d+O9BNqtsWVrcP1MrC4a
         heeCx42UXdmnvZp81PmuB58WYezBVvrXY4yEpb2liFog44Z9xviJE5it54WXlhdiTFhr
         OjyOnchQCitYrE21YbJ8Of0XxdrDjhoLmCnOcax+3n/IbE04kEiwRrZM4QxDsEMjMacQ
         /hfmaIKGPM04aYK2HeFP9lxMQrB7sp4K2hziGAC35qh1m+8sTjQkyXwxCpVm079bVrjM
         SDzzlZZ7QtiSkAQZ6MiQSS5HMY5EHXgZ7Wz9taABX9YmUJDGRd5La9vsUx33+m855kAF
         iI7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :arc-authentication-results;
        bh=JK/J7O1Tvw5cujPJeNcFL97dTv+7I9TMwHfzOltjgcs=;
        b=YJaiq1xwMbv4Of1/ezU/FwqQhZ9MTpAlB9M/7EQ/IBCwHl0UEqrV82EM39/nVFAH65
         FcBYHpzGBxFX5h10e7K6qRxzT7atDMg87OFuqDL/U56oC92NQyfXwm+gU+1tKh4sxVfx
         ohAP3tX/gKihREDe55hB7yUFpf5VEV/mvmWzVxwQi4sOHmH+Dik0j4wpTnpRVth5yIdf
         ERZ+F6m7mMWt6mxYvmEURf4S8PEzmUyzjkY1oMbK/Py0o/PMT1O5/ORj7IIwb+j3Fl3v
         1fmJocyVaqv97j17/rsY8O9s/IzzLc1CAw3ayDtQBXqtDlqrL54vD+sNMbptxqHoSHWt
         5obg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of abdallah.bouassida@lauterbach.com designates 62.154.241.196 as permitted sender) smtp.mailfrom=abdallah.bouassida@lauterbach.com
Return-Path: <abdallah.bouassida@lauterbach.com>
Received: from smtp1.lauterbach.com (smtp1.lauterbach.com. [62.154.241.196])
        by mx.google.com with ESMTPS id d13-v6si14336450wri.245.2018.05.04.01.12.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 May 2018 01:12:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of abdallah.bouassida@lauterbach.com designates 62.154.241.196 as permitted sender) client-ip=62.154.241.196;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of abdallah.bouassida@lauterbach.com designates 62.154.241.196 as permitted sender) smtp.mailfrom=abdallah.bouassida@lauterbach.com
Received: (qmail 16914 invoked by uid 484); 4 May 2018 08:12:41 -0000
X-Qmail-Scanner-Diagnostics: from 41.224.44.126 by smtp1.lauterbach.com (envelope-from <abdallah.bouassida@lauterbach.com>, uid 484) with qmail-scanner-2.11 
 (mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
 Clear:RC:1(41.224.44.126):. 
 Processed in 0.176381 secs); 04 May 2018 08:12:41 -0000
Received: from unknown (HELO [192.168.187.23]) (Authenticated_SSL:abouassida@[41.224.44.126])
          (envelope-sender <abdallah.bouassida@lauterbach.com>)
          by smtp1.lauterbach.com (qmail-ldap-1.03) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <khaled.jmal@lauterbach.com>; 4 May 2018 08:12:41 -0000
Subject: Re: [PATCH v6 0/3] target/arm: Add a dynamic XML-description of the
 cp-registers to GDB
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 khaled.jmal@lauterbach.com
References: <1524153386-3550-1-git-send-email-abdallah.bouassida@lauterbach.com>
 <87zi1g8qrd.fsf@linaro.org>
From: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Message-ID: <21a8cd56-b57a-31d9-36ac-131bd5996be0@lauterbach.com>
Date: Fri, 4 May 2018 09:12:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <87zi1g8qrd.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TUID: hp9qeldgXvzc


> Abdallah Bouassida <abdallah.bouassida@lauterbach.com> writes:
>
>> The previous version:
>> http://patchwork.ozlabs.org/project/qemu-devel/list/?series=33714
> I was trying to do some testing but I was finding it very hard to do at
> gdb kept throwing up errors like:
>
> (gdb) x/10i $pc
> => 0xffffff8008097760 <check_and_switch_context>:       Cannot access memory at address 0xffffff8008097760
> Detaching from program: /home/alex/lsrc/qemu/kernel-v8-plain.build/vmlinux, Remote target
> Ending remote debugging.
>
> However this seems to be the same on master as well so I wonder there is
> a regression somewhere.
>
> What was the last QEMU master commit you've tested these patches on?
> I'll do some more digging tomorrow.
It was:
    commit 0e87fdc966d05f4e5ad868034fcd8ee2a08ca62d
    Author: Peter Maydell <peter.maydell@linaro.org>
    Date:   Wed Apr 4 20:37:20 2018 +0100
        Update version for v2.12.0-rc2 release

Best regards,
Abdallah
