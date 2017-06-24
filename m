Received: by 10.25.15.197 with SMTP id 66csp631191lfp;
        Sat, 24 Jun 2017 07:20:13 -0700 (PDT)
X-Received: by 10.84.140.133 with SMTP id 5mr14906782plt.224.1498314013315;
        Sat, 24 Jun 2017 07:20:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498314013; cv=none;
        d=google.com; s=arc-20160816;
        b=0xUSKHkUz54mUFu/QKCMW6lHW/wWyDCWUpWYsaf6FgMrJd/2srHh94Hqk2A0+SnYOe
         WT9od/T/OvfW+kByki6a7lBeVUVoL2scdPA0oQqjkiusYpmJbVDYkpCSnOR+5ExJgz/o
         /wad9jNSAw6lQuoKyx3TD8iVmG6RyXZc9vKlkjeFCrxDwfXQrzS1e1jq6l89qUm7RddO
         PQtdVRUYg7cXHdQr/rCa0gnBBgdrYw56OMntSYrdS7DpYM+nmbtUEY08WwgdMXMtgBCQ
         9AeOadYeWxe3hmB3kROjkqAOIgNzFyAFf5Btwrne1aYvp0V+h+8VLFh8oHxgb8w1jm4m
         C9IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=eKM7YItq6Na7E7Y1XY8np2Oefjx0SyI86VJBEIhSEOA=;
        b=vMV2I3q3TxaS32qNCCwjHNWWe5UdglzJstrO0il6lrS1r6JlS38pLaj/9IOESy6jwK
         nWyVHMfQCxU/99ozcGQcn2MhVm3zkbn4zbmiFpsTUbYVyw7o0udNNitLQBBuBXMi5/Fe
         ATolyXfjbV/ikLSqB1OSH9N4bm5nXxUiPREDGjm0OkoRdXdhtXyMOrP7i2Lh6a6+jDqE
         rlPhWfVmD6u4usVNwFQV7ujTCq4XXDzIbq1aTZqYAwtJfiiCpGv2LXKEGa2irzUHAyMA
         UONLSRnvlZ61c9pDw06Nm236GLKmjOLuT5sLonTSlfTzsxZK6BTGrvKtnbEP18/iDQRT
         vWJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=Z4DW9g7B;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id u3si6043027plb.242.2017.06.24.07.20.12;
        Sat, 24 Jun 2017 07:20:13 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=Z4DW9g7B;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751384AbdFXOUK (ORCPT <rfc822;francois.ozog@linaro.org>
        + 6 others); Sat, 24 Jun 2017 10:20:10 -0400
Received: from mail-yb0-f194.google.com ([209.85.213.194]:34637 "EHLO
        mail-yb0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751313AbdFXOUJ (ORCPT <rfc822;kvm@vger.kernel.org>);
        Sat, 24 Jun 2017 10:20:09 -0400
Received: by mail-yb0-f194.google.com with SMTP id b189so181962yba.1
        for <kvm@vger.kernel.org>; Sat, 24 Jun 2017 07:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=eKM7YItq6Na7E7Y1XY8np2Oefjx0SyI86VJBEIhSEOA=;
        b=Z4DW9g7BN/7LgKj0FsH3wVz9Q+oPjR1NclK1MWJBISDp4KLS2PsZOzPIcWKvjDAB8I
         1m2fZa0z5oboovl0bxFfpKewooIzilyvw+eIL8gDGCPDHLnJndinLHFcLOIPej4sMdwJ
         eM/e3uwnigsTUjI613BVdQq+24T9c3ROXM1ceNTC8cw16xTfqR/dDHE9H63LC+IUWgBL
         7sQxW1GCuwhonKfS7y5aftg7k/Yp1PF7oy7bvsSs1ggfUj16FM9y13LNi8wLcZwgYAet
         tJSszxb+q1SjL9PftC1/q62t6rnmYLK9SJHW44vEpyhgMu2WIax9BH01ooRHtIlMA0Uv
         x61g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=eKM7YItq6Na7E7Y1XY8np2Oefjx0SyI86VJBEIhSEOA=;
        b=L8OuMWGsFRiE4xJ1w7sBZ3TWZ3luVZ6AOSGz3cJcDYyY8Ju23fde8zG2Gzmb3pDnYr
         c/O4TT6PlSJzSyliCXIxI+Oa4X5cgsm1Uw053ePE/IfysTDJ1YB5aNN6xBfcSgNcSrJG
         U7LtNK75CSTlYOj2qsa3qCo1UA1i523YOA7f6Wj+wNh52cWGNe+JZ87PqXxVdWDRMw+q
         agCnI+BT+u12/ANgIiDXz2U3ObBAaHaPjcR41WFozz4WpvpajQObNruzB4ZIZoy0+TLL
         Gna/HZbwmJxHWkBWX7MFj31gM797y8aBtZ3o1mLwZ1j4RVils/0EP7yhbA3X61JlzRGl
         91/w==
X-Gm-Message-State: AKS2vOwTvWiEQx8tvQhNxP6YI2ZqKHg636kJfG/SfV/yyyjsbAUc6g/D
        ughxGNxDZUyqc7DBtXK5djCHr5leGQ==
X-Received: by 10.37.204.138 with SMTP id l132mr9278932ybf.176.1498314008438;
 Sat, 24 Jun 2017 07:20:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.156.205 with HTTP; Sat, 24 Jun 2017 07:20:07 -0700 (PDT)
In-Reply-To: <e90c5fb8-e68b-a620-9023-f4fcfdd68e97@redhat.com>
References: <1493530506-26833-1-git-send-email-gengdongjiu@huawei.com>
 <4dde45bb-a730-82b1-dc49-ad00a6b73d85@redhat.com> <accf8880-f4b0-85f1-9f33-4103c8c26d7a@redhat.com>
 <e90c5fb8-e68b-a620-9023-f4fcfdd68e97@redhat.com>
From:   gengdongjiu <gengdj.1984@gmail.com>
Date:   Sat, 24 Jun 2017 22:20:07 +0800
Message-ID: <CAMj-D2DvCXd9TLM5+6OT=aUN1fV3vt1Uyni0PDFQstJmf+HiRg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v3 1/4] ACPI: Add APEI GHES Table Generation support
To:     Laszlo Ersek <lersek@redhat.com>
Cc:     Dongjiu Geng <gengdongjiu@huawei.com>, mtsirkin@redhat.com,
        kvm@vger.kernel.org, tbaicar@codeaurora.org, qemu-devel@nongnu.org,
        kvmarm@lists.cs.columbia.edu, ben@skyportsystems.com,
        linux@armlinux.org.uk, wangxiongfeng2@huawei.com,
        huangshaoyu@huawei.com, songwenjun@huawei.com,
        wuquanming@huawei.com, marc.zyngier@arm.com, qemu-arm@nongnu.org,
        imammedo@redhat.com, linux-arm-kernel@lists.infradead.org,
        ard.biesheuvel@linaro.org, pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: gHdTzpp5N40p

Laszlo,

  Thank you very much  for your carefully review again and again. I am
following your suggestion.


2017-06-03 20:01 GMT+08:00, Laszlo Ersek <lersek@redhat.com>:
> On 05/22/17 16:23, Laszlo Ersek wrote:
>> Keeping some context:
>>
>> On 05/12/17 23:00, Laszlo Ersek wrote:
>>> On 04/30/17 07:35, Dongjiu Geng wrote:
>
>> (68) In the code below, you are not taking an "OVMF header probe
>> suppressor" into account.
>>
>> But, we have already planned to replace that quirk with a separate,
>> dedicated allocation hint or command, so I'm not going to describe what
>> an "OVMF header probe suppressor" is; instead, I'll describe the
>> replacement for it.
>>
>> [...]
>
> So, the NOACPI allocation hint is a no-go at the moment, based on the
> discussion in the following threads:
>
> http://mid.mail-archive.com/20170601112241.2580-1-ard.biesheuvel@linaro.org
>
> http://mid.mail-archive.com/c76b36de-ebf9-c662-d454-0a95b43901e8@redhat.com
>
> Therefore the header probe suppression remains necessary.
>
> In this case, it is not hard to do, you just have to reorder the
> following two ADD_POINTER additions a bit:
>
>>>> +
>>>> +        bios_linker_loader_add_pointer(linker,
>>>> GHES_ERRORS_FW_CFG_FILE,
>>>> +                                sizeof(uint64_t) * i,
>>>> sizeof(uint64_t),
>>>> +                                GHES_ERRORS_FW_CFG_FILE,
>>>> +                                MAX_ERROR_SOURCE_COUNT_V6 *
>>>> sizeof(uint64_t) +
>>>> +                                i * MAX_RAW_DATA_LENGTH);
>
> This one should be moved out to a separate loop, after the current loop.
>
>>>> +        bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
>>>> +                    address_registers_offset
>>>> +                    + i * sizeof(AcpiGenericHardwareErrorSource),
>>>> +                    sizeof(uint32_t), GHES_ERRORS_FW_CFG_FILE,
>>>> +                    i * sizeof(uint64_t));
>
> This one should be kept in the first (i.e., current) loop.
>
> The idea is, when you first point the HEST/GHES_n entries in
> ACPI_BUILD_TABLE_FILE to the "address registers" in
> GHES_ERRORS_FW_CFG_FILE, all those address registers will still be
> zero-filled. This will fail the ACPI table header probe in
> OvmfPkg/AcpiPlatformDxe, which is what we want.
>
> After this is done, the address registers in GHES_ERRORS_FW_CFG_FILE
> should be pointed to the error status data blocks in the same fw_cfg
> blob, in a separate loop. (Those error status data blocks will again be
> zero-filled, so no ACPI table headers will be mistakenly recognized in
> them.)
>
> Thanks
> Laszlo
> _______________________________________________
> kvmarm mailing list
> kvmarm@lists.cs.columbia.edu
> https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
>
