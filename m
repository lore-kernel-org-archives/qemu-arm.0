Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4152341lfb;
        Mon, 9 Nov 2020 17:42:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx8Sadxzx/KUMu0QGIh9A5oWr2sC7yjh4jIh73D9UnetV5EcXMo01O6cfdZ4GPrXA+nNG2R
X-Received: by 2002:a25:4058:: with SMTP id n85mr1651464yba.69.1604972566385;
        Mon, 09 Nov 2020 17:42:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604972566; cv=none;
        d=google.com; s=arc-20160816;
        b=ezvSBlQdXxDCAAj33W+s0Po6DfsdQmk+jObOQ9RHWgceJwaEyD7uuZvCoKMSgeHbxa
         1xKR8cw3waJAEraDez6IdY0LSTvKbZVAl6+05kHC/KOhDkQJKgV3fZeoOqHfSn85ws3Q
         zOuoMJyKKu9Vku6ibhpT12aP6/ZfxzYPIqPl4IOwZRpGgsuPnqgbT1QCwKnssSqY6zdy
         WeaEuTFAhAJUwxpmBz1J03nD7q+hHQF2luw6/oCEyvi3qmvinxC1dWyNjB/rhI5KYxog
         t2UZBKSNPYdpile89TnGVRq9szfwlmb3OTMgzeK3EdR2adVCNpPN/8IFvwZifDzqik2N
         BP/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=kFbDyThXKCO8clqgG7Ms3URWnK1ZCYUU5NLSwffRfwg=;
        b=aLmgjdaVE8R43Fv5fAodyJTYUo7Q5SoYVXUGrx69lDsZhyv7RAr1HrY2i7kpK54Xp1
         4ID0KYVFrEmUvTVm7VqSzB8pLisY1V2t1DAud2gN6Ox/45imVqORofHEK4W7RKpJwJCd
         TAJRiTOLPR8vtv1qdjAOnpcDxTBC6a8p3FZSB+Yq/As7xsfzWC56tPfUxN6Fju/Abwyo
         qLZFbe+A7fUYkPdrcpuOx5p6AZp4zKXtdMMYZQlbETeLlRNrDggmtzUCtUYLB8XZKSaN
         oI+RErDBo7+TPf0yGa1AyCahnpAC7DGiUXaRdENzvan7ThzJV+clZDfde3G3x4Q9GEun
         xgrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x36si2663109ybh.491.2020.11.09.17.42.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Nov 2020 17:42:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kcIgH-0005CW-PM
	for alex.bennee@linaro.org; Mon, 09 Nov 2020 20:42:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kcIgA-0005CJ-0M; Mon, 09 Nov 2020 20:42:38 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kcIg7-00025v-Ac; Mon, 09 Nov 2020 20:42:37 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CVVwV4Q6Dz75Wv;
 Tue, 10 Nov 2020 09:42:18 +0800 (CST)
Received: from [10.174.186.67] (10.174.186.67) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Tue, 10 Nov 2020 09:42:15 +0800
Subject: Re: Question on UEFI ACPI tables setup and probing on arm64
To: Laszlo Ersek <lersek@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <ee3b7fdf-f6ba-cafc-5b44-42b0bcda01c5@huawei.com>
 <20201103133913.1fee3337@redhat.com>
 <a79383a6-92d4-5b10-d143-414543caab70@redhat.com>
 <5310d14d-8dbe-ba97-fdf1-4f3f10f91f3a@huawei.com>
 <813efc59-2ce4-e2be-894f-e48ca66ce603@redhat.com>
From: Ying Fang <fangying1@huawei.com>
Message-ID: <6bb20d74-6f62-696f-d515-64a5eb958d22@huawei.com>
Date: Tue, 10 Nov 2020 09:42:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <813efc59-2ce4-e2be-894f-e48ca66ce603@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=fangying1@huawei.com;
 helo=szxga07-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 20:42:26
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
 "wangzhigang17@huawei.com" <wangzhigang17@huawei.com>, "Ard Biesheuvel \(ARM
 address\)" <ard.biesheuvel@arm.com>, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7bxPh7x7rYH9



On 11/7/2020 1:09 AM, Laszlo Ersek wrote:
> On 11/05/20 05:30, Ying Fang wrote:
> 
>> I see it in Qemu the *loader_start* is fixed at 1 GiB on the
>> physical address space which points to the DRAM base. In ArmVirtQemu.dsc
>> PcdDeviceTreeInitialBaseAddress is set 0x40000000 with correspondence.
>>
>> Here I also see the discussion about DRAM base for ArmVirtQemu.
>> https://lists.gnu.org/archive/html/qemu-devel/2017-10/msg03127.html
>>
>> I am still not sure how UEFI knows that it is running on a ArmVirtQemu
>> machine type.
> 
> It doesn't know. It remains a convention.
> 
> This part is not auto-detected; the constants in QEMU and edk2 are
> independently open-coded, their values were synchronized by human effort
> initially.
> 
> The user or the management layer have to make sure they boot a UEFI
> firmware binary on the machine type that is compatible with the machine
> type.
> 
> There is some meta-data to help with that:
> 

Thanks so much for the reply,
I now have the basic understanding how QEMU and EDK2 works together
after reading the docs and code there.

>> Does UEFI derive it from the fdt *compatible* property ?
> 
> Please see the schema "docs/interop/firmware.json" in the QEMU tree; in
> particular the @FirmwareTarget element.
> 
> For an actual example: QEMU bundles some edk2 firmware binaries (purely
> as a convenience, not for production), and those are accompanied by
> matching descriptor files. See
> "pc-bios/descriptors/60-edk2-aarch64.json". (It is a template that's
> fixed up during QEMU installation, but that's tangential here.)
> 
>      "targets": [
>          {
>              "architecture": "aarch64",
>              "machines": [
>                  "virt-*"
>              ]
>          }
>      ],
> 

Thanks, I'll look closer into it.

> Thanks
> Laszlo
> 
> .
> 
