Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp984521lff;
        Fri, 10 Jan 2020 09:32:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqyCR39ieVAaMbCgKR1DtyP2gY26RSkm7SwXeaN4UDSG1Lk2cSuUhGyoefMCVaUu6xHZGkhn
X-Received: by 2002:a05:620a:108d:: with SMTP id g13mr4271839qkk.121.1578677572602;
        Fri, 10 Jan 2020 09:32:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578677572; cv=none;
        d=google.com; s=arc-20160816;
        b=rPf2Oq2qKUn2dSFDgesXGj3+RTxa+qd21AWUCh7RM/QMqIuRJRvOWsoUERa4i58fT2
         6AXmehe7/bIGEBK/p596xw0SnP6RIdRUHEjO2kqp4AuRz+g2GTl8aDANzvYrMS+cl571
         IYxRwLlw21C4ta3goJ9AEu1h9RTppX2BHwja/AY65p7W9Bn0Lc65aaIaXLdzL0J6fCxd
         RunUUXlbT3R4LzFCrd2frFlvMyF0u2ZTpHB90//o041U9vDhUITxqko+zHp32PVi1Oc5
         1aauneJ8luw3aLnUOhmpaiejZLJxJktf4HqzB6/xZWbrCaaW+1o6rGlRHzPcbkmTVUGy
         AkuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=p+4+twGM1/XPXNkNqk5HnVtbLZJJ6FIH/7/yawqnBeU=;
        b=sYPIjV7khyOCXjZQkYyfBRvWySpY3AaBxLwR1VGZOZSYYAyPhj+rcRFdrcXs4ore4x
         7edTjr5N0LmlyiV5pyv0LqbS3nedkZd88EtKOFLuzMoInx35mZBbvJfa16h8yIVgeyUZ
         w7co4/t9+dRAl1Rp8wmUsnEo9ud8hSZws7Y34Ob/fq7/XyEdcTyGWdriRi6HyodRhaVT
         hey3wun/XsPTWhUEc/04Wz9riTfzaFIeLKV2jLeWLnUq2eBfptgGEtbk1L0MdzsSvI8q
         nW6mgQvBpw2KWW2omScsXAQOHXLIqXUFAYPFcAp91OpMIgPkb4jemJMQxp222EV0wSJa
         IACw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gjuE61z1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a22si1530841qtp.11.2020.01.10.09.32.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jan 2020 09:32:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gjuE61z1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ipy9T-0002wP-8b
	for alex.bennee@linaro.org; Fri, 10 Jan 2020 12:32:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43544)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1ipy9D-0002vP-Ac
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 12:32:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1ipy9A-0007Zw-Df
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 12:32:33 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27399
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1ipy9A-0007Vu-6q
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 12:32:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578677551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=p+4+twGM1/XPXNkNqk5HnVtbLZJJ6FIH/7/yawqnBeU=;
 b=gjuE61z1O4qJrK2crGURW44zG0W4Em9Ov4yYVel+c9oC32zC4RRerE+BeC63jtGhHJQLw0
 Thjo03zL305WSPw9PlbGhGKKXUBbDI89O2xkwrclmaAbuhPv45NDbBkpfRHTO8dUL+WwUa
 XyiEFd6d9qkLKsUMeQSrz1AayZaGQYg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-gCO-Tg1-MNOhl7x1vaFrYA-1; Fri, 10 Jan 2020 12:32:29 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28205107ACC5;
 Fri, 10 Jan 2020 17:32:27 +0000 (UTC)
Received: from secure.mitica (ovpn-116-240.ams2.redhat.com [10.36.116.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA67819C4F;
 Fri, 10 Jan 2020 17:32:16 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/28] Migration pull patches
Date: Fri, 10 Jan 2020 18:31:47 +0100
Message-Id: <20200110173215.3865-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: gCO-Tg1-MNOhl7x1vaFrYA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pMlFdRfrz2dt

The following changes since commit f38a71b01f839c7b65ea73ddd507903cb9489ed6=
:

  Merge remote-tracking branch 'remotes/stsquad/tags/pull-testing-and-semih=
osting-090120-2' into staging (2020-01-10 13:19:34 +0000)

are available in the Git repository at:

  https://github.com/juanquintela/qemu.git tags/migration-pull-pull-request

for you to fetch changes up to cc708d2411d3ed2ab4a428c996b778c7c7a47a04:

  apic: Use 32bit APIC ID for migration instance ID (2020-01-10 18:19:18 +0=
100)

----------------------------------------------------------------
Migration pull request

- several multifd mixes (jiahui, me)
- rate limit host pages (david)
- remove unneeded labels (daniel)
- several multifd fixes (wei)
- improve handler insert (scott)
- qlist migration (eric)
- power fixes (laurent)
- migration improvemests (yury)
- lots of fixes (wei)

----------------------------------------------------------------

Alexey Romko (1):
  Bug #1829242 correction.

Daniel Henrique Barboza (1):
  ram.c: remove unneeded labels

Dr. David Alan Gilbert (1):
  migration: Rate limit inside host pages

Eric Auger (1):
  migration: Support QLIST migration

Fangrui Song (1):
  migration: Fix incorrect integer->float conversion caught by clang

Jiahui Cen (2):
  migration/multifd: fix nullptr access in terminating multifd threads
  migration/multifd: fix destroyed mutex access in terminating multifd
    threads

Juan Quintela (3):
  migration-test: Add migration multifd test
  migration: Make sure that we don't call write() in case of error
  migration-test: introduce functions to handle string parameters

Laurent Vivier (2):
  migration-test: ppc64: fix FORTH test program
  runstate: ignore finishmigrate -> prelaunch transition

Marc-Andr=C3=A9 Lureau (1):
  misc: use QEMU_IS_ALIGNED

Peter Xu (3):
  migration: Define VMSTATE_INSTANCE_ID_ANY
  migration: Change SaveStateEntry.instance_id into uint32_t
  apic: Use 32bit APIC ID for migration instance ID

Scott Cheloha (2):
  migration: add savevm_state_handler_remove()
  migration: savevm_state_handler_insert: constant-time element
    insertion

Wei Yang (8):
  migration/postcopy: reduce memset when it is zero page and
    matches_target_page_size
  migration/postcopy: wait for decompress thread in precopy
  migration/postcopy: count target page number to decide the
    place_needed
  migration/postcopy: set all_zero to true on the first target page
  migration/postcopy: enable random order target page arrival
  migration/postcopy: enable compress during postcopy
  migration/multifd: clean pages after filling packet
  migration/multifd: not use multifd during postcopy

Yury Kotov (2):
  migration: Fix the re-run check of the migrate-incoming command
  migration/ram: Yield periodically to the main loop

 backends/dbus-vmstate.c      |   3 +-
 exec.c                       |   4 +-
 hw/arm/stellaris.c           |   2 +-
 hw/core/qdev.c               |   3 +-
 hw/display/ads7846.c         |   2 +-
 hw/i2c/core.c                |   2 +-
 hw/input/stellaris_input.c   |   3 +-
 hw/intc/apic_common.c        |   7 +-
 hw/misc/max111x.c            |   3 +-
 hw/net/eepro100.c            |   3 +-
 hw/pci/pci.c                 |   2 +-
 hw/ppc/spapr.c               |   2 +-
 hw/timer/arm_timer.c         |   2 +-
 hw/tpm/tpm_emulator.c        |   3 +-
 include/migration/register.h |   2 +-
 include/migration/vmstate.h  |  25 ++++-
 include/qemu/queue.h         |  39 ++++++++
 migration/migration.c        |  72 +++++++-------
 migration/migration.h        |   1 +
 migration/ram.c              | 181 ++++++++++++++++++++++++++---------
 migration/savevm.c           |  61 ++++++++----
 migration/trace-events       |   9 +-
 migration/vmstate-types.c    |  70 ++++++++++++++
 stubs/vmstate.c              |   2 +-
 tests/migration-test.c       |  97 ++++++++++++++++++-
 tests/test-vmstate.c         | 170 ++++++++++++++++++++++++++++++++
 vl.c                         |  10 +-
 27 files changed, 652 insertions(+), 128 deletions(-)

--=20
2.24.1

