Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp474548lfg;
        Thu, 1 Apr 2021 06:16:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMdJVyrfg/21d3opFp0vPxXNZDDkedkWTT17Fa8eABWXO3gF5aLGzsqgCS9Et+mPXvO/nB
X-Received: by 2002:a05:6512:3390:: with SMTP id h16mr5485983lfg.479.1617282965099;
        Thu, 01 Apr 2021 06:16:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617282965; cv=none;
        d=google.com; s=arc-20160816;
        b=RkFp17pcxuHQWmPG+hWL1L9m756zIzdX5REfySMokH414MEEFvR7DVOtod2OKp7/N2
         OeaDC3qh9RlBTKtJ1MDbbw7cm0QfxAPogBjsy4lmO+31TgTWVHYZd5e34Z8esuiOWYex
         fgWn4/O3MFhwW/MN25M38lx/ShvUEBjpcgUOnmUm+n1HSOjecgPQiYEYsgAGmho99ZCX
         uEFkCBiTUDpTS0mvDaTdYCcGTyg18RJXNjj4D1w3e1zREIEn74kXSIIVZFGF92nPDxcY
         i8DEYkcBdW69olh3gM0rY3m2pHD25Y4ZmJwHjlw9wUDfCeVBsqtDAYjbHhWX58PTuWcp
         vLtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AWKPTT8bNs5FG2jpgPpLGL6k9c9hv8L6LF1Nt8/Fn00=;
        b=npA94qObatZkfNca36WzCpnmGFzPibnLDBpQHAPEz/hhJ8CgAimpuMNtMl8IvHbKMP
         FSCTDqRRnm5HltCiSLwyo1Ne19F67GN4+jxjRCsVwMZpHI0rDQVW/ryX9k2imqqVPEHO
         j7LynhjiisgSsGOnfC3Z06tDtmlI5B3wzGlRtDORIMyDN7CPZHaL1YLGhXgvWg91dLVu
         BPviOpCFty6SHZkFxPm/86bPRT1JkDslv0CVnBCnpb2ksHpkf7G6SxsPdlPRe/H+5u+w
         iEVwfm3y7Uvd0nIsnFNPktaYpEMlTrxf4vboqvnFAmdz29c9lTbjMDUVyyKHbW0NwCip
         Aq2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Gt7LsmAW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j8si5066236lfk.544.2021.04.01.06.16.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Apr 2021 06:16:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Gt7LsmAW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lRxB5-0005sR-RV
	for alex.bennee@linaro.org; Thu, 01 Apr 2021 09:16:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRx8J-0002q1-Ja
 for qemu-arm@nongnu.org; Thu, 01 Apr 2021 09:13:11 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:41563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRx8H-0004gh-9P
 for qemu-arm@nongnu.org; Thu, 01 Apr 2021 09:13:11 -0400
Received: by mail-io1-xd2d.google.com with SMTP id z3so2131857ioc.8
 for <qemu-arm@nongnu.org>; Thu, 01 Apr 2021 06:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AWKPTT8bNs5FG2jpgPpLGL6k9c9hv8L6LF1Nt8/Fn00=;
 b=Gt7LsmAWwFEZ294snmu51+HyNPR1JdtvagV1IKcTy+GXhh5eW0ZSce0V7BKiVFhOVg
 WRmV70Et46St0hSf/lWU18pQvyaukWHzGLIsIXiJdoQnQdLDHUEJTtyN1FSmZUsYw2UL
 lyTopcR5s5O7dc/b9eHCol2djM20wfVwFuI0eITJoHjSffP4SdkgWwa+131JpObS3eSf
 umSmKYDxddEHtSNliDi2W43HwwVV3Jmp8PnQillyPMF5fSc8TVAdvkK4f8jprdGw3Cpm
 vkRFSJAh+MPBtGPQp72QnGWWUac/kcDFk2wMl9qkcDPCBjqL6/FJOH5v6wug69Ox1+d7
 MyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AWKPTT8bNs5FG2jpgPpLGL6k9c9hv8L6LF1Nt8/Fn00=;
 b=MUAX1d66Ct1U/ULroxM/ArgZ6nqu6DtKK7Ubjua7in9hOXoABDINmiRB4e1Pmb0M+k
 tFoAn1au8tvnSv1HWNkcqPX0edKvf9FZFXhrV0hl97+sleEk2THTEkQ6eqdKpEhqwy5T
 OIy8aUBIUubK8cD1dqA4VdACGhXMpRjogVS3RPCamNyEcyiyFMQO617m7fJz/Vsn9o19
 Qwz130ZmhvUTRE1MXqHvyWqvUOpAOKbGnfzGbN4WgVE0oiP1kAbJirHsgIyyZe2+fQtl
 DvirE2K/K8vsVpCZAbORUiCPp9upGPrYSlQDwYB2v6ZpggZm7tORaIMzOjk0rNhJuwd9
 sZRw==
X-Gm-Message-State: AOAM531fchH3jwSgs1LqrKtumfCpOk5hoLY7GR3R0a4Qnuw0UzYyake4
 hhi4nb2VOIscT741KFQhyiZMrvoWUTGGS4FUQsfx
X-Received: by 2002:a02:a303:: with SMTP id q3mr7975812jai.32.1617282787054;
 Thu, 01 Apr 2021 06:13:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1615972140.git.haibo.xu@linaro.org>
 <5f269099f5f06c23f11d41b45d64f77eca23a8ff.1615972140.git.haibo.xu@linaro.org>
 <87tuozo28v.fsf@secure.mitica>
In-Reply-To: <87tuozo28v.fsf@secure.mitica>
From: Haibo Xu <haibo.xu@linaro.org>
Date: Thu, 1 Apr 2021 21:12:55 +0800
Message-ID: <CAJc+Z1EzD_5gXHMSbWBh0aEj-LC+yYT0acya8AvrQRmPcE4aFA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/5] Add APIs to get/set MTE tags
To: Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=haibo.xu@linaro.org; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9DGkjQSyRdeO

On Thu, 25 Mar 2021 at 20:18, Juan Quintela <quintela@redhat.com> wrote:
>
> Haibo Xu <haibo.xu@linaro.org> wrote:
> > MTE spec provide instructions to retrieve the memory tags:
> > (1) LDG, at 16 bytes granularity, and available in both user
> >     and kernel space;
> > (2) LDGM, at 256 bytes granularity in maximum, and only
> >     available in kernel space
> >
> > To improve the performance, KVM has exposed the LDGM capability
> > to user space by providing a new APIs. This patch is just a
> > wrapper for the KVM APIs.
> >
> > Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> > ---
> >  target/arm/kvm64.c   | 24 ++++++++++++++++++++++++
> >  target/arm/kvm_arm.h |  2 ++
> >  2 files changed, 26 insertions(+)
> >
> > diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> > index 73a191f8e1..3157025316 100644
> > --- a/target/arm/kvm64.c
> > +++ b/target/arm/kvm64.c
> > @@ -1606,3 +1606,27 @@ bool kvm_arm_verify_ext_dabt_pending(CPUState *cs)
> >      }
> >      return false;
> >  }
> > +
> > +int kvm_arm_mte_get_tags(uint64_t ipa, uint64_t len, uint8_t *buf)
> > +{
> > +    struct kvm_arm_copy_mte_tags args = {
> > +        .guest_ipa = ipa,
> > +        .length = len,
> > +        .addr = buf,
> > +        .flags = KVM_ARM_TAGS_FROM_GUEST,
> > +    };
> > +
> > +    return kvm_vm_ioctl(kvm_state, KVM_ARM_MTE_COPY_TAGS, &args);
>
> Just a question, how fast/slow are this calls?
>

There is no performance data for this API yet, but at least it's more
efficient than that
to only be able to access a single tag by the EL0 "LDG" instruction.
We will try to
collect some performance data for this KVM API later.

> My understanding is that we are making a kvm call for each page that we
> want to migrate, right?
>

Yes, currently I chose to append the tag values to the page data
during the migration.

> Each time that we want to send it.
>
> Later, Juan.
>
>
> > +}
> > +
> > +int kvm_arm_mte_set_tags(uint64_t ipa, uint64_t len, uint8_t *buf)
> > +{
> > +    struct kvm_arm_copy_mte_tags args = {
> > +        .guest_ipa = ipa,
> > +        .length = len,
> > +        .addr = buf,
> > +        .flags = KVM_ARM_TAGS_TO_GUEST,
> > +    };
> > +
> > +    return kvm_vm_ioctl(kvm_state, KVM_ARM_MTE_COPY_TAGS, &args);
> > +}
> > diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> > index 34f8daa377..bbb833d6c6 100644
> > --- a/target/arm/kvm_arm.h
> > +++ b/target/arm/kvm_arm.h
> > @@ -360,6 +360,8 @@ int kvm_arm_vgic_probe(void);
> >
> >  void kvm_arm_pmu_set_irq(CPUState *cs, int irq);
> >  void kvm_arm_pmu_init(CPUState *cs);
> > +int kvm_arm_mte_get_tags(uint64_t ipa, uint64_t len, uint8_t *buf);
> > +int kvm_arm_mte_set_tags(uint64_t ipa, uint64_t len, uint8_t *buf);
> >
> >  /**
> >   * kvm_arm_pvtime_init:
>
