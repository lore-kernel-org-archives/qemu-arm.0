Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC36FC83F17
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Jul 2025 08:45:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubbHF-0006pW-Eq; Tue, 15 Jul 2025 04:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ubbHD-0006oP-DH
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 04:44:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ubbHA-0006Ma-2D
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 04:44:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752569072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7cVufhyd4PN/0+SX2FJyj8l37Xc6CW1LkWYS697KNmg=;
 b=EJUekOMQjNx+2L9/fkzgmjl0aLp3QHXhIu0GGHuOFmOTDYhR2gG001bm81FaF/AFrTYqQR
 szSrSHqZZepohho/c5uZyf275uLeW+CNcVrK8Q55nKeYvYslH+shGGzHxfN2b7tLMvoccq
 sRNk8wgDRZu9NwuG3R7eLFeJiDEGmh8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-ZCGGckW-NBm21RW8_ShLDw-1; Tue, 15 Jul 2025 04:44:30 -0400
X-MC-Unique: ZCGGckW-NBm21RW8_ShLDw-1
X-Mimecast-MFC-AGG-ID: ZCGGckW-NBm21RW8_ShLDw_1752569069
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a4f65a705dso3404969f8f.2
 for <qemu-arm@nongnu.org>; Tue, 15 Jul 2025 01:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752569069; x=1753173869;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7cVufhyd4PN/0+SX2FJyj8l37Xc6CW1LkWYS697KNmg=;
 b=JV0rbdJJB84YFiOZfcUw043G7RHr2Z/lTRbQlLS+RMZBexeA37W12IuiCGij2jOcXd
 E1E4ZfQYX/ZmyIM3q9jr9w9o2W9aiQSIKWLKEHH0tijZ/R5juwH3NBusHtHcwRvJ2Eza
 A4m8CzFgScU1yWxVJ5ev7W+qz9AGIFu/PNrhCXUu0CuCCCPSGX95ap5FDitH63zBAFkf
 Wl9s+aBZcEvzCy+v3JTYEe6rSL3zYZYg3p4QzqFEv/sli4txekg5coB9BJWnn6RMrffC
 JX/MC+fu7toTpyDCACIZkIXrmqaibMQpX+FAvwllU91EcRkwjt2SzUcq2RwAUpLNLDpl
 R5zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoCO0KXvu4iielrKv1xLkDAuk32SDHeoAF5vEjY/pQ5b/Car+hxaUVlfe0ZNEi3lsJY8JtTynURQ==@nongnu.org
X-Gm-Message-State: AOJu0YwgiaghiVeQ5G1cNRzuQlV7L2LFtJSE90FBxecG0Of01eALF/35
 P/koPGt9K0lfYUPXE5OSTns/3pif1ufBm8kykNYWYOglzoPXLnvaGbjjNgqXguuYpgeEsatIZM/
 oSkJTwN/q/gQEg7pMQMpH3bIGrr/7ZW9SdS1YfQYLl3jVd0DmAMfUWLF+S4HQLA==
X-Gm-Gg: ASbGncsacPsPzQcKmc26ZwGPHAjs+7Qk+DiLCOO1fUnyKnr3odr+JLyH0QDi5Ltr2/r
 2SO3coUdR+UTpFozUH7waLxMJKnd7nk9SEn1LqDM3me1cDlD+u58gxTE/zEOV5cpf2C8ITyPLM8
 B+g9sZDqm/9M/x2Ot/hlq2StZMiityicomlLnLkwhIQ77I3JdUVMucp/AwUb5JPPlzketLfcx8i
 muJGo0SsuYe+dEhqWdjyaaJnGHkCg7csk9aH2p/r5yugIH7CW+ZN1isGb3vsTS7q1OhcW4Os5kZ
 8zR+lH33QwwoHbrGxXVoF307PtzSjw==
X-Received: by 2002:a05:6000:2c0d:b0:3a5:2e59:833a with SMTP id
 ffacd0b85a97d-3b5f2daced1mr12335519f8f.1.1752569068939; 
 Tue, 15 Jul 2025 01:44:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEV92tFcHC7TjIiqGFxt51ER+hgdrcD07PTs7EaW9GS3aAQbL9di006fkkv/omTocJ3wgmT6g==
X-Received: by 2002:a05:6000:2c0d:b0:3a5:2e59:833a with SMTP id
 ffacd0b85a97d-3b5f2daced1mr12335491f8f.1.1752569068369; 
 Tue, 15 Jul 2025 01:44:28 -0700 (PDT)
Received: from fedora ([85.93.96.130]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e26ff9sm14543390f8f.93.2025.07.15.01.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 01:44:27 -0700 (PDT)
Date: Tue, 15 Jul 2025 10:44:25 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S . Tsirkin" <mst@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, qemu-arm@nongnu.org
Subject: Re: [PATCH v10 (RESEND) 00/20] Change ghes to use HEST-based
 offsets and add support for error inject
Message-ID: <20250715104425.7a6835a6@fedora>
In-Reply-To: <cover.1749741085.git.mchehab+huawei@kernel.org>
References: <cover.1749741085.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rm3gfFpir5LmlFjZtofmGIo83MeOSU4Os9vfGOGHmTw_1752569069
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 12 Jun 2025 17:17:24 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Hi Michael,
> 
> This is v10 of the patch series, rebased to apply after release
> 10.0. The only difference against v9 is a minor confict resolution.

Michael,

it's been on the list for a while and there are another GHES
related patches in queue which depend on this series.

Can you pick it up?

> 
> I sent already the patch with conflicts, but, as you didn't pick,
> I'm assuming you're opting to see the entire series again, as it
> could make easier for you to use b4 or some other script you may
> use to pick patches. So, let me resend the entire series.
> 
> It is nearly identical to v9 which addressed 3 issues:
> 
> - backward compatibility logic moved to version 10.0;
> - fixed a compilation issue with target/arm/kvm.c (probably
>   caused by some rebase - funny enough, incremental 
>   compilation was fine here);
> - added two missing SPDX comments.
> 
> As ghes_record_cper_errors() was written since the beginning
> to be public and used by ghes-cper.c. It ended being meged
> earlier because the error-injection series become too big,
> so it was decided last year to split in two to make easier for
> reviewers and maintainers to discuss.
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
> 
> v10:
> - rebased on the top of current upstream:
>   d9ce74873a6a ("Merge tag 'pull-vfio-20250611' of https://github.com/legoater/qemu into staging")
> - solved a minor conflict
> 
> v9:
> - backward compatibility logic moved to version 10.0;
> - fixed a compilation issue with target/arm/kvm.c (probably
>   caused by some rebase - funny enough, incremental 
>   compilation was fine here);
> - added two missing SPDX comments.
> 
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
>  hw/acpi/ghes_cper.c                           |  39 +
>  hw/acpi/ghes_cper_stub.c                      |  20 +
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
>  32 files changed, 1697 insertions(+), 90 deletions(-)
>  create mode 100644 hw/acpi/ghes_cper.c
>  create mode 100644 hw/acpi/ghes_cper_stub.c
>  create mode 100644 qapi/acpi-hest.json
>  create mode 100644 scripts/arm_processor_error.py
>  create mode 100755 scripts/ghes_inject.py
>  create mode 100755 scripts/qmp_helper.py
>  create mode 100644 tests/data/acpi/aarch64/virt/HEST
> 


