Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B396CAC58E
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Sep 2025 16:33:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uwkE8-0006Uf-Rs; Thu, 11 Sep 2025 12:32:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uwkE6-0006Tv-S3
 for qemu-arm@nongnu.org; Thu, 11 Sep 2025 12:32:51 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uwkE4-0001Ze-LD
 for qemu-arm@nongnu.org; Thu, 11 Sep 2025 12:32:50 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-61381743635so630903d50.1
 for <qemu-arm@nongnu.org>; Thu, 11 Sep 2025 09:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757608367; x=1758213167; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3oSOMVjrhS6G3pVuMKnnpOUFEcnFdvdNa1gz4DKRv8Q=;
 b=EeowSevHGbdMOnaQzZnINosOzczgKVVTHu7MsfRpsNbnWGA9ooD6FELGMd2sRRNc/+
 xwErbIvip1irld/omdFTgtQhKwxTJHLKcbEq8yepTjTVnPR2b8C7CSCin4bWWGDsI6Wd
 GlSZeQN5DMiLnwxpXowAYviFKgSahW5296nWFj8gJYmzreqZ/p9szLZ8oJO1TgY0Twoj
 j4wkgiEtBJU/ikvHfFZYRc3ygSfKxl+GQe8Da/QMFKkVtbVN1B0uIAKULGKdwXrQwLcA
 bOkH8m2mCtNicsA77SGt2SQZEJQ/JCpMJS68CAW93lBCl5UAp9e+SW6stg37tY0KMorr
 2sSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757608367; x=1758213167;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3oSOMVjrhS6G3pVuMKnnpOUFEcnFdvdNa1gz4DKRv8Q=;
 b=RWhQxCGNnflS9qQTqSbXqtRCmNFFrcWRTws767LSlWEdLd9ayHJbn0Ob6XcMu7sD0P
 Loa1ne8rSqi+MuWJxDKqfvXG3pdF8qaE43C3NlCqRxhk8CN3Y6Wr6cQCj9pS1SvRLZ1j
 ksjG/jQZqafCovW/qKyVfJdsmPeRxtd4I0VF/0aJNbynF5aJDuyY0VpVlE95NuRsyoQg
 SffBK6JY5Qaf3KTDw/WAxB0IrEBA5TpT9jr9OY9/RKQlLp6KwZWoSASXiLRYBExPWzZB
 a+zvjr8pJkmeuBaU39BDq+7Pn6iO1JIbAe4j02x+5ErLHwAr4iCOtxsXCMFdDC6Izt9C
 4NOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0mkBrXvm01ksFEcKKLzzOTNaSp44GouX6BOUFxZRboBys3XL4ewc5VVpyl8sayqEDkvmC5QT73w==@nongnu.org
X-Gm-Message-State: AOJu0YzSeKqE/1eOuOdJTytMRj5cnqNDlW+JlhJe3Pjugdc2r/Cc/MZH
 jPtJ7M69R4vPVK+m7L4ciVtZ97OgJj7/njA8qaBIkBCBqs9LOpyADhltIkLSiPpiKO5zwiFO0Zz
 EZhTjZkpjWK0KnBkAb15Lq+VHSZ7JBgjV5ByaK9/p+g==
X-Gm-Gg: ASbGncuOfecpOhq5Avd/R63yt4/7zPnGBlRnHq9I1GGEi96xbmXRJJWUoxU7IprOLhe
 ROaXQcegi41aQe3mejDuFToPZhiVZsXhdhxL6JU/zD/BINJfLpLKM5qUDT0s9uBm4wFfA72KGc6
 6tpN0JR5zEfQsQfKBH13ljs4/b7ixUr0FYpt1kNDA99q2AzLMH3Pw9bdvnNyAQ6ObjI5NlA4MJr
 eQpEbkfvIhx7+uxrg0=
X-Google-Smtp-Source: AGHT+IGeH4N1vRnvak9qS44/0yvd4kSpobvGAPZaf480hH7OvuTCc6WKyKo4fqYHz2dGmlPhCMyjzhePDUvTwh237O4=
X-Received: by 2002:a05:690e:1a59:b0:5fd:9dff:f343 with SMTP id
 956f58d0204a3-62720222db3mr166980d50.20.1757608366474; Thu, 11 Sep 2025
 09:32:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250911144923.24259-1-sebott@redhat.com>
 <CAFEAcA8EDJT1+ayyWNsfdOvNoGzczzWV-JSyiP1c1jbxmcBshQ@mail.gmail.com>
 <8bca09f1-48fe-0868-f82f-cdb0362699e1@redhat.com>
 <CAFEAcA8hUiQkYsyLOHFQqexzY3u4ZZZBXvi+DuueExGdJi_HVQ@mail.gmail.com>
 <3176813f-77c0-4c39-b363-11af3b181217@redhat.com>
In-Reply-To: <3176813f-77c0-4c39-b363-11af3b181217@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Sep 2025 17:32:33 +0100
X-Gm-Features: Ac12FXyeDpESW098EQeaKffAkGnL6LiJ4UVpPXhZdC_pEr0Pe8Dw3xSUiOGspuo
Message-ID: <CAFEAcA_ui7iyKx36fuhmOqizRWnNppb9B1iPc4nAxU2VnovMOQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm: add kvm-psci-version vcpu property
To: Sebastian Ott <sebott@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Thu, 11 Sept 2025 at 17:29, Sebastian Ott <sebott@redhat.com> wrote:
>
> On Thu, 11 Sep 2025, Peter Maydell wrote:
> > On Thu, 11 Sept 2025 at 16:59, Sebastian Ott <sebott@redhat.com> wrote:
> >>
> >> On Thu, 11 Sep 2025, Peter Maydell wrote:
> >>> On Thu, 11 Sept 2025 at 15:49, Sebastian Ott <sebott@redhat.com> wrote:
> >>>>
> >>>> This series adds a vcpu knob to request a specific PSCI version
> >>>> from KVM via the KVM_REG_ARM_PSCI_VERSION FW register.
> >>>>
> >>>> Note: in order to support PSCI v0.1 we need to drop vcpu
> >>>> initialization with KVM_CAP_ARM_PSCI_0_2 in that case.
> >>>> Alternatively we could limit support to versions >=0.2 .
> >>>>
> >>>> Sebastian Ott (2):
> >>>>   target/arm/kvm: add constants for new PSCI versions
> >>>>   target/arm/kvm: add kvm-psci-version vcpu property
> >>>
> >>> Could we have some rationale, please? What's the use case
> >>> where you might need to specify a particular PSCI version?
> >>
> >> The use case is migrating between different host kernel versions.
> >> Per default the kernel reports the latest PSCI version in the
> >> KVM_REG_ARM_PSCI_VERSION register (for KVM_CAP_ARM_PSCI_0_2) -
> >> when that differs between source and target a migration will fail.
> >>
> >> This property allows to request a PSCI version that is supported by
> >> both sides. Specifically I want to support migration between host
> >> kernels with and without the following Linux commit:
> >>         8be82d536a9f KVM: arm64: Add support for PSCI v1.2 and v1.3
> >
> > So if the destination kernel is post that commit and the
> > source kernel pre-dates it, do we fail migration?
>
> This case works with current qemu without any changes, since on
> target qemu would write the register value it has stored from
> the source side (QEMU_PSCI_VERSION_1_1) and thus requests kvm
> on target to emulate that version.
>
> > Or is
> > this only a migration failure when the destination doesn't
> > support the PSCI version we defaulted to at the source end?
>
> Yes, this doesn't work with current qemu. On target qemu would
> write QEMU_PSCI_VERSION_1_3 to the KVM_REG_ARM_PSCI_VERSION
> register but that kernel doesn't know this version and the
> migration will fail.

I was under the impression that trying to migrate backwards
from a newer kernel to an older one was likely to fail
for various reasons (notably "new kernel reports a new
system register the old one doesn't") ?  Perhaps we should
think about the problem in a wider scope than just the
PSCI version...

thanks
-- PMM

