Received: by 2002:a19:fc0b:0:0:0:0:0 with SMTP id a11csp70588lfi;
        Mon, 18 Nov 2019 05:57:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqweCjl9lvP06WjMVeTIRHVKRoDUQvizZLfNNonMOiX+ZeVi8Lm2PXiMfkrl2HRH6EDcoPoD
X-Received: by 2002:a17:907:216e:: with SMTP id rl14mr26960811ejb.291.1574085446610;
        Mon, 18 Nov 2019 05:57:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574085446; cv=none;
        d=google.com; s=arc-20160816;
        b=o2fu+VjWOQGZhxtLvq83EZuf5KgNGrtiKsMA4Lgv8e788PUMOgKeFUtOjI5yxbo3iU
         nIFB+10Hf+NB2rT7/F73DsNsutKoQpXH7AsgzQmFOxZTefe3Sm/V4SETqSOWKuifPZrL
         a/AQBOu8eo8xMECL3ocJ0q4Y/tXBAEPxEY7FMJ++8IaISFY6bZKaQ5P/YWqdoTIoejbu
         qzGLtp3oxn75IctpFYwWJIiaG/kg8AovlKpRUlwjBOp35IutQ8jpkDS7Sxi1NzI1UI4Z
         1CPahFs2lYodH28LTtivEV0uTWORG61HA5m37OYQZpMhSWWufBlnxmO3XQ/zXduX6Yqz
         VBtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=6QpfHzwQri6I0qzvDUceFv3411yf3zKJhLq1OJW6L+c=;
        b=h0+Vh71mMJ+jrpIJgixJSErl4cVB05XTLDqpyWKQ6hmrS0dpe1VkyrFfyTrZo41WGO
         Zj0md/u+WBpLy5hsu6xJBL2/l/POeXt+zHWfxHjUkaSLe4P7Ejayj+nzDL2vfIm56O7C
         szQhSabJmY9e+UtbxCj0XaTqMSsUkJA93y+Cn0v675pOHvb1O5l8g+NH4FOoa1fr6jb6
         /KVv/s35U9V5A0EFG+ndphoRKR0GMm1ktkt7i2ex2JEeC34tzhDO9g34ztYn7sWLrQYB
         hSusMUFigliVKRT9OdT9dqUKJC+dNIogYyjUDZsQRWKnTrmnZHw8WvtiXdXYdyEG6sHb
         Mb3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id x70si13796580ede.257.2019.11.18.05.57.26;
        Mon, 18 Nov 2019 05:57:26 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbfKRN5Y (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Mon, 18 Nov 2019 08:57:24 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:33786 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726627AbfKRN5Y (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 18 Nov 2019 08:57:24 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id D9FA0DA6AFB7CBCC5C9F;
        Mon, 18 Nov 2019 21:57:20 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Mon, 18 Nov 2019
 21:57:14 +0800
Subject: Re: [RESEND PATCH v21 3/6] ACPI: Add APEI GHES table generation
 support
To:     "Michael S. Tsirkin" <mst@redhat.com>
CC:     Igor Mammedov <imammedo@redhat.com>,
        Xiang Zheng <zhengxiang9@huawei.com>, <pbonzini@redhat.com>,
        <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>,
        <lersek@redhat.com>, <james.morse@arm.com>, <mtosatti@redhat.com>,
        <rth@twiddle.net>, <ehabkost@redhat.com>,
        <jonathan.cameron@huawei.com>, <xuwei5@huawei.com>,
        <kvm@vger.kernel.org>, <qemu-devel@nongnu.org>,
        <qemu-arm@nongnu.org>, <linuxarm@huawei.com>,
        <wanghaibin.wang@huawei.com>
References: <20191111014048.21296-1-zhengxiang9@huawei.com>
 <20191111014048.21296-4-zhengxiang9@huawei.com>
 <20191115103801.547fc84d@redhat.com>
 <cf5e5aa4-2283-6cf9-70d0-278d167e3a13@huawei.com>
 <87758ec2-c242-71c3-51f8-a5d348f8e7fd@huawei.com>
 <20191118082036-mutt-send-email-mst@kernel.org>
From:   gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <fa142184-f248-cb0d-2f28-1e6bd368de2d@huawei.com>
Date:   Mon, 18 Nov 2019 21:57:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20191118082036-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: XZ5BsFSfmlgV

On 2019/11/18 21:21, Michael S. Tsirkin wrote:
>> If use offset relative to GAS structure, the code does not easily extend to support more Generic Hardware Error Source.
>> if use offset relative to hest_start, just use a loop, the code can support  more error source, for example:
>> for (source_id = 0; i<n; source_id++)
>> {
>>    ......
>>     bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
>>         ACPI_GHES_ERROR_STATUS_ADDRESS_OFFSET(hest_start, source_id),
>>         sizeof(uint64_t), ACPI_GHES_ERRORS_FW_CFG_FILE,
>>         source_id * sizeof(uint64_t));
>>   .......
>> }
>>
>> My previous series patch support 2 error sources, but now only enable 'SEA' type Error Source
> I'd try to merge this, worry about extending things later.
> This is at v21 and the simpler you can keep things,
> the faster it'll go in.
Thanks a lot for the comments. Yes, I think we can merge the v21 series.
