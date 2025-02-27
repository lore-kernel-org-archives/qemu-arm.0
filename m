Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp140535njb;
        Thu, 27 Feb 2025 03:04:23 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWjLx1j2AQlWVBy8vJKL2QQmHprbOp4CohjK0MPvgRoEB9nWDOyYGKAZ6vLE0nKUS0tnix92fGTqu6REw==@linaro.org
X-Google-Smtp-Source: AGHT+IGqctNExGAa6AvYiRmZXRbrEkZ3ntu9xcyUMYj52FOAmeNukcbpnKQruvzgp3tOmALazS5S
X-Received: by 2002:a05:6214:1c44:b0:6d8:9872:adc1 with SMTP id 6a1803df08f44-6e886903f1dmr106197296d6.38.1740654263188;
        Thu, 27 Feb 2025 03:04:23 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1740654263; cv=pass;
        d=google.com; s=arc-20240605;
        b=kzPDgztOkpd4+ICixLdoMB7+pV7Bp3ELHQZtl2YQn4KnW9v1P0A9h3xnUmXfFh9Rkm
         VqUSr2cX2vq6YRjXBQOJCC7r+foZyZinHt13qyrjBdD4ok870Lht1zhINdqrHW/Gcakm
         RWPLrgRnA7bue6Jd3p1wC09RhNGbYBvO8ObjQKrsuOG9jFuEKOyojSPRwKVNG1Bv+6Ss
         1kZGrW9cjB+KvhPw//yD2nfbc4XDxlZfmiCyZJaz1q5wZDUqfOlza3q85D72vlDQUb/K
         V5zUnbYUktYWJBW272MzKlcNZz0FAyGBnKgU+tVCyG5ODe2KNl4dyUIbFcs80c3KLEwh
         XhFQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=f/O3ve0GFor94qlnxiYSrx/2HjGv7KDnwHJV+2R1rLw=;
        fh=ZeRsg7LVNHipwLYcf/ylf6e1Tih4dwIknyunIliQVLA=;
        b=EsAV/p91snh4oLVWXUzlWf/KOG/WoM3RCvXxFGY1whUXkDeDf3i9R90C4GFD+POBdt
         2lPU3mz51HJWoWHlEVOO/G+Mx8g/2vcc3450fCpEZTtN4EZTVHZjVJgAE2t6n7gNLclI
         WJfic1tPd10eq8IyF+ts8Tyd/AFv80EdR7kD1kfByT9pjeS1NsDDGLUY6V1ziIxUIhGM
         5ldd2qxYY/kjU9mxckFLwu1PlUFviz7L/uYMoKe3F9Z8e7zE2FYK0+nYtxaINLAXiKD8
         SH8fU7zJRVdlDvstV+gQ7ZMGXBTkeVieZagWuRy8Y+pnztZz7P79PlXZ094JJtDrsO6B
         M0IQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=bsxd4Mpu;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of kvm+bounces-39561-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-39561-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <kvm+bounces-39561-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8975e792dsi11157676d6.75.2025.02.27.03.04.23
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 03:04:23 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-39561-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=bsxd4Mpu;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of kvm+bounces-39561-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-39561-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1265D16AF29
	for <alex.bennee@linaro.org>; Thu, 27 Feb 2025 11:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C837C22B5B9;
	Thu, 27 Feb 2025 11:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bsxd4Mpu"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEB921324D;
	Thu, 27 Feb 2025 11:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740654238; cv=none; b=pnXbZlbrJiDZ4Djc8Jl5+CA4hcF6594y0TDg8+jYvonRek+UOKx7flcLTNFlgscx9viFU+1urT+ziTXD8JKIN4Y1v5YCkqHAgd+pCFNO5XdXO2621HgdswynF90LADFPPwIrhoLRpCK/u4ewDzoV4gz0hHoRnFODbP5t1ZlADJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740654238; c=relaxed/simple;
	bh=oN+y/NJZCBdygHU7yu4YFzn7ilHK4n88/7YjliN/sbU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RdMwpZjoz6ti6YkkFY7CNZcZDOq0ZyHr8bIJRjMKnZU/qsIaik0R1X5zwDaL7E1zjWxA+88K+Vn239IIfU/ZvTffJYWaqW1Ytw5VxE4sl7rVqpruZCMc/RXHcZZkrHKj7OGFbeQQI6a2HlOr8M2wIzjID5KqJTpFcwQppOt8Em8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bsxd4Mpu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED5E3C4CEEE;
	Thu, 27 Feb 2025 11:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740654238;
	bh=oN+y/NJZCBdygHU7yu4YFzn7ilHK4n88/7YjliN/sbU=;
	h=From:To:Cc:Subject:Date:From;
	b=bsxd4MpugxXY5vMy+dbiIOpauoY928bGuF/0UYgTNg9V3b/cv9y2elOfZcYMVG/5a
	 GP2mvQqI0BgKeaDSa+/jbedcwfReBQO+0QadhyMBVnMa06zCSWCFQvXtOK4Rc70vpl
	 6HGxHpAP3JmfNJC3g8woWsXmDPv2pYm/dDOAi5UO4od3RioHARhgEx1Nn1j5sY3NnR
	 Yxt7BS1alBvoDwd2naLzzLBuU7BQ2C3lfGtuA6jHQgUNXA/96s551zm4Gau5igfVRz
	 3ofC3/clBGM6AcyCo/DOuhsHCzjP1Xf+KaB5LvM6CSZstqrN+W7rEDaN/CRiCj/m2t
	 BUnl9nhUbE30g==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tnbgK-00000001mQX-00jM;
	Thu, 27 Feb 2025 12:03:56 +0100
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
Subject: [PATCH v5 00/21]Change ghes to use HEST-based offsets and add support for error inject
Date: Thu, 27 Feb 2025 12:03:30 +0100
Message-ID: <cover.1740653898.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: rL5bc/H40SDP

Now that the ghes preparation patches were merged, let's add support
for error injection.

On this version, HEST table got added to ACPI tables testing for aarch64 virt.

There are also some patch reorder to help reviewers to check the changes.

The code itself is almost identical to v4, with just a few minor nits addressed.

---
v5:
- make checkpatch happier;
- HEST table is now tested;
- some changes at HEST spec documentation to align with code changes;
- extra care was taken with regards to git bisectability.

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


Mauro Carvalho Chehab (21):
  tests/acpi: virt: add an empty HEST file
  tests/qtest/bios-tables-test: extend to also check HEST table
  tests/acpi: virt: update HEST file with its current data
  acpi/ghes: Cleanup the code which gets ghes ged state
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
  tests/acpi: virt: allow acpi table changes at DSDT and HEST tables
  arm/virt: Wire up a GED error device for ACPI / GHES
  qapi/acpi-hest: add an interface to do generic CPER error injection
  tests/acpi: virt: update HEST table to accept two sources
  tests/acpi: virt: and update DSDT table to add the new GED device
  docs: hest: add new "etc/acpi_table_hest_addr" and update workflow
  acpi/generic_event_device.c: enable use_hest_addr for QEMU 10.x
  scripts/ghes_inject: add a script to generate GHES error inject

 MAINTAINERS                                   |  10 +
 docs/specs/acpi_hest_ghes.rst                 |  28 +-
 hw/acpi/Kconfig                               |   5 +
 hw/acpi/aml-build.c                           |  10 +
 hw/acpi/generic_event_device.c                |  43 ++
 hw/acpi/ghes-stub.c                           |   7 +-
 hw/acpi/ghes.c                                | 231 ++++--
 hw/acpi/ghes_cper.c                           |  38 +
 hw/acpi/ghes_cper_stub.c                      |  19 +
 hw/acpi/meson.build                           |   2 +
 hw/arm/virt-acpi-build.c                      |  36 +-
 hw/arm/virt.c                                 |  19 +-
 hw/core/machine.c                             |   2 +
 include/hw/acpi/acpi_dev_interface.h          |   1 +
 include/hw/acpi/aml-build.h                   |   2 +
 include/hw/acpi/generic_event_device.h        |   1 +
 include/hw/acpi/ghes.h                        |  52 +-
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
 tests/data/acpi/aarch64/virt/HEST             | Bin 0 -> 224 bytes
 tests/qtest/bios-tables-test.c                |   2 +-
 32 files changed, 1692 insertions(+), 91 deletions(-)
 create mode 100644 hw/acpi/ghes_cper.c
 create mode 100644 hw/acpi/ghes_cper_stub.c
 create mode 100644 qapi/acpi-hest.json
 create mode 100644 scripts/arm_processor_error.py
 create mode 100755 scripts/ghes_inject.py
 create mode 100755 scripts/qmp_helper.py
 create mode 100644 tests/data/acpi/aarch64/virt/HEST

-- 
2.48.1


