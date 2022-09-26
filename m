Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp2030836ocs;
        Mon, 26 Sep 2022 02:19:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7PqwzJu6lHFvXFWaS4Jd2xN8obhfbM9gsdUD95WoFvlgsAALKdf4FlweCwoxIkltXgEq9O
X-Received: by 2002:a05:620a:c41:b0:6b6:bc8:2051 with SMTP id u1-20020a05620a0c4100b006b60bc82051mr13483440qki.410.1664183979441;
        Mon, 26 Sep 2022 02:19:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664183979; cv=none;
        d=google.com; s=arc-20160816;
        b=zvhkCwaxD00kBzPn19J7ga7rW6qxm1tyzwJI1fklWYLVxrXFU5SIt6NO+ILolK4rLi
         lFBolZlN9YKWDHl+DLhOa8TK7tsEiGIfPg6aOEVRPxPGo7wiBDMlP9XCSbuEV5qt6Mny
         BrHdvYoi78GVpdSsF/i6k6Hjr9c41FISo20ORDs8oG1y0h8ww1WQ3wCH8LEnAfeyKrNq
         LK7Tz+tG3jGwiFhcmnGuWP+tx1KbH5oW2S6XzKbHKY0/Dy+u1YgcelII7NxFYk2AwClU
         RhMifdK3Nw6HJfucb5lLAVrGI8oYgMIg7wUvG/S/1lYrxRZCvZUb04R2t0GK6rx6aNi/
         Pt/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=9KRyTK83NPzlY+7U/aYjOYREcoOWpchZludYzufEPsg=;
        b=0EYa52gYOuNoPEm1Q+snqwoKSdvfSsQ+VD6h1RH65wyzEPcUMsAn00WsalBG7GztPp
         W16yvNC6W9RzmBcVYmmcBU6Q6cM5JDZdUl8ZYLP4qBYuecuwdoMlXf3oANaPDWIMsuBr
         atZPB4ZVvwl1I0OjrxII9Ul+MoCiTfc00zCsvIVHJ0esdlm2A7euhBbDaIC70ugmVEKu
         GOOhDHbopfSOUr9oPFrxikZWQdHGCSzhFYOGPRyPs90ot49bJjzfGOozUVX16ONIrPrr
         uuzOop0P+rEKaFzVWxHwp7WinG3/p4kDI4cDcbS72SEbdEaDsxVWBLgEoAu5hdFG4OeW
         vflQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s6-20020a05620a0bc600b006bc6a321891si8586831qki.46.2022.09.26.02.19.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Sep 2022 02:19:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:56538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ockH5-0007S4-2T
	for alex.bennee@linaro.org; Mon, 26 Sep 2022 05:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hesham.almatary@huawei.com>)
 id 1ockGr-0007RC-LF; Mon, 26 Sep 2022 05:19:25 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hesham.almatary@huawei.com>)
 id 1ockGp-0006hQ-5K; Mon, 26 Sep 2022 05:19:25 -0400
Received: from fraeml706-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4MbcWl3lKgz688yr;
 Mon, 26 Sep 2022 17:14:11 +0800 (CST)
Received: from lhrpeml500004.china.huawei.com (7.191.163.9) by
 fraeml706-chm.china.huawei.com (10.206.15.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.31; Mon, 26 Sep 2022 11:19:09 +0200
Received: from [10.202.227.118] (10.202.227.118) by
 lhrpeml500004.china.huawei.com (7.191.163.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 10:19:08 +0100
Message-ID: <14850f3d-30c5-2e3f-437d-853001cb0f3e@huawei.com>
Date: Mon, 26 Sep 2022 10:19:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 0/8] AArch64/HMAT support and tests
To: "Michael S. Tsirkin" <mst@redhat.com>, Hesham Almatary
 <Hesham.Almatary@cl.cam.ac.uk>
CC: <jonathan.cameron@huawei.com>, <qemu-devel@nongnu.org>,
 <yangyicong@huawei.com>, <chenxiang66@hisilicon.com>, <linuxarm@huawei.com>,
 <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
 <wangyanan55@huawei.com>, <marcel.apfelbaum@gmail.com>,
 <eduardo@habkost.net>, <Brice.Goglin@inria.fr>, <jingqi.liu@intel.com>
References: <20220719094950.1049516-1-hesham.almatary@huawei.com>
 <20220726110406-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220726110406-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.118]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 lhrpeml500004.china.huawei.com (7.191.163.9)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=hesham.almatary@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -79
X-Spam_score: -8.0
X-Spam_bar: --------
X-Spam_report: (-8.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.766,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Hesham Almatary <hesham.almatary@huawei.com>
From:  Hesham Almatary via <qemu-arm@nongnu.org>
X-TUID: GTH183r3K52Q

Hello Michael,

On 7/26/2022 4:04 PM, Michael S. Tsirkin wrote:
> On Tue, Jul 19, 2022 at 10:49:42AM +0100, Hesham Almatary wrote:
>> This patchset adds support for AArch64/HMAT including a test.
>> It relies on other two patch sets from:
>>
>> Brice Goglin: to support -numa without initiators on q35/x86.
>>    https://lore.kernel.org/all/ed23accb-2c8b-90f4-a7a3-f81cc57bf678@inria.fr/
>> Xiang Chen: to enable/support HMAT on AArch64.
>>    https://lore.kernel.org/all/1643102134-15506-1-git-send-email-chenxiang66@hisilicon.com/
> Thanks!
> I think it's best to merge this all after the release.
> I've tagged this but please ping me after the release
> just to make sure. Thanks everyone!
Ping
>> I further add a test with ACPI/HMAT tables that uses the two
>> patch sets.
>>
>> Changes from v1:
>> - Generate APIC and PPTT ACPI tables for AArch64/virt
>> - Avoid using legacy syntax in numa/bios tests
>> - Delete unchanged FACP tables
>>
>> Brice Goglin (4):
>>    hmat acpi: Don't require initiator value in -numa
>>    tests: acpi: add and whitelist *.hmat-noinitiator expected blobs
>>    tests: acpi: q35: add test for hmat nodes without initiators
>>    tests: acpi: q35: update expected blobs *.hmat-noinitiators expected
>>      HMAT:
>>
>> Hesham Almatary (3):
>>    tests: Add HMAT AArch64/virt empty table files
>>    tests: acpi: aarch64/virt: add a test for hmat nodes with no initiators
>>    tests: virt: Update expected *.acpihmatvirt tables
>>
>> Xiang Chen (1):
>>    hw/arm/virt: Enable HMAT on arm virt machine
>>
>>   hw/arm/Kconfig                                |   1 +
>>   hw/arm/virt-acpi-build.c                      |   7 ++
>>   hw/core/machine.c                             |   4 +-
>>   tests/data/acpi/q35/APIC.acpihmat-noinitiator | Bin 0 -> 144 bytes
>>   tests/data/acpi/q35/DSDT.acpihmat-noinitiator | Bin 0 -> 8553 bytes
>>   tests/data/acpi/q35/HMAT.acpihmat-noinitiator | Bin 0 -> 288 bytes
>>   tests/data/acpi/q35/SRAT.acpihmat-noinitiator | Bin 0 -> 312 bytes
>>   tests/data/acpi/virt/APIC.acpihmatvirt        | Bin 0 -> 396 bytes
>>   tests/data/acpi/virt/DSDT.acpihmatvirt        | Bin 0 -> 5282 bytes
>>   tests/data/acpi/virt/HMAT.acpihmatvirt        | Bin 0 -> 288 bytes
>>   tests/data/acpi/virt/PPTT.acpihmatvirt        | Bin 0 -> 196 bytes
>>   tests/data/acpi/virt/SRAT.acpihmatvirt        | Bin 0 -> 240 bytes
>>   tests/qtest/bios-tables-test.c                | 109 ++++++++++++++++++
>>   13 files changed, 118 insertions(+), 3 deletions(-)
>>   create mode 100644 tests/data/acpi/q35/APIC.acpihmat-noinitiator
>>   create mode 100644 tests/data/acpi/q35/DSDT.acpihmat-noinitiator
>>   create mode 100644 tests/data/acpi/q35/HMAT.acpihmat-noinitiator
>>   create mode 100644 tests/data/acpi/q35/SRAT.acpihmat-noinitiator
>>   create mode 100644 tests/data/acpi/virt/APIC.acpihmatvirt
>>   create mode 100644 tests/data/acpi/virt/DSDT.acpihmatvirt
>>   create mode 100644 tests/data/acpi/virt/HMAT.acpihmatvirt
>>   create mode 100644 tests/data/acpi/virt/PPTT.acpihmatvirt
>>   create mode 100644 tests/data/acpi/virt/SRAT.acpihmatvirt
>>
>> -- 
>> 2.25.1
>
