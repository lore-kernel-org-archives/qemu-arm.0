Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp3037477njb;
        Tue, 22 Oct 2024 05:32:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUuHwgVAOiXfNR2xMo5kqC07Rv8PS520Y/ERXSQ/2eI9pYsqefAu8/0t9hlb5VP1NrD0S2add29Rt4How==@linaro.org
X-Received: by 2002:a17:90b:4f8c:b0:2e2:e2f8:100 with SMTP id 98e67ed59e1d1-2e561a01721mr16199816a91.38.1729600363234;
        Tue, 22 Oct 2024 05:32:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729600363; cv=none;
        d=google.com; s=arc-20240605;
        b=B3AH5ZZu6kKMu7TcbmZf8jaD5gndYQ+OGS6+3k135GA1aF8h1QGomBu+iYmBuPoWnm
         5jp+myH/oI0lGMBGRrls9ZBAFWpdXgu5oqiQrWh8/SuR98kd2vsfbLDxcihrJFvPgMD/
         QNt1xbuZoDiZph4lcYxPVAmp5igH0es1WZuBN0/LkOz+gVrBvfGZDb2owbApkaY3tUWL
         Og0XsAN3LCaiirSMNBeFzmh/Nm2nZ4z1qmJ3e8hMljN2aYmP+Q8OGnzoBra/NAzFGvCp
         9CJny3qW0CFwbNpnCTj2DBIlqrre9pbS/iUjsdLpAcoACVqXImYvob0J88u8VNWTo7Bl
         HiDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=T2BBSawxJb9hvH5HcLsQ7yerA09YYQcV6F8+v48uPAM=;
        fh=2a+gRS76a4Xdxb0BBOazRS/24aP/jca5e8/OSmYknNE=;
        b=ZZ/3aiD/rlh5ZjzupE+rC7arl61UFPyS2+aeG91m2VWnyzdngHKgjZE4o8/CJPfC8a
         1sMsi25AzHX0b/uXTKrBZXBR05R9BDsvb3vIKlDj9RWoWbrTvwXRYONcinWkGHM41Jus
         p11ceAzln75oNwem1sm0iAc+cWi1Sv0qa9GXsx5wfIKwsOfl1O1LFJsBvw8GAXTOZy9v
         GO7qlkoIa8A4DS5EURXYv70GSGEH7YZQkoPqjtrB+ujJwEOIcYLA/8MwJERTgO63jqQE
         2pn7FvjPxRCVXrs1ap/SVXcHf34dCjqsHPRxQjg6CXjHZm1ni//NGeAevA5o0smqhEjY
         fNtg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QQeWJQrc;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-2e5ad542e11sor2316710a91.6.2024.10.22.05.32.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 22 Oct 2024 05:32:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QQeWJQrc;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729600363; x=1730205163; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T2BBSawxJb9hvH5HcLsQ7yerA09YYQcV6F8+v48uPAM=;
        b=QQeWJQrc+BbS8dDb1jRVX+EdPMbQ2amQUoiQ6tltGAQCvWWy+6wELBn+4ybzxNIHyJ
         vgAmLtTSjJgiZhc5fBMv7+4JNjfeNvW/oILuQ5LzY4baHkKaacnFt5+BW5RGBCiJSJyh
         rP7Gzjk+3LKiZPOJ8/89fzpwlbCL983DPyS+zbbErU0Hyr3085t1BCcPJNAdHfN21X57
         s03GG/bFVTWE9DuYfT23C0ntoaJh0FRkEB8A3ErqC8DfNUs6Kj3yFUgNKmJABmT9iGzY
         7n8NeIcxt6LLDq02axDf5hpoekZeu7A+nNu4N9vcVnlMECjPbPEuvoACwDIT3lQldf9K
         A3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729600363; x=1730205163;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T2BBSawxJb9hvH5HcLsQ7yerA09YYQcV6F8+v48uPAM=;
        b=f9DXFSZceYBPI6x/mXIUi6hXRrUauXPw+zmHRCW0WHim7PA+w3hn4po8INRLmzuWMT
         TylmAbBxSOoCjHffCmRm1R6zqN1H0BgbC/vz3xCdUjfDT7wHnYWbnhsMIGhbd6usUSHl
         4GRNDzKsPgIArKynT3POoca1G/r5XBpqndphw1LU8vwBE4ILZO9qGxPdbbovJq85DRSk
         CdS17cCdsxbncpNHZ8tq64su6Nd5jE+xNVjLcZ8VyeY9ufIsaTzCsUu/pv0YHpnJYcFQ
         I9hHoZ2chwUwlTb3LCCGlAPhlwFzI85oKRXuuxGMkHyuXuXasE4bcM74NtZ/lnK0i72N
         Sn2w==
X-Forwarded-Encrypted: i=1; AJvYcCVAQbfmUYKUIcZtthYHu0s3fTzz/9OzNwq/Yn6HH6YXSHO221hzLDvRq5t9fcxLjGjalj3TI+4zak8puw==@linaro.org
X-Gm-Message-State: AOJu0Yw1LsLxjcvoSU22w1WuRNpJqF5eyYSkIOmHjr9ny9m1nJFBFAdD
	EHsUff9eLDEWauPyc9ocQErAHi8E851YSLppliO7VTGB6NnO+B69DLBkn46eJSOI6g==
X-Google-Smtp-Source: AGHT+IFQDi3FmXrZuTZSlpLc4z4MNYr+WYGVBJnSyKJNjp5/TrBV+I32+lXjr70S4NS7ID3HwlUv7g==
X-Received: by 2002:a17:90a:4e06:b0:2e2:e937:7141 with SMTP id 98e67ed59e1d1-2e56172bb5cmr18409147a91.20.1729600362726;
        Tue, 22 Oct 2024 05:32:42 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.102] (200-207-104-238.dsl.telesp.net.br. [200.207.104.238])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad25caf5sm6077581a91.8.2024.10.22.05.32.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 05:32:42 -0700 (PDT)
Message-ID: <83ed8630-3d02-43b7-a908-be49f19d3d31@linaro.org>
Date: Tue, 22 Oct 2024 09:32:30 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 0/4] Arch agnostic ACPI changes to support vCPU Hotplug
 (on Archs like ARM)
To: Miguel Luis <miguel.luis@oracle.com>
Cc: Salil Mehta <salil.mehta@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 "andrew.jones@linux.dev" <andrew.jones@linux.dev>,
 "david@redhat.com" <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "gshan@redhat.com" <gshan@redhat.com>, "rafael@kernel.org"
 <rafael@kernel.org>, "borntraeger@linux.ibm.com"
 <borntraeger@linux.ibm.com>, "alex.bennee@linaro.org"
 <alex.bennee@linaro.org>, "npiggin@gmail.com" <npiggin@gmail.com>,
 "harshpb@linux.ibm.com" <harshpb@linux.ibm.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
 "ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
 "vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
 Karl Heubaum <karl.heubaum@oracle.com>,
 "salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>,
 "zhukeqian1@huawei.com" <zhukeqian1@huawei.com>,
 "wangxiongfeng2@huawei.com" <wangxiongfeng2@huawei.com>,
 "wangyanan55@huawei.com" <wangyanan55@huawei.com>,
 "jiakernel2@gmail.com" <jiakernel2@gmail.com>,
 "maobibo@loongson.cn" <maobibo@loongson.cn>,
 "lixianglai@loongson.cn" <lixianglai@loongson.cn>,
 "shahuang@redhat.com" <shahuang@redhat.com>,
 "zhao1.liu@intel.com" <zhao1.liu@intel.com>,
 "linuxarm@huawei.com" <linuxarm@huawei.com>
References: <20241014192205.253479-1-salil.mehta@huawei.com>
 <B1CFD37B-3422-4766-A5EE-64D000FDEC2B@oracle.com>
 <b2593ab0-f5b2-46fe-8a8c-3725598a6ae1@linaro.org>
 <2033A23F-0516-4C2D-BD28-CF130AA4E086@oracle.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <2033A23F-0516-4C2D-BD28-CF130AA4E086@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: y2VSydph3aFu

Hi Miguel!

On 10/21/24 05:04, Miguel Luis wrote:
> Hi Gustavo,
> 
>> On 18 Oct 2024, at 17:57, Gustavo Romero <gustavo.romero@linaro.org> wrote:
>>
>> Hi Miguel,
>>
>> On 10/15/24 15:41, Miguel Luis wrote:
>>> Hi Salil,
>>> I’ve ran the usual tests successfully of hotplug/unplug from the number of cold-booted cpus up to maxcpus and migration on ARM. Please feel free to add:
>>
>> Do you mind sharing what cpus you used for your tests?
>>
> 
> Not at all. I’ve used -cpu host and -cpu max. I had used RFC-v5 from [1] in order to test
> this patchset as they are at the base of it.

ah, got it. Thanks for the clarification, that's what
I was wondering at first :)


>> Did you use tcg or kvm for the tests?
> 
> I’ve used both in the following configurations:
> 
> -M virt -accel kvm -cpu host
> -M virt,gic_version=3 -accel kvm -cpu host
> -M virt,gic_version=3 -accel tcg -cpu max
> 
> And
> 
> -M virt -accel tcg -cpu max
> 
> This last one presented defects in QEMU on behalf of RFC-V5 but, if you don’t
> mind, instead of me transcribing everything here, could you please take a look
> at [2] ?
> 
> I could have given more detail from start, apologies for any confusion on my part.

Sure, thanks for the pointers ;)


Cheers,
Gustavo
