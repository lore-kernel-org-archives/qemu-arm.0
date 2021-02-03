Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp446942lfo;
        Wed, 3 Feb 2021 10:12:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1jHoESd5eK18d3rntlxfkY/4i+jyrF5bS0tdHCwbpHYZA+HTnIoj+4l5x5OlPC0D3ZYNL
X-Received: by 2002:a25:f509:: with SMTP id a9mr5975659ybe.35.1612375945127;
        Wed, 03 Feb 2021 10:12:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612375945; cv=none;
        d=google.com; s=arc-20160816;
        b=OIJ6aY/8vJp8Fd2h4ocNJBJLat1sjvL9xqjFAn739TLXfLmiE93A2dkdlezl3/r/on
         4XCbVVAwxso8P8I0mhYl2wnh1waVvupDFeJtYAOT/z0GpZXXVZTpKFiqUnfMnAT5NNGe
         OkgwS6baRTrI0Tt0uXTNDjIcBO0VRXHSe/+HHtcDcIRuObWngl38AbXVpY0lcfM1ZScG
         ywyjHLbKbk9Z8KLWpXhECMoiVSjNK5qHzSk0I/U+5vMjSUSM0ye5EpkfjIaxiw8iNDPA
         F6dkXLh6UG9QyvFomuD4tmyVeD+UwptvTm07Pr1FSJurWa4Ot5wnK3DCvMaToqueijVd
         fMKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:organization:message-id:date
         :subject:to:from;
        bh=IhtH8WPYRyMuBzT5bHSCtqL9XvZvIpxAzdzUSr0AL9I=;
        b=UeLmVlHsFEz1JQmPZg3sao3zUqL+yeZEhboIR82qGagwzr2QQz3imkdCIzauylUDeh
         N6bq0ueIPzHvP/y5DnX5bB2e8jt4GXU9fi95zmZ9IaZSUhXThaeQ3XRVgv7GcNSa57/Y
         +BCwPCYxbqohmMDYTG7gbbAmfL00mQlngwSNKhQMNitCbI6tB19TYBev47nRahYY0R+t
         A3WBziAQ4eL9G4O51ng5c8d4ad64yiakOP7JDt6RuIJjhOIPoDu6s8IYW0N5eIWILeeP
         ubLWpxaJRdFaTCA7tjO8iwH0LXwYyPaQNw2ulXTjxxQiJRXwAFeCl9FuR5x2IwdhZ99e
         jnNw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7si2783658ybo.332.2021.02.03.10.12.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 10:12:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7Mdc-0000ey-F1
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 13:12:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>) id 1l7Lz0-0005wl-F2
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 12:30:26 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:38200
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>) id 1l7Lyx-0005W7-US
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 12:30:25 -0500
Received: from basile.remlab.net (dzyqn8ypzhx7l91mxjsvy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:a01a:be01:9434:f69e:d553:3be2])
 (Authenticated sender: remi)
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTPSA id 2EB2A60B8D
 for <qemu-arm@nongnu.org>; Wed,  3 Feb 2021 18:30:21 +0100 (CET)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: qemu-arm@nongnu.org
Subject: Re: [PATCH v2 1/1] target/arm: Fix SCR RES1 handling
Date: Wed, 03 Feb 2021 19:30:19 +0200
Message-ID: <5639019.LFGEF57sxV@basile.remlab.net>
Organization: Remlab
In-Reply-To: <20210203165552.16306-2-michael.nawrocki@gtri.gatech.edu>
References: <20210203165552.16306-1-michael.nawrocki@gtri.gatech.edu>
 <20210203165552.16306-2-michael.nawrocki@gtri.gatech.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f29TMZAIYPqN

Le keskiviikkona 3. helmikuuta 2021, 18.55.52 EET michael. nawrocki--- via =
a=20
=C3=A9crit :
> The FW and AW bits of SCR_EL3 are RES1 only in some contexts. Force them
> to 1 only when there is no support for AArch32 at EL1 or above.
>=20
> The reset value will be 0x30 only if the CPU is AArch64-only; if there
> is support for AArch32 at EL1 or above, it will be reset to 0.
>=20
> Also adds helper function isar_feature_aa64_aa32_el1 to check if AArch32
> is supported at EL1 or above.
>=20
> Signed-off-by: Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
> ---
>  target/arm/cpu.h    |  5 +++++
>  target/arm/helper.c | 16 ++++++++++++++--
>  2 files changed, 19 insertions(+), 2 deletions(-)
>=20
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index d080239863..39633f73f3 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -4033,6 +4033,11 @@ static inline bool isar_feature_aa64_aa32(const
> ARMISARegisters *id) return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, EL0)
> >=3D 2;
>  }
>=20
> +static inline bool isar_feature_aa64_aa32_el1(const ARMISARegisters *id)
> +{
> +    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, EL1) >=3D 2;
> +}
> +
>  static inline bool isar_feature_aa64_sve(const ARMISARegisters *id)
>  {
>      return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, SVE) !=3D 0;
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 47e266d7e6..e529cdbfd0 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -2024,7 +2024,10 @@ static void scr_write(CPUARMState *env, const
> ARMCPRegInfo *ri, uint64_t value) ARMCPU *cpu =3D env_archcpu(env);
>=20
>      if (ri->state =3D=3D ARM_CP_STATE_AA64) {
> -        value |=3D SCR_FW | SCR_AW;   /* these two bits are RES1.  */
> +        if (arm_feature(env, ARM_FEATURE_AARCH64) &&

AFAICT, this is a tautology in this context.

> +            !cpu_isar_feature(aa64_aa32_el1, cpu)) {
> +                value |=3D SCR_FW | SCR_AW;   /* these two bits are RES1=
=2E  */
> +        }
>          valid_mask &=3D ~SCR_NET;
>=20
>          if (cpu_isar_feature(aa64_lor, cpu)) {
> @@ -2063,6 +2066,15 @@ static void scr_write(CPUARMState *env, const
> ARMCPRegInfo *ri, uint64_t value) raw_write(env, ri, value);
>  }
>=20
> +static void scr_reset(CPUARMState *env, const ARMCPRegInfo *ri)
> +{
> +    /*
> +     * scr_write will set the RES1 bits on an AArch64-only CPU.
> +     * The reset value will be 0x30 on an AArch64-only CPU and 0 otherwi=
se.
> +     */
> +    scr_write(env, ri, 0);
> +}
> +
>  static CPAccessResult access_aa64_tid2(CPUARMState *env,
>                                         const ARMCPRegInfo *ri,
>                                         bool isread)
> @@ -5785,7 +5797,7 @@ static const ARMCPRegInfo el3_cp_reginfo[] =3D {
>      { .name =3D "SCR_EL3", .state =3D ARM_CP_STATE_AA64,
>        .opc0 =3D 3, .opc1 =3D 6, .crn =3D 1, .crm =3D 1, .opc2 =3D 0,
>        .access =3D PL3_RW, .fieldoffset =3D offsetof(CPUARMState, cp15.sc=
r_el3),
> -      .resetvalue =3D 0, .writefn =3D scr_write },
> +      .resetfn =3D scr_reset, .writefn =3D scr_write },
>      { .name =3D "SCR",  .type =3D ARM_CP_ALIAS | ARM_CP_NEWEL,
>        .cp =3D 15, .opc1 =3D 0, .crn =3D 1, .crm =3D 1, .opc2 =3D 0,
>        .access =3D PL1_RW, .accessfn =3D access_trap_aa32s_el1,


=2D-=20
=E3=83=AC=E3=83=9F=E3=83=BB=E3=83=87=E3=83=8B-=E3=82=AF=E3=83=BC=E3=83=AB=
=E3=83=A2=E3=83=B3
http://www.remlab.net/



