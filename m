Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5393356lff;
        Tue, 14 Jan 2020 03:40:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqyULI4kStZ9HV9O6hCT1c03/tqA/pPv9X9fPcdFCLU8CHqp2uV4CFBQtoqdMBK8GJa5UVbg
X-Received: by 2002:aa7:df09:: with SMTP id c9mr22559339edy.133.1579002005277;
        Tue, 14 Jan 2020 03:40:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579002005; cv=none;
        d=google.com; s=arc-20160816;
        b=H9PrXi5/pfIMJhQyN+3ySK+mgQ29ecCUxMZeRPKrw9jEJNWe4u/aEF/KkfxrKpxZ9I
         ZwD6dko9wdvI66mVZ/ifZ//KLs7LbOQZs8r4eMkvPaHASf3VVrhl8GaBKVB1Gb8G6xld
         ynz+RWZWIxt7ipgmZN9HCkOne/7vbH09Ni/qt9HNJgWlVt4XRxitHQFFvZjFFGHu9W4f
         G6P7fdtZhH4uY3kVCVNNlOhmHEwg5wddvrzBPhjyMwOopNaZ9SEO/hLLuOuMj1bEoSfu
         hkuGd4xhMM6DZzs//qW/imhC8KOi8nY3ahr1d1vIZWKy80s3c17LBNrlnp6K3yUJOnqm
         263w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=s8kSibyGHEuvaMxZof1NYWLNsdwJUdVoF7uKbNL5N60=;
        b=soYzglY7Qvet/YxNiLnVZWTa8VhaaPZGtSdFuYy/l4oFpNbTQQ3MbJlRxyFwBUhXxY
         gP9tXEdGek7MPJ6sus4iZT9WP/VWhdREpgI0+YgD4061jagm+pJxnmSL0bosjCCRjAcp
         gZ2jxfLB73S7/KtOLmgv0ni7bC2L94BIa9Iod0tPawFUJUMiiOD4BWNt4YYmngeeRd5O
         fVj0cVr/vaZujT5wA9zydhgbZwnTnRtCkF1jOgWCNRQQLIznIeNNfXsstn5+TxalHq0D
         GZJ4WPl0qCA8PmJ3B0IBOrD1z5BzDKFQ96Px1axw37Cf5p/8oT2HeIHNqFmL7jv8UoMP
         xiIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WxzKwGAa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bi20si10553183edb.430.2020.01.14.03.40.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 03:40:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WxzKwGAa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irKYF-00042x-Rh
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 06:40:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55273)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irKXy-00040G-UD
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 06:39:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irKXt-0002jG-Qn
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 06:39:46 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:51749
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irKXt-0002iu-NG
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 06:39:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579001980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=s8kSibyGHEuvaMxZof1NYWLNsdwJUdVoF7uKbNL5N60=;
 b=WxzKwGAaPoDUj+tXut5EHe1nlPrsOx0ZYxsmnZMC0A0uKBh8YDiej1nZa+SPIa4oxxHYHZ
 AtJoStcJGhZH/HENp/dwnhRqOLxrbQEtn08nYPngxSGoP2wbP/xp0fW/wYrO/XneqHxP6p
 EDVpdsuhXZtKG+9S3bAIVwoCZ55u9is=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-3bRa8E_2PZiXq7t-_DdOkg-1; Tue, 14 Jan 2020 06:39:39 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2905800D4C;
 Tue, 14 Jan 2020 11:39:37 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 07BB15DA32;
 Tue, 14 Jan 2020 11:39:27 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/30] Migration pull patches (3rd try)
Date: Tue, 14 Jan 2020 12:38:56 +0100
Message-Id: <20200114113926.3556-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 3bRa8E_2PZiXq7t-_DdOkg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <rth@twiddle.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YiTQmnpVNWuh

The following changes since commit 3c8a6575985b1652b45bfa670b5e1907d642cfa0=
:

  Merge remote-tracking branch 'remotes/kraxel/tags/usb-20200113-pull-reque=
st' into staging (2020-01-13 14:19:57 +0000)

are available in the Git repository at:

  https://github.com/juanquintela/qemu.git tags/migration-pull-pull-request

for you to fetch changes up to c3ff7ba64b1bb484a0b6339165627a196045a8c1:

  multifd: Allocate uint64_t instead of ram_addr_t (2020-01-14 12:28:07 +01=
00)

----------------------------------------------------------------
Migration pull request (take 3)

Fix (yet more) places where ram_addr_t is not 64 bits.

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

Juan Quintela (5):
  multifd: Initialize local variable
  migration-test: Add migration multifd test
  migration: Make sure that we don't call write() in case of error
  migration-test: introduce functions to handle string parameters
  multifd: Allocate uint64_t instead of ram_addr_t

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
 migration/ram.c              | 185 ++++++++++++++++++++++++++---------
 migration/savevm.c           |  61 ++++++++----
 migration/trace-events       |   9 +-
 migration/vmstate-types.c    |  70 +++++++++++++
 stubs/vmstate.c              |   2 +-
 tests/qtest/migration-test.c |  97 +++++++++++++++++-
 tests/test-vmstate.c         | 170 ++++++++++++++++++++++++++++++++
 vl.c                         |  10 +-
 27 files changed, 654 insertions(+), 130 deletions(-)

--=20
2.24.1

