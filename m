Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp2386624lfv;
        Fri, 5 Nov 2021 08:54:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVeolds13YTJS6PfEf4buZIynxEsg+I1I3SlO4BHOo+gcAZ8hOTgByrXSJQtoKlbYuUbn2
X-Received: by 2002:a05:6402:4248:: with SMTP id g8mr5304890edb.158.1636127647600;
        Fri, 05 Nov 2021 08:54:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1636127647; cv=none;
        d=google.com; s=arc-20160816;
        b=UHyEJDHz+pwa17Y2BQ3F9BhGZnGWrHs5mNrww7NPygl+q5mnlVTg3Z1wLnoM9IUamU
         wZtFrcxjT9aX91scBk7iUC24lkXiSfzU3LwTfiMz49PbGqkHWMfFmugTUGpsNzfxkxgd
         Jno1oL0TDFTWfKhvUyCvRUku2uhmxQkO7UkCWZ85uXslLpEjpmZdB+dW8WeNQ0ysi9Tu
         TgEhKWR6AlLetfaPjEiISeHeEMkoDrSdj/4hfYGzHEvrEszwTC2G/kWmxc4CGOKQf6tB
         XhYBHYE6jAooPT2iqNNG25mR7ZBg/ZVQAGpDDyaPMdXI6jzbkSp/Wc2kt5K5O5OlpbAG
         mWnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=kFrFw85Swr/akkG46HXBQV7M0KsUBD8gs8cLloPfCNU=;
        b=SKCfUAwU4P9/DQw1ITu7D7JRnrsBlntLjDhqsWAypdMSScS4BuEwP/Jzd13oKjOGMK
         6zaD86cmYPVJHfwhka9EgqCSPF/3G01uuit3SUgSNfw4yJfGyMTeZv1L87VDqsfCkRGk
         YvFLHmawH+XoEoeUk9qYrk80UXocBSNW8Qammj0VZaNHjN5cwxvtLHAPQXo4MfgQGz6E
         0OyhUJvJAsjeH9wVf/9RiHfeK/rhSry4kI1/yBrhjHy8/cqU6mUcP4gMle7f7DJHHb+E
         YtVwWl6TosNfREZnIyL/kiNKVv6lOkKE/GFJGHFQs7LvRnFDzulW9++eOlYxLZURa+n3
         VWZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="L/lAtozV";
       spf=pass (google.com: domain of willianr@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=willianr@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <willianr@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id e14si15006575eje.649.2021.11.05.08.54.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Nov 2021 08:54:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of willianr@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="L/lAtozV";
       spf=pass (google.com: domain of willianr@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=willianr@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636127646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kFrFw85Swr/akkG46HXBQV7M0KsUBD8gs8cLloPfCNU=;
	b=L/lAtozVwERbvzRNwCicN6ql9CwlYqxOrj9KY/L05OI63D0c49r9VI8iIY2+DY8s0d2zLg
	GNS9+fwcCQ4OyRScg2y5KcKxOtVkqNVgc0Dm40BdHAFrAWcNx84x8zgLbMBZ2xiG2Cn/Lz
	Gm24zeBBAuCYQwrgh8S0mulv/g3727A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-blMwn5AtOWyU67zfMuxXNw-1; Fri, 05 Nov 2021 11:54:03 -0400
X-MC-Unique: blMwn5AtOWyU67zfMuxXNw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C94701023F77;
	Fri,  5 Nov 2021 15:54:01 +0000 (UTC)
Received: from wrampazz.redhat.com (unknown [10.22.8.48])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5FADC7C05D;
	Fri,  5 Nov 2021 15:53:56 +0000 (UTC)
From: Willian Rampazzo <willianr@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	John Snow <jsnow@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-ppc@nongnu.org,
	Willian Rampazzo <willianr@redhat.com>,
	qemu-arm@nongnu.org,
	Cleber Rosa <crosa@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	libvir-list@redhat.com
Subject: [PATCH v2 0/2] tests/acceptance: rename tests acceptance to tests avocado
Date: Fri,  5 Nov 2021 12:53:52 -0300
Message-Id: <20211105155354.154864-1-willianr@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=willianr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 7GZU0uIhWB8y

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
pipelines/403056475=0D
=0D
Changes from v1:=0D
 - Split changes on Makefile leaving `check-acceptance` available and=0D
   adding a deprecate warning message when it is used.=0D
   (Suggested-by: Philippe Mathieu-Daud=C3=A9)=0D
 - Remove unrelated changes.=0D
=0D
Signed-off-by: Willian Rampazzo <willianr@redhat.com>=0D
=0D
Willian Rampazzo (2):=0D
  tests/acceptance: introduce new check-avocado tartget=0D
  tests/acceptance: rename tests acceptance to tests avocado=0D
=0D
 .gitlab-ci.d/buildtest-template.yml           |  2 +-=0D
 .gitlab-ci.d/buildtest.yml                    | 56 +++++++++----------=0D
 MAINTAINERS                                   | 52 ++++++++---------=0D
 configure                                     |  2 +-=0D
 docs/about/deprecated.rst                     | 13 +++++=0D
 docs/devel/build-system.rst                   |  2 +-=0D
 docs/devel/ci-definitions.rst.inc             |  2 +-=0D
 docs/devel/testing.rst                        | 49 ++++++++--------=0D
 docs/system/arm/orangepi.rst                  |  8 +--=0D
 python/qemu/machine/README.rst                |  2 +-=0D
 python/qemu/qmp/README.rst                    |  2 +-=0D
 python/qemu/utils/README.rst                  |  2 +-=0D
 tests/Makefile.include                        | 21 ++++---=0D
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
 tests/{acceptance =3D> avocado}/ppc_prep_40p.py |  0=0D
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
 65 files changed, 129 insertions(+), 110 deletions(-)=0D
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
 rename tests/{acceptance =3D> avocado}/ppc_prep_40p.py (100%)=0D
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
