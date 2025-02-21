Received: by 2002:a17:504:5c6a:b0:1be9:327d:8ee3 with SMTP id dm10csp327407njc;
        Fri, 21 Feb 2025 06:35:53 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVziCEJlrW6r2CO0xhdsmhDshUhvjxbKESrxiU/+tp6MitkEPqi+C/wwaZPNI2mBv15kGkmYmKKanr4ZA==@linaro.org
X-Google-Smtp-Source: AGHT+IFdXELF+Ca+a4GQSj0O615ZJJ/KVP9IsQj5c8BhbMvuJihHi/hXhOfcRatkZBFCKpoFqFbc
X-Received: by 2002:a05:6214:1c44:b0:6e4:407c:fcfc with SMTP id 6a1803df08f44-6e6ae7c9a17mr41108616d6.4.1740148553190;
        Fri, 21 Feb 2025 06:35:53 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1740148553; cv=pass;
        d=google.com; s=arc-20240605;
        b=N4Jrz60u/TQrEmM2Plyjwp8EcdFiHsQft5RF27vtt5XpqYLSrrKK1h3U0aEqthXntO
         tSlIrkNbJumbEknZ5z2hhEGVE0W6qCylcF4hnDsVPAieqCOkO/3JtuNVEt336vlf6ji7
         N6gnRrmQk9wqaS4RoX4XyAUw4VuIFNWU6LHT90doB+kjGMFeSxWCuMfF832Nx8MN4r9A
         +Zgj2vd8vfOYc82+hFRwrBM7alREBOfI5jMf8e8mqpyyasPNv4aBZBCJGgQod5Zr1UwU
         JOTOwHY3o1MCuC9JINrbiUK5VDVmWV2FfSLGebM1GygHs9m3lPC0Ohr6NKW5TRYzQ7Vv
         WqfQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LkAVB8MHFTM7gvY+7YuLTL6uToqFID3vVghIkABWkNE=;
        fh=ZeRsg7LVNHipwLYcf/ylf6e1Tih4dwIknyunIliQVLA=;
        b=GsStlttPaNiGi7YCWJ4PktkztwtSnm015SZgy0ZwuwEDOytjQeEjE2HrRmHeb0tYCL
         pUXkav4soLIp9igNxFnuFTui8LpAhfBEZp/ZBYEiOuWgOoNfp8+5fg/2VF7LOPmuVpWt
         W39i6V2fIxHmUVckXiyBVwCQu03xbeS0hvdbfvAqAhEameHvXAA6EkOnY6xUoiT1oU8k
         9SuoGplgDOy9A7eU7MfMnxqL2lSrHEyJwnc1DgxQ158808Q5RJxWeaV7SxtNtHoNJm0n
         yK5YHsEKmgbO+k57LBPD1op8A7CTAzFcN43ezMjXpwz3Gto/VYThb/XD30yheJj2/4PG
         YT9g==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=lLUmSsz6;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of kvm+bounces-38854-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-38854-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <kvm+bounces-38854-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d7428afsi163393986d6.138.2025.02.21.06.35.53
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 06:35:53 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-38854-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=lLUmSsz6;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of kvm+bounces-38854-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-38854-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 798D8174253
	for <alex.bennee@linaro.org>; Fri, 21 Feb 2025 14:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7765210F69;
	Fri, 21 Feb 2025 14:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lLUmSsz6"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730A1210190;
	Fri, 21 Feb 2025 14:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740148536; cv=none; b=NoeZk9nWOWzH10PSH3g5zCTtSGI5ZfGQ/8OpKO0X7yWAF8xVu34E7bP8yxiPZijST5lF5TmS+nhihHH3h5IufOlRTw5PMVeS3AEMpG8HJ6/xme0eDEFhEhE+QRNacZwIchUD8G5TKxlAZVy4kC+rKTk7vXKx9fAi5ha197tJqKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740148536; c=relaxed/simple;
	bh=Q6dZ++LozCZLkvy493r630Q1foQTfxpcmtP1TK0Drag=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jfHuD9w0bTKkuO64vQ178hHvPcHa9W9bPdC0Vpf3bOoB/bAHgE11qlVpIbSj//woQfj+RSWuTQ+9XfLhtbicI9UGXPHFrTjUR8+68MHp4Ram6t2KpwzfrvpyGAHIN+9D+oBVdI1CjF/s/6kLcjZ7IiUBXZXiX5KbO8XCxvXPw2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lLUmSsz6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95338C4CEEC;
	Fri, 21 Feb 2025 14:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740148535;
	bh=Q6dZ++LozCZLkvy493r630Q1foQTfxpcmtP1TK0Drag=;
	h=From:To:Cc:Subject:Date:From;
	b=lLUmSsz6RFtndH7y8uTJ5Ztd7Ztl2yJOetKKsYhn4spLIvgaW4R6ggZwsW+Vv4SXR
	 TJpgDJ8rHBFzzknwIaD7AJJsxFYfhrQhYlzBCuICyjoC7AXGHZIN6P2POm4Woe+Abw
	 xXFwcb/mfDCMpYcMAyCpVR+u9j1rcFoHeGYusetcb34Ll0BKN+BDF4LiCWyxoylHKy
	 pkh/bSu5SbgquqakhNGULl/UJ85+vW8QQOmNPswPo0OcLyTZyn9TcwDSKOrNuny2Uf
	 etaAeNl6jUTVRT7wHRGyz5YXdMpDURC1AGHhR9CZo/qrX+0NxKU2U6dCy2o1rCbI80
	 tzm1W6wgVs9+w==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tlU7m-00000002jDY-2Kca;
	Fri, 21 Feb 2025 15:35:30 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Ani Sinha <anisinha@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Eric Blake <eblake@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 00/14] Change ghes to use HEST-based offsets and add support for error inject
Date: Fri, 21 Feb 2025 15:35:09 +0100
Message-ID: <cover.1740148260.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: ZYxfE4ZwB7Dt

Now that the ghes preparation patches were merged, let's add support
for error injection.

On this series, the first 6 patches chang to the math used to calculate offsets at HEST
table and hardware_error firmware file, together with its migration code. Migration tested
with both latest QEMU released kernel and upstream, on both directions.

The next patches add a new QAPI to allow injecting GHESv2 errors, and a script using such QAPI
   to inject ARM Processor Error records.

---
v4:
- added an extra comment for AcpiGhesState structure;
- patches reordered;
- no functional changes, just code shift between the patches in this series.

v3:
- addressed more nits;
- hest_add_le now points to the beginning of HEST table;
- removed HEST from tests/data/acpi;
- added an extra patch to not use fw_cfg with virt-10.0 for hw_error_le

v2: 
- address some nits;
- improved ags cleanup patch and removed ags.present field;
- added some missing le*_to_cpu() calls;
- update date at copyright for new files to 2024-2025;
- qmp command changed to: inject-ghes-v2-error ans since updated to 10.0;
- added HEST and DSDT tables after the changes to make check target happy.
  (two patches: first one whitelisting such tables; second one removing from
   whitelist and updating/adding such tables to tests/data/acpi)



Mauro Carvalho Chehab (14):
  acpi/ghes: prepare to change the way HEST offsets are calculated
  acpi/ghes: add a firmware file with HEST address
  acpi/ghes: Use HEST table offsets when preparing GHES records
  acpi/ghes: don't hard-code the number of sources for HEST table
  acpi/ghes: add a notifier to notify when error data is ready
  acpi/ghes: create an ancillary acpi_ghes_get_state() function
  acpi/generic_event_device: Update GHES migration to cover hest addr
  acpi/generic_event_device: add logic to detect if HEST addr is
    available
  acpi/generic_event_device: add an APEI error device
  tests/acpi: virt: allow acpi table changes for a new table: HEST
  arm/virt: Wire up a GED error device for ACPI / GHES
  tests/acpi: virt: add a HEST table to aarch64 virt and update DSDT
  qapi/acpi-hest: add an interface to do generic CPER error injection
  scripts/ghes_inject: add a script to generate GHES error inject

 MAINTAINERS                                   |  10 +
 hw/acpi/Kconfig                               |   5 +
 hw/acpi/aml-build.c                           |  10 +
 hw/acpi/generic_event_device.c                |  43 ++
 hw/acpi/ghes-stub.c                           |   7 +-
 hw/acpi/ghes.c                                | 231 ++++--
 hw/acpi/ghes_cper.c                           |  38 +
 hw/acpi/ghes_cper_stub.c                      |  19 +
 hw/acpi/meson.build                           |   2 +
 hw/arm/virt-acpi-build.c                      |  37 +-
 hw/arm/virt.c                                 |  19 +-
 hw/core/machine.c                             |   2 +
 include/hw/acpi/acpi_dev_interface.h          |   1 +
 include/hw/acpi/aml-build.h                   |   2 +
 include/hw/acpi/generic_event_device.h        |   1 +
 include/hw/acpi/ghes.h                        |  54 +-
 include/hw/arm/virt.h                         |   2 +
 qapi/acpi-hest.json                           |  35 +
 qapi/meson.build                              |   1 +
 qapi/qapi-schema.json                         |   1 +
 scripts/arm_processor_error.py                | 476 ++++++++++++
 scripts/ghes_inject.py                        |  51 ++
 scripts/qmp_helper.py                         | 702 ++++++++++++++++++
 target/arm/kvm.c                              |   7 +-
 tests/data/acpi/aarch64/virt/DSDT             | Bin 5196 -> 5240 bytes
 .../data/acpi/aarch64/virt/DSDT.acpihmatvirt  | Bin 5282 -> 5326 bytes
 tests/data/acpi/aarch64/virt/DSDT.memhp       | Bin 6557 -> 6601 bytes
 tests/data/acpi/aarch64/virt/DSDT.pxb         | Bin 7679 -> 7723 bytes
 tests/data/acpi/aarch64/virt/DSDT.topology    | Bin 5398 -> 5442 bytes
 29 files changed, 1677 insertions(+), 79 deletions(-)
 create mode 100644 hw/acpi/ghes_cper.c
 create mode 100644 hw/acpi/ghes_cper_stub.c
 create mode 100644 qapi/acpi-hest.json
 create mode 100644 scripts/arm_processor_error.py
 create mode 100755 scripts/ghes_inject.py
 create mode 100755 scripts/qmp_helper.py

-- 
2.48.1


