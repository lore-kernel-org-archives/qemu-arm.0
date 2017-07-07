Received: by 10.25.44.15 with SMTP id s15csp3055037lfs;
        Fri, 7 Jul 2017 01:32:55 -0700 (PDT)
X-Received: by 10.200.50.93 with SMTP id y29mr68651013qta.108.1499416375180;
        Fri, 07 Jul 2017 01:32:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499416375; cv=none;
        d=google.com; s=arc-20160816;
        b=Saz50FngmQociplHxU+OC1l/jBzBz3gulcNnXRSTNyQUcJD2IIFZ14Fzy/N5yyKHDA
         ApYEUN+2CwF8vObQg1eKvXK4C1wsPM+l33dYZs7kFe/be61OdEa8w0Fdk2Fi23mqSbG1
         Sf1pYx/R960K1WnwHI6AAYNCaIrSSloJc11USdDu+23bQqwwPrIBgTAWUzsSj52e3/Yh
         sPIDQpVy+oti71NS6I9+t199GCXfTofPXKe8rsH0x/4kFdJChX3S/qG1NBNHSlW9sOf0
         xlnPzHXUKqxme6y4UsE/zL0wzdyVaAD048+9x3ahBJlgEFXBJJTzH12xMfjRbiXzJybC
         8l5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject:arc-authentication-results;
        bh=d5ctj7DVZab9YITiIX0LAnJvp2DrOmOYHuWoAoZODrs=;
        b=APyes+WS/skxsPC1iDdZ98ou4Snp0VhiM1/uCVbQW0KufyNLy26ns6jyHMuobJNhwj
         hFNEt8BeuaI0e9Q/MmWCFreAQidhVtUOUJ4jeZExyvuIdx7qI3w3Y16D44kHmOxK5nGY
         rpiSvaG++CYj46H753HddJSbxiCqhr6fdxuA5iZUINCag+oPrGJVdoEi+KjIuldZacDy
         fexnL1uRHZMRnUy6wm6dT5Uf8du6DaVX255Q88eEIO6n/XaSjL8sCqitjX1uFNsrCj4o
         OTqIJo+DdfhHCJtBz659KclpcRYUyA2ZgQF1oY3GG98KCiP14CR2fsqTHS++/iGRzqXr
         G9KQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id d197si2553699qkg.242.2017.07.07.01.32.54;
        Fri, 07 Jul 2017 01:32:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 39BFE40D5E;
	Fri,  7 Jul 2017 04:32:28 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.799
X-Spam-Level: 
X-Spam-Status: No, score=0.799 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nhDxco5iqGrV; Fri,  7 Jul 2017 04:32:27 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 3E4FD40CE6;
	Fri,  7 Jul 2017 04:32:27 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id A3D1F40CE6
 for <kvmarm@lists.cs.columbia.edu>; Fri,  7 Jul 2017 04:32:25 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FGohKL4LVjLc for <kvmarm@lists.cs.columbia.edu>;
 Fri,  7 Jul 2017 04:32:24 -0400 (EDT)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 88AC640427
 for <kvmarm@lists.cs.columbia.edu>; Fri,  7 Jul 2017 04:32:22 -0400 (EDT)
Received: from 172.30.72.56 (EHLO dggeml405-hub.china.huawei.com)
 ([172.30.72.56])
 by dggrg03-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
 with ESMTP id AQS87433; Fri, 07 Jul 2017 16:32:24 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by dggeml405-hub.china.huawei.com
 (10.3.17.49) with Microsoft SMTP Server id 14.3.301.0; Fri, 7 Jul 2017
 16:32:14 +0800
Subject: Re: [Qemu-devel] [PATCH v3 1/4] ACPI: Add APEI GHES Table Generation
 support
To: Laszlo Ersek <lersek@redhat.com>
References: <1493530506-26833-1-git-send-email-gengdongjiu@huawei.com>
 <4dde45bb-a730-82b1-dc49-ad00a6b73d85@redhat.com>
 <accf8880-f4b0-85f1-9f33-4103c8c26d7a@redhat.com>
 <e90c5fb8-e68b-a620-9023-f4fcfdd68e97@redhat.com>
From: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <dbbab7f6-18c4-9b6c-799e-8267797a31bd@huawei.com>
Date: Fri, 7 Jul 2017 16:32:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <e90c5fb8-e68b-a620-9023-f4fcfdd68e97@redhat.com>
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
 refid=str=0001.0A090206.595F471B.0084, ss=1, re=0.000, recu=0.000, reip=0.000,
 cl=1, cld=1, fgs=0, ip=0.0.0.0,
 so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: b8887e803ab9a5af467713e6f3a41e2a
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
X-TUID: 3eFVnd12TaI0

Hi Laszlo,
   sorry for my late response.

On 2017/6/3 20:01, Laszlo Ersek wrote:
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
 Ok, it is no problem.

> 
>>>> +
>>>> +        bios_linker_loader_add_pointer(linker, GHES_ERRORS_FW_CFG_FILE,
>>>> +                                sizeof(uint64_t) * i, sizeof(uint64_t),
>>>> +                                GHES_ERRORS_FW_CFG_FILE,
>>>> +                                MAX_ERROR_SOURCE_COUNT_V6 * sizeof(uint64_t) +
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
I understand your idear. but I have a question:
how about we exchange the two function's place, such as shown below:
then it still meets ours needs, the change is easy.
For every loop:
(1)when patch address in ACPI_BUILD_TABLE_FILE to the "address registers", the address register is zero-filed.
(2)when patch address in GHES_ERRORS_FW_CFG_FILE to the error status data blocks, the error status data block is still zero-filed.

    for (i = 0; i < GHES_ACPI_HEST_NOTIFY_RESERVED; i++) {
        .....................................
        bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
                    address_registers_offset
                    + i * sizeof(AcpiGenericHardwareErrorSource),
                    sizeof(uint32_t), GHES_ERRORS_FW_CFG_FILE,
                    i * sizeof(uint64_t));


        bios_linker_loader_add_pointer(linker, GHES_ERRORS_FW_CFG_FILE,
                                sizeof(uint64_t) * i, sizeof(uint64_t),
                                GHES_ERRORS_FW_CFG_FILE,
                                MAX_ERROR_SOURCE_COUNT_V6 * sizeof(uint64_t) +
                                i * MAX_RAW_DATA_LENGTH);
	.........................................

     }

thanks

> 
> Thanks
> Laszlo
> 
> 
> .
> 

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
