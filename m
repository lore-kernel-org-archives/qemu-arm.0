Received: by 10.223.188.70 with SMTP id a6csp1590062wrh;
        Fri, 25 Aug 2017 18:49:13 -0700 (PDT)
X-Received: by 10.84.236.1 with SMTP id q1mr453305plk.328.1503712153045;
        Fri, 25 Aug 2017 18:49:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503712153; cv=none;
        d=google.com; s=arc-20160816;
        b=kiTrwTS+d2AQeL5wqfH2mhjvnCD52CUsSiMLGnGkx14EkN7mDMJ2e/5gqrsfJ3/HYR
         BSaO5dFigSgeqAY9yk/2dyv3WXmMuW3TlGiSERaekNAw+Jb+cbTXo1EvBHfJNyobNU2Y
         0GkVJfbyR6kd7AN9gsqh5W8ZFTi9IKkD73Loyx5Cmb3cuxKPdMsYkXKSn8J1za2XzuRQ
         6kdLH068ATAWBi+hSqvhat1iIOVizz45i+IwW5nM6Tcdt6YCwvOfdN++kdHaO4V64SlS
         safxeo6R6wbLT5jOHB/fVnv3KbuhdxVPvVPioID4aPhKUh0bPcVy/YmJMoZWB84X2hXe
         NBaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:in-reply-to
         :mime-version:user-agent:date:message-id:from:cc:references:to
         :subject:arc-authentication-results;
        bh=xqLET6kKYxECil6PHkV4NBjF4wGL1sc9VV2DJnCO5Yc=;
        b=WI+zpntbUKTW77U8YLFETiGQ/EsHyxvADReLvDE8eLfWQrYTEuzgUzDT0MJky0jD8O
         dmxtGdT5OO/LRZP4YOTLHHbO1RSE6gEIX2j3EQICTFEViOU/zlsXOYVfbsikQmd+KOhC
         3LGj/EghbJXdfOdMAcvkq2oF6Ff7v4K0sF697RXayo84CZDyGJ8EKhrTGAnn2lhtDOnd
         OAIODWvUymc6MxZ+kVkO0AfYeCuusQJ4Z7Im+KZGclVo+lyUrSDjsp+GXOLfYbIobXAG
         1l7Qxl/jDFrqWagnPGSiFSkx61YawAWdy1A5bicijL4EugGX6DT+g3pn1f25B+TZIaka
         iLzA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org
Return-Path: <linux-kernel-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id h68si5566296pgc.456.2017.08.25.18.49.12;
        Fri, 25 Aug 2017 18:49:13 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752584AbdHZBtG (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 26 others); Fri, 25 Aug 2017 21:49:06 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5464 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751407AbdHZBtF (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Fri, 25 Aug 2017 21:49:05 -0400
Received: from 172.30.72.58 (EHLO DGGEMS406-HUB.china.huawei.com) ([172.30.72.58])
        by dggrg04-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
        with ESMTP id DFX14448;
        Sat, 26 Aug 2017 09:45:28 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.301.0; Sat, 26 Aug 2017
 09:45:16 +0800
Subject: Re: [PATCH v11 1/6] ACPI: add APEI/HEST/CPER structures and macros
To:     Shannon Zhao <zhaoshenglong@huawei.com>, <lersek@redhat.com>,
        <mst@redhat.com>, <imammedo@redhat.com>,
        <peter.maydell@linaro.org>, <pbonzini@redhat.com>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <kvm@vger.kernel.org>, <edk2-devel@lists.01.org>,
        <christoffer.dall@linaro.org>, <marc.zyngier@arm.com>,
        <will.deacon@arm.com>, <james.morse@arm.com>,
        <tbaicar@codeaurora.org>, <ard.biesheuvel@linaro.org>,
        <mingo@kernel.org>, <bp@suse.de>, <shiju.jose@huawei.com>,
        <zjzhang@codeaurora.org>, <linux-arm-kernel@lists.infradead.org>,
        <kvmarm@lists.cs.columbia.edu>, <linux-kernel@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, <devel@acpica.org>,
        <john.garry@huawei.com>, <jonathan.cameron@huawei.com>,
        <shameerali.kolothum.thodi@huawei.com>, <huangdaode@hisilicon.com>,
        <wangzhou1@hisilicon.com>
References: <1503066227-18251-1-git-send-email-gengdongjiu@huawei.com>
 <1503066227-18251-2-git-send-email-gengdongjiu@huawei.com>
 <599EC7AB.3080604@huawei.com>
 <69090a96-ce90-4b2b-a419-c8d847d56093@huawei.com>
 <59A0C813.2060201@huawei.com>
CC:     <huangshaoyu@huawei.com>, <wuquanming@huawei.com>,
        <linuxarm@huawei.com>, <zhengqiang10@huawei.com>
From:   gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <03f2f404-2718-75c7-d0eb-7bdeba146a2e@huawei.com>
Date:   Sat, 26 Aug 2017 09:45:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <59A0C813.2060201@huawei.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
        refid=str=0001.0A020205.59A0D2B8.00DE,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
        ip=0.0.0.0,
        so=2014-11-16 11:51:01,
        dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 3dc7720de09a1a930da2bd11f60d6ba9
Sender: linux-kernel-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
X-TUID: hXJTW/wgsePH



On 2017/8/26 9:00, Shannon Zhao wrote:
> 
> 
> On 2017/8/25 18:37, gengdongjiu wrote:
>>>> +
>>>>>> +/* From the ACPI 6.1 spec, "18.3.2.9 Hardware Error Notification" */
>>>>>> +
>>>> It's better to refer to the first spec version of this structure and
>>>> same with others you define.
>>  do you mean which spec version? the definition is aligned with the linux kernel.
> What I mean here is that it's better to refer to the ACPI spec version
> which introduces Hardware Error Notification first time.
Ok, I basically understand your meaning. I will clear that. thanks.

> 
>>>>
>>>>>> +enum AcpiHestNotifyType {
>>>>>> +    ACPI_HEST_NOTIFY_POLLED = 0,
>>>>>> +    ACPI_HEST_NOTIFY_EXTERNAL = 1,
>>>>>> +    ACPI_HEST_NOTIFY_LOCAL = 2,
>>>>>> +    ACPI_HEST_NOTIFY_SCI = 3,
>>>>>> +    ACPI_HEST_NOTIFY_NMI = 4,
>>>>>> +    ACPI_HEST_NOTIFY_CMCI = 5,  /* ACPI 5.0 */
>>>>>> +    ACPI_HEST_NOTIFY_MCE = 6,   /* ACPI 5.0 */
>>>>>> +    ACPI_HEST_NOTIFY_GPIO = 7,  /* ACPI 6.0 */
>>>>>> +    ACPI_HEST_NOTIFY_SEA = 8,   /* ACPI 6.1 */
>>>>>> +    ACPI_HEST_NOTIFY_SEI = 9,   /* ACPI 6.1 */
>>>>>> +    ACPI_HEST_NOTIFY_GSIV = 10, /* ACPI 6.1 */
>>>>>> +    ACPI_HEST_NOTIFY_RESERVED = 11  /* 11 and greater are reserved */
>>>> In ACPI 6.2, 11 is for Software Delegated Exception, is this useful for
>>>> your patchset?
>>   it is usefull, for all the error source, I reserved the space for them.
>> Because the space is allocated one time, is not dynamically allocated.
>> so I use the ACPI_HEST_NOTIFY_RESERVED to specify that there is 11 error source.
>>
> I mean whether the new type Software Delegated Exception is useful for
> RAS. If so, we could add this new type here.
Just now I check the ACPI 6.2 spec, it indeed introduced the new type SDEI.

currently we do not use the type Software Delegated Exception which introduced by ACPI 6.2,
so may not need to add a new type.

> 
> Thanks,
> 
