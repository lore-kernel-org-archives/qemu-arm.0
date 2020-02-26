Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3539847lfg;
        Wed, 26 Feb 2020 13:00:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqwW0FuOF6fc2BNC2irqINMJ4/4sPBNxxP5HB3/a3zempW2u0+t7JqRqhcME8J7TSHUIizq3
X-Received: by 2002:ae9:e410:: with SMTP id q16mr1239110qkc.399.1582750818529;
        Wed, 26 Feb 2020 13:00:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582750818; cv=none;
        d=google.com; s=arc-20160816;
        b=zrVmlgjwSSit1jBcrOXgMZAjhrKFXy8GI2GY40Cln7/16IiCB9GoXqNoykQYR7L5w0
         cf2ykV0nk93/OF+GUCOaQgNR29PV1TQtsSNgbepX8k1uHznP7ynyxjt5W8+7GD3tK6lS
         yydc4yi40KhwojcTixR3KQZLaJ+2Lo0rVfwFr2d7Q/yIJltVeHp6xh6GNmBeb8mNsrhU
         DFgizbqO5YVbE/dsM/wlziFOsEtNxEXSSveGS4YZ7+cwLvMgNh0ITAyec3v6hvvkB/SE
         I6Ls7W4LdL+wpDV3gzITDq1gWS+NFVH2XgWDlYOltSIqTpFOmkFgGJLsC0NaS6A4et2g
         LxsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=0YKMlyGuoIcwWg/c6bXsYuxY7W4Gnue7WrH8sG32TrY=;
        b=qOmRMVts5Lzppxbo1xShnruLQudxzIyf4IID5gJrTBf6gSI7obhQ6w70FXGGonWEdP
         EDTu6OTJfLPXAKUMuR61yj69Rntturmo4RM+UfW4OsAwN5U7BmCk3LtxvSu4EZzr3HXL
         82SXhfOLJZbLY7RDrePpInWXEEXo9EMEjhFd5T9G59RfTLkr3d9gKiPhw6FPINVGlsJg
         FHhAVObLjIFp1+fZNBzI7bBugvlOaa917ykCopSCBo1pYU79F55zk5pnClxNfY1X6ema
         Kxzn3iosFe3u/Jn5idGTFH3mVhMstqmhoHL1dj3BkAqyzt5KQ10dVJmdpmaFBKxDb3VO
         gzsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MpbbY2j5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h20si304307qtq.373.2020.02.26.13.00.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 13:00:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MpbbY2j5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j73my-0006PS-OA
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 16:00:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45569)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j73ml-0006M3-Iw
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 16:00:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j73mj-00024r-61
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 16:00:02 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:40024
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j73mj-00023z-1u
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 16:00:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582750800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0YKMlyGuoIcwWg/c6bXsYuxY7W4Gnue7WrH8sG32TrY=;
 b=MpbbY2j5UrnXnTIuUYs/ggJc80RfUK/VeIm2nL/27qKP7vFvCg7W9a0E21PDH+qRM5FGjk
 IS2Af8djBsPo4y4ZgKzGR0Ai2vpAv3iNld1G5HvMMwQzm64WckAm1/V2vKGWBkbrefWCgY
 TiehG/mHs46Mp4szfoy/LDhX/bQVPi4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-E3tT7AL8M7GgzTNvOlWObQ-1; Wed, 26 Feb 2020 15:59:57 -0500
X-MC-Unique: E3tT7AL8M7GgzTNvOlWObQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90BC6800D5A;
 Wed, 26 Feb 2020 20:59:56 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D6605C578;
 Wed, 26 Feb 2020 20:59:48 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH v4 00/10] vTPM for aarch64
Date: Wed, 26 Feb 2020 21:59:32 +0100
Message-Id: <20200226205942.11424-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: marcandre.lureau@redhat.com, lersek@redhat.com, ardb@kernel.org,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GRvaQoOM1Ins

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
[3] [PATCH v3 0/9] ArmVirtPkg: implement measured boot for ArmVirtQemu

This series can be found at:
https://github.com/eauger/qemu/tree/v4.2.0-tpm-patch-v4

History:

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
 hw/tpm/tpm_tis_isa.c                    | 170 +++++++++
 hw/tpm/tpm_tis_sysbus.c                 | 159 +++++++++
 include/sysemu/tpm.h                    |   7 +-
 tests/qtest/Makefile.include            |  11 +-
 tests/qtest/tpm-crb-swtpm-test.c        |   9 +-
 tests/qtest/tpm-crb-test.c              |   3 +
 tests/qtest/tpm-tests.c                 |  10 +-
 tests/qtest/tpm-tests.h                 |   5 +-
 tests/qtest/tpm-tis-device-swtpm-test.c |  76 ++++
 tests/qtest/tpm-tis-device-test.c       |  87 +++++
 tests/qtest/tpm-tis-swtpm-test.c        |   8 +-
 tests/qtest/tpm-tis-test.c              | 414 +---------------------
 tests/qtest/tpm-tis-util.c              | 451 ++++++++++++++++++++++++
 tests/qtest/tpm-tis-util.h              |  23 ++
 tests/qtest/tpm-util.c                  |  11 +-
 tests/qtest/tpm-util.h                  |   8 +-
 27 files changed, 1207 insertions(+), 609 deletions(-)
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

