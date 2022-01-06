Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp904547lfb;
        Thu, 6 Jan 2022 03:07:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzd6bx3Qi9d51seM9Cb9kzo8bh0hS1WkO85tEiJ6oQhHtUNJZ8aX7iVzSrBlqqOOt994aqD
X-Received: by 2002:a25:90e:: with SMTP id 14mr56962429ybj.430.1641467262024;
        Thu, 06 Jan 2022 03:07:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641467262; cv=none;
        d=google.com; s=arc-20160816;
        b=QGDRE5emwDNXrkKJbLR23CFLs6jj/3eH4g8P/YN/+daBgXOw5YCx9PG7blr7MvZ0N9
         DjntX30I6rtUsk8E6rikTXqHrF9Kb9dumb6M7L2I7qyZYoYGMvC3QiWpK81Xdjf5GaFa
         5rgn7Kpec09pXVGJ633f4SdYKchLzjmekmQ7C28bW76nD0Wn3mEoDReKH/hBGvlUcKEx
         2en+EfnIdt+3/KTWeRq5CJdxSNfdNYXBpFTB8q3TojK1VN5hbXJUpCCIl0gzHS5R8Uab
         PtLbmzRFR801GCLcu09PNpHPpfalyc7d6n8rPuN7CewHKsoOvLk0HF+X0q/4Xsyu7QtZ
         vNLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=d78zgnEtStxz0oNorpZ5StadWScfSAsLTnylGQQWHPs=;
        b=Nl9XJQ8CnI8MZZ/97ll/1jpgT+cJ3YC7e4mVjEYwQ5UpWNPF+UoQssT5rLIs9MkOh6
         OgKOlGb05Sbavo5VNDJ2bebx/XxSLUJlCA8p89YihXk2ikqiW/7bX1Zk+Lt7hjALfukl
         SdlCTZ7EvGGlbOqWMDmrq4i4NFpt69L4deNS4bAdCMlv02i3v44vDNm7Kt4eA620vreP
         cstFHsvbytBWAMPNIeyAeBx6dXd9z3fblAN9HGJOlx2eQJjTGER1COCFzu8pl4+XLgBY
         aiNFIuDCL0R+2SvnVeBjURzHaZcms46K0oEjGay12qbDNuUpfKt913RKUErNQuq5TjOk
         0TNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JdN3+VFS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t8si1205999ybg.109.2022.01.06.03.07.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jan 2022 03:07:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JdN3+VFS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n5QcP-0002f1-EY
	for alex.bennee@linaro.org; Thu, 06 Jan 2022 06:07:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n5QVZ-0001Ap-Nj
 for qemu-arm@nongnu.org; Thu, 06 Jan 2022 06:00:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n5QVW-0002wc-QN
 for qemu-arm@nongnu.org; Thu, 06 Jan 2022 06:00:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641466833;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d78zgnEtStxz0oNorpZ5StadWScfSAsLTnylGQQWHPs=;
 b=JdN3+VFSnyAk6+TuhJ7MEUXsIU+YcE5ChWJiZeQqXf0HT5OazmAPmMhKAYVUlwz8SMNbe0
 lRIXCwwyX3KzYnPhLPTdqKlUnaq2F38Njb8PfHbypihNQf9fKhXiMJmWyqCfps3lPb1YMk
 TweYR314+QgwPp79+nDJqM6rpU1Hq4k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-136-QurdnB6nMHm8UDO01dU4wA-1; Thu, 06 Jan 2022 06:00:31 -0500
X-MC-Unique: QurdnB6nMHm8UDO01dU4wA-1
Received: by mail-wm1-f71.google.com with SMTP id
 7-20020a1c1907000000b003471d9bbe8dso168343wmz.0
 for <qemu-arm@nongnu.org>; Thu, 06 Jan 2022 03:00:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=d78zgnEtStxz0oNorpZ5StadWScfSAsLTnylGQQWHPs=;
 b=NEmlPhtdtM8oOO4MZApJ3B/DfpwTczyHZyVkxWyFx8Y3ZxBLWumhdbBCenwl3uPUya
 KK152E+fmNdkojjnL2xX7+LeXOBtCzGrHngAARAAddV7Kro5tCZdZaQbz0surMCUO7yE
 80hmcfiJiwHo52e7m4GIcYls3E8cyJ3FMGU58npYqAfBbv9x/Dq/qUN1qIFDxnQqadQR
 1s39AN/5iPE5FhQYpazyZmc4B6KojHSCMJdAKtagClsmCLjim9k6saaEbfB7N6I61SST
 Jwii89CbLHpvAAtvpS85X1Yz/2SO65lA3hxpuDApsZ8lWjJZPRqM4/fhbjfS4yo328XI
 Acmg==
X-Gm-Message-State: AOAM532TeG3nW9655GLMxhMlKf+kx7h8Ijr9ipXUdw5uIpNUaxAopzD3
 KgikNmcq7e9xzFeNUvvyq1n3BLYoR2rtGeE1mGK1JrD6ZJYpr1MXB882fJNYMQytrPz8R4YGaCX
 B4xX39N9uh2wO
X-Received: by 2002:a1c:1b15:: with SMTP id b21mr6617335wmb.174.1641466830155; 
 Thu, 06 Jan 2022 03:00:30 -0800 (PST)
X-Received: by 2002:a1c:1b15:: with SMTP id b21mr6617301wmb.174.1641466829849; 
 Thu, 06 Jan 2022 03:00:29 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id z9sm1902317wmk.0.2022.01.06.03.00.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 03:00:28 -0800 (PST)
Subject: Re: [RFC v2 1/2] hw/pci-host/gpex: Allow to generate preserve boot
 config DSM #5
To: "chenxiang (M)" <chenxiang66@hisilicon.com>, eric.auger.pro@gmail.com,
 imammedo@redhat.com, philmd@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, shameerali.kolothum.thodi@huawei.com,
 ardb@kernel.org, jean-philippe@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, drjones@redhat.com
References: <20211005085313.493858-1-eric.auger@redhat.com>
 <20211005085313.493858-2-eric.auger@redhat.com>
 <97906621-e6e1-67ec-a3a2-26e5fd07f1a6@hisilicon.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <2cf469c6-2876-803d-049a-7500f067a0fb@redhat.com>
Date: Thu, 6 Jan 2022 12:00:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <97906621-e6e1-67ec-a3a2-26e5fd07f1a6@hisilicon.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.691, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Cc: gshan@redhat.com, "linuxarm@huawei.com" <linuxarm@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G3asa2j+raWh

Hi CHenxiangn

On 12/29/21 8:13 AM, chenxiang (M) via wrote:
> Hi Eric,
>
>
> 在 2021/10/5 16:53, Eric Auger 写道:
>> Add a 'preserve_config' field in struct GPEXConfig and
>> if set generate the DSM #5 for preserving PCI boot configurations.
>> The DSM presence is needed to expose RMRs.
>>
>> At the moment the DSM generation is not yet enabled.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>   include/hw/pci-host/gpex.h |  1 +
>>   hw/pci-host/gpex-acpi.c    | 12 ++++++++++++
>>   2 files changed, 13 insertions(+)
>>
>> diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
>> index fcf8b63820..3f8f8ec38d 100644
>> --- a/include/hw/pci-host/gpex.h
>> +++ b/include/hw/pci-host/gpex.h
>> @@ -64,6 +64,7 @@ struct GPEXConfig {
>>       MemMapEntry pio;
>>       int         irq;
>>       PCIBus      *bus;
>> +    bool        preserve_config;
>>   };
>>     int gpex_set_irq_num(GPEXHost *s, int index, int gsi);
>> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
>> index e7e162a00a..7dab259379 100644
>> --- a/hw/pci-host/gpex-acpi.c
>> +++ b/hw/pci-host/gpex-acpi.c
>> @@ -164,6 +164,12 @@ void acpi_dsdt_add_gpex(Aml *scope, struct
>> GPEXConfig *cfg)
>>                   aml_append(dev, aml_name_decl("_PXM",
>> aml_int(numa_node)));
>>               }
>>   +            if (cfg->preserve_config) {
>> +                method = aml_method("_DSM", 5, AML_SERIALIZED);
>
> I notice there is a ACPI BIOS Error when booting virtual machine which
> seems be caused by this patch as I add this patchset in my branch to
> test the function of vsmmu.
> It seems that it requires only 4 parameter for method _DSM, but use 5
> parameters here.
> The error log is as following:

Thank you for the heads up. Yes the problem was reported by Igor too in
https://www.mail-archive.com/qemu-devel@nongnu.org/msg842972.html.

At the moment the RMRR ACPI situation has not progressed on spec side or
kernel if I have not missed anything but sure I will take this into
account in my next respin.

Thanks!

Eric
>
> [    2.355459] ACPI BIOS Error (bug): Failure creating named object
> [\_SB.PCI0._DSM], AE_ALREADY_EXISTS (20210930/dswload2-327)
> [    2.355467] ACPI Error: AE_ALREADY_EXISTS, During name
> lookup/catalog (20210930/psobject-221)
> [    2.355470] ACPI: Skipping parse of AML opcode: OpcodeName
> unavailable (0x0014)
> [    2.355657] ACPI: 1 ACPI AML tables successfully acquired and loaded
> [    2.356321] ACPI: Interpreter enabled
> [    2.356323] ACPI: Using GIC for interrupt routing
> [    2.356333] ACPI: MCFG table detected, 1 entries
> [    2.361359] ARMH0011:00: ttyAMA0 at MMIO 0x9000000 (irq = 16,
> base_baud = 0) is a SBSA
> [    2.619805] printk: console [ttyAMA0] enabled
> [    2.622114] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
> [    2.622788] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM
> ClockPM Segments MSI HPX-Type3]
> [    2.623776] acpi PNP0A08:00: _OSC: platform does not support [LTR]
> [    2.624600] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME
> AER PCIeCapability]
> [    2.625721] acpi PNP0A08:00: ECAM area [mem
> 0x4010000000-0x401fffffff] reserved by PNP0C02:00
> [    2.626645] acpi PNP0A08:00: ECAM at [mem
> 0x4010000000-0x401fffffff] for [bus 00-ff]
> [    2.627450] ACPI: Remapped I/O 0x000000003eff0000 to [io
> 0x0000-0xffff window]
> [    2.628229] ACPI BIOS Error (bug): \_SB.PCI0._DSM: Excess arguments
> - ASL declared 5, ACPI requires 4 (20210930/nsarguments-166)
> [    2.629576] PCI host bridge to bus 0000:00
> [    2.630008] pci_bus 0000:00: root bus resource [mem
> 0x10000000-0x3efeffff window]
> [    2.630747] pci_bus 0000:00: root bus resource [io  0x0000-0xffff
> window]
> [    2.631405] pci_bus 0000:00: root bus resource [mem
> 0x8000000000-0xffffffffff window]
> [    2.632177] pci_bus 0000:00: root bus resource [bus 00-ff]
> [    2.632731] ACPI BIOS Error (bug): \_SB.PCI0._DSM: Excess arguments
> - ASL declared 5, ACPI requires 4 (20210930/nsarguments-166)
>
>
>> +                aml_append(method, aml_return(aml_int(0)));
>> +                aml_append(dev, method);
>> +            }
>> +
>>               acpi_dsdt_add_pci_route_table(dev, cfg->irq);
>>                 /*
>> @@ -191,6 +197,12 @@ void acpi_dsdt_add_gpex(Aml *scope, struct
>> GPEXConfig *cfg)
>>       aml_append(dev, aml_name_decl("_STR", aml_unicode("PCIe 0
>> Device")));
>>       aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
>>   +    if (cfg->preserve_config) {
>> +        method = aml_method("_DSM", 5, AML_SERIALIZED);
>> +        aml_append(method, aml_return(aml_int(0)));
>> +        aml_append(dev, method);
>> +    }
>> +
>>       acpi_dsdt_add_pci_route_table(dev, cfg->irq);
>>         method = aml_method("_CBA", 0, AML_NOTSERIALIZED);
>
>

