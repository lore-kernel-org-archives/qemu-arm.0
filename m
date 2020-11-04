Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp303691lfb;
        Wed, 4 Nov 2020 14:28:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqMEkzMkfS0R8wMV2L+WaKNVPqC53mNY94uPzxmMK7iGHejYDWYre9gMqKSEi7SMZvplgG
X-Received: by 2002:a25:bfcc:: with SMTP id q12mr51629ybm.194.1604528919274;
        Wed, 04 Nov 2020 14:28:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604528919; cv=none;
        d=google.com; s=arc-20160816;
        b=BmrXTiMXjWHdzn0QkNElyTZ8inLTWB10tNRvLn1uUCf8d/e+So/dw+c03Ls5fBb7st
         5yXYvssWXjDT/PT6JBiRv8P3sv5FgtEzx4wPlDv5yqEBXNMVm3U5IHwO5WzOL3OCWG5F
         KkE9nnShLkOZLJLa6IHD7Xoq42SRECp0lBKE6TvQE2j2UAwG19w8ZJorPfw/VVXGiQ+i
         gDyi+xnSQ4gkWajxc3TNa0ZQqVaxT5nAMysdoXelpDHWogKe/mci3NMWh2a1cFRJOrJT
         9XcBo2s1ibj6FMztRlOKTEmqAAtb/hjesRY8gKjLpAB2OzSMFw1n+EvlzMCC3tCKFmBc
         n0ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=hEbL91Asn3qB5EGYAE7gCUhnoj8YyRHtE+UpCpQ170k=;
        b=UTrGQebbfuycjlRWBCbs+WVbtTJet8VXOKblsQEeDjyvo/um00bPwRy8AiIe6BK8K+
         svCx4Ntgqa0SZhKnckwhW6UvM39eb5ieaQsyu/Cnvdpn+bYsIH73nT2bRPqOqRGRdDTG
         gZJGkwW64R48mIyp2exvIsLcdBYFg5oGukxmplNKAsffc7/63bUYfNaaI2ROPoOptCwl
         K/8R1sdqJ5113n5j66LoKMMseVSpd3squNtJUZ962ZLdEPFGERukfrVz1vTamJiOCCZy
         cN/d/lkM6WrR5llJ447+bIhkFVJgf3xGIkPxqU11bxX69U0ssKgQn3krsmMGOyrguN9D
         PAZw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=arm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d6si3447501ybk.337.2020.11.04.14.28.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Nov 2020 14:28:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=arm.com
Received: from localhost ([::1]:59046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kaRGg-0007OE-Kf
	for alex.bennee@linaro.org; Wed, 04 Nov 2020 17:28:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ard.biesheuvel@arm.com>)
 id 1kaQmu-0003qA-9t; Wed, 04 Nov 2020 16:57:52 -0500
Received: from foss.arm.com ([217.140.110.172]:36988)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ard.biesheuvel@arm.com>)
 id 1kaQmr-0000et-O7; Wed, 04 Nov 2020 16:57:51 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08C4C14BF;
 Wed,  4 Nov 2020 13:57:43 -0800 (PST)
Received: from [192.168.1.81] (unknown [10.37.8.17])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA6273F719;
 Wed,  4 Nov 2020 13:57:40 -0800 (PST)
Subject: Re: Question on UEFI ACPI tables setup and probing on arm64
To: Laszlo Ersek <lersek@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ying Fang <fangying1@huawei.com>
References: <ee3b7fdf-f6ba-cafc-5b44-42b0bcda01c5@huawei.com>
 <20201103133913.1fee3337@redhat.com>
 <a79383a6-92d4-5b10-d143-414543caab70@redhat.com>
From: Ard Biesheuvel <ard.biesheuvel@arm.com>
Message-ID: <a21964bc-d603-9a3c-1012-627088688ce1@arm.com>
Date: Wed, 4 Nov 2020 22:57:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a79383a6-92d4-5b10-d143-414543caab70@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=217.140.110.172;
 envelope-from=ard.biesheuvel@arm.com; helo=foss.arm.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/04 16:57:43
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 04 Nov 2020 17:28:29 -0500
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Drew Jones <drjones@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 "wangzhigang17@huawei.com" <wangzhigang17@huawei.com>, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3j2tc1uiq2yO

On 11/4/20 10:46 PM, Laszlo Ersek wrote:
...
> 
> (9) (Ard, please correct the below if necessary; thanks.)
> 
> The UEFI stub of the guest kernel (which is a UEFI application) uses a
> device tree as its main communication channel to the (later-started)
> kernel entry point, AIUI.
> 
> The UEFI stub basically inverts the importance of the UEFI system table
> versus the device tree -- the UEFI stub *converts* the UEFI system table
> (the multitude of UEFI config tables) into a device tree. This is my
> understanding anyway.
> 

Not entirely. The UEFI stub uses DT to communicate with the kernel 
proper, just like a non-EFI bootloader does. There are two pieces of 
information regarding EFI that the stub passes via the device tree:
- the EFI system table address
- the EFI memory map (address, size, descriptor size etc)

(Aside: unfortunately, we cannot pass the latter information via a EFI 
configuration table, given that we call SetVirtualAddressMap() in the 
stub, which causes the config_tables member of the system table to be 
converted into a virtual address. That virtual address can only be 
converted into a physical address if we have access to the EFI memory map.)

All other information passed between the EFI stub and the kernel proper 
is passed via Linux-specific EFI configuration tables.

> (9a) If ACPI was disabled on the QEMU command line, then the guest
> kernel *adopts* the device tree that was forwarded to it in (6), via the
> UEFI config table marked with DEVICE_TREE_GUID.
> 

Yes, although the EFI stub updates/augments it with the two data items 
mentioned above, as well as the kernel command line, initrd base and 
size and a KASLR seed [if enabled].

> (9b) If ACPI was enabled on the QEMU command line, then the UEFI stub
> creates a brand new (empty) device tree (AIUI).
>

... unless GRUB executed first and loaded a initrd, and passed this 
information via the device tree. In this case, GRUB creates an empty DT 
(Note that I posted the GRUB patches to implement LoadFile2 based initrd 
loading just a week or so ago)

> Either way, the UEFI system table is linked *under* the -- adopted or
> new -- device tree, through the "chosen" node. And so, if ACPI was
> enabled, the ACPI RSD PTR (coming from step (7)) becomes visible to the
> kernel proper as well, through the UEFI config table with
> ACPI_20_TABLE_GUID.
> 
> I believe this is implemented under "drivers/firmware/efi/libstub" in
> the kernel tree.
> 
> Thanks,
> Laszlo
> 

