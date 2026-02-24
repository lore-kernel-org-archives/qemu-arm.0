Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D112F3C984
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Feb 2026 14:34:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vutUy-0006ye-UT; Tue, 24 Feb 2026 09:34:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vutUx-0006yI-LQ
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 09:34:51 -0500
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vutUw-0000LJ-3h
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 09:34:51 -0500
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-64ae222d87dso5027076d50.2
 for <qemu-arm@nongnu.org>; Tue, 24 Feb 2026 06:34:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771943689; cv=none;
 d=google.com; s=arc-20240605;
 b=Zb81ZXevqotqwomUeIAmlH0YVJCatX4dze16NcdRrzeohWDoShHHc4RtAZq1meZgE3
 tr0gTCPVNytPbN6LxMxsXwaS5K3d2JMTMZdJjXrUNUEdn8rJkPAgJ3BvlzHoVtxl5Khj
 eS3SQD4pXBZZYiFeCyLySjRwRJrl4JW/7hreUaNxn4WhMY4roD8aieBg0io+UpkFmNzc
 GCKYj5KwbaYnC0c4kEeT0N75lf/lHJQCQNmBntWf+5RqEv7lwRNFwrgjzx92uqamYj4m
 tSfWVBv8opcf0OBnY1JvgeazjL7Ahy0Wjkl/KeYBSYJvQ+x0ZIvI4YmDAB+pdIp7fPYR
 mZmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=aflH0qDkgG4fC1sHybb7ibjojgZXGjJ7kgR08XJSBto=;
 fh=x5bEDFtxRhWgb/0a1ZBj6f3Tn6m/taQg8vQcALWTojE=;
 b=SXePjGVEbJconCFpRwMPnzyN/4mxZQ43FGsJM6+eRVbWvwwjTvzdiZyweE3QEBsiEt
 DtqQMijsOZk29rN7r6zqCCX/w4zoBnnLok5ObvqCy6bLCXPQjS9AwCKXIa4elGe4mmkM
 CGEYt2ipiC2DIMynP9Aewc/UWSe+3W5la/D4LRi8Kkd5Bxm/+ZlRIstxs5LJKnps18AB
 sE3xzunu+tIPX5fgIo8fsfY/EO57rNVO5wi1nIzbihW0SSU847ST7StBgOhpjGOC2hZM
 CoL6ck0uviwxiDAKr1dGU99Xg5WYhGqKbUV+Wo5YPmK1dsQ2nR9FLsVlI+FU4HL2lThm
 0/tQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771943689; x=1772548489; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aflH0qDkgG4fC1sHybb7ibjojgZXGjJ7kgR08XJSBto=;
 b=ZAZQorgmGwIO3VK/Emhojicui4U2V8OFumHsUSPI1CJiySewhheWguOp4UqDzC2InD
 rYZ8XzmcOeWglNCLmytLJFrPYIvrULeXsFppOKK2Xzg9/FY7Psn9gUAmzBkE6tOeqP9I
 /4vD/Kda1XsWMa1BJjcwSW3jzp7hF1RqcgoduJShMlA9wdy5PAXrCfWzqW0Ky0P9PFIw
 QWQ1AjmeotKyoeGw0Kzvn75yc71Act/6ZgV7yaJvsllZ9bJ98HfhgxJwmI1qoq4a2P1t
 7ieBjwCiRXGm9TR3nYjE6tP7ePBjuG+RGZ63V8e1WzshASkIP7xVOJAemFTSLBsKw1qo
 fQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771943689; x=1772548489;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aflH0qDkgG4fC1sHybb7ibjojgZXGjJ7kgR08XJSBto=;
 b=v8Lq6JS8AYb8S6Xv6sNX9BInds9NHNgMb2w7vqI11qe0PmsIWkNAqw2R0LlJiYh+5D
 fvlORB6BpWuiF9/NGyzmz7Q/ewFm8+pKHa1M806prjmed/I5Tno9RQnPBUNCltdB345V
 nCSdG3PvevpmKa8JXGYNI1izI69P8PpB3T3vJpu8EWGFp5omoZKpjBrCZ0ylIoGqF2Gk
 OoGAHNfpQdxoCCL6ON5HTjgt0QGuwyryILaaohz0dpd3C0F1vUY0B1d6tYX4k6QHHDRY
 8lCKWCwhI624qEzC71xitb44oM+EgTzIH9qvjtuXdLkefnuMslfboD+zU/RVlRsha5Bx
 oZbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnBSAojQM7MY6r0KzznUalOLNHyVy80ae6qv6s3yB5MQ/YbHebLnOz7oTLfCvVIymYZ83roVG0qg==@nongnu.org
X-Gm-Message-State: AOJu0YzhKlo+Z0aJe9fqKZGFlclbd24peOgQMasf/1PzmT7vpVmWruXw
 BQbA6YJXtMP1Lkj0obXqv0LkHbfwq3m0zMygg2CaY+IQ5hcgPTZawSiyjTJlZfoNOptdiRdYNlv
 iic/GD+HMKu24GG3UF0Bv23Us4JOu5jPkwXRhCoELNQ==
X-Gm-Gg: ATEYQzzjC9WyA0qgjm0Xf+OxbcBQ74qvHBWwEJIkcbiPS2lKkCU0mxTwusqGY1rEcDK
 kmD4TC/URLUbeVqM/MbdceRB+g23V+PL85MhpD02TFEQznGz1Oj4X9WK8kNupA43KeeTx52Pmln
 Iw5UcpRFnViEyJZxYyZodfIP0cCQbnFII8S54lamjHIedTPN9RUk5/4+bqHF1E8iKuwOq0YIy4o
 MzDIPjff7kypT/PSXYVnX3dgHYZtK3XeDLLjesEXYRBQcCQ9nvAk8dEK883iXMeCU+7Et859NFe
 0SCctuIxw9h55kKxmw3TCzR3yZ4aAA288Hg34YNPIVONcbg8I1kfaETZtIcReZxNAxo=
X-Received: by 2002:a05:690e:dc2:b0:64a:d9f5:d412 with SMTP id
 956f58d0204a3-64c78c1054cmr9104750d50.43.1771943688633; Tue, 24 Feb 2026
 06:34:48 -0800 (PST)
MIME-Version: 1.0
References: <20260220115656.4831-1-sebott@redhat.com>
 <20260220115656.4831-2-sebott@redhat.com>
In-Reply-To: <20260220115656.4831-2-sebott@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Feb 2026 14:34:37 +0000
X-Gm-Features: AaiRm515uOhz39gYNVWQiyM_zHuBmfxeUElFEXao9Pe5eZx0PQvwmWIjvVpaqkY
Message-ID: <CAFEAcA8O2UEKToJ+zXA6=vvgkRyPKrPwtfHnti7yyGgCGwoJeA@mail.gmail.com>
Subject: Re: [PATCH v6 1/1] target/arm/kvm: add kvm-psci-version vcpu property
To: Sebastian Ott <sebott@redhat.com>
Cc: qemu-devel@nongnu.org, eric.auger@redhat.com, kvm@vger.kernel.org, 
 kvmarm@lists.linux.dev, pbonzini@redhat.com, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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

On Fri, 20 Feb 2026 at 11:57, Sebastian Ott <sebott@redhat.com> wrote:
>
> Provide a kvm specific vcpu property to override the default
> (as of kernel v6.13 that would be PSCI v1.3) PSCI version emulated
> by kvm. Current valid values are: 0.1, 0.2, 1.0, 1.1, 1.2, and 1.3
>
> Note: in order to support PSCI v0.1 we need to drop vcpu
> initialization with KVM_CAP_ARM_PSCI_0_2 in that case.
>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Tested-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Sebastian Ott <sebott@redhat.com>
> ---
>  docs/system/arm/cpu-features.rst | 11 ++++++++
>  target/arm/cpu.c                 |  8 +++++-
>  target/arm/kvm.c                 | 48 ++++++++++++++++++++++++++++++--
>  3 files changed, 64 insertions(+), 3 deletions(-)
>
> diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
> index 3db1f19401..ce19ae6a04 100644
> --- a/docs/system/arm/cpu-features.rst
> +++ b/docs/system/arm/cpu-features.rst
> @@ -204,6 +204,17 @@ the list of KVM VCPU features and their descriptions.
>    the guest scheduler behavior and/or be exposed to the guest
>    userspace.
>
> +``kvm-psci-version``
> +  Set the Power State Coordination Interface (PSCI) firmware ABI version
> +  that KVM provides to the guest. By default KVM will use the newest
> +  version that it knows about (which is PSCI v1.3 in Linux v6.13).
> +
> +  You only need to set this if you want to be able to migrate this
> +  VM to a host machine running an older kernel that does not
> +  recognize the PSCI version that this host's kernel defaults to.
> +
> +  Current valid values are: 0.1, 0.2, 1.0, 1.1, 1.2, and 1.3.
> +
>  TCG VCPU Features
>  =================
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 10f8280eef..60f391651d 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1144,7 +1144,13 @@ static void arm_cpu_initfn(Object *obj)
>       * picky DTB consumer will also provide a helpful error message.
>       */
>      cpu->dtb_compatible = "qemu,unknown";
> -    cpu->psci_version = QEMU_PSCI_VERSION_0_1; /* By default assume PSCI v0.1 */
> +    if (!kvm_enabled()) {
> +        /* By default KVM will use the newest PSCI version that it knows about.
> +         * This can be changed using the kvm-psci-version property.
> +         * For others assume PSCI v0.1 by default.
> +         */
> +        cpu->psci_version = QEMU_PSCI_VERSION_0_1;
> +    }
>      cpu->kvm_target = QEMU_KVM_ARM_TARGET_NONE;
>
>      if (tcg_enabled() || hvf_enabled()) {
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index ded582e0da..5453460965 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -485,6 +485,28 @@ static void kvm_steal_time_set(Object *obj, bool value, Error **errp)
>      ARM_CPU(obj)->kvm_steal_time = value ? ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF;
>  }
>
> +static char *kvm_get_psci_version(Object *obj, Error **errp)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    return g_strdup_printf("%d.%d",
> +                           (int) PSCI_VERSION_MAJOR(cpu->psci_version),
> +                           (int) PSCI_VERSION_MINOR(cpu->psci_version));
> +}
> +
> +static void kvm_set_psci_version(Object *obj, const char *value, Error **errp)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +    uint16_t maj, min;
> +
> +    if (sscanf(value, "%hd.%hd", &maj, &min) != 2) {

%hd is a signed value, so this will accept "-3.-5" I think ?
Probably we want %hu.

(If you agree I can just make this fix locally, no need for you to respin.)

-- PMM

