Received: by 10.25.44.15 with SMTP id s15csp3116362lfs;
        Fri, 7 Jul 2017 02:43:32 -0700 (PDT)
X-Received: by 10.55.197.2 with SMTP id p2mr61042584qki.217.1499420612234;
        Fri, 07 Jul 2017 02:43:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499420612; cv=none;
        d=google.com; s=arc-20160816;
        b=GNHWRp5dfZnnpIhX3tewwtQ0Jdu0ejdFEhrvQq47LzEkhy61UMY8nj4tpy3+MofIIu
         +T8E66DqOaberaxyyLj3/LjuvLPSK+ewlOka1v+Squ5dZ0c8+nZuRFUaM8tTab2YvX3x
         EZATJYhhRr5gVlsDDh3ZfFTJIq6ADeOCTVG+D32zds40mauvVMwHxPYZtll3Y4xjKNAR
         CWtqPD9eFkz+fj4uUk6Qu2U0DTFrVs+ltvJi4qWs38qdhKX8uCGQ7fSCef5FLUYldBM+
         TSFTwN7VDLrMc8/xotGWnbfQ1L+/vk4/yC24ZraGVQVyNlqXj77OxofFpKehVDT4fh9b
         Wq6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=9lJ/3i7oyCOAy7Hb7J+iB9OstmsWuBE2fO8++SVbz6M=;
        b=Q/tyfq2FcrxVCCgSNjWHDHyQXtFs8Steuz52spWbMSs3k6o0uU6xTxgjBk56pTf6LI
         Tf+ut6RzXLLb8tMi/hRb3G33G1YroOdiURiCT+hijKuoNHYG6y42UGzObJR/fNvxGcjx
         RziKxwxjlY/uIomhjznqkreMoLlAvT3EY1hmIsb7RPfUNT0w2+lg8sFriNrZU0xRJ/Nx
         vpKp9ROcGxO3aRwm5DFoVPDv2XDVlcaI+CHAA1jQgOMFK/84BEE7v9KkxHAEmJsa35eK
         jJd4efF3nGqNnS56E6z4nGWRv84S+NhlXlNutldQ8yzH3fyKQOBrLp9p1HTXzK901xnv
         1IPg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id s55si2749808qtb.326.2017.07.07.02.43.31;
        Fri, 07 Jul 2017 02:43:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id EEA0040FAE;
	Fri,  7 Jul 2017 05:43:04 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -4.202
X-Spam-Level: 
X-Spam-Status: No, score=-4.202 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_HI=-5, SPF_HELO_PASS=-0.001]
	autolearn=unavailable
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 26iP3HwFYctO; Fri,  7 Jul 2017 05:43:03 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id D0DE740D55;
	Fri,  7 Jul 2017 05:43:03 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id E521A40D16
 for <kvmarm@lists.cs.columbia.edu>; Fri,  7 Jul 2017 05:43:02 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y6eW4q6KABvY for <kvmarm@lists.cs.columbia.edu>;
 Fri,  7 Jul 2017 05:43:01 -0400 (EDT)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 9607840D14
 for <kvmarm@lists.cs.columbia.edu>; Fri,  7 Jul 2017 05:43:01 -0400 (EDT)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B446D5D686;
 Fri,  7 Jul 2017 09:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B446D5D686
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
 dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
 spf=pass smtp.mailfrom=lersek@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com B446D5D686
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-21.phx2.redhat.com
 [10.3.116.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 47E85702DE;
 Fri,  7 Jul 2017 09:43:21 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH v3 1/4] ACPI: Add APEI GHES Table Generation
 support
To: gengdongjiu <gengdongjiu@huawei.com>
References: <1493530506-26833-1-git-send-email-gengdongjiu@huawei.com>
 <4dde45bb-a730-82b1-dc49-ad00a6b73d85@redhat.com>
 <accf8880-f4b0-85f1-9f33-4103c8c26d7a@redhat.com>
 <e90c5fb8-e68b-a620-9023-f4fcfdd68e97@redhat.com>
 <dbbab7f6-18c4-9b6c-799e-8267797a31bd@huawei.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <d3443cbe-8752-0943-95b8-185d436de2fd@redhat.com>
Date: Fri, 7 Jul 2017 11:43:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <dbbab7f6-18c4-9b6c-799e-8267797a31bd@huawei.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Fri, 07 Jul 2017 09:43:27 +0000 (UTC)
Cc: mtsirkin@redhat.com, kvm@vger.kernel.org, tbaicar@codeaurora.org,
 qemu-devel@nongnu.org, wangxiongfeng2@huawei.com, ben@skyportsystems.com,
 linux@armlinux.org.uk, kvmarm@lists.cs.columbia.edu, huangshaoyu@huawei.com,
 songwenjun@huawei.com, wuquanming@huawei.com, marc.zyngier@arm.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com, linux-arm-kernel@lists.infradead.org,
 ard.biesheuvel@linaro.org, imammedo@redhat.com
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: sx7Ucu9TvJyg

On 07/07/17 10:32, gengdongjiu wrote:
> Hi Laszlo,
>    sorry for my late response.
> 
> On 2017/6/3 20:01, Laszlo Ersek wrote:
>> On 05/22/17 16:23, Laszlo Ersek wrote:
>>> Keeping some context:
>>>
>>> On 05/12/17 23:00, Laszlo Ersek wrote:
>>>> On 04/30/17 07:35, Dongjiu Geng wrote:
>>
>>> (68) In the code below, you are not taking an "OVMF header probe
>>> suppressor" into account.
>>>
>>> But, we have already planned to replace that quirk with a separate,
>>> dedicated allocation hint or command, so I'm not going to describe what
>>> an "OVMF header probe suppressor" is; instead, I'll describe the
>>> replacement for it.
>>>
>>> [...]
>>
>> So, the NOACPI allocation hint is a no-go at the moment, based on the
>> discussion in the following threads:
>>
>> http://mid.mail-archive.com/20170601112241.2580-1-ard.biesheuvel@linaro.org
>>
>> http://mid.mail-archive.com/c76b36de-ebf9-c662-d454-0a95b43901e8@redhat.com
>>
>> Therefore the header probe suppression remains necessary.
>>
>> In this case, it is not hard to do, you just have to reorder the
>> following two ADD_POINTER additions a bit:
>  Ok, it is no problem.
> 
>>
>>>>> +
>>>>> +        bios_linker_loader_add_pointer(linker, GHES_ERRORS_FW_CFG_FILE,
>>>>> +                                sizeof(uint64_t) * i, sizeof(uint64_t),
>>>>> +                                GHES_ERRORS_FW_CFG_FILE,
>>>>> +                                MAX_ERROR_SOURCE_COUNT_V6 * sizeof(uint64_t) +
>>>>> +                                i * MAX_RAW_DATA_LENGTH);
>>
>> This one should be moved out to a separate loop, after the current loop.
>>
>>>>> +        bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
>>>>> +                    address_registers_offset
>>>>> +                    + i * sizeof(AcpiGenericHardwareErrorSource),
>>>>> +                    sizeof(uint32_t), GHES_ERRORS_FW_CFG_FILE,
>>>>> +                    i * sizeof(uint64_t));
>>
>> This one should be kept in the first (i.e., current) loop.
>>
>> The idea is, when you first point the HEST/GHES_n entries in
>> ACPI_BUILD_TABLE_FILE to the "address registers" in
>> GHES_ERRORS_FW_CFG_FILE, all those address registers will still be
>> zero-filled. This will fail the ACPI table header probe in
>> OvmfPkg/AcpiPlatformDxe, which is what we want.
>>
>> After this is done, the address registers in GHES_ERRORS_FW_CFG_FILE
>> should be pointed to the error status data blocks in the same fw_cfg
>> blob, in a separate loop. (Those error status data blocks will again be
>> zero-filled, so no ACPI table headers will be mistakenly recognized in
>> them.)
> I understand your idear. but I have a question:
> how about we exchange the two function's place, such as shown below:
> then it still meets ours needs, the change is easy.
> For every loop:
> (1)when patch address in ACPI_BUILD_TABLE_FILE to the "address registers", the address register is zero-filed.
> (2)when patch address in GHES_ERRORS_FW_CFG_FILE to the error status data blocks, the error status data block is still zero-filed.
> 
>     for (i = 0; i < GHES_ACPI_HEST_NOTIFY_RESERVED; i++) {
>         .....................................
>         bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
>                     address_registers_offset
>                     + i * sizeof(AcpiGenericHardwareErrorSource),
>                     sizeof(uint32_t), GHES_ERRORS_FW_CFG_FILE,
>                     i * sizeof(uint64_t));
> 
> 
>         bios_linker_loader_add_pointer(linker, GHES_ERRORS_FW_CFG_FILE,
>                                 sizeof(uint64_t) * i, sizeof(uint64_t),
>                                 GHES_ERRORS_FW_CFG_FILE,
>                                 MAX_ERROR_SOURCE_COUNT_V6 * sizeof(uint64_t) +
>                                 i * MAX_RAW_DATA_LENGTH);
> 	.........................................
> 
>      }

Your suggestion seems to do the same, but there is a subtle difference.

When the firmware scans the targets of the ADD_POINTER commands for byte
sequences that "look like" an ACPI table header, in order to suppress
that probe, we should keep 36 bytes (i.e., the size of the ACPI table
header structure) zeroed at the target location.

* In the patch, as posted, this was not the case, because it first
filled in the address register inside the GHES_ERRORS_FW_CFG_FILE blob,
and then pointed a GHES pointer field in the HEST table to the *now*
nonzero address register.

* My suggestion was to first fill in all the GHES pointers (when still
all the pointed-to address registers are zero), and then the address
registers themselves should be patched.

Under this scheme, it is irrelevant whether both loops are incrementing
or decrementing loops.

* Your suggestion would preserve the safe patching order between any
given GHES field and its corresponding (pointed-to) address register. So
that's great.

However, consider the following case:

- Assume that the loop is decrementing, and not incrementing.

- First, the last GHES pointer field, GHES[9].<whatever> is patched. It
is pointed to the last address register in "etc/hardware_errors", which
is still zero-filled. Also, the last address register in
"etc/hardware_errors" is immediately followed by the first Error Status
Data Block, which is also filled with zero. This means that when the
header probe will look at the *target* of GHES[9].<whatever>, it will
definitely fail (which is what we want), because all consecutive 36
bytes that start at the last address register in "etc/hardware_errors"
are zero.

- Second, the last address register, address[9], is patched. It is
pointed to the last Error Status Data Block, which is zero filled, so
the header probe in the firmware fails -- great.

- Third, GHES[8].<whatever> is patched. It is set to &address[8].
However, at this point, the 36 consecutive bytes starting at &address[8]
are *not* all zero, because at relative offset 8, we have the already
patched address[9] register, which is nonzero. I'm not saying that this
would necessarily cause a problem, but we'd better be safe than sorry.


In other words, your suggestion is OK, because the loop we have is
incrementing, not decrementing. But, if you decide to go with your idea,
please add a comment before the "for" instruction, "this loop must
remain an incrementing loop, to safely suppress the ACPI SDT header
probe in the firmware".

Thanks
Laszlo
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
