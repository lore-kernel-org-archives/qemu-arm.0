Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79192F01828
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 11:50:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyTgs-0002YD-7X; Fri, 06 Mar 2026 06:49:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vyTgq-0002Xx-Uw
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 06:49:56 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vyTgn-0002db-T2
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 06:49:55 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4836f363ad2so106894205e9.1
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 03:49:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772797792; cv=none;
 d=google.com; s=arc-20240605;
 b=jq+0nGJzqqoKekdr2naLr0f+5+U5LQtC5Khf1d7ju4L06Bmze64KxleqC7s3jeLkYB
 Aq5dhUGsYUVNXsAJgJK8bYY/BVHBBWxrx/GgO77khD9710PqKKBYdry0b90qiwueclzj
 CtsqEq7BOUeq58NNegV/lWTRkt4bEhL4r3vubBU0Aw+dCLhUUI0VNS8Fv3AH+dSTodCr
 FyeWOpY+9yTn7mVD+dOEVM+0rMfur1hzkukIi+4moEs0yqSr6BIPZLzVx7w+YEtFosBe
 1brcKjSrkoz9cBh1y/rWmVJdKMTrgGCfADfCPbBNxWxBUqE3RLvoDp2XAaiyA/jjMXS3
 oRQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=aEMUP9o7W63JZbWz7rK7k03pO+jBShh6IwlYY5T8OnQ=;
 fh=R3koUL+cf3gxehtOyIcIT/diTUNlB24b617iF83roTs=;
 b=YS41E7ZffYZ9f8jGUGA8jWGmqShAU5pmHfMvzSQ1EGekWhZqkyW6/LrcniiNzMaOyD
 y4GkD1t/4mwUZTEntARze5Q3BL09VjvXqlFWFjet9D6VAuMnnySDUPMYcaK5uy4lJ6Tx
 X/czTYb1k7V6uU+RXeZX07+xmuju3n1zcp67MPcGmLVPATKqIoM9NLX93fXF8KFNkDrJ
 bpjXKvKzMLy4CPLpSkDRGSqsMw3P6a+vWhjYnKx0R1U17qy6Nzmg0c/xqE3rUGh/gLeP
 Iz4+ucFW3OAXxYGoPdMeEJMZS9JksXieF9AwVg4aqCOxW2s4AutGw747U/eUTYHgTCPH
 IgJw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772797792; x=1773402592; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aEMUP9o7W63JZbWz7rK7k03pO+jBShh6IwlYY5T8OnQ=;
 b=seEL0qSTUrI4S5naRDCPn6Gr4xCmGdqw+4tvt6uJxVJxnyFTHu9fmfWbacMuDAzkaP
 LH0kub+cEFWadaUmhVbaIc8Fuby+qzZkwhUU18NrZtj9S4istDDMoTNFGr7ZcG9++9wj
 6iUBGovBlrc2SAe2mQKqt3SzjmSrgGTr6mTreZso1amH+wVUntQDmLboUKfvrkNplNQh
 ONBW6FCIT0rwM2hR8UtcbWwTMuFa1Xzhaz0ROU/bwlMgXTcn2iT43HGvs2uL0CskJ5ml
 Mcxo4NeFcEkAGHHcn3f89kTZVRqaahVByn8coPAnAInr+xQx74c+vUM7Uf/feKNhSKew
 MuSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772797792; x=1773402592;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aEMUP9o7W63JZbWz7rK7k03pO+jBShh6IwlYY5T8OnQ=;
 b=XCN3U+U+wg16tR/NNtsWomytbkozkj8uvV8+lg5mhB05JtGsUYDt1Texs6fwrg97M0
 PoJQzTJA0CAzeC9r+w3Z5fR2K4P4ndkP/fVkc1adt6ZmEl0UhXmzPICXQGVwdtwUYlOt
 T3ZG6JtJT8OTid4qzn3PDonaOWtcz9Gr1UjzU779ZeMM5V37uRajraPiQ2tfR31ujF3y
 EacvV2Dx3Wq11NTa9B7wGHSDnhIqO+e3S8Yq6Xav4qDJ/Kxr0NB3G46OPtNpB4rEoByq
 7x5gdkypm9NdR7AOlSMP2icjrL+kLurlR+SzgEJrTInL4cVruC0qMy1XOPqfwiYA2Uy1
 SfsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJVDeccWNZWryuYNrHoZ6DqiXwnX65nbIvkKG9wWDmWytJOfq37uHgdl34nn2BJZEGALVcjDFxiA==@nongnu.org
X-Gm-Message-State: AOJu0Yy39UKQ0DfMnrvEnLyk1oJr+2ryYCEYHv2wTDaID4BbBTSWW8EE
 D/ppQZ1xr40ZRQqKJ8+7ATZiJ9kXt88eghtVr3i313c0gWc0C0GdUO4u0xHCxCQCHwPM8Z04xEK
 IgGZkuMlyLvJkYzNFYlWmbEXpzWu9pGSuGiZQhWL66g==
X-Gm-Gg: ATEYQzzQDHYKa5/lShOZ734l7ASLBXrse+8WW13D+jLiER+u9vDfmOILK9jVMKmioK9
 qKsU7uu1jOXVw1aPwLaVNJrCc6YChuuMW3UO2VUQFH17i3MTLGs9wRHJhywZu2ZhOeyLb5SvMmI
 4acTniXNkmC0xyMDP0Juh9bScc2/y4QHPLTL7BllJJTDjyxbVqPP/2tZw2z8gRyOH8+l2vJ8J+3
 6kxdK9yfWZLAYhlCb1c2wak8D2dWf4swp9DACUi3t725BzyJ8BpxqqMOyJlrpQFXsFLjxRxz08d
 cPusj/UGZv0cgbf5sCos4kmV59Bj2NqO1JtliEIEdkETGa4Sug==
X-Received: by 2002:a05:600c:5303:b0:477:c478:46d7 with SMTP id
 5b1f17b1804b1-4852695aa55mr28908905e9.22.1772797791980; Fri, 06 Mar 2026
 03:49:51 -0800 (PST)
MIME-Version: 1.0
References: <20260303-sme2-hvf-v6-0-b473702d8287@linaro.org>
 <20260303-sme2-hvf-v6-1-b473702d8287@linaro.org>
 <CAFEAcA8zTkc4pyHQKoDkTMhGPLQmxBaJS3bZiGRrPgux3rDLzw@mail.gmail.com>
 <CAAjaMXbXdrW9N1xLMPxL9OmjLqti6A3rqAmYipu6OkdBY8JPNQ@mail.gmail.com>
 <CAFEAcA_MuZH8d=Z=NfrNQ78k+Kv9mSx+=DLLt8AxZeEjccN8yw@mail.gmail.com>
 <CAAjaMXbq9A1NCO4jnF4aSL0XM2pzHsPsPyWfmqSCg_+2ZQpEHA@mail.gmail.com>
 <35FDE44D-63E2-426E-912C-6EB6CDA52116@unpredictable.fr>
 <CAFEAcA-Zgq43KW9EC-pteOqxHcZg==GE=1TAURZP-DGRh3OoHQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-Zgq43KW9EC-pteOqxHcZg==GE=1TAURZP-DGRh3OoHQ@mail.gmail.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 6 Mar 2026 13:49:26 +0200
X-Gm-Features: AaiRm50yoEkke4iSBaCmNRxYQSDppG8hP_7kkEgEuftC2-TKNrR_0Q3toKUV4bE
Message-ID: <CAAjaMXa3h1abx=-ijZqf13ku-T=9+eV+XK9g85kGwxeRB-on1g@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] hvf/arm: handle FEAT_SME2 migration
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Phil_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Alexander Graf <agraf@csgraf.de>, Mads Ynddal <mads@ynddal.dk>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x332.google.com
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

On Fri, Mar 6, 2026 at 1:14=E2=80=AFPM Peter Maydell <peter.maydell@linaro.=
org> wrote:
>
> On Fri, 6 Mar 2026 at 10:19, Mohamed Mediouni <mohamed@unpredictable.fr> =
wrote:
> > > On 6. Mar 2026, at 11:05, Manos Pitsidianakis <manos.pitsidianakis@li=
naro.org> wrote:
> > >
> > > On Fri, Mar 6, 2026 at 11:48=E2=80=AFAM Peter Maydell <peter.maydell@=
linaro.org> wrote:
> > >> While you're retesting, could you also look at / test patches
> > >> 17 and 18 in Mohamed's series
> > >> https://lore.kernel.org/qemu-devel/20260306083113.74177-18-mohamed@u=
npredictable.fr/T/#m2d1e3dfbfa5aecd41af6c0aa9e3b574a72c6f04d
> > >>
> > >> ?
> > >>
> > >> They look to me like bugfixes that we should be squashing/including
> > >> in the "enable SME2 for hvf" handling.
> > >
> > > Had a quick look, 17 seems to be nested-virt specific so not a bugfix
> > > if nested-virt was not already supported in the first place, right?
> >
> > Hello,
> >
> > This part isn=E2=80=99t:
> >
> > @@ -1370,16 +1373,22 @@ int hvf_arch_init_vcpu(CPUState *cpu)
> > arm_cpu->cpreg_indexes[sregs_cnt++] =3D kvm_id;
> > }
> > }
> > - if (__builtin_available(macOS 15.2, *)) {
> > - for (i =3D 0; i < ARRAY_SIZE(hvf_sreg_list_sme2); i++) {
> > - hv_sys_reg_t hvf_id =3D hvf_sreg_list_sme2[i].sreg;
> > - uint64_t kvm_id =3D HVF_TO_KVMID(hvf_id);
> > - uint32_t key =3D kvm_to_cpreg_id(kvm_id);
> > - const ARMCPRegInfo *ri =3D get_arm_cp_reginfo(arm_cpu->cp_regs, key);
> > -
> > - if (ri) {
> > - assert(!(ri->type & ARM_CP_NO_RAW));
> > - arm_cpu->cpreg_indexes[sregs_cnt++] =3D kvm_id;
> > + if (hvf_arm_sme2_supported()) {
> > + /*
> > + * Clang doesn't allow us to combine the two checks together.
> > + * -Wunsupported-availability-guard
> > + */
> > + if (__builtin_available(macOS 15.2, *)) {
> > + for (i =3D 0; i < ARRAY_SIZE(hvf_sreg_list_sme2); i++) {
> > + hv_sys_reg_t hvf_id =3D hvf_sreg_list_sme2[i].sreg;
> > + uint64_t kvm_id =3D HVF_TO_KVMID(hvf_id);
> > + uint32_t key =3D kvm_to_cpreg_id(kvm_id);
> > + const ARMCPRegInfo *ri =3D get_arm_cp_reginfo(arm_cpu->cp_regs, key);
> > +
> > + if (ri) {
> > + assert(!(ri->type & ARM_CP_NO_RAW));
> > + arm_cpu->cpreg_indexes[sregs_cnt++] =3D kvm_id;
> > + }
> > }
>
> Yes; the patch is doing two things and really ought to be two patches,
> so we can put the bit that we need for "make SME2 hvf work correctly"
> before the "enable SME2 HVF" patch, and the bit that is nested-virt
> specific in the nested-virt patches.
>

Patch v18 needs an adjustment, because clang prints warnings about the
`static const struct sme_isar_regs` array.


../target/arm/hvf/hvf.c:1098:11: warning:
'HV_FEATURE_REG_ID_AA64SMFR0_EL1' is only available on macOS 15.2 or
newer [-Wunguarded-availability-new]

Peter,

Maybe I should send a new revision since you haven't merged these
patches anyway?

> thanks
> -- PMM

--=20
Manos Pitsidianakis
Emulation and Virtualization Engineer at Linaro Ltd

