Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2750056ejs;
        Tue, 4 Jun 2024 00:05:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWW7RhBnSf/T6N4mTYEaOJ808kzXBm4zDvDmjinrk9ulx7HNM7deCkOydoPkHZtg3U+EScBGX2dXV7X3qQXD7nNU/RD0aQ7
X-Google-Smtp-Source: AGHT+IEVXyfcNQlj907gPCR/ee9V7wPZHWqXDeiWpYuwMSkSD2EOrS5Y6o2muqZsUHWgYdr6mRTz
X-Received: by 2002:a05:6214:3016:b0:6ad:764d:bf39 with SMTP id 6a1803df08f44-6aff72b286cmr32316976d6.11.1717484729749;
        Tue, 04 Jun 2024 00:05:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717484729; cv=none;
        d=google.com; s=arc-20160816;
        b=FsmMU0CucFh5k4Ju25lFm+ZquDocArqUvIfJ4Z8aNS4z3xg3zHaMB0zoBtX7fKmxHz
         dHOfT3j8w63oXHe/pAiyk51zwGSUF9dpC3uwEwyTv4DC94OOiVPG7/wB/8AikGC4FDGZ
         PTl7iI4dV9lCn53iKKgNJURS3F049NKMjAOpoqtdsOPDrDDIe0jpNcJ8VgUjMWFplvhq
         bpDtaloQeDfYxiRLKlRBb5wDZEQ7RIVpiGNSQYr1cg/yRAde+6kyfpHDvvXI2od6C+x0
         ubuuKgDY4mISgX5Z3jMWSSLgy10D6LqhRQWM2On5PdzjCVrpd/q23wcdVFTn+QEmEkD4
         GgmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=RMMFlBqBxSKAtY3fSRv5AiVk7Z0F2ZuH2si0lWa8sgI=;
        fh=oxdLcXeH5xcU/7+B6AZMInW3FX4/GNXjqO11U7rs6hg=;
        b=Laxu9bL8iCc+h4lvckR9CnqH/74FYV1faU7QNqY+YbiSK89u2ZJZtY9lh4FlcfOccA
         XO2tKPr3Y0nMb4vk5BRoaMtpbZSuw73h+IibpHbt92K0kIqIm9pDjdly5/elVtd+db3f
         jnvOmyDCwwfiJ3m3MjiisAwJPmZc0rScIdimLy8jhO24+4CR11EfNQQVvltytJObjVSA
         MPEf0K8j8oo4qjPmjzlx+5e7+f9RSO5SY44EUMR2ia+kCAJrCWAVmoCCSTcVc8O6SHzQ
         iIuCI5GTrSrqm32el3AeTHo/3SlGrYWQagFhVb2M0rOj5VOlEWAgbKjRQtd9Q+cTrcMP
         gC0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DhqCvwXB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ae4b40198asi1488856d6.299.2024.06.04.00.05.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jun 2024 00:05:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DhqCvwXB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sEOEM-0002II-7E; Tue, 04 Jun 2024 03:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sEOEK-0002HI-Nc
 for qemu-arm@nongnu.org; Tue, 04 Jun 2024 03:05:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sEOEI-0007ue-9I
 for qemu-arm@nongnu.org; Tue, 04 Jun 2024 03:05:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717484709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RMMFlBqBxSKAtY3fSRv5AiVk7Z0F2ZuH2si0lWa8sgI=;
 b=DhqCvwXB4abWeKov9LkNCgV7EmE88BNB4hIQa+giQb81gqezTOHh2CKr8Vjp0zCxpkiQhE
 TU7R2XII9jvu7Zx2x6LWhA4juDGgVfU9CvqY5QqSY1+ZbhE1iiKeHPK4tDL/LS386b5pj/
 6KUpGryURrVlSYlCo7oXsqY3+P7+joQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643--XXq0RquMtGweYjJ3MGmbQ-1; Tue, 04 Jun 2024 03:05:06 -0400
X-MC-Unique: -XXq0RquMtGweYjJ3MGmbQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4211211e18cso38758225e9.3
 for <qemu-arm@nongnu.org>; Tue, 04 Jun 2024 00:05:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717484705; x=1718089505;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RMMFlBqBxSKAtY3fSRv5AiVk7Z0F2ZuH2si0lWa8sgI=;
 b=wlUBhf0Kn390lDAYv4qGA3VH5Xl6Z18H67fAFGqyIkaEq2u2TzojUV0EFU+AmMLjG+
 mnMnGmOqBtRn7DYvT1hk5Rctajge2bEWa8k7nRlpyhqduaNv2/gZn3PflW3gBAnxTCgy
 2ERpQn5FPwzW7v0WFg+FQI8W/JjcBj94LYcaFmmdv5D/N6rCgcYnwwnO12ml2GR3wpp+
 2eXf6ICpCHrWyrGDWOA5T4xm9P6hsvuS6BUzSPD104/suCbbfDqGPzwtfl596IJP9qng
 5l5lnIe6mQX9rMFfnR/YSvqaToRd4scwccIDJ1W45JvCgYOIGSMuzgOGUuubV8WaxSoq
 05Bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvmSNpxiYM6oJe/U9ThGOjHDHE5D7ONYZGaRQHm26Zcv667E7GIFEg4AUgeT2zxdSFpgqVOR7Ab9Rg4Q24JCAmOdRu
X-Gm-Message-State: AOJu0YxHtOjNutfluXninOKcuzoqwrKsu4WyWHXvT/R0tREOhU36dojl
 rTBlJ8QmNVPCEH+eYSXC4G34ikfi1oTXsuYVL9TwA4GHXtOwdk1vlToB+wFcuWBFnDx/FJuV/Zd
 +72XQRj7il2kOHRtJC5fEV2/gbvtsAoe26LX9SvPyhgNvBMfsew==
X-Received: by 2002:a05:600c:5486:b0:421:5237:31df with SMTP id
 5b1f17b1804b1-421523732e3mr5969215e9.28.1717484704988; 
 Tue, 04 Jun 2024 00:05:04 -0700 (PDT)
X-Received: by 2002:a05:600c:5486:b0:421:5237:31df with SMTP id
 5b1f17b1804b1-421523732e3mr5968975e9.28.1717484704419; 
 Tue, 04 Jun 2024 00:05:04 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:552:cf5c:2b13:215c:b9df:f231])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4213ad0aa15sm77020925e9.44.2024.06.04.00.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 00:05:03 -0700 (PDT)
Date: Tue, 4 Jun 2024 03:04:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Sunil V L <sunilvl@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>,
 Haibo1 Xu <haibo1.xu@intel.com>, Anup Patel <apatel@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: Re: [PATCH v2 00/12] Add support for RISC-V ACPI tests
Message-ID: <20240604030424-mutt-send-email-mst@kernel.org>
References: <20240524061411.341599-1-sunilvl@ventanamicro.com>
 <CAKmqyKPQDpo541dF_inV1imL4i6U3KgpeOTPf7TcD-qUwe_O=w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKmqyKPQDpo541dF_inV1imL4i6U3KgpeOTPf7TcD-qUwe_O=w@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 25OgYsY4N2G3

On Tue, Jun 04, 2024 at 01:29:28PM +1000, Alistair Francis wrote:
> On Fri, May 24, 2024 at 4:14 PM Sunil V L <sunilvl@ventanamicro.com> wrote:
> >
> > Currently, bios-table-test doesn't support RISC-V. This series enables
> > the framework changes required and basic testing. Things like NUMA
> > related test cases will be added later.
> >
> > This needs refactoring/renaming of ARM64 bios table tests. Importantly,
> > the test cases now look for the expected AML files under
> > tests/data/acpi/virt/aarch64 path instead of directly under
> > tests/data/acpi/virt. To keep test cases not to fail because of this
> > movement, they are updated to look for both paths first.
> >
> > As part of this effort, it is found that uefi-test-tools is currently
> > broken to build. So, updated its Makefile as well to use python based
> > edk2 build script.
> 
> It would be great to get someone who knows the UEFI world better than I
> do to ack these changes, especially the first few patches
> 
> 
> Alistair


ACPI things look ok. I can merge this but will wait a week or so
more for more acks.

> >
> > The changes are also available at branch
> > https://gitlab.com/vlsunil/qemu/-/tree/riscv_bios_table_test_v2
> >
> > Changes since v1:
> >         1) Addressed feedback from Gerd and Alistair
> >         2) Rebased and added tags received
> >
> > Sunil V L (12):
> >   uefi-test-tools/UefiTestToolsPkg: Add RISC-V support
> >   uefi-test-tools: Add support for python based build script
> >   tests/data/uefi-boot-images: Add RISC-V ISO image
> >   qtest: bios-tables-test: Rename aarch64 tests with aarch64 in them
> >   tests/qtest/bios-tables-test.c: Add support for arch in path
> >   tests/data/acpi/virt: Move ACPI tables under aarch64
> >   meson.build: Add RISC-V to the edk2-target list
> >   pc-bios/meson.build: Add support for RISC-V in unpack_edk2_blobs
> >   tests/data/acpi/rebuild-expected-aml.sh: Add RISC-V
> >   tests/qtest/bios-tables-test: Add empty ACPI data files for RISC-V
> >   tests/qtest/bios-tables-test.c: Enable basic testing for RISC-V
> >   tests/qtest/bios-tables-test: Add expected ACPI data files for RISC-V
> >
> >  meson.build                                   |   2 +-
> >  pc-bios/meson.build                           |   2 +
> >  tests/data/acpi/rebuild-expected-aml.sh       |   5 +-
> >  tests/data/acpi/virt/{ => aarch64}/APIC       | Bin
> >  .../acpi/virt/{ => aarch64}/APIC.acpihmatvirt | Bin
> >  .../acpi/virt/{ => aarch64}/APIC.topology     | Bin
> >  tests/data/acpi/virt/{ => aarch64}/DBG2       | Bin
> >  tests/data/acpi/virt/{ => aarch64}/DSDT       | Bin
> >  .../acpi/virt/{ => aarch64}/DSDT.acpihmatvirt | Bin
> >  tests/data/acpi/virt/{ => aarch64}/DSDT.memhp | Bin
> >  tests/data/acpi/virt/{ => aarch64}/DSDT.pxb   | Bin
> >  .../acpi/virt/{ => aarch64}/DSDT.topology     | Bin
> >  tests/data/acpi/virt/{ => aarch64}/FACP       | Bin
> >  tests/data/acpi/virt/{ => aarch64}/GTDT       | Bin
> >  .../acpi/virt/{ => aarch64}/HMAT.acpihmatvirt | Bin
> >  tests/data/acpi/virt/{ => aarch64}/IORT       | Bin
> >  tests/data/acpi/virt/{ => aarch64}/MCFG       | Bin
> >  tests/data/acpi/virt/{ => aarch64}/NFIT.memhp | Bin
> >  tests/data/acpi/virt/{ => aarch64}/PPTT       | Bin
> >  .../acpi/virt/{ => aarch64}/PPTT.acpihmatvirt | Bin
> >  .../acpi/virt/{ => aarch64}/PPTT.topology     | Bin
> >  tests/data/acpi/virt/{ => aarch64}/SLIT.memhp | Bin
> >  tests/data/acpi/virt/{ => aarch64}/SPCR       | Bin
> >  .../acpi/virt/{ => aarch64}/SRAT.acpihmatvirt | Bin
> >  tests/data/acpi/virt/{ => aarch64}/SRAT.memhp | Bin
> >  .../data/acpi/virt/{ => aarch64}/SRAT.numamem | Bin
> >  tests/data/acpi/virt/{ => aarch64}/SSDT.memhp | Bin
> >  tests/data/acpi/virt/{ => aarch64}/VIOT       | Bin
> >  tests/data/acpi/virt/riscv64/APIC             | Bin 0 -> 116 bytes
> >  tests/data/acpi/virt/riscv64/DSDT             | Bin 0 -> 3518 bytes
> >  tests/data/acpi/virt/riscv64/FACP             | Bin 0 -> 276 bytes
> >  tests/data/acpi/virt/riscv64/MCFG             | Bin 0 -> 60 bytes
> >  tests/data/acpi/virt/riscv64/RHCT             | Bin 0 -> 314 bytes
> >  tests/data/acpi/virt/riscv64/SPCR             | Bin 0 -> 80 bytes
> >  .../bios-tables-test.riscv64.iso.qcow2        | Bin 0 -> 16896 bytes
> >  tests/qtest/bios-tables-test.c                |  93 ++++++++++++++----
> >  tests/qtest/meson.build                       |   3 +
> >  tests/uefi-test-tools/Makefile                |  19 ++--
> >  .../UefiTestToolsPkg/UefiTestToolsPkg.dsc     |   6 +-
> >  tests/uefi-test-tools/uefi-test-build.config  |  52 ++++++++++
> >  40 files changed, 147 insertions(+), 35 deletions(-)
> >  rename tests/data/acpi/virt/{ => aarch64}/APIC (100%)
> >  rename tests/data/acpi/virt/{ => aarch64}/APIC.acpihmatvirt (100%)
> >  rename tests/data/acpi/virt/{ => aarch64}/APIC.topology (100%)
> >  rename tests/data/acpi/virt/{ => aarch64}/DBG2 (100%)
> >  rename tests/data/acpi/virt/{ => aarch64}/DSDT (100%)
> >  rename tests/data/acpi/virt/{ => aarch64}/DSDT.acpihmatvirt (100%)
> >  rename tests/data/acpi/virt/{ => aarch64}/DSDT.memhp (100%)
> >  rename tests/data/acpi/virt/{ => aarch64}/DSDT.pxb (100%)
> >  rename tests/data/acpi/virt/{ => aarch64}/DSDT.topology (100%)
> >  rename tests/data/acpi/virt/{ => aarch64}/FACP (100%)
> >  rename tests/data/acpi/virt/{ => aarch64}/GTDT (100%)
> >  rename tests/data/acpi/virt/{ => aarch64}/HMAT.acpihmatvirt (100%)
> >  rename tests/data/acpi/virt/{ => aarch64}/IORT (100%)
> >  rename tests/data/acpi/virt/{ => aarch64}/MCFG (100%)
> >  rename tests/data/acpi/virt/{ => aarch64}/NFIT.memhp (100%)
> >  rename tests/data/acpi/virt/{ => aarch64}/PPTT (100%)
> >  rename tests/data/acpi/virt/{ => aarch64}/PPTT.acpihmatvirt (100%)
> >  rename tests/data/acpi/virt/{ => aarch64}/PPTT.topology (100%)
> >  rename tests/data/acpi/virt/{ => aarch64}/SLIT.memhp (100%)
> >  rename tests/data/acpi/virt/{ => aarch64}/SPCR (100%)
> >  rename tests/data/acpi/virt/{ => aarch64}/SRAT.acpihmatvirt (100%)
> >  rename tests/data/acpi/virt/{ => aarch64}/SRAT.memhp (100%)
> >  rename tests/data/acpi/virt/{ => aarch64}/SRAT.numamem (100%)
> >  rename tests/data/acpi/virt/{ => aarch64}/SSDT.memhp (100%)
> >  rename tests/data/acpi/virt/{ => aarch64}/VIOT (100%)
> >  create mode 100644 tests/data/acpi/virt/riscv64/APIC
> >  create mode 100644 tests/data/acpi/virt/riscv64/DSDT
> >  create mode 100644 tests/data/acpi/virt/riscv64/FACP
> >  create mode 100644 tests/data/acpi/virt/riscv64/MCFG
> >  create mode 100644 tests/data/acpi/virt/riscv64/RHCT
> >  create mode 100644 tests/data/acpi/virt/riscv64/SPCR
> >  create mode 100644 tests/data/uefi-boot-images/bios-tables-test.riscv64.iso.qcow2
> >  create mode 100644 tests/uefi-test-tools/uefi-test-build.config
> >
> > --
> > 2.40.1
> >

