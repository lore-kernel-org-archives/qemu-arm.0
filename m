Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp229577lff;
        Tue, 3 Dec 2019 22:17:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqyOInXWvu0YKVQtKgTeukwyMOkY74qzVTpJHFen8ETxfaJW4e+1yv9JeXK06aD70Y8H3xWe
X-Received: by 2002:a37:4146:: with SMTP id o67mr1287420qka.232.1575440221017;
        Tue, 03 Dec 2019 22:17:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575440221; cv=none;
        d=google.com; s=arc-20160816;
        b=H+1gWDmYbTr7d0xrwIpQdvLUCpFTC4+N4SC+ft/0HoxNZYvBg5JWDSBO34gcQotu4Y
         GRy/ADzAEujw/ggx/JS1nCiy6JMOPswCfUSRyTQpAdQK9+TAHC4SMi97fkl4KmVLtqi7
         KOyUtbHKOvZG3ka8b8bGPleZjqVsO4b0dHtC5dS9lxFmnFVqfwEdMZ8LfHMQCaRb5zLa
         XtI0KSM0aPOeGqvsYH/lhGp4Lovbkh/2+lxlfYUvDbNHRd4Xq4bSKtgdldU/DMiLFNEu
         Ok13aQZS6vqzJ+hz9mhYbSCJVEgiJ13WJlyYIP5QaBAFAEct1pFq3S0GkBZbFijMvJFH
         bJPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:subject:from;
        bh=sOeZx1hJHhVX0mEZsMw6x7u1q+Q5Vez6x9P2QXdqfYo=;
        b=BCroCWhzzqTBjuEo3oGTirWhxkeN3Mj/fwHGHrT5UvY6XcXpyd3XejzpUEJHCKzfUl
         eaGcwkiLT1Lb6YOWk7lH+XkpqiP58KWw/pNOXy4wzkKiBgntJkNA3frI/7m6BZI2ZRek
         I/QG8hq0AwkI71Ph/qHbpv5ZlM+FAzLKOeW1JA0d6T/wlv7TDC/A/AFAAJCJoAHAtacm
         64FZqS3YNLDgxk4TYre17Rz99zbwhE9n1tr/w4M2e/HHD4AWYD2QsEmf/ej5BDhTf+DU
         TPleb+qU0BA0WhBz0XFdPkBdXQ9/QghU0GHMsqg1gZLYovCJPiyqrG4drnieBUhUO+Q4
         SyyA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v26si2258029qkg.47.2019.12.03.22.17.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2019 22:17:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1icNy7-0002xU-FL
	for alex.bennee@linaro.org; Wed, 04 Dec 2019 01:16:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49369)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhengxiang9@huawei.com>) id 1icNvg-0002R8-Dd
 for qemu-arm@nongnu.org; Wed, 04 Dec 2019 01:14:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhengxiang9@huawei.com>) id 1icNvZ-0005fw-BH
 for qemu-arm@nongnu.org; Wed, 04 Dec 2019 01:14:24 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:46900 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhengxiang9@huawei.com>)
 id 1icNvY-000551-Ut; Wed, 04 Dec 2019 01:14:21 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 8B58E170EB14C16A5A99;
 Wed,  4 Dec 2019 14:14:09 +0800 (CST)
Received: from [127.0.0.1] (10.133.224.57) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Wed, 4 Dec 2019
 14:14:02 +0800
From: Xiang Zheng <zhengxiang9@huawei.com>
Subject: Re: [PATCH 4/5] hw/arm/virt: Add FW_CFG_RAM_SIZE and FW_CFG_MAX_CPUS
 into fw_cfg
To: Peter Maydell <peter.maydell@linaro.org>
References: <20191203122753.19792-1-zhengxiang9@huawei.com>
 <20191203122753.19792-5-zhengxiang9@huawei.com>
 <CAFEAcA8ZRufe+6P1kj8iSc40EEWohjA_FMscxjmNLJrPPQyn-A@mail.gmail.com>
Message-ID: <3f4d33e2-df25-42f3-0896-31d4df32ea64@huawei.com>
Date: Wed, 4 Dec 2019 14:14:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8ZRufe+6P1kj8iSc40EEWohjA_FMscxjmNLJrPPQyn-A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.224.57]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +6+UHinFdCY+



On 2019/12/3 20:32, Peter Maydell wrote:
> On Tue, 3 Dec 2019 at 12:29, Xiang Zheng <zhengxiang9@huawei.com> wrote:
>>
>> I'm not sure whether it's neccesary to add FW_CFG_RAM_SIZE and
>> FW_CFG_MAX_CPUS into fw_cfg on virt machine. This patch just makes
>> the fw_cfg-test happy.
>>
>> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
>> ---
>>  hw/arm/virt.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index d4bedc2607..26a4183775 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1084,6 +1084,9 @@ static FWCfgState *create_fw_cfg(const VirtMachineState *vms, AddressSpace *as)
>>      fw_cfg = fw_cfg_init_mem_wide(base + 8, base, 8, base + 16, as);
>>      fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)ms->smp.cpus);
>>
>> +    fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)ram_size);
>> +    fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)ms->smp.max_cpus);
>> +
>>      nodename = g_strdup_printf("/fw-cfg@%" PRIx64, base);
>>      qemu_fdt_add_subnode(vms->fdt, nodename);
>>      qemu_fdt_setprop_string(vms->fdt, nodename,
>> --
> 
> Is there a spec anywhere that defines the meaning of these
> FW_CFG entries ? docs/specs/fw_cfg.txt defines the
> device interface but not what the 'standard' keys mean.
> I'd prefer not to add them to the virt board without knowing
> what they mean and why we have them.
> 

I cannot find a spec or doc defines these FW_CFG entries. It seems that they
are used on x86 machines to limit APIC ID values but useless on virt machine.
I will drop this patch.

-- 

Thanks,
Xiang

