Received: by 2002:a05:7022:458e:b0:46:22f1:8c13 with SMTP id cf14csp1085835dlb;
        Fri, 28 Oct 2022 02:54:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4LAydlDD2gh4GIm3ZaQbMunfmNe3/ElQYvWoQXKTMYdkS2bTMyu1nvuM1THVhRNCzhoFVB
X-Received: by 2002:a05:620a:84f:b0:6ed:60c4:99c3 with SMTP id u15-20020a05620a084f00b006ed60c499c3mr38163430qku.452.1666950866269;
        Fri, 28 Oct 2022 02:54:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666950866; cv=none;
        d=google.com; s=arc-20160816;
        b=W1SYhCpZncjuPhsa/meAv4nTKtMp5Sf3003Otuzwq6J8FeaUbxzdKb4ssdHdVh1S6T
         MoGFT0Vq7AWRPFmVqQEt33mFasEW0SS1howGR/fmUpxg2C1RmdmfZeiXLJBXHdypz09/
         0KQ6J6uzTChoN63hf9XyCAlI+qGoyHDEPX1GU3MALmQsqKKmO1zZ4RfAfloGy/ZRX9p5
         5RK86VCACCT+XR39RW0h+jPgzG+PLGEx/nIt+hC859N0P5MKb0QD8/zEDI9MrcP64ip4
         U7UQaLcIs0TiRsdjD9+foWN1DRXrHXq6TcvF2NyEZnvud+fod1dqd/T35kRLzb2i3912
         AfMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:from:reply-to:sender:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:subject:cc;
        bh=KXcODZJYx5hiSWzBT2qXnVliFByDfN4UJT+aTSU+xw8=;
        b=G3Ht0XnAi1/VB7pfwyd60MqffUoBEJz/k5KcSsJ5ne+gjr/TNx/y5wZSdRbSEdYy/6
         r4OmhvcWqLu7tnO4tPvWo7G2q/eIFaKTYugUSvWLzUmwW6EPwIVzffDatwqMnosonS1a
         RGEK/MxwV9v2z/uVP2220nlKlW62KJR0ZFL35xaoijHYSvE0CnUGIDJl4gqVqgRkdb9E
         u1CATB5gDIVpKqX7VpbIz4BsmFnnI0CFk3IKwPlmFIt7d7PRGDutwJD+3H4zdYkq6q86
         uq+Had7Az+GQCEStytYcy3QzaW+CV4zBtf5X0nNWiY86urrzIRKA6wM69/9lejEO1IAV
         CzUg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iy12-20020a0562140f6c00b004ad75348c7asi2401091qvb.256.2022.10.28.02.54.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Oct 2022 02:54:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ooM3t-0004p6-GY; Fri, 28 Oct 2022 05:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1ooM3p-0004lu-4H; Fri, 28 Oct 2022 05:53:57 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1ooM3m-0003ry-25; Fri, 28 Oct 2022 05:53:56 -0400
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MzHqJ1XbHzFq4r;
 Fri, 28 Oct 2022 17:50:52 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 28 Oct 2022 17:53:40 +0800
CC: <yangyicong@hisilicon.com>, <chenxiang66@hisilicon.com>,
 <jonathan.cameron@huawei.com>, <linuxarm@huawei.com>, <qemu-arm@nongnu.org>,
 <peter.maydell@linaro.org>, <imammedo@redhat.com>, <wangyanan55@huawei.com>,
 <marcel.apfelbaum@gmail.com>, <eduardo@habkost.net>, <Brice.Goglin@inria.fr>, 
 <mst@redhat.com>
Subject: Re: [PATCH v3 0/8] AArch64/HMAT support and tests
To: Hesham Almatary <hesham.almatary@huawei.com>, <qemu-devel@nongnu.org>
References: <20221027100037.251-1-hesham.almatary@huawei.com>
Message-ID: <434bea8e-2945-12ee-0a46-0e316bfaade5@huawei.com>
Date: Fri, 28 Oct 2022 17:53:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20221027100037.251-1-hesham.almatary@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=yangyicong@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Reply-to:  Yicong Yang <yangyicong@huawei.com>
From:  Yicong Yang via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: i23LNkZmf46C

Hi Hesham,

On 2022/10/27 18:00, Hesham Almatary wrote:
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

You seems to forget my tag :)

Anyway tested again for this series on master of commit 052924548886, still works well and all tests passed
for qemu-system-aarch64.

Tested-by: Yicong Yang <yangyicong@hisilicon.com>

> Changes from v2:
> - Rebased and fixed a merge conflict
> 
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
>   tests: acpi: aarch64/virt: add a test for hmat nodes with no
>     initiators
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
