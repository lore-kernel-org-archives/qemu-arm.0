Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp1568146lfg;
        Tue, 26 Jul 2022 08:06:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s5vW3CRDKI2H6R1xWlkvrZJNO3FyZvs9F11sa5jA4p4ew+a6lVOLQh1O3dr7pqyCexZEJY
X-Received: by 2002:a05:620a:4591:b0:6b5:ff44:39c1 with SMTP id bp17-20020a05620a459100b006b5ff4439c1mr12487567qkb.204.1658847992351;
        Tue, 26 Jul 2022 08:06:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658847992; cv=none;
        d=google.com; s=arc-20160816;
        b=jFGxYHPa1tQXDiyvmcGRj5AgHhuE1KK0BvUDNijVy3YyPOy+gEM3DPx2QeAfvDFHrA
         VMZvFraOmo3tFEoyrNkmDZnJZSfyJC3s0t5AdJzg7Mxk9fFGXJdy1OVtXr0ekmxc45cY
         bqJ+AgwV1AezS0Ccb6+bZu3R82rkDZNy/lHVQqVu5fNzRu98fsOKcMgHROUsx+Dfo2Vp
         tqHgYJerN8HttdpfvEI3TYdYFM2fKtcHzuZfz/g86n2T5NdAjCiUR76GmcbcGQKyf1HA
         zo4ykIa/I19OdfZUinPXA/I9z9ZdYJOUQuRn8z1+oKmduGxhP8TgTq+9O/yLiiwvVWxF
         a8rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=WvUq+4+UZEdCZNghObbzTIsHwGzQaP0cbPTa0Ik0SXE=;
        b=a0x5KE05gGXKtb1gXlVA7zXoRhCwVNZuKgXw5LLWV8PjBqdHA5ueUXKo+z4QNYvptH
         ZRyrsyBuTE+EJWEPfl5V60vUUPyS2oCH8vlmOprUtp9y6jCO/4VnFqybfVHYZNlocKFS
         hKdAW/ISkhDArPvAJJ4R+cH8N6UQ0kPD/mUJGgNjWo/lOwPvWdH+v3heMyFxQ5Spiw0j
         ka5SHyJhoplrR0WZAa0jwvbhmvN905IFKNgOYzOTC3Kp6maSx5QSxX6i/RTW6GZ+c/Ku
         +LB7FWmN40kjydoTVjfTjrWwS51tJeu9M4HA17BChSfMNWVJuSa1vRTx6LgKysKAgZGG
         EdMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LLvcf3aj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jx11-20020a0562142b0b00b00474247be353si7345650qvb.25.2022.07.26.08.06.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Jul 2022 08:06:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LLvcf3aj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oGM8l-0005OI-RZ
	for alex.bennee@linaro.org; Tue, 26 Jul 2022 11:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGM7J-0005JI-9T
 for qemu-arm@nongnu.org; Tue, 26 Jul 2022 11:05:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGM7F-0002zW-U2
 for qemu-arm@nongnu.org; Tue, 26 Jul 2022 11:04:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658847896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WvUq+4+UZEdCZNghObbzTIsHwGzQaP0cbPTa0Ik0SXE=;
 b=LLvcf3ajyUkgi375WzvQRzlMdwoxE8jdb3NBrgsri3jCHeJZ8cnIZ5f/KVKyqj5Mpw2f/0
 ZGxupO95zQ5Drdc1ji14uE2+TpYIjOVUtyawkIkGppWDGKjaCKrQWcerwqghFUaBoBSpJj
 QBGARUzdXJ5mGMLpMIUoVrPnK8hpMOY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-QZp1JAIhNxi8KSg5FHMbOA-1; Tue, 26 Jul 2022 11:04:55 -0400
X-MC-Unique: QZp1JAIhNxi8KSg5FHMbOA-1
Received: by mail-ed1-f72.google.com with SMTP id
 w5-20020a05640234c500b0043be08bb082so5169418edc.9
 for <qemu-arm@nongnu.org>; Tue, 26 Jul 2022 08:04:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=WvUq+4+UZEdCZNghObbzTIsHwGzQaP0cbPTa0Ik0SXE=;
 b=1Kto7EUlVDD/muLVi9Wp4jSgNgIMeya+ARlAkK+yxUWakvg2n46UukhD0wvRPV5hca
 +ouQvxGsPcT7rJC73yU+vvqNDZvxJzAcxpmE+nnSjz+ZYH0mkR+UdzoZxdgcPVEXqMDk
 SXG/nM5xwtTQ/hyNGrgj6Os7C4yDae/3JNXexa2LJjdPy7hVea5tZ59Cgs5wTm19opaX
 4QNIIqrrKe8IuSxBXVC/zKsC4mWqtlGMwQgnkKp1cuumm5W1zZhXZm3vgHwU8rIgu0ng
 zI5dGbD7c5L0mMmzCHL5026NpJQieU6P3KsqqSGqLS1hlHIQJ6FkKdn3XGXfJu6vqgzn
 2+lA==
X-Gm-Message-State: AJIora+lCHQF4tYoYSyzQanT3dE4WH75Nm3owOmgQ091sglLbARvNflr
 O7ZPp+Pn05VofD9cILS0+iANqMBcBjdJRgPjFxRNjBxuAEprRX5NCQqSSnzID5/PAYAqKOb/GNu
 pl/15bjACy8i/
X-Received: by 2002:a05:6402:278c:b0:43a:91cb:c43a with SMTP id
 b12-20020a056402278c00b0043a91cbc43amr18768250ede.188.1658847894027; 
 Tue, 26 Jul 2022 08:04:54 -0700 (PDT)
X-Received: by 2002:a05:6402:278c:b0:43a:91cb:c43a with SMTP id
 b12-20020a056402278c00b0043a91cbc43amr18768213ede.188.1658847893371; 
 Tue, 26 Jul 2022 08:04:53 -0700 (PDT)
Received: from redhat.com ([2.55.43.166]) by smtp.gmail.com with ESMTPSA id
 b7-20020aa7c6c7000000b0043a78236cd2sm8784603eds.89.2022.07.26.08.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 08:04:52 -0700 (PDT)
Date: Tue, 26 Jul 2022 11:04:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
Cc: jonathan.cameron@huawei.com, qemu-devel@nongnu.org,
 yangyicong@huawei.com, chenxiang66@hisilicon.com,
 linuxarm@huawei.com, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, wangyanan55@huawei.com,
 marcel.apfelbaum@gmail.com, eduardo@habkost.net,
 Brice.Goglin@inria.fr, jingqi.liu@intel.com
Subject: Re: [PATCH v2 0/8] AArch64/HMAT support and tests
Message-ID: <20220726110406-mutt-send-email-mst@kernel.org>
References: <20220719094950.1049516-1-hesham.almatary@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220719094950.1049516-1-hesham.almatary@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 75Ihi/CypMwU

On Tue, Jul 19, 2022 at 10:49:42AM +0100, Hesham Almatary wrote:
> This patchset adds support for AArch64/HMAT including a test.
> It relies on other two patch sets from:
> 
> Brice Goglin: to support -numa without initiators on q35/x86.
>   https://lore.kernel.org/all/ed23accb-2c8b-90f4-a7a3-f81cc57bf678@inria.fr/
> Xiang Chen: to enable/support HMAT on AArch64.
>   https://lore.kernel.org/all/1643102134-15506-1-git-send-email-chenxiang66@hisilicon.com/

Thanks!
I think it's best to merge this all after the release.
I've tagged this but please ping me after the release
just to make sure. Thanks everyone!

> I further add a test with ACPI/HMAT tables that uses the two
> patch sets.
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
> -- 
> 2.25.1

