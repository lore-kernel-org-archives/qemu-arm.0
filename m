Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp2209118njb;
        Sun, 11 May 2025 06:45:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXFtW58WBgfTuza4jmvjz80fQdfasOz3HqwYOY7aUiol/+kYN84alRXspQEVkk2F0y+TZx5cRLHIXphVA==@linaro.org
X-Google-Smtp-Source: AGHT+IGsPmWGQ3PHvjb31feUbl+7cnG/BZhssveX/zE4VHAShweckU1u9hqUD4mVnqQQPB3085s2
X-Received: by 2002:a05:620a:17a2:b0:7ca:f65c:2032 with SMTP id af79cd13be357-7cd010f3f63mr1524580185a.5.1746971125651;
        Sun, 11 May 2025 06:45:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746971125; cv=none;
        d=google.com; s=arc-20240605;
        b=aBkkrVo6PVdiisp4wXgODT0RcDZfP61CgB2A1tBDIfVZVS9+HwWd5YEfpk0mWv6P84
         JhbIAKLQ0qo6MbVlz10DpOg58oRowNDARcm6kg15OTwduTY2nMHlQPxOq0A+aktvpB+e
         5MZKwHc8MMhIX8b12lk5Bbx+zvWKIMz934WU5f43v6V7zqbqobqlgApY7fZYIel6trC0
         npU8sgagQDsdH7plG6hCHJq6UOh3N5j9qEtlXSP0saKXDlNgh1zZ0FQSQSpWYWmF+TWI
         8vNya7dyNNC5W0SWEjrgDuDtSI8jDd9hMrupECjsTkIZN7i8aPqr7jTgRGXKqDtcfLHc
         YoGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=c7dbJlbXPbkcfssQF7d4dE0piRNaAUADT6wmNuA7lGM=;
        fh=A/hE+JVeyFiPa7zuzmXz93n7hDZpOvFOgXRDZJUwsEs=;
        b=O/Y8rb0+WLUrAs0Qa1Ie6rOVaDawzH6RvdfbkgPZc/yIgqkNqf7uBqKNQv2NgdVyzV
         464AwGjb0XW4BpO/58HskixhXmeQzu92IuVMQWgKE1hm3+CodC8Rm/5jEirY+Pk5YHzu
         jIwr/5c+5qt5ncJbo0G7dUplG26uJ6ANmnwniytxT2T2Mq8WQYRxjzyoA7nhFTs3pI1F
         NGDU1AvQ1BqLLwWMQp4Ff57R94jvYormOOH7RTdmlK23BgyaBRK5EgfP5drtKl3iRKi9
         V9HP/6n1Cgr4u0OchMUrFrGZKOQ4ezkTop2pwOJbLAAmMbVtFcVd2O5imt4teG+2NT9Q
         89YQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=csGpQir+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00fe3fcesi658537585a.415.2025.05.11.06.45.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 May 2025 06:45:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=csGpQir+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uE6zV-0002XH-PM; Sun, 11 May 2025 09:45:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1uE6zP-0002SB-1L
 for qemu-arm@nongnu.org; Sun, 11 May 2025 09:45:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1uE6zM-0002nk-VI
 for qemu-arm@nongnu.org; Sun, 11 May 2025 09:45:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746971108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c7dbJlbXPbkcfssQF7d4dE0piRNaAUADT6wmNuA7lGM=;
 b=csGpQir+S9WKdto3I87N8qlQ8oh/4ewKBQmj2TTv3cIWIxL1ajeuVNxO4dIFAyH0M1F/+y
 ABaj3eAI5GBfBZP+UXlhVCgsIBO+siTDmVkmiWBL/sXBmnd0c1KqO/MTkRDPPHWoKUbIW5
 l3ST8D91zGgEGHbjkCDufZ6jdFNP/yc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-DUoEgevdMtiFrwxy8nxLwg-1; Sun, 11 May 2025 09:45:06 -0400
X-MC-Unique: DUoEgevdMtiFrwxy8nxLwg-1
X-Mimecast-MFC-AGG-ID: DUoEgevdMtiFrwxy8nxLwg_1746971105
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-442cd12d151so22210505e9.1
 for <qemu-arm@nongnu.org>; Sun, 11 May 2025 06:45:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746971105; x=1747575905;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c7dbJlbXPbkcfssQF7d4dE0piRNaAUADT6wmNuA7lGM=;
 b=kiXxrhhacEICBlIxnsgl1VQ+t1un4Rfi6V1Q1UHjB4mqptDriSZPPl3oEO2WgeRWzv
 HoeBBo0ItJsMgT6zrpG9oycJXQETRrziXqJgX0S9UijHq/oOvoQUtQXpqKG3j089hMNq
 F6JcRNlbh62T0PeYDHwJUZLmxZkY/Qw7Cn5FcmX3IMNbKN3OibeLM/yYMoNKdfyH1Ivo
 F0vOTl0EYWyKM7GL8/cpl0W5Bdp4KtWJ3/lyvlbK4YJtY2SIM1fJ1t8hVUujrZ9xz2Yy
 rp45i5VE0Gm8jBiFbvfHknMi+1L4BeHSGbKS6aqKydHwhVdoI20M+WsRcovaWxdPJjIo
 LIgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCViZlLTdZdgMxS4H05TfEsgeyfLRrhUN0895PojDwuKTqYHURnczwcWA854g6l29RJuaiL+Wewq7g==@nongnu.org
X-Gm-Message-State: AOJu0YxfFwND4G68WQe4Id4IoU/Cb7jn9vBR9onThtlC3I1an/qWMQ2m
 dFL6gaQXhIlYSsX7yz/UTCrx+UrMgco7TYn8q52tyQywJJTId+vLrGrjZsEm+3OTqU93u9q98Xo
 3raoyD7OQzsmRrNSNeVtacJNng2zYAKRQpaUXfZ0iC3fT0ZzroQ==
X-Gm-Gg: ASbGncuhRNtFnosY2a6eLNk12GFKY4Co12PmHiUZVNyDwwwNtkzAmb6hbDP+ALzWetL
 Jok0AZEBM2sWqtSEW+Fo8ApN7GGryvQQaCsMMcR5aJp3tTRIsetBlerhRTAjFV9YWmN64YxjKyl
 FdH40/WT2/Ca0qNITVGiCtOjzC87WVi2MZkU4ffScvi5wYAJN1T9Sd92oUxBz5Dx1HREBfs2Ms3
 gkAhXjh+Sku/V3/WGyg+gACL8LFLm5LYKGvOhn7Sd0rszZJk7H0NvHmFDMxXjo0RHZ/UMg6i+LX
 RFhu/A==
X-Received: by 2002:a05:600c:6612:b0:442:e147:bea6 with SMTP id
 5b1f17b1804b1-442e17571f9mr29608905e9.11.1746971105144; 
 Sun, 11 May 2025 06:45:05 -0700 (PDT)
X-Received: by 2002:a05:600c:6612:b0:442:e147:bea6 with SMTP id
 5b1f17b1804b1-442e17571f9mr29608585e9.11.1746971104721; 
 Sun, 11 May 2025 06:45:04 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442e3166b1csm32064655e9.0.2025.05.11.06.45.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 May 2025 06:45:03 -0700 (PDT)
Date: Sun, 11 May 2025 09:44:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Igor Mammedov <imammedo@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Gavin Shan <gshan@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 00/20] Change ghes to use HEST-based offsets and add
 support for error inject
Message-ID: <20250511094343-mutt-send-email-mst@kernel.org>
References: <cover.1741374594.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
In-Reply-To: <cover.1741374594.git.mchehab+huawei@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WIuCEZ5MD2u8mX0VgCcEd6NSwpvdLBuJ7T-AUgSpCAk_1746971105
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.587,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 8tOQf5iy+FSQ

On Fri, Mar 07, 2025 at 08:14:29PM +0100, Mauro Carvalho Chehab wrote:
> Hi Michael,
> 
> I'm sending v8 to avoid a merge conflict with v7 due to this
> changeset:
> 
>    611f3bdb20f7 ("hw/acpi/ghes: Make  static")



Applied 1-13.
Patch 14 needs to apply compat to 10.0 machine type as well.


> As ghes_record_cper_errors() was written since the beginning
> to be public and used by ghes-cper.c. It ended being meged
> earlier because the error-injection series become too big,
> so it was decided last year to split in two to make easier for
> reviewers and maintainers to discuss.
> 
> Anyway, as mentioned on v7, I guess we're ready to merge this
> series, as patches here have been thoughfully reviewed mainly 
> by Igor and Jonathan over the last 5-6 months.
> 
> The only change from v7 is a minor editorial change at HEST doc
> spec, and the addition of Igor and Jonathan's A-B/R-B.
> 
> This series change the way HEST table offsets are calculated,
> making them identical to what an OSPM would do and allowing
> multiple HEST entries without causing migration issues. It open
> space to add HEST support for non-arm architectures, as now
> the number and type of HEST notification entries are not
> hardcoded at ghes.c. Instead, they're passed as a parameter
> from the arch-dependent init code.
> 
> With such issue addressed, it adds a new notification type and
> add support to inject errors via a Python script. The script
> itself is at the final patch.
> 
> ---
> v8:
>   - added a patch to revert recently-added changeset causing a
>     conflict with these. All remaining patches are identical.
> 
> v7:
>   - minor editorial change at the patch updating HEST doc spec
>    with the new workflow
> 
> v6:
> - some minor nits addressed:
>    - use GPA instead of offset;
>    - merged two patches;
>    - fixed a couple of long line coding style issues;
>    - the HEST/DSDT diff inside a patch was changed to avoid troubles
>      applying it.
> 
> v5:
> - make checkpatch happier;
> - HEST table is now tested;
> - some changes at HEST spec documentation to align with code changes;
> - extra care was taken with regards to git bisectability.
> 
> v4:
> - added an extra comment for AcpiGhesState structure;
> - patches reordered;
> - no functional changes, just code shift between the patches in this series.
> 
> v3:
> - addressed more nits;
> - hest_add_le now points to the beginning of HEST table;
> - removed HEST from tests/data/acpi;
> - added an extra patch to not use fw_cfg with virt-10.0 for hw_error_le
> 
> v2: 
> - address some nits;
> - improved ags cleanup patch and removed ags.present field;
> - added some missing le*_to_cpu() calls;
> - update date at copyright for new files to 2024-2025;
> - qmp command changed to: inject-ghes-v2-error ans since updated to 10.0;
> - added HEST and DSDT tables after the changes to make check target happy.
>   (two patches: first one whitelisting such tables; second one removing from
>    whitelist and updating/adding such tables to tests/data/acpi)
> 
> Mauro Carvalho Chehab (20):
>   tests/acpi: virt: add an empty HEST file
>   tests/qtest/bios-tables-test: extend to also check HEST table
>   tests/acpi: virt: update HEST file with its current data
>   Revert "hw/acpi/ghes: Make ghes_record_cper_errors() static"
>   acpi/ghes: Cleanup the code which gets ghes ged state
>   acpi/ghes: prepare to change the way HEST offsets are calculated
>   acpi/ghes: add a firmware file with HEST address
>   acpi/ghes: Use HEST table offsets when preparing GHES records
>   acpi/ghes: don't hard-code the number of sources for HEST table
>   acpi/ghes: add a notifier to notify when error data is ready
>   acpi/generic_event_device: Update GHES migration to cover hest addr
>   acpi/generic_event_device: add logic to detect if HEST addr is
>     available
>   acpi/generic_event_device: add an APEI error device
>   tests/acpi: virt: allow acpi table changes at DSDT and HEST tables
>   arm/virt: Wire up a GED error device for ACPI / GHES
>   qapi/acpi-hest: add an interface to do generic CPER error injection
>   acpi/generic_event_device.c: enable use_hest_addr for QEMU 10.x
>   tests/acpi: virt: update HEST and DSDT tables
>   docs: hest: add new "etc/acpi_table_hest_addr" and update workflow
>   scripts/ghes_inject: add a script to generate GHES error inject
> 
>  MAINTAINERS                                   |  10 +
>  docs/specs/acpi_hest_ghes.rst                 |  28 +-
>  hw/acpi/Kconfig                               |   5 +
>  hw/acpi/aml-build.c                           |  10 +
>  hw/acpi/generic_event_device.c                |  44 ++
>  hw/acpi/ghes-stub.c                           |   7 +-
>  hw/acpi/ghes.c                                | 233 ++++--
>  hw/acpi/ghes_cper.c                           |  38 +
>  hw/acpi/ghes_cper_stub.c                      |  19 +
>  hw/acpi/meson.build                           |   2 +
>  hw/arm/virt-acpi-build.c                      |  35 +-
>  hw/arm/virt.c                                 |  19 +-
>  hw/core/machine.c                             |   2 +
>  include/hw/acpi/acpi_dev_interface.h          |   1 +
>  include/hw/acpi/aml-build.h                   |   2 +
>  include/hw/acpi/generic_event_device.h        |   1 +
>  include/hw/acpi/ghes.h                        |  51 +-
>  include/hw/arm/virt.h                         |   2 +
>  qapi/acpi-hest.json                           |  35 +
>  qapi/meson.build                              |   1 +
>  qapi/qapi-schema.json                         |   1 +
>  scripts/arm_processor_error.py                | 476 ++++++++++++
>  scripts/ghes_inject.py                        |  51 ++
>  scripts/qmp_helper.py                         | 703 ++++++++++++++++++
>  target/arm/kvm.c                              |   7 +-
>  tests/data/acpi/aarch64/virt/DSDT             | Bin 5196 -> 5240 bytes
>  .../data/acpi/aarch64/virt/DSDT.acpihmatvirt  | Bin 5282 -> 5326 bytes
>  tests/data/acpi/aarch64/virt/DSDT.memhp       | Bin 6557 -> 6601 bytes
>  tests/data/acpi/aarch64/virt/DSDT.pxb         | Bin 7679 -> 7723 bytes
>  tests/data/acpi/aarch64/virt/DSDT.topology    | Bin 5398 -> 5442 bytes
>  tests/data/acpi/aarch64/virt/HEST             | Bin 0 -> 224 bytes
>  tests/qtest/bios-tables-test.c                |   2 +-
>  32 files changed, 1695 insertions(+), 90 deletions(-)
>  create mode 100644 hw/acpi/ghes_cper.c
>  create mode 100644 hw/acpi/ghes_cper_stub.c
>  create mode 100644 qapi/acpi-hest.json
>  create mode 100644 scripts/arm_processor_error.py
>  create mode 100755 scripts/ghes_inject.py
>  create mode 100755 scripts/qmp_helper.py
>  create mode 100644 tests/data/acpi/aarch64/virt/HEST
> 
> -- 
> 2.48.1
> 

