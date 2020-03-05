Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp3149529lfi;
        Thu, 5 Mar 2020 09:06:21 -0800 (PST)
X-Google-Smtp-Source: ADFU+vu7EsCT89dm0ucNh3id6tcT+6ejYJn6/X19IpcTdJ32gc8tEzOXbhMolc5LuWmsQhQOxCJy
X-Received: by 2002:a0c:eb50:: with SMTP id c16mr4963910qvq.25.1583427981479;
        Thu, 05 Mar 2020 09:06:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583427981; cv=none;
        d=google.com; s=arc-20160816;
        b=rGe7NNIy3HTvxNZkKmlkuPUloFbNR+gRUeAN0H9lSyN+5fnZG06kBD8zBFbDRLdwez
         Wzt3ScUJU0MrIWwwPR/OddoDJhrARMNfEvotwgKXqHBh1jOlUQ6u94JxZRNzXBpxnTFu
         fm8Kix/Aqi6cCajqvxMCC/QpqNrSE4BoD8WVXRF1552J7npY6q7xTSelZaOofet/d+dO
         RhZgt746Z/5hMPmNaHM0X+exigNIqgg3tsqk9S20omcHA9b7BYLduYVm9k5HF1KHMokZ
         WSHA71ujgQ7hylO2Bg47Mc76yqvHurJcsT/BLArER6Dk0z8yVTXDMCV73Dob0abR1sVF
         Xgsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=8cL38r9cxiYQQfHCD9Jb/6kyOc/fYElccL153YTjP4c=;
        b=ibNOoHLxD9ZMrMX+kllfssO3jBt7sSSBHBN71NnHuDDR5+ZTp8F6+VlW0Lk68r0x63
         lLECLzt/fr4kB0XIiCU52RsIZlIvEfnheRHclQXsuYLwfS4gIHvwKM8gNPetb+XH7j6U
         e1tDkYoq42KvoNTWA30iCemMZ+ZVoLINHUavyWyU6ixGwJ8jNRKaE32SjOYstcoqJelZ
         fBQSIx9GRpoGCL8gA/ZwJHk3sooJhQaBEMZY4o3HtbiG64DA061wSs6dDrASg0wfp5rp
         v57kz1OtSZuEGYAGBBK0o0z2AvoNar4gfy0IZ3mTqYNXQR9xEwR00kIm4kOxLl7D2WVH
         a5XQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WFvxunTf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w14si3282106qkj.161.2020.03.05.09.06.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Mar 2020 09:06:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WFvxunTf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9twy-0004yt-V0
	for alex.bennee@linaro.org; Thu, 05 Mar 2020 12:06:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34490)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j9tjK-0004j8-SJ
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 11:52:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j9tjI-00076i-PR
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 11:52:14 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28227
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j9tjI-00075v-LW
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 11:52:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583427131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8cL38r9cxiYQQfHCD9Jb/6kyOc/fYElccL153YTjP4c=;
 b=WFvxunTfspaXMhB5rMyFJZLXW2utH7dE0+i+wD3HrHdSPooYr4RAqPrvStOnRD47Cvqvx1
 UxLdsTRe6anmU5/Rt9mXIcH8RkflcKlo+IQHqOYwDARJchxO5f+F5dHdlq3MjgI48njOrO
 X7IlUUIw4ZENF4L6NVIjGiF+/IVaAaY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-DG_q5HZFPL-z2obX_5GOFg-1; Thu, 05 Mar 2020 11:52:09 -0500
X-MC-Unique: DG_q5HZFPL-z2obX_5GOFg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D825D107ACC4;
 Thu,  5 Mar 2020 16:52:07 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59D3A39A;
 Thu,  5 Mar 2020 16:52:00 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH v5 00/10] vTPM for aarch64
Date: Thu,  5 Mar 2020 17:51:39 +0100
Message-Id: <20200305165149.618-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: marcandre.lureau@redhat.com, lersek@redhat.com, ardb@kernel.org,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YEnOlHbYPg2d

This series adds the capability to instantiate an MMIO TPM TIS
in ARM virt. It is candidate to qemu 5.0.

The existing TPM TIS code is reshuffled into a generic part,
the ISA device and the sysbus device. The sysbus TPM-TIS
device gets dynamically instantiated in machvirt on the
platform bus.

ACPI boot is not yet supported on ARM. Note that the UEFI
firmware is itself a consumer of the DT description, so we
need the DT related changes regardless of whether the VM
boots in DT or ACPI mode.

Related qtests are reshuffled to allow the reuse of existing
tests for both the ISA and the sysbus devices: Adaption
consists in changing the qemu command line (change in the
device name and provide explicit machine options) and adapt
to the relocation of the TPM-TIS device in the memory map.

The series was tested with the swtpm/libtpms emulator.
Automatic guest LUKS volume unlocking (tpm2) was successful.
Thanks to Ard for supporting me when setting up the test
environment.

Best Regards

Eric

Testing:

mkdir /tmp/tpm
swtpm socket \
--tpm2 \
-t -d \
--tpmstate dir=3D/tmp/tpm \
--ctrl type=3Dunixio,path=3D/tmp/swtpm-sock

qemu command line must be augmented with the following options:

-chardev socket,id=3Dchrtpm,path=3D/tmp/swtpm-sock \
-tpmdev emulator,id=3Dtpm0,chardev=3Dchrtpm \
-device tpm-tis-device,tpmdev=3Dtpm0 \

References:
[1] libtpms: https://github.com/stefanberger/libtpms/wiki
[2] swtpm: https://github.com/stefanberger/swtpm/wiki

This series can be found at:
https://github.com/eauger/qemu/tree/v4.2.0-tpm-patch-v5

History:

v4 -> v5:
- Fix osx make check error in
  [PATCH v4 06/10] hw/arm/virt: vTPM support
  (put TYPE_BINDING(TYPE_TPM_TIS_SYSBUS, add_tpm_tis_fdt_node)
   outside of CONFIG_LINUX)
  Tested with make vm-build-openbsd

v3 -> v4:
- collect additional R-b's
- add 'Not used but needed for linking' mention related to
  tpm_tis_base_addr in CRB test files
- fix comment style

RFCv2 -> PATCH v3:
- Updated the doc for ARM
- Adapted existing tests for ARM
- use qemu_fdt_setprop_string in add_tpm_tis_fdt_node
- Collected R-b's
- Comments not taken into account:
  - I have kept the tpm-tis-device name for now despite Stefan's
    suggestion to rename it into tpm-tis-sysbus. This is not
    frozen though
  - Common state still is not a QOM object (no double inheritence)

RFC v1 -> RFC v2:
- restructure the existing code with common, ISA and sysbus part.
- both ARM and x86 integration were tested.


Eric Auger (10):
  tpm: rename TPM_TIS into TPM_TIS_ISA
  tpm: Use TPMState as a common struct
  tpm: Separate tpm_tis common functions from isa code
  tpm: Separate TPM_TIS and TPM_TIS_ISA configs
  tpm: Add the SysBus TPM TIS device
  hw/arm/virt: vTPM support
  docs/specs/tpm: Document TPM_TIS sysbus device for ARM
  test: tpm: pass optional machine options to swtpm test functions
  test: tpm-tis: Get prepared to share tests between ISA and sysbus
    devices
  test: tpm-tis: Add Sysbus TPM-TIS device test

 docs/specs/tpm.rst                      |  25 +-
 default-configs/i386-softmmu.mak        |   2 +-
 hw/tpm/tpm_tis.h                        |  91 +++++
 include/sysemu/tpm.h                    |   7 +-
 tests/qtest/tpm-tests.h                 |   5 +-
 tests/qtest/tpm-tis-util.h              |  23 ++
 tests/qtest/tpm-util.h                  |   8 +-
 hw/arm/sysbus-fdt.c                     |  33 ++
 hw/arm/virt.c                           |   7 +
 hw/i386/acpi-build.c                    |   6 +-
 hw/tpm/{tpm_tis.c =3D> tpm_tis_common.c}  | 181 +---------
 hw/tpm/tpm_tis_isa.c                    | 170 +++++++++
 hw/tpm/tpm_tis_sysbus.c                 | 159 +++++++++
 tests/qtest/tpm-crb-swtpm-test.c        |   9 +-
 tests/qtest/tpm-crb-test.c              |   3 +
 tests/qtest/tpm-tests.c                 |  10 +-
 tests/qtest/tpm-tis-device-swtpm-test.c |  76 ++++
 tests/qtest/tpm-tis-device-test.c       |  87 +++++
 tests/qtest/tpm-tis-swtpm-test.c        |   8 +-
 tests/qtest/tpm-tis-test.c              | 414 +---------------------
 tests/qtest/tpm-tis-util.c              | 451 ++++++++++++++++++++++++
 tests/qtest/tpm-util.c                  |  11 +-
 hw/arm/Kconfig                          |   1 +
 hw/i386/Kconfig                         |   2 +-
 hw/tpm/Kconfig                          |  12 +-
 hw/tpm/Makefile.objs                    |   4 +-
 tests/qtest/Makefile.include            |  11 +-
 27 files changed, 1207 insertions(+), 609 deletions(-)
 create mode 100644 hw/tpm/tpm_tis.h
 create mode 100644 tests/qtest/tpm-tis-util.h
 rename hw/tpm/{tpm_tis.c =3D> tpm_tis_common.c} (85%)
 create mode 100644 hw/tpm/tpm_tis_isa.c
 create mode 100644 hw/tpm/tpm_tis_sysbus.c
 create mode 100644 tests/qtest/tpm-tis-device-swtpm-test.c
 create mode 100644 tests/qtest/tpm-tis-device-test.c
 create mode 100644 tests/qtest/tpm-tis-util.c

--=20
2.20.1

