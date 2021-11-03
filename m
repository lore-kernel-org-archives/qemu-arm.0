Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp72620lfv;
        Wed, 3 Nov 2021 14:14:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoPec5S3nGDxGgWarmDgfmZv61LJbUoihg3XFbqGi9+SkRQxP/Wc1W0xWMyvK1gEjXNl8T
X-Received: by 2002:a50:e004:: with SMTP id e4mr64718569edl.246.1635974069941;
        Wed, 03 Nov 2021 14:14:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635974069; cv=none;
        d=google.com; s=arc-20160816;
        b=xhPgYAUHtjtMG5EPqevEHoFlhnJS0bhf0PKL8oQxVOON7YPkyaElJoszvPcZsTH6xn
         dS/8KIyoFKTiCivi/DeR7K5K2aJ62ZGdQvNB4bO/4JJ1m0LQEFD7kkDrNeYkrh+7ZMYw
         8v8dWv2+OgDoiXdWpk6wET9E07O/DfU8bllnyop0G07j0TKob1RSzjLQku/EgiPmdYNt
         rDxMmsrzbfQTR8Sbn3rmMh8rauk6GnP1v3n2205ph9o8rWntI+7S9IxDy/x/M6af+t8b
         4hvzyBho6YMdCNW+E0L2s47/86KMA7Vv+CZGKRgWhA4VSuLmTlrbrkgt/8istvqp4ozY
         skzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=sypTH/q3+9Sj28HG6C7L1YzN4Gyw80kyIaopKB96lrg=;
        b=tyu2KwhbH8F90Rq3+lOEWRYE9+mp/LvdtfzMQbx/XvzhrJzrBHlAqai+ojZouJc5Ui
         mQFNkHEmVm7ZeIj8S7e7BwcAB9NvgKXrihvyDWdFyortsUAWdp106P8yB1Rth/yLvklY
         KGNy0oBfGkprp4Q78/uvcZlTqP0swmG/7y9gKVYtUu+IOBAwJyqtI+X9Xq+4lQ81V+S0
         hYWmGfnT9kblJGDmWcGuLQtytpkU4Q5qwlnUh766FTNdfaJXC275C6V4uPK5mPRmtDVM
         tNZmjWGmBtqDt5wm+NRr+iX23FI4fiyhu9VW3r/IuVlgPCJX9Y/kQFbUJlwS4sORhK/p
         HOGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RRwoOhji;
       spf=pass (google.com: domain of willianr@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=willianr@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <willianr@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id sd5si6824250ejc.8.2021.11.03.14.14.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Nov 2021 14:14:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of willianr@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RRwoOhji;
       spf=pass (google.com: domain of willianr@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=willianr@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635974068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sypTH/q3+9Sj28HG6C7L1YzN4Gyw80kyIaopKB96lrg=;
	b=RRwoOhjiixymMwAxZcMz9W4AXjADROZsGpK3Cmz5rNSaukrMUmCNKd9fvSgk4r/kn9r9kR
	tcmZOmBZ1KsPunDMCVilliRrJ0rsE+w7Gpq4YsypRMH3Exh6KwiL+M2UKdxc+dJL/4s2a4
	+mZAbmzBg3n5VozBiSaSXzwfrUE2Yfg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-OIcRGI_wMsqloCtSwDRbpw-1; Wed, 03 Nov 2021 17:14:25 -0400
X-MC-Unique: OIcRGI_wMsqloCtSwDRbpw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11CA587D541;
	Wed,  3 Nov 2021 21:14:24 +0000 (UTC)
Received: from wrampazz.redhat.com (unknown [10.22.18.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 020285D9DE;
	Wed,  3 Nov 2021 21:14:05 +0000 (UTC)
From: Willian Rampazzo <willianr@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	John Snow <jsnow@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Willian Rampazzo <willianr@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 0/1] tests/acceptance: rename tests acceptance to tests avocado
Date: Wed,  3 Nov 2021 18:14:03 -0300
Message-Id: <20211103211404.79953-1-willianr@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=willianr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: jCMYFpXYFRKI

In the discussion about renaming the `tests/acceptance` [1], the=0D
conclusion was that the folders inside `tests` are related to the=0D
framework running the tests and not directly related to the type of=0D
the tests.=0D
=0D
This changes the folder to `tests/avocado` and adjusts the MAKEFILE, the=0D
CI related files and the documentation.=0D
=0D
[1] https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg06553.html=0D
=0D
GitLab pipeline with new naming: https://gitlab.com/willianrampazzo/qemu/-/=
pipelines/401431592=0D
Signed-off-by: Willian Rampazzo <willianr@redhat.com>=0D
=0D
Willian Rampazzo (1):=0D
  tests/acceptance: rename tests acceptance to tests avocado=0D
=0D
 .gitlab-ci.d/buildtest-template.yml           |  2 +-=0D
 .gitlab-ci.d/buildtest.yml                    | 56 +++++++++----------=0D
 MAINTAINERS                                   | 52 ++++++++---------=0D
 configure                                     |  2 +-=0D
 docs/devel/build-system.rst                   |  2 +-=0D
 docs/devel/ci-definitions.rst.inc             |  2 +-=0D
 docs/devel/testing.rst                        | 49 ++++++++--------=0D
 docs/system/arm/orangepi.rst                  |  8 +--=0D
 python/qemu/machine/README.rst                |  2 +-=0D
 python/qemu/qmp/README.rst                    |  2 +-=0D
 python/qemu/utils/README.rst                  |  2 +-=0D
 tests/Makefile.include                        | 14 ++---=0D
 tests/acceptance/README.rst                   | 10 ----=0D
 tests/avocado/README.rst                      | 10 ++++=0D
 .../avocado_qemu/__init__.py                  |  2 +-=0D
 tests/{acceptance =3D> avocado}/boot_linux.py   |  0=0D
 .../boot_linux_console.py                     |  0=0D
 tests/{acceptance =3D> avocado}/boot_xen.py     |  0=0D
 tests/{acceptance =3D> avocado}/cpu_queries.py  |  0=0D
 .../empty_cpu_model.py                        |  0=0D
 tests/{acceptance =3D> avocado}/hotplug_cpu.py  |  0=0D
 tests/{acceptance =3D> avocado}/info_usernet.py |  0=0D
 tests/{acceptance =3D> avocado}/intel_iommu.py  |  0=0D
 tests/{acceptance =3D> avocado}/linux_initrd.py |  2 +-=0D
 .../linux_ssh_mips_malta.py                   |  0=0D
 .../machine_arm_canona1100.py                 |  0=0D
 .../machine_arm_integratorcp.py               |  0=0D
 .../machine_arm_n8x0.py                       |  0=0D
 tests/{acceptance =3D> avocado}/machine_avr6.py |  2 +-=0D
 .../machine_m68k_nextcube.py                  |  0=0D
 .../machine_microblaze.py                     |  0=0D
 .../machine_mips_fuloong2e.py                 |  0=0D
 .../machine_mips_loongson3v.py                |  0=0D
 .../machine_mips_malta.py                     |  0=0D
 .../machine_rx_gdbsim.py                      |  0=0D
 .../machine_s390_ccw_virtio.py                |  0=0D
 .../machine_sparc64_sun4u.py                  |  0=0D
 .../machine_sparc_leon3.py                    |  0=0D
 tests/{acceptance =3D> avocado}/migration.py    |  0=0D
 tests/{acceptance =3D> avocado}/multiprocess.py |  0=0D
 .../pc_cpu_hotplug_props.py                   |  0=0D
 tests/{acceptance =3D> avocado}/ppc_405.py      |  0=0D
 tests/{acceptance =3D> avocado}/ppc_bamboo.py   |  0=0D
 .../{acceptance =3D> avocado}/ppc_mpc8544ds.py  |  0=0D
 tests/{acceptance =3D> avocado}/ppc_prep_40p.py | 12 ++--=0D
 tests/{acceptance =3D> avocado}/ppc_pseries.py  |  0=0D
 .../ppc_virtex_ml507.py                       |  0=0D
 .../{acceptance =3D> avocado}/replay_kernel.py  |  0=0D
 tests/{acceptance =3D> avocado}/replay_linux.py |  0=0D
 .../reverse_debugging.py                      |  0=0D
 tests/{acceptance =3D> avocado}/smmu.py         |  0=0D
 tests/{acceptance =3D> avocado}/tcg_plugins.py  |  0=0D
 .../tesseract_utils.py                        |  0=0D
 tests/{acceptance =3D> avocado}/version.py      |  0=0D
 tests/{acceptance =3D> avocado}/virtio-gpu.py   |  0=0D
 .../virtio_check_params.py                    |  0=0D
 .../{acceptance =3D> avocado}/virtio_version.py |  0=0D
 .../virtiofs_submounts.py                     |  0=0D
 .../virtiofs_submounts.py.data/cleanup.sh     |  0=0D
 .../guest-cleanup.sh                          |  0=0D
 .../virtiofs_submounts.py.data/guest.sh       |  0=0D
 .../virtiofs_submounts.py.data/host.sh        |  0=0D
 tests/{acceptance =3D> avocado}/vnc.py          |  0=0D
 .../x86_cpu_model_versions.py                 |  0=0D
 64 files changed, 113 insertions(+), 118 deletions(-)=0D
 delete mode 100644 tests/acceptance/README.rst=0D
 create mode 100644 tests/avocado/README.rst=0D
 rename tests/{acceptance =3D> avocado}/avocado_qemu/__init__.py (99%)=0D
 rename tests/{acceptance =3D> avocado}/boot_linux.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/boot_linux_console.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/boot_xen.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/cpu_queries.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/empty_cpu_model.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/hotplug_cpu.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/info_usernet.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/intel_iommu.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/linux_initrd.py (99%)=0D
 rename tests/{acceptance =3D> avocado}/linux_ssh_mips_malta.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/machine_arm_canona1100.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/machine_arm_integratorcp.py (100%)=
=0D
 rename tests/{acceptance =3D> avocado}/machine_arm_n8x0.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/machine_avr6.py (98%)=0D
 rename tests/{acceptance =3D> avocado}/machine_m68k_nextcube.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/machine_microblaze.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/machine_mips_fuloong2e.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/machine_mips_loongson3v.py (100%)=
=0D
 rename tests/{acceptance =3D> avocado}/machine_mips_malta.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/machine_rx_gdbsim.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/machine_s390_ccw_virtio.py (100%)=
=0D
 rename tests/{acceptance =3D> avocado}/machine_sparc64_sun4u.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/machine_sparc_leon3.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/migration.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/multiprocess.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/pc_cpu_hotplug_props.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/ppc_405.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/ppc_bamboo.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/ppc_mpc8544ds.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/ppc_prep_40p.py (92%)=0D
 rename tests/{acceptance =3D> avocado}/ppc_pseries.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/ppc_virtex_ml507.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/replay_kernel.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/replay_linux.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/reverse_debugging.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/smmu.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/tcg_plugins.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/tesseract_utils.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/version.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/virtio-gpu.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/virtio_check_params.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/virtio_version.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/virtiofs_submounts.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/virtiofs_submounts.py.data/cleanup.=
sh (100%)=0D
 rename tests/{acceptance =3D> avocado}/virtiofs_submounts.py.data/guest-cl=
eanup.sh (100%)=0D
 rename tests/{acceptance =3D> avocado}/virtiofs_submounts.py.data/guest.sh=
 (100%)=0D
 rename tests/{acceptance =3D> avocado}/virtiofs_submounts.py.data/host.sh =
(100%)=0D
 rename tests/{acceptance =3D> avocado}/vnc.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/x86_cpu_model_versions.py (100%)=0D
=0D
--=20=0D
2.33.1=0D
=0D
