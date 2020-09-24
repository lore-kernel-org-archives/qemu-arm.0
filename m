Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp13572lfq;
        Thu, 24 Sep 2020 00:29:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAqJyOV1EYmOidZexO4n9lJ3b5l5Rw5diLM+KZkFylQLcg47w+q4NGwnNdPtB2L5tqqGzI
X-Received: by 2002:a25:fd4:: with SMTP id 203mr5555836ybp.100.1600932575163;
        Thu, 24 Sep 2020 00:29:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600932575; cv=none;
        d=google.com; s=arc-20160816;
        b=SG8ABWsIxZ4TXeJbT0NTVO8nwj2eqXRxZEdT+WH7zLDPP6OQJrkYhh1qEr9cbYGxVp
         +OE2mKGvUGxBiTeS1eSe1R0WwakrrHGIK7llQkXq3bCaW2qwnyyswNsry1plMoaf8/0M
         MtiL7FaBQKAOhWKLJgiTpuCJV59OAI9glzvzm1znBcLl30VaOj7QP8BnzkRt0JfifM2X
         t2gQn/1VLZDazq+4ISgQ5WeXgDD7bJA3s1c9vPdaZ5yvU3aWH/3z6b/WWsYvPZiEyAeO
         p64TDp0AX1LMHIsPN10lsCH+Kpyf4GegI4aquWfREUOw5A849pgnk//pvZ4z4EEWV5su
         ZdqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=DIfN4gb2baP3m9gO2qf2nmPpD5fGv+SmwP5XcglDPMY=;
        b=pzQJFW9oCkPhVde6inIvDE0ZEaix34ORnDmv83kjN7VBzjfNq4OrIOo/wcgKrt6avQ
         t9B+qGnewuPJ0TqnL+cgDooHSrVvqHlYFvSrEnSkGMMr6YzKhav0PHc0RwpLyZRTjatT
         GdxCMxu4GC/9Zu4+FXj9CLhIQR8XQHRoKw3c3R91p0KZtR+AlAOfjeL4SgoIz1voRiXI
         PBqyYZXvHGcOiswksxnqSPZn982qW7g+FKvk2oivWrYu79+Vekje7HFkZyYJFLVdJplE
         QPwNnQFhNYGmD20k++omiTD63GCqRXqIW/QfGr4ImXmuVaiEmnmGgu9QTjNA91/X4bBt
         VO2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hFzqBMcY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f17si2360563ybk.200.2020.09.24.00.29.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Sep 2020 00:29:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hFzqBMcY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kLLh8-0001EY-Hm
	for alex.bennee@linaro.org; Thu, 24 Sep 2020 03:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kLLgr-0001E4-0M
 for qemu-arm@nongnu.org; Thu, 24 Sep 2020 03:29:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kLLgl-0008Q4-RY
 for qemu-arm@nongnu.org; Thu, 24 Sep 2020 03:29:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600932550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DIfN4gb2baP3m9gO2qf2nmPpD5fGv+SmwP5XcglDPMY=;
 b=hFzqBMcY89EtODc6ogD06sbdk4lkvx3aNCgARJYPi36L7phDwiMAEMx6/XLDc2lZG0W7wF
 UrQ5JmCcf7J2bIz32L1gMsUD131Rm4h91g+MRbxkNhvjBmipFU2DZl4sZ1xxNkeo4+tu4R
 hk3+HFg5dV90nUJQTqJuebnQYpvus6Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-w11Ovw7IMK-otUkFhAe5_w-1; Thu, 24 Sep 2020 03:29:08 -0400
X-MC-Unique: w11Ovw7IMK-otUkFhAe5_w-1
Received: by mail-wm1-f69.google.com with SMTP id l15so876823wmh.9
 for <qemu-arm@nongnu.org>; Thu, 24 Sep 2020 00:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DIfN4gb2baP3m9gO2qf2nmPpD5fGv+SmwP5XcglDPMY=;
 b=O+jIp8LeRgAQFun7TiiJmpJGdoq2fK+v+f+EBbI6bcfrM7RHr74pzoqccgTeKl5Lzh
 wbz6ude+Vpep2/TnBNcUD4qsgTFaVj9Mjmpk/QNE+RSxrv+z87/lYSZ398IG1A6iH7vJ
 3qzfCCpCJHzs9yRDG/A5lrZd4KXv2iAUfYrgN4UukDW+PgWWf6YC6Sv44cyhAo0bhsVc
 IY/nTo0xPXsIshtaDzyiw2SmiLAdhgUWaeX1Vx/sNikmJvq3lWh/QGIg14JcizfQwxNu
 KCOrc11mWeLbmAC01QSmUf5AzcG71KZ5SSg7EufJlFnX2E0ovU8773o45xFlkrqO0Nky
 BLAA==
X-Gm-Message-State: AOAM530Wkx0cAcpL6WkYY6nrz3HcjLdc+k6BaqLBRPlDv0qlGFb4zxx6
 /S3CznXPMdGVEA+LUO+AfNIOp/nswWlfJOHo/0JqguJN/DC0I4jw75aQYYMjkbi9RaCKJ08CKjw
 bIEzmOqfomDpz
X-Received: by 2002:adf:e488:: with SMTP id i8mr3747410wrm.116.1600932547449; 
 Thu, 24 Sep 2020 00:29:07 -0700 (PDT)
X-Received: by 2002:adf:e488:: with SMTP id i8mr3747365wrm.116.1600932547117; 
 Thu, 24 Sep 2020 00:29:07 -0700 (PDT)
Received: from redhat.com (bzq-79-179-71-128.red.bezeqint.net. [79.179.71.128])
 by smtp.gmail.com with ESMTPSA id a15sm2689627wrn.3.2020.09.24.00.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 00:29:06 -0700 (PDT)
Date: Thu, 24 Sep 2020 03:29:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 00/11] microvm: add pcie support
Message-ID: <20200924032838-mutt-send-email-mst@kernel.org>
References: <20200924062734.22978-1-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200924062734.22978-1-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/24 01:10:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z7QKlER4QJLQ

On Thu, Sep 24, 2020 at 08:27:23AM +0200, Gerd Hoffmann wrote:
> v2:
>  - move aml generator to gpex and have arm virt + microvm share it.
>  - add 64bit window.
>  - add testcase.

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

which tree is this for? Yours?


> Gerd Hoffmann (11):
>   move MemMapEntry
>   acpi: add acpi_dsdt_add_gpex
>   arm: use acpi_dsdt_add_gpex
>   microvm: add irq table
>   microvm: add pcie support
>   microvm/pcie: add 64bit mmio window
>   tests/acpi: allow updates for expected data files
>   tests/acpi: factor out common microvm test setup
>   tests/acpi: add microvm pcie test
>   acpi/gpex: no reason to use a method for _CRS
>   tests/acpi: update expected data files
> 
>  include/exec/hwaddr.h             |   5 +
>  include/hw/arm/virt.h             |   5 -
>  include/hw/i386/microvm.h         |  32 ++++++
>  include/hw/pci-host/gpex.h        |  11 ++
>  hw/arm/sbsa-ref.c                 |   5 -
>  hw/arm/virt-acpi-build.c          | 175 ++---------------------------
>  hw/i386/acpi-microvm.c            |  12 ++
>  hw/i386/microvm.c                 |  91 +++++++++++++++
>  hw/pci-host/gpex-acpi.c           | 177 ++++++++++++++++++++++++++++++
>  tests/qtest/bios-tables-test.c    |  27 ++++-
>  hw/i386/Kconfig                   |   1 +
>  hw/pci-host/meson.build           |   1 +
>  tests/data/acpi/microvm/DSDT.pcie | Bin 0 -> 3023 bytes
>  tests/data/acpi/virt/DSDT         | Bin 5200 -> 5196 bytes
>  tests/data/acpi/virt/DSDT.memhp   | Bin 6561 -> 6557 bytes
>  tests/data/acpi/virt/DSDT.numamem | Bin 5200 -> 5196 bytes
>  16 files changed, 361 insertions(+), 181 deletions(-)
>  create mode 100644 hw/pci-host/gpex-acpi.c
>  create mode 100644 tests/data/acpi/microvm/DSDT.pcie
> 
> -- 
> 2.27.0
> 

