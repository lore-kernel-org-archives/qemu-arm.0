Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp968615ejc;
        Mon, 31 Oct 2022 06:17:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6d4dh8Ez2fpJ6DdxCbHfZUx2wcfXD88PjnPl7aYU1CGFwQwYwf2TNqDvv1tV90QTIS9nyy
X-Received: by 2002:a67:c002:0:b0:3a9:e430:e36 with SMTP id v2-20020a67c002000000b003a9e4300e36mr4627446vsi.65.1667222279049;
        Mon, 31 Oct 2022 06:17:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667222279; cv=none;
        d=google.com; s=arc-20160816;
        b=b0e5eH+kZ/eem/sZhFcO7JNyWWP/J6C8KsU0oQR6j5czcpBDNhCJ0WQIwf06ao5QgS
         KUeE9Vq19tpXGoeE1Gv3UtLZ7KUQvNdZYexaSKcLtsEfQeJacdgXXMxN8bZM9F1S+k/4
         zUFZFYikCRrE63cA6WYDZ6RAUyoSPEid3SRxkJ5P9+Tem5Lqu8TFHpYTR4Vgrqy0RBie
         JXhTt90RzCbGy7nkE2wX14KMbhf5K/DCCtLi+EFXaCgrYXe3vtV9hJS60Kx1UjBeY3DW
         8gAsKxDkmmwUlGK9MjuDsDfhGI4uyIPD8OWv/7QVrMYMShRbJp+pz4spF8y5RsFodSif
         aE9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:from:reply-to:sender:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=zEeQ0hjXosCSr76pUS26L9iVylYb1GVe/D/mZGk595Y=;
        b=Yn++dS512ETTrZcXMsn58Lh/RTHmtNGBW9tEGZPhlZzUTUBo5GJI9//jHEXW0n8x+R
         Cy/0KeOxS4dAvd8U6GfIhCmCLm8qx8gv8OXUi5E/cFerujmWrKXKYzfxxsbFXZ5VzZZW
         kbegoEgMaphzBj7sMpEF1sA48mTCrq2zOsFDPF1rdIsGANujanSUv16Zql/P4tmE+GXR
         J1N52pxYWaaCNX4+EDU+LjOzD0si7sUyumetLgqdFjWOXMlXg8NknYEWzlsz90VW9sMR
         oE/20oP0Z5NODGlN8U7OPnwTEhC9+ZpZ/fTOEInn+A6jZgEA0FxX5KjPIANf5wBEdBFM
         omXw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v21-20020a67c015000000b0039080310051si195919vsi.201.2022.10.31.06.17.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 06:17:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opUfk-0004s8-ED; Mon, 31 Oct 2022 09:17:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1opUfV-0004L5-Gr; Mon, 31 Oct 2022 09:17:34 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1opUfS-0004G4-Mb; Mon, 31 Oct 2022 09:17:33 -0400
Received: from frapeml500006.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4N1DDD2JyGz687wc;
 Mon, 31 Oct 2022 21:15:40 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 frapeml500006.china.huawei.com (7.182.85.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 31 Oct 2022 14:17:18 +0100
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 31 Oct
 2022 13:17:18 +0000
Date: Mon, 31 Oct 2022 13:17:17 +0000
To: Yicong Yang <yangyicong@huawei.com>, <mst@redhat.com>
CC: Hesham Almatary <hesham.almatary@huawei.com>, <qemu-devel@nongnu.org>,
 <yangyicong@hisilicon.com>, <chenxiang66@hisilicon.com>,
 <linuxarm@huawei.com>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <imammedo@redhat.com>, <wangyanan55@huawei.com>,
 <marcel.apfelbaum@gmail.com>, <eduardo@habkost.net>, <Brice.Goglin@inria.fr>
Subject: Re: [PATCH v3 0/8] AArch64/HMAT support and tests
Message-ID: <20221031131717.00003cc4@Huawei.com>
In-Reply-To: <434bea8e-2945-12ee-0a46-0e316bfaade5@huawei.com>
References: <20221027100037.251-1-hesham.almatary@huawei.com>
 <434bea8e-2945-12ee-0a46-0e316bfaade5@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org
X-TUID: vFwHCmGYLBKj

On Fri, 28 Oct 2022 17:53:40 +0800
Yicong Yang <yangyicong@huawei.com> wrote:

> Hi Hesham,
> 
> On 2022/10/27 18:00, Hesham Almatary wrote:
> > This patchset adds support for AArch64/HMAT including a test.
> > It relies on other two patch sets from:
> > 
> > Brice Goglin: to support -numa without initiators on q35/x86.
> >   https://lore.kernel.org/all/ed23accb-2c8b-90f4-a7a3-f81cc57bf678@inria.fr/
> > Xiang Chen: to enable/support HMAT on AArch64.
> >   https://lore.kernel.org/all/1643102134-15506-1-git-send-email-chenxiang66@hisilicon.com/
> > 
> > I further add a test with ACPI/HMAT tables that uses the two
> > patch sets.
> >   
> 
> You seems to forget my tag :)
> 
> Anyway tested again for this series on master of commit 052924548886,
> still works well and all tests passed for qemu-system-aarch64.
> 
> Tested-by: Yicong Yang <yangyicong@hisilicon.com>

Hi,

Michael, I think you said you'd pick this one up? (it hit during last freeze)
Just want to confirm in case everyone was assuming this was someone else's problem ;)
I want to add a bunch of stuff on top of this next cycle (Generic Ports in particular)
so good to get this in place if we can.

Jonathan

> 
> > Changes from v2:
> > - Rebased and fixed a merge conflict
> > 
> > Changes from v1:
> > - Generate APIC and PPTT ACPI tables for AArch64/virt
> > - Avoid using legacy syntax in numa/bios tests
> > - Delete unchanged FACP tables
> > 
> > Brice Goglin (4):
> >   hmat acpi: Don't require initiator value in -numa
> >   tests: acpi: add and whitelist *.hmat-noinitiator expected blobs
> >   tests: acpi: q35: add test for hmat nodes without initiators
> >   tests: acpi: q35: update expected blobs *.hmat-noinitiators
> > expected HMAT:
> > 
> > Hesham Almatary (3):
> >   tests: Add HMAT AArch64/virt empty table files
> >   tests: acpi: aarch64/virt: add a test for hmat nodes with no
> >     initiators
> >   tests: virt: Update expected *.acpihmatvirt tables
> > 
> > Xiang Chen (1):
> >   hw/arm/virt: Enable HMAT on arm virt machine
> > 
> >  hw/arm/Kconfig                                |   1 +
> >  hw/arm/virt-acpi-build.c                      |   7 ++
> >  hw/core/machine.c                             |   4 +-
> >  tests/data/acpi/q35/APIC.acpihmat-noinitiator | Bin 0 -> 144 bytes
> >  tests/data/acpi/q35/DSDT.acpihmat-noinitiator | Bin 0 -> 8553 bytes
> >  tests/data/acpi/q35/HMAT.acpihmat-noinitiator | Bin 0 -> 288 bytes
> >  tests/data/acpi/q35/SRAT.acpihmat-noinitiator | Bin 0 -> 312 bytes
> >  tests/data/acpi/virt/APIC.acpihmatvirt        | Bin 0 -> 396 bytes
> >  tests/data/acpi/virt/DSDT.acpihmatvirt        | Bin 0 -> 5282 bytes
> >  tests/data/acpi/virt/HMAT.acpihmatvirt        | Bin 0 -> 288 bytes
> >  tests/data/acpi/virt/PPTT.acpihmatvirt        | Bin 0 -> 196 bytes
> >  tests/data/acpi/virt/SRAT.acpihmatvirt        | Bin 0 -> 240 bytes
> >  tests/qtest/bios-tables-test.c                | 109
> > ++++++++++++++++++ 13 files changed, 118 insertions(+), 3
> > deletions(-) create mode 100644
> > tests/data/acpi/q35/APIC.acpihmat-noinitiator create mode 100644
> > tests/data/acpi/q35/DSDT.acpihmat-noinitiator create mode 100644
> > tests/data/acpi/q35/HMAT.acpihmat-noinitiator create mode 100644
> > tests/data/acpi/q35/SRAT.acpihmat-noinitiator create mode 100644
> > tests/data/acpi/virt/APIC.acpihmatvirt create mode 100644
> > tests/data/acpi/virt/DSDT.acpihmatvirt create mode 100644
> > tests/data/acpi/virt/HMAT.acpihmatvirt create mode 100644
> > tests/data/acpi/virt/PPTT.acpihmatvirt create mode 100644
> > tests/data/acpi/virt/SRAT.acpihmatvirt 

