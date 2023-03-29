Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp417635ejb;
        Wed, 29 Mar 2023 04:05:04 -0700 (PDT)
X-Google-Smtp-Source: AKy350aPg87derjW9kt/SGAnqrDjZvlBLI+UlQBrK0H9WbO6CaAILtImOlNedFSI/x8WJ6I19Gnj
X-Received: by 2002:a0d:d9d7:0:b0:543:8177:5c6b with SMTP id b206-20020a0dd9d7000000b0054381775c6bmr19899685ywe.29.1680087904331;
        Wed, 29 Mar 2023 04:05:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680087904; cv=none;
        d=google.com; s=arc-20160816;
        b=tmye0f67Rr2V8AwQdU5kjC1tyLwIH14+qLrPOXyyPcorCplnMmxOggAC0wbuGroi2z
         IH2Uk3WmD/8Ir9ZpHzDDD73vS7Kz9CKsws48c7JGbyUmigrUSNPrAwj5D/1z2R3VHQdx
         WtDOlxRzHIoeQsz8+DH5Ycpd/k5yp3MczjY6Rj+tCTjkUB4lVhrUA3Vet+ZnaMXNsyqp
         C/fnD2JzbFeCpO81yqh3GRrgyCLQnwKz+Ni7U7eoeYXDo8MZtsk4BBC/mNY5XbtqVagN
         QdswMRptp7Vwaz9k3oKZ0GctliZQGpA06/Ed+NFpt5Rhbf2R7X4L2R4bndtl/Te7Mtn2
         v+1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=7vGx9nV4hIq5YcjZHTKtM2oN+yrThnxSO/tqC5oahQQ=;
        b=z9XNJ92Vb+p3ODqxZyxurmREiUbqB3dMHARwSIHZ/sBQydMzwd4BnZNci5kONR+f9C
         MeftQz5wKsR8u9Dz0KNrDtRAfpPco35Zbg8wcP7MhBA+G4w0CjKh3WaGdpW8oq2YWTQW
         2Tp+mWdqdMZ4BBCjTL6f0kJpDZNhCbOQ+tvxZ1Z/13/3LH0TRwB08HMZBlOoP7A23oCe
         8ml0OxKcWn/OdmVAlpzoO27POf8emSDpHroW5vlFU0sOOy/PxH9IopNPVgFv5/pQ3Pqd
         BrWc4B8HqQ3+xxeqq0vxM2Easuu5nTHdup5c53TEszvV/npq87lvRCOoKvI4fdVDBj9P
         pm1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=BkisxUfa;
       spf=pass (google.com: domain of quic_llindhol@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_llindhol@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <quic_llindhol@quicinc.com>
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com. [205.220.180.131])
        by mx.google.com with ESMTPS id s19-20020a81bf53000000b00506396fbb1esi39000271ywk.475.2023.03.29.04.05.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Mar 2023 04:05:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of quic_llindhol@quicinc.com designates 205.220.180.131 as permitted sender) client-ip=205.220.180.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=BkisxUfa;
       spf=pass (google.com: domain of quic_llindhol@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_llindhol@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32TB1mf2010338;
	Wed, 29 Mar 2023 11:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=qcppdkim1;
 bh=7vGx9nV4hIq5YcjZHTKtM2oN+yrThnxSO/tqC5oahQQ=;
 b=BkisxUfafhz4xFl2QMjrbR9pqoJ4tJd/9/Iak1gp33ENMlYZ7Xm+WDxilvimG87DZTVC
 F2gEdnWoDntyXp3BeOdYCG7hmZhDxVWFKq984LaQenYutU+RXAkj0ibn57LcvUcbUgo+
 Bdu6FAPSuYV8h7Imidn1qcPCHFApR+SU7dWmsNqpZ7SqLlTux3xyfUV44GaNwz33bsgo
 WBpYtXK8bqMSbuMfvJ7xnwRCKVRkK1TJJJr9722bQQfGsATUo7xgaALiFkAd3SLd5UxU
 50krfMJDvNSenU/L90dxYO7aGsDZTYz48DXWMkQNfqdhRWl1L7jXeZcQ8Sgik8yemPdc 5w== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pkx0fua21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Mar 2023 11:05:03 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32TB52OR012116
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Mar 2023 11:05:02 GMT
Received: from qc-i7.hemma.eciton.net (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 29 Mar 2023 04:04:59 -0700
Date: Wed, 29 Mar 2023 12:04:56 +0100
From: Leif Lindholm <quic_llindhol@quicinc.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
CC: <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
        Beraldo Leal
	<bleal@redhat.com>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        Peter Maydell <peter.maydell@linaro.org>,
        Radoslaw Biernacki
	<rad@semihalf.com>,
        Wainer dos Santos Moschetta <wainersm@redhat.com>,
        <qemu-arm@nongnu.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: Re: [PATCH v3] tests/avocado: Add set of boot tests on SBSA-ref
Message-ID: <ZCQbWI6cai7GspUa@qc-i7.hemma.eciton.net>
References: <20230328171426.14258-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230328171426.14258-1-philmd@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qD0dezikaio9s-68xVa3nZtkbpfCDpBw
X-Proofpoint-GUID: qD0dezikaio9s-68xVa3nZtkbpfCDpBw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_04,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 adultscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 clxscore=1011 bulkscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303290092
X-TUID: ND8Jpw6EZ6FY

On Tue, Mar 28, 2023 at 19:14:26 +0200, Philippe Mathieu-Daudé wrote:
> This change adds set of boot tests on SBSA-ref machine:
> 
> 1. boot firmware up to the EDK2 banner
> 2. boot Alpine Linux
> 
> Prebuilt flash volumes are included, built using upstream documentation.
> 
> To unify tests for AArch64/virt and AArch64/sbsa-ref we boot
> the same Alpine Linux image on both.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Message-Id: <20230323082813.971535-1-marcin.juszkiewicz@linaro.org>

Thanks for this.
Reviewed-by: Leif Lindholm <quic_llindhol@quicinc.com>

> ---
> Since v2:
> - Use Alpine sha256
> - Use @skip* decorators
> - Run black indenter
> 
> $ AVOCADO_TIMEOUT_EXPECTED=1 avocado --show=app run -t machine:sbsa-ref tests/avocado/machine_aarch64_sbsaref.py
> JOB ID     : b6682352323bc601f49a2b247cfe388b4b09047f
> JOB LOG    : /home/philippe.mathieu-daude/avocado/job-results/job-2023-03-28T15.29-b668235/job.log
>  (1/4) tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_sbsaref_edk2_firmware: PASS (5.85 s)
>  (2/4) tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_sbsaref_alpine_linux_cortex_a57: PASS (118.45 s)
>  (3/4) tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_sbsaref_alpine_linux_neoverse_n1: PASS (119.22 s)
>  (4/4) tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_sbsaref_alpine_linux_max: SKIP: requires TF-A update to handle FEAT_FGT
> RESULTS    : PASS 3 | ERROR 0 | FAIL 0 | SKIP 1 | WARN 0 | INTERRUPT 0 | CANCEL 0
> JOB TIME   : 244.32 s
> ---
>  MAINTAINERS                              |   1 +
>  tests/avocado/machine_aarch64_sbsaref.py | 158 +++++++++++++++++++++++
>  2 files changed, 159 insertions(+)
>  create mode 100644 tests/avocado/machine_aarch64_sbsaref.py
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ef45b5e71e..ee4bd28205 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -928,6 +928,7 @@ L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/arm/sbsa-ref.c
>  F: docs/system/arm/sbsa.rst
> +F: tests/avocado/machine_aarch64_sbsaref.py
>  
>  Sharp SL-5500 (Collie) PDA
>  M: Peter Maydell <peter.maydell@linaro.org>
> diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
> new file mode 100644
> index 0000000000..0a79fa7ab6
> --- /dev/null
> +++ b/tests/avocado/machine_aarch64_sbsaref.py
> @@ -0,0 +1,158 @@
> +# Functional test that boots a Linux kernel and checks the console
> +#
> +# SPDX-FileCopyrightText: 2023 Linaro Ltd.
> +# SPDX-FileContributor: Philippe Mathieu-Daudé <philmd@linaro.org>
> +# SPDX-FileContributor: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +import os
> +
> +from avocado import skip
> +from avocado import skipUnless
> +from avocado.utils import archive
> +
> +from avocado_qemu import QemuSystemTest
> +from avocado_qemu import wait_for_console_pattern
> +from avocado_qemu import interrupt_interactive_console_until_pattern
> +
> +
> +class Aarch64SbsarefMachine(QemuSystemTest):
> +    """
> +    :avocado: tags=arch:aarch64
> +    :avocado: tags=machine:sbsa-ref
> +    """
> +
> +    timeout = 180
> +
> +    def fetch_firmware(self):
> +        """
> +        Flash volumes generated using:
> +
> +        - Fedora GNU Toolchain version 12.2.1 20220819 (Red Hat Cross 12.2.1-2)
> +
> +        - Trusted Firmware-A
> +          https://github.com/ARM-software/arm-trusted-firmware/tree/5fdb2e54
> +
> +        - Tianocore EDK II
> +          https://github.com/tianocore/edk2/tree/494127613b
> +          https://github.com/tianocore/edk2-non-osi/tree/41876073
> +          https://github.com/tianocore/edk2-platforms/tree/8efa4f42
> +        """
> +
> +        # Secure BootRom (TF-A code)
> +        fs0_xz_url = (
> +            "https://fileserver.linaro.org/s/ATnSmq6k8SoXgbH/"
> +            "download/SBSA_FLASH0.fd.xz"
> +        )
> +        fs0_xz_hash = "a210a09692bcbe0a3743ffd0df44e80e0c7ad8ab"
> +        tar_xz_path = self.fetch_asset(fs0_xz_url, asset_hash=fs0_xz_hash)
> +        archive.extract(tar_xz_path, self.workdir)
> +        fs0_path = os.path.join(self.workdir, "SBSA_FLASH0.fd")
> +
> +        # Non-secure rom (UEFI and EFI variables)
> +        fs1_xz_url = (
> +            "https://fileserver.linaro.org/s/t8foNnMPz74DZZy/"
> +            "download/SBSA_FLASH1.fd.xz"
> +        )
> +        fs1_xz_hash = "13a9a262953787c7fc5a9155dfaa26e703631e02"
> +        tar_xz_path = self.fetch_asset(fs1_xz_url, asset_hash=fs1_xz_hash)
> +        archive.extract(tar_xz_path, self.workdir)
> +        fs1_path = os.path.join(self.workdir, "SBSA_FLASH1.fd")
> +
> +        for path in [fs0_path, fs1_path]:
> +            with open(path, "ab+") as fd:
> +                fd.truncate(256 << 20)  # Expand volumes to 256MiB
> +
> +        self.vm.set_console()
> +        self.vm.add_args(
> +            "-drive",
> +            f"if=pflash,file={fs0_path},format=raw",
> +            "-drive",
> +            f"if=pflash,file={fs1_path},format=raw",
> +            "-smp",
> +            "1",
> +            "-machine",
> +            "sbsa-ref",
> +        )
> +
> +    def test_sbsaref_edk2_firmware(self):
> +        """
> +        :avocado: tags=cpu:cortex-a57
> +        """
> +
> +        self.fetch_firmware()
> +        self.vm.launch()
> +
> +        # TF-A boot sequence:
> +        #
> +        # https://github.com/ARM-software/arm-trusted-firmware/blob/v2.8.0/\
> +        #     docs/design/trusted-board-boot.rst#trusted-board-boot-sequence
> +        # https://trustedfirmware-a.readthedocs.io/en/v2.8/\
> +        #     design/firmware-design.html#cold-boot
> +
> +        # AP Trusted ROM
> +        wait_for_console_pattern(self, "Booting Trusted Firmware")
> +        wait_for_console_pattern(self, "BL1: v2.8(release):v2.8")
> +        wait_for_console_pattern(self, "BL1: Booting BL2")
> +
> +        # Trusted Boot Firmware
> +        wait_for_console_pattern(self, "BL2: v2.8(release)")
> +        wait_for_console_pattern(self, "Booting BL31")
> +
> +        # EL3 Runtime Software
> +        wait_for_console_pattern(self, "BL31: v2.8(release)")
> +
> +        # Non-trusted Firmware
> +        wait_for_console_pattern(self, "UEFI firmware (version 1.0")
> +        interrupt_interactive_console_until_pattern(self, "QEMU SBSA-REF Machine")
> +
> +    # This tests the whole boot chain from EFI to Userspace
> +    # We only boot a whole OS for the current top level CPU and GIC
> +    # Other test profiles should use more minimal boots
> +    def boot_alpine_linux(self, cpu):
> +        self.fetch_firmware()
> +
> +        iso_url = (
> +            "https://dl-cdn.alpinelinux.org/"
> +            "alpine/v3.17/releases/aarch64/alpine-standard-3.17.2-aarch64.iso"
> +        )
> +
> +        iso_hash = "5a36304ecf039292082d92b48152a9ec21009d3a62f459de623e19c4bd9dc027"
> +        iso_path = self.fetch_asset(iso_url, algorithm="sha256", asset_hash=iso_hash)
> +
> +        self.vm.set_console()
> +        self.vm.add_args(
> +            "-cpu",
> +            cpu,
> +            "-drive",
> +            f"file={iso_path},format=raw",
> +            "-device",
> +            "virtio-rng-pci,rng=rng0",
> +            "-object",
> +            "rng-random,id=rng0,filename=/dev/urandom",
> +        )
> +
> +        self.vm.launch()
> +        wait_for_console_pattern(self, "Welcome to Alpine Linux 3.17")
> +
> +    @skipUnless(os.getenv("AVOCADO_TIMEOUT_EXPECTED"), "Test might timeout")
> +    def test_sbsaref_alpine_linux_cortex_a57(self):
> +        """
> +        :avocado: tags=cpu:cortex-a57
> +        """
> +        self.boot_alpine_linux("cortex-a57")
> +
> +    @skipUnless(os.getenv("AVOCADO_TIMEOUT_EXPECTED"), "Test might timeout")
> +    def test_sbsaref_alpine_linux_neoverse_n1(self):
> +        """
> +        :avocado: tags=cpu:max
> +        """
> +        self.boot_alpine_linux("neoverse-n1")
> +
> +    @skip("requires TF-A update to handle FEAT_FGT")
> +    def test_sbsaref_alpine_linux_max(self):
> +        """
> +        :avocado: tags=cpu:max
> +        """
> +        self.boot_alpine_linux("max,pauth-impdef=on")
> -- 
> 2.38.1
> 
