Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA840EE20A6
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Feb 2026 15:00:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1voNJG-0004SA-IX; Fri, 06 Feb 2026 09:59:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1voNIw-00047U-O7
 for qemu-arm@nongnu.org; Fri, 06 Feb 2026 09:59:33 -0500
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1voNIu-0000Ba-5K
 for qemu-arm@nongnu.org; Fri, 06 Feb 2026 09:59:30 -0500
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-7946a1f2430so8194197b3.1
 for <qemu-arm@nongnu.org>; Fri, 06 Feb 2026 06:59:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770389967; cv=none;
 d=google.com; s=arc-20240605;
 b=Ngb1F48RlVX6+kMOvsFecRJ0KhfoUNLDQGTCT/6h/YsqsAUByYb6vD43MrGr0cZoBo
 gSnyW5PSQgc9vEB+KANEKjfqTlL539m1ZuoW1YQKz2rpviZOvuo7dAZltZzad94N1vYt
 9RH09vcmSQF+tXX691pJZstskUA49Xkj3Lyh2CQmPJxbrPhVi8NSIcxb7xc047MwSU7F
 gUuQ+9nnI10A+IQF37nqBbqkFQRMbw/rp4o9T7iW6Be6mnqa07qN1rAb+lvxdTLFl9NO
 ag5CckjAirnwQQFf0Y/Ogy8OPjnohw5ix3uaVYB18HARQks8Iu3nvcb8NdZGDlTNfzBn
 Za+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Djjd+78eL/gLTndXMnYafFf7JN6pIz42e4sPAJ7o4XM=;
 fh=Gdi9lVZEeGeQHthF9h1hXjCQm6z1sIAmU1TrQiuUY2M=;
 b=fr06/7a7urZoWppq3/1fRXWYMKt5fMuHIPZPS2eeT6T15OIbKsFtsPQJVN7BUnEyz3
 MQk5d6e5bI0CtQWaVVMypetvsUMPzkCHBbbg5B888BgCv71lAwxXd/enMMciVInbRWaf
 c7Gp3QiD12Lli/0JYXHdrQESAlRE5RnT43GmxyEUA4W/DRYyiuRKquBHKyqOfv52oMia
 Sbl9w9xNMd0E8JFaj2lRHFREnpHWPT9XLgkS3LohMOZGS89JLMRaVijFuQwRVPUGwNw5
 OtT1kgW2KKwZy1/sT+L5InDbCFCjOAw0MHCE815ch+fwxhFGojfvFCVRsLHfIJHnECVU
 jhLQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770389967; x=1770994767; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Djjd+78eL/gLTndXMnYafFf7JN6pIz42e4sPAJ7o4XM=;
 b=zO5J7aIkjGdjVnYht3yp5JypW3O2H4v0yBkwgKEo9dquR9w4JNqyttrBo40UGSe3De
 Lvy+oJJ47//0sEV8E0eO5DBh4Mxit0tojq+d3ll29P85zDkNlvLm783NNFWlfcZX6buU
 sWNW+xS8HMhnVaVhC1g8b7F4ts7qUoTgDdHwt5HcXpzxzt4HETUCwkdzZf8ZfJp695mA
 okdsnjJ6Xe5S1JLap1sRFRm/sSaDu8lws/xYtOPxkDVu4YEB5kNV8kFjuzE1SBb1t8Al
 nixt+wewHy+49jGVcBEssfwn5sKKx511rizjsfSZIJx0G/7mFa6cZ4cTZ7DBtsX46YJr
 4+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770389967; x=1770994767;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Djjd+78eL/gLTndXMnYafFf7JN6pIz42e4sPAJ7o4XM=;
 b=KzB4X2MBqa4A8prypx0lsPcUxjJvQ1TA2usjolDsk/BecK+m2qkLDFI7ScDtAqUP+c
 goEYKfNxYYNijFp7Tpxs4o/jFR03/lHaG3cDqqjftwlIaUGXpD0MaBZoJzStpVIIBtph
 5iS3l+cstaqaoms03qet8lo9cmKM/z64oX800IERGNByMVgqLZbnDTNAPmOrcV2E0tEQ
 Y7ZRC16GjcUTpmUs4KIIx2guGmBek+98NHJML50dMhpqOBP5+7z8qYcotFaGddkVMtK6
 Sshjyj2D28ftcKgo3yP4lLDQ4if7AVRZXMfYI03V/AiwPbbYUOGhjQQIWO6M3bx5Rfbu
 NUAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgJdHdp+d1LzYkova4oMq9Zu41kCW+P4iKwxVOxlxkR7nX05dfMDbNWN9/TrdWTehGWBIp+iKSGw==@nongnu.org
X-Gm-Message-State: AOJu0Yz95Mi6aFweZloVxsMhSKuxxvrf/H+B77YfipLjwCLlplpGQ41/
 ztDbjYni+0dwiNqOmLzctss4oTi2DfQ1vedHbkcj6hJUup6K6qtU6qO2260xJI2YfH+SgzBYLkc
 B75V+7suWds7rtv4sZBBao2n4rl+zuRJgqwJWObjSog==
X-Gm-Gg: AZuq6aLb605k7KWoip5XYtpnxS5TqwFHzAo1HEYTfJ+3NFIp9fwVrIdJhVrh/4GrC+j
 cDwNDqFuSvtobx5cZVguz8tOLO+yW1VV0LSe5TPnzoOJz2uZmxFtcUvpd+H9tN5/lRHJ8qqYrun
 TFFJagZ+tMnF6ZGPsLo7M/yDYrlZKj3XHxDqeLqKLUvh6mLLstpavU5LrqsC27s3Se9nuKwfqkw
 VGozP4S8UgajJTfu6Dhpor1Kub/fQ4PZRfu2dmXWA3AVmiUQvjULXalfjl5HQLx0EOkTI782AuJ
 CfEBUCvbpMBXX1PCWO3lQ3bfdn0d6dQpqa+BaqtK2OE0b/UjuKVF7g8=
X-Received: by 2002:a05:690c:88a:b0:796:2976:a452 with SMTP id
 00721157ae682-7962976ac35mr4095557b3.23.1770389966783; Fri, 06 Feb 2026
 06:59:26 -0800 (PST)
MIME-Version: 1.0
References: <20251202160853.22560-1-sebott@redhat.com>
 <20251202160853.22560-3-sebott@redhat.com>
In-Reply-To: <20251202160853.22560-3-sebott@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Feb 2026 14:59:14 +0000
X-Gm-Features: AZwV_QgieJzeeTFJCFpBW88yIXQg35x305xf0x9-4d4AF9icH8OLR1uAx6S_ojM
Message-ID: <CAFEAcA8oi1Xs2kv66dFV9NZore+Q2vHUsgMikveVdN1c+3SBJQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] target/arm/kvm: add kvm-psci-version vcpu property
To: Sebastian Ott <sebott@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 2 Dec 2025 at 16:09, Sebastian Ott <sebott@redhat.com> wrote:
>
> Provide a kvm specific vcpu property to override the default
> (as of kernel v6.13 that would be PSCI v1.3) PSCI version emulated
> by kvm. Current valid values are: 0.1, 0.2, 1.0, 1.1, 1.2, and 1.3
>
> Note: in order to support PSCI v0.1 we need to drop vcpu
> initialization with KVM_CAP_ARM_PSCI_0_2 in that case.
>
> Signed-off-by: Sebastian Ott <sebott@redhat.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> ---
>  docs/system/arm/cpu-features.rst |  5 +++
>  target/arm/cpu.h                 |  6 +++
>  target/arm/kvm.c                 | 64 +++++++++++++++++++++++++++++++-
>  3 files changed, 74 insertions(+), 1 deletion(-)

Hi; this patch seems generally reasonable to me as a way to handle
this kind of "control" register; for more discussion I wrote a
longer email in reply to Eric's series handling other kinds of
migration failure:
https://lore.kernel.org/qemu-devel/CAFEAcA-gi42JObOjLuPudABX8WRdWf5SzSbkzU-bd06ecF1Vog@mail.gmail.com/T/#me03ebff8dbd8f58189cd98c3a21812781693277e

Unless discussion in that thread reveals that we have so many of
this kind of "control" knob that we would prefer a generic
solution rather than per-knob user-friendly names and values,
I'm OK with taking this patch without completely resolving the
design discussion on that other series first.

My review comments below are fairly minor, and patch 1 of
this series has already been applied upstream now.

> diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
> index 37d5dfd15b..1d32ce0fee 100644
> --- a/docs/system/arm/cpu-features.rst
> +++ b/docs/system/arm/cpu-features.rst
> @@ -204,6 +204,11 @@ the list of KVM VCPU features and their descriptions.
>    the guest scheduler behavior and/or be exposed to the guest
>    userspace.
>
> +``kvm-psci-version``
> +  Override the default (as of kernel v6.13 that would be PSCI v1.3)
> +  PSCI version emulated by the kernel. Current valid values are:
> +  0.1, 0.2, 1.0, 1.1, 1.2, and 1.3

I think we could be a little more detailed here.


``kvm-psci-version``

  Set the Power State Coordination Interface (PSCI) firmware ABI version
  that KVM provides to the guest. By default KVM will use the newest
  version that it knows about (which is PSCI v1.3 in Linux v6.13).

  You only need to set this if you want to be able to migrate this
  VM to a host machine running an older kernel that does not
  recognize the PSCI version that this host's kernel defaults to.

  Current valid values are: 0.1, 0.2, 1.0, 1.1, 1.2, and 1.3.


> +
>  TCG VCPU Features
>  =================
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 39f2b2e54d..e2b6b587ea 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1035,6 +1035,12 @@ struct ArchCPU {
>      bool kvm_vtime_dirty;
>      uint64_t kvm_vtime;
>
> +    /*
> +     * Intermediate value used during property parsing.
> +     * Once finalized, the value should be read from psci_version.
> +     */
> +    uint32_t kvm_prop_psci_version;
> +
>      /* KVM steal time */
>      OnOffAuto kvm_steal_time;
>
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 0d57081e69..cf2de87287 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -484,6 +484,49 @@ static void kvm_steal_time_set(Object *obj, bool value, Error **errp)
>      ARM_CPU(obj)->kvm_steal_time = value ? ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF;
>  }
>
> +struct psci_version {

Nit: our coding style says struct type names should be in
CamelCase, and structs should have a typedef rather than
being used as "struct foo".

> +    uint32_t number;
> +    const char *str;
> +};
> +
> +static const struct psci_version psci_versions[] = {
> +    { QEMU_PSCI_VERSION_0_1, "0.1" },
> +    { QEMU_PSCI_VERSION_0_2, "0.2" },
> +    { QEMU_PSCI_VERSION_1_0, "1.0" },
> +    { QEMU_PSCI_VERSION_1_1, "1.1" },
> +    { QEMU_PSCI_VERSION_1_2, "1.2" },
> +    { QEMU_PSCI_VERSION_1_3, "1.3" },
> +    { -1, NULL },
> +};
> +
> +static char *kvm_get_psci_version(Object *obj, Error **errp)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +    const struct psci_version *ver;
> +
> +    for (ver = psci_versions; ver->number != -1; ver++) {

Using ARRAY_SIZE() to set the loop bound is nicer than requiring
a sentinel value at the end of the array.

> +        if (ver->number == cpu->psci_version)
> +            return g_strdup(ver->str);
> +    }
> +
> +    return g_strdup_printf("Unknown PSCI-version: %x", cpu->psci_version);

Is this ever possible?

> +}
> +
> +static void kvm_set_psci_version(Object *obj, const char *value, Error **errp)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +    const struct psci_version *ver;
> +
> +    for (ver = psci_versions; ver->number != -1; ver++) {
> +        if (!strcmp(value, ver->str)) {
> +            cpu->kvm_prop_psci_version = ver->number;
> +            return;
> +        }
> +    }
> +
> +    error_setg(errp, "Invalid PSCI-version value");

"PSCI version".

> +}
> +
>  /* KVM VCPU properties should be prefixed with "kvm-". */
>  void kvm_arm_add_vcpu_properties(ARMCPU *cpu)
>  {
> @@ -505,6 +548,12 @@ void kvm_arm_add_vcpu_properties(ARMCPU *cpu)
>                               kvm_steal_time_set);
>      object_property_set_description(obj, "kvm-steal-time",
>                                      "Set off to disable KVM steal time.");
> +
> +    object_property_add_str(obj, "kvm-psci-version", kvm_get_psci_version,
> +                            kvm_set_psci_version);
> +    object_property_set_description(obj, "kvm-psci-version",
> +                                    "Set PSCI version. "
> +                                    "Valid values are 0.1, 0.2, 1.0, 1.1, 1.2, 1.3");
>  }
>
>  bool kvm_arm_pmu_supported(void)
> @@ -1959,7 +2008,12 @@ int kvm_arch_init_vcpu(CPUState *cs)
>      if (cs->start_powered_off) {
>          cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_POWER_OFF;
>      }
> -    if (kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PSCI_0_2)) {
> +    if (cpu->kvm_prop_psci_version != QEMU_PSCI_VERSION_0_1 &&
> +        kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PSCI_0_2)) {
> +        /*
> +         * Versions >= v0.2 are backward compatible with v0.2
> +         * omit the feature flag for v0.1 .
> +         */
>          cpu->psci_version = QEMU_PSCI_VERSION_0_2;
>          cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_PSCI_0_2;
>      }
> @@ -1998,6 +2052,14 @@ int kvm_arch_init_vcpu(CPUState *cs)
>          }
>      }
>
> +    if (cpu->kvm_prop_psci_version) {
> +        psciver = cpu->kvm_prop_psci_version;
> +        ret = kvm_set_one_reg(cs, KVM_REG_ARM_PSCI_VERSION, &psciver);
> +        if (ret) {
> +            error_report("PSCI version %"PRIx64" is not supported by KVM", psciver);

Could we make the PSCI version human-readable rather than hex here?
If hex, we need the leading 0x.

We can also suggest to the user the solution to this problem:

  error_report("KVM in this kernel does not support PSCI version 0x%" PRIx64 ");
  error_printf("Consider setting the kvm-psci-version property on the
migration source.\n")

(watch out that error_report() strings end without a trailing \n
but error_printf() ones must have a \n.)

thanks
-- PMM

