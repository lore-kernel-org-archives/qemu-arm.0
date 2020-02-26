Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3634495lfg;
        Wed, 26 Feb 2020 14:44:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqza9MEvxMLWKhWwIGjKZ9BTWveUlRA+WdmB0foaIojn5/99pAIwQrDqFz4+gYuNcl1iqgFm
X-Received: by 2002:a05:620a:15b3:: with SMTP id f19mr1706721qkk.15.1582757073141;
        Wed, 26 Feb 2020 14:44:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582757073; cv=none;
        d=google.com; s=arc-20160816;
        b=I9lpEHPScswjE3nHrGzIjBnp1I9lwYPJROfqWHT7+SyW9Dgeu82fh3TVsTgXPxt1pN
         ZPN8oYKF+tlnhnPP7+aobOPWqXpH5Mo52AiXfdd7efUZCwJ6ZPMdvwz9GTyuvwkYl+93
         wLsxZI/5wdvmNxfclhp3FlWbFo4zufn+bIAAGgjvbvPHT70NObU7kGQlZ4ZrenRXPLJQ
         cyogbWpX8H+vKibGT9fsE8uS0IUXOlGO8bUh3aYP/NnsvrI9yvjfho3Sp4/982DUmtwU
         i5SUWUoS6MkxQfVPzM92dpfgM8mhYEiacCIfUA3T2glmxtaOgPpWFUTMvritqMKoKPvo
         kUpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=yUL50wnrA7AkMmW3SRSyuR09Fr0RgWKPTmShTSs4jus=;
        b=xanpB6gDpZhqO8UNPX9e6C5Jd87Z84X7dcRdlQv6aiKgCq9wAPYXPnwv6B4OObdAky
         bsSGij71s42QcKEOjjlwqgbFmoWAYCsk3YEMdkNiB74ANzbEIZdPVyPgGoNlszMrjb6V
         jsRy/Im2geGpPvPJQdgyszmc8gpzVS/KiPclTEBKqUUaTTO+otU+2FyM4FVBhAcNxyfN
         Unb9rfm8DFh+NhYPO9eJ9dg37lBkz7v/8PbA5OCwm0+gz0f/qzwsPAbS843iccaFpUe3
         /wtUxmM3gU6JH5ppk+gnUTAXEwtkwI8ty2U/FpQzcEA412rnTRj8Tft6eNu+VLcOSJV6
         WI8g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b3si477462qkh.286.2020.02.26.14.44.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 14:44:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:51010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j75Ps-0004q1-I5
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 17:44:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36610)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanb@linux.ibm.com>) id 1j75Pi-0004pm-0a
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 17:44:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanb@linux.ibm.com>) id 1j75Pg-0004ig-Gk
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 17:44:21 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:35703)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanb@linux.ibm.com>)
 id 1j75Pg-0004aa-7r; Wed, 26 Feb 2020 17:44:20 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01QMfnj7156416; Wed, 26 Feb 2020 17:44:17 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ydh91mx2v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2020 17:44:17 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01QMgRwT157720;
 Wed, 26 Feb 2020 17:44:16 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ydh91mx2h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2020 17:44:16 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01QMeYZE028220;
 Wed, 26 Feb 2020 22:44:15 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma05wdc.us.ibm.com with ESMTP id 2ydcmkrm0n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2020 22:44:15 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01QMiEZY48300340
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Feb 2020 22:44:14 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE73728059;
 Wed, 26 Feb 2020 22:44:14 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B8AD828058;
 Wed, 26 Feb 2020 22:44:14 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 26 Feb 2020 22:44:14 +0000 (GMT)
Subject: Re: [PATCH v4 00/10] vTPM for aarch64
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20200226205942.11424-1-eric.auger@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <4fb16117-f9d3-61af-9198-931590a46e3d@linux.ibm.com>
Date: Wed, 26 Feb 2020 17:44:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200226205942.11424-1-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-26_09:2020-02-26,
 2020-02-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 mlxscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002260135
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-001b2d01.pphosted.com id 01QMfnj7156416
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
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
X-TUID: oH8G3/x7kKnt

On 2/26/20 3:59 PM, Eric Auger wrote:
> This series adds the capability to instantiate an MMIO TPM TIS
> in ARM virt. It is candidate to qemu 5.0.

I queued it now here:=20
https://github.com/stefanberger/qemu-tpm/commits/tpm-next

I will send the PR within a few days. Thanks!

Cheers,

 =C2=A0=C2=A0 Stefan



>
> The existing TPM TIS code is reshuffled into a generic part,
> the ISA device and the sysbus device. The sysbus TPM-TIS
> device gets dynamically instantiated in machvirt on the
> platform bus.
>
> ACPI boot is not yet supported on ARM. Note that the UEFI
> firmware is itself a consumer of the DT description, so we
> need the DT related changes regardless of whether the VM
> boots in DT or ACPI mode.
>
> Related qtests are reshuffled to allow the reuse of existing
> tests for both the ISA and the sysbus devices: Adaption
> consists in changing the qemu command line (change in the
> device name and provide explicit machine options) and adapt
> to the relocation of the TPM-TIS device in the memory map.
>
> The series was tested with the swtpm/libtpms emulator.
> Automatic guest LUKS volume unlocking (tpm2) was successful.
> EDK2 support is under development [3]. Thanks to Ard
> for supporting me when setting up the test environment.
>
> Best Regards
>
> Eric
>
> Testing:
>
> mkdir /tmp/tpm
> swtpm socket \
> --tpm2 \
> -t -d \
> --tpmstate dir=3D/tmp/tpm \
> --ctrl type=3Dunixio,path=3D/tmp/swtpm-sock
>
> qemu command line must be augmented with the following options:
>
> -chardev socket,id=3Dchrtpm,path=3D/tmp/swtpm-sock \
> -tpmdev emulator,id=3Dtpm0,chardev=3Dchrtpm \
> -device tpm-tis-device,tpmdev=3Dtpm0 \
>
> References:
> [1] libtpms: https://github.com/stefanberger/libtpms/wiki
> [2] swtpm: https://github.com/stefanberger/swtpm/wiki
> [3] [PATCH v3 0/9] ArmVirtPkg: implement measured boot for ArmVirtQemu
>
> This series can be found at:
> https://github.com/eauger/qemu/tree/v4.2.0-tpm-patch-v4
>
> History:
>
> v3 -> v4:
> - collect additional R-b's
> - add 'Not used but needed for linking' mention related to
>    tpm_tis_base_addr in CRB test files
> - fix comment style
>
> RFCv2 -> PATCH v3:
> - Updated the doc for ARM
> - Adapted existing tests for ARM
> - use qemu_fdt_setprop_string in add_tpm_tis_fdt_node
> - Collected R-b's
> - Comments not taken into account:
>    - I have kept the tpm-tis-device name for now despite Stefan's
>      suggestion to rename it into tpm-tis-sysbus. This is not
>      frozen though
>    - Common state still is not a QOM object (no double inheritence)
>
> RFC v1 -> RFC v2:
> - restructure the existing code with common, ISA and sysbus part.
> - both ARM and x86 integration were tested.
>
> Eric Auger (10):
>    tpm: rename TPM_TIS into TPM_TIS_ISA
>    tpm: Use TPMState as a common struct
>    tpm: Separate tpm_tis common functions from isa code
>    tpm: Separate TPM_TIS and TPM_TIS_ISA configs
>    tpm: Add the SysBus TPM TIS device
>    hw/arm/virt: vTPM support
>    docs/specs/tpm: Document TPM_TIS sysbus device for ARM
>    test: tpm: pass optional machine options to swtpm test functions
>    test: tpm-tis: Get prepared to share tests between ISA and sysbus
>      devices
>    test: tpm-tis: Add Sysbus TPM-TIS device test
>
>   default-configs/i386-softmmu.mak        |   2 +-
>   docs/specs/tpm.rst                      |  25 +-
>   hw/arm/Kconfig                          |   1 +
>   hw/arm/sysbus-fdt.c                     |  33 ++
>   hw/arm/virt.c                           |   7 +
>   hw/i386/Kconfig                         |   2 +-
>   hw/i386/acpi-build.c                    |   6 +-
>   hw/tpm/Kconfig                          |  12 +-
>   hw/tpm/Makefile.objs                    |   4 +-
>   hw/tpm/tpm_tis.h                        |  91 +++++
>   hw/tpm/{tpm_tis.c =3D> tpm_tis_common.c}  | 181 +---------
>   hw/tpm/tpm_tis_isa.c                    | 170 +++++++++
>   hw/tpm/tpm_tis_sysbus.c                 | 159 +++++++++
>   include/sysemu/tpm.h                    |   7 +-
>   tests/qtest/Makefile.include            |  11 +-
>   tests/qtest/tpm-crb-swtpm-test.c        |   9 +-
>   tests/qtest/tpm-crb-test.c              |   3 +
>   tests/qtest/tpm-tests.c                 |  10 +-
>   tests/qtest/tpm-tests.h                 |   5 +-
>   tests/qtest/tpm-tis-device-swtpm-test.c |  76 ++++
>   tests/qtest/tpm-tis-device-test.c       |  87 +++++
>   tests/qtest/tpm-tis-swtpm-test.c        |   8 +-
>   tests/qtest/tpm-tis-test.c              | 414 +---------------------
>   tests/qtest/tpm-tis-util.c              | 451 +++++++++++++++++++++++=
+
>   tests/qtest/tpm-tis-util.h              |  23 ++
>   tests/qtest/tpm-util.c                  |  11 +-
>   tests/qtest/tpm-util.h                  |   8 +-
>   27 files changed, 1207 insertions(+), 609 deletions(-)
>   create mode 100644 hw/tpm/tpm_tis.h
>   rename hw/tpm/{tpm_tis.c =3D> tpm_tis_common.c} (85%)
>   create mode 100644 hw/tpm/tpm_tis_isa.c
>   create mode 100644 hw/tpm/tpm_tis_sysbus.c
>   create mode 100644 tests/qtest/tpm-tis-device-swtpm-test.c
>   create mode 100644 tests/qtest/tpm-tis-device-test.c
>   create mode 100644 tests/qtest/tpm-tis-util.c
>   create mode 100644 tests/qtest/tpm-tis-util.h
>

