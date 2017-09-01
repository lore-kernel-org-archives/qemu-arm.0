Received: by 10.223.188.70 with SMTP id a6csp911593wrh;
        Fri, 1 Sep 2017 04:51:39 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb4HnN1xuAI1MB4Ija+nKvtWtc4jvEJtVNZj2bW8R2t6DpZmrtZTkJ0EKAAar10AaSFTBxxg
X-Received: by 10.99.121.66 with SMTP id u63mr2113183pgc.386.1504266698999;
        Fri, 01 Sep 2017 04:51:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504266698; cv=none;
        d=google.com; s=arc-20160816;
        b=WVEPDaf8UXY2Y0Mdct9s1/QrU0NScJN1c7QTwnvH741QmwjT+I5rhFhQR+pbyGmr3r
         oDRLGk7MGt74719RmtwPITIdQ4WZ0U7KteSzewE9e/VIujXMkc1M6tBHiMTbf0qxgjG7
         ppkvkq+1SsKmbMQqKajKuG7xtVWciBETWi0UKyUea+qstdcpe1h8YtvysnoaSh5ypKHu
         EudqQZF9UG7MUf8Q9msZBJoc1UCn6IRjP0PYL+3CsP31XN9Fj+/EMbMzp/kr5o3w1Hgx
         9EBYvNlf+37gZqtgl1des+P+0HDrdll5axmDAMVMpIeXhLBELlAxUz3Zi5l6F47QDVw0
         /fng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:subject:cc:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=Twzty6IaNaj8RH1vudXy9B+0V6ErP7dBPp/yEMjsr8U=;
        b=e0qjChlRubkAUMquh04F/l7/FEJ3OgBcuCrlqSCmPcb2hAJ/Ey6UKR9VpNiIwBlXfw
         x//8safqMzEIo0gDsPzsImpyQgxs5dWWnkjVq1MLirnIK1E5E03p3q+LS39Ec7Mvwl69
         44x008lh6quv/rpPBfCvbphqbrIYK1wx+6kyOBwjTT0Pose0mhnRLbpXjKDivVxHzu+5
         sM1+cabLTL4jWU9EcJr1LSPbvpV+4auTG8QK3hrIzHjIHXaA6pOQpQi8ScFxSNOQLq5p
         C+bETb3916/AhsXcrTtDgfbd3QHR+Yg6xDBO59bkD0CSTw5gyZ92NFCQhltScSV0C3gl
         L1sA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id s2si1746919pge.639.2017.09.01.04.51.38;
        Fri, 01 Sep 2017 04:51:38 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751849AbdIALvd (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 26 others); Fri, 1 Sep 2017 07:51:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46530 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751499AbdIALvb (ORCPT <rfc822;linux-kernel@vger.kernel.org>);
        Fri, 1 Sep 2017 07:51:31 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id DC939883D2;
        Fri,  1 Sep 2017 11:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com DC939883D2
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com; dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com; spf=fail smtp.mailfrom=imammedo@redhat.com
Received: from nial.brq.redhat.com (unknown [10.43.2.241])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9766671C3B;
        Fri,  1 Sep 2017 11:51:22 +0000 (UTC)
Date:   Fri, 1 Sep 2017 13:51:21 +0200
From:   Igor Mammedov <imammedo@redhat.com>
To:     gengdongjiu <gengdongjiu@huawei.com>
Cc:     <mst@redhat.com>, <zhaoshenglong@huawei.com>, <lersek@redhat.com>,
        <peter.maydell@linaro.org>, <pbonzini@redhat.com>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <kvm@vger.kernel.org>, <edk2-devel@lists.01.org>,
        <christoffer.dall@linaro.org>, <marc.zyngier@arm.com>,
        <will.deacon@arm.com>, <james.morse@arm.com>,
        <ard.biesheuvel@linaro.org>, <mingo@kernel.org>, <bp@suse.de>,
        <shiju.jose@huawei.com>, <zjzhang@codeaurora.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <kvmarm@lists.cs.columbia.edu>, <linux-kernel@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, <devel@acpica.org>,
        <john.garry@huawei.com>, <jonathan.cameron@huawei.com>,
        <shameerali.kolothum.thodi@huawei.com>, <huangdaode@hisilicon.com>,
        <wangzhou1@hisilicon.com>, <zhengqiang10@huawei.com>,
        <wuquanming@huawei.com>, <huangshaoyu@huawei.com>,
        <linuxarm@huawei.com>
Subject: Re: [Qemu-devel] [PATCH v11 2/6] ACPI: Add APEI GHES Table
 Generation support
Message-ID: <20170901135121.57ca6a04@nial.brq.redhat.com>
In-Reply-To: <dfaeb539-8006-85d6-35b2-0af31f5a0675@huawei.com>
References: <1503066227-18251-1-git-send-email-gengdongjiu@huawei.com>
        <1503066227-18251-3-git-send-email-gengdongjiu@huawei.com>
        <20170829122053.36cf550c@nial.brq.redhat.com>
        <dfaeb539-8006-85d6-35b2-0af31f5a0675@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Fri, 01 Sep 2017 11:51:31 +0000 (UTC)
Sender: linux-kernel-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
X-TUID: 2Yg7O6GPGytO

On Fri, 1 Sep 2017 17:58:55 +0800
gengdongjiu <gengdongjiu@huawei.com> wrote:

> Hi Igor,
> 
> On 2017/8/29 18:20, Igor Mammedov wrote:
> > On Fri, 18 Aug 2017 22:23:43 +0800
> > Dongjiu Geng <gengdongjiu@huawei.com> wrote:
[...]
> >   
> >> +void ghes_build_acpi(GArray *table_data, GArray *hardware_error,
> >> +                                            BIOSLinker *linker)
> >> +{
> >> +    uint32_t ghes_start = table_data->len;
> >> +    uint32_t address_size, error_status_address_offset;
> >> +    uint32_t read_ack_register_offset, i;
> >> +
> >> +    address_size = sizeof(struct AcpiGenericAddress) -
> >> +        offsetof(struct AcpiGenericAddress, address);  
> > it's confusing name for var,
> > AcpiGenericAddress::address is fixed unsigned 64 bit integer per spec
> > also, I'm not sure why it's needed at all.  
>  it is because other people have concern about where does the "unsigned 64 bit integer"
>  come from, they are confused about the "unsigned 64 bit integer"
>  so they suggested use sizeof. anyway I will directly use unsigned 64 bit integer.
Maybe properly named macro instead of sizeof(foo) would do the job


[...]
> >> +
> >> +        /* Build error status address*/
> >> +        build_address(table_data, linker, error_status_address_offset + i *
> >> +            sizeof(AcpiGenericHardwareErrorSourceV2), i * address_size,
> >> +            AML_SYSTEM_MEMORY, 0x40, 0, 4 /* QWord access */);  
> > just do something like this instead of build_address():
> > build_append_gas()
> > bios_linker_loader_add_pointer()  
> Thanks for the suggestion.
> 
> > 
> > also register width 0x40 looks suspicious, where does it come from?
> > While at it do you have a real hardware which has HEST table that you re trying to model after?
> > I'd like to see HEST and other related tables from it.  
> 
> Igor, what is your suspicious point? The register width 0x40 come from our host BIOS record to the System Memory space.

maybe s/0x40/ERROR_STATUS_BLOCK_POINTER_SIZE/

[...]
