Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5594213wrt;
        Mon, 26 Nov 2018 05:55:32 -0800 (PST)
X-Google-Smtp-Source: AJdET5feH0yC3HNtOrclyq/pomkxhulUKO41AoAlKXMYKzJKQIZSEsDwdLEomFlVk97pUvfM3cm/
X-Received: by 2002:a0d:e744:: with SMTP id q65-v6mr29592005ywe.109.1543240532126;
        Mon, 26 Nov 2018 05:55:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543240532; cv=none;
        d=google.com; s=arc-20160816;
        b=dOo13xUL8ql4e9Qd3KBzJYJSWy/cC5DS/UmFMzyIU/vVVf1JQpDjzLcIYOxVhLxLDa
         vDq6uXE0PzSjSFnpI5eU1rdhfQxTUUpX7CjG4SlFceXe6I8QvcqDWa40CtQFuufyppfX
         zx/qnoTuERY4H+xgyoTl/nPCyYh52NnQoiRoViYJQsRIiwMl7Pw4+Q4hW4QFDYouB9C9
         sFYCn2CQFcM+s6qbJO1ixuT4JuoRL3MjcKAPahMbUmEGT2bk1KnfB43npW1u5DCwele0
         iRcUP4HGkvBD26ATsJiCK2SyxFrQf/9fRqT7+WiB2SZI4k4hXExayCG9HazVtkjiJt3r
         MNsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=uX96AgZcB/kDv5sx7nZD1q+U/d1YwnRzbPEckQrEuhg=;
        b=R9LAUzNcfJ/uGyOh+5nNa1ZTH57kQ2kWplavmEukP2LAtq4IgsRtLU+hYhRsGjJdhk
         5AEr0rAw0cf55G+ctEWqT1vd9+4uky6Tcohq5F1BPzqTas+wEwD5/EMHnxNjoWOapfxl
         VryZF4ODmsmbF1oSGu5NafIgkunm/reKuL/QbXdjH4wV15zngG+PyiXVaGPlbQMMzzXF
         IQ69QhRPUCOI3NkTTZ0hHV3MUUXVqpWz3D7eYGhrkuLkA9WWdl/uTLIq5nUBlwD3LYCv
         f6Eeq4zXT5qy47Iz2WZek0lFLhcd81cIEYEV1qQs3Gd1CvsEaWCB/S10o92uH4WZ93Wy
         xE0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w200-v6si263433ybg.176.2018.11.26.05.55.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 05:55:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36117 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRHMJ-0002N1-7Z
	for alex.bennee@linaro.org; Mon, 26 Nov 2018 08:55:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gRHM8-0002KZ-Gx
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 08:55:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gRHM6-0001Jy-JP
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 08:55:20 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57154)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gRHM4-0001Ig-HD; Mon, 26 Nov 2018 08:55:18 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 222B77F6B0;
	Mon, 26 Nov 2018 13:55:15 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 283312D0A2;
	Mon, 26 Nov 2018 13:55:06 +0000 (UTC)
Date: Mon, 26 Nov 2018 14:55:05 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>
Message-ID: <20181126145505.56fb6031@redhat.com>
In-Reply-To: <20181107123652.23417-1-marcandre.lureau@redhat.com>
References: <20181107123652.23417-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 26 Nov 2018 13:55:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.2 v3 00/14] Generalize
 machine compatibility properties
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
	Eduardo Habkost <ehabkost@redhat.com>,
	Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>,
	qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, dgilbert@redhat.com, qemu-arm@nongnu.org,
	=?UTF-8?B?SGVy?= =?UTF-8?B?dsOp?= Poussineau <hpoussin@reactos.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Richard Henderson <rth@twiddle.net>,
	Andreas =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d7u61XSpwRq5

On Wed,  7 Nov 2018 16:36:38 +0400
Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> wrote:

> Hi,
>=20
> During "[PATCH v2 05/10] qom/globals: generalize
> object_property_set_globals()" review, Eduardo suggested to rework the
> GlobalProperty handling, so that -global is limited to QDev only and
> we avoid mixing the machine compats and the user-provided -global
> properties (instead of generalizing -global to various object kinds,
> like I proposed in v2).
>=20
> "qdev: do not mix compat props with global props" patch decouples a
> bit user-provided -global from machine compat properties. This allows
> to get rid of "user_provided" and "errp" fields in following patches.
>=20
> Instead of explcitely calling object_apply_global_props() in the
> various object post_init, I opted for creating a new TYPE_COMPAT_PROPS
> interface. The interface approach gives a lot more flexibility on
> which objects can have compat props. This requires some interface
> improvments in "qom: teach interfaces to implement post-init".
>=20
> A new compat property "x-use-canonical-path-for-ramblock-id" is added
> to hostmem for legacy canonical path names, set to true for -file and
> -memfd with qemu < 3.2.
>=20
> (this series was initially titled "[PATCH v2 00/10] hostmem: use
> object "id" for memory region name with >=3D 3.1", but its focus is more
> in refactoring the global and compatilibity properties handling now)
That probably all feedback I'm able to give on this round of review,
so I'll wait till it will addressed.

>=20
> v3:
> - GlobalProperties improvements/cleanups
> - drop generalizing the -global idea
> - "replace" the set_globals flag with a TYPE_COMPAT_PROPS interface
> - update hw/i386 machine version to 3.2
> - add "qom: make interface types abstract" interface cleanup
>=20
> v2:
> - replace "qom/user-creatable: add a few helper macros" patch for a
>   more optimized "qom: make user_creatable_complete() specific to
>   UserCreatable"
> - rename register_global_list() to register_global_properties()
> - call object_property_set_globals() after post-init
> - add and use a ObjectClass.set_globals flag, instead of dynamically
>   check object class in object_property_set_globals()
> - use object "id" in >=3D 3.1 instead of canonical path, add compat
>   property "x-use-canonical-path-for-ramblock-id" in base hostmem
>   class.
>=20
> Marc-Andr=C3=A9 Lureau (14):
>   tests: qdev_prop_check_globals() doesn't return "all_used"
>   qom: make interface types abstract
>   qom: make user_creatable_complete() specific to UserCreatable
>   accel: register global_props like machine globals
>   qdev: move qdev_prop_register_global_list() to tests
>   qdev: do not mix compat props with global props
>   qdev: all globals are now user-provided
>   qdev-props: convert global_props to GArray
>   qdev-props: remove errp from GlobalProperty
>   qdev-props: call object_apply_global_props()
>   qom: teach interfaces to implement post-init
>   machine: add compat-props interface
>   hw/i386: add pc-i440fx-3.2 & pc-q35-3.2
>   hostmem: use object id for memory region name with >=3D 3.1
>=20
>  include/hw/acpi/acpi_dev_interface.h |  6 +--
>  include/hw/arm/linux-boot-if.h       |  5 +-
>  include/hw/boards.h                  |  3 +-
>  include/hw/compat.h                  | 11 ++++
>  include/hw/fw-path-provider.h        |  4 +-
>  include/hw/hotplug.h                 |  6 +--
>  include/hw/i386/pc.h                 |  3 ++
>  include/hw/intc/intc.h               |  4 +-
>  include/hw/ipmi/ipmi.h               |  4 +-
>  include/hw/isa/isa.h                 |  4 --
>  include/hw/mem/memory-device.h       |  4 +-
>  include/hw/nmi.h                     |  4 +-
>  include/hw/qdev-core.h               |  9 ----
>  include/hw/qdev-properties.h         | 30 -----------
>  include/hw/stream.h                  |  4 +-
>  include/hw/timer/m48t59.h            |  4 +-
>  include/qom/object.h                 |  2 +
>  include/qom/object_interfaces.h      | 10 ++--
>  include/sysemu/accel.h               |  4 +-
>  include/sysemu/hostmem.h             |  3 +-
>  include/sysemu/tpm.h                 |  4 +-
>  target/arm/idau.h                    |  4 +-
>  accel/accel.c                        |  7 +--
>  backends/hostmem-file.c              |  8 +--
>  backends/hostmem-memfd.c             |  2 +-
>  backends/hostmem-ram.c               |  9 ++--
>  backends/hostmem.c                   | 31 +++++++++++
>  hw/core/compat-props.c               | 43 +++++++++++++++
>  hw/core/machine.c                    | 18 -------
>  hw/core/qdev-properties.c            | 73 ++++++-------------------
>  hw/core/qdev.c                       |  4 ++
>  hw/i386/pc_piix.c                    | 21 ++++++--
>  hw/i386/pc_q35.c                     | 19 ++++++-
>  hw/misc/ivshmem.c                    |  2 +-
>  hw/virtio/virtio-rng.c               |  2 +-
>  hw/xen/xen-common.c                  |  9 +++-
>  qom/cpu.c                            |  1 -
>  qom/object.c                         | 49 +++++++++++++++--
>  qom/object_interfaces.c              | 14 ++---
>  stubs/machine.c                      |  4 ++
>  target/i386/cpu.c                    |  1 -
>  target/sparc/cpu.c                   |  1 -
>  tests/check-qom-interface.c          | 27 ++++++++--
>  tests/test-qdev-global-props.c       | 80 ++++++++--------------------
>  vl.c                                 |  4 --
>  MAINTAINERS                          |  1 +
>  hw/core/Makefile.objs                |  1 +
>  stubs/Makefile.objs                  |  1 +
>  tests/Makefile.include               |  1 +
>  49 files changed, 283 insertions(+), 282 deletions(-)
>  create mode 100644 hw/core/compat-props.c
>  create mode 100644 stubs/machine.c
>=20

