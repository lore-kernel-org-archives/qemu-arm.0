Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9791F44847
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Apr 2026 12:22:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wBAsv-0005SG-PV; Fri, 10 Apr 2026 08:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wBAst-0005Rw-9g
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 08:22:51 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wBAsq-0003Yc-Sg
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 08:22:51 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-6501547d7edso2132510d50.0
 for <qemu-arm@nongnu.org>; Fri, 10 Apr 2026 05:22:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775823767; cv=none;
 d=google.com; s=arc-20240605;
 b=atvnhv8cmUgKECcBvVDPIO1lc/sjyGQhKqMa78fpRYGSTsOQZmy70zCxZF66JdvEyU
 MZM5PTzy1SLvKMCzDvt3Ne92uVQ6W2EcoxPeeKEjvCJ2d73PrFLrdhCdKOt7W1IFuJ/y
 NSN2sF+lZuy1XqJQQdNGcTOacDKASyCXXlM36JRbedLnAFK0xm9Ve6VgUT7IX5MVw1Kb
 ggRJs3C0HK6rc1rmbiJiBgXtacKUdTjFzXYZLSu2ypnf+FKfuNy6K+BcJbVKPINNpj6R
 lz7Amnqqdp8//CkG4qYLiSxg7AK233E1GMVSYItZbh8RLf1STvyyyrKVxZlsmERWcDEP
 Nllw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=IQOYafq9DurwFSwBvsJy2WTXL7HCMbbN3tocXrg2ZhM=;
 fh=t2sKkGstDghB3czcbxM4QBe1mur1GXHnh/bi70Y2+P0=;
 b=GNXv+2LEpqQjL0hYxpoTcGzHswVqvWv3ZWpkn5Lh3TE7KtsUJeOsvEF5yP1T3ZCexR
 FcfarQXvIOQRKp8odBXNjR26gwycMM9GS5hP1RoLrFct1gve0U4TR9hkIVCjGX0EgUdr
 31iZba9b+X7tyxu33FHAZ7uRykcDo1Ygi9jkKoBWv9zVmcLiChc2MF+p7pVkZ5Dn2a5P
 F3KXRr7o7Iqo2j0rmpx0xpn1lg1XmjQPN0x3ps1Rj6EUAgK+Fh7LIPv7qa7RB0o0Za07
 Q1kblVNgGAx8gB2o6CoXcy+hh+wlVIKSEzpfAZETTItnY55kQxoha3qSlfjMhexkvVpC
 h6Aw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775823767; x=1776428567; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IQOYafq9DurwFSwBvsJy2WTXL7HCMbbN3tocXrg2ZhM=;
 b=OuBkMxCYW+1onYBarzVVpYF4J5k8EHhkixgRhMjJYAXPWtaveSfvvwnKKatUvBZSHe
 I32AdT3bFdFSHF87HqcrVIDtgP8BcjZ+YyX4pUuxLYaaa5erT2t0oOl/a0bKCMP12Z2C
 DOAD6E8KeJUxW45VMXUkuj6jei8zlXLM2sc0eIeMlzlJPLBtRARV5aPDAlMRL4xtaObc
 ysWRVu0b4e9glyiimrUNlnHwHU4I7Hk1ukBQXXMW25XcSgadpN33xP4J/D49iWltaldt
 WpkGCTIOFfMAoTLJMlGLAfMDlz8mi0bNLvPWuuIBUgJQ6htQaUWarJ4+Vb7r3nxqYso4
 L4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775823767; x=1776428567;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IQOYafq9DurwFSwBvsJy2WTXL7HCMbbN3tocXrg2ZhM=;
 b=iJMWEN1SF3GlOdd0NDx9cLlwni8GAx/yBJIEQMG1McTk5FfJ9Jx7cVDcZklTUXkhMR
 8GCYy1uI425tbp/zjVa0IzLvFGVmu0zI/g5pVrFFtkS7MDSFaAhqkxqEp59p9PTMiY78
 qtzasKxQXqUQj9vFXfRvOF3CT8A9/NNOrsf5uBKYl1aCUyl+mBbwdb9+6e4jASFlnWVp
 f4+XMRimvosver5EC462y4aHNEBqb9pKzi1/k8AHy6jDbkTXT8kfwMy/2tRDdav4IT6Q
 iUgzB4JmXl6WkiaixP2Gtph9Q2peQPN+1ctMqaKDXgxEGL8KT/gXalM7h/7fufEp/JnD
 BcSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcIVRyJexbu5uTlSKgJ6SJCDEvxUKHDmdEJnxJp45jo8XhtZjUXVXDQYYdd5vIWHlmgOqqinVCTA==@nongnu.org
X-Gm-Message-State: AOJu0Yxrt3ZDuUlqRHSMdCFjyAR3UqP06nfv7lbnn+cmOq6RCtdFm2Bw
 xGNo7IS12sNhnnUHCw8IJejUaJzYgjwrom4cG2iyqJ1CidbhjzfS+IDuQCz47umzldiPouv/suq
 WnYiDW+1EvulC53JFhLGTANNtdH71vcaquPcPD9IJyA==
X-Gm-Gg: AeBDieugWiao8oZ15OmYqGU2evM5DVOC/fcKnh7wNR/AWqiSWJgTBO9mtz1vHwm6Pub
 Y+X38jdAWIrfEXVAuuPKAKOY85qprjMi1PzKCzGjHrb5gOwALdP0yDNqiaf/CQP3nyP9XfMf8Np
 c82xA9uEOGXuojy0xd6+bvZxn+uzPz2JoP+nmQgDBm8rtjrcgOKIECeWsJIyG8RFz+nurDQGwXE
 SN0iDSTlAalK19/LVeNQUYnnzxH/MImfEDBBGxSoGZEM1auCCXMl9tCwt3S5Ge+7kk8K6eYdW0z
 xD67wHzqzLI7ne6mg9ESRMNzvDJgkMYJVqLtoGdFfSIgKOErxwNKB5DwaTW9TXdY77k=
X-Received: by 2002:a53:c443:0:b0:64e:e0fc:a314 with SMTP id
 956f58d0204a3-65198c34e20mr1912312d50.69.1775823767489; Fri, 10 Apr 2026
 05:22:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260306150302.203112-1-eric.auger@redhat.com>
 <20260306150302.203112-5-eric.auger@redhat.com>
In-Reply-To: <20260306150302.203112-5-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Apr 2026 13:22:34 +0100
X-Gm-Features: AQROBzDDRqKWiw78YOUoqoxvOlCUrjLNmKtABV0dzE6KNtLiqxEQn1TmmChXFyA
Message-ID: <CAFEAcA_Vd8Uw+Ptdbt+MhYVejcxfcQLGVS_nkJiaACTtftuepg@mail.gmail.com>
Subject: Re: [PATCH v9 4/6] target/arm/cpu64: Define cpreg migration tolerance
 for KVM_REG_ARM_VENDOR_HYP_BMAP_2
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 cohuck@redhat.com, sebott@redhat.com, peterx@redhat.com, philmd@linaro.org, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
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

On Fri, 6 Mar 2026 at 15:03, Eric Auger <eric.auger@redhat.com> wrote:
>
> KVM_REG_ARM_VENDOR_HYP_BMAP_2 pseudo FW register is exposed
> from v6.15 onwards. Backward migration from a >= v6.15 to an older
> kernel would fail without cpreg migration tolerance definition
> for this register.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Sebastian Ott <sebott@redhat.com>
> ---
>  target/arm/cpu64.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 4cfddc6e8c0..abc6b78ef7d 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -833,6 +833,14 @@ static void kvm_arm_set_cpreg_mig_tolerances(ARMCPU *cpu)
>                                       0, 0, ToleranceNotOnBothEnds);
>      arm_register_cpreg_mig_tolerance(cpu, ARM64_SYS_REG(3, 0, 10, 2, 3),
>                                       0, 0, ToleranceNotOnBothEnds);
> +
> +    /*
> +     * KVM_REG_ARM_VENDOR_HYP_BMAP_2 pseudo FW register is exposed
> +     * from v6.15 onwards. Backward migration from a >= v6.15 to an older
> +     * kernel would fail without cpreg migration tolerance definition
> +     */
> +    arm_register_cpreg_mig_tolerance(cpu, KVM_REG_ARM_FW_FEAT_BMAP_REG(3),
> +                                     0, 0, ToleranceNotOnBothEnds);
>  }

If I understand the intention of this pseudoregister correctly, it's
for userspace control of what firmware features KVM exposes to the
guest. In that regard it's a bit like the KVM_REG_ARM_PSCI_VERSION
register, and as with that register I don't think the right
approach is "disregard any differences on migration". If we
exposed firmware feature X to the guest on the source then we
need to also expose it to the guest on the destination, because
it might be relying on it, and we shouldn't permit migration to
a destination kernel that can't implement X.

But I'm also not entirely sure what the nature of the mismatch
here is: https://docs.kernel.org/virt/kvm/arm/fw-pseudo-registers.html
says both
"By default, these registers are set with the upper limit of the
features that are supported"
but also that for the BMAP_2 bits that
"This is reset to 0".

So does the register reset to 0 such that all we need to handle
is "allow a source without the register as if it is zero, and
allow a source with the register even if the destination doesn't
have the register as long as the value is zero" ? Or is the
"reset to 0" bit wrong, and in fact the kernel defaults to
these bits being set, so we need something like the handling
of kvm-psci-version where the user can suppress the features
they need to give a "lowest common denominator" among the
kernels they want to migrate between ?

thanks
-- PMM

