Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp7812752njd;
        Wed, 9 Apr 2025 08:49:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXdzBkfENkGTOVb1O/zD9nWD0m9oeIQhY0tJJUJjb1Vge2JEc8H8Cg0onXfvIvPiNWg1Djk9MnH6FUamQ==@linaro.org
X-Received: by 2002:a17:90b:588b:b0:2ff:5ed8:83d1 with SMTP id 98e67ed59e1d1-306dd52b3f8mr4489818a91.19.1744213781075;
        Wed, 09 Apr 2025 08:49:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744213781; cv=none;
        d=google.com; s=arc-20240605;
        b=j2k+lHeS63X21+xpecsVs3Z+4uwrW3UCkADtQkQYm/LyxReYncUjSmjzz3O1PU7arT
         vShTADUKPnr4GXVuNXZCl2BTBl4BfGfl8gv5AFZWxX4rXkm9naKYhggQnF/RPyksSmPF
         mZJWXjehAZO824ATO7xJRHbqqbmdna/SLxAb6DXc6TZpEfktiXTtbpMF1OkICRIcL+ed
         X9gOWYrzRv/cmOOh7dlpYlc9woj3DLKNIs551pavBEfM7OF1xHEkaddH35YH3IApha4V
         Oyw4nmX2b4G+g2AJPlKG7O8bPKY3Shqrd6eZk5CNUhvkZwamxcLhbDHO4Ue5Z8PVwxaQ
         n5DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=940NqbKb+O1X9drvhQ2ttvWpopLBI4IZKc98V0PWB/o=;
        fh=FfTSOyF+hMhKkXps9cLSBiv5vyi4hWOkCwJeM2DSiRk=;
        b=iTUoPUIbdvDmxOx+OxgpI6HbQrNRR8G1YEhD1QrnApdnOupuNO+QWeaoZzXYqsGqjV
         diiGfbittVoQ5Ww1e3c27Zp9ejEN4aItVkhNmIRCgR0PD9aF1DG7u8aFzs03f5QUivcM
         73A3Iv31bVrsApHO862oZ1pus6G6XAJ1ofehQgNXDCA+zyMirm64ADAwCIwx2xutdF1a
         qu1+JTCkr3iaiv7UfCiqFIY2wS6Vq/4bblmzfCft+zVZ9quRooQChmgcn77r12uAL332
         aesbhjFLJpu5Rxi8CU5rdB7MLpVgTdsCehk5kSUxkn0knUxYNynMFrGJUmeoolAZlAAi
         dQpw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zNghZGrH;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-306df401052sor1305036a91.7.2025.04.09.08.49.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 09 Apr 2025 08:49:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zNghZGrH;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744213780; x=1744818580; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=940NqbKb+O1X9drvhQ2ttvWpopLBI4IZKc98V0PWB/o=;
        b=zNghZGrH+aN1eY88HGdQNtyELwG6RVXsInVdlMbs8Xa/1ozq9pMikfut7bH1mzBIOY
         1U/TS2eESMDajdUox9hDbbtO7Stv5ovzE6qgyMjAZDF9Brlvf32y0ZAJbUPwurKHbCB4
         MMRZUyCyiLqQ6oYA2ZM5uGLx7c2/XiV68cPh9ZMYxHjvRTKW3U6PTnE3BAtzIcaiWp08
         aVVx/QfVxH9CA/adBhiPwZwoD8MEqWUxHc5MYMnT7T1JnASe/ADFxw+cUVE0gpKY1/9N
         bh7x/cGUM6I1bnmZrqL1DnC+lypQ9Pc8UvHn6OfwVmbxCH9rcwk3i13bHb0+qaOh0dI8
         Ognw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213780; x=1744818580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=940NqbKb+O1X9drvhQ2ttvWpopLBI4IZKc98V0PWB/o=;
        b=eNjOMlRuzQ+K/f57QQMAqMYlkxbMlV95vtw5KV00ZjUO66+MVF/45hIz+yWYdajZja
         cVrWtfMg0x9igwuOCK1EkVChBRgtUwF80UhhMRoxm9PxaG3znNgdjG4NGE/EYpho6v6C
         aYULm6yrytrqnHpq3GAupoNTxTGZSfxH13Ngvls/cLDcUWCMNxey8fRF2qIkk2wB9qYq
         AhIs7yDG3oJ6mqKbf9Ry3VI145c/mjWGH0+YsfDjwndVx71e/whzss+sg8DDxkw9t/u0
         9bxrnH4657N0ADqxCiiRL2pkWvvX4uX/bWkNH/Na4K7YzMWz6oEYeTE/S8PkkDk4C0B6
         G9uA==
X-Forwarded-Encrypted: i=1; AJvYcCViCc4aN1TtqT0XP/BWCGJMLINgrh6xB9M1fCFCNEQ/KBVi7V8YpfOpVNuGL1RiLILnsMP18w+T65MnUQ==@linaro.org
X-Gm-Message-State: AOJu0YxsEp6K1SytnFsyck5mbGMVx4TTTRL+I1q7mQXL9ZrVCX9Oan/c
	+RWvzwzWMJZiW4k0raZoS8URyIzt7XOL22WQPJ03M/tG/C82O9nzIe6iAY7vQiijcEjhZJG/c2C
	tQ5o=
X-Gm-Gg: ASbGncvVGBZjV+00qI9CzGqnIlhwoq1+cBZ4qJuYZXkLNexDjh0p1Wz3YRg068o/dz7
	ot41HkGK7VtlOMcGxU2w/I+kR1N0ZyuSVIeY7YMIxSY5SMUG1n7330lXYjjtkvppKqZ303YX+JN
	TIJPpVOPKA5ZbKmUjly+OAcaQEGQnqNYcPmHNAEuraKyAtcAVrWP/zYHkrKgwK7WdnRRkbFuk2M
	AQWG93qC4OTYcSsXLCAa5B5KbKMxNjSyOpvUBzvsrpXNdDjO6Gf3l70TpkePALWiIWJfQsAg/1b
	vQrXZJVrRMZCivxwvDZU4H+7MhOsaoD3fBcBagUXLSWQeioneQrFONrVyK9XQ6o=
X-Google-Smtp-Source: AGHT+IHlJPjP1EdHBldUh7oZwaqORrFVtYXcqN97bbJEiH3ZzyHbtcsoQ7hiLBJj4tiOL061eOjFlw==
X-Received: by 2002:a17:90b:524f:b0:2ee:9e06:7db0 with SMTP id 98e67ed59e1d1-306dd32ce33mr4417565a91.11.1744213780520;
        Wed, 09 Apr 2025 08:49:40 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.102] ([152.250.123.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df2fae27sm1618263a91.31.2025.04.09.08.49.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 08:49:40 -0700 (PDT)
Message-ID: <98b2676d-ad21-4c05-a165-12ae5e1b9c64@linaro.org>
Date: Wed, 9 Apr 2025 12:49:36 -0300
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
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20250409160531.341c205e@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: fPdlZ8tJO7Oq

Hi Igor,

On 4/9/25 11:05, Igor Mammedov wrote:
> On Fri, 4 Apr 2025 00:01:22 -0300
> Gustavo Romero <gustavo.romero@linaro.org> wrote:
> 
>> Hi Phil,
>>
>> On 4/3/25 17:40, Philippe Mathieu-Daudé wrote:
>>> We are going to fix the test_acpi_aarch64_virt_tcg_its_off()
>>> test. In preparation, copy the ACPI tables which will be
>>> altered as 'its_off' variants, and whitelist them.
>>>
>>> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>    tests/qtest/bios-tables-test-allowed-diff.h |   3 +++
>>>    tests/qtest/bios-tables-test.c              |   1 +
>>>    tests/data/acpi/aarch64/virt/APIC.its_off   | Bin 0 -> 184 bytes
>>>    tests/data/acpi/aarch64/virt/FACP.its_off   | Bin 0 -> 276 bytes
>>>    tests/data/acpi/aarch64/virt/IORT.its_off   | Bin 0 -> 236 bytes
>>>    5 files changed, 4 insertions(+)
>>>    create mode 100644 tests/data/acpi/aarch64/virt/APIC.its_off
>>>    create mode 100644 tests/data/acpi/aarch64/virt/FACP.its_off
>>>    create mode 100644 tests/data/acpi/aarch64/virt/IORT.its_off
>>>
>>> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
>>> index dfb8523c8bf..3421dd5adf3 100644
>>> --- a/tests/qtest/bios-tables-test-allowed-diff.h
>>> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
>>> @@ -1 +1,4 @@
>>>    /* List of comma-separated changed AML files to ignore */
>>> +"tests/data/acpi/aarch64/virt/APIC.its_off",
>>> +"tests/data/acpi/aarch64/virt/FACP.its_off",
>>> +"tests/data/acpi/aarch64/virt/IORT.its_off",
>>
>> I think your first approach is the correct one: you add the blobs
>> when adding the new test, so they would go into patch 5/9 in this series,
>> making the test pass without adding anything to bios-tables-test-allowed-diff.h.
>> Then in this patch only add the APIC.its_off table to the bios-tables-test-allowed-diff.h
>> since that's the table that changes when the fix is in place, as you did in:
> 
> if APIC.its_off is the only one that's changing, but FACP/IORT blobs are the same
> as suffix-less blobs, one can omit copying FACP/IORT as test harness will fallback
> to suffix-less blob if the one with suffix isn't found.

OK. Just clarifying and for the records, this is not the case for this series


> if blobs are different from defaults then create empty blobs and whitelist them in the same patch
> then do your changes and then update blobs & wipeout withe list.

Thanks for confirming it. That's what I suggested to Phil in my first review and what
I understood from the prescription in bios-tables-test.c.

However, on second thoughts, for this particular series, isn't it better to have the following commit sequence instead:

1) Add the new test and the new blobs that make the test pass, i.e. APIC.suffix, FACP.suffix, and IORT.suffix (they are different than the default suffix-less blobs)
2) Whitelist only the APIC.suffix since that's the table that will change with the fix
3) Add the fix (which changes the APIC table so a new APIC.suffix blob is needed and also stops generating the IORT table, so no more IORT.suffix blob is necessary)
4) Finally, update only the APIC.suffix blob and remove the IORT.suffix blob and wipe out the whitelist

This way:

A) It's clear that only ACPI blob changed with the fix, because there is no addition of a FACP.suffix blob in 4) (it remains the same)
B) It's clear that the IORT table is removed with the fix and is not relevant anymore for the test

What do you think?


Cheers,
Gustavo

> Phil,
> the process is described in doc comment at the top of tests/qtest/bios-tables-test.c
> 
>> https://mail.gnu.org/archive/html/qemu-devel/2025-03/msg07082.html
>>
>> Plus, adding the blobs, which are actually related to the test in the other
>> patch, and ignoring them at the same time looks confusing to me. I understand
>> that only the blob that changes (APIC.its_off) with the fix should be temporarily
>> ignored and, later, updated, as in your first series.
>>
>>
>> Cheers,
>> Gustavo
>>
>>> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
>>> index baaf199e01c..55366bf4956 100644
>>> --- a/tests/qtest/bios-tables-test.c
>>> +++ b/tests/qtest/bios-tables-test.c
>>> @@ -2151,6 +2151,7 @@ static void test_acpi_aarch64_virt_tcg_its_off(void)
>>>        test_data data = {
>>>            .machine = "virt",
>>>            .arch = "aarch64",
>>> +        .variant = ".its_off",
>>>            .tcg_only = true,
>>>            .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>>>            .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
>>> diff --git a/tests/data/acpi/aarch64/virt/APIC.its_off b/tests/data/acpi/aarch64/virt/APIC.its_off
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..c37d05d6e05805304f10afe73eb7cb9100fcccfa
>>> GIT binary patch
>>> literal 184
>>> zcmZ<^@O0k6z`($=+{xeBBUr&HBEVSz2pEB4AU24G0Uik$i-7~iVgWL^17JJ`2AFzr
>>> bgb+@aBn}xq0gwb2)Q)cq{30-g9B_L93G4|0
>>>
>>> literal 0
>>> HcmV?d00001
>>>
>>> diff --git a/tests/data/acpi/aarch64/virt/FACP.its_off b/tests/data/acpi/aarch64/virt/FACP.its_off
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..606dac3fe4b55c31fd68b25d3a4127eeef227434
>>> GIT binary patch
>>> literal 276
>>> zcmZ>BbPf<<WME(uaq@Te2v%^42yj*a0-z8Bhz+8t3j|P&V`N}P6&N^PpsQ~v$aVnZ
>>> CVg~^L
>>>
>>> literal 0
>>> HcmV?d00001
>>>
>>> diff --git a/tests/data/acpi/aarch64/virt/IORT.its_off b/tests/data/acpi/aarch64/virt/IORT.its_off
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..0fceb820d509e852ca0849baf568a8e93e426738
>>> GIT binary patch
>>> literal 236
>>> zcmebD4+?q1z`(#9?&R<65v<@85#X!<1dKp25F11@1F-=RgMkDCNC*yK9F_<M77!bR
>>> zUBI%eoFED&4;F$FSwK1)h;xBB2Py`m{{M%tVD>TjFfcO#g+N#Zh@s|zoCF3AP#UU@
>>> R!2`+%Dg6Hr$N|zYvjDIZ5CH%H
>>>
>>> literal 0
>>> HcmV?d00001
>>>    
>>
> 
