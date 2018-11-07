Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2081440wrw;
        Wed, 7 Nov 2018 04:37:27 -0800 (PST)
X-Google-Smtp-Source: AJdET5frfnv+2JXz7XN8lWQWNUOxCUzuRKbCS/XNJE2+Pw72H/pczMmlTKvUDguljv2xgS/1/R44
X-Received: by 2002:ac8:2502:: with SMTP id 2mr23542qtm.53.1541594247309;
        Wed, 07 Nov 2018 04:37:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541594247; cv=none;
        d=google.com; s=arc-20160816;
        b=qGDDmWfMT84EccEE9vpFirtpvT2lOqZNGGkxQOE2wCMNNkf3MZJe34JfIiD2Pifsgd
         0S96WCT/nQmFElpAss58ex5+texJoV6jXkiXeMzDn87NeSD0ifiKTzI9rdhI6HJBHJAb
         TTnik9n6SGZJOxjKTq76a9r88BX1jTc+KFFaBmKjfctziQAFNDEiRQvCQryAXVIhuM1r
         8bh9/pOG/PYrVrol9cF43Q7ERYpngEU3dtxjbrDjlY1+DL3Np+XrvT99W7mEcsPjWPs/
         YqkCrgVfJvSZ+1aPRuzeR9J02gXi3MK9xffkmmG5YzjhQILHI5Dvmh2MPGB5jy0pnfR5
         A5fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=lxzEbDo5/bkGC9h1DPbsSOznKyxAhwzq3uVXJQk/ALg=;
        b=AeUqs2fJMmCDBv5LwMsPs6Eks52AtRPl/U+JWGS3nngImNRwooPzhb/pSAvvi+l7aA
         EPgF8OaoKer+ej5cqNBuzx4LExVV7828zeN1ojTuSMwIRuncVX7P5/wsCej8cRlQtPg6
         +kAK/MEGK6/6mRmPjq1C3kb1sL10g30yG/PkMp+ghOQllkV+ZXUmppz9WJ4dmqg4mqx4
         n+zoh2iqOuTRjeegRtwcFSvtt3dpAkKw7eBci4b0+R0MBge/pL9jbKesbSKc0U4z9WT/
         jL8YeYsTnd1TUfXH0GCPIVNREEH9qEdHyD5rq13q+RJfsaVum2PzUtYC2lPhosluBOZl
         owLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l61-v6si90181qte.331.2018.11.07.04.37.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Nov 2018 04:37:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47598 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKN5K-000418-OW
	for alex.bennee@linaro.org; Wed, 07 Nov 2018 07:37:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36767)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1gKN59-0003zB-LH
	for qemu-arm@nongnu.org; Wed, 07 Nov 2018 07:37:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1gKN55-00060J-Lm
	for qemu-arm@nongnu.org; Wed, 07 Nov 2018 07:37:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38968)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1gKN53-0005sR-NV; Wed, 07 Nov 2018 07:37:10 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D4A383076C95;
	Wed,  7 Nov 2018 12:37:01 +0000 (UTC)
Received: from localhost (ovpn-112-43.ams2.redhat.com [10.36.112.43])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BC3045D6AA;
	Wed,  7 Nov 2018 12:36:55 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  7 Nov 2018 16:36:38 +0400
Message-Id: <20181107123652.23417-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Wed, 07 Nov 2018 12:37:03 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-3.2 v3 00/14] Generalize machine
 compatibility properties
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, Corey Minyard <minyard@acm.org>,
	Amit Shah <amit@kernel.org>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	dgilbert@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xwLETxYPJTFY

Hi,

During "[PATCH v2 05/10] qom/globals: generalize
object_property_set_globals()" review, Eduardo suggested to rework the
GlobalProperty handling, so that -global is limited to QDev only and
we avoid mixing the machine compats and the user-provided -global
properties (instead of generalizing -global to various object kinds,
like I proposed in v2).

"qdev: do not mix compat props with global props" patch decouples a
bit user-provided -global from machine compat properties. This allows
to get rid of "user_provided" and "errp" fields in following patches.

Instead of explcitely calling object_apply_global_props() in the
various object post_init, I opted for creating a new TYPE_COMPAT_PROPS
interface. The interface approach gives a lot more flexibility on
which objects can have compat props. This requires some interface
improvments in "qom: teach interfaces to implement post-init".

A new compat property "x-use-canonical-path-for-ramblock-id" is added
to hostmem for legacy canonical path names, set to true for -file and
-memfd with qemu < 3.2.

(this series was initially titled "[PATCH v2 00/10] hostmem: use
object "id" for memory region name with >=3D 3.1", but its focus is more
in refactoring the global and compatilibity properties handling now)

v3:
- GlobalProperties improvements/cleanups
- drop generalizing the -global idea
- "replace" the set_globals flag with a TYPE_COMPAT_PROPS interface
- update hw/i386 machine version to 3.2
- add "qom: make interface types abstract" interface cleanup

v2:
- replace "qom/user-creatable: add a few helper macros" patch for a
  more optimized "qom: make user_creatable_complete() specific to
  UserCreatable"
- rename register_global_list() to register_global_properties()
- call object_property_set_globals() after post-init
- add and use a ObjectClass.set_globals flag, instead of dynamically
  check object class in object_property_set_globals()
- use object "id" in >=3D 3.1 instead of canonical path, add compat
  property "x-use-canonical-path-for-ramblock-id" in base hostmem
  class.

Marc-Andr=C3=A9 Lureau (14):
  tests: qdev_prop_check_globals() doesn't return "all_used"
  qom: make interface types abstract
  qom: make user_creatable_complete() specific to UserCreatable
  accel: register global_props like machine globals
  qdev: move qdev_prop_register_global_list() to tests
  qdev: do not mix compat props with global props
  qdev: all globals are now user-provided
  qdev-props: convert global_props to GArray
  qdev-props: remove errp from GlobalProperty
  qdev-props: call object_apply_global_props()
  qom: teach interfaces to implement post-init
  machine: add compat-props interface
  hw/i386: add pc-i440fx-3.2 & pc-q35-3.2
  hostmem: use object id for memory region name with >=3D 3.1

 include/hw/acpi/acpi_dev_interface.h |  6 +--
 include/hw/arm/linux-boot-if.h       |  5 +-
 include/hw/boards.h                  |  3 +-
 include/hw/compat.h                  | 11 ++++
 include/hw/fw-path-provider.h        |  4 +-
 include/hw/hotplug.h                 |  6 +--
 include/hw/i386/pc.h                 |  3 ++
 include/hw/intc/intc.h               |  4 +-
 include/hw/ipmi/ipmi.h               |  4 +-
 include/hw/isa/isa.h                 |  4 --
 include/hw/mem/memory-device.h       |  4 +-
 include/hw/nmi.h                     |  4 +-
 include/hw/qdev-core.h               |  9 ----
 include/hw/qdev-properties.h         | 30 -----------
 include/hw/stream.h                  |  4 +-
 include/hw/timer/m48t59.h            |  4 +-
 include/qom/object.h                 |  2 +
 include/qom/object_interfaces.h      | 10 ++--
 include/sysemu/accel.h               |  4 +-
 include/sysemu/hostmem.h             |  3 +-
 include/sysemu/tpm.h                 |  4 +-
 target/arm/idau.h                    |  4 +-
 accel/accel.c                        |  7 +--
 backends/hostmem-file.c              |  8 +--
 backends/hostmem-memfd.c             |  2 +-
 backends/hostmem-ram.c               |  9 ++--
 backends/hostmem.c                   | 31 +++++++++++
 hw/core/compat-props.c               | 43 +++++++++++++++
 hw/core/machine.c                    | 18 -------
 hw/core/qdev-properties.c            | 73 ++++++-------------------
 hw/core/qdev.c                       |  4 ++
 hw/i386/pc_piix.c                    | 21 ++++++--
 hw/i386/pc_q35.c                     | 19 ++++++-
 hw/misc/ivshmem.c                    |  2 +-
 hw/virtio/virtio-rng.c               |  2 +-
 hw/xen/xen-common.c                  |  9 +++-
 qom/cpu.c                            |  1 -
 qom/object.c                         | 49 +++++++++++++++--
 qom/object_interfaces.c              | 14 ++---
 stubs/machine.c                      |  4 ++
 target/i386/cpu.c                    |  1 -
 target/sparc/cpu.c                   |  1 -
 tests/check-qom-interface.c          | 27 ++++++++--
 tests/test-qdev-global-props.c       | 80 ++++++++--------------------
 vl.c                                 |  4 --
 MAINTAINERS                          |  1 +
 hw/core/Makefile.objs                |  1 +
 stubs/Makefile.objs                  |  1 +
 tests/Makefile.include               |  1 +
 49 files changed, 283 insertions(+), 282 deletions(-)
 create mode 100644 hw/core/compat-props.c
 create mode 100644 stubs/machine.c

--=20
2.19.1.708.g4ede3d42df

