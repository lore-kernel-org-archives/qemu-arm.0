Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7567606A326
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 11:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gpPlDCxZ
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOvR1-0000rd-9g; Thu, 05 Nov 2026 06:15:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xOvQl-0000gB-Hb
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 06:14:57 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xOvQj-0002T5-BX
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 06:14:55 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6b58cb69927so127792a12.0
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 03:14:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793877289; cv=none;
 d=google.com; s=arc-20260327;
 b=sM8EUU4/KAOfjD1z3vm1byM21BpPGVdkKouO7Nq21vtt+JDa94/dUrvIUr6Lv92a6s
 HBjCi7CE0po0oPIGRd3OmNM3LcnW1c7NGNpHNubrkobzQ57JrERwjuPsN7/uefTa/2tT
 QKR6zzTZL4JHYK9fXN1wD8JkGTpP4MKzgo8ynr+Liz3Q1BaarMho7pX8bZtrZc68tHKI
 tRt4lZjnVEvCEMHvGG9KgFLeGfmi7aZqbPeSlP2jpRmSDK8eZjNSZORW3UfbrHX1kiWw
 QaHAjhIGX68x3Lj9/4o/IaM5FWFVhJeKkyFve1ASz/LZTG+CwqdWJD+1LyjaGw1Us/Su
 ffmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=cVbkdDuKyZ8y+K1SLT1x92HxA91Y6BCx8q4u5K2TpeU=;
 fh=uUVa9YDGmdTzhv0FyuajdIPsbXwGnm1ARstUDtviiOs=;
 b=GIyCucE5kOghDYadmwF1PtC3KKJIZtpNoEUlsuakkUsCFxVP4VR3dVkvRDpS1MlZaU
 WggCnAwkyvR8RP/3hgYz8H1j80Jmd5pL5gTJZlZ11moQ3kyuNCiEhrA249IbMS6r2BSt
 KoISehAnha+ZJSNgTTkvyYCzLkPrx2LsfLhAuZDZbCDOAGmFeHAhwOmgvj2fn8iKDDHL
 Mj0SoypE/uAc4UkP8jNLFUVxpTMr7Dm52vWIVC1CjLJdO3Z4nEYkdD08hJLXEMbUKEd2
 z8giTzWPZsttQXUM+T72qXx9py63+ymwAfwM4hc8ui2riMGt/NQei4kwBU1kYW/HhNvI
 YPzQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793877289; x=1794482089; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=cVbkdDuKyZ8y+K1SLT1x92HxA91Y6BCx8q4u5K2TpeU=;
 b=gpPlDCxZy4Tf7EUfU6QwGxza/mE8egnOShY/DOuzepyO4qgsZaW2Dk5Vbt3oIXWtIs
 3RnmCMd19bNvWn7bhG7mT1W5C3yGc0ItpM+hm35k/DQ5a7K5xW5IwhMNjdL6/Sb9Pdj9
 JF17LVsioGL6vLD2IRiuOe5DPWO/RF9gl/tnRvR8ZFm5JxFqe1cBVA8/5Zeq3GN72qt5
 9lqGUmaK1kmV/6LmtIxmUkmzjjf+iNbOfts8FjMtr/qSzHfkBLnYnZQbrY/eMVgsNBxp
 DECV3XLk2amVcH4rq0g2Pg7bZvpqlFldRoz3SyE6ceRQQfNJCOriq2cI32iu0GItIJMY
 1Fcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793877289; x=1794482089;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=cVbkdDuKyZ8y+K1SLT1x92HxA91Y6BCx8q4u5K2TpeU=;
 b=cJeDJkjrWWblS2ue6rGx/hbiSLBZ/jEXWDDh8XUx10+7U3VsFE5RS1on/CMNvmcm1A
 At+4nYlIjFo/VubMGkmCY7N4ugMtfHIjgk7cchJfkyFOT1Tr71JR0shktn/4pBoQOSEe
 uyDU9iqisKeZaPaY+1oyuPvkTL+B+2xni4P5xw8PLZwHo2Kcn3LP9sU56WclrXNIJqYd
 0ewftYbm5G6y3lAE2xL/6ZZqSExINyUx5pcj5PUeLwrveHoxxk9JHOavK9Sr/ojmPFA2
 Oz+NfAYPCLNodR3+gKd0rxjTG/pVdBjoawzjzmulScxJNuXpqGnKVa63eDe85S49pUSQ
 BG3w==
X-Forwarded-Encrypted: i=1;
 AKwUvBxrzIsQjSic+d9vltw3ZIbrMmJLuwYjUxOWGy6S32xyH7yOZuDb3fyE6b/vg/JNv21NHy4Ayr/8rA==@nongnu.org
X-Gm-Message-State: APuU4Z/MF6EJmBYRbLW9gx1Ng8mwsDSxn3pIZOv2Abael0UWeNMXrF9Y
 86N7Qjat9+efjiHLjgvPq9qIhAdT/sV+JaPNkTlw1zINPpyWWJNigzpp/m5ix4smZKSM8dsca42
 8tx0dZbWLis/xd5SU3GwFdCC9RuyaJdY=
X-Gm-Gg: AYBFou2hrIG3rwxMLFMAHG6NXrbZGgCS3BthxOX6qSeLYqEr6j7eMn6xS1OivUS795A
 R3f5tF4h65lGGLZFhmmW2lkjXorLQpeuLvE0YnwDyC/lI2sOZNz7jG+MP43fXjDSvo8J7/hOY//
 Ty1n7h9vlX9KSdwnNn52MCX2CePBogZeugjdLvh6J/ddSiQgTL3jScbDlkpr+P0T0nHkz7RHMf5
 FXsq3VyX7vpcGlIYMI6DAHdw450V+pms97j7LXJjVsuSnT1xURa79Y33/iyrBNx7ggw9SNxkjXF
 hUntZOxNXFFy/cGHWdUzrTs5k7cs69fVdrcjx9nOnDXGBan4gSwPUfYDvFJUzU/La+y2/JLDK1m
 f6WWaId2zL0l70u2CXEnYC977E29zEruz+hEj
X-Received: by 2002:a05:6402:b21:b0:6b1:c285:f8d8 with SMTP id
 4fb4d7f45d1cf-6b5777252eemr1132165a12.11.1793877288489; Thu, 05 Nov 2026
 03:14:48 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261031164009.2048-1-luoyonggang@gmail.com>
 <20261031164009.2048-7-luoyonggang@gmail.com>
 <auxgsFyzv-5UiyNk@redhat.com>
In-Reply-To: <auxgsFyzv-5UiyNk@redhat.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Thu, 5 Nov 2026 19:14:35 +0800
X-Gm-Features: AclHuK8tJYW8q4QG64JvjzWiMabcPoIg_CKQ5B4EQj0WH1J30aCIg40XxtKDWWE
Message-ID: <CAE2XoE9J++-BHL5BDx4_jxuto+xwVmvFS3F-hE9gLbgfUmaFdA@mail.gmail.com>
Subject: Re: [PATCH v2 06/12] target/arm: register separate max-v8 CPU types
 for arm and aarch64
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Song Gao <17746591750@163.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>, 
 David Hildenbrand <david@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Fam Zheng <fam@euphon.net>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-s390x@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Eric Farman <farman@linux.ibm.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Cornelia Huck <cohuck@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: luoyonggang@gmail.com
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 5, 2026 at 6:55=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@re=
dhat.com> wrote:
>
> On Sun, Nov 01, 2026 at 12:40:01AM +0800, Yonggang Luo wrote:
> > max-v8 was one TypeInfo whose instance initializer was chosen from the
> > selected target at registration. Register both initializers, and let
> > target_arm() and target_aarch64() select which type is available.
> >
> > Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> > Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> > ---
> >  target/arm/cpu.c            |  1 +
> >  target/arm/cpu.h            |  1 +
> >  target/arm/tcg/cpu-max-v8.c | 16 ++++++++++++----
> >  3 files changed, 14 insertions(+), 4 deletions(-)
> >
> > diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> > index 510fc9eeb3b..6eb55242980 100644
> > --- a/target/arm/cpu.c
> > +++ b/target/arm/cpu.c
> > @@ -2695,6 +2695,7 @@ void arm_cpu_register(const ARMCPUInfo *info)
> >          .instance_init =3D arm_cpu_instance_init,
> >          .class_init =3D info->class_init ?: cpu_register_class_init,
> >          .class_data =3D info,
> > +        .is_available =3D info->is_available,
> >      };
> >
> >      type_info.name =3D g_strdup_printf("%s-" TYPE_ARM_CPU, info->name)=
;
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index add993ef101..3240a8633ee 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -1203,6 +1203,7 @@ typedef struct ARMCPUInfo {
> >      const char *deprecation_note;
> >      void (*initfn)(Object *obj);
> >      void (*class_init)(ObjectClass *oc, const void *data);
> > +    bool (*is_available)(void);
> >  } ARMCPUInfo;
> >
> >  /**
> > diff --git a/target/arm/tcg/cpu-max-v8.c b/target/arm/tcg/cpu-max-v8.c
> > index 65f851f2006..e819d07e6ce 100644
> > --- a/target/arm/tcg/cpu-max-v8.c
> > +++ b/target/arm/tcg/cpu-max-v8.c
> > @@ -121,10 +121,18 @@ void aarch32_max_v8_tcg_initfn(Object *obj)
> >
> >  static void cpu_max_v8_register_type(void)
> >  {
> > -    static const ARMCPUInfo max_v8[2] =3D {
> > -        { .name =3D "max-v8", .initfn =3D aarch32_max_v8_tcg_initfn },
> > -        { .name =3D "max-v8", .initfn =3D aarch64_max_v8_tcg_initfn },
> > +    static const ARMCPUInfo max_v8_aarch32 =3D {
> > +        .name =3D "max-v8",
> > +        .initfn =3D aarch32_max_v8_tcg_initfn,
> > +        .is_available =3D target_arm,
> >      };
> > -    arm_cpu_register(&max_v8[target_aarch64()]);
> > +    static const ARMCPUInfo max_v8_aarch64 =3D {
> > +        .name =3D "max-v8",
> > +        .initfn =3D aarch64_max_v8_tcg_initfn,
> > +        .is_available =3D target_aarch64,
> > +    };
> > +
> > +    arm_cpu_register(&max_v8_aarch32);
> > +    arm_cpu_register(&max_v8_aarch64);
> >  }
> >  type_init(cpu_max_v8_register_type)
>
> Conceptually these are two separate CPUs one 32-bit featureset
> and one 64-bit featureset, but both given the same name. The
> current code registers them only in the respective arm and aarch64
> target binaries, but this CPU is an oddity overall.

This is the one I did before
https://lore.kernel.org/qemu-devel/20261013195606.152-1-luoyonggang@gmail.c=
om/

target/arm: defer max-v8 initializer selection until CPU creation
but rejected, and I think it's fine.

>
> More generally the aarch64 emulator includes all the 32-bit CPUs
> that the arm emulator includes, and just adds extra 64-bit CPUs.
> IOW, excluding the 32-bit max-v8 CPU is a special case - if it
> were not for the clashing name, it would be included like all the
> other 32-bit CPUs.
>
> Thus rather than using is_available to continue to exclude it,
> we must instead resolve the naming problem, such that both
> models can be included concurrently.

I have already implemented the TypeBucket over targets/arch_mask that works
properly. That same QOM name will have multiple TypeImpl.

If you allow me, I'd like to post them all with TypeBucket implemented
so we have
a clean discussion basepoint.

>
> One approach to this is to consider  the generic 'max-v8' name
> to be an alias, that is resolved to the underlying real CPU
> name 'max-v8-64' vs 'max-v8-32'. Allow the aliases to be
> ambiguous, and either the selected target_info() disambiguates
> aliases, or apps can use the canonical name instead of the alias.
>
> With regards,
> Daniel
> --
> |: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
> |: https://libvirt.org          ~~          https://entangle-photo.org :|
> |: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|
>


--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

