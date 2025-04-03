Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp3909487njd;
        Wed, 2 Apr 2025 23:26:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUZ2vbff1jL1SO+Os2ODni4pQn7ag3VBqb08WaXzvK5DnpZrkEUEKX/RLQRQVJ8s75dIPXb50WMxenLTA==@linaro.org
X-Google-Smtp-Source: AGHT+IHSwbaEGGFW2d60L4qQG/oIPNr729x0UsbfhqkXJ2K5nL/ta8Wj2QkgizwUG0fWHZmyKxM6
X-Received: by 2002:a05:620a:1a03:b0:7c5:4788:a14e with SMTP id af79cd13be357-7c76dfd51b3mr160558885a.39.1743661604102;
        Wed, 02 Apr 2025 23:26:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743661604; cv=none;
        d=google.com; s=arc-20240605;
        b=l16UqmEsNk18T6alQCXNoeEXOiMVETvyXR746RVmISwkEZtJldgqw+Pt/7hFQMNK4n
         TOFMkrjbFu6BXXw3FNnD/acwi1vY/hMRb/4diZfNvkm6CB0yo5TAXEY7TBsYXbljId0Z
         AdWlHm/QqzLIUCsBOdMqjaHHDj7qSuaj71hPcwsvTxbLxm+M0FyNRJaTe5Up90sY2Iv1
         CgxsuEas+vSbP8ttzdkZ2ror8luFA1FI2GZ2tA3TYyNDYMy7UEb2taMls1Z1WqXdbKyX
         Lutz3zjFmPcRlD84ZjnNe8CTvi5y96jEZfWzPUKOs/bd3039o9a8FW2tzytlBRCtQ6TG
         KUng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=YvY/v9GlBbYEJQOv16O//o+YskB9tnAd+h+Ku5MXHJI=;
        fh=hmZ1hRtKO95JuZB7W5w5dm4OU4MikogqjAAibztAJnk=;
        b=YADw+gvWI/L5WDUVCO7A0PtWkSh3WiH/iCNTJt7hB0U0FIXjFpj/njIrZkOo1puQHL
         Pc6RB9QuCmS+jzvUcnToEmAifnI6AHHiO/XZxFxN1ErXazifSUkempAURwXgwBanRbl0
         LNrDd9Id5CYdINSVJ81SEVnFe4ezdw3cK5My+6CgHiMLL6Ze5//vONvYlI2N7fikENU9
         UTpXLKHbejcqfz6r+isYtpzA6x+6nUlTNJ5JSs7t7pgCsTCwBP5ofje072pCv6iZaYo3
         rVJyl7KgBqEaxVfJLkimP7L3Xk3ExgHFOr4G3FE+XQXaceO8wkQPYuzuCsjIftY8/8D6
         ILBA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l6GKYv9m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c76ea83095si62692885a.332.2025.04.02.23.26.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Apr 2025 23:26:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l6GKYv9m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u0E1n-0002OX-5E; Thu, 03 Apr 2025 02:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1u0E1b-0002Mh-Bv
 for qemu-arm@nongnu.org; Thu, 03 Apr 2025 02:26:09 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1u0E1Y-0006sB-SS
 for qemu-arm@nongnu.org; Thu, 03 Apr 2025 02:26:03 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-224191d92e4so5281485ad.3
 for <qemu-arm@nongnu.org>; Wed, 02 Apr 2025 23:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743661559; x=1744266359; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YvY/v9GlBbYEJQOv16O//o+YskB9tnAd+h+Ku5MXHJI=;
 b=l6GKYv9mOoH3/UsfmqHMp0svRNL/xDVOk2k7te30622yzPJcJzrFXnlXM1Oykt1Cfl
 kPpHMGhuAUu2EZpT/0xJm9pwsx12TBgCuB5J6SDikwacZQRZYYj7GE/fputv21oBQLyn
 JuKu4nDCCb9QXBBh5dm/S6ApLuStfF0UQLfZT06V7IaKuhj+TG33c+i0LdJiIf5Od5I9
 QY9Z6KnRFuSf8DJXNSn7vKzMQg5Cy93nSnSSFD6l+msjwjE9FcD7b2FqFNATUyQeO9UD
 bzypu/y40h63B7x6FTTaXBhTDcU7EKlvu7BBzUdmi3pvXVl+Kev7j6X3MW0EE/in1rJD
 1E5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743661559; x=1744266359;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YvY/v9GlBbYEJQOv16O//o+YskB9tnAd+h+Ku5MXHJI=;
 b=rSpQbEchfsO/Ffmyq0krE03qVznsxgtJpY01T613KX1yS9+5+m7ZjhwXtVqIFbymZU
 is9aUHU7DOVt7JT4amgJ05B9f/czVQ87n+z1YmhZguC3f5qN1u5/l8/i52WVY4eGbsHA
 fmJyYdNGu5LpBK3wKApNDRVOp63rw2b3JkD9ZViUfYrZMcy2JSIXacf+6HAISfvJw/g8
 7fGxIB5XFNVHua0Scth+JdyV0+RwvGG068VBxLbUCaWoYjkxNDcNyddXU3xwfFcR0uUp
 9M2I7352uWTLdPQ+8Z/dfyuFOYYTaWTf+JVHIjavXeCztXDiApBDM9pwf22iS/FLE3dz
 NFGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVncWSxTl1hSfC0YEjFZ+nejOdy77tLIp3Kop58ai1OA1twt/hKIalYee+P5EU3EIbQd53dQGr1CQ==@nongnu.org
X-Gm-Message-State: AOJu0YxIxGAxCsofMS89CfJLxHY0eSqFMwEYtGlkl1B195O1r3T69urz
 R7yV3xbhHYmCDR1HU1HdL/wvDOjrNvD4+0VG7sJEt1gi7j8xA0zbGo0zlB/5fYE=
X-Gm-Gg: ASbGncvcMq5CaOwjUNlZAtZDuUT+ltP3s7O16SLaAsyGAV6T0eCGXO4vbhqCoV3aE8H
 TvvtttuNqJyMwfA7fMsA7BZcD31GkwokKCsjYW6Zoxx0vmG1NEyNRQCOqK8S1fI495HJTYG+W7b
 k2xWptW6APsBGpUvSoXbHAnwjhyhhaUtKD0u9W539fY3DsvxVZnU3414pG9T12T2Y+aDxId/Qut
 YAwhIn+vXqB2675CFh1XbsomgFOX8l5dvvbHiONfBifvNzRHxZ5aeD5AjLNx0zYHDHK5e3TjPK6
 kaP+HXeoT5y8jJu6sKg+Xatse6jFt29QbuJV1KFx8AMhkbCZgALVz5m9
X-Received: by 2002:a17:902:f686:b0:223:88af:2c30 with SMTP id
 d9443c01a7336-22977d8bd1amr19298655ad.16.1743661559151; 
 Wed, 02 Apr 2025 23:25:59 -0700 (PDT)
Received: from [192.168.0.102] ([186.215.49.46])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22978772816sm6525865ad.225.2025.04.02.23.25.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 23:25:58 -0700 (PDT)
Message-ID: <62bbeff2-f892-44d1-b190-8c4541acf16d@linaro.org>
Date: Thu, 3 Apr 2025 03:25:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0 1/5] qtest/bios-tables-test: Add test for -M
 virt,its=off
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Udo Steinberg <udo@hypervisor.org>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250331221239.87150-1-philmd@linaro.org>
 <20250331221239.87150-2-philmd@linaro.org>
 <1d1362a0-b544-476c-a305-a7d2212db423@linaro.org>
 <d3059aa1-952b-46b9-bb96-dace60664f49@linaro.org>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <d3059aa1-952b-46b9-bb96-dace60664f49@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /XP3PhJuyLAi

Hi Phil,

On 4/2/25 07:30, Philippe Mathieu-Daudé wrote:
> On 2/4/25 08:41, Gustavo Romero wrote:
>> Hi Phil,
>>
>> On 3/31/25 19:12, Philippe Mathieu-Daudé wrote:
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>
>> Please, put commit message (body) into the commits.
>>
>> For example, the commit message here could quickly explain that the FACP table
>> changed because virtualization=on (due to PSCI conduit). I'm assuming
>> virtualization is set to on because gic-version=max and so GICv4 is selected for
>> testing. It also could be that  we want to exercise its=off when Arm Virtualization
>> Extensions are enabled, which is the common use case (I understand that ITS
>> can be used also with virtualization=off).
>>
>> Finally, the commit message could mention at the end which struct
>> vanishes in APIC table and why IO remapping table is affected by
>> ITS on/off.
>>
>> A good commit message always help in code spelunking :)
> 
> I simply copied the reproducer from the issue, so I'll mention that.
> (https://gitlab.com/qemu-project/qemu/-/issues/2886)
> 
>>
>>
>>> ---
>>>   tests/qtest/bios-tables-test.c            |  22 ++++++++++++++++++++++
>>>   tests/data/acpi/aarch64/virt/APIC.its_off | Bin 0 -> 184 bytes
>>>   tests/data/acpi/aarch64/virt/FACP.its_off | Bin 0 -> 276 bytes
>>>   tests/data/acpi/aarch64/virt/IORT.its_off | Bin 0 -> 236 bytes
>>>   4 files changed, 22 insertions(+)
>>>   create mode 100644 tests/data/acpi/aarch64/virt/APIC.its_off
>>>   create mode 100644 tests/data/acpi/aarch64/virt/FACP.its_off
>>>   create mode 100644 tests/data/acpi/aarch64/virt/IORT.its_off
>>>
>>> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables- test.c
>>> index 0a333ec4353..55366bf4956 100644
>>> --- a/tests/qtest/bios-tables-test.c
>>> +++ b/tests/qtest/bios-tables-test.c
>>> @@ -2146,6 +2146,26 @@ static void test_acpi_aarch64_virt_tcg_topology(void)
>>>       free_test_data(&data);
>>>   }
>>> +static void test_acpi_aarch64_virt_tcg_its_off(void)
>>> +{
>>> +    test_data data = {
>>> +        .machine = "virt",
>>> +        .arch = "aarch64",
>>> +        .variant = ".its_off",
>>> +        .tcg_only = true,
>>> +        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>>> +        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
>>> +        .cd = "tests/data/uefi-boot-images/bios-tables- test.aarch64.iso.qcow2",
>>> +        .ram_start = 0x40000000ULL,
>>> +        .scan_len = 128ULL * 1024 * 1024,
>>> +    };
>>> +
>>> +    test_acpi_one("-cpu cortex-a57 "
>>> +                  "-M virtualization=on,secure=off "
>>> +                  "-M gic-version=max,its=off,iommu=smmuv3", &data);
>>> +    free_test_data(&data);
>>> +}
>>> +
>>>   static void test_acpi_q35_viot(void)
>>>   {
>>>       test_data data = {
>>> @@ -2577,6 +2597,8 @@ int main(int argc, char *argv[])
>>>                              test_acpi_aarch64_virt_tcg_acpi_hmat);
>>>               qtest_add_func("acpi/virt/topology",
>>>                              test_acpi_aarch64_virt_tcg_topology);
>>> +            qtest_add_func("acpi/virt/its_off",
>>> +                           test_acpi_aarch64_virt_tcg_its_off);
>>>               qtest_add_func("acpi/virt/numamem",
>>>                              test_acpi_aarch64_virt_tcg_numamem);
>>>               qtest_add_func("acpi/virt/memhp", test_acpi_aarch64_virt_tcg_memhp);
>>> diff --git a/tests/data/acpi/aarch64/virt/APIC.its_off b/tests/data/ acpi/aarch64/virt/APIC.its_off
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
>>> diff --git a/tests/data/acpi/aarch64/virt/FACP.its_off b/tests/data/ acpi/aarch64/virt/FACP.its_off
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
>>> diff --git a/tests/data/acpi/aarch64/virt/IORT.its_off b/tests/data/ acpi/aarch64/virt/IORT.its_off
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
>> I think the prescription for the acrobatics to update the ACPI expected
>> tables says the blobs here should be empty (blob files are added empty)
>> and at the same time they are listed in tests/qtest/bios-tables-test- allowed-diff.h:
>>
>>   * 1. add empty files for new tables, if any, under tests/data/acpi
>>   * 2. list any changed files in tests/qtest/bios-tables-test-allowed- diff.h
>>   * 3. commit the above *before* making changes that affect the tables
>>
>> (from tests/qtest/bios-tables-test.c header)
>>
>> If that's correct, this patch should be merged with the following one (2/5) and
>> IORT.its_off and FACP.its_off should also be listed in
>> tests/qtest/bios-tables-test-allowed-diff.h so the empty blobs won't trigger
>> a test failure.
> 
> I shouldn't have included the ACPI data in this patch but in the
> following. IIUC, if no data/$TABLE.$variant, then the generic
> data/$TABLE is used.

Yeah, it's correct that if no data/$TABLE.$variant is found then data/$TABLE is
used as a fallback. But my point actually was that in the first patch you should
create the blob .its_off variants for tables affected by the main change but
they must be empty, as per Step 1. in the prescription; and add them to the
"ignore list" (tests/qtest/bios-tables-test-allowed-diff.h) so they don't fail
the test, as per Step 2.

But on second thoughts I think Step 1. in prescription is confusing. Anyways,
what you're doing here is sensible.

Here (1/5), you're adding a new test, with new VM options. The new VM options
(different in comparison to the ¨baseline" data/$TABLE) cause changes to three
ACPI tables: APIC, FACP, and IORT, because:

- APIC: GICv2 is update to GICv4 due to gic-version=max + virtualization=on => GICv4
         and the addition of Subtable type 0xF for GIC ITS Structure (even tho its=off
         in the VM option, since that's the bug to be fixed down the road)

- FACP: Change of PSCI conduit due to virtualization=on option:
-                       Must use HVC for PSCI : 1
+                       Must use HVC for PSCI : 0 (use SMC instead)
because of logic in machvirt_init():
[...]
     } else if (vms->virt) { /* vms->virt is true is virtualization=on */
         vms->psci_conduit = QEMU_PSCI_CONDUIT_SMC;
     } else {
         vms->psci_conduit = QEMU_PSCI_CONDUIT_HVC;
     }

- IORT: A new node is added for SMMUv3 due to option iommu=smmuv3.


I think it's correct to add the blobs for .its_off to this patch, otherwise the test will
fail and, moreover, they are the results of the options being used for the new test.
As an alternative, you could add the *.its_off to tests/qtest/bios-tables-test-allowed-diff.h
so the differences would be ignored and the test passes, but really I think it makes
more sense as you're doing here.

The next patch (2/5) becomes, as you said in the commit message, a preparation for the
real changes (the fix), which will break temporarily the test, hence in 2/5 you add it
to the "ignore list", which is actually what Step 2. in the prescription recommends.

Thus:

Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>


Cheers,
Gustavo

>> Then patch 5/5 should add the expected/updated blobs and drop the *.its_off from
>> bios-tables-test-allowed-diff.h. Patches 3/5 and 4/5 are sandwiched
>> between (1/5 + 2/5) and (5/5).
>>
>> At least that's what I get from:
>>
>>   * The resulting patchset/pull request then looks like this:
>>   * - patch 1: list changed files in tests/qtest/bios-tables-test- allowed-diff.h.
>>   * - patches 2 - n: real changes, may contain multiple patches.
>>   * - patch n + 1: update golden master binaries and empty tests/qtest/ bios-tables-test-allowed-diff.h
>>
>> Otherwise the change looks good.
>>
>>
>> Cheers,
>> Gustavo
> 

