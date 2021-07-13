Received: by 2002:a0c:fe44:0:0:0:0:0 with SMTP id u4csp1026265qvs;
        Tue, 13 Jul 2021 14:19:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoVMh+yVt2OjvZo6PhehqLmDF2utYnUmg3XTd4vPtWpThgEOrcTvk9UFIc261gAlFZEFxA
X-Received: by 2002:a05:6402:1c19:: with SMTP id ck25mr8485012edb.128.1626211191447;
        Tue, 13 Jul 2021 14:19:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626211191; cv=none;
        d=google.com; s=arc-20160816;
        b=hr4I/ss/sr8rALsnVPVvwFmuLFKq29hEiF/3zXFHv3L+0NaZPYp73d4tYu0pqKi6tj
         lkFfUFKsAOesI53TXUgKIWKeseec3GwgdZw2637Kw0RPgOhR2wHPmpUWQMc2pkjtjF60
         poLuZiW6HfONcPRk4xcVrDCvg1FE+4B2CK6GSlh17M7fnbf0XWwTrA6R2VWP/7czsIwE
         7iv0G1TYTrs5VyOPdNMAmnEUSJuaaqxVD06NWVNS1zjqP+qUlMkbR85oxzlslqdYfqnm
         vxYCvqErqQ0ZL17qZ8D7RxXRSjrmShxSc8qhz0CpnE0FfR14JAxmayBiOcUcxv7sNpZv
         5fJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=TRw2JWAFiZW1xwot6O1tpJeMWowi6ioBe8SxCUBf3gQ=;
        b=KdBeMoOe8ikHgLbkNh0EL7PlPme4apTQr0SNQGkl+5sCdWCegatv7On4kdlHWduP9A
         g+Wxx0qWiL+CT8aKjEetiG5EmPGihTZLLfl9attrAnXoS31VvesCjaYzCX83r2Z6WDTm
         uWc772xXk0C55LE6ZeXENxEBkDt/QWGIM/HI1ebDGfYJnsjvqh2WZ5ByQYXfGPl9WU4k
         v47XqlxFz3MdTKGe8gbJzjL9kE6nNuxABF11gYFL3Axq+Cx3cwh23+p1T6kCDnc+0ehC
         Wm8z5ntGgKLYm/QrisM8Zjn10zbokvqf9+YLDiCaRMKHUxZp3vYfM83a00OMf8W4Zf+r
         JnOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RKGO6CEp;
       spf=pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id s22si21971603edr.67.2021.07.13.14.19.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Jul 2021 14:19:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RKGO6CEp;
       spf=pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626211190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TRw2JWAFiZW1xwot6O1tpJeMWowi6ioBe8SxCUBf3gQ=;
	b=RKGO6CEpLGeMoAEB0kqp4F+pi+yfbMHp7m1Sd8weMnxMWi9U3N0/erNhvCPlpP5Y1odTXa
	amJ1eUCPpAfmYyyuQ5hPiB2phzIM2UDgcUu3fGj08Aky1v6bUaIzXtBDIZh+HsQf8jUiZt
	Aj0Uq8kT77zhQ91qRd/JTdHxxg2txIg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-5EHMeTpJNUSvrcIR9PKLbw-1; Tue, 13 Jul 2021 17:19:49 -0400
X-MC-Unique: 5EHMeTpJNUSvrcIR9PKLbw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59FA9804307;
	Tue, 13 Jul 2021 21:19:46 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 868C019C45;
	Tue, 13 Jul 2021 21:19:29 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Ryo ONODERA <ryoon@netbsd.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Willian Rampazzo <willianr@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	John Snow <jsnow@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Willian Rampazzo <wrampazz@redhat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Beraldo Leal <bleal@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	qemu-arm@nongnu.org,
	Eric Auger <eric.auger@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-ppc@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Thomas Huth <thuth@redhat.com>,
	Kamil Rytarowski <kamil@netbsd.org>,
	Cleber Rosa <crosa@redhat.com>
Subject: [PULL 00/23] Python and Acceptance Tests
Date: Tue, 13 Jul 2021 17:19:00 -0400
Message-Id: <20210713211923.3809241-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: at4D9abKLlmj

The following changes since commit 708f50199b59476ec4b45ebcdf171550086d6292=
:=0D
=0D
  Merge remote-tracking branch 'remotes/ericb/tags/pull-nbd-2021-07-09-v2' =
into staging (2021-07-13 14:32:20 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/cleber.gnu/qemu.git/ tags/python-next-pull-request=0D
=0D
for you to fetch changes up to c4e2d499c94fb7d6ea43d28e2613559861ef5d79:=0D
=0D
  tests/acceptance/cpu_queries.py: use the proper logging channels (2021-07=
-13 16:27:43 -0400)=0D
=0D
----------------------------------------------------------------=0D
Python and Acceptance Tests=0D
=0D
- New SMMUv3 and Intel IOMMU tests=0D
- Respect "cpu" tags and reduce boiler plate code=0D
- Improved logging of qemu execution output=0D
- Other misc improvements=0D
=0D
----------------------------------------------------------------=0D
=0D
Cleber Rosa (9):=0D
  Acceptance Tests: use the job work directory for created VMs=0D
  Acceptance Tests: log information when creating QEMUMachine=0D
  Acceptance Tests: distinguish between temp and logs dir=0D
  Acceptance Tests: rename attribute holding the distro image checksum=0D
  Acceptance Tests: move definition of distro checksums to the framework=0D
  Acceptance Tests: support choosing specific distro and version=0D
  Acceptance tests: do not try to reuse packages from the system=0D
  tests/acceptance/linux_ssh_mips_malta.py: drop identical setUp=0D
  tests/acceptance/cpu_queries.py: use the proper logging channels=0D
=0D
Eric Auger (2):=0D
  avocado_qemu: Add SMMUv3 tests=0D
  avocado_qemu: Add Intel iommu tests=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  tests/acceptance: Ignore binary data sent on serial console=0D
  tests/acceptance: Tag NetBSD tests as 'os:netbsd'=0D
=0D
Wainer dos Santos Moschetta (8):=0D
  tests/acceptance: Automatic set -cpu to the test vm=0D
  tests/acceptance: Fix mismatch on cpu tagged tests=0D
  tests/acceptance: Let the framework handle "cpu:VALUE" tagged tests=0D
  tests/acceptance: Tagging tests with "cpu:VALUE"=0D
  python/qemu: Add args property to the QEMUMachine class=0D
  tests/acceptance: Add set_vm_arg() to the Test class=0D
  tests/acceptance: Handle cpu tag on x86_cpu_model_versions tests=0D
  python: Configure tox to skip missing interpreters=0D
=0D
Willian Rampazzo (2):=0D
  avocado_qemu: Fix KNOWN_DISTROS map into the LinuxDistro class=0D
  Acceptance Tests: Add default kernel params and pxeboot url to the=0D
    KNOWN_DISTROS collection=0D
=0D
 .gitlab-ci.d/static_checks.yml             |   1 +=0D
 MAINTAINERS                                |   1 +=0D
 docs/devel/testing.rst                     |  82 ++++++++++=0D
 python/Makefile                            |   5 +-=0D
 python/qemu/machine/machine.py             |  22 ++-=0D
 python/setup.cfg                           |   1 +=0D
 tests/Makefile.include                     |   2 +-=0D
 tests/acceptance/avocado_qemu/__init__.py  | 179 +++++++++++++++++++--=0D
 tests/acceptance/boot_linux.py             |  11 --=0D
 tests/acceptance/boot_linux_console.py     |  14 +-=0D
 tests/acceptance/boot_xen.py               |   1 -=0D
 tests/acceptance/cpu_queries.py            |   4 +-=0D
 tests/acceptance/intel_iommu.py            | 119 ++++++++++++++=0D
 tests/acceptance/linux_ssh_mips_malta.py   |   7 +-=0D
 tests/acceptance/machine_mips_malta.py     |   7 +-=0D
 tests/acceptance/pc_cpu_hotplug_props.py   |   2 +-=0D
 tests/acceptance/ppc_prep_40p.py           |   2 +=0D
 tests/acceptance/replay_kernel.py          |  17 +-=0D
 tests/acceptance/reverse_debugging.py      |   2 +-=0D
 tests/acceptance/smmu.py                   | 137 ++++++++++++++++=0D
 tests/acceptance/tcg_plugins.py            |  15 +-=0D
 tests/acceptance/virtio-gpu.py             |   4 +-=0D
 tests/acceptance/x86_cpu_model_versions.py |  40 ++++-=0D
 23 files changed, 603 insertions(+), 72 deletions(-)=0D
 create mode 100644 tests/acceptance/intel_iommu.py=0D
 create mode 100644 tests/acceptance/smmu.py=0D
=0D
--=20=0D
2.31.1=0D
=0D
