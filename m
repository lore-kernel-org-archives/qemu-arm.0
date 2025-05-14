Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1259191njb;
        Wed, 14 May 2025 08:08:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWq+U8aNy+lUbwv392SgQy7X1Lwa6MjatTuo5lh3PxMGaDIs/HGyyMG6Z1GkdhUZl05OjXKKBKrzm8Kig==@linaro.org
X-Google-Smtp-Source: AGHT+IHjR3T6xQgyIJYTD5f2HpLdUa7efItRXCzu9RIBgrYd/SBaTeyZu0lbE5cKZLaDg1h+Jftw
X-Received: by 2002:a67:e703:0:b0:4da:70a8:73cf with SMTP id ada2fe7eead31-4df7dda989bmr3454283137.20.1747235324987;
        Wed, 14 May 2025 08:08:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747235324; cv=none;
        d=google.com; s=arc-20240605;
        b=G4/lbR7f5mKE9JOKhrOSQXcjzZ4P4EwvbO0DgotEfJ7pyhSWoYYyxygt6nRbQFlq1V
         XWpaNEfKj2tXY3sJ5E6gkL0KaA1BJznnT2CH875gigcN0oY5GnbxNHakgUwmSZKkpIiD
         ltxAOb4ztNGPBcslVmzv+4kdfW0TRPMAnJzwTEEAqGZhSFGXnZFY6Eg7U9e0yjqClciR
         /4kBi+ezUJoe6rK/W3EedZdddffEfT1qbZ10sD8yc/qEKwkV1B6OcVg0MHiSMzZvgRw0
         mNfhXb2T9QWzakZzmkEKwBvtGt6Rb3+lyhpPgZtUUDtI83vDc1chF/Y+hw1lLCg1C69o
         Q1VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=mbuRFuKD5JpjQw2f4iee9uAmZP1oYGiVJtTJHjTRBb4=;
        fh=UdfhtFZwRum3LZx9PFxavQ42uTOgFl/4gVioiDTq9Ys=;
        b=Cfdc9IlPdQogO+F1TvsQaDgFmaqdTDSLRm6J/Z7It8S6iOqJntwi/RT3RqX8EgLV69
         helpSLELDoId3NDz8tI4whjUWwsQuu9G9ettfxVPZntWf7+6ya5vYAagFSGHXgH65mlZ
         bW4Vak4y0lqplPIfdsfyVhazo3fBY7K3SU5XzNY4XN+VcNID+VHt50hGrmT2uI0iYHPx
         +nwrx6dcAuuhYRg7vV5OndSQUm9Z+M8vDIdVDmxspJhxt2Ls/2RAlRfNrI/7Xlgu5dJW
         +bxOkdkUYb98SPglDgl+AadQnpHpB1r7Z6oYAa0DmCn9l47r2IPJo7chmA3RK9xUBSAF
         6isw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JybXlTzx;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ada2fe7eead31-4deb200faaesi5135823137.437.2025.05.14.08.08.44
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 08:08:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JybXlTzx;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747235324;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mbuRFuKD5JpjQw2f4iee9uAmZP1oYGiVJtTJHjTRBb4=;
	b=JybXlTzxpl58mKbnoidP+HgdWiI+LMU1XUUoImvyeMJDj/+Eyy9lWoUMYe0hfBpgDWKd1z
	yGnGzCxVs5AqJYjNAM8fvMmd1ks1eT6AxtvE6uuNrBtcFxc9iAGq5PhZAw1vdAZk+SGAVj
	dTOn2uZD1LtFqxQeP9NA3HSPPbuUEa0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-ph2_Ee13NDeR4M-onUpINA-1; Wed, 14 May 2025 11:08:43 -0400
X-MC-Unique: ph2_Ee13NDeR4M-onUpINA-1
X-Mimecast-MFC-AGG-ID: ph2_Ee13NDeR4M-onUpINA_1747235322
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5fcd19e6305so4151164a12.2
        for <alex.bennee@linaro.org>; Wed, 14 May 2025 08:08:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747235321; x=1747840121;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mbuRFuKD5JpjQw2f4iee9uAmZP1oYGiVJtTJHjTRBb4=;
        b=siH2+KVE4C+WOH4UfDYEVM73qZJsUPFtZBNLhs3k+9UApb8sD1vKuyMK9/KytILgJW
         4gZrT95RbPIvXzHEGrHGm6LkqbshPnaDLTdSWJ2I+TzwJVSoxnKokoVeI494rCA6VpFr
         xMXFTmarPuyeKxHjmTb2NZCS8IQKDdAuuoCM+wPCUmXdF9Jsxz2ww0Z4S/v0aIKzn++G
         AP+wfz32RjDdTq2WD45HKhRtGLlv6M4mmdA7cLkdlelHbOgNIBDu67Ay6/nOdklGnkih
         XcPAPRQhUqhEpJshMlU9Vn+hmz1y8ff0c5CtzW9Yp4KYAmUvZD4fLiBNUIosnqoTZTTs
         4OAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaH54om1C7SrIL5NlxkZpP4ib8hpmAD6jz94evhn2sK6+bLgUp8M16lDlqDOb/xPArwoGEvek9wB4tHw==@linaro.org
X-Gm-Message-State: AOJu0YzVbYzP2BL1cx0IgbQtskAOWWjaWCInAHoPERegz+Zit82uNm4v
	LvjXe7OIeBU52yYGbn9JcvzSgVko9HyiQpC0X4LOljhCI3ZMF4FMfcx/uolxjgIFvYUZ2Rjt2zW
	Y+dsw4cJX6c6rVsiJpbDKQGk1AxPcdo2dwIIuuF6sX/81hsWBfoLcwe323cu1Cw==
X-Gm-Gg: ASbGnctd3UV5A1UrHnGJyDWdUMU37LZ746GKJMeZB8p3+c3AQclxoQCvOxAmeKWm7kk
	78Weu8Kw3RzIdrjFdgwn8wBetculUfiBqpjDI8LvNj6gSrDZCvUUShKca2FHC/AcPcg/ZrOEbAs
	1WyInosdhKTKcjkunLW8dmz7b9s0Z2+468rA0/2oBnoLqufiEPsMOZ+XY9iuYU/VVlZT40RyCCk
	RC3+pr4nsEhPZVvhjlsNrC6KTnN04KwZwWFV/9A/BBoLOFHM6JfLNFEFwJ8035Ik++DgfY3ZFIJ
	gQVcYljLnW4np9Mv8Z3pUdluMyqyEeRNczGfB/HGkYYc7fJkUR+F73vhlwI=
X-Received: by 2002:a05:6402:3588:b0:5fb:1be2:270d with SMTP id 4fb4d7f45d1cf-5ff988def11mr2820648a12.29.1747235321375;
        Wed, 14 May 2025 08:08:41 -0700 (PDT)
X-Received: by 2002:a05:600c:3b02:b0:441:b00d:e9d1 with SMTP id 5b1f17b1804b1-442f20baee4mr34112625e9.2.1747234896892;
        Wed, 14 May 2025 08:01:36 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f337db30sm33725535e9.11.2025.05.14.08.01.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 08:01:36 -0700 (PDT)
Message-ID: <3f1c89a5-5887-4761-84a1-366dd9ef7fc2@redhat.com>
Date: Wed, 14 May 2025 17:01:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v6 12/14] arm/cpu: Add sysreg generation scripts
To: Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kvmarm@lists.linux.dev, peter.maydell@linaro.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 oliver.upton@linux.dev, sebott@redhat.com,
 shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 abologna@redhat.com, jdenemar@redhat.com, agraf@csgraf.de,
 shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
 pbonzini@redhat.com
References: <20250506085234.855779-1-cohuck@redhat.com>
 <20250506085234.855779-13-cohuck@redhat.com> <aCNwKBDtJES0GX3q@redhat.com>
 <87ecwrckfc.fsf@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <87ecwrckfc.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: r2uBoJ6c8tPsmBfSAdkPXHfOwQKCL0j4wxJKC6DzC7k_1747235322
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: yFPcWNmz1OO6

Hi Connie,

On 5/14/25 4:54 PM, Cornelia Huck wrote:
> On Tue, May 13 2025, Daniel P. Berrangé <berrange@redhat.com> wrote:
>
>> On Tue, May 06, 2025 at 10:52:32AM +0200, Cornelia Huck wrote:
>>> From: Eric Auger <eric.auger@redhat.com>
>>>
>>> Introduce scripts that automate the generation of system register
>>> definitions from a given linux source tree arch/arm64/tools/sysreg.
>>>
>>> Invocation of
>>> ./update-aarch64-sysreg-code.sh $PATH_TO_LINUX_SOURCE_TREE
>>> in scripts directory generates target/arm/cpu-sysregs.h.inc
>>> containing defines for all system registers.
>>>
>>> [CH: update to handle current kernel sysregs structure, and to emit
>>>      the re-worked register structures; cpu properties will be added
>>>      later]
>>> Reviewed-by: Sebastian Ott <sebott@redhat.com>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>>> ---
>>>  scripts/gen-cpu-sysregs-header.awk    | 35 +++++++++++++++++++++++++++
>>>  scripts/update-aarch64-sysreg-code.sh | 25 +++++++++++++++++++
>>>  2 files changed, 60 insertions(+)
>>>  create mode 100755 scripts/gen-cpu-sysregs-header.awk
>>>  create mode 100755 scripts/update-aarch64-sysreg-code.sh
>>>
>>> diff --git a/scripts/gen-cpu-sysregs-header.awk b/scripts/gen-cpu-sysregs-header.awk
>>> new file mode 100755
>>> index 000000000000..b6b207e3c0fd
>>> --- /dev/null
>>> +++ b/scripts/gen-cpu-sysregs-header.awk
>>> @@ -0,0 +1,35 @@
>>> +#!/bin/awk -f
>>> +# SPDX-License-Identifier: GPL-2.0
>> Invalid license name here - hopefully checkpatch.pl is warning
>> about this.
> It might not check .awk scripts?
>
>> Same issue as in the other sysreg script in the host CPU model
>> series.
>>
>>
>>> diff --git a/scripts/update-aarch64-sysreg-code.sh b/scripts/update-aarch64-sysreg-code.sh
>>> new file mode 100755
>>> index 000000000000..721f41a9a516
>>> --- /dev/null
>>> +++ b/scripts/update-aarch64-sysreg-code.sh
>>> @@ -0,0 +1,25 @@
>>> +#!/bin/sh -e
>>> +#
>>> +# Update target/arm/cpu-sysregs.h
>>> +# from a linux source tree (arch/arm64/tools/sysreg)
>>> +#
>>> +# Copyright Red Hat, Inc. 2024
>>> +#
>>> +# Authors:
>>> +#          Eric Auger <eric.auger@redhat.com>
>> Although its fairly short, this still deserves SPDX-License-Identifier
>> to be set.
> @Eric: do you agree on "GPL-2.0-or-later"?

Yes I agree

Eric
>
