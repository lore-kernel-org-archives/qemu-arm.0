Received: by 10.25.0.23 with SMTP id 23csp356225lfa;
        Sat, 3 Jun 2017 05:02:12 -0700 (PDT)
X-Received: by 10.98.16.215 with SMTP id 84mr11352229pfq.210.1496491332106;
        Sat, 03 Jun 2017 05:02:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496491332; cv=none;
        d=google.com; s=arc-20160816;
        b=TTqtn5Fw7whWyFvboo2cXQ98Q9ZPlMNLDzxgmRPrDDo0QKFPQnMUkOX1yjyQaZxIjJ
         nOZoGar/rqhrcrxCTEiVhMeLiX9mo0038oj3bktCInvP0bF8iKo4gK3rLZCt3dax9P00
         MSo6i1Fmx4hv3baC1we3lNdqJMt0ljGAVUWMwpDF31l2RtDw9Gg7sEI1SAZU9aHq3LbP
         +jjb10XszmGyYlQ8IswzYBhRvqHWY1MtMccsu/3qTnZUQYZv65NQM0FyZ/hTuC3rvA+g
         ytt75AZMV+mRuTYwYklS38nNkNLUishkYmP93A5A7Rmz/n2Kg3ABvF7DUMTB79zJFssr
         ngHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:cc:to:from:subject:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=nlmyinwvBbW8nALNGNmZra3RyiKvKztCwSQpZ7BuXY0=;
        b=Q8I6ohuzZPPm/gQlEcL33EbSM626xzrJmAMRnZ0E3PfFKCmNNF7MmTnAgyT9K2ffkb
         YGJ5ZH+P+EGxvSPCVzETg+H9vhI2wkKZsr/u2bHC2cRuvjgaabQyKpcVGN8O0nLxCy4a
         RtGcU78cPDSDMtYl3cNRhhXE3azofgqiVBxhpeD8y6GPyBWfhmkAaVo8OkLi8PduRXyX
         s2cAKAWFt8ADOMP5GKDbj9PxEaywppECU2iXQWhxgbvq24u1msQvERRAqMk16zwtXoXU
         Y9qZePJ8LVMAFYskQLra6Juj8Z9pCQHZWqDkT0vNQ05EIvl69DPk/SHOJTe214odp1lR
         W8ZA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id b2si25451105pgc.211.2017.06.03.05.02.11;
        Sat, 03 Jun 2017 05:02:12 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751149AbdFCMCI (ORCPT <rfc822;francois.ozog@linaro.org>
        + 6 others); Sat, 3 Jun 2017 08:02:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55862 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750832AbdFCMCH (ORCPT <rfc822;kvm@vger.kernel.org>);
        Sat, 3 Jun 2017 08:02:07 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 9BBB8C04B939;
        Sat,  3 Jun 2017 12:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9BBB8C04B939
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com; dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com; spf=pass smtp.mailfrom=lersek@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 9BBB8C04B939
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-19.phx2.redhat.com [10.3.116.19])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0BDE27BAE2;
        Sat,  3 Jun 2017 12:01:52 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH v3 1/4] ACPI: Add APEI GHES Table Generation
 support
From:   Laszlo Ersek <lersek@redhat.com>
To:     Dongjiu Geng <gengdongjiu@huawei.com>
Cc:     james.morse@arm.com, marc.zyngier@arm.com,
        christoffer.dall@linaro.org, rkrcmar@redhat.com,
        linux@armlinux.org.uk, tbaicar@codeaurora.org, imammedo@redhat.com,
        zhaoshenglong@huawei.com, peter.maydell@linaro.org,
        pbonzini@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
        ard.biesheuvel@linaro.org, mtsirkin@redhat.com, drjones@redhat.com,
        ben@skyportsystems.com, kvm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        songwenjun@huawei.com, wuquanming@huawei.com,
        huangshaoyu@huawei.com, wangxiongfeng2@huawei.com,
        xiexiuqi@huawei.com
References: <1493530506-26833-1-git-send-email-gengdongjiu@huawei.com>
 <4dde45bb-a730-82b1-dc49-ad00a6b73d85@redhat.com>
 <accf8880-f4b0-85f1-9f33-4103c8c26d7a@redhat.com>
Message-ID: <e90c5fb8-e68b-a620-9023-f4fcfdd68e97@redhat.com>
Date:   Sat, 3 Jun 2017 14:01:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <accf8880-f4b0-85f1-9f33-4103c8c26d7a@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Sat, 03 Jun 2017 12:02:07 +0000 (UTC)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: qxdfyG8/hWHo

On 05/22/17 16:23, Laszlo Ersek wrote:
> Keeping some context:
> 
> On 05/12/17 23:00, Laszlo Ersek wrote:
>> On 04/30/17 07:35, Dongjiu Geng wrote:

> (68) In the code below, you are not taking an "OVMF header probe
> suppressor" into account.
> 
> But, we have already planned to replace that quirk with a separate,
> dedicated allocation hint or command, so I'm not going to describe what
> an "OVMF header probe suppressor" is; instead, I'll describe the
> replacement for it.
> 
> [...]

So, the NOACPI allocation hint is a no-go at the moment, based on the
discussion in the following threads:

http://mid.mail-archive.com/20170601112241.2580-1-ard.biesheuvel@linaro.org

http://mid.mail-archive.com/c76b36de-ebf9-c662-d454-0a95b43901e8@redhat.com

Therefore the header probe suppression remains necessary.

In this case, it is not hard to do, you just have to reorder the
following two ADD_POINTER additions a bit:

>>> +
>>> +        bios_linker_loader_add_pointer(linker, GHES_ERRORS_FW_CFG_FILE,
>>> +                                sizeof(uint64_t) * i, sizeof(uint64_t),
>>> +                                GHES_ERRORS_FW_CFG_FILE,
>>> +                                MAX_ERROR_SOURCE_COUNT_V6 * sizeof(uint64_t) +
>>> +                                i * MAX_RAW_DATA_LENGTH);

This one should be moved out to a separate loop, after the current loop.

>>> +        bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
>>> +                    address_registers_offset
>>> +                    + i * sizeof(AcpiGenericHardwareErrorSource),
>>> +                    sizeof(uint32_t), GHES_ERRORS_FW_CFG_FILE,
>>> +                    i * sizeof(uint64_t));

This one should be kept in the first (i.e., current) loop.

The idea is, when you first point the HEST/GHES_n entries in
ACPI_BUILD_TABLE_FILE to the "address registers" in
GHES_ERRORS_FW_CFG_FILE, all those address registers will still be
zero-filled. This will fail the ACPI table header probe in
OvmfPkg/AcpiPlatformDxe, which is what we want.

After this is done, the address registers in GHES_ERRORS_FW_CFG_FILE
should be pointed to the error status data blocks in the same fw_cfg
blob, in a separate loop. (Those error status data blocks will again be
zero-filled, so no ACPI table headers will be mistakenly recognized in
them.)

Thanks
Laszlo
