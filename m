Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2880220lfg;
        Wed, 26 Feb 2020 02:26:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqwJTs/5cpFayKvO4i3lF1ZhzDgD/wFlHTni8g852iEWF3Tk+iIWs43ZCVuA9+UMhUKHYshe
X-Received: by 2002:ac8:425a:: with SMTP id r26mr4368333qtm.138.1582712779583;
        Wed, 26 Feb 2020 02:26:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582712779; cv=none;
        d=google.com; s=arc-20160816;
        b=04w39D5ke4Ad2VdXBxSsTP3VPXxgzD3YX6oFVus6GdfVYoZf+QpxB8UD4vR/kD2lxm
         nBTVX1NIH5wxqsBzvcIirKrGSFq8TPD5vrwGsrhnFn1yWjUwpv41e6imCPVROGX4kj0z
         tI68GsqhLHuhFP4AAPug1+vAYCorC7wbgQyRlb+TggoJ9tnmlBWhFYgH935KyrmulTbx
         KIDIWBsV0bYv9mceLKV8PaYTa0ZTuhKn7lWDlscbNnJoPK8ToVV42Z1TtkOZbCWSFOEK
         ciMnRehYIaInXEDTv5r96mw8u4uH21jnhRNbb9Nj6JPAjdSzbByubgJkxyRCNj3AimpM
         bqxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=gJ991AWeGORxxc3l90wHyMn21NRdKrwVpcebZeWy3KE=;
        b=YI7FM5DNx0UbjinmZPkKrXdDZjjQ/hmcvAuGYEJ+z/liUtdn9dKGjnwKcl8QUYCd+Z
         O7jr3u1tmOs7CgiFamASyuFQvyuQfCvQcpOXfRGahZudZx5BpDRYT5tVsRRRBFVmuuMa
         lDb8g46nit0FPWioP7GWZCQeam06NZ8eSjfAzmW1m2Cr3j+bDAEEf4wxed9q2+s22Sbj
         zJIgJn5PoZVozZNOZpBxN6+3+WifHoBZ7e/kthGrmT2Btb8NvCd+ZdG5+UQY8m5QR2Q0
         exGWjl2D/w8y6qdXLhyG3Vo4/Mt4jfSXjKDw0ITsHO9ZTQUv9RJOr3aaVRceYUEys4es
         lFuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=F1nYNrfs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t195si759353qke.89.2020.02.26.02.26.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 02:26:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=F1nYNrfs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6ttT-00047F-0Y
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 05:26:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51934)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j6ttL-00046h-1Q
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 05:26:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j6ttJ-0003JR-Bn
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 05:26:10 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25829
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j6ttJ-0003JG-81
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 05:26:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582712768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gJ991AWeGORxxc3l90wHyMn21NRdKrwVpcebZeWy3KE=;
 b=F1nYNrfsH/i884Ke5+vsbiMmmLwbH5B7tbDxi8VOlF/1XHCqjhRSQx8K0VLBtk+ua2ngiS
 yY/9/rPe8JACq4aysidYimvrrp/PHDP8wjKH6MUuHiuZxjIzrc8pdjLa0xfB3fTDC9yx/e
 O+M+SIE7wNyeATjmJ5HqRgQBxMOFR58=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-A17QcKy6M_OoWIVTj4iMIQ-1; Wed, 26 Feb 2020 05:26:06 -0500
X-MC-Unique: A17QcKy6M_OoWIVTj4iMIQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D430107ACCD;
 Wed, 26 Feb 2020 10:26:05 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A91960BE1;
 Wed, 26 Feb 2020 10:25:57 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH v3 00/10] vTPM for aarch64
Date: Wed, 26 Feb 2020 11:25:39 +0100
Message-Id: <20200226102549.12158-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: marcandre.lureau@redhat.com, lersek@redhat.com, ardb@kernel.org,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GR72pzclKZRR

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
EDK2 support is under development [3]. Thanks to Ard
for supporting me when setting up the test environment.

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
[3] [PATCH v2 0/5] ArmVirtPkg: implement measured boot for ArmVirtQemu

This series can be found at:
https://github.com/eauger/qemu/tree/v4.2.0-tpm-patch-v3

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

 default-configs/i386-softmmu.mak        |   2 +-
 docs/specs/tpm.rst                      |  25 +-
 hw/arm/Kconfig                          |   1 +
 hw/arm/sysbus-fdt.c                     |  33 ++
 hw/arm/virt.c                           |   7 +
 hw/i386/Kconfig                         |   2 +-
 hw/i386/acpi-build.c                    |   6 +-
 hw/tpm/Kconfig                          |  12 +-
 hw/tpm/Makefile.objs                    |   4 +-
 hw/tpm/tpm_tis.h                        |  91 +++++
 hw/tpm/{tpm_tis.c =3D> tpm_tis_common.c}  | 181 +---------
 hw/tpm/tpm_tis_isa.c                    | 170 ++++++++++
 hw/tpm/tpm_tis_sysbus.c                 | 159 +++++++++
 include/sysemu/tpm.h                    |   7 +-
 tests/qtest/Makefile.include            |  11 +-
 tests/qtest/tpm-crb-swtpm-test.c        |   8 +-
 tests/qtest/tpm-crb-test.c              |   2 +
 tests/qtest/tpm-tests.c                 |  10 +-
 tests/qtest/tpm-tests.h                 |   5 +-
 tests/qtest/tpm-tis-device-swtpm-test.c |  76 +++++
 tests/qtest/tpm-tis-device-test.c       |  87 +++++
 tests/qtest/tpm-tis-swtpm-test.c        |   8 +-
 tests/qtest/tpm-tis-test.c              | 414 +---------------------
 tests/qtest/tpm-tis-util.c              | 433 ++++++++++++++++++++++++
 tests/qtest/tpm-tis-util.h              |  23 ++
 tests/qtest/tpm-util.c                  |  11 +-
 tests/qtest/tpm-util.h                  |   8 +-
 27 files changed, 1187 insertions(+), 609 deletions(-)
 create mode 100644 hw/tpm/tpm_tis.h
 rename hw/tpm/{tpm_tis.c =3D> tpm_tis_common.c} (85%)
 create mode 100644 hw/tpm/tpm_tis_isa.c
 create mode 100644 hw/tpm/tpm_tis_sysbus.c
 create mode 100644 tests/qtest/tpm-tis-device-swtpm-test.c
 create mode 100644 tests/qtest/tpm-tis-device-test.c
 create mode 100644 tests/qtest/tpm-tis-util.c
 create mode 100644 tests/qtest/tpm-tis-util.h

--=20
2.20.1

