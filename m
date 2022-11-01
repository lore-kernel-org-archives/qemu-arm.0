Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp1733353ejc;
        Tue, 1 Nov 2022 03:35:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4TOrxPmrah75NYmOARgpp5L/cwVIJ2rxy0rqVRnDzhXk5u5TU0K+l9YCkOv2ZJo+pblJWm
X-Received: by 2002:ad4:5cc9:0:b0:4bb:df19:372e with SMTP id iu9-20020ad45cc9000000b004bbdf19372emr11258861qvb.5.1667298917687;
        Tue, 01 Nov 2022 03:35:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667298917; cv=none;
        d=google.com; s=arc-20160816;
        b=cN7Dx/HBp/pR7gP4FENbyCTgS/BrEcE4Xkr3odKwaAcjqVhS8MQwwx7c7fYkba9JSo
         Oh1sx0Q3T50gTwOSIZJGEbVXpNMwAKaOreStdTQ/ktI822tW4jNXfNtNx0xDxHv7mBY8
         D7pD2wvxCxB/tMflDpGbfTqu8gbUuhcp54eqM5sus5LjpsLZYSW+OcHtlVsOd6PTI2nm
         Z++i2fVro+dzbwYa+mF+BsQDqrdmsgZlB8dd0VMH+O+dCGaVddrH2xQCfUfEYBBf1tWh
         KOg1EVcxlTE3B1sThoMKyvEUoC4BramKA4C/9gpXK02KezOCSN4GdoVhKhcXAiVeOcdV
         +YHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=J4YlKpUkOPwg9hZrm+Jkq7zsOUnkviHL4mmCT9Aeir0=;
        b=qxK7ULhfLf+BjaHBNm1sns6ayj8oa2zkcR7XW0XK1fIiYs2P/Xdi8ah4eZuLCgbaym
         zHcJ+Hk6PvPkjhowlg8Q0WuhMqwf4aP9dWOhjIYMHR5wEQtSRKBFDimSbPqCXjH09fnB
         Bs3foImx/BcZp2Szy77jkiLj+kfwjtZ9j9v8fd+W/GHAml35MTqtermAKjZMMUqGOvvo
         TG3CsMfaQwmTdGrJqMywVCPy4Xcc3kKRmwBew1ba3sUMlSsH2a++MRDnHjexugJZ5nnA
         KfShCdaczrP9OZcXMHSyPKcil1aLdEDMyB4xQSeG9H1UJTnMD38i/+wbrBODXmw+k26X
         undw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DDE58XLX;
       spf=pass (google.com: domain of qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hu1-20020a056214234100b004bbc8fffea3si5334361qvb.539.2022.11.01.03.35.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Nov 2022 03:35:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DDE58XLX;
       spf=pass (google.com: domain of qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opobj-00030j-T0; Tue, 01 Nov 2022 06:34:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opobh-0002zz-Nn
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 06:34:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opobg-0007Mf-3T
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 06:34:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667298894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J4YlKpUkOPwg9hZrm+Jkq7zsOUnkviHL4mmCT9Aeir0=;
 b=DDE58XLXB3iNwhMak/hM86qwQJvL3Z9u3+CY9qdd/zI/hoSQo+Ync9eQxGcywfHiaUBIHX
 UHLELihZNUpXNUX1msJUMnE1kdBEqTBrbPaBOeim2OBLz5XLKNB8IDjCLy3MB0IiWXcuBS
 oqbep2F57NMSK1i+FImr88lSfog3hqY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-263-o7WxblvxNka20dl7VXbVvg-1; Tue, 01 Nov 2022 06:34:53 -0400
X-MC-Unique: o7WxblvxNka20dl7VXbVvg-1
Received: by mail-wm1-f71.google.com with SMTP id
 r6-20020a1c4406000000b003cf4d3b6644so2371842wma.6
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 03:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J4YlKpUkOPwg9hZrm+Jkq7zsOUnkviHL4mmCT9Aeir0=;
 b=6zrJ2v2vaTEh0VgFMYtcS5ujGWtM6scsaY6VKAo4UFWntLmXJEd75P1r82V7/EyoPL
 zZQmfZw7Dz3AxmhAKIysMs7AR/6Ww7UOA0w/yHCVHVFklSPzUa0PdCIMYIZ84+O+gdUg
 LNR0tOOeC2uH/uCX+B7wB8QXOFfgJHj5WBMwl7MIVtQ05EF6aXnohUr2LOiAe4FifRM0
 ljAHtRLUh0U8EIcslQrpcmSFaDrhL/Ro/279srvfiZRDt2OHGy7+3i8pwxeQ6CfZ+UEm
 HbCoiO+6V9wc2kkdgcfsZXS6uSTaWQFdyrD/UbxkhXjDZk7ZzUxyBA9Q2TPrN4F/6wir
 tXMQ==
X-Gm-Message-State: ACrzQf1JsMBwNiCHxkYfrmu267HrqCboH2s4tMnUzbhJw099BolCEWWt
 9wQaySu6+zgIBT3JATG3pz8/QVvSXS30w4q0A5Y5MwWUxS8cQ7iIDzHlCj5hDPKKmQYKvNbLnXQ
 b/FcIawdujmy2Zt0=
X-Received: by 2002:a1c:4c03:0:b0:3c4:c76:9fe3 with SMTP id
 z3-20020a1c4c03000000b003c40c769fe3mr21322743wmf.13.1667298891214; 
 Tue, 01 Nov 2022 03:34:51 -0700 (PDT)
X-Received: by 2002:a1c:4c03:0:b0:3c4:c76:9fe3 with SMTP id
 z3-20020a1c4c03000000b003c40c769fe3mr21322722wmf.13.1667298890831; 
 Tue, 01 Nov 2022 03:34:50 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 q6-20020a1c4306000000b003b4fdbb6319sm3177846wma.21.2022.11.01.03.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 03:34:50 -0700 (PDT)
Date: Tue, 1 Nov 2022 06:34:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Hesham Almatary <hesham.almatary@huawei.com>
Cc: jonathan.cameron@huawei.com, qemu-devel@nongnu.org,
 yangyicong@huawei.com, chenxiang66@hisilicon.com,
 linuxarm@huawei.com, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, wangyanan55@huawei.com,
 marcel.apfelbaum@gmail.com, eduardo@habkost.net, Brice.Goglin@inria.fr
Subject: Re: [PATCH v3 0/8] AArch64/HMAT support and tests
Message-ID: <20221101063229-mutt-send-email-mst@kernel.org>
References: <20221027100037.251-1-hesham.almatary@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221027100037.251-1-hesham.almatary@huawei.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org
X-TUID: AfwXnRuQg3Dd

On Thu, Oct 27, 2022 at 11:00:29AM +0100, Hesham Almatary wrote:
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

pipeline failures:
    https://gitlab.com/qemu-project/qemu/-/jobs/3253817453
this looks like a 32 bit host.


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
> -- 
> 2.25.1

