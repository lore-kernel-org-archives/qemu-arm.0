Received: by 10.28.71.27 with SMTP id u27csp3766680wma;
        Tue, 23 Jan 2018 00:10:33 -0800 (PST)
X-Google-Smtp-Source: AH8x2267vnhODBWgbThE0C4xb6ZQ+mZIUYUDOb4+Iv7u0oTXXLZ80FlNW9U4bkLZkomsxym+ihrt
X-Received: by 10.129.85.83 with SMTP id j80mr1577738ywb.479.1516695033302;
        Tue, 23 Jan 2018 00:10:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516695033; cv=none;
        d=google.com; s=arc-20160816;
        b=uxZa/wCbaClKX6G0udE0TN5Aez/BLN70jo3KYa/LcDYQygnfcwrMMYsiz4YONNTDw+
         UJifUxSQW3fKoz7sEHX3Uc3FliMNPZUb4xdnX34mkH8lvWtfKis6dK1JQRxWrkTo49LT
         QYc2wFM5gv+un7Fsp6xw/l7oJUktfE1mVU01gCcBVUM6aDh2cUgXkS6fZOjlWrgDAxWs
         4wQ5pcMrHFu584mXIS3z6qX6fDjwj6rgewoq0TtxhhekBfFF4RMtxmK4QKv5GTzU5Zvg
         2b1aRhKT+5Vk4h16Vq8npLnekYkH2LFAOKWaLoHNaBbrIUoZYK2HmELVOATOrFGNxRL6
         SVeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=WlZnEtLds7h+UgTX/hK9xctFMsj+2Yot2Cy/KB1eRe0=;
        b=vA8k4kKHK17E0uXBaPqN8p9rrzIhY3vJmfPILdjjzTnNVZP5haWk3WAKac/xmCDs6c
         /oZLkHf4/JZsZ8Lt2albAfZ1KdpzCM/ubog1kMqwQ6qheOOjCsPgRX2EE7D65tcM1B8o
         bKsKBvF2Slp6WLag4QS+3JEQp5ihO08JMMzh4FpspsHANm34h/InhKY25g6teITF9Zrx
         l/uopsLlhRcG9tEL2WTkusk8BKUZbX0XIAe4UFUckScopG9vFS9X5hZaA4qzkHUyhiGN
         GHMl4UvxLIwz+wZw5AKK2uuJOtdSlhMVQCymFqyMRHQQBSfGmRg8tJf5cDaLR0SP9XCa
         URxA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d191si2241861ybh.657.2018.01.23.00.10.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 00:10:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43795 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edtf6-0007HN-Hp
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 03:10:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54600)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtem-0007DH-PY
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 03:10:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1edtei-0001ik-OV
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 03:10:12 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46488)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1edtei-0001hK-F4; Tue, 23 Jan 2018 03:10:08 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D5311C058ECF;
	Tue, 23 Jan 2018 08:10:06 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AF81CD1F4;
	Tue, 23 Jan 2018 08:10:03 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jan 2018 09:07:59 +0100
Message-Id: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 23 Jan 2018 08:10:06 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 00/25] generalize parsing of cpu_model (part 4)
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YHlfxQXb8xqA


v3:
  - use qtest_startf() instead of qtest_start()
  - rename tests/machine-none.c to tests/machine-none-test.c
  - introduce first CPU_RESOLVING_TYPE for all targets and
    only then use it parse_cpu_model()=20
  - stop abusing  mc->default_cpu_type as resolving cpu type,
    move cpu_parse_cpu_model() in to exec.c and embed in
    CPU_RESOLVING_TYPE, so that callers won't have to know
    about unnecessary detail

v2:
  - implemented new approach only for x86/ARM (will be done for all targe=
ts
    if approach seems acceptable)
  - add test case for '-M none -cpu FOO' case
  - redefine TARGET_DEFAULT_CPU_TYPE into CPU_RESOLVING_TYPE
  - scrape off default cpu_model refactoring, so it would cause
    less conflicts with Laurent's series where he tries to rework
    defaults to use ELF hints of executed program

Series is finishing work on generalizing cpu_model parsing
and limiting parts that deal with inconsistent cpu_model
naming to "-cpu" CLI option in vl.c, bsd|linux-user/main.c
CLI and default cpu_model processing and FOO_cpu_class_by_name()
callbacks.

It introduces CPU_RESOLVING_TYPE which must be defined
by each target and is used by helper parse_cpu_model()
(former cpu_parse_cpu_model()) to get access to target
specific FOO_cpu_class_by_name() callback.

git tree for testing:
   https://github.com/imammedo/qemu.git cpu_init_removal_v3

CC: Laurent Vivier <laurent@vivier.eu>
CC: Eduardo Habkost <ehabkost@redhat.com>
CC: qemu-s390x@nongnu.org
CC: qemu-ppc@nongnu.org
CC: qemu-arm@nongnu.org

Igor Mammedov (25):
  nios2: 10m50_devboard: replace cpu_model with cpu_type
  tests: add machine 'none' with -cpu test
  arm: cpu: add CPU_RESOLVING_TYPE macro
  x86: cpu: add CPU_RESOLVING_TYPE macro
  alpha: cpu: add CPU_RESOLVING_TYPE macro
  cris: cpu: add CPU_RESOLVING_TYPE macro
  lm32: cpu: add CPU_RESOLVING_TYPE macro
  m68k: cpu: add CPU_RESOLVING_TYPE macro
  microblaze: cpu: add CPU_RESOLVING_TYPE macro
  mips: cpu: add CPU_RESOLVING_TYPE macro
  moxie: cpu: add CPU_RESOLVING_TYPE macro
  nios2: cpu: add CPU_RESOLVING_TYPE macro
  openrisc: cpu: add CPU_RESOLVING_TYPE macro
  ppc: cpu: add CPU_RESOLVING_TYPE macro
  s390x: cpu: add CPU_RESOLVING_TYPE macro
  sh4: cpu: add CPU_RESOLVING_TYPE macro
  sparc: cpu: add CPU_RESOLVING_TYPE macro
  tricore: cpu: add CPU_RESOLVING_TYPE macro
  unicore32: cpu: add CPU_RESOLVING_TYPE macro
  xtensa: cpu: add CPU_RESOLVING_TYPE macro
  hppa: cpu: add CPU_RESOLVING_TYPE macro
  tilegx: cpu: add CPU_RESOLVING_TYPE macro
  Use cpu_create(type) instead of cpu_init(cpu_model)
  cpu: get rid of unused cpu_init() defines
  cpu: get rid of cpu_generic_init()

 include/qom/cpu.h         | 16 +-------
 target/alpha/cpu.h        |  3 +-
 target/arm/cpu.h          |  3 +-
 target/cris/cpu.h         |  3 +-
 target/hppa/cpu.h         |  2 +-
 target/i386/cpu.h         |  3 +-
 target/lm32/cpu.h         |  3 +-
 target/m68k/cpu.h         |  3 +-
 target/microblaze/cpu.h   |  2 +-
 target/mips/cpu.h         |  3 +-
 target/moxie/cpu.h        |  3 +-
 target/nios2/cpu.h        |  2 +-
 target/openrisc/cpu.h     |  3 +-
 target/ppc/cpu.h          |  3 +-
 target/s390x/cpu.h        |  3 +-
 target/sh4/cpu.h          |  3 +-
 target/sparc/cpu.h        |  5 +--
 target/tilegx/cpu.h       |  2 +-
 target/tricore/cpu.h      |  3 +-
 target/unicore32/cpu.h    |  3 +-
 target/xtensa/cpu.h       |  3 +-
 bsd-user/main.c           |  4 +-
 exec.c                    | 23 +++++++++++
 hw/core/null-machine.c    |  6 +--
 hw/nios2/10m50_devboard.c |  2 +-
 linux-user/main.c         | 10 +++--
 qom/cpu.c                 | 48 +----------------------
 tests/Makefile.include    |  2 +
 tests/machine-none-test.c | 97 +++++++++++++++++++++++++++++++++++++++++=
++++++
 vl.c                      | 10 ++---
 30 files changed, 162 insertions(+), 114 deletions(-)
 create mode 100644 tests/machine-none-test.c

--=20
2.7.4

