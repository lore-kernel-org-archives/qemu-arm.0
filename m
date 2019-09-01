Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp2901758wrs;
        Sun, 1 Sep 2019 04:20:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxIuveH2MqLHjijxQYg5yHpiMvqz/Jh4/kRgeC/MpoWvUwaqUKjhruT5Nm5TKtKw3kBCcv1
X-Received: by 2002:ac8:450c:: with SMTP id q12mr24342578qtn.298.1567336830550;
        Sun, 01 Sep 2019 04:20:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567336830; cv=none;
        d=google.com; s=arc-20160816;
        b=TDBdDKhE1x/lSbp0H3fFXSi9NlWDo/PHs1ISXDtw1DJHNudfqD+rza3btrpq0L9z6F
         2ss5zn80WC1/0SGjZGb2qHKVCj5eToFvPJuLToPtDwPLsK+5T/VE44e8BsJPLuMSleS0
         ZrLW4HE2KptBpehTAcFoVQKNSe9kZNVwRZUqmR9JAKIyHwmFWW5WSh0cZXCrwIivJZkt
         2svL7krq5eK9OWrF4T0X5+IHXwJmtxWXn45eJnEmQyxddO1FGgiRjoRzd2AOiB9FC/vE
         GSzqiwMffXqH+7tCFxT/sIp3/6nb4kiQ6NJKMD0b/wtNDhQQFFKssQ0bwzm7yvtQue0H
         OqDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=UfkA1XIN1koVFNE7BHL4IGgTHwx+j0wWFrPrruP4rr0=;
        b=MrxaORixwfzjvrw5xueSPZwLaKQi5ui9SkWrygpBJlFgddZ8jwQnqk2Il7/bqvVatU
         u6a9Yo/p2lpAF8lJtWP5OktMVOfdx/Xoql4h/jxiOCnluLekFQ5uuC/NeeLe8l3JjzQ9
         6JLEKUCNd64lBPo9ec2lJCJbd+jILBYT3pxmNn+EjV3xQK5Fkx0bAMD1ialmJ+kclZh2
         JxwXrkDJmFhn4uRI1UaoGcYJWok0wDobJdzDtySv4oYiSEMnO47Rw9X+YBItxkWUySbP
         kfHBnSO3TNAOjwZKGz/iE51S4wt1GTLppGyUiGPYkkqn4ulS4/m3AaIlqAIspa2JaLdA
         /HUw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a3si7760925qvh.153.2019.09.01.04.20.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Sep 2019 04:20:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i4NuH-0003mR-JD
	for alex.bennee@linaro.org; Sun, 01 Sep 2019 07:20:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46934)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i4Nu4-0003i5-BD
 for qemu-arm@nongnu.org; Sun, 01 Sep 2019 07:20:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i4Nu2-0003Ja-5V
 for qemu-arm@nongnu.org; Sun, 01 Sep 2019 07:20:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53192)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i4Nu1-0003J7-UY; Sun, 01 Sep 2019 07:20:14 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 23E71307D88D;
 Sun,  1 Sep 2019 11:20:13 +0000 (UTC)
Received: from [10.36.116.105] (ovpn-116-105.ams2.redhat.com [10.36.116.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0488C600C8;
 Sun,  1 Sep 2019 11:20:09 +0000 (UTC)
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, imammedo@redhat.com
References: <20190813210539.31164-1-shameerali.kolothum.thodi@huawei.com>
 <20190813210539.31164-11-shameerali.kolothum.thodi@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <c9d0a573-dde9-569f-7168-abc4260c237f@redhat.com>
Date: Sun, 1 Sep 2019 13:20:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190813210539.31164-11-shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Sun, 01 Sep 2019 11:20:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH-for-4.2 v9 10/12] docs/specs: Add ACPI GED
 documentation
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
 linuxarm@huawei.com, xuwei5@hisilicon.com, shannon.zhaosl@gmail.com,
 sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NSuzCTeKl/CB

Hi Shameer,
On 8/13/19 11:05 PM, Shameer Kolothum wrote:
> Documents basic concepts of ACPI Generic Event device(GED)
> and interface between QEMU and the ACPI BIOS.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  docs/specs/acpi_hw_reduced_hotplug.txt | 60 ++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 docs/specs/acpi_hw_reduced_hotplug.txt
> 
> diff --git a/docs/specs/acpi_hw_reduced_hotplug.txt b/docs/specs/acpi_hw_reduced_hotplug.txt
> new file mode 100644
> index 0000000000..46839be5ff
> --- /dev/null
> +++ b/docs/specs/acpi_hw_reduced_hotplug.txt
> @@ -0,0 +1,60 @@
> +QEMU<->ACPI BIOS Generic Event Device interface
> +
> +The ACPI Generic Event Device (GED) is a HW reduced platform
> +specific device introduced in ACPI v6.1 that handles all platform
> +events, including the hotplug ones. GED is modelled as a device
> +in the namespace with a _HID defined to be ACPI0013. This document
> +describes the interface between QEMU and the ACPI BIOS.
> +
> +GED allows HW reduced platforms to handle interrupts in ACPI ASL
> +statements. It follows a very similar approach like the _EVT method
> +from GPIO events. All interrupts are listed in  _CRS and the handler
> +is written in _EVT method. However, Qemu implementation uses a single
> +interrupt for the GED device, relying on IO memory region to communicate
> +the type of device affected by the interrupt. This way, we can support
> +up to 32 events with a unique interrupt.
> +
> +Here is an example.
> +
> +Device (\_SB.GED)
> +{
> +    Name (_HID, "ACPI0013")
> +    Name (_UID, Zero)
> +    Name (_CRS, ResourceTemplate ()
> +    {
> +        Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
> +        {
> +            0x00000029,
> +        }
> +    })
> +    OperationRegion (EREG, SystemMemory, 0x09080000, 0x04)
> +    Field (EREG, DWordAcc, NoLock, WriteAsZeros)
> +    {
> +        ESEL,   32
> +    }
> +    Method (_EVT, 1, Serialized)
> +    {
> +        Local0 = ESEL // ESEL = IO memory region which specifies the
> +                      // device type.
> +        If (((Local0 & One) == One))
> +        {
> +            MethodEvent1()
> +        }
> +        If ((Local0 & 0x2) == 0x2)
> +        {
> +            MethodEvent2()
> +        }
> +        ...
> +    }
> +}
> +
> +GED IO interface (4 byte access):
> +read access:
> +    [0x0-0x3] Event selector bit field(32 bit) set by Qemu.
> +    bits:
> +        1:  Memory hotplug event
> +        2:  System power down event
> +     3-31:  Reserved
> +
> +write_access:
> +    Nothing is expected to be written into GED IO memory
> 
