Received: by 2002:a05:7022:4195:b0:8a:132c:44a7 with SMTP id i21csp213466dli;
        Fri, 13 Sep 2024 23:14:07 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXEEZFsG1lNG9Bx6xBKetybUI4FCyuqh/xuhYlI6MchdXkTtzbxRsDM9SHPf5hLS5vX6AVCHIuG7p8vRQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFN6k6aAzvw3S7aCDgHSCyLwwB1y4r34nzItt87pQX4ipIkDX/yHG74DOSc8VChYBOLlZ2c
X-Received: by 2002:a17:90a:560c:b0:2d1:c9c8:301c with SMTP id 98e67ed59e1d1-2dba00659d2mr10468929a91.29.1726294447058;
        Fri, 13 Sep 2024 23:14:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1726294447; cv=pass;
        d=google.com; s=arc-20240605;
        b=fVRGrZVSab68//3ZbzMYaIMjj7Heof52hr1LB1nnUob5n7NYVb4BMtGWojv/F9DyGp
         /pTr3jjuEL5gDgOWze8gXQ/uZwbT8dLLOHRKk6PvxjEkVjhMqSkltPqkAIefWinoDBZk
         OdTBZnizirWJjqy+Cch9/EUHKe5MFz7QFmWpX2jOcz0mEAh4X0r6/UuSKglgda/swEUK
         rzCMKImJkXsvQjXjWDaiV2IV9BuJkOyHq8hrK/DpWVL5VTmvuSmPkYrML/OJk+YfdmzS
         AmUUSnmgGIVgWgEHoBIfXYwIGtP4WBreB98SZGwRNgyB6GylTWG9gcQJR8sSfNQWAyFN
         e5kA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Wj1w+dQeuQdT7Id8V3Oidshjf7Tf2ic7UZB7zJKT6v4=;
        fh=i3ndtwgAt7d40Shct6y5IDfA4njX4JPzRyu5vW2UZis=;
        b=IolkkddA1LgBCsdgOS6O8phfBowv1Asd+HaSKXKNxGisXyMEPUfzI5Gi1KLQpgNXlY
         B13mxfH7PmMiK8FSv8Pfz0ZsMEBHs7EFiz5ZXCv2bwW3bJFW1yeCRAcuZwBDECC9kB8w
         CwJpDIJKPLH5Jx4ImJVdj+/oonDhDU3+vAlBnToKqEgbPabZYm7QApPXEcWo0sNr43aa
         79pRkv2MIXdQLuUOGCYbfOUDfjxipZ417XHUv2Gxv0o0Q6e7y54bAuqhCDe5pgFb+Cpl
         fkD95MUzYFWF/HwHBuH8dApgrduTGPkKSHDzpxVE/USqOf08ZWGtIGNxQ0SGv5LMrySh
         VW1g==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=oJ8JUqm2;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of kvm+bounces-26893-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-26893-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <kvm+bounces-26893-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [147.75.48.161])
        by mx.google.com with ESMTPS id d9443c01a7336-20794772690si10414225ad.574.2024.09.13.23.14.06
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 23:14:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-26893-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) client-ip=147.75.48.161;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=oJ8JUqm2;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of kvm+bounces-26893-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-26893-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE0C1B242EC
	for <alex.bennee@linaro.org>; Sat, 14 Sep 2024 06:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8D3C78C89;
	Sat, 14 Sep 2024 06:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oJ8JUqm2"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924AA4EB5E;
	Sat, 14 Sep 2024 06:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726294434; cv=none; b=CVyz+kdQ2gv86hY1hl5n8BVvk4Plg0NNvrxLQKN8Wa8ZjYZ9TS76JqjFylzs0uUckrMPefuO21seBMYaQkAwgqdWGUyzx4isV+yXSUKxrbyDD7VoQrbtodXX7ZSMWNXF/GXHged+vSLfRknKQy4CLyZPqazDKDAqKJ0TnPn8uhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726294434; c=relaxed/simple;
	bh=ho1GkjqYgfLb6Wn3WjhFkRZ3Tu0BWcXl5dAnnC3KX5E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SPllJdSwpOqMigM5IhIfR/Cz1yb6DwpccfdlPYwdY1vX6QD0N5rdn/P2b7FbHNI8pojlKYHd8OnYNFSedqYTxQhp76Q2//mMOWX4oX5QzTgSLennDl2rKuY/0SbUK6nMphyZvrOv7FDE7tlXhEgbXQkrUauqQNmEO3vdZBhoC/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oJ8JUqm2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED497C4CECE;
	Sat, 14 Sep 2024 06:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726294434;
	bh=ho1GkjqYgfLb6Wn3WjhFkRZ3Tu0BWcXl5dAnnC3KX5E=;
	h=From:To:Cc:Subject:Date:From;
	b=oJ8JUqm2e9/APSBpFes514sT+WBUSn8wATDRqYZtupcvGtQRPwxtjHJu7s4aHR09I
	 Djj+oBPux7/qMkb6ZxoJFYfFjNyE2vDChiJoZhSk46PyTlPfM+qYMUCKylrlqEoEQJ
	 U+6HYNGKwoy+qiGmu7JoX4iQgSstjvP+ihMWutgC0lpDrbR8pzvmk/QgeJrQcW2gMX
	 AMQvmcSOL6PUzzqQ2wjmhikRyNXkWgEp+X+fWq/4n8/gyoedBXLqxezyg1jmMMcYnh
	 nGZDPo6IEbwpeFXa1YssoXjtYUqqHCYTri0FVOoyc+trrUUSMi5SXJvp/QUazrOE73
	 XXnfX6Iua9CcQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1spM2Z-00000003V5Q-3uzV;
	Sat, 14 Sep 2024 08:13:51 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Eric Blake <eblake@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v10 00/21] Add ACPI CPER firmware first error injection on ARM emulation
Date: Sat, 14 Sep 2024 08:13:21 +0200
Message-ID: <cover.1726293808.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: yOiPjBW/tkUj

This series add support for injecting generic CPER records.  Such records
are generated outside QEMU via a provided script.

On this  version,  the patch reworking the way offsets are calculated were
split on several other patches, to make one logical change per patch and
make review easier.

Despite the number of patches increased from 12 to 21, there is just one
real new patch (as the other ones are a split from a big change):

  acpi/generic_event_device: Update GHES migration to cover hest addr

---

v10:
- Patch 1 split on several patches to make reviews easier;
- Added a migration patch;
- CPER QMP command was renamed;
- Updated some comments to better reflect exact ACPI version;
- Removed a code to reset acks when OSPM fails to read records;
- Removed a duplicated config GHES_CPER symbol;
- There is  now an arch-independent namespace for GHES source IDs;
- Fixed the size of hest_ghes_notify array when creating tables;
- acpi-hest.json is now a section of ACPI;
- QMP command renamed from @ghes-cper to inject-ghes-error.

v9:
- Patches reorganized to make easier for reviewers;
- source ID is now guest-OS specific;
- Some patches got a revision history since v8;
- Several minor cleanups.

v8:
- Fix one of the BIOS links that were incorrect;
- Changed mem error internal injection to use a common code;
- No more hardcoded values for CPER: instead of using just the
  payload at the QAPI, it now has the full raw CPER there;
- Error injection script now supports changing fields at the
  Generic Error Data section of the CPER;
- Several minor cleanups.

v7:
- Change the way offsets are calculated and used on HEST table.
  Now, it is compatible with migrations as all offsets are relative
  to the HEST table;
- GHES interface is now more generic: the entire CPER is sent via
  QMP, instead of just the payload;
- Some code cleanups to make the code more robust;
- The python script now uses QEMUMonitorProtocol class.

v6:
- PNP0C33 device creation moved to aml-build.c;
- acpi_ghes record functions now use ACPI notify parameter,
  instead of source ID;
- the number of source IDs is now automatically calculated;
- some code cleanups and function/var renames;
- some fixes and cleanups at the error injection script;
- ghes cper stub now produces an error if cper JSON is not compiled;
- Offset calculation logic for GHES was refactored;
- Updated documentation to reflect the GHES allocated size;
- Added a x-mpidr object for QOM usage;
- Added a patch making usage of x-mpidr field at ARM injection
  script;

v5:
- CPER guid is now passing as string;
- raw-data is now passed with base64 encode;
- Removed several GPIO left-overs from arm/virt.c changes;
- Lots of cleanups and improvements at the error injection script.
  It now better handles QMP dialog and doesn't print debug messages.
  Also, code was split on two modules, to make easier to add more
  error injection commands.

v4:
- CPER generation moved to happen outside QEMU;
- One patch adding support for mpidr query was removed.

v3:
- patch 1 cleanups with some comment changes and adding another place where
  the poweroff GPIO define should be used. No changes on other patches (except
  due to conflict resolution).

v2:
- added a new patch using a define for GPIO power pin;
- patch 2 changed to also use a define for generic error GPIO pin;
- a couple cleanups at patch 2 removing uneeded else clauses.

Example of generating a CPER record:

$ scripts/ghes_inject.py -d arm -p 0xdeadbeef
GUID: e19e3d16-bc11-11e4-9caa-c2051d5d46b0
Generic Error Status Block (20 bytes):
      00000000  01 00 00 00 00 00 00 00 00 00 00 00 90 00 00 00   ................
      00000010  00 00 00 00                                       ....

Generic Error Data Entry (72 bytes):
      00000000  16 3d 9e e1 11 bc e4 11 9c aa c2 05 1d 5d 46 b0   .=...........]F.
      00000010  00 00 00 00 00 03 00 00 48 00 00 00 00 00 00 00   ........H.......
      00000020  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00   ................
      00000030  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00   ................
      00000040  00 00 00 00 00 00 00 00                           ........

Payload (72 bytes):
      00000000  05 00 00 00 01 00 00 00 48 00 00 00 00 00 00 00   ........H.......
      00000010  00 00 00 80 00 00 00 00 10 05 0f 00 00 00 00 00   ................
      00000020  00 00 00 00 00 00 00 00 00 20 14 00 02 01 00 03   ......... ......
      00000030  0f 00 91 00 00 00 00 00 ef be ad de 00 00 00 00   ................
      00000040  ef be ad de 00 00 00 00                           ........

Error injected.

[    9.358364] {1}[Hardware Error]: Hardware error from APEI Generic Hardware Error Source: 1
[    9.359027] {1}[Hardware Error]: event severity: recoverable
[    9.359586] {1}[Hardware Error]:  Error 0, type: recoverable
[    9.360124] {1}[Hardware Error]:   section_type: ARM processor error
[    9.360561] {1}[Hardware Error]:   MIDR: 0x00000000000f0510
[    9.361160] {1}[Hardware Error]:   Multiprocessor Affinity Register (MPIDR): 0x0000000080000000
[    9.361643] {1}[Hardware Error]:   running state: 0x0
[    9.362142] {1}[Hardware Error]:   Power State Coordination Interface state: 0
[    9.362682] {1}[Hardware Error]:   Error info structure 0:
[    9.363030] {1}[Hardware Error]:   num errors: 2
[    9.363656] {1}[Hardware Error]:    error_type: 0x02: cache error
[    9.364163] {1}[Hardware Error]:    error_info: 0x000000000091000f
[    9.364834] {1}[Hardware Error]:     transaction type: Data Access
[    9.365599] {1}[Hardware Error]:     cache error, operation type: Data write
[    9.366441] {1}[Hardware Error]:     cache level: 2
[    9.367005] {1}[Hardware Error]:     processor context not corrupted
[    9.367753] {1}[Hardware Error]:    physical fault address: 0x00000000deadbeef
[    9.374267] Memory failure: 0xdeadb: recovery action for free buddy page: Recovered

Such script currently supports arm processor error CPER, but can easily be
extended to other GHES notification types.


Mauro Carvalho Chehab (21):
  acpi/ghes: add a firmware file with HEST address
  acpi/generic_event_device: Update GHES migration to cover hest addr
  acpi/ghes: get rid of ACPI_HEST_SRC_ID_RESERVED
  acpi/ghes: simplify acpi_ghes_record_errors() code
  acpi/ghes: better handle source_id and notification
  acpi/ghes: Remove a duplicated out of bounds check
  acpi/ghes: rework the logic to handle HEST source ID
  acpi/ghes: Change the type for source_id
  acpi/ghes: Don't hardcode the number of sources on ghes
  acpi/ghes: make the GHES record generation more generic
  acpi/ghes: don't crash QEMU if ghes GED is not found
  acpi/ghes: rename etc/hardware_error file macros
  acpi/ghes: better name GHES memory error function
  acpi/ghes: add a notifier to notify when error data is ready
  acpi/generic_event_device: add an APEI error device
  arm/virt: Wire up a GED error device for ACPI / GHES
  qapi/acpi-hest: add an interface to do generic CPER error injection
  docs: acpi_hest_ghes: fix documentation for CPER size
  scripts/ghes_inject: add a script to generate GHES error inject
  target/arm: add an experimental mpidr arm cpu property object
  scripts/arm_processor_error.py: retrieve mpidr if not filled

 MAINTAINERS                            |  10 +
 docs/specs/acpi_hest_ghes.rst          |   6 +-
 hw/acpi/Kconfig                        |   5 +
 hw/acpi/aml-build.c                    |  10 +
 hw/acpi/generic_event_device.c         |  19 +-
 hw/acpi/ghes-stub.c                    |   2 +-
 hw/acpi/ghes.c                         | 312 +++++++----
 hw/acpi/ghes_cper.c                    |  32 ++
 hw/acpi/ghes_cper_stub.c               |  19 +
 hw/acpi/meson.build                    |   2 +
 hw/arm/virt-acpi-build.c               |  12 +-
 hw/arm/virt.c                          |  19 +-
 include/hw/acpi/acpi_dev_interface.h   |   1 +
 include/hw/acpi/aml-build.h            |   2 +
 include/hw/acpi/generic_event_device.h |   1 +
 include/hw/acpi/ghes.h                 |  37 +-
 include/hw/arm/virt.h                  |   2 +
 qapi/acpi-hest.json                    |  35 ++
 qapi/meson.build                       |   1 +
 qapi/qapi-schema.json                  |   1 +
 scripts/arm_processor_error.py         | 388 ++++++++++++++
 scripts/ghes_inject.py                 |  51 ++
 scripts/qmp_helper.py                  | 702 +++++++++++++++++++++++++
 target/arm/cpu.c                       |   1 +
 target/arm/cpu.h                       |   1 +
 target/arm/helper.c                    |  10 +-
 target/arm/kvm.c                       |   3 +-
 27 files changed, 1552 insertions(+), 132 deletions(-)
 create mode 100644 hw/acpi/ghes_cper.c
 create mode 100644 hw/acpi/ghes_cper_stub.c
 create mode 100644 qapi/acpi-hest.json
 create mode 100644 scripts/arm_processor_error.py
 create mode 100755 scripts/ghes_inject.py
 create mode 100644 scripts/qmp_helper.py

-- 
2.46.0


