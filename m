Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5309354lfp;
        Mon, 17 Feb 2020 10:12:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqy54OQ7EEIUqbxwvHllYqovTp2a1SyXX2+7JcPp2JOEcav1WhtuvXt0hM6rWzVOcY9CSPLl
X-Received: by 2002:a05:620a:13e3:: with SMTP id h3mr15030069qkl.319.1581963167171;
        Mon, 17 Feb 2020 10:12:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581963167; cv=none;
        d=google.com; s=arc-20160816;
        b=K2OtxM2HAOCnLGhCkA01OLlPCQjO1XYQKNBqaZd+P7Ex4/6oQFsnthicOAjedFF2f8
         koSYnjBhFKSrWmnkAIGesMzgK26ZCHkeVYiprVICBo1OmxwKfsQM7inkzVoXnrjYCovL
         z35ht0oXS+RzFc1+gi2ONfr07oyTIjxNPwBlg14NChNUf9DmjmvickpHa2ZzhJ+8xbcn
         2Forqhz4Z1avCDw/IsEUDkNGxSQEjyzeSDWhkwlS2HUI4c1sBziQgtQoAoEbRZ5s+8X3
         LvT/DiYuYtX3x62I4WPgh3FLA21YvDjl2nJkoljR0etFBnJrRXRHmQB6unwQDPR62/cT
         USMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Q9ngcppJO7ov5HiqA1mh1h+B/0HM30e5mwQuPsa6ex8=;
        b=qtYPHXWDYdFU9QimArY0oSpdQB2f2gOcMF1QiUWiep1iH2zdkAIo9Me+znxGhcm15x
         rvutp2uWs7lwreXWd6D4OJIU/tjKo1xhXcKEa6K+F5885u1yBSHItwZjc8tpqKykzd2Q
         7BL+Q3q0IC7rVyXG4f6sQPdR8uOaq0i3DDoqqB+JcRkkw6KIfyasNhqEQHkJ5fXtN8Ve
         Tjpg2jq0fKnwJoA1z6ziKaE2KzncLJmiXxw1mwgmVW3gTlwhHNvaq4rLhR75dnAbz+EW
         f2M3wGj+w+Fst5E7ujtfdpiRMsqBaSxTPAzi1Huu20W76L1KiDNOCl4gveftNtgsZA/K
         4ddg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eglR9sK1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a13si648155qkh.159.2020.02.17.10.12.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 10:12:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eglR9sK1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3ksw-0007K6-Jw
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 13:12:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42386)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j3kjv-0005Yr-3c
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 13:03:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j3kjq-0003IA-2G
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 13:03:26 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:29290
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j3kjp-0003Fl-33
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 13:03:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581962599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q9ngcppJO7ov5HiqA1mh1h+B/0HM30e5mwQuPsa6ex8=;
 b=eglR9sK1ixz0PzejB2lpEHaCKWoqLtfXXuS5U4o7sCfFAQvs+4HLISkaX7OGbmgmiFYula
 XNLvtzqakiZy6FWSzuk55xs9vtTRWbosa6tm/nv6tKPiIjV3j5Il6B5UJECCEoBp0V3rU/
 iV2Oga3gn+10peW6lN9Gf8Ll5rQ/ojE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-LLbJsLGcMBGR24nYUoS-VQ-1; Mon, 17 Feb 2020 13:03:16 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4CCBD800D50;
 Mon, 17 Feb 2020 18:03:15 +0000 (UTC)
Received: from [10.36.116.239] (ovpn-116-239.ams2.redhat.com [10.36.116.239])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 169025C3FA;
 Mon, 17 Feb 2020 18:03:07 +0000 (UTC)
Subject: Re: [RFC v2 0/6] vTPM for aarch64
To: Ard Biesheuvel <ardb@kernel.org>
References: <20200214183704.14389-1-eric.auger@redhat.com>
 <CAKv+Gu_JsLdLV2JWCoFaw=3MR4DPKxOzE1mv-0h0nUikoGmZ7w@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <f50fb895-049f-3787-e1f9-7d5e9bf1013a@redhat.com>
Date: Mon, 17 Feb 2020 19:03:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAKv+Gu_JsLdLV2JWCoFaw=3MR4DPKxOzE1mv-0h0nUikoGmZ7w@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: LLbJsLGcMBGR24nYUoS-VQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Eric Auger <eric.auger.pro@gmail.com>, Laszlo Ersek <lersek@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /zEMsX2Te4AZ

Hi Ard,

On 2/16/20 5:35 PM, Ard Biesheuvel wrote:
> On Fri, 14 Feb 2020 at 19:37, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> This series adds the capability to instantiate an MMIO TPM TIS
>> in ARM virt.
>>
>> The existing TPM TIS code is reshuffled into a generic part,
>> the ISA device and the sysbus device. The last patch allows
>> the instantiation of the TPM TIS sysbus device in ARM virt.
>>
>> The series was tested with the swtpm/libtpms emulator.
>> Automatic guest LUKS volume unlocking (tpm2) was successful.
>> EDK2 support is under development [3]. Thanks to Ard
>> for supporting me when setting up the test environment.
>>
>> Best Regards
>>
>> Eric
>>
>> Testing:
>>
>> mkdir /tmp/tpm
>> swtpm socket \
>> --tpm2 \
>> -t -d \
>> --tpmstate dir=/tmp/tpm \
>> --ctrl type=unixio,path=/tmp/swtpm-sock
>>
>> qemu command line must be augmented with the following options:
>>
>> -chardev socket,id=chrtpm,path=/tmp/swtpm-sock \
>> -tpmdev emulator,id=tpm0,chardev=chrtpm \
>> -device tpm-tis-device,tpmdev=tpm0 \
>>
>> References:
>> [1] libtpms: https://github.com/stefanberger/libtpms/wiki
>> [2] swtpm: https://github.com/stefanberger/swtpm/wiki
>> [3] [PATCH 0/4] ArmVirtPkg: implement measured boot for ArmVirtQemu
>>
>> This series can be found at:
>> https://github.com/eauger/qemu/tree/v4.2.0-tpm-rfc-v2
>>
>> History:
>>
>> RFC v1 -> RFC v2:
>> - restructure the existing code with common, ISA and sysbus part.
>> - both ARM and x86 integration were tested.
>> - acknowledgement: migration has not been tested
>>
>> Eric Auger (6):
>>   tpm: rename TPM_TIS into TPM_TIS_ISA
>>   tpm: Use TPMState as a common struct
>>   tpm: Separate tpm_tis common functions from isa code
>>   tpm: Separate TPM_TIS and TPM_TIS_ISA configs
>>   tpm: Add the SysBus TPM TIS device
>>   hw/arm/virt: vTPM support
>>
> 
> Many thanks to Eric for his work on this.
> 
> I have tested this with my EDK2 code and a Linux/arm64 VM booting in
> DT mode with the tpm-tis driver enabled, and it works as expected. I
> can observe the firmware taking measurements during boot, and can dump
> the PCRs from Linux using tpm2_pcrlist.
> 
> Tested-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

Many thanks for the testing.
> 
> Note that the UEFI firmware is itself a consumer of the DT
> description, so we need the DT related changes regardless of whether
> the VM boots in DT or ACPI mode.

OK thank you for the note. I will add this in my cover letter.

Best Regards

Eric
> 
> 
> 
>>  default-configs/i386-softmmu.mak       |   2 +-
>>  hw/arm/Kconfig                         |   1 +
>>  hw/arm/sysbus-fdt.c                    |  36 +++++
>>  hw/arm/virt.c                          |   7 +
>>  hw/i386/Kconfig                        |   2 +-
>>  hw/i386/acpi-build.c                   |   6 +-
>>  hw/tpm/Kconfig                         |  12 +-
>>  hw/tpm/Makefile.objs                   |   4 +-
>>  hw/tpm/tpm_tis.h                       |  91 +++++++++++++
>>  hw/tpm/{tpm_tis.c => tpm_tis_common.c} | 181 ++-----------------------
>>  hw/tpm/tpm_tis_isa.c                   | 170 +++++++++++++++++++++++
>>  hw/tpm/tpm_tis_sysbus.c                | 159 ++++++++++++++++++++++
>>  include/sysemu/tpm.h                   |   7 +-
>>  tests/qtest/Makefile.include           |   4 +-
>>  14 files changed, 502 insertions(+), 180 deletions(-)
>>  create mode 100644 hw/tpm/tpm_tis.h
>>  rename hw/tpm/{tpm_tis.c => tpm_tis_common.c} (85%)
>>  create mode 100644 hw/tpm/tpm_tis_isa.c
>>  create mode 100644 hw/tpm/tpm_tis_sysbus.c
>>
>> --
>> 2.20.1
>>
> 

