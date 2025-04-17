Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp1047645njk;
        Thu, 17 Apr 2025 14:06:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUnSHq/11nvA+jA/regpoRQeEM4lFyE8zpvLmVUY3MxhJT0jZbU3KvfL/Rd9a7vO6sNtO+6iem4KkZpwg==@linaro.org
X-Received: by 2002:a17:902:f541:b0:223:325c:89f6 with SMTP id d9443c01a7336-22c53568612mr5733445ad.10.1744923979816;
        Thu, 17 Apr 2025 14:06:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744923979; cv=none;
        d=google.com; s=arc-20240605;
        b=R11Bxiwa2hBywB1MB4njUyBR+zuRI6rvvwuI3ajTARvu2jnx5W0N7GUaRTSZ2P4Fc3
         04WHRpIHgbANS49JcpkcM2+iyhu6R+VInvO/ZcrlA5HnI6xFzg2iONyiAJRJIoXN0GbF
         9usQUOsBz59RR5OHH2IuFE851M6KGz+HR8+POAXgpADLOJAmdaPiXvnZROycEUhFfE3h
         ePr5UiW2BURmT9OfBpy2JjlMCGnr+FqOy085B1HjYC+90wXOcLMSrolR65meqeqCNgCO
         3xUB8SIj1Mq5+r41EaBMviw2QMP4MKgjKKEmdeXg3/TGfp5UdhoPL09WKBGJC1sPR+GW
         aQ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=2SX7Ep+ot7gpgj7NWTMdX4Ce49Ly0lymB8IyE/t7pOY=;
        fh=oezD1PEA1cf2GvYMwpZbvI4DrKFkhe4Z2s8HgQJ8lp0=;
        b=V2Hhg+omsScQ1OXAVFOGr3PfjcfAZxCrq7t4pujdXi0GfpRNzkojSugpv45DGI5j7R
         dEGH2Rpc48Y5SqQbj6+hnFSX6y7Yg0YWDM7yZIsGdSQvvgju5paZM7mV3vs69HnmX2ar
         svXHe1+kl8CbdAllyNaZiXJTAt3zAZdc4mtGVo6RvSpI55oZY0NFAmx51IGu7IoGVfJ5
         +EmtIr52zSSMk2y7Sv07yA9nV6INFU4wJJvuropkrwrEo8YkcYwRDwEwyyb91CwpmOp3
         aKthqRlXoKzRYJMASb4fwyvZ4aDkV1G2PY7ZbScDZQvkAbnhycEfZx65tPtKHOmaw4wJ
         7JlQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s93Bu5SD;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22c50daa6bcsor4745685ad.11.2025.04.17.14.06.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 17 Apr 2025 14:06:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s93Bu5SD;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744923979; x=1745528779; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2SX7Ep+ot7gpgj7NWTMdX4Ce49Ly0lymB8IyE/t7pOY=;
        b=s93Bu5SDIflhwv71igKsGu72kHc1cSRZYDORo0spaGBfIBwbJzmcVxMWpUPFCm1BnI
         lfFxQTlQVqK+1GXfmnewBJgs1Ub4dfrMBNxl0EGZCi9MBjUYJWrXZXfpAj7kuUpw1Jrk
         VD0xrrJFpKXDr1oqV0AIMM6LekFo2chSkJHEQK3vwC2CTvun1boe5hNfjgaTNitZJEQT
         5KbESnfOv6Jq3QgXlEhFqPY8d3dlKgiP9wE+ucOxrtcPL5ruJpiP4xmeoIQSRWvraBg3
         BFBe47L9tK0vgtOtUF0cxPfy2P17k0UtnH5N06et9KV1Ph5LJ1gKald/IY4uSE6htAJr
         MIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744923979; x=1745528779;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2SX7Ep+ot7gpgj7NWTMdX4Ce49Ly0lymB8IyE/t7pOY=;
        b=Nwerrnn969UaEq721TLO+3CxOpOmGtamszB5C0CZEC0vrFc7dZBWoF19XI1GfZQqnD
         +E7Ij10TKmAaSQTldktJA8sZBzyMiFWKpoDLbXE/kuB2TrYHO6Il0ccyn5sO+hIJ9X6L
         yjMPdjIbj0SstgJZ+vCsh1lJL9ceLUSPr2/I7bZawmpQShGP049yCwBsdsyj2lXveNTa
         xGakcZO70RzPPo7hPw0h0/n1weBf+GFOrhDSw+oNnnzcQ4Q3DgvYeaoc92w4hCIkF/5h
         kx6Ru25fQYWRf8N83fGoYikxJWCCx+eNIUX1ooTfbS51mOjRs9XdO6bnR/HYORWqHUNO
         Xj3g==
X-Forwarded-Encrypted: i=1; AJvYcCVFN7ek/VpdseXfaoIpf5ougH50zSxal6mMK8/UFQQcnAsTByKHD3zM5Nd7J5/WPEYvU//VmjCNEh9u7Q==@linaro.org
X-Gm-Message-State: AOJu0Yyn3c4RTTYQBiFmRuL9DxquVb7NXSjM2R3MlgmIbdj/a01EbH6F
	tKY6kOeeVu4LOO5hbNN+K4CNPXtNkblQov0OXe68jDAC4fAO+7fQBAzXmV8V8v/vvQ==
X-Gm-Gg: ASbGncvCZI4bq+OygKWZGorW0UEAmt/BcAhp3jkj1BosW9//9PbtCW2DP3TVQupBKzs
	EPboJhPM7+mxHF8NfSabCxaLjIJNIWkE/8WAaqbIutMxKdp5r2LxMKr2MitB8vki5iQgMSsEz4+
	MQtnN1jKztj/XIFjyxilg5PjhmZ36dOkaYf3vYki80c3VIfrkKHaU7RKCI3LwWZU/x7R6j5B2tW
	dls+or1hm22Oq7Dfcj0PVapubzNgJcfIwAQr3qvs8W/ekdm49kdCEDbx5qYEJmcLOO+4dX8FWE2
	2a3Q4Th7cHwpwR9ljGzkkGgg8/ympyA6SLVShjqn9rFr4wZYtlBk
X-Google-Smtp-Source: AGHT+IE5Sx0i+sJQdJZr9MjI/6tY42ww3fBwjDghN2gv/lQD0a8Bmfwx11UQcsAZS4q1sVxry9+nuw==
X-Received: by 2002:a17:902:d50b:b0:220:c813:dfd1 with SMTP id d9443c01a7336-22c53607db6mr5220135ad.36.1744923979293;
        Thu, 17 Apr 2025 14:06:19 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.102] ([186.215.52.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50ed0eb5sm4485605ad.202.2025.04.17.14.06.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 14:06:18 -0700 (PDT)
Message-ID: <0dffbcec-ca2a-47d0-b837-2400865371f7@linaro.org>
Date: Thu, 17 Apr 2025 18:06:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v3 6/9] qtest/bios-tables-test: Whitelist
 aarch64/virt 'its_off' variant blobs
From: Gustavo Romero <gustavo.romero@linaro.org>
To: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin"
 <mst@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Andrew Jones <ajones@ventanamicro.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Udo Steinberg <udo@hypervisor.org>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Ani Sinha <anisinha@redhat.com>
References: <20250403204029.47958-1-philmd@linaro.org>
 <20250403204029.47958-7-philmd@linaro.org>
 <671a6c82-ae10-4f3b-9d83-cecc32755206@linaro.org>
 <20250409160531.341c205e@imammedo.users.ipa.redhat.com>
 <98b2676d-ad21-4c05-a165-12ae5e1b9c64@linaro.org>
 <20250410085042.6aa5593d@imammedo.users.ipa.redhat.com>
 <ec5cec94-4d02-442e-94e6-c0c2e79f3684@linaro.org>
Content-Language: en-US
In-Reply-To: <ec5cec94-4d02-442e-94e6-c0c2e79f3684@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: aVobFyiXfCiY

Hi Igor and Michael,

On 4/10/25 13:22, Gustavo Romero wrote:
> Hi Igor,
> 
> On 4/10/25 03:50, Igor Mammedov wrote:
>> On Wed, 9 Apr 2025 12:49:36 -0300
>> Gustavo Romero <gustavo.romero@linaro.org> wrote:
>>
>>> Hi Igor,
>>>
>>> On 4/9/25 11:05, Igor Mammedov wrote:
>>>> On Fri, 4 Apr 2025 00:01:22 -0300
>>>> Gustavo Romero <gustavo.romero@linaro.org> wrote:
>>>>> Hi Phil,
>>>>>
>>>>> On 4/3/25 17:40, Philippe Mathieu-Daudé wrote:
>>>>>> We are going to fix the test_acpi_aarch64_virt_tcg_its_off()
>>>>>> test. In preparation, copy the ACPI tables which will be
>>>>>> altered as 'its_off' variants, and whitelist them.
>>>>>>
>>>>>> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
>>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>>>> ---
>>>>>>     tests/qtest/bios-tables-test-allowed-diff.h |   3 +++
>>>>>>     tests/qtest/bios-tables-test.c              |   1 +
>>>>>>     tests/data/acpi/aarch64/virt/APIC.its_off   | Bin 0 -> 184 bytes
>>>>>>     tests/data/acpi/aarch64/virt/FACP.its_off   | Bin 0 -> 276 bytes
>>>>>>     tests/data/acpi/aarch64/virt/IORT.its_off   | Bin 0 -> 236 bytes
>>>>>>     5 files changed, 4 insertions(+)
>>>>>>     create mode 100644 tests/data/acpi/aarch64/virt/APIC.its_off
>>>>>>     create mode 100644 tests/data/acpi/aarch64/virt/FACP.its_off
>>>>>>     create mode 100644 tests/data/acpi/aarch64/virt/IORT.its_off
>>>>>>
>>>>>> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
>>>>>> index dfb8523c8bf..3421dd5adf3 100644
>>>>>> --- a/tests/qtest/bios-tables-test-allowed-diff.h
>>>>>> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
>>>>>> @@ -1 +1,4 @@
>>>>>>     /* List of comma-separated changed AML files to ignore */
>>>>>> +"tests/data/acpi/aarch64/virt/APIC.its_off",
>>>>>> +"tests/data/acpi/aarch64/virt/FACP.its_off",
>>>>>> +"tests/data/acpi/aarch64/virt/IORT.its_off",
>>>>>
>>>>> I think your first approach is the correct one: you add the blobs
>>>>> when adding the new test, so they would go into patch 5/9 in this series,
>>>>> making the test pass without adding anything to bios-tables-test-allowed-diff.h.
>>>>> Then in this patch only add the APIC.its_off table to the bios-tables-test-allowed-diff.h
>>>>> since that's the table that changes when the fix is in place, as you did in:
>>>>
>>>> if APIC.its_off is the only one that's changing, but FACP/IORT blobs are the same
>>>> as suffix-less blobs, one can omit copying FACP/IORT as test harness will fallback
>>>> to suffix-less blob if the one with suffix isn't found.
>>>
>>> OK. Just clarifying and for the records, this is not the case for this series
>>>
>>>
>>>> if blobs are different from defaults then create empty blobs and whitelist them in the same patch
>>>> then do your changes and then update blobs & wipeout withe list.
>>>
>>> Thanks for confirming it. That's what I suggested to Phil in my first review and what
>>> I understood from the prescription in bios-tables-test.c.
>>>
>>> However, on second thoughts, for this particular series, isn't it better to have the following commit sequence instead:
>>>
>>> 1) Add the new test and the new blobs that make the test pass, i.e. APIC.suffix, FACP.suffix, and IORT.suffix (they are different than the default suffix-less blobs)
>>
>> blobs should be a separate commit (that way it's easier for maintainer to rebase them,
>> if they clash during merge with some other change.
> 
> I see. What is a bit confusing here is that the series consists in
> one blob addition act (for the new test) and one blob update/removal act (after the fix).
> 
> 
>>> 2) Whitelist only the APIC.suffix since that's the table that will change with the fix
>>> 3) Add the fix (which changes the APIC table so a new APIC.suffix blob is needed and also stops generating the IORT table, so no more IORT.suffix blob is necessary)
>>> 4) Finally, update only the APIC.suffix blob and remove the IORT.suffix blob and wipe out the whitelist
>>>
>>> This way:
>>>
>>> A) It's clear that only ACPI blob changed with the fix, because there is no addition of a FACP.suffix blob in 4) (it remains the same)
>>> B) It's clear that the IORT table is removed with the fix and is not relevant anymore for the test
>>
>> I'd just mention it in commit log so  that later no one would wonder why we are adding and then removing tables
>>
>> As for the rest of suggestions, it looks fine to me.
> 
> Well, 2) won't make sense anymore since APIC.suffix would be already in the
> whitelist in the previous patch that added the empty blobs. Since there won't
> be a commit that adds _only_ the APIC.suffix to the whitelist, in preparation
> for the fix, this info is "lost" in the series, even tho it's possible to
> mention in the commit message.
> 
> Hence, what I think is not ideal from a maintainer's/reviewer's perspective,
> is that in one commit all the blobs are updated/removed at once, which is
> confusing because the fix did not touch the FACP table (for instance) and
> this table is updated with APIC and with the removal of IORT, altogether,
> in the last commit.
> 
> So, for this series, which adds new blobs and _also_ updates and removes some
> of them, how about the following organization:
> 
> - Patch 1     : Add the new test, add the empty blobs *.suffix files, whitelist such a blobs
> - Patch 2     : Update the blobs in Patch 1 with the ones that make the new test pass and remove them from the whitelist
> 
> - Patch 3     : Add the APIC.suffix blob to the whitelist (the table that changes due to the fix)
> - Patch 4 - n : Fix(es)
> - Patch (n+1) : Update the APIC.suffix blob, remove IORT.suffix blob, and remove the APIC.suffix blob from the whitelist
>                * Add the APIC diff to the commit log
>                * Mention in the commit log that IORT.suffix is removed because IORT table is no long generated after the fix
> 
> This way: a) no commit fails the test and b) blobs are added/updated/removed in separate commits
> 
> What do you think?

I’d really appreciate it if you could confirm whether this organization makes sense.


Cheers,
Gustavo
