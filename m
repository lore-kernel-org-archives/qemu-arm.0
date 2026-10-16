Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06AE2CCA462
	for <qemu-arm@archiver.kernel.org>; Fri, 16 Oct 2026 12:25:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHgzl-0005vQ-IS; Fri, 16 Oct 2026 08:25:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHgzj-0005um-SP
 for qemu-arm@nongnu.org; Fri, 16 Oct 2026 08:25:07 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHgzh-0001Uz-MR
 for qemu-arm@nongnu.org; Fri, 16 Oct 2026 08:25:07 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-8ae8607e8afso46863467b3.3
 for <qemu-arm@nongnu.org>; Fri, 16 Oct 2026 05:25:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792153504; cv=none;
 d=google.com; s=arc-20260327;
 b=G/QGpsIM+ibZ1GsaRZ1jdnf80R2FpCtSiBW29SfVJo56NpoMpt1qmmbNjsCJmlzoDR
 CXbo95myATYH2b0bfB2szfHENYAt3UjVoCxfxr8TpXe7tiIo6KMy3fZGBFsHgh/isrtN
 jJzeSdCw46zgixnF2PmXuFxiEn14SbtAEp6uYdRyWPtoSFDG++hGQ5xAXz/J3/kw/zv3
 FCzs4BHX0jKg+t6EZu2hvZVPg70HZOd03ugNcNDKI2oDTC0MmI2B662OqfFojsDxRbET
 5/WNb5pQKkUY7BP9Iv7nLXNsHzVmAsHISpcc7Qn7h/9Scs9aVnTPVkOwq9E6Ses997bM
 2cow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=zQ7v723Xwm8CKvdncmpgIg6KtAXzOUldqD/wPY6Bdsk=;
 fh=xszjRdb1ZPMQxi/vEriu8E1XV/G6JBFhSTyor81fj10=;
 b=ERoOEudJyhvwa3HYfJbPn4uTrlHdhSZFpDTBDZ1DrDRkLFNMQFTxqeUKpJyyBxpbhN
 me6QPt6aO6UfxdrWjs1ngArKvL7QkII/c3D0BzfSwIerbgGd/GvuCOD3E6g22SWJroXN
 cCsnEoGIufOicjeCUmhQ+4XrJ/6B/e2XIG21kiT+ov1fhW+1ST5yS+QLlMjP4tfaAruP
 qGQYN0dNC3FVLqkuKiEvYMXTjgGJsYcUr6Pbc6+G2XEzL8gNv5mgk/H2fODQMrIMgk0M
 IPfE+NcDJ+a+ntZ4BFRUFCnYEPrXrlTKRq+fzIsbWQ9FMCI7G0f7SUVaIC5ecRl3kygB
 1B5A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792153504; x=1792758304; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=zQ7v723Xwm8CKvdncmpgIg6KtAXzOUldqD/wPY6Bdsk=;
 b=pR0ahONkEAKK6JkJGQtHIKgMMLZW4s1gUM92HLtLXiJHc7Bzuoww3beO4sSpNUE0bn
 dX6+xvyi04CnXYTM6zuTj3HwTPqiTgWUvWEd2PfNHYCO1X7Jm4NYmWqSAqH6iArZYCNX
 ETYpQk5n9WO0RFMwf6vPrJgMRToTn/QkxSYeJLifU0k4YcvCdFwRIuhGv+wQm8banfFP
 zcK1azclPVJd45Nc/R+rkLcVkrwGnAJf3N7Oij5AGn5eag7k5aqaLL7smVNSsblknBZm
 3DMDPLNHaHxxWp37FMcFHMWPOzqQyb85JkrmaT4IdmYMCk2VVao8k+B/p9I15zjwxwjL
 gxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792153504; x=1792758304;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=zQ7v723Xwm8CKvdncmpgIg6KtAXzOUldqD/wPY6Bdsk=;
 b=aISq7MVGFLUjUsLXa5LaHoYGdH4DX/ADQXYCv0JDil64ci2ZyY3v8iafjOFPkTbRxH
 fe5um/VR3YmgpNEEtPTDfg9Xj0Q0t/vdqVwroy/G3zYEx/B7r3I1LfcVyhlvrLpbsyW3
 l8c6v9zZ5LXXJFvN3yZWBkFjGulG4VjtRMrUSPDSVJ327A5wIjy1rduBHK5y1i11ge46
 QGmXr2Ap+lHU2aVytYdgKfVdHlHRSGn2iBAdhnB1s7bCUMiO9Tqy8wz6ZAAfNy4jIUL7
 XtLPnVgfZSWsjq/Do5bda9YJFy8V8W1mno0JfnjYw9JkykoG1AwAPDfDmlUhY68dOZRz
 M+nw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzq8y841SdB+rNd2eFMDkbiH1vKf0yRlm3S15HIC7/SzNg7xCIOp/vxsS4LHqd8/yv70nspxhb5lQ==@nongnu.org
X-Gm-Message-State: AFq9FYJULU+CZiBe9kobSDGx12vNHMfqcGxgWehuCakiGS0MxP5zsBOl
 gqouproc/kq7UKxjHVbYzjjfCv7AWoFUPkxp26Y//C/V36bVqq1DxKHQ/pREuuWzvlkTMsV1OMu
 5C9EJUwT4QS+xLfTSfcsXUElnA2IDCRETyFCRoX6Qvg==
X-Gm-Gg: AYBFou3oEHQrMT58ZN8/1U5V92F3U6BhNrlmYNrSUzGmtziVNE2XP4K6EsPyEFZna/g
 FyurDmdjBexx6AF67fDmZmugL570MelXIi4nMY6k+GjCWdJSHvLXmJw3NFPhZCRMbzQBn4z26pC
 9QDkOrrXS1SXv9F6QVRz7Yj9hlPBscXbp8p17aEQbQ6sn5GKqNEjg/EJadn9IjpS1Dck1qyfe+V
 k2Uv7YHG1OwzFJBNYaZBMXOFNuvdra5d+dKealwc57nz48x1s1WL+c2Wlqi9agXftRQzdx4trrK
 iZbVcQcegEPuhTrmyEFlOGivNs85bkDPI5MMpSSslbWJU5YS0C5LZPsBlZtCQ+clukb3Ay3jlab
 G5g2Wu2SBkTYwW3hACLvUCzKVvzNGcprPcR7ocUY=
X-Received: by 2002:a05:690c:38a:b0:8ab:f06b:4167 with SMTP id
 00721157ae682-8b07ed94faemr70880547b3.13.1792153503619; Fri, 16 Oct 2026
 05:25:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260921123249.1708067-1-khushit.shah@nutanix.com>
 <20260921123249.1708067-13-khushit.shah@nutanix.com>
 <45c37754-2244-4336-9aa8-12d0b89840d4@redhat.com>
In-Reply-To: <45c37754-2244-4336-9aa8-12d0b89840d4@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Oct 2026 13:24:52 +0100
X-Gm-Features: AclHuK8QUVErp647tqWp5ytpV4Of4NOKFC85jRCyp3SMOobKD0YHSCkB-sEVa48
Message-ID: <CAFEAcA_VksKhAoAFhV-F-DTdFTp02ZHs8cUrpX5qaOCAJTMOng@mail.gmail.com>
Subject: Re: [RFC PATCH v4 12/25] target/arm: add arm-v9.0-a-v1 named CPU model
To: eric.auger@redhat.com
Cc: Khushit Shah <khushit.shah@nutanix.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, 
 kvmarm@lists.linux.dev, cohuck@redhat.com, richard.henderson@linaro.org, 
 maz@kernel.org, oliver.upton@linux.dev, berrange@redhat.com, 
 abologna@redhat.com, jdenemar@redhat.com, gshan@redhat.com, 
 skolothumtho@nvidia.com, sebott@redhat.com, armbru@redhat.com, 
 philmd@linaro.org, yangjinqian1@huawei.com, shaju.abraham@nutanix.com, 
 mark.caveayland@nutanix.com, ping@khushitshah.com, sandesh.patel@nutanix.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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

On Fri, 16 Oct 2026 at 13:07, Eric Auger <eric.auger@redhat.com> wrote:
>
> Hi Khushit,
>
> On 9/21/26 2:32 PM, Khushit Shah wrote:
> > Add a KVM-only named CPU model for the Armv9.0-A baseline, following
> > DDI0487 revision M.c. The property list is the architecture-mandated
> > ID-register field view.

> > +static const ArmModelPropValue arm_v9_0_a_v1_props[] = {
> > +    /* ID_AA64PFR0_EL1 */
> > +    MODEL_PROP("SYSREG_ID_AA64PFR0_EL1_EL0", NUM, 1), /* only FEAT_AA64EL0 (Armv9.0) */
> > +    MODEL_PROP("SYSREG_ID_AA64PFR0_EL1_EL1", NUM, 1), /* only FEAT_AA64EL1 (Armv9.0) */
> > +    MODEL_PROP("SYSREG_ID_AA64PFR0_EL1_RAS", NUM, 1), /* FEAT_RAS (Armv8.2) */
> > +    MODEL_PROP("SYSREG_ID_AA64PFR0_EL1_DIT", NUM, 1), /* FEAT_DIT (Armv8.4) */
> > +    MODEL_PROP("SYSREG_ID_AA64PFR0_EL1_CSV2", NUM, 1), /* FEAT_CSV2 (Armv8.5) */
> > +    MODEL_PROP("SYSREG_ID_AA64PFR0_EL1_CSV3", NUM, 1), /* FEAT_CSV3 (Armv8.5) */
> > +    MODEL_PROP("SYSREG_ID_AA64PFR0_EL1_FP", NUM, 1), /* FEAT_FP16 */
> > +    MODEL_PROP("SYSREG_ID_AA64PFR0_EL1_AdvSIMD", NUM, 1), /* FEAT_FP16 */
> I have not found that FP+AdvSIMD (ie FEAT_FP16) were mandated by v9.0
> amybe you want this model to implement FP16 but it does not seems
> strictly mandated in v9.0
> so it might be distinguished from other settings that are truly mandated.

FP/AdvSIMD is one of those things that's technically optional (because
you might have some extremely-embedded special purpose device that
doesn't want FP) but in practice is mandatory. (The Arm ARM says
"This option [no FP] is licensed only for implementations targeting
specialized markets". Anything that might be running Linux and KVM
is not that.

> > +
> > +    /* ID_AA64PFR1_EL1 */
> > +    /* KVM zeroes out these field when MTE is not enabled. */
> > +    MODEL_PROP("SYSREG_ID_AA64PFR1_EL1_MTE_frac", NUM, 0),
> useless as default is 0, no?
> > +    MODEL_PROP("SYSREG_ID_AA64PFR1_EL1_BT", NUM, 1), /* FEAT_BTI (Armv8.5) */
>
>
> > +
> > +    /* ID_AA64MMFR0_EL1 */
> > +    MODEL_PROP("SYSREG_ID_AA64MMFR0_EL1_TGran64", NUM, 0xF), /* not mandatory */
> > +    MODEL_PROP("SYSREG_ID_AA64MMFR0_EL1_TGran4", NUM, 0), /* 4K granular support */
> > +    MODEL_PROP("SYSREG_ID_AA64MMFR0_EL1_TGran16_2", NUM, 1), /* not mandatory */
> > +    MODEL_PROP("SYSREG_ID_AA64MMFR0_EL1_TGran64_2", NUM, 1), /* not mandatory */
> > +    MODEL_PROP("SYSREG_ID_AA64MMFR0_EL1_TGran4_2", NUM, 1), /* not mandatory */
> so the top comment, ie.
>
> +/* Arm-v9.0-a mandatory features. */
>
> should really be updated accordingly. None of that is mandated by v9.0
> spec, right?

The comments here are confusing, because what we really want to point
out here is that for these fields the "not implemented" value is not
always "0" (in some cases it's 0b1111 and in some 0b0001). Where we
set some non-0 value that is the "not implemented" value we should
say that.

Also, no particular granule size is mandatory; you just need to support
at least one, and 4K is most popular, but you can have just 16K or
just 64K if you want. So this is making an actual choice.

-- PMM

