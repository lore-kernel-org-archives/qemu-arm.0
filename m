Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442DED2ED0F
	for <qemu-arm@archiver.kernel.org>; Tue, 20 Jan 2026 10:02:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vi8ZE-000607-Ti; Tue, 20 Jan 2026 05:02:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vi8Z8-0005u2-9b
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 05:02:30 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vi8Z6-0002o2-IK
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 05:02:26 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-64c893f3a94so10746593a12.0
 for <qemu-arm@nongnu.org>; Tue, 20 Jan 2026 02:02:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768903342; cv=none;
 d=google.com; s=arc-20240605;
 b=T2w2M4B+OxxLnZQcjQMevryrLfybIsrKkzWv+DRoqAhmNBiJtOqIJUeeBAfnIr5NWB
 aCqlw5fjP0Aon3jvvUEsbHj5MGsQUHBVwYgbsfXf3DekoemvsIrZ/9mUaat5nsj44+AD
 CiIdU1Cop52FFBt5BEc3DXO2fEVvMtLsvxNXYQvvTNkOBo+vj830LNEwm5Clsq2nAYEP
 llJk777YX4OuhOEbwF54fTnMi3CIHXPJap2NasTcSI3S5cgiCQdcY1MwqvEny9T9bVgh
 b2LwI6C9heR73kXKDv1Nvl24N/mZrnXiB6kSb39I/5LKev012kpi5YmZhHGxpVAQHEO9
 QonA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=kC2m92qdH3N0jeY0deGlE2vuZ6060lZkkXzeNGrfHkU=;
 fh=JQo4fVzsCJhdP5AeKlATh5VQ84cRIOMAsGsjJRgDOTs=;
 b=hpsh/k2iTXbTvX0dzzL5/6H8Ey/B5810N+TEWxI2YPLcXjCE4uGmkxkzoSYE/yWKLC
 wUPRiai49f6rakJa5duKAY+2K5T6cWKTnrs0I4c07ORoBL0jE8MTswoTQlJrleg3y+1v
 Tb6fhryaaUokGPI52Jwi6wMvtWfLuwYglNhObSEMVTdV7vriIZLzGOSD9SDJVoejxXgs
 6QzTH1MJMHQIYx4g0BGdBtX+VyJibi/ZXv1O9CQZqLIDSHnDU0o4/iHdu7gCGKSmmTFt
 c4QVplXyXz7zsybd74pPS8r4nIkTp7LVv4DkYEJ4CAaduDuS/f4SceBXEMDth+pvhEt7
 5lFg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768903342; x=1769508142; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kC2m92qdH3N0jeY0deGlE2vuZ6060lZkkXzeNGrfHkU=;
 b=VkO3mlT4FK0wgERRtjBDJt986exJLrNETdebTOQuocKwo+8YQF7QEI0ag00W6IMGO9
 3Ju4DJ1HGyf343lVnf1houYbTfY88toGQbHwYOJnP9oaLzKC3/5xVNe/Rs9MY3U294pS
 jU9l3ET9s1wCYVk51xOYYCQSH9weGzKu19lI0nYVd0HrBUHqSYQEVDlZvs8wC6u0CusR
 ty1Nml0dfVG87/797OE8edn2z1JFd6kNA58TkKJ1tmMXzRxn0s+ifs9EQbMH4WECiPlL
 dX7CloJtf3+JJZPqMorb6Dq5wfX3ZRDOQApPLuXjCY13GqKyANpcqbS/f4iVwdh4F1gs
 mFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768903342; x=1769508142;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kC2m92qdH3N0jeY0deGlE2vuZ6060lZkkXzeNGrfHkU=;
 b=LNcyQBJnzuOzFxlSu2Crm5xFzCV52Q8FlUj26PsqAF7EizWXUjOPf+Np3yf1p7eUvh
 fstCwmd/APX9Wv6xlfLx25Orm29EeE+nCmcylgSQg9y3goeAYNpOj0bnwESZXzuJE42Y
 jakpjmyVGZFi4UsMuSXklFJWrbN+tDd5waW2J8G4MVrnvh+bfFb/62CyqzIAYrRkC7kC
 mVi7KDdVlERgUio/wAW7il0A67g+y6I5EOhliDv4EivJLCv7e/2r8E49VrTV3Rbrm+p/
 cSzBenYOFKnunufZC2eN92rBy/Pjg0y7hHGCxTMfnLcO0VlHJ8YGk9jvMYqufBcZEcio
 D6TQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCa0XPi2Bu+VLVfmcCN2orVkZdhtg7rOFwuHAeJ32wzHCLTZxVuelspgSbMV0Y2Z4RORgPQZV6LA==@nongnu.org
X-Gm-Message-State: AOJu0YwXPFD+CEkYfr8EJ2I+5C6TiKrRtyMLDl6D3ggXGAybIyvLNu1F
 JIgMAsn4uKRuQu/vrUTCXqOyH6/ZbAWjsKmaimPmlm8DJ86gNrH8/hFME72xtOMbNuqmkzKnr9m
 1wvI63lxmIVTHI2QGEgAO3Cr5HhZ82hRDrzIsm+F++Q==
X-Gm-Gg: AY/fxX6gwAvMmHroT5aetAn4LUz6L05O4ZBl+l5wzfV1zEBW42IgQ7GxChQWLm9LVan
 293W6ClgSnpYJYZvi3uxJ0x3D3+EYckFQg8hRuChAIPVdZo0bvci9zzAU/GZknaBQQdlWD6gbzI
 0GkTcVfo9QCbPMYl+qFmKz/JidhOPRfN/EhibCRlnEG9gcvjSgkgWW0B9PsurW4VQ4jhGm+Ho1t
 o2BIKgYpRezmXAsURQUSl2kx2FAWQUBUM3SnEg8Y25jp9sGVLifG/30oL6P3xh/TOk3SZvVT/aM
 ASneC+pc14LaO/w8aJzlQFWnxY3H52JJk6ygNNXmOinSCPU=
X-Received: by 2002:a17:907:940b:b0:b87:105f:312b with SMTP id
 a640c23a62f3a-b8777bd32fbmr1661645166b.16.1768903341980; Tue, 20 Jan 2026
 02:02:21 -0800 (PST)
MIME-Version: 1.0
References: <20260115-sme2-hvf-v2-0-2eca481bd7ee@linaro.org>
 <20260115-sme2-hvf-v2-2-2eca481bd7ee@linaro.org>
 <2c3bb870-0321-4799-b7ca-65b2772ddf2c@linaro.org>
In-Reply-To: <2c3bb870-0321-4799-b7ca-65b2772ddf2c@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Tue, 20 Jan 2026 12:01:56 +0200
X-Gm-Features: AZwV_QiM_2z7ofaLNWomoS-ap-hzEu2OdpbWvVJ2PLRXWwlU-jeZQuIyRBGUnOw
Message-ID: <CAAjaMXabRsOX0OVXN202ev3A1sKqMmbDoeY6n7Z-EhmZWmL9Cg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hvf/arm: expose FEAT_SME2 to guest if available
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Alexander Graf <agraf@csgraf.de>, Mads Ynddal <mads@ynddal.dk>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Mohamed Mediouni <mohamed@unpredictable.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x533.google.com
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

On Tue, Jan 20, 2026 at 11:50=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 15/1/26 12:20, Manos Pitsidianakis wrote:
> > Starting from M4 cores and MacOS 15.2 SDK, HVF can virtualise FEAT_SME2=
.
> >
> > Reviewed-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> > Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> > ---
> >   target/arm/cpu.c     |  4 +++-
> >   target/arm/cpu64.c   | 13 ++++++++++++-
> >   target/arm/hvf/hvf.c | 25 +++++++++++++------------
> >   3 files changed, 28 insertions(+), 14 deletions(-)
> >
> > diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> > index caf7980b1fc5244c5c2f130e79ba869456c20c88..7f4ebfdf61217db60754951=
19c1b642bc2abf295 100644
> > --- a/target/arm/cpu.c
> > +++ b/target/arm/cpu.c
> > @@ -1577,7 +1577,9 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error=
 **errp)
> >            * assumes it, so if the user asked for sve=3Doff then turn o=
ff SME also.
> >            * (KVM doesn't currently support SME at all.)
> >            */
> > -        if (cpu_isar_feature(aa64_sme, cpu) && !cpu_isar_feature(aa64_=
sve, cpu)) {
> > +        if (!hvf_enabled()
>
> In my experience "if(!accel)" is bug prone, maybe change to explicit "if
> (tcg_enabled() || kvm_enabled()"?

Shouldn't we list all accelerators instead of just tcg/kvm then?

And why is if(!accel) bug prone?

>
> > +            && cpu_isar_feature(aa64_sme, cpu)
> > +            && !cpu_isar_feature(aa64_sve, cpu)) {
> >               object_property_set_bool(OBJECT(cpu), "sme", false, &erro=
r_abort);
> >           }
> >
> > diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> > index bf303813701972648fa6751ffe352ba074ca6442..8dd9eb46c783a799a53891a=
6ddad40b930e95eb4 100644
> > --- a/target/arm/cpu64.c
> > +++ b/target/arm/cpu64.c
> > @@ -329,9 +329,20 @@ void arm_cpu_sme_finalize(ARMCPU *cpu, Error **err=
p)
> >   {
> >       uint32_t vq_map =3D cpu->sme_vq.map;
> >       uint32_t vq_init =3D cpu->sme_vq.init;
> > -    uint32_t vq_supported =3D cpu->sme_vq.supported;
> > +    uint32_t vq_supported;
> >       uint32_t vq;
> >
> > +    if (hvf_enabled()) {
> > +        if (hvf_arm_sme2_supported()) {
> > +            vq_supported =3D hvf_arm_sme2_get_svl();
> > +        } else {
> > +            assert(!cpu_isar_feature(aa64_sme, cpu));
> > +            vq_supported =3D 0;
> > +        }
> > +    } else {
> > +        vq_supported =3D cpu->sme_vq.supported;
> > +    }
> > +
> >       if (vq_map =3D=3D 0) {
> >           if (!cpu_isar_feature(aa64_sme, cpu)) {
> >               SET_IDREG(&cpu->isar, ID_AA64SMFR0, 0);
> > diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> > index 6c5061742862635ae394f764188114f939259703..01bbb90b962156885021da7=
5a0d62ae3c39ff5b0 100644
> > --- a/target/arm/hvf/hvf.c
> > +++ b/target/arm/hvf/hvf.c
> > @@ -1043,18 +1043,18 @@ static bool hvf_arm_get_host_cpu_features(ARMHo=
stCPUFeatures *ahcf)
> >
> >       clamp_id_aa64mmfr0_parange_to_ipa_size(&host_isar);
> >
> > -    /*
> > -     * Disable SME, which is not properly handled by QEMU hvf yet.
> > -     * To allow this through we would need to:
> > -     * - make sure that the SME state is correctly handled in the
> > -     *   get_registers/put_registers functions
> > -     * - get the SME-specific CPU properties to work with accelerators
> > -     *   other than TCG
> > -     * - fix any assumptions we made that SME implies SVE (since
> > -     *   on the M4 there is SME but not SVE)
> > -     */
> > -    SET_IDREG(&host_isar, ID_AA64PFR1,
> > -              GET_IDREG(&host_isar, ID_AA64PFR1) & ~R_ID_AA64PFR1_SME_=
MASK);
> > +    if (hvf_arm_sme2_supported()) {
> > +        t =3D GET_IDREG(&host_isar, ID_AA64PFR1);
> > +        t =3D FIELD_DP64(t, ID_AA64PFR1, SME, 2);       /* FEAT_SME2 *=
/
> > +        SET_IDREG(&host_isar, ID_AA64PFR1, t);
> > +
> > +        t =3D GET_IDREG(&host_isar, ID_AA64SMFR0);
> > +        t =3D FIELD_DP64(t, ID_AA64SMFR0, SMEVER, 1);   /* FEAT_SME2 *=
/
> > +        SET_IDREG(&host_isar, ID_AA64SMFR0, t);
> > +    } else {
> > +        SET_IDREG(&host_isar, ID_AA64PFR1,
> > +                GET_IDREG(&host_isar, ID_AA64PFR1) & ~R_ID_AA64PFR1_SM=
E_MASK);
> > +    }
> >
> >       ahcf->isar =3D host_isar;
> >
> > @@ -1252,6 +1252,7 @@ int hvf_arch_init_vcpu(CPUState *cpu)
> >                                 arm_cpu->isar.idregs[ID_AA64MMFR0_EL1_I=
DX]);
> >       assert_hvf_ok(ret);
> >
> > +    aarch64_add_sme_properties(OBJECT(cpu));
>
> Out of scope, those aarch64_add_FEAT_properties() should really take a
> ARMCPU *cpu argument IMHO.

You're just looking for new things to fix :D

>
> >       return 0;
> >   }
> >
> >
>

--=20
Manos Pitsidianakis
Emulation and Virtualization Engineer at Linaro Ltd

