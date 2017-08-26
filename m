Received: by 10.223.188.70 with SMTP id a6csp1552354wrh;
        Fri, 25 Aug 2017 18:01:20 -0700 (PDT)
X-Received: by 10.99.43.144 with SMTP id r138mr298577pgr.360.1503709280536;
        Fri, 25 Aug 2017 18:01:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503709280; cv=none;
        d=google.com; s=arc-20160816;
        b=zOY/fLxy/22m1ntmRn2YJox+EbLvgCRVAGkLCcoEYcFG0g8EE0V6QLMuqjoiI7QhTc
         7SYpZu4wS+UDFO2mpQgfMHQjCDdUob+ScqKV2EC34eiuQj+EX+L9AeP4v0kRt/+OtwmX
         9eTUWJOgE0EnxbC94ON6uuz1Rgk9XBSsVLf4i9hjQ8FVTdsprQclCCEGtEsN6wvdLRFI
         JTB5PHErpQWzcCZnYbt6/FIPshQecTLS0FJB2W7SdufA0VQnUi2bvTJ++tNS7BIgrkWS
         BNkOuDaT5w4QtDW9giw2qvI4apd33pr6Ir9w7TzimUXDvQv7UjE3K6GzhNXLCFDSFLyJ
         ++Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:in-reply-to
         :references:subject:cc:to:mime-version:user-agent:from:date
         :message-id:arc-authentication-results;
        bh=Y/HNgZo1RF3MVbfgK6rXVf97feuMyIBvxis0YWqT38I=;
        b=npMuu9jV/+c7zdB6Q5atgGcm4oCPf06vhsbbMvDHqd/jYh+DfXR3C52ArLLd2nSjVP
         yfQ6MAGQpZCgAvK8v0euFr50ZEjJzHuk7PPOwlbGwQTJra0iCfDCRxX5bECcivYMl48c
         2Bn0pKuFAe1gdjh6UOdtGGHtg8w++8QPqUDicNY1puIo5SWB1EEaneCgh+Y0rSqKBTU9
         TSA07PSac+Gl5pn0W/85bwoLucTo6MRsw7+LjGlOMjFG6j/gdJAdxjxJtiltKOQb9ELT
         fnOVsiOre0R4rneob4xdxa0XvcMg89pAy4sG413vYzkOczMwPDWl2arzbQMttqeZX8qL
         6pmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org
Return-Path: <linux-kernel-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id e12si5516950pgn.770.2017.08.25.18.01.20;
        Fri, 25 Aug 2017 18:01:20 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754631AbdHZBBP (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 26 others); Fri, 25 Aug 2017 21:01:15 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5458 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754250AbdHZBBL (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Fri, 25 Aug 2017 21:01:11 -0400
Received: from 172.30.72.60 (EHLO DGGEMS405-HUB.china.huawei.com) ([172.30.72.60])
        by dggrg04-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
        with ESMTP id DFX08833;
        Sat, 26 Aug 2017 09:00:17 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.301.0; Sat, 26 Aug 2017
 09:00:08 +0800
Message-ID: <59A0C813.2060201@huawei.com>
Date:   Sat, 26 Aug 2017 09:00:03 +0800
From:   Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To:     gengdongjiu <gengdongjiu@huawei.com>, <lersek@redhat.com>,
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
CC:     <huangshaoyu@huawei.com>, <wuquanming@huawei.com>,
        <linuxarm@huawei.com>, <zhengqiang10@huawei.com>
Subject: Re: [PATCH v11 1/6] ACPI: add APEI/HEST/CPER structures and macros
References: <1503066227-18251-1-git-send-email-gengdongjiu@huawei.com> <1503066227-18251-2-git-send-email-gengdongjiu@huawei.com> <599EC7AB.3080604@huawei.com> <69090a96-ce90-4b2b-a419-c8d847d56093@huawei.com>
In-Reply-To: <69090a96-ce90-4b2b-a419-c8d847d56093@huawei.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
        refid=str=0001.0A090205.59A0C824.0040,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
        ip=0.0.0.0,
        so=2014-11-16 11:51:01,
        dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 3dc7720de09a1a930da2bd11f60d6ba9
Sender: linux-kernel-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
X-TUID: 4Ib7Vs0iO3sK



On 2017/8/25 18:37, gengdongjiu wrote:
>>> +
>>> >> +/* From the ACPI 6.1 spec, "18.3.2.9 Hardware Error Notification" */
>>> >> +
>> > It's better to refer to the first spec version of this structure and
>> > same with others you define.
>  do you mean which spec version? the definition is aligned with the linux kernel.
What I mean here is that it's better to refer to the ACPI spec version
which introduces Hardware Error Notification first time.

>> > 
>>> >> +enum AcpiHestNotifyType {
>>> >> +    ACPI_HEST_NOTIFY_POLLED = 0,
>>> >> +    ACPI_HEST_NOTIFY_EXTERNAL = 1,
>>> >> +    ACPI_HEST_NOTIFY_LOCAL = 2,
>>> >> +    ACPI_HEST_NOTIFY_SCI = 3,
>>> >> +    ACPI_HEST_NOTIFY_NMI = 4,
>>> >> +    ACPI_HEST_NOTIFY_CMCI = 5,  /* ACPI 5.0 */
>>> >> +    ACPI_HEST_NOTIFY_MCE = 6,   /* ACPI 5.0 */
>>> >> +    ACPI_HEST_NOTIFY_GPIO = 7,  /* ACPI 6.0 */
>>> >> +    ACPI_HEST_NOTIFY_SEA = 8,   /* ACPI 6.1 */
>>> >> +    ACPI_HEST_NOTIFY_SEI = 9,   /* ACPI 6.1 */
>>> >> +    ACPI_HEST_NOTIFY_GSIV = 10, /* ACPI 6.1 */
>>> >> +    ACPI_HEST_NOTIFY_RESERVED = 11  /* 11 and greater are reserved */
>> > In ACPI 6.2, 11 is for Software Delegated Exception, is this useful for
>> > your patchset?
>   it is usefull, for all the error source, I reserved the space for them.
> Because the space is allocated one time, is not dynamically allocated.
> so I use the ACPI_HEST_NOTIFY_RESERVED to specify that there is 11 error source.
> 
I mean whether the new type Software Delegated Exception is useful for
RAS. If so, we could add this new type here.

Thanks,
-- 
Shannon
