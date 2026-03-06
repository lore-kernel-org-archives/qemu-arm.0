Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BECBF01825
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 11:14:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyT8G-0001g8-OO; Fri, 06 Mar 2026 06:14:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyT8F-0001fk-Eq
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 06:14:11 -0500
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyT8D-0006jN-QN
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 06:14:11 -0500
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-64ae2ce2fe1so8320196d50.1
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 03:14:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772795649; cv=none;
 d=google.com; s=arc-20240605;
 b=bwwBD8rtRmJdAMoc6kLSrrKagDoygVMytm7fHKLrpvSys82XcY/+5lDtQB5srI1qU3
 nu94kkLQJEzR+a2xCjVrxq9PM4vRQSdRPKr7HlyYxzQr7qXuHKQ02Lsd526wGlF5dZiI
 iyc4z3rPbyQFjKnBPPRGnZgZ/YTNiGcQa6qoHBSQpce3rkWjYkS8VBF0jMSKkJuDHULL
 LZlAtG3guuLpOgxuQ7rnQMfpcoo6n56odxxKMjo0jwg/GmIaeUMCFnH9Zxhc9e311iYM
 dvjCCdL1pzF8DUP5DmL5IMBF3guUTWi1HSCeZ+nBn/evu83h3t17H2PgaIlftm2h3ttC
 S/EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=U28BL5+lwC9NiM/UwqkBnc3U9ps/l6bCSJUVodsJko8=;
 fh=cyK7lB5PgfOdmta+tppjBfBl9Z2NqFdJdqlm+srH37A=;
 b=VAJJzk+nBO+MNz8v01sRDoDNQlCNgJoAoxzByL+cjbIUiBor+0qowmkO0CfPpFm1Kq
 AiZVcejQOfnlSiiFxv73PpoZfmhPCYWIKtu8HZ/ocpVUMKzX++H0lsTseULhay2Qs4L1
 /oia0g4p3x4n35XBwjFgwILMxRlBc249cx5BA5kzdeoj+Npa38vGaDqq+fP21uXRAMih
 w2pOpihMHLJYN85w8V3oVM/zCQZ5VFCpQvst1OFaviDi/rrzZb38T8riMgA28wIOfNgJ
 YwZh79bTj/xp6yLFMl44ujf5kh2MS+UAKUk+gDuVRMngyrvBExkLXQuR/4iPZRxp67d4
 5VQg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772795649; x=1773400449; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U28BL5+lwC9NiM/UwqkBnc3U9ps/l6bCSJUVodsJko8=;
 b=PqM5Ce0HROqSsC4QiLfY2Pf3AQn4RzrV4+RVb6e+fnfyUd3kQceCjo9NEUqCh7FLv2
 C6Dnc8i8uev9KgDmoxkooWLg9zBDjV/6AFT/v7x7OwchXPL09C3Fd27JGQEWyAQu+Yn5
 muu46vFNP2vBynnnpp399wB6h2K7gflrcQQKnrtrQZReiLbBycu1xNtnDPHD5CM4tPf8
 URoFPi07g6eiamTQw0gBJML8McVnJkPgVIw6H89LaJCPBwDEcJE6T2s+j8150Mq6Ykxx
 +kcx88BQMhaq2WkQnzk39SPPYDDMVlOV3y+Jdkzw3SDopHBt6rEPn8+fkR9kGwpBAbGj
 9mxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772795649; x=1773400449;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=U28BL5+lwC9NiM/UwqkBnc3U9ps/l6bCSJUVodsJko8=;
 b=HgdYbUbxmguknn/e6p+SFLUyG59IVxkWYQzISfGKQN5W+I51L00ZP4+c70DnwhuH/o
 F3VfhCWhvaA1jUtjDzyHzD8FofM8vUEPdgr6wY8HNRPH8veKscRer4Gg3ySS6zzdZMS8
 Z0jEOVi+dyUIFJcWg8zq8Sz5qJGDlEY2KlvrufutN9gbKTO6zMmz25p3NsJ/9O5ZZ15b
 w/VAyIObKbbYor9UQvOoHj1SXlhs8ThF0BcuYvgNDtTG5haDFYMeuo+0LUrp0LXkFcaL
 0PUbfbaZaWi/G2rltosjyoHyxcGcW5+JyrFP+hRlpBwjrwAZMXZf/4PWGTHvvWAY2Ha5
 2Abw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfso1E+C9ecVvU6lkSEV1tbjXLferi1eMRb4KlZRT9M28HnXX6UE13xC7U1pFrTF69pZZzfeAOtA==@nongnu.org
X-Gm-Message-State: AOJu0Yzz7DRskymKXB77dyM/cDlNZBgvh2ehVYbYA1q/fVJD7KZgSnR+
 rQNEshYbiEIquyKYtXRJgMDeUNhtqA+sj+WT0a2P5Zi+UaflmIdhtI27JaN8DKw3Xm7lrzEtD5b
 lQyLq2byzpgOrlCY4jkTTvACxFJ/UMaOKpvwYBE0/tw==
X-Gm-Gg: ATEYQzz8apu2DW0LVApidfBGChCRNjvX4eUTE4DPx6hrxjDdZ1su1+IisKQjLUR/NKt
 gMU9ronWjVthgUQGmGaXi8lMXaLRLJsGswSrodrAI4qLT1rVIIJBAmhrSoQcqBoZ/2puo9D+CeD
 FHFEHSwiTWBDG2VInPMKRM6fi59F/bdxyQyGV3buJCH9P3qMVbz9P2lLAqBXVGQs8wgH0M4wb+w
 ud3ZBLpWbVnQ2nsRKyreK7BwHLMlWXHwl5r2sL8XswPsgvhIGwzQjDgeQ77SdqFTELTthMvsZ5r
 Z+OcUC+QA007xvfb7ZyW7tZseu14vB0cske88keXgGjqDSr+fDApNDe+pHB3waspCnE=
X-Received: by 2002:a53:e198:0:b0:64c:c1b6:7150 with SMTP id
 956f58d0204a3-64d1429ae1dmr1122960d50.46.1772795648662; Fri, 06 Mar 2026
 03:14:08 -0800 (PST)
MIME-Version: 1.0
References: <20260303-sme2-hvf-v6-0-b473702d8287@linaro.org>
 <20260303-sme2-hvf-v6-1-b473702d8287@linaro.org>
 <CAFEAcA8zTkc4pyHQKoDkTMhGPLQmxBaJS3bZiGRrPgux3rDLzw@mail.gmail.com>
 <CAAjaMXbXdrW9N1xLMPxL9OmjLqti6A3rqAmYipu6OkdBY8JPNQ@mail.gmail.com>
 <CAFEAcA_MuZH8d=Z=NfrNQ78k+Kv9mSx+=DLLt8AxZeEjccN8yw@mail.gmail.com>
 <CAAjaMXbq9A1NCO4jnF4aSL0XM2pzHsPsPyWfmqSCg_+2ZQpEHA@mail.gmail.com>
 <35FDE44D-63E2-426E-912C-6EB6CDA52116@unpredictable.fr>
In-Reply-To: <35FDE44D-63E2-426E-912C-6EB6CDA52116@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Mar 2026 11:13:56 +0000
X-Gm-Features: AaiRm52iM5T4V2oISvd27EDnJFJCO1yOBP6XZR7gYjkP1eVqqHBisLwM6om8dYw
Message-ID: <CAFEAcA-Zgq43KW9EC-pteOqxHcZg==GE=1TAURZP-DGRh3OoHQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] hvf/arm: handle FEAT_SME2 migration
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Phil_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Alexander Graf <agraf@csgraf.de>, Mads Ynddal <mads@ynddal.dk>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
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

On Fri, 6 Mar 2026 at 10:19, Mohamed Mediouni <mohamed@unpredictable.fr> wr=
ote:
> > On 6. Mar 2026, at 11:05, Manos Pitsidianakis <manos.pitsidianakis@lina=
ro.org> wrote:
> >
> > On Fri, Mar 6, 2026 at 11:48=E2=80=AFAM Peter Maydell <peter.maydell@li=
naro.org> wrote:
> >> While you're retesting, could you also look at / test patches
> >> 17 and 18 in Mohamed's series
> >> https://lore.kernel.org/qemu-devel/20260306083113.74177-18-mohamed@unp=
redictable.fr/T/#m2d1e3dfbfa5aecd41af6c0aa9e3b574a72c6f04d
> >>
> >> ?
> >>
> >> They look to me like bugfixes that we should be squashing/including
> >> in the "enable SME2 for hvf" handling.
> >
> > Had a quick look, 17 seems to be nested-virt specific so not a bugfix
> > if nested-virt was not already supported in the first place, right?
>
> Hello,
>
> This part isn=E2=80=99t:
>
> @@ -1370,16 +1373,22 @@ int hvf_arch_init_vcpu(CPUState *cpu)
> arm_cpu->cpreg_indexes[sregs_cnt++] =3D kvm_id;
> }
> }
> - if (__builtin_available(macOS 15.2, *)) {
> - for (i =3D 0; i < ARRAY_SIZE(hvf_sreg_list_sme2); i++) {
> - hv_sys_reg_t hvf_id =3D hvf_sreg_list_sme2[i].sreg;
> - uint64_t kvm_id =3D HVF_TO_KVMID(hvf_id);
> - uint32_t key =3D kvm_to_cpreg_id(kvm_id);
> - const ARMCPRegInfo *ri =3D get_arm_cp_reginfo(arm_cpu->cp_regs, key);
> -
> - if (ri) {
> - assert(!(ri->type & ARM_CP_NO_RAW));
> - arm_cpu->cpreg_indexes[sregs_cnt++] =3D kvm_id;
> + if (hvf_arm_sme2_supported()) {
> + /*
> + * Clang doesn't allow us to combine the two checks together.
> + * -Wunsupported-availability-guard
> + */
> + if (__builtin_available(macOS 15.2, *)) {
> + for (i =3D 0; i < ARRAY_SIZE(hvf_sreg_list_sme2); i++) {
> + hv_sys_reg_t hvf_id =3D hvf_sreg_list_sme2[i].sreg;
> + uint64_t kvm_id =3D HVF_TO_KVMID(hvf_id);
> + uint32_t key =3D kvm_to_cpreg_id(kvm_id);
> + const ARMCPRegInfo *ri =3D get_arm_cp_reginfo(arm_cpu->cp_regs, key);
> +
> + if (ri) {
> + assert(!(ri->type & ARM_CP_NO_RAW));
> + arm_cpu->cpreg_indexes[sregs_cnt++] =3D kvm_id;
> + }
> }

Yes; the patch is doing two things and really ought to be two patches,
so we can put the bit that we need for "make SME2 hvf work correctly"
before the "enable SME2 HVF" patch, and the bit that is nested-virt
specific in the nested-virt patches.

thanks
-- PMM

