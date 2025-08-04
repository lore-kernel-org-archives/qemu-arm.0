Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4280C87FCB
	for <qemu-arm@archiver.kernel.org>; Mon,  4 Aug 2025 19:33:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uj0vI-0002GO-Id; Mon, 04 Aug 2025 15:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj0Hd-0002WM-2A
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 14:51:46 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj0Ha-0003M8-Nd
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 14:51:40 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-7426c44e014so4286992b3a.3
 for <qemu-arm@nongnu.org>; Mon, 04 Aug 2025 11:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754333496; x=1754938296; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lnvlo+C5+pUp4ktyPBXpxRCxzwgcWN+EUUO9fLqWFL8=;
 b=M33dxmaUgP33Ly4hHi11JZxkUajTX4a0rHxiQzrmaqb2O0IqWztMN+QCKPwPG3VHyI
 Ed3XMGJ5Cc97mOLORwaylea74wcLWYR9TyyaD6eAz43k9uigfzrmGK+fqjS+lhLcjw8x
 VwlsHjcRPgaOJuDB1HfbvpDiUn8C6DWqEVEsOYYtpmLamdhWveA5aQASl3FnlsymbL4Y
 RZHcR8uiYbqFpYHl90Jitz8BeNaC0tAaskyWDIWxfRdMB9/KihsP1g1RKKPZrHTtn8n8
 iB2ZtBFLReHvO36d/8VknljOTtaolDjNpJxGwtP2hd7ubDf5geSUpN/e3ssOf6TNQR94
 rwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754333496; x=1754938296;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lnvlo+C5+pUp4ktyPBXpxRCxzwgcWN+EUUO9fLqWFL8=;
 b=GhvC36Z5TnG6SlJwF8Sv29PEfLJD2M3Q7G5sLjaSNmlbmJUJPYqFF9nbjpFOrWTR7u
 H/rzhysb4sYwZexWhGs/HYuRclZUun+XjYGuYOyJMn2FTiYAlFg5CCiubTAVHkV1Xu6T
 7iSeSkdpFcpqU7qv4Z6WO8b/bzgZ93R0QNhsJcCmswMDzKLnsQeq70eV6k3JlsU8mcgy
 T9sjvGNtCZKT7vgK4kVFnY/IG8QsbuRHTwajbKaGw+k56057KOE7wRjtRIlUrrnRRdr+
 3QYSoHtZHuC2iQTlg1TPQ9Yf2+qcFd/Xbhs731YLjtuLrf93hgpgTVV1eQFh2uoPEO7x
 jWGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1dGdWrsDZRJk/uC82pO9rhjHdFOkm2+wjgbCkbJug6NVq8cRGloDBa/fQolp2V5v2nWN8PLnS8Q==@nongnu.org
X-Gm-Message-State: AOJu0YxKBwxf+Ek9bCqT0wkJrSle6JFZZ7GXpzm+Z2Nec6p+sVPkeTdW
 oEJnkXRDYbbB0uRjDTo8nc7CImn0AckknQ3htzOwCv4dDTHNN2F3sm8Jit9gOzWAY6g=
X-Gm-Gg: ASbGncv6eOJlX0vR26hZV18TYcj3JTOwaeZbMRJcM5SnXfHiI+pDebv0UYIhXqQlu3W
 QIiInTNL0LDAxgl9jMDlp4mGW6dPueWfAj+Q2xofnfq9/k7+n6SUcZnCfjOoM86Cvcstv9E7oa5
 Pk0e4lUJiD8AZ1my+qvbWjJHdaHBzP9+1p2FOSTFn54fQxXyH4oXDLgOjDJ68RVmCARWmrJ39MP
 DUj/2Xy7rBaVN5AIHX6wkSYd+mDnL2bnEx5vVns2MdrQ5iJcBKmu0pC3cRr0Pj0fXr/8qY25jZk
 kySwu8LAezlG0vp8sidijaqy8ZA5Xn4UBC07E77x/me4ZiRbenfpw0Go8o0qrvvM+QgE2g/d2fZ
 5eRr3ajO3k8rBMQlqTN6SrIx4xnb0CHCRQy0=
X-Google-Smtp-Source: AGHT+IFVoMmcqQGC0lNpv8oIUSfyUw9DV2HNSEfsLMQcpa1E7mbQ2WsRKEGziCIgb452T0J1wXlBtw==
X-Received: by 2002:a17:902:e54f:b0:240:6766:ac01 with SMTP id
 d9443c01a7336-24246f3e8a3mr169181865ad.2.1754333496481; 
 Mon, 04 Aug 2025 11:51:36 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8aaafefsm116817005ad.160.2025.08.04.11.51.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 11:51:36 -0700 (PDT)
Message-ID: <5716cbc5-1ed3-407d-a932-aac01f5eb269@linaro.org>
Date: Mon, 4 Aug 2025 11:51:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/17] WHPX support for Arm
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <anisinha@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Roman Bolshakov
 <rbolshakov@ddn.com>, Igor Mammedov <imammedo@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Mads Ynddal <mads@ynddal.dk>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Zhao Liu <zhao1.liu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20250804142326.72947-1-mohamed@unpredictable.fr>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250804142326.72947-1-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 8/4/25 7:23 AM, Mohamed Mediouni wrote:
> Link to branch: https://github.com/mediouni-m/qemu whpx (tag for this submission: whpx-v3)
> 
> Missing features:
> - PSCI state sync with Hyper-V: notably breaks reboots when multiple cores are enabled
> - Interrupt controller save-restore
> - Debug register sync
> - SVE register sync
> - Adding a migration blocker because of the items above.
> 
> Note:
> 
> "accel/system: Introduce hwaccel_enabled() helper" taken from the mailing list, added here
> as part of this series to make it compilable as a whole.
> 
> "hw/arm: virt: add GICv2m for the case when ITS is not available" present in both the HVF
> vGIC and this series.
> 
> Updates since v3:
> - Disabling SVE on WHPX
> - Taking into account review comments incl:
> 
> - fixing x86 support
> - reduce the amount of __x86_64__ checks in common code to the minimum (winhvemulation)
> which can be reduced even further down the road.
> - generalize get_physical_address_range into something common between hvf and whpx
> 
> Updates since v2:
> - Fixed up a rebase screwup for whpx-internal.h
> - Fixed ID_AA64ISAR1_EL1 and ID_AA64ISAR2_EL1 feature probe for -cpu host
> - Switched to ID_AA64PFR1_EL1/ID_AA64DFR0_EL1 instead of their non-AA64 variant
> 
> Updates since v1:
> - Shutdowns and reboots
> - MPIDR_EL1 register sync
> - Fixing GICD_TYPER_LPIS value
> - IPA size clamping
> - -cpu host now implemented
> 
> Mohamed Mediouni (16):
>    hw/arm: virt: add GICv2m for the case when ITS is not available
>    whpx: Move around files before introducing AArch64 support
>    whpx: reshuffle common code
>    whpx: ifdef out winhvemulation on non-x86_64
>    whpx: common: add WHPX_INTERCEPT_DEBUG_TRAPS define
>    hw, target, accel: whpx: change apic_in_platform to kernel_irqchip
>    whpx: interrupt controller support
>    whpx: add arm64 support
>    whpx: copy over memory management logic from hvf
>    target/arm: cpu: mark WHPX as supporting PSCI 1.1
>    hw/arm: virt: cleanly fail on attempt to use the platform vGIC
>      together with ITS
>    whpx: arm64: clamp down IPA size
>    hw/arm, accel/hvf, whpx: unify get_physical_address_range between WHPX
>      and HVF
>    whpx: arm64: implement -cpu host
>    target/arm: whpx: instantiate GIC early
>    MAINTAINERS: Add myself as a maintainer for WHPX
> 
> Philippe Mathieu-Daudé (1):
>    accel/system: Introduce hwaccel_enabled() helper
> 
>   MAINTAINERS                                   |    9 +-
>   accel/hvf/hvf-all.c                           |    7 +-
>   accel/meson.build                             |    1 +
>   accel/whpx/meson.build                        |    7 +
>   {target/i386 => accel}/whpx/whpx-accel-ops.c  |    6 +-
>   accel/whpx/whpx-common.c                      |  666 +++++++++++
>   hw/arm/virt-acpi-build.c                      |    4 +-
>   hw/arm/virt.c                                 |   34 +-
>   hw/i386/x86-cpu.c                             |    4 +-
>   hw/intc/arm_gicv3_common.c                    |    3 +
>   hw/intc/arm_gicv3_whpx.c                      |  261 +++++
>   hw/intc/meson.build                           |    1 +
>   include/hw/arm/virt.h                         |    2 +
>   include/hw/boards.h                           |    3 +-
>   include/hw/intc/arm_gicv3_common.h            |    3 +
>   include/system/hvf_int.h                      |    2 +
>   include/system/hw_accel.h                     |   13 +
>   .../whpx => include/system}/whpx-accel-ops.h  |    4 +-
>   include/system/whpx-all.h                     |   20 +
>   include/system/whpx-common.h                  |   26 +
>   .../whpx => include/system}/whpx-internal.h   |   14 +-
>   include/system/whpx.h                         |    4 +-
>   meson.build                                   |   21 +-
>   target/arm/cpu.c                              |    3 +-
>   target/arm/cpu64.c                            |   19 +-
>   target/arm/hvf-stub.c                         |   20 -
>   target/arm/hvf/hvf.c                          |    6 +-
>   target/arm/hvf_arm.h                          |    3 -
>   target/arm/meson.build                        |    2 +-
>   target/arm/whpx/meson.build                   |    5 +
>   target/arm/whpx/whpx-all.c                    | 1021 +++++++++++++++++
>   target/arm/whpx/whpx-stub.c                   |   15 +
>   target/arm/whpx_arm.h                         |   17 +
>   target/i386/cpu-apic.c                        |    2 +-
>   target/i386/hvf/hvf.c                         |   10 +
>   target/i386/whpx/meson.build                  |    1 -
>   target/i386/whpx/whpx-all.c                   |  569 +--------
>   target/i386/whpx/whpx-apic.c                  |    2 +-
>   38 files changed, 2191 insertions(+), 619 deletions(-)
>   create mode 100644 accel/whpx/meson.build
>   rename {target/i386 => accel}/whpx/whpx-accel-ops.c (96%)
>   create mode 100644 accel/whpx/whpx-common.c
>   create mode 100644 hw/intc/arm_gicv3_whpx.c
>   rename {target/i386/whpx => include/system}/whpx-accel-ops.h (92%)
>   create mode 100644 include/system/whpx-all.h
>   create mode 100644 include/system/whpx-common.h
>   rename {target/i386/whpx => include/system}/whpx-internal.h (96%)
>   delete mode 100644 target/arm/hvf-stub.c
>   create mode 100644 target/arm/whpx/meson.build
>   create mode 100644 target/arm/whpx/whpx-all.c
>   create mode 100644 target/arm/whpx/whpx-stub.c
>   create mode 100644 target/arm/whpx_arm.h
> 

For the whole series:
Tested-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Booting a linux guest (direct kernel boot + edk2):
./build/qemu-system-aarch64.exe \
-M virt,accel=whpx \
-m 2048 \
-cpu host \
-kernel out/Image.gz \
./out/host.ext4 \
-nographic \
-append ' root=/dev/vda'

Thanks,
Pierrick

