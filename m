Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp1117340njf;
        Fri, 16 Aug 2024 00:38:32 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXjlR9rxX8WWZK+QTvESU/4iqz8G6g+w7ieB9KF7+/XSXDKuFAtIwD1o3z8/cG4sMWqAAkjQmnz0vRJSxjwwNw6l5INNIOV
X-Google-Smtp-Source: AGHT+IHvr3gdKljoib94fVSyfgl4jdshAjnS08IHRvmtGCRnsiUMv7bW3/XXd+5HY6v7Tk5wijsT
X-Received: by 2002:a05:6402:27d4:b0:5b9:1067:61e9 with SMTP id 4fb4d7f45d1cf-5beca594365mr1508984a12.18.1723793912472;
        Fri, 16 Aug 2024 00:38:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1723793912; cv=pass;
        d=google.com; s=arc-20160816;
        b=StHj7uGZCIvPd7UFMyKzTZqiJr+JpOJ7gUZHQ1D7/J3kDZHBERh9j7yq7VegJvI+6k
         T9n7/BN3+ksJaxDnjjgcJuLz+n85smoOczgpyptNTTb01x9MYeB2LtqsJYjHzT9C/h6W
         ONPvPZTaNN9QGjywNZhWaHoRCtwDuL4XF1vqXMf07ocZfYav5OqKgDGb2k/YcnwLXb9H
         aDco9ZafEyThYZWIP4u6imTrtUpZuJ6nsG/o05DYjRMhiorzPO6JeFcw1HIYDTYZaPyp
         O6G4xeS4HscTnQkDIoWqznEXaq6CeH4rjo9qz6+ZKk3JGFOZFHJ2uM3OHMRyIoDouT76
         OYRQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xOpMPBt+S6AZPaqlflsscrqIktsBC0zW1Mr239DE4jQ=;
        fh=g1c62+3uWj3q01LRAjV1Yw06PJkf+gEb3PZozxS4Mfk=;
        b=WtmAtjMbRWjOKhWmlMUBuRWw5b+58LXWzojjQhspa8IL0D3WrmC9PM8g0thvuxYAL1
         +NA4xHksc9pwI6FPL+4LFQJS+xA9WamqRqTnWo+CjNq2fZoJ8V3f3lyFEsP0yDK6m1bU
         3o/T7tpNdk+DCyJhjvUXV3JBNz0+WN5F3lpcqNbuevTptdaa79bsfGlzkNRg6j39XVAC
         PDrG8YINenRFZ9sUgGbxyTbBOX+DVni3KLfahUeAXS1yr5h3WnBuj+bDJSFKuINwexdV
         0B0SiNFYuSQ7ErKhe9W0pGCNlls1U3dpy0gxKQdBDW0mM3l615I6l78o/Mng5+tncmzy
         vxYw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=DjoMr4Vn;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of kvm+bounces-24357-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-24357-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <kvm+bounces-24357-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5bebd47c767si1551712a12.66.2024.08.16.00.38.32
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 00:38:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-24357-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=DjoMr4Vn;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of kvm+bounces-24357-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-24357-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B67E71F271DB
	for <alex.bennee@linaro.org>; Fri, 16 Aug 2024 07:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33C9113A258;
	Fri, 16 Aug 2024 07:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DjoMr4Vn"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E691113777F
	for <kvm@vger.kernel.org>; Fri, 16 Aug 2024 07:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723793874; cv=none; b=T6L1IuNcnK8+dTWRQAqlkzLqfUPlRl3whis1AZVdJnKGJsIyWyqFsSfhJu/Dgk7GeP2KDwA+KHIQb7ezNoTzq/CVm92dOV2JWlcVTSHaJ5l5ta9sZaXt6vaR8x/tCr7WHwqo/dEX0tbxw7t9x7OJA8lH73EJjaURI2sN9lPN9jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723793874; c=relaxed/simple;
	bh=D++iFW5q1wjeFfI5T2Nq5mvVBT4VgbOdd26ejuwLbgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DGT9W4AVBzCgdKTvrUquKJVvn1jXQh86u9SZRfWA/eM5dKEGw/qXLaaXA8+EGsIjplx1oiWxIVrGQGxvAVjr4soVyQu5450MuoXaXSN+n7u9m8a3m6p0XU9+Eh/n0KSzyk2uojtpqSFAN3OclgxVc5iahNLrrsjxgw0gsePUvUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DjoMr4Vn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63275C4AF09;
	Fri, 16 Aug 2024 07:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723793873;
	bh=D++iFW5q1wjeFfI5T2Nq5mvVBT4VgbOdd26ejuwLbgQ=;
	h=From:To:Cc:Subject:Date:From;
	b=DjoMr4Vn2YwFrltnJG1Iw0ddSbl2fprNLlUKvlQ+dnsliWBI2kh091ddXEQ+QNqsn
	 +URvvu2ifC4u7pyrmY9muvGB4krmGWj00zl04zwqswwEF2CjAcaH1DmtxwUqktewUa
	 ILhKYW9aU+G6wYxDYoJNJoDL0LmqAep/tXNtsWuMeMqgVxsmJxusdKcJFolvYW2/Fi
	 T6kA75qd/EYZsijDxWst7EJQ3iwj3IOqdA3WxulMnpFexj5T8F6QlATvbT5bCb7zMl
	 A8dQNBA/TsiWQMeH3Rbe/FAuR6+PAIdvkaV/wcMEmNBme3HTcj0kHWvQ7pfVl1Plph
	 JXMmH3tXdlVNg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1serWx-000000055eI-1gEk;
	Fri, 16 Aug 2024 09:37:51 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v8 00/13] Add ACPI CPER firmware first error injection on ARM emulation
Date: Fri, 16 Aug 2024 09:37:32 +0200
Message-ID: <cover.1723793768.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: 1qEwMbEC5lCd

This series add support for injecting generic CPER records.  Such records
are generated outside QEMU via a provided script.

On this version, I added two optional patches at the end:
- acpi/ghes: cleanup generic error data logic

  It drops some obvious comments from some already-existing code.
  As we're already doing lots of changes at the code, it sounded
  reasonable to me to have such cleanup here;

- acpi/ghes: check if the BIOS pointers for HEST are correct

  QEMU has two ways to navigate to a CPER start data: via its
  memory address or indirectly following 2 BIOS pointers.
  OS only have the latter one. This patch validates if the BIOS
  links used by the OS were properly produced, comparing to the
  actual location of the CPER record.

---

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



Jonathan Cameron (1):
  acpi/ghes: Add support for GED error device

Mauro Carvalho Chehab (12):
  acpi/generic_event_device: add an APEI error device
  arm/virt: Wire up a GED error device for ACPI / GHES
  qapi/acpi-hest: add an interface to do generic CPER error injection
  acpi/ghes: rework the logic to handle HEST source ID
  acpi/ghes: add support for generic error injection via QAPI
  acpi/ghes: cleanup the memory error code logic
  docs: acpi_hest_ghes: fix documentation for CPER size
  scripts/ghes_inject: add a script to generate GHES error inject
  target/arm: add an experimental mpidr arm cpu property object
  scripts/arm_processor_error.py: retrieve mpidr if not filled
  acpi/ghes: cleanup generic error data logic
  acpi/ghes: check if the BIOS pointers for HEST are correct

 MAINTAINERS                            |  10 +
 docs/specs/acpi_hest_ghes.rst          |   6 +-
 hw/acpi/Kconfig                        |   5 +
 hw/acpi/aml-build.c                    |  10 +
 hw/acpi/generic_event_device.c         |   8 +
 hw/acpi/ghes-stub.c                    |   3 +-
 hw/acpi/ghes.c                         | 362 ++++++++-----
 hw/acpi/ghes_cper.c                    |  33 ++
 hw/acpi/ghes_cper_stub.c               |  19 +
 hw/acpi/meson.build                    |   2 +
 hw/arm/Kconfig                         |   5 +
 hw/arm/virt-acpi-build.c               |   6 +-
 hw/arm/virt.c                          |  12 +-
 include/hw/acpi/acpi_dev_interface.h   |   1 +
 include/hw/acpi/aml-build.h            |   2 +
 include/hw/acpi/generic_event_device.h |   1 +
 include/hw/acpi/ghes.h                 |  24 +-
 include/hw/arm/virt.h                  |   1 +
 qapi/acpi-hest.json                    |  36 ++
 qapi/meson.build                       |   1 +
 qapi/qapi-schema.json                  |   1 +
 scripts/arm_processor_error.py         | 388 ++++++++++++++
 scripts/ghes_inject.py                 |  51 ++
 scripts/qmp_helper.py                  | 702 +++++++++++++++++++++++++
 target/arm/cpu.c                       |   1 +
 target/arm/cpu.h                       |   1 +
 target/arm/helper.c                    |  10 +-
 target/arm/kvm.c                       |   2 +-
 28 files changed, 1551 insertions(+), 152 deletions(-)
 create mode 100644 hw/acpi/ghes_cper.c
 create mode 100644 hw/acpi/ghes_cper_stub.c
 create mode 100644 qapi/acpi-hest.json
 create mode 100644 scripts/arm_processor_error.py
 create mode 100755 scripts/ghes_inject.py
 create mode 100644 scripts/qmp_helper.py

-- 
2.46.0


