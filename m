Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2245742lfp;
        Fri, 14 Feb 2020 10:37:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqzOiNuijHJG3Fz9TGPjzABG8Wb5aYEieCnYRnK5CZrXLDwrHZJ0nOo+ieePYShPUIDPjHh/
X-Received: by 2002:a05:6214:b82:: with SMTP id fe2mr3356334qvb.35.1581705457028;
        Fri, 14 Feb 2020 10:37:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581705457; cv=none;
        d=google.com; s=arc-20160816;
        b=usbySdHAQrvnlVIQD6tCEccNwwb2BgTtCO7huGD3VtbIa3+S68gPJbuZ9iMT8pNny6
         UeHj5wKbTu0B5aUxwkAFVleJ1lMJr8H1TB5YuxW3K4lYIOVbxw2YYawEJljkjVpiDAYW
         GMi2O5xX1SU42hx0dMYuxrc2F8WhVUMu1ckqvXnmn+r3OZtubXbKM9W8X2HTsLieRIGU
         lkesHoUzPWsB7odQilxNLvBMhXppVPcOCK14gbEN9d0W7G5Q1wa9u/cLjG5diFkVqR75
         cwhxYY6mSmH9U+pPF/u7Tamy/o6SwUC+NrlKWEPV0TBxXlmjrO1hkn04toZiy6+rLfoy
         lm1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=J8JFyNcBKEVf0+ZfUlZ1bPoepMkEMuoMLY4zs3mp+P0=;
        b=wsRI6ECBwV9C87fI1q0e7JJeqZ9HUm42i4T4id/ur/Xy+zxNwUGGDDK2lcIS9B1IcE
         NM7vX5F5BzquucK7cuc1qdxiqXfmJlM8AQALhjhY0ZsOTJz66OZl91WtP5Fa4dcTRMe2
         s1Ph3CAx7fOvU7/LibEsgbI2hxMl3GzXrJHntm3O4xz+fCVkqkGCsSIPe8XE5Vlk7LPD
         8NVM+GCbN6SywL9oRmVPgooMZGKPRi+2WQIeFKGNzqDpkMDL/hL00NpVGaAfwFLQ5+7s
         rka62pBvbxHUfHxZIKp6vWoPg4odM0VLNG2zaFZUF1UDD39FbouA2vtLIo1XYhMlHG8u
         u+uQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Cl/jetBI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j35si2899345qtb.298.2020.02.14.10.37.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 10:37:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Cl/jetBI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2fqK-0001QG-E5
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 13:37:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37020)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j2fqA-0001Ja-9q
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 13:37:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j2fq8-0003mf-VP
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 13:37:26 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53142
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j2fq8-0003mD-RC
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 13:37:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581705443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=J8JFyNcBKEVf0+ZfUlZ1bPoepMkEMuoMLY4zs3mp+P0=;
 b=Cl/jetBI/m+YU2mu1bSLPsEAbnA/CanZySYS8K16hwORuj/7HVB6FTKz4avbkI1dyOm6cS
 QSCEu12kLuxHDp9xwjdHPmLVQa0VArgN+3TwkgGuMPQ4ST13/0DKHWi/iUpCrt0A37L/lC
 oa9NJEvqoceIgD98hUtWgP3qk+KPkN8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-OKhxejXZM3GP_vUPq_wMJw-1; Fri, 14 Feb 2020 13:37:20 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF5951005510;
 Fri, 14 Feb 2020 18:37:18 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86AA65DA7D;
 Fri, 14 Feb 2020 18:37:07 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [RFC v2 0/6] vTPM for aarch64
Date: Fri, 14 Feb 2020 19:36:58 +0100
Message-Id: <20200214183704.14389-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: OKhxejXZM3GP_vUPq_wMJw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
X-TUID: rMfe39uyye10

This series adds the capability to instantiate an MMIO TPM TIS
in ARM virt.

The existing TPM TIS code is reshuffled into a generic part,
the ISA device and the sysbus device. The last patch allows
the instantiation of the TPM TIS sysbus device in ARM virt.

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
[3] [PATCH 0/4] ArmVirtPkg: implement measured boot for ArmVirtQemu

This series can be found at:
https://github.com/eauger/qemu/tree/v4.2.0-tpm-rfc-v2

History:

RFC v1 -> RFC v2:
- restructure the existing code with common, ISA and sysbus part.
- both ARM and x86 integration were tested.
- acknowledgement: migration has not been tested

Eric Auger (6):
  tpm: rename TPM_TIS into TPM_TIS_ISA
  tpm: Use TPMState as a common struct
  tpm: Separate tpm_tis common functions from isa code
  tpm: Separate TPM_TIS and TPM_TIS_ISA configs
  tpm: Add the SysBus TPM TIS device
  hw/arm/virt: vTPM support

 default-configs/i386-softmmu.mak       |   2 +-
 hw/arm/Kconfig                         |   1 +
 hw/arm/sysbus-fdt.c                    |  36 +++++
 hw/arm/virt.c                          |   7 +
 hw/i386/Kconfig                        |   2 +-
 hw/i386/acpi-build.c                   |   6 +-
 hw/tpm/Kconfig                         |  12 +-
 hw/tpm/Makefile.objs                   |   4 +-
 hw/tpm/tpm_tis.h                       |  91 +++++++++++++
 hw/tpm/{tpm_tis.c =3D> tpm_tis_common.c} | 181 ++-----------------------
 hw/tpm/tpm_tis_isa.c                   | 170 +++++++++++++++++++++++
 hw/tpm/tpm_tis_sysbus.c                | 159 ++++++++++++++++++++++
 include/sysemu/tpm.h                   |   7 +-
 tests/qtest/Makefile.include           |   4 +-
 14 files changed, 502 insertions(+), 180 deletions(-)
 create mode 100644 hw/tpm/tpm_tis.h
 rename hw/tpm/{tpm_tis.c =3D> tpm_tis_common.c} (85%)
 create mode 100644 hw/tpm/tpm_tis_isa.c
 create mode 100644 hw/tpm/tpm_tis_sysbus.c

--=20
2.20.1

