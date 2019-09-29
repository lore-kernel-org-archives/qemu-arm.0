Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5312285wrp;
        Sat, 28 Sep 2019 19:05:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxcgcTiSHa4rCsQIx48Qo55Me57gFgtqYrPEP/Eez7s1QAa9rBez2nESnB5VmlQ/KQCBJNd
X-Received: by 2002:a37:5943:: with SMTP id n64mr12222227qkb.95.1569722739743;
        Sat, 28 Sep 2019 19:05:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569722739; cv=none;
        d=google.com; s=arc-20160816;
        b=VmIy6ust8IeFWdF6KkJHXyxfv6U0YJwQk6uUFzqTB1DEKZD3VWad1KjIbJ04b0zGmg
         1W/VvEVKVg2R020xLF870f5M2pV5IaiQIVzzSn8l5oIN4lTZ54bVG8JcKTxlDIJG4mmv
         T94nKDEY6NhO5JMDHbPGXCWb7xtP/AVWj6Dy5a+TVNQf6liDHOoC8snOIITNR0WVWZ8v
         u55LCxgn9/eQahPqYrNuS2t3IpN6qe5TUbVpq4gfkg2Mubms4LARzHxVAJonAEmFdXRL
         t5k8rYzrNJu16PtVbFjtIM8tgyLhKzgKRK7KgKmKGGNCRXt+jmp11s+j79kdWU0lF4xT
         Nogg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=GehGkztfMKRvkG/5xzckHJPZeknpEO09uJ6qYj0dzu4=;
        b=OSLxLqNKvpNTVPCEmQrNh2ZkqJtdbeObzx767UqqfZ9mtc+b661wqVFe7Cxai68hDD
         w+uagvD8ntDWQZT2IGXQ3iER2KuLsxLpaxAUnSeij3hiAk57UdmgfHIAC1xl/bNODrPw
         2LqxtN7ZXK0XL+hpBQ/f0HGR5HA9fnne2CGM8Ne1oEn+rrCpZb89uFRldg+PNpw9GISv
         nnm/w2PaQ5lV/szEYWs2OcVOtD+eDkcmwK/Ut3mB3nZQx97yYaNHORpv751GfK+wIxJd
         M0AIrXTvIOvfqv7dn7FzUkfELnu5dkVSH1Lm9TlY2hvlUF6QFnGkLjk9aazaAt6AOhym
         e34A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x23si9361066qtc.13.2019.09.28.19.05.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Sep 2019 19:05:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iEOah-0005gF-8u
	for alex.bennee@linaro.org; Sat, 28 Sep 2019 22:05:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57099)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhengxiang9@huawei.com>) id 1iEOaY-0005fC-UB
 for qemu-arm@nongnu.org; Sat, 28 Sep 2019 22:05:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhengxiang9@huawei.com>) id 1iEOaX-000851-LU
 for qemu-arm@nongnu.org; Sat, 28 Sep 2019 22:05:30 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:42786 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhengxiang9@huawei.com>)
 id 1iEOaX-00080D-Ae; Sat, 28 Sep 2019 22:05:29 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id A16FD56EE928CBC06232;
 Sun, 29 Sep 2019 10:05:21 +0800 (CST)
Received: from [127.0.0.1] (10.133.224.57) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Sun, 29 Sep 2019
 10:04:52 +0800
Subject: Re: [PATCH v18 1/6] hw/arm/virt: Introduce RAS platform version and
 RAS machine option
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190906083152.25716-1-zhengxiang9@huawei.com>
 <20190906083152.25716-2-zhengxiang9@huawei.com>
 <CAFEAcA9cQwAJfPBC9fRcxLZVzZqag0Si62nTBNwDPyQiPVwPcg@mail.gmail.com>
From: Xiang Zheng <zhengxiang9@huawei.com>
Message-ID: <3d335a56-b90b-f8bb-cb05-95bf52ddade5@huawei.com>
Date: Sun, 29 Sep 2019 10:04:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9cQwAJfPBC9fRcxLZVzZqag0Si62nTBNwDPyQiPVwPcg@mail.gmail.com>
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm-devel <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 Marcelo Tosatti <mtosatti@redhat.com>, Linuxarm <linuxarm@huawei.com>, QEMU
 Developers <qemu-devel@nongnu.org>, gengdongjiu <gengdongjiu@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 James Morse <james.morse@arm.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "xuwei \(O\)" <xuwei5@huawei.com>, Laszlo Ersek <lersek@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FJM85b3MAhgL



On 2019/9/27 22:02, Peter Maydell wrote:
> On Fri, 6 Sep 2019 at 09:33, Xiang Zheng <zhengxiang9@huawei.com> wrote:
>>
>> From: Dongjiu Geng <gengdongjiu@huawei.com>
>>
>> Support RAS Virtualization feature since version 4.2, disable it by
>> default in the old versions. Also add a machine option which allows user
>> to enable it explicitly.
>>
>> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
>> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
>> ---
>>  hw/arm/virt.c         | 33 +++++++++++++++++++++++++++++++++
>>  include/hw/arm/virt.h |  2 ++
>>  2 files changed, 35 insertions(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index d74538b021..e0451433c8 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1783,6 +1783,20 @@ static void virt_set_its(Object *obj, bool value, Error **errp)
>>      vms->its = value;
>>  }
>>
>> +static bool virt_get_ras(Object *obj, Error **errp)
>> +{
>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>> +
>> +    return vms->ras;
>> +}
>> +
>> +static void virt_set_ras(Object *obj, bool value, Error **errp)
>> +{
>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>> +
>> +    vms->ras = value;
>> +}
>> +
>>  static char *virt_get_gic_version(Object *obj, Error **errp)
>>  {
>>      VirtMachineState *vms = VIRT_MACHINE(obj);
>> @@ -2026,6 +2040,19 @@ static void virt_instance_init(Object *obj)
>>                                      "Valid values are none and smmuv3",
>>                                      NULL);
>>
>> +    if (vmc->no_ras) {
>> +        vms->ras = false;
>> +    } else {
>> +        /* Default disallows RAS instantiation */
>> +        vms->ras = false;
>> +        object_property_add_bool(obj, "ras", virt_get_ras,
>> +                                 virt_set_ras, NULL);
>> +        object_property_set_description(obj, "ras",
>> +                                        "Set on/off to enable/disable "
>> +                                        "RAS instantiation",
>> +                                        NULL);
>> +    }
> 
> For a property which is disabled by default, you don't need
> to have a separate flag in the VirtMachineClass struct.
> Those are only needed for properties where we need the old machine
> types to have the property be 'off' but new machine types
> need to default to it be 'on'. Since vms->ras is false
> by default anyway, you can just have this part:
> 
>> +        /* Default disallows RAS instantiation */
>> +        vms->ras = false;
>> +        object_property_add_bool(obj, "ras", virt_get_ras,
>> +                                 virt_set_ras, NULL);
>> +        object_property_set_description(obj, "ras",
>> +                                        "Set on/off to enable/disable "
>> +                                        "RAS instantiation",
>> +                                        NULL);
> 
> Compare the 'vms->secure' flag and associated property
> for an example of this.

Thanks for pointing it out, I will remove the no_ras in the VirtMachineClass struct.

> 
>>      vms->irqmap = a15irqmap;
>>
>>      virt_flash_create(vms);
>> @@ -2058,8 +2085,14 @@ DEFINE_VIRT_MACHINE_AS_LATEST(4, 2)
>>
>>  static void virt_machine_4_1_options(MachineClass *mc)
>>  {
>> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
>> +
>>      virt_machine_4_2_options(mc);
>>      compat_props_add(mc->compat_props, hw_compat_4_1, hw_compat_4_1_len);
>> +    /* Disable memory recovery feature for 4.1 as RAS support was
>> +     * introduced with 4.2.
>> +     */
>> +    vmc->no_ras = true;
>>  }
>>  DEFINE_VIRT_MACHINE(4, 1)
> 
> thanks
> -- PMM
> 
> .
> 

-- 

Thanks,
Xiang

