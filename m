Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp8519832njd;
        Thu, 10 Apr 2025 09:22:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX0YjJk94SpNKQ1JrF3EXWWrQ/1tohWSXD3AayZVKOYB5q37yEynQ8W5Ms0G+ZSmAK+gP6nVgULugw5Dw==@linaro.org
X-Received: by 2002:a05:6a00:8486:b0:737:cd8:2484 with SMTP id d2e1a72fcca58-73bbf4d8419mr4162612b3a.6.1744302132056;
        Thu, 10 Apr 2025 09:22:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744302132; cv=none;
        d=google.com; s=arc-20240605;
        b=ZeKRBa5HYMrrZIlW/Q8ly9GeMufFph1uIkz9Tx+dvU6NUpbpfYB47tnSLTkbp5E7jA
         ZJ7Wl700nbMsnFNy2lLXD2wmVK1rx2+qldMUY3fkJQcrnL4+ho8WUpImD+KLTTGgikbB
         QmgFEVdIGmyMHFOasp8U4ITqLAb9bUw/ry6WUBaHPgp8T2I1CpXWH2LW79qJ7LyygXmp
         F6fGsvSRuCJyvE90DhvpzZOJmF/xIFkaHvLZR9z2ZxyMeipvUXI2DmKbYpI00e/v+LtL
         z1yOHfsVyn5nm3cR7B+WKF8zZoOfavi0onkvRzMSqZGig+WDRAebJsvLhWwNxn78gB7B
         6Qcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=/t/zE7tz7oNJ0G7xkwZxsIaDEUKu53O69xjhAFfo1as=;
        fh=9qvUxBDmnuZwI1zK2f8EJTJ1TdbnWxQcSQ296fdbrig=;
        b=hcWXBIWI+UoNFVhv8hPTntNiQydNYGCdOdg9kpb6nN+rs7wA1YVpqjUenoAiDIoMxn
         wplEK7/t1ssXo0lvsI0ls9C8k0NmzAC+CAa2o1AS5zt6cPrrw75L0B3WgVRG7ZX7xDrh
         BzjMIlGT/WjVwIbbRktgbzIm/uDOKa7F4hUUYIQExcDYlm/39ALPHkvek5wJSrg0LtId
         qqc9X1WVv5bHvof/EdXOfoih1Ytw50RPEQ3UxH0uwqLyy8fp/9ucsYSvhgQUKv7uqWFW
         7fLjn0QKSN+zNHReKfj1MoFKZarACnCaZ8txR3oMwJuHQFYE3XOMALi8GCQoF7p/It2y
         HbVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="d9HGKl/S";
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73baf820b3fsor1853217b3a.0.2025.04.10.09.22.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 Apr 2025 09:22:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="d9HGKl/S";
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744302131; x=1744906931; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/t/zE7tz7oNJ0G7xkwZxsIaDEUKu53O69xjhAFfo1as=;
        b=d9HGKl/ScL6nEyWpVUe+sqeV+wKLdSCQTqePiX0bq4RGALf/p/LVZIhpaq4NRZBSk3
         9Zz4nhFpWWl2y4RDUsa98RCbme4Max2GeOH5XIvV++w7t1WIgMU/r8yy5DCnOuCZujk7
         6EJ0VTMWYXqRmVHXW2u8aFtpx+YYmKsRDRDDvN1F+AgFKj70lNVOa/pvQbq5Bdm7hGWu
         wDmKU9nHNFyT9oBpY7cP7VWbopqIuQ5aQwwU4R7EyAxyhJrH0OgoQPAMJUO8hRFD4aMK
         SLxDc64UY8nN902Ry53lJ7z68m2BaqVIlaNO+HKtbM1FoNDCmmY9yfr+yk2nB8zTS9L1
         EG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744302131; x=1744906931;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/t/zE7tz7oNJ0G7xkwZxsIaDEUKu53O69xjhAFfo1as=;
        b=qy5HSM/sVqDERhCdWeLRT3Fc+9DvnhkpWXCrAhCPkehKoGmXbbxokWWgQ3LRqbKIOc
         l5SC0k3C5PHythCzQTVLQULijv13PKq33bJUxEFLjz4JpJ7hbt7KWk0sKGmqQdKrc7kM
         groE7yV3Wb34lJMDyoCjsxK4W3uzrF904zIDLpUrd7A1s4jrw72CwZebiIcqK5McYc/+
         Fi3TcSqvHoYoZOIGhoos0zap9QbevvFMEDxyR+f0+QMyRxENKT0uq0rAQwTKy/g5mzkw
         NRlmdnRAljLw1yIdbb8U+MwFaxXQnsfRQHR6mQr3l3YyV2Vp8ihsivfK45pdrYCZmgZy
         NLCQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5zDfyrZXkCBmCH2Dw4Yk6/MhCKeeqLh4fCm2ZRHIem0vqA16KWqfto3aSoUqueHwpqVFU8p9cqyJ9BQ==@linaro.org
X-Gm-Message-State: AOJu0YwbHJGQ0nL4w/565T51cbJyY38jqV/QF+LEjHQXJFO4VMkSyV1I
	wQ41peejaini1F7u+IXpRI34A93qi5EUWEIM9YREsfpAfDq9sw5T00eOgSJNBSPfTg==
X-Gm-Gg: ASbGncs/HPjaPc4xPMO36/+BtBClkqN8isQeJ0sB/bRO5f4h/+3CaLgnoEjATL4/Ul/
	+dn9t7IZpHxSc9TYVjPS65UdKurnObtUFz8bmdV7Jenu8HFkjR11V1rRF/AN5wdHxdcDBQcAYCg
	Oils4rQ8IU4zeT7QUl9nwFuruoaZZLJwd1n6kkhKLXUiJGiQVijOWrJaiyD3ZUVamDBzL8JE5qL
	5J+3FAKRaUpDEft+MeEhaSov2tvfyI7IhIqkPLU/SG7ge0mRP86wrJ/7l8D7hbMqxml42qZVzmc
	04/nKyQCssb3D3D06/kPSOJN5vURgGJWsN9mPe+IU1HgsI1LBlCS
X-Google-Smtp-Source: AGHT+IEfExYtqW55wAPTke0HUDqx0JPkstK9uVbVx/cXpb7V6qOpbTfb276SnWQ7Jm2yLNBzHirUgA==
X-Received: by 2002:a05:6a21:b82:b0:1fe:61a4:7210 with SMTP id adf61e73a8af0-2016a177367mr5163674637.2.1744302131511;
        Thu, 10 Apr 2025 09:22:11 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.102] ([152.250.123.8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a0817e08sm3238732a12.12.2025.04.10.09.22.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 09:22:11 -0700 (PDT)
Message-ID: <ec5cec94-4d02-442e-94e6-c0c2e79f3684@linaro.org>
Date: Thu, 10 Apr 2025 13:22:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v3 6/9] qtest/bios-tables-test: Whitelist
 aarch64/virt 'its_off' variant blobs
To: Igor Mammedov <imammedo@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Andrew Jones <ajones@ventanamicro.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Udo Steinberg <udo@hypervisor.org>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Ani Sinha <anisinha@redhat.com>
References: <20250403204029.47958-1-philmd@linaro.org>
 <20250403204029.47958-7-philmd@linaro.org>
 <671a6c82-ae10-4f3b-9d83-cecc32755206@linaro.org>
 <20250409160531.341c205e@imammedo.users.ipa.redhat.com>
 <98b2676d-ad21-4c05-a165-12ae5e1b9c64@linaro.org>
 <20250410085042.6aa5593d@imammedo.users.ipa.redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20250410085042.6aa5593d@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: RtOhZtxaZBIC

Hi Igor,

On 4/10/25 03:50, Igor Mammedov wrote:
> On Wed, 9 Apr 2025 12:49:36 -0300
> Gustavo Romero <gustavo.romero@linaro.org> wrote:
> 
>> Hi Igor,
>>
>> On 4/9/25 11:05, Igor Mammedov wrote:
>>> On Fri, 4 Apr 2025 00:01:22 -0300
>>> Gustavo Romero <gustavo.romero@linaro.org> wrote:
>>>    
>>>> Hi Phil,
>>>>
>>>> On 4/3/25 17:40, Philippe Mathieu-Daudé wrote:
>>>>> We are going to fix the test_acpi_aarch64_virt_tcg_its_off()
>>>>> test. In preparation, copy the ACPI tables which will be
>>>>> altered as 'its_off' variants, and whitelist them.
>>>>>
>>>>> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>>> ---
>>>>>     tests/qtest/bios-tables-test-allowed-diff.h |   3 +++
>>>>>     tests/qtest/bios-tables-test.c              |   1 +
>>>>>     tests/data/acpi/aarch64/virt/APIC.its_off   | Bin 0 -> 184 bytes
>>>>>     tests/data/acpi/aarch64/virt/FACP.its_off   | Bin 0 -> 276 bytes
>>>>>     tests/data/acpi/aarch64/virt/IORT.its_off   | Bin 0 -> 236 bytes
>>>>>     5 files changed, 4 insertions(+)
>>>>>     create mode 100644 tests/data/acpi/aarch64/virt/APIC.its_off
>>>>>     create mode 100644 tests/data/acpi/aarch64/virt/FACP.its_off
>>>>>     create mode 100644 tests/data/acpi/aarch64/virt/IORT.its_off
>>>>>
>>>>> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
>>>>> index dfb8523c8bf..3421dd5adf3 100644
>>>>> --- a/tests/qtest/bios-tables-test-allowed-diff.h
>>>>> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
>>>>> @@ -1 +1,4 @@
>>>>>     /* List of comma-separated changed AML files to ignore */
>>>>> +"tests/data/acpi/aarch64/virt/APIC.its_off",
>>>>> +"tests/data/acpi/aarch64/virt/FACP.its_off",
>>>>> +"tests/data/acpi/aarch64/virt/IORT.its_off",
>>>>
>>>> I think your first approach is the correct one: you add the blobs
>>>> when adding the new test, so they would go into patch 5/9 in this series,
>>>> making the test pass without adding anything to bios-tables-test-allowed-diff.h.
>>>> Then in this patch only add the APIC.its_off table to the bios-tables-test-allowed-diff.h
>>>> since that's the table that changes when the fix is in place, as you did in:
>>>
>>> if APIC.its_off is the only one that's changing, but FACP/IORT blobs are the same
>>> as suffix-less blobs, one can omit copying FACP/IORT as test harness will fallback
>>> to suffix-less blob if the one with suffix isn't found.
>>
>> OK. Just clarifying and for the records, this is not the case for this series
>>
>>
>>> if blobs are different from defaults then create empty blobs and whitelist them in the same patch
>>> then do your changes and then update blobs & wipeout withe list.
>>
>> Thanks for confirming it. That's what I suggested to Phil in my first review and what
>> I understood from the prescription in bios-tables-test.c.
>>
>> However, on second thoughts, for this particular series, isn't it better to have the following commit sequence instead:
>>
>> 1) Add the new test and the new blobs that make the test pass, i.e. APIC.suffix, FACP.suffix, and IORT.suffix (they are different than the default suffix-less blobs)
> 
> blobs should be a separate commit (that way it's easier for maintainer to rebase them,
> if they clash during merge with some other change.

I see. What is a bit confusing here is that the series consists in
one blob addition act (for the new test) and one blob update/removal act (after the fix).


>> 2) Whitelist only the APIC.suffix since that's the table that will change with the fix
>> 3) Add the fix (which changes the APIC table so a new APIC.suffix blob is needed and also stops generating the IORT table, so no more IORT.suffix blob is necessary)
>> 4) Finally, update only the APIC.suffix blob and remove the IORT.suffix blob and wipe out the whitelist
>>
>> This way:
>>
>> A) It's clear that only ACPI blob changed with the fix, because there is no addition of a FACP.suffix blob in 4) (it remains the same)
>> B) It's clear that the IORT table is removed with the fix and is not relevant anymore for the test
> 
> I'd just mention it in commit log so  that later no one would wonder why we are adding and then removing tables
> 
> As for the rest of suggestions, it looks fine to me.

Well, 2) won't make sense anymore since APIC.suffix would be already in the
whitelist in the previous patch that added the empty blobs. Since there won't
be a commit that adds _only_ the APIC.suffix to the whitelist, in preparation
for the fix, this info is "lost" in the series, even tho it's possible to
mention in the commit message.

Hence, what I think is not ideal from a maintainer's/reviewer's perspective,
is that in one commit all the blobs are updated/removed at once, which is
confusing because the fix did not touch the FACP table (for instance) and
this table is updated with APIC and with the removal of IORT, altogether,
in the last commit.

So, for this series, which adds new blobs and _also_ updates and removes some
of them, how about the following organization:

- Patch 1     : Add the new test, add the empty blobs *.suffix files, whitelist such a blobs
- Patch 2     : Update the blobs in Patch 1 with the ones that make the new test pass and remove them from the whitelist

- Patch 3     : Add the APIC.suffix blob to the whitelist (the table that changes due to the fix)
- Patch 4 - n : Fix(es)
- Patch (n+1) : Update the APIC.suffix blob, remove IORT.suffix blob, and remove the APIC.suffix blob from the whitelist
               * Add the APIC diff to the commit log
               * Mention in the commit log that IORT.suffix is removed because IORT table is no long generated after the fix

This way: a) no commit fails the test and b) blobs are added/updated/removed in separate commits

What do you think?


Cheers,
Gustavo
