Received: by 10.25.44.15 with SMTP id s15csp1899277lfs;
        Sat, 8 Jul 2017 20:41:19 -0700 (PDT)
X-Received: by 10.237.49.133 with SMTP id 5mr78822110qth.53.1499571679356;
        Sat, 08 Jul 2017 20:41:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499571679; cv=none;
        d=google.com; s=arc-20160816;
        b=SvGIaZfhScKUaWfusl5MmHmCWWTEeZlY8lq3kRt/AYzRMMASd1OdI8NFBtwUU1Kn/m
         mAh5wQwhajX8PAhr1UgsX4Z7z1d3sJzqca856Rw78FgouqE2wXsTdR/arIFDOqmeEtV0
         yXgK8WB3abdhuEmOsBedgEV6ItlasFAAEN5whQpVHe40JrJ3wJu7J97L6hSExGw4mQu0
         qJkYxmWAm+mcnBVXSSrforW6BfTu8ldJeTzyb+2Vx/NYTt2wt22VjlQgjpgVgoqCKNk1
         dn3j8M9f9ELt921OyGUvCJIRNlDqkO23fzyDpjkWwKYIJ5qRyVkLxViG6XPVsGgi72nH
         sTaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc:to
         :subject:message-id:date:from:references:in-reply-to:mime-version
         :dkim-signature:arc-authentication-results;
        bh=Yv3CnlO64A6qUgaUvPirW6ZlUCow1L4osnMKqebM1m8=;
        b=O0fkAHl1y14MNLIuw9otYcuJgunAcXZDEG2xqAKMRfyIzvfJDYUJL2kKA0kppPGnkt
         Ani/ZhmQU+OkLPMQK5qGV8cnFm3bXLvMk79Qvls/HacZJAUqqLqXNwP8iBX5wRyvTJi4
         T8wHYmwkYhYmMRJPP5BpQ01ix2nqyJjKbneCLWyXVIpzu79MehVlrm9BCtN39Z9NZ+3L
         Qv1dMPQnCMF97G4MMWnT9SfEnAsbDowbS7Ps8q6TVmbBWzOQqrGJa/QGQYFj91x9I9s8
         dfQfWZo2IGME3PNVY0yJDDeG98SZv3jJQk7T6NUzESfF/iXQeYFKFcUCiyx8YL0KffVF
         6LDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.b=E1/nubsd;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id s6si7358429qtd.316.2017.07.08.20.41.18;
        Sat, 08 Jul 2017 20:41:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.b=E1/nubsd;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id EDA9F41015;
	Sat,  8 Jul 2017 23:40:47 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.911
X-Spam-Level: 
X-Spam-Status: No, score=0.911 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_ADSP_CUSTOM_MED=0.001, DKIM_SIGNED=0.1,
	DNS_FROM_AHBL_RHSBL=2.699, FREEMAIL_FROM=0.001,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@gmail.com
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YBG5gC1qqFjs; Sat,  8 Jul 2017 23:40:46 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id B29B140D31;
	Sat,  8 Jul 2017 23:40:46 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id B065040CE6
 for <kvmarm@lists.cs.columbia.edu>; Sat,  8 Jul 2017 23:40:44 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 15-Hbi2gOVz3 for <kvmarm@lists.cs.columbia.edu>;
 Sat,  8 Jul 2017 23:40:42 -0400 (EDT)
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
 [209.85.161.193])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id C48BC40CE4
 for <kvmarm@lists.cs.columbia.edu>; Sat,  8 Jul 2017 23:40:42 -0400 (EDT)
Received: by mail-yw0-f193.google.com with SMTP id f200so3671251ywb.0
 for <kvmarm@lists.cs.columbia.edu>; Sat, 08 Jul 2017 20:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=6SfSoKvpbrtTpYBiU7nHGyUMNMss1NcbpQlELgEZi5c=;
 b=E1/nubsdDddARHwoSlT41P25cqlr0JeHGXwhEs1EkUgE7emZjoT9R6sqewAV/sxVPJ
 NIb2TV0jK2FypfDZyyVzYlSCSkCEHf8Q7uWZ6phy5ngis8rq/MpW5ZcNBMln9oQlkB15
 /H/5ot8HMMhEs3JZd84cNt3DzNsZIn8rmg9ZTrbIa1nIlIMfmZipYRQmaOoIuKDjdxP4
 mzGYMe+Iek9r8VU8/K4DaTFSAJW/Un478r9x9WHWPFRa/Lc3BG02J47YrBVLAetMNj84
 tTaK9TTRzWuhkrjL/F3AqRL9zs4HxgqC1h/uojBW8ycNNLJlSnkPs50F4zyzy+AU6WUA
 WIuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=6SfSoKvpbrtTpYBiU7nHGyUMNMss1NcbpQlELgEZi5c=;
 b=cdgYCPya4x2xxZF3Wws+RA/vBu+DVpISH8BTS5WtbLx2taxWBXf33fYTXiBBkl/w7m
 /iE0zqF8s/dyEoMAGuAhHgBrzJsIECaLS2mxVxG5iCLtYjjN1/Kbn+u43dfXpMhqDkmO
 hK2eo0OrG9Dlg9lEvSw6tMrUPo6YEXMMZAH4aFTmGiVym1OIPe6ThVTorWAa3QosxfW+
 vO+Ya9EYYkjhwzuFCt8nx3jvJtD26Q/x+NNwlwZ6hURsvjCTHpMhvNbnfGzwJG5OE4xl
 1kXszSsN86mSJ1uu2qTTFR5Npt+7JRdJEEFQqDvg4diROAT8kpi0eVOFaYCMBJbqyXV6
 IpIw==
X-Gm-Message-State: AIVw1109iRdjzoj7gO190v3QmCK/3g0Cs4CTNKnMIxRlA4AcG4a+Jqad
 OxP/rSWtfv/QLYJOi+QHO19QgNq5BA==
X-Received: by 10.129.56.84 with SMTP id f81mr7094612ywa.75.1499571671866;
 Sat, 08 Jul 2017 20:41:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.199.4 with HTTP; Sat, 8 Jul 2017 20:41:11 -0700 (PDT)
In-Reply-To: <d3443cbe-8752-0943-95b8-185d436de2fd@redhat.com>
References: <1493530506-26833-1-git-send-email-gengdongjiu@huawei.com>
 <4dde45bb-a730-82b1-dc49-ad00a6b73d85@redhat.com>
 <accf8880-f4b0-85f1-9f33-4103c8c26d7a@redhat.com>
 <e90c5fb8-e68b-a620-9023-f4fcfdd68e97@redhat.com>
 <dbbab7f6-18c4-9b6c-799e-8267797a31bd@huawei.com>
 <d3443cbe-8752-0943-95b8-185d436de2fd@redhat.com>
From: gengdongjiu <gengdj.1984@gmail.com>
Date: Sun, 9 Jul 2017 11:41:11 +0800
Message-ID: <CAMj-D2DQDFcuMO7aaqWQhMC4u7fgd9GHR6=i9J86tqEDZ+=Nag@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v3 1/4] ACPI: Add APEI GHES Table Generation
 support
To: Laszlo Ersek <lersek@redhat.com>
Cc: songwenjun@huawei.com, mtsirkin@redhat.com, ben@skyportsystems.com,
 kvm@vger.kernel.org, ard.biesheuvel@linaro.org, marc.zyngier@arm.com,
 pbonzini@redhat.com, tbaicar@codeaurora.org, qemu-devel@nongnu.org,
 gengdongjiu <gengdongjiu@huawei.com>, imammedo@redhat.com,
 wuquanming@huawei.com, kvmarm@lists.cs.columbia.edu, qemu-arm@nongnu.org,
 huangshaoyu@huawei.com, linux@armlinux.org.uk, wangxiongfeng2@huawei.com,
 linux-arm-kernel@lists.infradead.org
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
X-TUID: Jd1B9CKOGUf9

Laszlo,
  thanks for your clear and detailed answer. I completely understand
what you mean.

2017-07-07 17:43 GMT+08:00, Laszlo Ersek <lersek@redhat.com>:
> On 07/07/17 10:32, gengdongjiu wrote:
>> Hi Laszlo,
>>    sorry for my late response.
>>
>> On 2017/6/3 20:01, Laszlo Ersek wrote:
>>> On 05/22/17 16:23, Laszlo Ersek wrote:
>>>> Keeping some context:
>>>>
>>>> On 05/12/17 23:00, Laszlo Ersek wrote:
>>>>> On 04/30/17 07:35, Dongjiu Geng wrote:
>>>
>>>> (68) In the code below, you are not taking an "OVMF header probe
>>>> suppressor" into account.
>>>>
>>>> But, we have already planned to replace that quirk with a separate,
>>>> dedicated allocation hint or command, so I'm not going to describe what
>>>> an "OVMF header probe suppressor" is; instead, I'll describe the
>>>> replacement for it.
>>>>
>>>> [...]
>>>
>>> So, the NOACPI allocation hint is a no-go at the moment, based on the
>>> discussion in the following threads:
>>>
>>> http://mid.mail-archive.com/20170601112241.2580-1-ard.biesheuvel@linaro.org
>>>
>>> http://mid.mail-archive.com/c76b36de-ebf9-c662-d454-0a95b43901e8@redhat.com
>>>
>>> Therefore the header probe suppression remains necessary.
>>>
>>> In this case, it is not hard to do, you just have to reorder the
>>> following two ADD_POINTER additions a bit:
>>  Ok, it is no problem.
>>
>>>
>>>>>> +
>>>>>> +        bios_linker_loader_add_pointer(linker,
>>>>>> GHES_ERRORS_FW_CFG_FILE,
>>>>>> +                                sizeof(uint64_t) * i,
>>>>>> sizeof(uint64_t),
>>>>>> +                                GHES_ERRORS_FW_CFG_FILE,
>>>>>> +                                MAX_ERROR_SOURCE_COUNT_V6 *
>>>>>> sizeof(uint64_t) +
>>>>>> +                                i * MAX_RAW_DATA_LENGTH);
>>>
>>> This one should be moved out to a separate loop, after the current loop.
>>>
>>>>>> +        bios_linker_loader_add_pointer(linker,
>>>>>> ACPI_BUILD_TABLE_FILE,
>>>>>> +                    address_registers_offset
>>>>>> +                    + i * sizeof(AcpiGenericHardwareErrorSource),
>>>>>> +                    sizeof(uint32_t), GHES_ERRORS_FW_CFG_FILE,
>>>>>> +                    i * sizeof(uint64_t));
>>>
>>> This one should be kept in the first (i.e., current) loop.
>>>
>>> The idea is, when you first point the HEST/GHES_n entries in
>>> ACPI_BUILD_TABLE_FILE to the "address registers" in
>>> GHES_ERRORS_FW_CFG_FILE, all those address registers will still be
>>> zero-filled. This will fail the ACPI table header probe in
>>> OvmfPkg/AcpiPlatformDxe, which is what we want.
>>>
>>> After this is done, the address registers in GHES_ERRORS_FW_CFG_FILE
>>> should be pointed to the error status data blocks in the same fw_cfg
>>> blob, in a separate loop. (Those error status data blocks will again be
>>> zero-filled, so no ACPI table headers will be mistakenly recognized in
>>> them.)
>> I understand your idear. but I have a question:
>> how about we exchange the two function's place, such as shown below:
>> then it still meets ours needs, the change is easy.
>> For every loop:
>> (1)when patch address in ACPI_BUILD_TABLE_FILE to the "address registers",
>> the address register is zero-filed.
>> (2)when patch address in GHES_ERRORS_FW_CFG_FILE to the error status data
>> blocks, the error status data block is still zero-filed.
>>
>>     for (i = 0; i < GHES_ACPI_HEST_NOTIFY_RESERVED; i++) {
>>         .....................................
>>         bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
>>                     address_registers_offset
>>                     + i * sizeof(AcpiGenericHardwareErrorSource),
>>                     sizeof(uint32_t), GHES_ERRORS_FW_CFG_FILE,
>>                     i * sizeof(uint64_t));
>>
>>
>>         bios_linker_loader_add_pointer(linker, GHES_ERRORS_FW_CFG_FILE,
>>                                 sizeof(uint64_t) * i, sizeof(uint64_t),
>>                                 GHES_ERRORS_FW_CFG_FILE,
>>                                 MAX_ERROR_SOURCE_COUNT_V6 *
>> sizeof(uint64_t) +
>>                                 i * MAX_RAW_DATA_LENGTH);
>> 	.........................................
>>
>>      }
>
> Your suggestion seems to do the same, but there is a subtle difference.
>
> When the firmware scans the targets of the ADD_POINTER commands for byte
> sequences that "look like" an ACPI table header, in order to suppress
> that probe, we should keep 36 bytes (i.e., the size of the ACPI table
> header structure) zeroed at the target location.
>
> * In the patch, as posted, this was not the case, because it first
> filled in the address register inside the GHES_ERRORS_FW_CFG_FILE blob,
> and then pointed a GHES pointer field in the HEST table to the *now*
> nonzero address register.
>
> * My suggestion was to first fill in all the GHES pointers (when still
> all the pointed-to address registers are zero), and then the address
> registers themselves should be patched.
>
> Under this scheme, it is irrelevant whether both loops are incrementing
> or decrementing loops.
>
> * Your suggestion would preserve the safe patching order between any
> given GHES field and its corresponding (pointed-to) address register. So
> that's great.
>
> However, consider the following case:
>
> - Assume that the loop is decrementing, and not incrementing.
>
> - First, the last GHES pointer field, GHES[9].<whatever> is patched. It
> is pointed to the last address register in "etc/hardware_errors", which
> is still zero-filled. Also, the last address register in
> "etc/hardware_errors" is immediately followed by the first Error Status
> Data Block, which is also filled with zero. This means that when the
> header probe will look at the *target* of GHES[9].<whatever>, it will
> definitely fail (which is what we want), because all consecutive 36
> bytes that start at the last address register in "etc/hardware_errors"
> are zero.
>
> - Second, the last address register, address[9], is patched. It is
> pointed to the last Error Status Data Block, which is zero filled, so
> the header probe in the firmware fails -- great.
>
> - Third, GHES[8].<whatever> is patched. It is set to &address[8].
> However, at this point, the 36 consecutive bytes starting at &address[8]
> are *not* all zero, because at relative offset 8, we have the already
> patched address[9] register, which is nonzero. I'm not saying that this
> would necessarily cause a problem, but we'd better be safe than sorry.

yes, it it. when the loop is  decrementing, my suggested method will
have problem.


>
>
> In other words, your suggestion is OK, because the loop we have is
> incrementing, not decrementing. But, if you decide to go with your idea,
> please add a comment before the "for" instruction, "this loop must
> remain an incrementing loop, to safely suppress the ACPI SDT header
> probe in the firmware".
Laszlo, I will use your method that separated them into different loop
to avoid the potential problem, thanks.


>
> Thanks
> Laszlo
> _______________________________________________
> kvmarm mailing list
> kvmarm@lists.cs.columbia.edu
> https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
>
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
