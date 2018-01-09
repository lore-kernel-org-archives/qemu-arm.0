Received: by 10.28.173.206 with SMTP id w197csp3834210wme;
        Tue, 9 Jan 2018 07:42:26 -0800 (PST)
X-Google-Smtp-Source: ACJfBotpL+MPHRPM8c1a2MOhwhAJzCDjGoAkrTILSMISvpXezTBgnQ26ofbA9vT8z0R614ERq4We
X-Received: by 10.98.153.210 with SMTP id t79mr13988228pfk.43.1515512546545;
        Tue, 09 Jan 2018 07:42:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515512546; cv=none;
        d=google.com; s=arc-20160816;
        b=i2R85ZRRxr5QMFTbU8vw/s8yiPnYqYdZGJDogXLSTzYd0Hhh154LUKZWyS0WR9F6wR
         95Kq+lpVAiWmJlqmswOSX9XbwrXuqLR7UVgGu7wVJvp9BXmV4jyMxpSs+MSSFygwGX7E
         gVIqvP4v4svBsqh58VcjhTdBmDfFxsaExKWGpeEgDLIosYz0gGjjuQGv5TiuopxdgxWW
         NJmHhDGt8fpg5++izDnJlxg21qm75FIjzIJUxvNtHMV/hYVSMTMnvYWonrCc53w8nWvh
         p06MiEsumKT7ou77+IhenPua7gHTj+yI3njGg9GjW+sOm8jxqv5N5elIjU28E247ZO+M
         9zhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=375qLqCI5/fiE7VjE505TBS4GNeAwGZ68RWCnqin5ak=;
        b=eDqkGz5fBs8/4sluHUoBWTxQJ3gfWi44Cst8sNCpd++mrxKkGHFQCcMRRuc3YogmPC
         EEcnGJm8YQsBDXEdYgCQ3Mr1wI1AduBBa8bGsUx8wfycKtDlkPPOmnut9pIwL7YeGGUd
         5ZPEnrRDfWG+8ZEnbE+lBz8C/iPVg4uyDRmR8y/6wm6vJHpZlW4tYrasOuJGGKDFH7Qf
         /Rct/nxfFGdA9Z1lWIGqwBDL9ffgNSJAeE441Ni+QYiEDxXO0JUKdV843Cyob+c8oE28
         sQ21rWBchshI+crdEs7AAr09XZaMMoUcQmra3Sb2XPqGmUXgsw9DTiErAyGu4CZbkchf
         iZzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jSGaXHAl;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id p3si10199477pfg.369.2018.01.09.07.42.26;
        Tue, 09 Jan 2018 07:42:26 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jSGaXHAl;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933227AbeAIPmY (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Tue, 9 Jan 2018 10:42:24 -0500
Received: from mail-oi0-f66.google.com ([209.85.218.66]:39684 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933114AbeAIPmW (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 9 Jan 2018 10:42:22 -0500
Received: by mail-oi0-f66.google.com with SMTP id r63so10787144oia.6
        for <kvm@vger.kernel.org>; Tue, 09 Jan 2018 07:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=375qLqCI5/fiE7VjE505TBS4GNeAwGZ68RWCnqin5ak=;
        b=jSGaXHAlLV+ppkZAaKyYEbpQdzbmj1YXaXj+Hp1k+qlYe7d+2IKiHQCPRgXqmKWeaH
         D8pyKk1d60At6KAppBfejgN8M3SKNX/wzKiRHHheuAjdRSi2M+MWkIsg6tEQg7piX2RQ
         fWPxvPyh0jEmlcFE2VTlH4HpH2A5URvd3E+HU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=375qLqCI5/fiE7VjE505TBS4GNeAwGZ68RWCnqin5ak=;
        b=fo2eYXL+0OpYjiBp4GAvnE7hcmlppLvs9fSOLRozUjhuIrTJEjWXqZz/ZDd7/gIpW9
         f3A8De3nNFGWfkrsBddEi9qBis4tsqVLUaMMm5+fGdnEYMFMlwLTHCF5d2lhenyQMonC
         oWQh6JYFVQwIjqw1YqQHHPtbmEiIon6/V3YenXtmyO8S7hsntTN3/ouIksEKasE0eJmI
         z4dkKoy0m3x4pRX/Gxkj9lc7v4+q6cL+x3WVryqQ5wPJLDPErAiTCcKdl9y5hBjc59Hn
         C2hwN1ALSSo+K2MdbRphB0T0BaxY/4TIQEbDkJzwP1ygCY1MayFD8aX9wVKUmMYVvDMg
         bbCA==
X-Gm-Message-State: AKwxytdUQpAKRYQyOVEPgqIHBosmVEdSUlKlHL49Q9in8Oh5qLXFoA/5
        0vVFvBEXnkHSl8cSNqemGgh8gG4L/0h9ajB7qZju1A==
X-Received: by 10.202.173.84 with SMTP id w81mr1033274oie.299.1515512541497;
 Tue, 09 Jan 2018 07:42:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Tue, 9 Jan 2018 07:42:00 -0800 (PST)
In-Reply-To: <20171228155832.05a9966b@igors-macbook-pro.local>
References: <1514440458-10515-1-git-send-email-gengdongjiu@huawei.com>
 <1514440458-10515-9-git-send-email-gengdongjiu@huawei.com> <20171228155832.05a9966b@igors-macbook-pro.local>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Tue, 9 Jan 2018 15:42:00 +0000
Message-ID: <CAFEAcA8Zg6wikw+td9vkGG7S4YGJMr-2O7rkCx3Wp0RrSn2PdA@mail.gmail.com>
Subject: Re: [PATCH v14 8/9] hw/arm/virt: Add RAS platform version for migration
To:     Igor Mammedov <imammedo@redhat.com>
Cc:     Dongjiu Geng <gengdongjiu@huawei.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Shannon Zhao <zhaoshenglong@huawei.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Eduardo Habkost <ehabkost@redhat.com>,
        James Morse <james.morse@arm.com>,
        Christoffer Dall <christoffer.dall@linaro.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        kvm-devel <kvm@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>,
        Huangshaoyu <huangshaoyu@huawei.com>,
        "Zhengqiang (turing)" <zhengqiang10@huawei.com>,
        Xu Wei <xuwei5@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: YZGvJhaFZuxX

On 28 December 2017 at 14:58, Igor Mammedov <imammedo@redhat.com> wrote:
> On Thu, 28 Dec 2017 13:54:17 +0800
> Dongjiu Geng <gengdongjiu@huawei.com> wrote:
>
>> Support this feature since version 2.10, disable it by
>> default in the old version.
> patch should go before acpi tables are actually added,
> otherwise it might break bisectability.
>
>>
>> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
>> ---
>> Address Shannon's comments to add platform version in [1].
>>
>> [1]: https://lkml.org/lkml/2017/8/25/821
>>
>> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
>> ---
>>  hw/arm/virt-acpi-build.c | 14 +++++++++-----
>>  hw/arm/virt.c            |  4 ++++
>>  include/hw/arm/virt.h    |  1 +
>>  3 files changed, 14 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 06c14b3..b6974ef 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -801,10 +801,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>>      acpi_add_table(table_offsets, tables_blob);
>>      build_spcr(tables_blob, tables->linker, vms);
>>
>> -    acpi_add_table(table_offsets, tables_blob);
>> -    build_hardware_error_table(tables->hardware_errors, tables->linker);
>> -    build_apei_ghes(tables_blob, tables->hardware_errors, tables->linker);
>> -
>> +    if (!vmc->no_ras) {
>
> it's better to avoid no_foo, use something like
>
> vmc->has_ras

Fields in VirtMachineClass for this kind of thing tend to
end up having to be no_foo, because the default (false) must
be the setting for the most up to date version of the
virt board, because of the way the virt_machine_X_XX_options()
functions chain together. So no_ras matches the sense used
for all the existing bools in VirtMachineClass.

(In contrast, bools in the VirtMachineState struct are the
conventional sense, so there we have highmem/its/virt/etc.)

thanks
-- PMM
