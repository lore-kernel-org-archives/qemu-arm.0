Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3462206lfb;
        Mon, 13 Sep 2021 01:29:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/PGD9xB8OQXHaKLFD8POBfiGAdSZgL6amXPebIlV30JJvBqck9kBcnVB0MGONLnQ4sVax
X-Received: by 2002:a25:a241:: with SMTP id b59mr13517985ybi.522.1631521780253;
        Mon, 13 Sep 2021 01:29:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631521780; cv=none;
        d=google.com; s=arc-20160816;
        b=HQgZ7lJtMBZqm643t9A1tSLSznVnCWyNUlfnIW//MOxLD+x/kVFaWzIVLwqiW3FuVi
         RUhZuDmu62oJXiGAcOp7jBUxGd9RC9/tRnfJ9V6gNnfNoIrBH/ELVFuUICbmGyn78p7l
         qGYNebJsLQfe6pfWW7Pbf80CDZDsmdt/+5aa8NSKh0EqhYS28SYtqME8QP4/MPNdA0wQ
         J3t0h8J3Jdl6q0twks2/M+ZmWmzED3BGYv702NSpkhAWgYAZ3hH654ZG+K1zvIxd+cUM
         olZdK4OPuN78+5ibq46mQnJR1xoJMZxr1DNvNzl7gycEBt/q2u2RJoXKzt+kl5p1mejx
         s/5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=trkgFeu9aw3945fOmebUQtlhpJpxYaGNdUlxA7kRajo=;
        b=b9t5foXUrpYEHy6EfwLIwWa+c2sn8Nuh/zqX8f+6X7IcY808OqdFsVH0EgqqIdHTMG
         Zdswf+5hJYjgYiQAsIty8GZMhp9E/BANKLlu9NGg2RzY004GEbtYYrS5Nz9yQx9QuKYS
         46vb6Gd9QdmlXHUihsqlvjU5zUK0w7n1GADa64jIJ2emm3wCssQOTRqIzR66zZMZfMEb
         IFP4EergM8SCClSmks5Z2DIh10fJVl2wupo3ybEhrrc92aD0BzSsq6Oqb3MrXLRm6rID
         9mBYnNwpWpEd18SUioF7Ih/YyWabeg/iBhd2898PngRBQ0x0DeWy3LthDCbVHFvqjlp2
         728Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Pr0lZEZK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o67si7842429ybg.497.2021.09.13.01.29.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 01:29:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Pr0lZEZK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPhLP-0005yZ-KM
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 04:29:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPhL4-0005wt-0T
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 04:29:18 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:43619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPhL1-0004sl-5f
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 04:29:17 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 n7-20020a05600c3b8700b002f8ca941d89so5965506wms.2
 for <qemu-arm@nongnu.org>; Mon, 13 Sep 2021 01:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=trkgFeu9aw3945fOmebUQtlhpJpxYaGNdUlxA7kRajo=;
 b=Pr0lZEZKteGK97d/XFJSUXsXb2DZB0znjB3nGFyyTJiitil+wwEJHinhVIiQqHUEbF
 68JBHzJr8E4+8EplZF7zBVTeRo5ccyW6YgxflU470dFJzd27gLMUhF3LqqHzmKtzyPla
 p/euHWhDm6rBKudUqFEp+qSwTKZoTgn7Gq3RcnS1H0traDBb8Dp1iSKd32qsnLHkFSTr
 RQ9k1SIf4v10/nCyWUKyyf2WxswfmUWWaKH8jKG6aLQkQelYh0kUiJ8AXAVDNOMUAT1p
 1lvbs+dAbFaSkNpImhcTKc8H4fwJ9q+LZMAuPeRAbPsZUF9qj28MogxJgGt6V1bzXw0F
 +f4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=trkgFeu9aw3945fOmebUQtlhpJpxYaGNdUlxA7kRajo=;
 b=EDoFoP0pVcPwH46B4de5aVeleM1A9omLRUqZGXntAbI2ZwcvTRQj7H67qJZt3zXoDi
 RDO9LADeVIdYVnIyJr6ln+whMM2DyywlVDSPtqj1orVQ7XTnWsLTyXCgBzsOYGPxBMbF
 FFmQMRj4kHtFswsXF67YQv7eTtV2Ev6ziX4i5ifJ/6VJvj8yn29GkcRMh06UnaL/j7Zn
 LDFuNSyyqPkoSPbDrPiaLBNdxVwyf9lXsWyrxQi8o6QQ0A0JgRgy/hsPa60PPMFReazR
 jLrnSCMSbiH02zB+eALt3ZsxY98utV/uCNVrB/CthDP/m6waQ84MsT6JgcmCWwZAMedZ
 jGIQ==
X-Gm-Message-State: AOAM530HpGB66U/NDu5Ng3fWMjxnfUdZApbN4onHGHdH7CoZ8s6fVqpt
 dv0GJqChaaZdlxT+AgAsgb8wpfAc316Rozu0xbqRTg==
X-Received: by 2002:a05:600c:19d0:: with SMTP id
 u16mr9899133wmq.21.1631521753318; 
 Mon, 13 Sep 2021 01:29:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-16-agraf@csgraf.de>
 <CAFEAcA9S619pfhfEXUxGQkjBBKahOYm14jpxEam2CQTtC1dRTQ@mail.gmail.com>
 <45519c63-06b1-1e06-032d-87d2e1338fd8@csgraf.de>
In-Reply-To: <45519c63-06b1-1e06-032d-87d2e1338fd8@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 09:28:22 +0100
Message-ID: <CAFEAcA_vC0beH4NMRP4hHK0drc6PZt073ZVZM=Majnfngkn_xQ@mail.gmail.com>
Subject: Re: [PATCH v8 15/19] hvf: arm: Implement -cpu host
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AGbi250x46F8

On Sun, 12 Sept 2021 at 21:23, Alexander Graf <agraf@csgraf.de> wrote:
>
>
> On 15.06.21 12:56, Peter Maydell wrote:
> > On Wed, 19 May 2021 at 21:23, Alexander Graf <agraf@csgraf.de> wrote:
> >> Now that we have working system register sync, we push more target CPU
> >> properties into the virtual machine. That might be useful in some
> >> situations, but is not the typical case that users want.
> >>
> >> So let's add a -cpu host option that allows them to explicitly pass all
> >> CPU capabilities of their host CPU into the guest.
> >>
> >> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> >> Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>
> >>
> >> ---
> >>
> >> v6 -> v7:
> >>
> >>   - Move function define to own header
> >>   - Do not propagate SVE features for HVF
> >>   - Remove stray whitespace change
> >>   - Verify that EL0 and EL1 do not allow AArch32 mode
> >>   - Only probe host CPU features once
> >> +static void hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
> >> +{
> >> +    ARMISARegisters host_isar;
> > Can you zero-initialize this (with "= { }"), please? That way we
> > know we have zeroes in the aarch32 ID fields rather than random junk later...
> >
> >> +    const struct isar_regs {
> >> +        int reg;
> >> +        uint64_t *val;
> >> +    } regs[] = {
> >> +        { HV_SYS_REG_ID_AA64PFR0_EL1, &host_isar.id_aa64pfr0 },
> >> +        { HV_SYS_REG_ID_AA64PFR1_EL1, &host_isar.id_aa64pfr1 },
> >> +        { HV_SYS_REG_ID_AA64DFR0_EL1, &host_isar.id_aa64dfr0 },
> >> +        { HV_SYS_REG_ID_AA64DFR1_EL1, &host_isar.id_aa64dfr1 },
> >> +        { HV_SYS_REG_ID_AA64ISAR0_EL1, &host_isar.id_aa64isar0 },
> >> +        { HV_SYS_REG_ID_AA64ISAR1_EL1, &host_isar.id_aa64isar1 },
> >> +        { HV_SYS_REG_ID_AA64MMFR0_EL1, &host_isar.id_aa64mmfr0 },
> >> +        { HV_SYS_REG_ID_AA64MMFR1_EL1, &host_isar.id_aa64mmfr1 },
> >> +        { HV_SYS_REG_ID_AA64MMFR2_EL1, &host_isar.id_aa64mmfr2 },
> >> +    };
> >> +    hv_vcpu_t fd;
> >> +    hv_vcpu_exit_t *exit;
> >> +    int i;
> >> +
> >> +    ahcf->dtb_compatible = "arm,arm-v8";
> >> +    ahcf->features = (1ULL << ARM_FEATURE_V8) |
> >> +                     (1ULL << ARM_FEATURE_NEON) |
> >> +                     (1ULL << ARM_FEATURE_AARCH64) |
> >> +                     (1ULL << ARM_FEATURE_PMU) |
> >> +                     (1ULL << ARM_FEATURE_GENERIC_TIMER);
> >> +
> >> +    /* We set up a small vcpu to extract host registers */
> >> +
> >> +    assert_hvf_ok(hv_vcpu_create(&fd, &exit, NULL));
> >> +    for (i = 0; i < ARRAY_SIZE(regs); i++) {
> >> +        assert_hvf_ok(hv_vcpu_get_sys_reg(fd, regs[i].reg, regs[i].val));
> >> +    }
> >> +    assert_hvf_ok(hv_vcpu_get_sys_reg(fd, HV_SYS_REG_MIDR_EL1, &ahcf->midr));
> >> +    assert_hvf_ok(hv_vcpu_destroy(fd));
> >> +
> >> +    ahcf->isar = host_isar;
> >> +    ahcf->reset_sctlr = 0x00c50078;
> > Why this value in particular? Could we just ask the scratch HVF CPU
> > for the value of SCTLR_EL1 rather than hardcoding something?
>
>
> The fresh scratch hvf CPU has 0 as SCTLR.

Yuck. That's pretty unhelpful of hvf, since it's not an
architecturally valid thing for a freshly reset EL1-only
CPU to have as its SCTLR (some bits are supposed to be RES1
or reset-to-1). In that case we do need to set this to a known
value here, I guess -- but we should have a comment explaining
why we do it and what bits we're setting.

> >> +    /* Make sure we don't advertise AArch32 support for EL0/EL1 */
> >> +    g_assert((host_isar.id_aa64pfr0 & 0xff) == 0x11);
> > This shouldn't really be an assert, I think. error_report() something
> > and return false, and then arm_cpu_realizefn() will fail, which should
> > cause us to exit.
>
>
> I don't follow. We're filling in the -cpu host CPU template here. There
> is no error path anywhere we could take.

Look at how the kvm_arm_get_host_cpu_features() error handling works:
it returns a bool. The caller (kvm_arm_set_cpu_features_from_host())
checks the return value, and if the function failed it sets
the cpu->host_cpu_probe_failed flag, which then results in realize
failing. (You'll want to update the arm_cpu_realizefn to allow hvf
as well as kvm for that error message.)

> This is a case that on today's systems can't happen - M1 does not
> support AArch32 anywhere. So that assert could only ever hit if you run
> macOS on non-Apple hardware (in which case I doubt hvf works as
> intended) or if a new Apple CPU starts supporting AArch32 (again, very
> unlikely).
>
> So overall, I think the assert here is not too bad :)

Well, probably not, but you need the error handling path
anyway for the boring case of "oops, this syscall failed".

-- PMM
