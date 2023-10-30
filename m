Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1898437ejc;
        Mon, 30 Oct 2023 07:14:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTxvHA8kcbZmxkujeVFwcajUON4kkcUyBIIoG3zOXdGWiNGTFDJA3qOQ24Elj53w+TomRe
X-Received: by 2002:ac8:5a8b:0:b0:41e:2d63:ac5d with SMTP id c11-20020ac85a8b000000b0041e2d63ac5dmr11685672qtc.8.1698675267944;
        Mon, 30 Oct 2023 07:14:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698675267; cv=none;
        d=google.com; s=arc-20160816;
        b=l1eB2nQl/CD7/jIu2FpTRg19PkiyCNGH1ODSgM7AFC0Dc9B2GUe+3pW+IRPd2FI/od
         +af0r9rr1765MzXvg5+G919v3Vxk/8fU1OHEu02z0rl2Nus4H/Taldk5dRav3IEZ2aV+
         uauz5vNXsufF/I+VPtIWNqGwlOmoYWacG0cbHJxn9O+6ybcInImvyHEUOhkreahs+juK
         po9Dplj2p5vOIMHrzlqsmcY2oDHIW98o46QK86s62/KviBGVkNZ+PkNC5kRd8X4tqRcu
         2eWyKDZ8hy6e0+WvbzpvPtZCWKzZFZ95KxuuRwzJbe9c3l9T+2+QsI1SfE2ARayMz635
         JHdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=WpgIXu9F0YZoR6UhZGb6IiyYms/3VLhSFs02Fgz0SuM=;
        fh=Ql61013HQi6Jet/zFUTmiSZzv5rGArWzHM3k65vfwjg=;
        b=q85xULN7yYZVQGOUnMZP5zGCyagQyW5HlRPO5gAvwaT8jooAvGwbj27WquAEqqyR9c
         q17Fyyv4WBVPiodO8lVmKBGg+WfEmC72vNXA7LFkdwflbu7UZt/QmlQ2WIzqDq0UfHDn
         WsxctEioB2dk3VMSMjVNVQMgm+9JhpigC4SMsJvF4Z8gul689HMIjUrWwrr+Ypxk+AGj
         OIjZjNCpmUgS5elqxNP9Ix4aNJlki5fxD0YOKDHTa4wPsZ7x8IvuQsul3JnvzzIZPyIa
         IRdUcAbmP06s4AbFjj/wOVKuim/SDL6lXTzPfYlfLp/u3NVv7DXVC7Xr0wbJaDZsGDQV
         OxpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XRhYZFMh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a22-20020a05622a02d600b00417b80188eesi5665939qtx.518.2023.10.30.07.14.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 07:14:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XRhYZFMh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxT22-0001Yn-BK; Mon, 30 Oct 2023 10:14:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qxT20-0001WY-7M
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 10:14:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qxT1l-0004vi-Pu
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 10:14:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698675240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WpgIXu9F0YZoR6UhZGb6IiyYms/3VLhSFs02Fgz0SuM=;
 b=XRhYZFMhggczObnwmtp0hIlf/7hEdxz2Clum+O1JsSVquT8pTdwrmdASXYEQC2fUxEqFQl
 rUaPhB6zK2919Mt6lvdBtRreZTJ1pf7ECAfVb5Yvc2uDagVlJZoLmBRyMLElh1PJhj7pPa
 u7eGtxnx0KceuBkJy/xumZ/r2vQpaR0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-sVvzaBNEPZCsD4mA_Z2vmg-1; Mon, 30 Oct 2023 10:13:59 -0400
X-MC-Unique: sVvzaBNEPZCsD4mA_Z2vmg-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-32dc767e619so2384211f8f.1
 for <qemu-arm@nongnu.org>; Mon, 30 Oct 2023 07:13:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698675233; x=1699280033;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WpgIXu9F0YZoR6UhZGb6IiyYms/3VLhSFs02Fgz0SuM=;
 b=DYx1QpH62pCXMmb1WU5C1HZtxt5FsXR19zWQqA1o413DUMGJEAJXLPRR5/261Rdcds
 L/qXHmWQNKEIi2ZjVUiqMHHiZEfE59WK0Vs2R789AOSwGoNvTTtY1kjRuNcirl4BuCge
 ti/xEXkEYbNgGwF12H2UZIdup8QZH7XJ4Cz85XupCKDzDKs3IS7izbaIhcJ6UfpSP2ns
 PGPi1MbdtCXHQ1IdMkbusvEyeSWqXWMXk7a+akqqNfdDHBaiPILbvkZfs1CcTHx5+1rb
 BelWP3TBCnc2PQB497paUudcqH9N+BX3i1DkoHEDgtHQcHxZ/JLg8F4O77BsisL5Sgvn
 qbnA==
X-Gm-Message-State: AOJu0YzTeK6SSrHc31L4ExXGB7Ruiaehfv1LFGUHmtueEvHSSmTiF2GP
 TZjLT/o+7077DqTvDI3CzuSWSey0bFniVv+cCar+jfzpzqLG7dZpVznzIi2Rg4Hcuh8zpZ8eAEY
 N5GLkaPAO/HNq
X-Received: by 2002:a5d:48c8:0:b0:32d:aa62:a8c3 with SMTP id
 p8-20020a5d48c8000000b0032daa62a8c3mr6295978wrs.41.1698675233064; 
 Mon, 30 Oct 2023 07:13:53 -0700 (PDT)
X-Received: by 2002:a5d:48c8:0:b0:32d:aa62:a8c3 with SMTP id
 p8-20020a5d48c8000000b0032daa62a8c3mr6295942wrs.41.1698675232490; 
 Mon, 30 Oct 2023 07:13:52 -0700 (PDT)
Received: from redhat.com ([31.187.78.246]) by smtp.gmail.com with ESMTPSA id
 q12-20020adffecc000000b0032dc1fc84f2sm8443927wrs.46.2023.10.30.07.13.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 07:13:51 -0700 (PDT)
Date: Mon, 30 Oct 2023 10:13:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>
Subject: Re: [PATCH v5 00/13] RISC-V: ACPI: Enable AIA, PLIC and update RHCT
Message-ID: <20231030101332-mutt-send-email-mst@kernel.org>
References: <20231030132058.763556-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20231030132058.763556-1-sunilvl@ventanamicro.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.483,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Y1kS/sx57+2E

On Mon, Oct 30, 2023 at 06:50:45PM +0530, Sunil V L wrote:
> This series primarily enables external interrupt controllers (AIA and PLIC)
> in ACPI tables for RISC-V virt platform. It also updates RHCT with CMO and
> MMU related information.
> 
> Below ECRs for these changes are approved by ASWG and will be
> available in next ACPI spec release.


pci, acpi things look ok

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> 1) MADT (AIA) - https://drive.google.com/file/d/1oMGPyOD58JaPgMl1pKasT-VKsIKia7zR/view?usp=sharing
> 2) RHCT - https://drive.google.com/file/d/1sKbOa8m1UZw1JkquZYe3F1zQBN1xXsaf/view?usp=sharing
> 
> First two patches in this series are to migrate a couple of functions from
> ARM architecture to common code so that RISC-V doesn't need to duplicate
> the same.
> 
> The patch set is based on Alistair's riscv-to-apply.next branch.
> 
> These changes are also available in  riscv_acpi_b2_v5 branch at:
> https://github.com/vlsunil/qemu/
> 
> Changes since v4:
> 	1) Updated copyright for new files as per SPDX format suggested by Drew.
> 	2) Updated RINTC patch to avoid code duplication as suggested by Drew.
> 	3) Moved mmu offset below cmo in MMU patch as suggested by Drew.
> 	4) Updated tags.
> 
> Changes since v3:
> 	1) Addressed comments from Daniel and Drew.
> 	2) Added a new patch in microvm to use common function for virtio in DSDT.
> 	3) Rebased to latest riscv-to-apply.next branch and added tags.
> 
> Changes since v2:
>         1) Rebased to latest riscv-to-apply.next branch which needed
>            changing ext_icboz to ext_zicboz in CMO patch.
>         2) Fixed node type in MMU node.
>         3) Added latest tags.
> 
> Changes since v1:
>         1) As per Igor's suggestion, migrated fw_cfg and virtio creation
>            functions to device specific file instead of generic aml-build.c.
>            Since ACPI is optional, new files are created and enabled for
>            build only when CONFIG_ACPI is enabled.
>         2) As per Igor's suggestion, properties are added to the GPEX PCI
>            host to indicate MMIO ranges. The platform fw can initialize
>            these to appropriate values and the DSDT generator can fetch
>            the information from the host bus itself. This makes the code
>            generic instead of machine specific.
>         3) Added PLIC patch from Haibo.
>         4) Rebased to latest riscv-to-apply.next and added RB tags as
>            appropriate.
> 
> Sunil V L (13):
>   hw/arm/virt-acpi-build.c: Migrate fw_cfg creation to common location
>   hw/arm/virt-acpi-build.c: Migrate virtio creation to common location
>   hw/i386/acpi-microvm.c: Use common function to add virtio in DSDT
>   hw/riscv: virt: Make few IMSIC macros and functions public
>   hw/riscv/virt-acpi-build.c: Add AIA support in RINTC
>   hw/riscv/virt-acpi-build.c: Add IMSIC in the MADT
>   hw/riscv/virt-acpi-build.c: Add APLIC in the MADT
>   hw/riscv/virt-acpi-build.c: Add CMO information in RHCT
>   hw/riscv/virt-acpi-build.c: Add MMU node in RHCT
>   hw/pci-host/gpex: Define properties for MMIO ranges
>   hw/riscv/virt: Update GPEX MMIO related properties
>   hw/riscv/virt-acpi-build.c: Add IO controllers and devices
>   hw/riscv/virt-acpi-build.c: Add PLIC in MADT
> 
>  hw/arm/virt-acpi-build.c        |  51 +----
>  hw/i386/acpi-microvm.c          |  15 +-
>  hw/nvram/fw_cfg-acpi.c          |  23 +++
>  hw/nvram/meson.build            |   1 +
>  hw/pci-host/gpex-acpi.c         |  13 ++
>  hw/pci-host/gpex.c              |  12 ++
>  hw/riscv/Kconfig                |   1 +
>  hw/riscv/virt-acpi-build.c      | 323 +++++++++++++++++++++++++++++---
>  hw/riscv/virt.c                 |  72 ++++---
>  hw/virtio/meson.build           |   1 +
>  hw/virtio/virtio-acpi.c         |  32 ++++
>  include/hw/nvram/fw_cfg_acpi.h  |  15 ++
>  include/hw/pci-host/gpex.h      |  28 ++-
>  include/hw/riscv/virt.h         |  26 +++
>  include/hw/virtio/virtio-acpi.h |  16 ++
>  15 files changed, 498 insertions(+), 131 deletions(-)
>  create mode 100644 hw/nvram/fw_cfg-acpi.c
>  create mode 100644 hw/virtio/virtio-acpi.c
>  create mode 100644 include/hw/nvram/fw_cfg_acpi.h
>  create mode 100644 include/hw/virtio/virtio-acpi.h
> 
> -- 
> 2.39.2

