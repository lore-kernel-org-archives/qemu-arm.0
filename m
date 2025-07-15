Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5ECAC83F22
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Jul 2025 17:55:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubjsT-0003Ir-GA; Tue, 15 Jul 2025 13:55:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ubjLr-0000p9-Bn
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 13:21:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ubjLm-00076f-Md
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 13:21:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752600112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0E8G69YutzFiQ5hBMomNgMVZCHzO22bIfWgTWJhYJ8A=;
 b=VIhbf63o1GhrTlcWPqFWcmmZg3EctiN+0osnT1i3EDFhdI9AVNFNfBolXM5YyQ4r0bj5UC
 okh+glehbnDj2pSU2S5+0n+GqwYMXuVKtK+hJjzbtpfnh0CriSsztjmowXj/tPotVrOPZl
 ju2U08k7fe/Lh3YYg7RVBy6VZieJgPo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-OlvnzOQCOkWZjppQEvMO0A-1; Tue, 15 Jul 2025 13:21:50 -0400
X-MC-Unique: OlvnzOQCOkWZjppQEvMO0A-1
X-Mimecast-MFC-AGG-ID: OlvnzOQCOkWZjppQEvMO0A_1752600109
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a4f858bc5eso4361513f8f.0
 for <qemu-arm@nongnu.org>; Tue, 15 Jul 2025 10:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752600109; x=1753204909;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0E8G69YutzFiQ5hBMomNgMVZCHzO22bIfWgTWJhYJ8A=;
 b=u6bcaQWQk/dVDucN7GiziNcWT6N+X/WLCD4SMbr8MqK+vmz+jx9JVDQ47RcN2jjBxy
 LRChv6PDD5CS8kwjCGD/ZFiWfTrBxyDB94eg2/zLCWZA+NbcKkPz1TQE6cDbl8M9KY83
 qpw54wN3fCw5H5Yl8SWTd9Y/Qwk60G4NVGDCkleRGTf902TMXmdCIbPU1D1xvGJOR3Be
 KpGPEKkMKMLiIjv1FH+P1rwNMwY/bCkjIgBffXP1FWrwHT8YO0/fCVGt3vsZehZdPvtk
 IVOKDcK3CK1gF30UijvTXFhPWqGlQP2P6WZMNd2QeWrPSWgAoCVqrE2jd6XYyKmyMwmg
 Z2kA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTc5nAT5yxA3gyeeRNqx2lUEgynTJE0UCE+xq6SxjqV5zAtQrymqE79+LD8XpZ90EYMDVKfRhshQ==@nongnu.org
X-Gm-Message-State: AOJu0YxbNTEKw5qBF4b+xgyOufrJ3Bgo0ecnIVTZJJiJZB+wlRtmorph
 FEOSTuupRKpWgs/zXwpj7L9DqRXBHia10Hhz8YKQh4KlhfbUgG5BOx9h/CMdrCM/njpan0ddKY+
 rWfBLoqgRncri2uv1BPMfCMzb8r2xImPZpW5RYE2gykSpWsLu6lHC8A==
X-Gm-Gg: ASbGnctm9kQfQCdhuwR8WRnUJ1jK75nlj3CnUP1FrLfXkPJB+zdTNipt3FUbOE+6gdK
 kD1CJl5T34cnD86xJyqpYXOXOG65txLV9wXZpbrBHfi/5Z6jyIy02vnOx4zgyzYLhkINLVbfagU
 nMivpaKgDSGen1lvZzZfvG8MdGZUDiDyXyHWjTfg9RHjENfAAi8naJsDdyYz/38144d2KGS3fGD
 NbKoFavxif2KVR2noYdR6xrOdwljxz5WObSZGTntEXGUed7WeNNsOKWFenlpEy7THg5p/sEuaKh
 g3xvOpfOI1Wzz4SMztGUhdzKr/ZalmT9
X-Received: by 2002:a05:6000:250a:b0:3a5:8934:4940 with SMTP id
 ffacd0b85a97d-3b5f2e448c1mr12399384f8f.50.1752600109158; 
 Tue, 15 Jul 2025 10:21:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMV9s1B2MUSYk9qwlCsV54rZKg9zU5fIRrM5Pc8BDV/Wrw4/ZWHW+iM1hklMyfCh3Y0H5k7w==
X-Received: by 2002:a05:6000:250a:b0:3a5:8934:4940 with SMTP id
 ffacd0b85a97d-3b5f2e448c1mr12399366f8f.50.1752600108618; 
 Tue, 15 Jul 2025 10:21:48 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:150d:fc00:de3:4725:47c6:6809])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd18a2sm15477319f8f.20.2025.07.15.10.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 10:21:48 -0700 (PDT)
Date: Tue, 15 Jul 2025 13:21:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, qemu-arm@nongnu.org
Subject: Re: [PATCH v10 (RESEND) 00/20] Change ghes to use HEST-based offsets
 and add support for error inject
Message-ID: <20250715131649-mutt-send-email-mst@kernel.org>
References: <cover.1749741085.git.mchehab+huawei@kernel.org>
 <20250715104425.7a6835a6@fedora>
MIME-Version: 1.0
In-Reply-To: <20250715104425.7a6835a6@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Z8yvyuKx-H4UHhp7b5nn3_Qhqp7f4aBr2LSN7bs-9kM_1752600109
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Jul 15, 2025 at 10:44:25AM +0200, Igor Mammedov wrote:
> On Thu, 12 Jun 2025 17:17:24 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > Hi Michael,
> > 
> > This is v10 of the patch series, rebased to apply after release
> > 10.0. The only difference against v9 is a minor confict resolution.
> 
> Michael,
> 
> it's been on the list for a while and there are another GHES
> related patches in queue which depend on this series.
> 
> Can you pick it up?

I messed up, sorry. Tagged it as merged by mistake and now we are in
the soft freeze :(.

> > 
> > I sent already the patch with conflicts, but, as you didn't pick,
> > I'm assuming you're opting to see the entire series again, as it
> > could make easier for you to use b4 or some other script you may
> > use to pick patches. So, let me resend the entire series.
> > 
> > It is nearly identical to v9 which addressed 3 issues:
> > 
> > - backward compatibility logic moved to version 10.0;
> > - fixed a compilation issue with target/arm/kvm.c (probably
> >   caused by some rebase - funny enough, incremental 
> >   compilation was fine here);
> > - added two missing SPDX comments.
> > 
> > As ghes_record_cper_errors() was written since the beginning
> > to be public and used by ghes-cper.c. It ended being meged
> > earlier because the error-injection series become too big,
> > so it was decided last year to split in two to make easier for
> > reviewers and maintainers to discuss.
> > 
> > This series change the way HEST table offsets are calculated,
> > making them identical to what an OSPM would do and allowing
> > multiple HEST entries without causing migration issues. It open
> > space to add HEST support for non-arm architectures, as now
> > the number and type of HEST notification entries are not
> > hardcoded at ghes.c. Instead, they're passed as a parameter
> > from the arch-dependent init code.
> > 
> > With such issue addressed, it adds a new notification type and
> > add support to inject errors via a Python script. The script
> > itself is at the final patch.
> > 
> > ---
> > 
> > v10:
> > - rebased on the top of current upstream:
> >   d9ce74873a6a ("Merge tag 'pull-vfio-20250611' of https://github.com/legoater/qemu into staging")
> > - solved a minor conflict
> > 
> > v9:
> > - backward compatibility logic moved to version 10.0;
> > - fixed a compilation issue with target/arm/kvm.c (probably
> >   caused by some rebase - funny enough, incremental 
> >   compilation was fine here);
> > - added two missing SPDX comments.
> > 
> > v8:
> >   - added a patch to revert recently-added changeset causing a
> >     conflict with these. All remaining patches are identical.
> > 
> > v7:
> >   - minor editorial change at the patch updating HEST doc spec
> >    with the new workflow
> > 
> > v6:
> > - some minor nits addressed:
> >    - use GPA instead of offset;
> >    - merged two patches;
> >    - fixed a couple of long line coding style issues;
> >    - the HEST/DSDT diff inside a patch was changed to avoid troubles
> >      applying it.
> > 
> > v5:
> > - make checkpatch happier;
> > - HEST table is now tested;
> > - some changes at HEST spec documentation to align with code changes;
> > - extra care was taken with regards to git bisectability.
> > 
> > v4:
> > - added an extra comment for AcpiGhesState structure;
> > - patches reordered;
> > - no functional changes, just code shift between the patches in this series.
> > 
> > v3:
> > - addressed more nits;
> > - hest_add_le now points to the beginning of HEST table;
> > - removed HEST from tests/data/acpi;
> > - added an extra patch to not use fw_cfg with virt-10.0 for hw_error_le
> > 
> > v2:
> > - address some nits;
> > - improved ags cleanup patch and removed ags.present field;
> > - added some missing le*_to_cpu() calls;
> > - update date at copyright for new files to 2024-2025;
> > - qmp command changed to: inject-ghes-v2-error ans since updated to 10.0;
> > - added HEST and DSDT tables after the changes to make check target happy.
> >   (two patches: first one whitelisting such tables; second one removing from
> >    whitelist and updating/adding such tables to tests/data/acpi)
> > 
> > Mauro Carvalho Chehab (20):
> >   tests/acpi: virt: add an empty HEST file
> >   tests/qtest/bios-tables-test: extend to also check HEST table
> >   tests/acpi: virt: update HEST file with its current data
> >   Revert "hw/acpi/ghes: Make ghes_record_cper_errors() static"
> >   acpi/ghes: Cleanup the code which gets ghes ged state
> >   acpi/ghes: prepare to change the way HEST offsets are calculated
> >   acpi/ghes: add a firmware file with HEST address
> >   acpi/ghes: Use HEST table offsets when preparing GHES records
> >   acpi/ghes: don't hard-code the number of sources for HEST table
> >   acpi/ghes: add a notifier to notify when error data is ready
> >   acpi/generic_event_device: Update GHES migration to cover hest addr
> >   acpi/generic_event_device: add logic to detect if HEST addr is
> >     available
> >   acpi/generic_event_device: add an APEI error device
> >   tests/acpi: virt: allow acpi table changes at DSDT and HEST tables
> >   arm/virt: Wire up a GED error device for ACPI / GHES
> >   qapi/acpi-hest: add an interface to do generic CPER error injection
> >   acpi/generic_event_device.c: enable use_hest_addr for QEMU 10.x
> >   tests/acpi: virt: update HEST and DSDT tables
> >   docs: hest: add new "etc/acpi_table_hest_addr" and update workflow
> >   scripts/ghes_inject: add a script to generate GHES error inject
> > 
> >  MAINTAINERS                                   |  10 +
> >  docs/specs/acpi_hest_ghes.rst                 |  28 +-
> >  hw/acpi/Kconfig                               |   5 +
> >  hw/acpi/aml-build.c                           |  10 +
> >  hw/acpi/generic_event_device.c                |  44 ++
> >  hw/acpi/ghes-stub.c                           |   7 +-
> >  hw/acpi/ghes.c                                | 233 ++++--
> >  hw/acpi/ghes_cper.c                           |  39 +
> >  hw/acpi/ghes_cper_stub.c                      |  20 +
> >  hw/acpi/meson.build                           |   2 +
> >  hw/arm/virt-acpi-build.c                      |  35 +-
> >  hw/arm/virt.c                                 |  19 +-
> >  hw/core/machine.c                             |   2 +
> >  include/hw/acpi/acpi_dev_interface.h          |   1 +
> >  include/hw/acpi/aml-build.h                   |   2 +
> >  include/hw/acpi/generic_event_device.h        |   1 +
> >  include/hw/acpi/ghes.h                        |  51 +-
> >  include/hw/arm/virt.h                         |   2 +
> >  qapi/acpi-hest.json                           |  35 +
> >  qapi/meson.build                              |   1 +
> >  qapi/qapi-schema.json                         |   1 +
> >  scripts/arm_processor_error.py                | 476 ++++++++++++
> >  scripts/ghes_inject.py                        |  51 ++
> >  scripts/qmp_helper.py                         | 703 ++++++++++++++++++
> >  target/arm/kvm.c                              |   7 +-
> >  tests/data/acpi/aarch64/virt/DSDT             | Bin 5196 -> 5240 bytes
> >  .../data/acpi/aarch64/virt/DSDT.acpihmatvirt  | Bin 5282 -> 5326 bytes
> >  tests/data/acpi/aarch64/virt/DSDT.memhp       | Bin 6557 -> 6601 bytes
> >  tests/data/acpi/aarch64/virt/DSDT.pxb         | Bin 7679 -> 7723 bytes
> >  tests/data/acpi/aarch64/virt/DSDT.topology    | Bin 5398 -> 5442 bytes
> >  tests/data/acpi/aarch64/virt/HEST             | Bin 0 -> 224 bytes
> >  tests/qtest/bios-tables-test.c                |   2 +-
> >  32 files changed, 1697 insertions(+), 90 deletions(-)
> >  create mode 100644 hw/acpi/ghes_cper.c
> >  create mode 100644 hw/acpi/ghes_cper_stub.c
> >  create mode 100644 qapi/acpi-hest.json
> >  create mode 100644 scripts/arm_processor_error.py
> >  create mode 100755 scripts/ghes_inject.py
> >  create mode 100755 scripts/qmp_helper.py
> >  create mode 100644 tests/data/acpi/aarch64/virt/HEST
> > 


