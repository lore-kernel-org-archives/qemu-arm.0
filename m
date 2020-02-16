Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4209127lfp;
        Sun, 16 Feb 2020 09:10:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqxesxxGPkpuybsmLNCUWgHQJOsaHTMfNACluttj55cP8yeVqZvFndCJoVHssqYQVmjThhIs
X-Received: by 2002:a05:620a:1436:: with SMTP id k22mr10990094qkj.24.1581873046696;
        Sun, 16 Feb 2020 09:10:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581873046; cv=none;
        d=google.com; s=arc-20160816;
        b=P7e6Qlb7uFeVEx6L4uwNvb650jFUozIQZWY037/ULMLrNM59dXPrn76bWGruwiyVAy
         6TPWwmUkAUxJW5eDcur7SbccxBuAFQRabUHxGSJDErI9tKfE9eypHZcn15Q0lWfIfowP
         G08bySrtJ/IZ1JlUHWmTIMInqDVTx9XHW5Ho1/WukGruVdyms4DBiSFliyjPiV9galvO
         XbCBTERVucQwnh1ktVG0nO9ZorvMahZAYNsF3oe6oBKOOPqex7A00fnVDYKNVAj3KkDh
         mzh35El9DCLkscA1IGLbiVaqpB+djajw8s/KFwphB+onld2xPHggCUEYR+jKaRvKMXUe
         tPSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tt1agpEXzumRcMCrwCkaujI1NgI4DH5/aaWjiVxsS1s=;
        b=Y82E9DAXBj6ZYi4wE73k3+kjbTQZNt8FuQc3Uk7Ln1vNYlxdwLFwDce2I1VPlhwiIN
         jTt5sFMV8pDrjXwJ8kuey9rkiDYUPGOLp/B0Wg/BawF4436vrPZFdcAsvWFKzBUcF7ak
         4RqlQy1NwC+vm1HW+ttpAFzx2QgRhMQxVEVY6UDP/YaWxISkXCtvxFIM7p0mzHF1O1w8
         1hu5JX2RgY9rqS+gFGwcJ4Po38+haR22G81YNX3JRwFAsPA3A8VJ8s3mRmy4Z7y4FBFL
         YIqjhqJe9rJLjzz69tkfPWRb/gvEyhlb5Wwp7nt8x+osGTtOo6sm3e5MGwvqrLnk2AYh
         LRPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@kernel.org header.s=default header.b=QPHNz0oV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l20si6106533qkg.169.2020.02.16.09.10.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Feb 2020 09:10:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@kernel.org header.s=default header.b=QPHNz0oV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1]:34476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3NRO-00017B-5H
	for alex.bennee@linaro.org; Sun, 16 Feb 2020 12:10:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45413)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ardb@kernel.org>) id 1j3Mth-0000ta-3Q
 for qemu-arm@nongnu.org; Sun, 16 Feb 2020 11:35:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ardb@kernel.org>) id 1j3Mtf-0007kA-N1
 for qemu-arm@nongnu.org; Sun, 16 Feb 2020 11:35:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:55234)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ardb@kernel.org>) id 1j3Mtf-0007jG-EJ
 for qemu-arm@nongnu.org; Sun, 16 Feb 2020 11:35:55 -0500
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5BF8F24654
 for <qemu-arm@nongnu.org>; Sun, 16 Feb 2020 16:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581870953;
 bh=1PK16Intcsfsl5Z8c29vMomjWbSOsBdD0Y66sZ9++Yg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QPHNz0oVBZW1PXI5QzHDQh9GIeUDAoFYEMXrODDd1Faxwx4sqtqdu7jrm6n482wJN
 MwMvemhKIvpfk/zZh4bHA4ldKPcTvgpz26z5mDixK7FHNWLz6K6/5fd6GBTZywa2L9
 IVi5WAa/6IvhE5eNanOclswgAORfmwE6IpEErN7M=
Received: by mail-wr1-f51.google.com with SMTP id m16so16726037wrx.11
 for <qemu-arm@nongnu.org>; Sun, 16 Feb 2020 08:35:53 -0800 (PST)
X-Gm-Message-State: APjAAAWyjtV3mTZcvp9119QVtQRyEinPeG0qDTpj/Q+iIpYyRSXofiwf
 ptB4pQmxPjKVx4S6LzdZEHsNpzP7j0/1w0yOth8NFQ==
X-Received: by 2002:a5d:5188:: with SMTP id k8mr16497625wrv.151.1581870951630; 
 Sun, 16 Feb 2020 08:35:51 -0800 (PST)
MIME-Version: 1.0
References: <20200214183704.14389-1-eric.auger@redhat.com>
In-Reply-To: <20200214183704.14389-1-eric.auger@redhat.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 16 Feb 2020 17:35:40 +0100
X-Gmail-Original-Message-ID: <CAKv+Gu_JsLdLV2JWCoFaw=3MR4DPKxOzE1mv-0h0nUikoGmZ7w@mail.gmail.com>
Message-ID: <CAKv+Gu_JsLdLV2JWCoFaw=3MR4DPKxOzE1mv-0h0nUikoGmZ7w@mail.gmail.com>
Subject: Re: [RFC v2 0/6] vTPM for aarch64
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 198.145.29.99
X-Mailman-Approved-At: Sun, 16 Feb 2020 12:10:36 -0500
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Eric Auger <eric.auger.pro@gmail.com>, Laszlo Ersek <lersek@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wOv1d/81GsR9

On Fri, 14 Feb 2020 at 19:37, Eric Auger <eric.auger@redhat.com> wrote:
>
> This series adds the capability to instantiate an MMIO TPM TIS
> in ARM virt.
>
> The existing TPM TIS code is reshuffled into a generic part,
> the ISA device and the sysbus device. The last patch allows
> the instantiation of the TPM TIS sysbus device in ARM virt.
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
> --tpmstate dir=/tmp/tpm \
> --ctrl type=unixio,path=/tmp/swtpm-sock
>
> qemu command line must be augmented with the following options:
>
> -chardev socket,id=chrtpm,path=/tmp/swtpm-sock \
> -tpmdev emulator,id=tpm0,chardev=chrtpm \
> -device tpm-tis-device,tpmdev=tpm0 \
>
> References:
> [1] libtpms: https://github.com/stefanberger/libtpms/wiki
> [2] swtpm: https://github.com/stefanberger/swtpm/wiki
> [3] [PATCH 0/4] ArmVirtPkg: implement measured boot for ArmVirtQemu
>
> This series can be found at:
> https://github.com/eauger/qemu/tree/v4.2.0-tpm-rfc-v2
>
> History:
>
> RFC v1 -> RFC v2:
> - restructure the existing code with common, ISA and sysbus part.
> - both ARM and x86 integration were tested.
> - acknowledgement: migration has not been tested
>
> Eric Auger (6):
>   tpm: rename TPM_TIS into TPM_TIS_ISA
>   tpm: Use TPMState as a common struct
>   tpm: Separate tpm_tis common functions from isa code
>   tpm: Separate TPM_TIS and TPM_TIS_ISA configs
>   tpm: Add the SysBus TPM TIS device
>   hw/arm/virt: vTPM support
>

Many thanks to Eric for his work on this.

I have tested this with my EDK2 code and a Linux/arm64 VM booting in
DT mode with the tpm-tis driver enabled, and it works as expected. I
can observe the firmware taking measurements during boot, and can dump
the PCRs from Linux using tpm2_pcrlist.

Tested-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

Note that the UEFI firmware is itself a consumer of the DT
description, so we need the DT related changes regardless of whether
the VM boots in DT or ACPI mode.



>  default-configs/i386-softmmu.mak       |   2 +-
>  hw/arm/Kconfig                         |   1 +
>  hw/arm/sysbus-fdt.c                    |  36 +++++
>  hw/arm/virt.c                          |   7 +
>  hw/i386/Kconfig                        |   2 +-
>  hw/i386/acpi-build.c                   |   6 +-
>  hw/tpm/Kconfig                         |  12 +-
>  hw/tpm/Makefile.objs                   |   4 +-
>  hw/tpm/tpm_tis.h                       |  91 +++++++++++++
>  hw/tpm/{tpm_tis.c => tpm_tis_common.c} | 181 ++-----------------------
>  hw/tpm/tpm_tis_isa.c                   | 170 +++++++++++++++++++++++
>  hw/tpm/tpm_tis_sysbus.c                | 159 ++++++++++++++++++++++
>  include/sysemu/tpm.h                   |   7 +-
>  tests/qtest/Makefile.include           |   4 +-
>  14 files changed, 502 insertions(+), 180 deletions(-)
>  create mode 100644 hw/tpm/tpm_tis.h
>  rename hw/tpm/{tpm_tis.c => tpm_tis_common.c} (85%)
>  create mode 100644 hw/tpm/tpm_tis_isa.c
>  create mode 100644 hw/tpm/tpm_tis_sysbus.c
>
> --
> 2.20.1
>
