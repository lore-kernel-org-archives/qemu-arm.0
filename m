Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp949718lfy;
        Tue, 11 Aug 2020 17:55:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuu6b8foTyEQ+GSgLxYs/PXslYkiwyqcpcA0X7NSwRbIzJmuF0GuPIcZgXpPK/ftiXIHHS
X-Received: by 2002:a25:df41:: with SMTP id w62mr20471927ybg.117.1597193718235;
        Tue, 11 Aug 2020 17:55:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597193718; cv=none;
        d=google.com; s=arc-20160816;
        b=hADzOVRzyg1e6lkvI3zrkkK6mjS424IDWCydyG3g7SMg0jhKUt/d7mjEeU1Nk9mkla
         IoCqtgQJLMFh4VgDbzihHijNq8ur24cd8VvYFxBLlkERJtWQrNVqfao3ncIEBE1w7Xty
         gtioDm8VlmUXbeTXg2KgtFxjxdpzT/rxSAgt3051UnyX43KAWlrFSpJQbqgOcxfYFLfn
         6MR41ApVPogkadT3rac5qVLZ6IwBgLBRqEtQxuOC9SRyC2u7y1wGhbIyNuNmg1Z/GFVL
         TMnYaE/bAWl8r+DXCWG9t1GYcq4SbOJFNiyE6Qpk7Uy77rmMgVMPcqKKbcHsUuvRk6Ng
         6Z6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VIafFEqltHqYeExmIqavmOEAKE93CyLo9JE7LXb68b8=;
        b=Yscht3qbFkyE3OZeWDBqQzGsxhBFE4Wyz4PrI3KEWDAimtJrNaFeSnD9t1bIxAjSGG
         1HIT908U7urm/Y5rcS8IDLGgeb/TArieP/fzTeOaNHMOTLrLIYo/Ryy1+Pq4OBCrstwd
         3AQa+EnrrrGVOE5/hL+F2C8ChxfBgVZzYznloatQut8FkEgT/TBJ0ufT0KFjfYFlb9vB
         ANhPa7DjM/tSmu8xTG1B43iWaM/RykVtJ3VsJ3hpjB89lXKTZaec/GICAg1xiIpQTu6S
         syh9rGKeFTj9w2U7LLij8PEq/qm0ESxedzckHRsTIDk6iENXEWUsWNdAIslhrbDan4Dm
         GXFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pKM7hYto;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c187si684816yba.355.2020.08.11.17.55.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Aug 2020 17:55:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pKM7hYto;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k5f2z-0003Nw-LB
	for alex.bennee@linaro.org; Tue, 11 Aug 2020 20:55:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1k5f2r-0003NM-56
 for qemu-arm@nongnu.org; Tue, 11 Aug 2020 20:55:09 -0400
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:38672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1k5f2o-0008SC-ET
 for qemu-arm@nongnu.org; Tue, 11 Aug 2020 20:55:08 -0400
Received: by mail-il1-x142.google.com with SMTP id 77so238671ilc.5
 for <qemu-arm@nongnu.org>; Tue, 11 Aug 2020 17:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VIafFEqltHqYeExmIqavmOEAKE93CyLo9JE7LXb68b8=;
 b=pKM7hYtoWKySVPTMbgZOjJqZizpWcV148EDy+j5jPd6DgADkVbH++3M+iBVmo8F4PN
 Aqv6tDMYdMAMSnaBaNloSE6EQCmwxyuCtiP0JYnlsLsg3yXiQ+NnXDWdU/VXK+Yh4dSQ
 4acVhPx8ch4vKiwzjZGxTxeuUa3u2hX0VWihhITmWco+NljAmgKG3Coz8hBac4gM0jUA
 D3cD8vTQQe7wos6HIJB2yDaAOUt8CamVVCF00WzpbybRShr8Z2c0vcQNkMtXGhtqqqqe
 Xqd6XDVk9cqx3gM9kaNQw1ceeoC6vbQoHLa7VMwbb2RD07VcIGE89G3yN3HntZea1kJ/
 gV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VIafFEqltHqYeExmIqavmOEAKE93CyLo9JE7LXb68b8=;
 b=ghzpX3eg4HLOiyVX9eLDQ9CxCDisbuk+/jO97aVXalZQmt3jBPKszAvMQG7K0IoCFT
 psOpmvjueN/s5ngE5Txpr4j1/wDxVAOcIs2M6cOCB6c0VBe2RxdyUFUhwNmRQqw14ksP
 QWOs36rKAonzygIxciVJO9LwMv486b+QjUvb7XW8oQCUyiLkqseZldre/2VBNC7I2wZe
 o1yEuP8X61N9tsA70VFFDm3+UsBzS57HLfLUEnlM+y4oF5mUCRFWf4IfL4BaeKZ+5FT1
 3U+XgkIpzU86ald0sB9Cb/QwkdMa5ugMVF34n2H7wZC8FYUROzrCakE2yAgPmi/gRAtm
 24jg==
X-Gm-Message-State: AOAM531jb2+RiXQTZ+RbT7+SuzpZKxibmAPOzS2bimlZjnbGJffO/z1G
 Tdq3QzuuecgIdcLDmlFTr3t14Mqe5bjv0N9Kn5uKZh4Mkg==
X-Received: by 2002:a92:d841:: with SMTP id h1mr26847646ilq.233.1597193705332; 
 Tue, 11 Aug 2020 17:55:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1596768588.git.haibo.xu@linaro.org>
 <bf909c1f4904a22be0804cae9fd6f38ba4862563.1596768588.git.haibo.xu@linaro.org>
 <20200810111640.ykejphmuyirncjwv@kamzik.brq.redhat.com>
 <CAJc+Z1F_vFdJuy2kZnj0gZSOd_8-=rSfWFHjQSPU5XEKQ2KZkg@mail.gmail.com>
 <20200811164954.s2sdjzpqpdh2orks@kamzik.brq.redhat.com>
In-Reply-To: <20200811164954.s2sdjzpqpdh2orks@kamzik.brq.redhat.com>
From: Haibo Xu <haibo.xu@linaro.org>
Date: Wed, 12 Aug 2020 08:54:53 +0800
Message-ID: <CAJc+Z1FNbS_U31ZSgGj5yOd1z5sA=SFLHYVhNGe05+nC4qBkKQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] target/arm/cpu: spe: Enable spe to work with host cpu
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::142;
 envelope-from=haibo.xu@linaro.org; helo=mail-il1-x142.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eNtBOWCd8zSa

On Wed, 12 Aug 2020 at 00:50, Andrew Jones <drjones@redhat.com> wrote:
>
> On Tue, Aug 11, 2020 at 11:15:42AM +0800, Haibo Xu wrote:
> > > > +    if (!cpu->has_spe || !kvm_enabled()) {
> > > > +        unset_feature(env, ARM_FEATURE_SPE);
> > > > +    }
> > >
> > > I don't think this should be necessary.
> > >
> >
> > Yes, I have tried to remove this check, and the vSPE can still work
> > correctly.
> > But I don't know whether there are some corner cases that trigger an error.
> > The similar logic is added in commit 929e754d5a to enable vPMU support.
>
> I think the PMU logic needs a cleanup, rather than to be imitated.
>
> >
> > > > +
> > > >      if (!arm_feature(env, ARM_FEATURE_EL2)) {
> > > >          /* Disable the hypervisor feature bits in the processor feature
> > > >           * registers if we don't have EL2. These are id_pfr1[15:12] and
> > > > diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> > > > index be045ccc5f..4ea58afc1d 100644
> > > > --- a/target/arm/kvm64.c
> > > > +++ b/target/arm/kvm64.c
> > > > @@ -679,6 +679,7 @@ bool
> > kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
> > > >      features |= 1ULL << ARM_FEATURE_AARCH64;
> > > >      features |= 1ULL << ARM_FEATURE_PMU;
> > > >      features |= 1ULL << ARM_FEATURE_GENERIC_TIMER;
> > > > +    features |= 1ULL << ARM_FEATURE_SPE;
> > >
> > > No, SPE is not a feature we assume is present in v8.0 CPUs.
> > >
> >
> > Yes, SPE is an optional feature for v8.2. How about changing to the
> > following logic:
> >
> > spe_supported = ioctl(fdarray[0], KVM_CHECK_EXTENSION, KVM_CAP_ARM_SPE_V1)
> > > 0;
> > if (spe_supported) {
> >     features |= 1ULL << ARM_FEATURE_SPE;
> > }
>
> Yes, except you need to drop the ARM_FEATURE_SPE define and use the ID
> register bit instead like "sve_supported" does.
>
> >
> > > >
> > > >      ahcf->features = features;
> > > >
> > > > @@ -826,6 +827,14 @@ int kvm_arch_init_vcpu(CPUState *cs)
> > > >      } else {
> > > >          env->features &= ~(1ULL << ARM_FEATURE_PMU);
> > > >      }
> > > > +    if (!kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_SPE_V1)) {
> > > > +        cpu->has_spe = false;
> > > > +    }
> > > > +    if (cpu->has_spe) {
> > > > +        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_SPE_V1;
> > > > +    } else {
> > > > +        env->features &= ~(1ULL << ARM_FEATURE_SPE);
> > > > +    }
> > >
> > > The PMU code above this isn't a good pattern to copy. The SVE code below
> > > is better. SVE uses an ID bit and doesn't do the redundant KVM cap check.
> > > It'd be nice to cleanup the PMU code (with a separate patch) and then add
> > > SPE in a better way.
> > >
> >
> > I noticed that Peter had sent out a mail
> > <https://www.mail-archive.com/qemu-devel@nongnu.org/msg727640.html> to talk
> > about the feature-identification strategy.
> > So shall we adapt it to the vPMU and vSPE feature?
>
> At least SPE. You'll have to double check that it makes sense to do for
> PMU. But, if so, then it should be done with a separate series.
>

Ok, will adapt the SPE support to this new feature-identification
strategy first, and
investigate whether it makes sense to do so for PMU later.

Thank you very much for helping review the patch series!

> Thanks,
> drew
>
