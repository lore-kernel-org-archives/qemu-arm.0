Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp359631ejy;
        Thu, 15 Sep 2022 06:24:16 -0700 (PDT)
X-Google-Smtp-Source: AA6agR75qtGR8WCR2VzlFaiLwNK8ZtvExBqMz1IljnHleL4akBRw6JSQFxjR3qGD94oayMyDI0UO
X-Received: by 2002:a05:622a:120c:b0:35b:bbed:9b14 with SMTP id y12-20020a05622a120c00b0035bbbed9b14mr13021908qtx.652.1663248255966;
        Thu, 15 Sep 2022 06:24:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663248255; cv=none;
        d=google.com; s=arc-20160816;
        b=WV4PGDp+heq/fmYrP2YiDv8rKienKQGMG7YqRqA5V7DNGHA/WWYjf7RBiKgUhXWL/g
         63r3PP1v7RbBdvDeKNbdgs3rnpUgx0vjlf3hOqWCFpmJHfDEr/GnWyJCt+s4hxHk1bhB
         IwuZuPyFx3R0W6wdJwZBuN+JyFJwsWaZGdO21l/InLL1bjvTobvzt20I/mqE5Q4JP7EA
         n5x6w7GZwwODzrzG4x7m4TIUglojfgDjHIoAbn2XSdnvRWpqPrcQCe3x4G7kW4ifgN2V
         7fe6m4faiNEkQ+d7qyzx46YkzoYrhzlNUDawvl63dhjeoj5GapsuOBf6X1rf5E+w8OGU
         JeBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:subject:cc;
        bh=2q8vVW56H3LTRWrSBtXnvi/keEbdbSLqJ9KTQPH7fNg=;
        b=URqRldf5YSDWZmSaI/KhjQWfUykkCR2r7ZtGBliVcpYoP1Q9fMgvhl2iCno8X/8y9g
         l/RJ2Q5I5e+T1yjhe51pOiGn6fOHkKDqrwb3KHp8dQ491b0/ge+a6iMxqv5lsuAkDY2v
         kh4kHKXjUoR4w9fUKEfNWsU+DGEzy+5GGRCQ8Y4lmv+qjvYM7GIbIApMNesVSOwd3hXU
         6SAHAy/4HTK8FBD3VM4BbdQTrqEVjqDFuQV7+zL0VP0PwGrLcP2n9OaexjMRcRBRKqPN
         M67j7fHI2iWgA92kSQ6WszBVItU5jLmkyjPpCSj9eghbZV0vV9GqYMkS84JexJYdtHXM
         HYZA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p5-20020a05622a00c500b0035cb9e0cf78si3050710qtw.768.2022.09.15.06.24.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Sep 2022 06:24:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:34770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oYoql-0007I3-Dx
	for alex.bennee@linaro.org; Thu, 15 Sep 2022 09:24:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1oYjH2-00035I-Qa; Thu, 15 Sep 2022 03:27:00 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:5171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1oYjGz-0004Tm-Jw; Thu, 15 Sep 2022 03:27:00 -0400
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MSpcQ28bvzBsKF;
 Thu, 15 Sep 2022 15:24:38 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 15 Sep 2022 15:26:41 +0800
CC: <yangyicong@hisilicon.com>, <chenxiang66@hisilicon.com>,
 <linuxarm@huawei.com>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <imammedo@redhat.com>, <wangyanan55@huawei.com>,
 <marcel.apfelbaum@gmail.com>, <eduardo@habkost.net>, <Brice.Goglin@inria.fr>, 
 <mst@redhat.com>, <jingqi.liu@intel.com>
Subject: Re: [PATCH v2 0/8] AArch64/HMAT support and tests
To: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>,
 <jonathan.cameron@huawei.com>, <qemu-devel@nongnu.org>
References: <20220719094950.1049516-1-hesham.almatary@huawei.com>
Message-ID: <854fc789-b0ba-c692-af4e-7acaf94eb25f@huawei.com>
Date: Thu, 15 Sep 2022 15:26:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20220719094950.1049516-1-hesham.almatary@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=yangyicong@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.583,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 15 Sep 2022 09:21:36 -0400
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
Reply-to:  Yicong Yang <yangyicong@huawei.com>
From:  Yicong Yang via <qemu-arm@nongnu.org>
X-TUID: f//BGFPdenO1

On 2022/7/19 17:49, Hesham Almatary wrote:
> This patchset adds support for AArch64/HMAT including a test.
> It relies on other two patch sets from:
> 
> Brice Goglin: to support -numa without initiators on q35/x86.
>   https://lore.kernel.org/all/ed23accb-2c8b-90f4-a7a3-f81cc57bf678@inria.fr/
> Xiang Chen: to enable/support HMAT on AArch64.
>   https://lore.kernel.org/all/1643102134-15506-1-git-send-email-chenxiang66@hisilicon.com/
> 
> I further add a test with ACPI/HMAT tables that uses the two
> patch sets.
> 

Hi Hesham,

I've used this feature locally for a period on aarch64 and it works fine. Also tested the qemu
test added based on v7.1.0-rc4 and `make test` show:

108/130 qemu:qtest+qtest-aarch64 / qtest-aarch64/bios-tables-test          OK              99.80s   7 subtests passed

Wish to see this in mainline!

Tested-by: Yicong Yang <yangyicong@hisilicon.com>

Thanks!

> Changes from v1:
> - Generate APIC and PPTT ACPI tables for AArch64/virt
> - Avoid using legacy syntax in numa/bios tests
> - Delete unchanged FACP tables
> 
> Brice Goglin (4):
>   hmat acpi: Don't require initiator value in -numa
>   tests: acpi: add and whitelist *.hmat-noinitiator expected blobs
>   tests: acpi: q35: add test for hmat nodes without initiators
>   tests: acpi: q35: update expected blobs *.hmat-noinitiators expected
>     HMAT:
> 
> Hesham Almatary (3):
>   tests: Add HMAT AArch64/virt empty table files
>   tests: acpi: aarch64/virt: add a test for hmat nodes with no initiators
>   tests: virt: Update expected *.acpihmatvirt tables
> 
> Xiang Chen (1):
>   hw/arm/virt: Enable HMAT on arm virt machine
> 
>  hw/arm/Kconfig                                |   1 +
>  hw/arm/virt-acpi-build.c                      |   7 ++
>  hw/core/machine.c                             |   4 +-
>  tests/data/acpi/q35/APIC.acpihmat-noinitiator | Bin 0 -> 144 bytes
>  tests/data/acpi/q35/DSDT.acpihmat-noinitiator | Bin 0 -> 8553 bytes
>  tests/data/acpi/q35/HMAT.acpihmat-noinitiator | Bin 0 -> 288 bytes
>  tests/data/acpi/q35/SRAT.acpihmat-noinitiator | Bin 0 -> 312 bytes
>  tests/data/acpi/virt/APIC.acpihmatvirt        | Bin 0 -> 396 bytes
>  tests/data/acpi/virt/DSDT.acpihmatvirt        | Bin 0 -> 5282 bytes
>  tests/data/acpi/virt/HMAT.acpihmatvirt        | Bin 0 -> 288 bytes
>  tests/data/acpi/virt/PPTT.acpihmatvirt        | Bin 0 -> 196 bytes
>  tests/data/acpi/virt/SRAT.acpihmatvirt        | Bin 0 -> 240 bytes
>  tests/qtest/bios-tables-test.c                | 109 ++++++++++++++++++
>  13 files changed, 118 insertions(+), 3 deletions(-)
>  create mode 100644 tests/data/acpi/q35/APIC.acpihmat-noinitiator
>  create mode 100644 tests/data/acpi/q35/DSDT.acpihmat-noinitiator
>  create mode 100644 tests/data/acpi/q35/HMAT.acpihmat-noinitiator
>  create mode 100644 tests/data/acpi/q35/SRAT.acpihmat-noinitiator
>  create mode 100644 tests/data/acpi/virt/APIC.acpihmatvirt
>  create mode 100644 tests/data/acpi/virt/DSDT.acpihmatvirt
>  create mode 100644 tests/data/acpi/virt/HMAT.acpihmatvirt
>  create mode 100644 tests/data/acpi/virt/PPTT.acpihmatvirt
>  create mode 100644 tests/data/acpi/virt/SRAT.acpihmatvirt
> 
