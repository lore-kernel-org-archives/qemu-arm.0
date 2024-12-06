Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1013143njb;
        Fri, 6 Dec 2024 09:21:28 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXGLc8weKxtsyzwVGs8xyHsIoeBUHsj7RUpZbwgT8k+TZXHgOIhlFJFERBjk0CoGa9yZSKc6XzHs1Obsg==@linaro.org
X-Google-Smtp-Source: AGHT+IHyCRHiz0YXXUsSZZ0RXbGjc052WlKCmKIYVN8SyTeV4BV5AJtCpVw3/rbq2KlBAZ4Ce7z0
X-Received: by 2002:a05:6830:3890:b0:71d:4105:4053 with SMTP id 46e09a7af769-71dcf4bcc4emr2082236a34.5.1733505688075;
        Fri, 06 Dec 2024 09:21:28 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733505688; cv=pass;
        d=google.com; s=arc-20240605;
        b=lUXFPSoNchftgCvFLllF+o+u4dJIdYijlBh0Jc8oa2+qQxvf0GscPMExpypVRbiJ4b
         qWSSABNWq4ll4MEIZIEVS3eMaldlw6qpr8TwTGlQm9P3oG5ePh5+pHkyk1Md48R7wUsa
         ug6AmXWjkUdXsDwtrY0cj4j97wlhIkv2VROdelSCRL6BGststAtkIzy+YASvD2f00aDw
         ApvbLI7EEqydRoHsBOOJSYbHcNdRma1XfPo1DBAfQDUm8Kf7et7T5r54CJqRd9CHa4HK
         fDJSf4UiLfxCia0UVw4c3oiJfhsDCgQnK5ti1oUBwNZIEpTMBXr1TGhqZd6ASZ6dnxSn
         ksyw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gTU2Qx1vLldlaq1ZJitGrLmo+61qhTWQYyBNhHSALjo=;
        fh=uDTFNwg986jaThYQKiUcSwyffHCn62z0Zc/Hg+wt5yA=;
        b=fajwZWgmQt30IUSiFqqqYUK76OyqwxE8d+TIg5DWc3FUBslTzj04wNqW0I8Z7Mjrvt
         nCG99atyWKzG+QUsPAd0FSaohICHxkbjzPdom+PNzNoFWlVfIPH9A0NihwgSdSF2IOlm
         Z8w7kWHXFISUgI9RLWecVS51l1LuiF+/04cj8NTFJWcPhactKh654Wi1BJITust8mG8T
         fllaqrYdAkuGCKBp3OhUuXcOFG03kKTwpPEuyxEoW+s8KAgs0q4SwjiHy3dZqHByhd2R
         HglfPwerKkaUAPns1s8GO8ykSrsP0G06jPStTiaw+GfvcG+D+LguD2U6BzBSOxQT2Cmw
         4dyw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=hQgSqJE6;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of kvm+bounces-33223-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-33223-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <kvm+bounces-33223-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id 006d021491bc7-5f2792238c7si2014990eaf.32.2024.12.06.09.21.27
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 09:21:28 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-33223-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=hQgSqJE6;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of kvm+bounces-33223-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-33223-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95391287832
	for <alex.bennee@linaro.org>; Fri,  6 Dec 2024 17:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77981F4E21;
	Fri,  6 Dec 2024 17:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hQgSqJE6"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9175C1F3D51;
	Fri,  6 Dec 2024 17:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733505686; cv=none; b=Lbfs9FH+iOuFa2XZK2yJJ/cMescV/0DtZWXO4+GTxkgPfnL/YZtogw5YUesdy+R1GgKX8LClrzS5VCqyXVFDTbtrYr0WC9arCIUIE3YvEJAaINmOE95aBDaGO1mTFesEwlyfSXjeRYxqHtOBrklDIdr0stxMohJrbHRAEIZBOV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733505686; c=relaxed/simple;
	bh=KHSPLvcdOse9dRgvQF4pAyTeTPNTrvilvb49AHVAbw8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kj2S1PmFwJrAgYCQW6se2GajoY57KFq9Y/3+vtwRdOA6nxXMxStZtgjTqfigdrqUrY9drcjFVPk10uEsY0zFWqlAlr2PnJcjjsy5NakWCfJEy1x/13RYCVvWVGEHrpApiSqwfgHZCbfEJGbZldLUDHUHK0chKHcm+A+hwaJVMIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hQgSqJE6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08E2CC4CED1;
	Fri,  6 Dec 2024 17:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733505686;
	bh=KHSPLvcdOse9dRgvQF4pAyTeTPNTrvilvb49AHVAbw8=;
	h=From:To:Cc:Subject:Date:From;
	b=hQgSqJE6xXw6TYTxe/2yyLe/NdEtLzPyXoEBLqJuZWHrMlRZz5d8N4jpFkxhNrMqp
	 zh9cK8H1ciAADALMxmpCiCeQa3TQEpybeK8XWACJCL4/2cCLS840APgim33gzOcvV/
	 u2giMYogtNPUWUd8zRA7xG773+AkbHV9wAmpD3zOOlMc0OPaTyrRvz8dwW1LjeXHhw
	 hlRjahTwEwsaa7hM6ml44jmoXqixloVpnReG0hrvwGTYF4FB/mO5Wj6QuzRlJXFbrK
	 3gyDbxMhjTGZP3AvRYy6FnWFIyIibaVnGCP9SvIY/FwOg2ENl+ENU4S/nalPtn46/d
	 dMNCJ95CC6uug==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tJc15-00000005RJX-3lA0;
	Fri, 06 Dec 2024 18:21:23 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Ani Sinha <anisinha@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Eric Blake <eblake@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
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
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 00/31] Prepare GHES driver to support error injection
Date: Fri,  6 Dec 2024 18:12:22 +0100
Message-ID: <cover.1733504943.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: u5iYmXWECQy4

Hi Michael,

Could you please merge this series for ACPI stuff? All patches were already
reviewed by Igor. The changes against v4 are just on some patch descriptions,
plus the addition of Reviewed-by. No Code changes.

Thanks,
Mauro

-

During the development of a patch series meant to allow GHESv2 error injections,
it was requested a change on how CPER offsets are calculated, by adding a new
BIOS pointer and reworking the GHES logic. See:

https://lore.kernel.org/qemu-devel/cover.1726293808.git.mchehab+huawei@kernel.org/

Such change ended being a big patch, so several intermediate steps are needed,
together with several cleanups and renames.

As agreed duing v10 review, I'll be splitting the big patch series into separate pull 
requests, starting with the cleanup series. This is the first patch set, containing
only such preparation patches.

The next series will contain the shift to use offsets from the location of the
HEST table, together with a migration logic to make it compatible with 9.1.

---

v5:
- some changes at patches description and added some R-B;
- no changes at the code.

v4:
- merged a patch renaming the function which calculate offsets to:
  get_hw_error_offsets(), to avoid the need of such change at the next
  patch series;
- removed a functional change at the logic which makes
  the GHES record generation more generic;
- a couple of trivial changes on patch descriptions and line break cleanups.

v3:
- improved some patch descriptions;
- some patches got reordered to better reflect the changes;
- patch v2 08/15: acpi/ghes: Prepare to support multiple sources on ghes
  was split on two patches. The first one is in this cleanup series:
      acpi/ghes: Change ghes fill logic to work with only one source
  contains just the simplification logic. The actual preparation will
  be moved to this series:
     https://lore.kernel.org/qemu-devel/cover.1727782588.git.mchehab+huawei@kernel.org/

v2: 
- some indentation fixes;
- some description improvements;
- fixed a badly-solved merge conflict that ended renaming a parameter.

Mauro Carvalho Chehab (31):
  acpi/ghes: get rid of ACPI_HEST_SRC_ID_RESERVED
  acpi/ghes: simplify acpi_ghes_record_errors() code
  acpi/ghes: simplify the per-arch caller to build HEST table
  acpi/ghes: better handle source_id and notification
  acpi/ghes: Fix acpi_ghes_record_errors() argument
  acpi/ghes: Remove a duplicated out of bounds check
  acpi/ghes: Change the type for source_id
  acpi/ghes: don't check if physical_address is not zero
  acpi/ghes: make the GHES record generation more generic
  acpi/ghes: better name GHES memory error function
  acpi/ghes: don't crash QEMU if ghes GED is not found
  acpi/ghes: rename etc/hardware_error file macros
  acpi/ghes: better name the offset of the hardware error firmware
  acpi/ghes: Prepare to support multiple sources on ghes
  acpi/ghes: add a firmware file with HEST address
  acpi/ghes: Use HEST table offsets when preparing GHES records
  acpi/generic_event_device: Update GHES migration to cover hest addr
  acpi/generic_event_device: add logic to detect if HEST addr is
    available
  acpi/ghes: add a notifier to notify when error data is ready
  acpi/generic_event_device: add an APEI error device
  arm/virt: Wire up a GED error device for ACPI / GHES
  qapi/acpi-hest: add an interface to do generic CPER error injection
  scripts/ghes_inject: add a script to generate GHES error inject
  target/arm: add an experimental mpidr arm cpu property object
  scripts/arm_processor_error.py: retrieve mpidr if not filled
  acpi/ghes: move offset calculus to a separate function
  DEBUG
  acpi/ghes: Change ghes fill logic to work with only one source
  HACK: use GPIO as source ID for virt-9.1 machines
  docs: acpi_hest_ghes: fix documentation for CPER size
  FIXME: acpi/ghes: properly set data record size

 MAINTAINERS                            |  10 +
 docs/specs/acpi_hest_ghes.rst          |   6 +-
 hw/acpi/Kconfig                        |   5 +
 hw/acpi/aml-build.c                    |  10 +
 hw/acpi/generic_event_device.c         |  42 +-
 hw/acpi/ghes-stub.c                    |   2 +-
 hw/acpi/ghes.c                         | 391 ++++++++++----
 hw/acpi/ghes_cper.c                    |  32 ++
 hw/acpi/ghes_cper_stub.c               |  19 +
 hw/acpi/meson.build                    |   2 +
 hw/arm/virt-acpi-build.c               |  36 +-
 hw/arm/virt.c                          |  19 +-
 hw/core/machine.c                      |   2 +
 include/hw/acpi/acpi_dev_interface.h   |   1 +
 include/hw/acpi/aml-build.h            |   2 +
 include/hw/acpi/generic_event_device.h |   1 +
 include/hw/acpi/ghes.h                 |  39 +-
 include/hw/arm/virt.h                  |   2 +
 qapi/acpi-hest.json                    |  35 ++
 qapi/meson.build                       |   1 +
 qapi/qapi-schema.json                  |   1 +
 scripts/arm_processor_error.py         | 390 ++++++++++++++
 scripts/ghes_inject.py                 |  51 ++
 scripts/qmp_helper.py                  | 702 +++++++++++++++++++++++++
 target/arm/cpu.c                       |   1 +
 target/arm/cpu.h                       |   1 +
 target/arm/helper.c                    |  10 +-
 target/arm/kvm.c                       |   2 +-
 28 files changed, 1678 insertions(+), 137 deletions(-)
 create mode 100644 hw/acpi/ghes_cper.c
 create mode 100644 hw/acpi/ghes_cper_stub.c
 create mode 100644 qapi/acpi-hest.json
 create mode 100644 scripts/arm_processor_error.py
 create mode 100755 scripts/ghes_inject.py
 create mode 100644 scripts/qmp_helper.py

-- 
2.47.1


