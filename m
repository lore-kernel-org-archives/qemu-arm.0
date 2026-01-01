Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F5CEED626
	for <qemu-arm@archiver.kernel.org>; Thu,  1 Jan 2026 17:40:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vbMeC-0002fV-BC; Thu, 01 Jan 2026 12:39:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vbMe7-0002cD-6I
 for qemu-arm@nongnu.org; Thu, 01 Jan 2026 12:39:37 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vbMe0-0005ad-Ir
 for qemu-arm@nongnu.org; Thu, 01 Jan 2026 12:39:32 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-42fbc305914so7554352f8f.0
 for <qemu-arm@nongnu.org>; Thu, 01 Jan 2026 09:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767289164; x=1767893964; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4eXTeWbvFGcK3I3F6QbEeWDS2W9GrykkT7vbfVmHkXY=;
 b=aieKT2Y0rnLk2fiLVnu8UHuUVqgRZNodvDQJtcUxHD/GbKr2Liq5fBB8rJvtWmTUs6
 h1yGjMmbU6JB+shtuGhP3vmWa18bs3KBW8CptUjy45AFkzQf4xq5zpiQUT30zRung/Gk
 WSXPoZx6cUbGw9fVSNGl5zjH1iZwWMFlcJ56iOlCZMKUcp1TI2MYG02gxqqOYXVXzmMh
 gvh0uu9y5O2qiIHpNbWgKRBeS8WVcM3VHaGIn4nscukOMi9XH0Sr4/kYaPMyVMATGIXE
 J1oXAf4CPt7+aHVjSvse+8czcES4vtFKPmNi4ZvSahAnoUgO+u3hL0dL3+uRuBO8DpWD
 EeDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767289164; x=1767893964;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4eXTeWbvFGcK3I3F6QbEeWDS2W9GrykkT7vbfVmHkXY=;
 b=R79QuyNyD7f5N3E8/G1sydO0ws1cjReEoBgJnvskCtXtNPiIsQKZ7Zk04wnSXoIbGP
 m+QWeqxfFP/f3YJBVl4M9+nsMCvNpjjs6Rl7kLt1ytWfxlgJXlIxIojYu5r/nNBpedBo
 /BOz5hQyWYMQSNT1aQX99yoqH+DOG7QAmnv38eWeL9KqaJ8001uLBYGzQEGqGldxagcl
 CpX2q83GxjlF643T+2JgytP+zIBsU/Kpk5n66dE49eVluMzuaX0hGJQkGq4XsK8i4wPd
 skUyUTJNzP4sBuVCSN4ZqZR3qXuO+exKDaDENGy8Y8Rrz348nIpKut61QgfV3h93v7l9
 QXHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2eB90/RFdr1oUAcAft1AbJUvgHjiT0lDfhBTPrkoq+aK3+Kms2f1L7H43MY5GwB7xEHNUuQWb+Q==@nongnu.org
X-Gm-Message-State: AOJu0YxsDyIg2H6I8HHwkpglUNossXmo96ihigBcpP0IxR2WcJsdlmYJ
 c/kb2/iihnBY8a5HwxfZj5x6/R6YbMO3/ixzfjpKLsewoHhqrGQEMm4yg1syLQ==
X-Gm-Gg: AY/fxX7DajxMqYrwmAfyU34b8rellGNox25HOCMTAuP0rsyekdMG2FouGzGdOVcehFP
 U5Wt+LNX4dJVNocbdgJpb4HC5BENCN3+migqWIOfaNIZqf3tvnRxbr0TRqNAW5GBr+8cXG3D+Za
 A0Lj9wqV8sbLvtJDc1oJh20dGqyB0YZZreGiTlzfkDihCgnx74uy5Z889zK9yiBEW82XMGnbozX
 ApSA9JoR5F+fpoeonyXfOPAP6jXiJHTCuBkw7di0NCkR9oHyXGiRbvdQxj4UueZqvObjX1t/ydg
 BF6jJvpx648lZZppJGPeMEMYZnspj5nYX83s2cjMZZJxLda+jIDdMg+PTKNmHrVqFstPFiGQmRf
 rvIKc3ZVN4YfOeO9Q4t7WtZjKgZ3v5jAPJJDIpgCwk9y4UL9HikS/Y2NKPcX1JQR7iVTi5EApm2
 nY7g7JPcI8TQTRkdbFQhd22RjE4WOAqJWJziy3NHOvYUtVG3fFcUo7Mn4HOtssgi/wYOPRjhJ1M
 RcfX4XYGxZVcYFiOknop5yWykY1lqed5Ho=
X-Google-Smtp-Source: AGHT+IE6DWY5bKivZDcY27wGC2bTbNGcXTUwFIb5pCUIIH1qjuenBSLrxzUDlCMxmurLreuZ6bfP/g==
X-Received: by 2002:a05:6402:520d:b0:643:e2d:1d6c with SMTP id
 4fb4d7f45d1cf-64b8ea61109mr36256270a12.4.1767282409336; 
 Thu, 01 Jan 2026 07:46:49 -0800 (PST)
Received: from ehlo.thunderbird.net
 (dynamic-2a02-3100-1ca9-3100-f91d-651c-a220-693b.310.pool.telefonica.de.
 [2a02:3100:1ca9:3100:f91d:651c:a220:693b])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b91599721sm40748723a12.26.2026.01.01.07.46.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jan 2026 07:46:47 -0800 (PST)
Date: Thu, 01 Jan 2026 15:46:45 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>
CC: Yanan Wang <wangyanan55@huawei.com>,
 =?ISO-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Eduardo Habkost <eduardo@habkost.net>, Mads Ynddal <mads@ynddal.dk>,
 Roman Bolshakov <rbolshakov@ddn.com>, Peter Xu <peterx@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Peter Maydell <peter.maydell@linaro.org>, Cameron Esfahani <dirty@apple.com>, 
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, qemu-arm@nongnu.org,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Ani Sinha <anisinha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Graf <agraf@csgraf.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?ISO-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v13 00/28] WHPX support for Arm
In-Reply-To: <b833265e-0a90-4696-803f-d98a7c1e3456@linaro.org>
References: <20251230000401.72124-1-mohamed@unpredictable.fr>
 <b833265e-0a90-4696-803f-d98a7c1e3456@linaro.org>
Message-ID: <9A2E2173-6CF4-4DDE-8D8F-8FFC008F9F2F@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x436.google.com
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



Am 30=2E Dezember 2025 03:47:20 UTC schrieb Pierrick Bouvier <pierrick=2Eb=
ouvier@linaro=2Eorg>:
>On 12/29/25 4:03 PM, Mohamed Mediouni wrote:
>> Link to branch: https://github=2Ecom/mediouni-m/qemu whpx (tag for this=
 submission: whpx-v13)
>>=20
>> Missing features:
>> - VM save-restore: interrupt controller state notably
>> - SVE register sync: I didn't have the time to test this on pre-release=
 hardware with SVE2 support yet=2E
>> So SVE2 is currently masked for VMs when running this=2E
>>=20
>> Known bugs:
>> - U-Boot still doesn't work (hangs when trying to parse firmware) but E=
DK2 does=2E
>>=20
>> Note:
>>=20
>> "target/arm/kvm: add constants for new PSCI versions" taken from the ma=
iling list=2E
>>=20
>> "accel/system: Introduce hwaccel_enabled() helper" taken from the maili=
ng list, added here
>> as part of this series to make it compilable as a whole=2E
>>=20
>> "hw/arm: virt: add GICv2m for the case when ITS is not available" prese=
nt in both the HVF
>> vGIC and this series=2E
>>=20
>> "hw: arm: virt-acpi-build: add temporary hack to match existing behavio=
r" is
>> for ACPI stability but what is the right approach to follow there?
>>=20
>> And another note:
>>=20
>> Seems that unlike HVF there isn't direct correspondence between WHv reg=
isters and the actual register layout,
>> so didn't do changes there to a sysreg=2Einc=2E
>>=20
>> Updates since v12:
>> - Address review comments and make sure that checkpatch shows no errors=
, make test also ran
>> - Tested the Windows x86_64 build too in addition to Windows arm64 and =
macOS arm64
>> - Hopefully the last revision, should be ready to merge=2E
>>=20
>> Updates since v11:
>> - Address review comments
>> - Rebase up to latest staging
>> - Switch to assuming Qemu 11=2E0 as the newest machine model
>>=20
>> Updates since v10:
>> - Bring forward to latest Qemu
>> - Fix a typo in the GICv3+GICv2m PR
>>=20
>> Updates since v9:
>> - Adding partition reset on the reboot side of things=2E=2E=2E
>>=20
>> Updates since v8:
>> - v9 and v8 were not submitted properly because of my MTA not behaving,=
 sorry for that=2E
>> - v10 introduces a new argument, -M msi=3D, to handle MSI-X configurati=
on more granularly=2E
>> - That surfaced what I think is a bug (?), with vms->its=3D1 on GICv2 c=
onfigurations=2E=2E=2E or I did understand everything wrong=2E
>> - Oopsie due to email provider ratelimiting=2E
>>=20
>> Updates since v7:
>> - Oops, fixing bug in "hw/arm: virt: cleanly fail on attempt to use the=
 platform vGIC together with ITS"=2E
>> Other commits are unchanged=2E
>>=20
>> Updates since v6:
>> - Rebasing
>> - Fixing a bug in the GICv3+GICv2m case for ACPI table generation
>> - getting rid of the slots infrastructure for memory management
>> - Place the docs commit right after the "cleanly fail on attempt to run=
 GICv3+GICv2m on an unsupported config" one
>> as that's what switches ITS to a tristate=2E
>> - Fixing a build issue when getting rid of the arch-specific arm64 hvf-=
stub=2E
>>=20
>> Updates since v5:
>> - Rebasing
>> - Address review comments
>> - Rework ITS enablement to a tristate
>> - On x86: move away from deprecated APIs to get/set APIC state
>>=20
>> Updates since v4:
>> - Taking into account review comments
>> - Add migration blocker in the vGICv3 code due to missing interrupt con=
troller save/restore
>> - Debug register sync
>>=20
>> Updates since v3:
>> - Disabling SVE on WHPX
>> - Taking into account review comments incl:
>>=20
>> - fixing x86 support
>> - reduce the amount of __x86_64__ checks in common code to the minimum =
(winhvemulation)
>> which can be reduced even further down the road=2E
>> - generalize get_physical_address_range into something common between h=
vf and whpx
>>=20
>> Updates since v2:
>> - Fixed up a rebase screwup for whpx-internal=2Eh
>> - Fixed ID_AA64ISAR1_EL1 and ID_AA64ISAR2_EL1 feature probe for -cpu ho=
st
>> - Switched to ID_AA64PFR1_EL1/ID_AA64DFR0_EL1 instead of their non-AA64=
 variant
>>=20
>> Updates since v1:
>> - Shutdowns and reboots
>> - MPIDR_EL1 register sync
>> - Fixing GICD_TYPER_LPIS value
>> - IPA size clamping
>> - -cpu host now implemented
>>=20
>> Mohamed Mediouni (26):
>>    qtest: hw/arm: virt: skip ACPI test for ITS off
>>    hw/arm: virt: add GICv2m for the case when ITS is not available
>>    tests: data: update AArch64 ACPI tables
>>    hw/arm: virt: cleanly fail on attempt to use the platform vGIC
>>      together with ITS
>>    hw: arm: virt: rework MSI-X configuration
>>    hw: arm: virt-acpi-build: add temporary hack to match existing
>>      behavior
>>    docs: arm: update virt machine model description
>>    whpx: Move around files before introducing AArch64 support
>>    whpx: reshuffle common code
>>    whpx: ifdef out winhvemulation on non-x86_64
>>    whpx: common: add WHPX_INTERCEPT_DEBUG_TRAPS define
>>    hw, target, accel: whpx: change apic_in_platform to kernel_irqchip
>>    whpx: interrupt controller support
>>    whpx: add arm64 support
>>    whpx: change memory management logic
>>    target/arm: cpu: mark WHPX as supporting PSCI 1=2E3
>>    whpx: arm64: clamp down IPA size
>>    hw/arm, accel/hvf, whpx: unify get_physical_address_range between WH=
PX
>>      and HVF
>>    whpx: arm64: implement -cpu host
>>    target/arm: whpx: instantiate GIC early
>>    whpx: arm64: gicv3: add migration blocker
>>    whpx: enable arm64 builds
>>    whpx: apic: use non-deprecated APIs to control interrupt controller
>>      state
>>    whpx: arm64: check for physical address width after WHPX availabilit=
y
>>    whpx: arm64: add partition-wide reset on the reboot path
>>    MAINTAINERS: update the list of maintained files for WHPX
>>=20
>> Philippe Mathieu-Daud=C3=A9 (1):
>>    accel/system: Introduce hwaccel_enabled() helper
>>=20
>> Sebastian Ott (1):
>>    target/arm/kvm: add constants for new PSCI versions
>>=20
>>   MAINTAINERS                                   |    6 +
>>   accel/hvf/hvf-all=2Ec                           |    7 +-
>>   accel/meson=2Ebuild                             |    1 +
>>   accel/stubs/whpx-stub=2Ec                       |    1 +
>>   accel/whpx/meson=2Ebuild                        |    7 +
>>   {target/i386 =3D> accel}/whpx/whpx-accel-ops=2Ec  |    6 +-
>>   accel/whpx/whpx-common=2Ec                      |  536 +++++++++
>>   docs/system/arm/virt=2Erst                      |   13 +-
>>   hw/arm/virt-acpi-build=2Ec                      |   16 +-
>>   hw/arm/virt=2Ec                                 |  140 ++-
>>   hw/i386/x86-cpu=2Ec                             |    4 +-
>>   hw/intc/arm_gicv3_common=2Ec                    |    3 +
>>   hw/intc/arm_gicv3_whpx=2Ec                      |  249 ++++
>>   hw/intc/meson=2Ebuild                           |    1 +
>>   include/hw/arm/virt=2Eh                         |    8 +-
>>   include/hw/core/boards=2Eh                      |    3 +-
>>   include/hw/intc/arm_gicv3_common=2Eh            |    3 +
>>   include/system/hvf_int=2Eh                      |    5 +
>>   include/system/hw_accel=2Eh                     |   13 +
>>   =2E=2E=2E/whpx =3D> include/system}/whpx-accel-ops=2Eh  |    4 +-
>>   include/system/whpx-all=2Eh                     |   20 +
>>   include/system/whpx-common=2Eh                  |   26 +
>>   =2E=2E=2E/whpx =3D> include/system}/whpx-internal=2Eh   |   25 +-
>>   include/system/whpx=2Eh                         |    5 +-
>>   meson=2Ebuild                                   |   20 +-
>>   target/arm/cpu=2Ec                              |    3 +
>>   target/arm/cpu64=2Ec                            |   17 +-
>>   target/arm/hvf-stub=2Ec                         |   20 -
>>   target/arm/hvf/hvf=2Ec                          |    6 +-
>>   target/arm/hvf_arm=2Eh                          |    3 -
>>   target/arm/kvm-consts=2Eh                       |    2 +
>>   target/arm/meson=2Ebuild                        |    2 +-
>>   target/arm/whpx/meson=2Ebuild                   |    5 +
>>   target/arm/whpx/whpx-all=2Ec                    | 1020 ++++++++++++++=
+++
>>   target/arm/whpx/whpx-stub=2Ec                   |   15 +
>>   target/arm/whpx_arm=2Eh                         |   17 +
>>   target/i386/cpu-apic=2Ec                        |    2 +-
>>   target/i386/hvf/hvf=2Ec                         |   11 +
>>   target/i386/whpx/meson=2Ebuild                  |    1 -
>>   target/i386/whpx/whpx-all=2Ec                   |  569 +--------
>>   target/i386/whpx/whpx-apic=2Ec                  |   48 +-
>>   tests/data/acpi/aarch64/virt/APIC=2Eits_off     |  Bin 164 -> 188 byt=
es
>>   42 files changed, 2215 insertions(+), 648 deletions(-)
>>   create mode 100644 accel/whpx/meson=2Ebuild
>>   rename {target/i386 =3D> accel}/whpx/whpx-accel-ops=2Ec (96%)
>>   create mode 100644 accel/whpx/whpx-common=2Ec
>>   create mode 100644 hw/intc/arm_gicv3_whpx=2Ec
>>   rename {target/i386/whpx =3D> include/system}/whpx-accel-ops=2Eh (92%=
)
>>   create mode 100644 include/system/whpx-all=2Eh
>>   create mode 100644 include/system/whpx-common=2Eh
>>   rename {target/i386/whpx =3D> include/system}/whpx-internal=2Eh (88%)
>>   delete mode 100644 target/arm/hvf-stub=2Ec
>>   create mode 100644 target/arm/whpx/meson=2Ebuild
>>   create mode 100644 target/arm/whpx/whpx-all=2Ec
>>   create mode 100644 target/arm/whpx/whpx-stub=2Ec
>>   create mode 100644 target/arm/whpx_arm=2Eh
>>=20
>
>Thanks Mohamed=2E
>Looks all good to me, and all checks are passing=2E
>I hope it can be pulled quickly by a maintainer, before this series confl=
icts with any other changes on this area=2E

Hi,

I still need to revert "whpx: apic: use non-deprecated APIs to control int=
errupt controller" for QEMU not to crash, see:
- https://lore=2Ekernel=2Eorg/qemu-devel/4F98A2AD-02A7-4A7F-91B8-269E9EC8E=
5B1@gmail=2Ecom/
- https://lore=2Ekernel=2Eorg/qemu-devel/D7E4B026-EF2F-4075-B424-06427346E=
97B@gmail=2Ecom/

The problem can be reproduced by running "qemu-system-x86_64 -accel whpx"=
=2E Let me know if you need some further details=2E

Best regards,
Bernhard

>
>Regards,
>Pierrick
>

