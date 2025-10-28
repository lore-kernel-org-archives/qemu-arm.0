Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73291CCD1BF
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 14:42:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDktW-0003pl-Sx; Tue, 28 Oct 2025 10:41:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vDktU-0003pV-59
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 10:41:52 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vDktM-0004JK-Td
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 10:41:51 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-427091cd4fdso3504838f8f.1
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 07:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761662498; x=1762267298; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iF8xXUcxGQaogTtpuLss130CofHghjg4O3KFVb1OXg4=;
 b=lSXxMQCA/4tKVz1qQSLc/EUMYBoSItUGmoj7nqu8hJkvSQUoK+YTx0rLQTOcKsgSIB
 4jmQsxXiszC/PYbVr8Znco9Ot+bw/PkIeaM0xQTSicDRxwaSjF7C/glWpATy1HQSlhfC
 QDQioH9lmvjj7ol6F6nGUGVsfhGNtVMrWAlGEo4iD1szI+Y+hTqF5MTqLN/JmXFh/KgH
 LK7QNyN+wA3O7nHIny2aHOITdklxQqAMzvwKELd8eqbhs1qHci1kSHTiqNPQEraLZ/N4
 pXk6wtFYWz5KiLlLFR2t4wuOahEgdfxGx38GiaukZpzlfCIo9vMPX2nPz2I3SzQJgR6P
 9hdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761662498; x=1762267298;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iF8xXUcxGQaogTtpuLss130CofHghjg4O3KFVb1OXg4=;
 b=WklqOTmMFFYjbROCGsUUYNvMBw03UFdPxKmxI4iFudhaNQCLuMmkwFPpz8zRL95Tv8
 4rKoLGD2av6T5uMNjtX+LcMz6cjkVhkGj3UzpcThmjTTkLkMGvLX8AoWv1rT3DbIVBRz
 GPDQg3klNv5JL2KGQgAm0ea287U8CVe2Zqv1Xalceg+dXExqh9TZbbp+xcUq5RPv+Qog
 nE7ztJSE6RTUfuEw8eT2fQtt5hzfnxrkXTTDFUj3ip6xgGYATQg2Hl9nE5aUmD1gAHZR
 V+Uf6H6S618F7r1nOG7uMKy6BFtgHoeZP1Xunos3vQpKx8X27SmhtYxG6eSDxbvKfrwr
 DQig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUC/Tw7fXwENfF8IOLXsZ1hgUxPIi82GEr3InsyKKoBQ0ht8SKTYki4/JYEVmnHz8/oz12cZyRvVw==@nongnu.org
X-Gm-Message-State: AOJu0YxfgHKKe83eya+aHa5FhR2g6mDzhwqwhtnnaFrXjZ553txDtvJT
 +lqOqliVFEMNwAOT7/uVNf2Pr94nXqz3/qD5E9IhTg0tKkxiXJUDhvWo
X-Gm-Gg: ASbGncvaVDaQ3W+fJXrUmLvHuQUKy34Wy0i5Y8/+wblFCkSJviDb0aQF/yRrdiLDCRO
 mACx/IUuSVTTz++TmTZBMjzAWPPQiZxm6b3IkhaUHAtLB6FhqonwYfGGZTgLgpb2fu1aPbYggvT
 Ps+PXT84tDl+PqLqXQGZ2LdIAntgmbwj7n0ww3JmM1CBtbikM9ty06KTPDEMfLGbVtIW4Qy1yEy
 sHw8q5h0L83c/U+QUsVjnSuJXeKiRlX/R5FBEhOT3wzNzFbRNZKs8bQ/AEgvQjzct3EOX7b4OQ4
 m+SM1+540286BdISy/XW5X8CUDBmq76QPsBRGKziNPsm8kfqmuL1aZ0roP5fXSkU9UhrL38NKR7
 4HA7ahRAf5kUM0wRyAY6/eobrkHtjzOTey5PPouvx8coVmxEzN6P4Z70gZsIuwVtHL7AX2qT/Gk
 mVUcFN3yhFohRC2LmLRiOSZv1FrZKjW1ibwtYfII11IHD1gpAxQAAzO2FoRhlah6vezbrYL8sZ
X-Google-Smtp-Source: AGHT+IEBUy30CEWa8Bth4iIyIxLPVuGLm/eVtafwleq9ikEYdQz+0TCe1Klw3JdHG+1lxzRNy2sIZA==
X-Received: by 2002:a5d:5d02:0:b0:426:fd63:bbc0 with SMTP id
 ffacd0b85a97d-429a7e5888dmr3739159f8f.27.1761662498069; 
 Tue, 28 Oct 2025 07:41:38 -0700 (PDT)
Received: from ehlo.thunderbird.net
 (p200300faaf271400c439911fd9f45c3c.dip0.t-ipconnect.de.
 [2003:fa:af27:1400:c439:911f:d9f4:5c3c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952d5c9dsm21638098f8f.26.2025.10.28.07.41.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 07:41:37 -0700 (PDT)
Date: Tue, 28 Oct 2025 14:41:36 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-1?Q?Phil_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: Re: [PATCH 2/2] hw/arm/imx8mp-evk: Add KVM support
In-Reply-To: <CAFEAcA9Rvvymu7oS0pPx00v9SdXzwr27vy1VmnZmwQ7ayZK+yQ@mail.gmail.com>
References: <20250629204851.1778-1-shentey@gmail.com>
 <20250629204851.1778-3-shentey@gmail.com>
 <CAFEAcA9Rvvymu7oS0pPx00v9SdXzwr27vy1VmnZmwQ7ayZK+yQ@mail.gmail.com>
Message-ID: <2F14E49B-D152-470C-A87C-525853EB8ED5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



Am 28=2E Oktober 2025 12:46:34 UTC schrieb Peter Maydell <peter=2Emaydell@=
linaro=2Eorg>:
>On Sun, 29 Jun 2025 at 21:49, Bernhard Beschow <shentey@gmail=2Ecom> wrot=
e:
>>
>> Allows the imx8mp-evk machine to be run with KVM acceleration as a gues=
t=2E
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>  docs/system/arm/imx8mp-evk=2Erst |  7 +++++++
>>  hw/arm/fsl-imx8mp=2Ec            | 33 ++++++++++++++++++++++++++++----=
-
>>  hw/arm/imx8mp-evk=2Ec            | 11 +++++++++++
>>  hw/arm/Kconfig                 |  3 ++-
>>  hw/arm/meson=2Ebuild             |  2 +-
>>  5 files changed, 49 insertions(+), 7 deletions(-)
>>
>> diff --git a/docs/system/arm/imx8mp-evk=2Erst b/docs/system/arm/imx8mp-=
evk=2Erst
>> index b2f7d29ade=2E=2E1399820163 100644
>> --- a/docs/system/arm/imx8mp-evk=2Erst
>> +++ b/docs/system/arm/imx8mp-evk=2Erst
>> @@ -60,3 +60,10 @@ Now that everything is prepared the machine can be s=
tarted as follows:
>>        -dtb imx8mp-evk=2Edtb \
>>        -append "root=3D/dev/mmcblk2p2" \
>>        -drive file=3Dsdcard=2Eimg,if=3Dsd,bus=3D2,format=3Draw,id=3Dmmc=
blk2
>> +
>> +
>> +KVM Virtualization
>> +------------------
>> +
>> +To enable hardware-assisted acceleration via KVM, append
>> +``-accel kvm -cpu host`` to the command line=2E
>
>Coming back to this now we've resolved the "does this put
>things inside our security-promises that we don't want"
>question=2E=2E=2E
>
>I think we should be a bit clearer in the documentation
>about what tradeoffs the user is making here when they select
>KVM=2E Specifically:
>
> * we should note that this is intended only to improve
>   performance, and is not covered by QEMU's security policy

Sure, I'll add it=2E

> * we should say that you will not get a Cortex-A53, so any
>   guest code with tight dependencies on the host CPU type
>   might not work correctly

Ack=2E I'd also hardcode the CPU type to host since asking for a Cortex-A5=
3 always failed on me with KVM=2E

> * we should say that the guest will only be able to run
>   at EL1, and (unlike TCG) there is no EL2 or EL3

Real U-Boot calls back into the on-chip ROM which isn't implemented yet=2E=
 Furthermore, there are some unimplemented USDHC extensions which prevent c=
omplete loading of binaries into RAM by U-Boot (similar limitation exists f=
or e500 boards)=2E Therefore the board documentation only advertises direct=
 kernel boot=2E AFAIU EL2 and EL3 aren't usable there anyway=2E Correct? Do=
 we need to mention this limitation regardless?

>
>> diff --git a/hw/arm/fsl-imx8mp=2Ec b/hw/arm/fsl-imx8mp=2Ec
>> index 866f4d1d74=2E=2E7e61392abb 100644
>> --- a/hw/arm/fsl-imx8mp=2Ec
>> +++ b/hw/arm/fsl-imx8mp=2Ec
>> @@ -12,11 +12,13 @@
>>  #include "system/address-spaces=2Eh"
>>  #include "hw/arm/bsa=2Eh"
>>  #include "hw/arm/fsl-imx8mp=2Eh"
>> -#include "hw/intc/arm_gicv3=2Eh"
>
>Why does this include get removed ?

It was used for accessing `TYPE_ARM_GICV3` which has been replaced by `gic=
v3_class_name()` whose header is included in fsl-imx8mp=2Eh already=2E

>
>>  #include "hw/misc/unimp=2Eh"
>>  #include "hw/boards=2Eh"
>> +#include "system/kvm=2Eh"
>>  #include "system/system=2Eh"
>> +#include "target/arm/cpu=2Eh"
>>  #include "target/arm/cpu-qom=2Eh"
>> +#include "target/arm/kvm_arm=2Eh"
>>  #include "qapi/error=2Eh"
>>  #include "qobject/qlist=2Eh"
>
>> diff --git a/hw/arm/meson=2Ebuild b/hw/arm/meson=2Ebuild
>> index d90be8f4c9=2E=2Ea4212a6ab2 100644
>> --- a/hw/arm/meson=2Ebuild
>> +++ b/hw/arm/meson=2Ebuild
>> @@ -59,7 +59,7 @@ arm_common_ss=2Eadd(when: 'CONFIG_MUSCA', if_true: fi=
les('musca=2Ec'))
>>  arm_common_ss=2Eadd(when: 'CONFIG_ARMSSE', if_true: files('armsse=2Ec'=
))
>>  arm_common_ss=2Eadd(when: 'CONFIG_FSL_IMX7', if_true: files('fsl-imx7=
=2Ec', 'mcimx7d-sabre=2Ec'))
>>  arm_common_ss=2Eadd(when: 'CONFIG_FSL_IMX8MP', if_true: files('fsl-imx=
8mp=2Ec'))
>> -arm_common_ss=2Eadd(when: 'CONFIG_FSL_IMX8MP_EVK', if_true: files('imx=
8mp-evk=2Ec'))
>> +arm_ss=2Eadd(when: 'CONFIG_FSL_IMX8MP_EVK', if_true: files('imx8mp-evk=
=2Ec'))
>>  arm_common_ss=2Eadd(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3=
=2Ec'))
>>  arm_common_ss=2Eadd(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx=
6ul=2Ec', 'mcimx6ul-evk=2Ec'))
>>  arm_common_ss=2Eadd(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_so=
c=2Ec'))
>
>Philippe, Pierrick: is it OK that this moves the
>fsl-imx8p=2Ec file from arm_common to arm_ss, or is there
>a preferable way to do this from a single-binary point
>of view?

Hardcoding to host CPU type in the KVM case might also resolve this issue=
=2E

Thanks,
Bernhard

>
>thanks
>-- PMM

