Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp828932ejh;
        Fri, 2 Sep 2022 02:26:41 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5OV+wxbeySCpcPq04wOzGYKYcRNXpg0VYEKGVk9KdYwqMEdAbDBJQ0hsl4NgK6JZ2s/363
X-Received: by 2002:a05:620a:1476:b0:6bb:363e:519e with SMTP id j22-20020a05620a147600b006bb363e519emr22128412qkl.311.1662110801493;
        Fri, 02 Sep 2022 02:26:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662110801; cv=none;
        d=google.com; s=arc-20160816;
        b=JIpD3LlxOZ1a0SxX8j7Pl1+RXKP0LjNjqdAhjFvBIU+9VKfTFGhi6JV2PsvE0G4P2B
         oNnUQuxDwIjJtCTAP/dMR41/RwYMbTyGXkTVdO6vhA40IdvAf0AP5g2WRsicxZS09g59
         JGzgyTSuRH+PG0CmcKWumSWlUQW2iMflyKYz9KYXPPynPpx1SOkIgBstewb4NCwmCNq/
         9wpqfkRXVnIRgIso9cmU6rkPAEBBXwrHuc+0i+HdvcxF8rdopxGmT+kogf9Ssmw4s4Ck
         zGuBpallPQvG2VFJwFGyh3rIP0/IF8nfpGOmeYs/u9Jg2RkFfixYDntpgxTFKJA+GR+9
         Zuxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=sd30q3o8WBiTO0J4EvDmf9MZk1QQh2LuLxn4BOPkESU=;
        b=Nqq4Z6lDqOsK70NGRwlJdtTtcUHYEw/cALL3a/JjlRKLka5qoExh0pa/F+NN3zj9XR
         cIZ3GgogUZwpHIBD3ZYFit9XBAuAO8z1y1zewuTH96djIkzgLBZXevJhIK1oCVsl0Bmn
         YvVYC9qtlNle0j9Def77OhftxZYA2cSAInNvtNCJswE2mgsAYGV7uQtYm1FgtJn0uDaz
         GxkDRhxS6qpoU05/vHppRH0qF9WNlcLvUeU5jCvp6H8J6CIfy8XezFiTL780hcF0b75O
         TQAFUjF4BhVdXTSDwvvi6/ckIvBhAQ5sdCg5Jba37w02yQaTFqpY6W+mk91UI/Ucm/Na
         Shsg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z9-20020ac87f89000000b0031eb2b7662csi873900qtj.152.2022.09.02.02.26.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Sep 2022 02:26:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:42682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oU2wi-0006LB-Ve
	for alex.bennee@linaro.org; Fri, 02 Sep 2022 05:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hesham.almatary@huawei.com>)
 id 1oU2vd-0006H3-14; Fri, 02 Sep 2022 05:25:33 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hesham.almatary@huawei.com>)
 id 1oU2vY-0000OJ-QC; Fri, 02 Sep 2022 05:25:32 -0400
Received: from fraeml745-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4MJstx5KFbz688hK;
 Fri,  2 Sep 2022 17:24:41 +0800 (CST)
Received: from lhrpeml500004.china.huawei.com (7.191.163.9) by
 fraeml745-chm.china.huawei.com (10.206.15.226) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 2 Sep 2022 11:25:18 +0200
Received: from [10.202.227.118] (10.202.227.118) by
 lhrpeml500004.china.huawei.com (7.191.163.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 2 Sep 2022 10:25:17 +0100
Message-ID: <121c6b9f-0b7f-475b-570c-fd5bdc6f6c3a@huawei.com>
Date: Fri, 2 Sep 2022 10:25:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 0/8] AArch64/HMAT support and tests
To: "Michael S. Tsirkin" <mst@redhat.com>
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
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 lhrpeml500004.china.huawei.com (7.191.163.9)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=hesham.almatary@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 2zdJGrsl5j+5

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

Just a reminder of that could make it now.


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
