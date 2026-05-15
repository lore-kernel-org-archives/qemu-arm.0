Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E76ECD343F
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:25:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtTk-0005Fc-CK; Fri, 15 May 2026 10:25:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wNtTU-0005Bv-Rs
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:25:16 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wNtTO-0000Sv-Ik
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:25:10 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-44a5174670eso5215569f8f.1
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:25:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778855104; cv=none;
 d=google.com; s=arc-20240605;
 b=DEvtEzeHFVk5iu0uEzJ6idhlx1a+ovSq2Ut6yDzdCxYs/h3VxtoQ125h156z/DiTDu
 smrRujTK2sw/yhXDpUM23VsvbmPxTa/mrGZr0WRDpfvRd/RwMDzY8KNa+t3mYc1Q24Zu
 OAxYQMBjcSZRKzh+gwSvxejjfaAzqoEaTH1VPPlaOlT1Tv3nXgkyarx7P4Da5KZ41un8
 9Y3Q3pfsczc8c8PZX6rMj4CZ/XlS9gHIeSWDEQreiy2H0QPUe82Lb5NeRCb4WDuunAoR
 NuxuK/ZgGTx2OBSjH8tXCQ2DfdHz2MWcFBNdMPLHZhl4bI41ss2AOe6Up82/nUD6KMXY
 pGmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=cMrrWnS4VHNLuFxZ4GMd9qwHwtWG4YitXnV/ZBRiLSg=;
 fh=SOyyhcyBMtJxqnEaoAh069BBiDj8ft9+i0GONCfo9Og=;
 b=NSfuNO4yYgrm2pt8aKR9CDF7TC7nNnqYA40+eoFia/OB40atHdjaLR2kHDVSWSsTTf
 mioxmMitzQFySKBbSSCWzBvAzbpPAbarJo6xqvAi/z4PM9oTdrHGDVRWa2+lch7iv++a
 snKMPbHYRDLWsvoxXybd0P9yRXyZH2avEAEhRm9wuXsaGqGtrfuaxB683uXCKjrKNPIF
 aobh2owoql57mx3EpCPRyOfWVAgS8OcdbAIEVZqLh8kYY5iq4QhlN27P1sj+tabtrh1r
 w3IZgcF3dNRyvUcvTwRFb8MtyyuzhotAOmhKA2gjaHvok/vZf4/PTQuy+tv+qny6vQVY
 V2Pg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778855104; x=1779459904; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cMrrWnS4VHNLuFxZ4GMd9qwHwtWG4YitXnV/ZBRiLSg=;
 b=iti7DUww6ROTAPfElNcfMDAljPL6qbwqbf6doykUmIQUnPT/MlZo1Ca+goFmm11p2J
 9yDkQVYWrOYL2UltuY04dSNICDnMOTrKGGxx4/ph538C7WmSSWmrbpuY99Pv06HmiPyb
 /tDTHjyGe7CcyrFVTDKhDbwb+46rL/F793mhk0KEQGIRHMcwD4uttX3+ec8oGRFOjs77
 1yJ8XxR10TZ5nlwqPVi8VFlGTkpNPdZzLEg3PhL0VUg1/YvArRfTxKqPGdnEFgtwZae/
 VO7bylnO6iFTX8hejS7rLQ6nUbjwMGG7rIIJ3p+YtakfgIln4JBeYKxWvVld0/oYjdSn
 mH7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778855104; x=1779459904;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cMrrWnS4VHNLuFxZ4GMd9qwHwtWG4YitXnV/ZBRiLSg=;
 b=DiSYmc8qg85Zi6v1oQrzaTftoowMxgcnKOy7/o2tzVwTZTs1s6pozHkcF6VdW17Ikn
 J6VaZeFhKwYpw9Y+/ZlMYbCeLRdA/ecvM3gTZSboGvDUzPZExKcUyK8fchcCOpuzn0Z/
 gzWoiqzowo12szNQqyGLJ1sRNTnXqEY0g/Rv5eUb6LO7po3+NxO6oWjiDzEljHTgTxsp
 LUPiwI89/JY4RB+lRvag+UQIJ3oNJgoJsO9zxIqFgBVEtx2V8dThb5ccZi63XpJW5+iC
 6Z//Rrn/T31qn5/TmidnIBqrgF6M98mcSHCh8GsaKLFvs9/qc+C0oCTV4prha1HxCCqm
 JhZg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/APCMAec1ScqLHx5DqsChOe1MIHCJYEWKf9cHg5fzhyR5DBs0/B182Luiv6GqE7AsNo3/enfZ7fA==@nongnu.org
X-Gm-Message-State: AOJu0YyVqqPqf7iUFeU5oBuBK7q4voXOjeH5aMH/r723mY60tgC4S3Pi
 0P03Ti9VKIBI3VsM9e3rrwkT6ZmZd0e0pOqO9JJ25I2IZ3Xe8AsFlrE/1jQPn+0UbJFW6jbsqSm
 48YVXOGHBW8XzTvo5klx4IXH68sVX46FRAXw4q7deeQ==
X-Gm-Gg: Acq92OEvPparKv4mpmiDJC7HGX0Vtsx2lom9km1yU3F55LO/ZRlyopVl/FylZ4Usivs
 tPdyXao9nhyvTYTvqhCBEbMRI5gMnl/BsjkN4awLoBn+1fa9kp0i33iLxaEFwPd01TfhkXlb3xg
 /cC3S1Dc7QqZZ0QSifTcX0by3jc53lKKXb4ibpEoW24ciAenKfGekLRUPXFW8q22NrAfhHs6W3S
 sCUaOj+Ej5vVzpCXTgaxbOI7LqfxiGwBU07Hs/Lb4xC6zPCYwhV5IBCxAZ+zNXvXTQ9N9eaaKgI
 JpAIuq4XD9ShvPDWY2UqiB8Z0MzilGHpHf5wQRqTlbAYIbNWMw==
X-Received: by 2002:a05:6000:2405:b0:43d:e31:68d1 with SMTP id
 ffacd0b85a97d-45e5c5cf18bmr5707638f8f.21.1778855103515; Fri, 15 May 2026
 07:25:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260515141032.3271-1-philmd@linaro.org>
 <20260515141032.3271-13-philmd@linaro.org>
In-Reply-To: <20260515141032.3271-13-philmd@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 15 May 2026 17:24:36 +0300
X-Gm-Features: AVHnY4KXZnxKzNZT2_vQEw9bNh7WkMPAnCaws3la6sKR99IK-LFqVextnMc71TM
Message-ID: <CAAjaMXaaUuJ-Nb9TysOLPM93vKFDobxCGb9ijXO4ycPcf4qLcQ@mail.gmail.com>
Subject: Re: [PATCH v6 12/20] target/arm: Extract common code related to 'max'
 CPU
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, 
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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

On Fri, May 15, 2026 at 5:12=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

>  target/arm/cpu-max.c   | 106 +++++++++++++++++++++++++++++++++++++++++
>  target/arm/tcg/cpu32.c |  96 -------------------------------------
>  target/arm/meson.build |   1 +
>  3 files changed, 107 insertions(+), 96 deletions(-)
>  create mode 100644 target/arm/cpu-max.c
>
> diff --git a/target/arm/cpu-max.c b/target/arm/cpu-max.c
> new file mode 100644
> index 00000000000..9fd48ce46e2
> --- /dev/null
> +++ b/target/arm/cpu-max.c
> @@ -0,0 +1,106 @@
> +/*
> + * QEMU ARM 'max' CPU
> + *
> + * Copyright (c) 2018 Linaro Ltd
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "target/arm/internals.h"
> +
> +/* Share AArch32 -cpu max features with AArch64. */
> +void aa32_max_features(ARMCPU *cpu)
> +{
> +    uint32_t t;
> +    ARMISARegisters *isar =3D &cpu->isar;
> +
> +    /* Add additional features supported by QEMU */
> +    t =3D GET_IDREG(isar, ID_ISAR5);
> +    t =3D FIELD_DP32(t, ID_ISAR5, AES, 2);          /* FEAT_PMULL */
> +    t =3D FIELD_DP32(t, ID_ISAR5, SHA1, 1);         /* FEAT_SHA1 */
> +    t =3D FIELD_DP32(t, ID_ISAR5, SHA2, 1);         /* FEAT_SHA256 */
> +    t =3D FIELD_DP32(t, ID_ISAR5, CRC32, 1);
> +    t =3D FIELD_DP32(t, ID_ISAR5, RDM, 1);          /* FEAT_RDM */
> +    t =3D FIELD_DP32(t, ID_ISAR5, VCMA, 1);         /* FEAT_FCMA */
> +    SET_IDREG(isar, ID_ISAR5, t);
> +
> +    t =3D GET_IDREG(isar, ID_ISAR6);
> +    t =3D FIELD_DP32(t, ID_ISAR6, JSCVT, 1);        /* FEAT_JSCVT */
> +    t =3D FIELD_DP32(t, ID_ISAR6, DP, 1);           /* Feat_DotProd */
> +    t =3D FIELD_DP32(t, ID_ISAR6, FHM, 1);          /* FEAT_FHM */
> +    t =3D FIELD_DP32(t, ID_ISAR6, SB, 1);           /* FEAT_SB */
> +    t =3D FIELD_DP32(t, ID_ISAR6, SPECRES, 1);      /* FEAT_SPECRES */
> +    t =3D FIELD_DP32(t, ID_ISAR6, BF16, 1);         /* FEAT_AA32BF16 */
> +    t =3D FIELD_DP32(t, ID_ISAR6, I8MM, 1);         /* FEAT_AA32I8MM */
> +    SET_IDREG(isar, ID_ISAR6, t);
> +
> +    t =3D cpu->isar.mvfr1;
> +    t =3D FIELD_DP32(t, MVFR1, FPHP, 3);            /* FEAT_FP16 */
> +    t =3D FIELD_DP32(t, MVFR1, SIMDHP, 2);          /* FEAT_FP16 */
> +    cpu->isar.mvfr1 =3D t;
> +
> +    t =3D cpu->isar.mvfr2;
> +    t =3D FIELD_DP32(t, MVFR2, SIMDMISC, 3);        /* SIMD MaxNum */
> +    t =3D FIELD_DP32(t, MVFR2, FPMISC, 4);          /* FP MaxNum */
> +    cpu->isar.mvfr2 =3D t;
> +
> +    FIELD_DP32_IDREG(isar, ID_MMFR3, PAN, 2);          /* FEAT_PAN2 */
> +
> +    t =3D GET_IDREG(isar, ID_MMFR4);
> +    t =3D FIELD_DP32(t, ID_MMFR4, HPDS, 2);         /* FEAT_HPDS2 */
> +    t =3D FIELD_DP32(t, ID_MMFR4, AC2, 1);          /* ACTLR2, HACTLR2 *=
/
> +    t =3D FIELD_DP32(t, ID_MMFR4, CNP, 1);          /* FEAT_TTCNP */
> +    t =3D FIELD_DP32(t, ID_MMFR4, XNX, 1);          /* FEAT_XNX */
> +    t =3D FIELD_DP32(t, ID_MMFR4, EVT, 2);          /* FEAT_EVT */
> +    SET_IDREG(isar, ID_MMFR4, t);
> +
> +    FIELD_DP32_IDREG(isar, ID_MMFR5, ETS, 2);          /* FEAT_ETS2 */
> +
> +    t =3D GET_IDREG(isar, ID_PFR0);
> +    t =3D FIELD_DP32(t, ID_PFR0, CSV2, 2);          /* FEAT_CSV2 */
> +    t =3D FIELD_DP32(t, ID_PFR0, DIT, 1);           /* FEAT_DIT */
> +    t =3D FIELD_DP32(t, ID_PFR0, RAS, 1);           /* FEAT_RAS */
> +    SET_IDREG(isar, ID_PFR0, t);
> +
> +    t =3D GET_IDREG(isar, ID_PFR2);
> +    t =3D FIELD_DP32(t, ID_PFR2, CSV3, 1);          /* FEAT_CSV3 */
> +    t =3D FIELD_DP32(t, ID_PFR2, SSBS, 1);          /* FEAT_SSBS */
> +    SET_IDREG(isar, ID_PFR2, t);
> +
> +    t =3D GET_IDREG(isar, ID_DFR0);
> +    t =3D FIELD_DP32(t, ID_DFR0, COPDBG, 10);       /* FEAT_Debugv8p8 */
> +    t =3D FIELD_DP32(t, ID_DFR0, COPSDBG, 10);      /* FEAT_Debugv8p8 */
> +    t =3D FIELD_DP32(t, ID_DFR0, PERFMON, 6);       /* FEAT_PMUv3p5 */
> +    SET_IDREG(isar, ID_DFR0, t);
> +
> +    /* Debug ID registers. */
> +
> +    /* Bit[15] is RES1, Bit[13] and Bits[11:0] are RES0. */
> +    t =3D 0x00008000;
> +    t =3D FIELD_DP32(t, DBGDIDR, SE_IMP, 1);
> +    t =3D FIELD_DP32(t, DBGDIDR, NSUHD_IMP, 1);
> +    t =3D FIELD_DP32(t, DBGDIDR, VERSION, 10);      /* FEAT_Debugv8p8 */
> +    t =3D FIELD_DP32(t, DBGDIDR, CTX_CMPS, 1);
> +    t =3D FIELD_DP32(t, DBGDIDR, BRPS, 5);
> +    t =3D FIELD_DP32(t, DBGDIDR, WRPS, 3);
> +    cpu->isar.dbgdidr =3D t;
> +
> +    t =3D 0;
> +    t =3D FIELD_DP32(t, DBGDEVID, PCSAMPLE, 3);
> +    t =3D FIELD_DP32(t, DBGDEVID, WPADDRMASK, 1);
> +    t =3D FIELD_DP32(t, DBGDEVID, BPADDRMASK, 15);
> +    t =3D FIELD_DP32(t, DBGDEVID, VECTORCATCH, 0);
> +    t =3D FIELD_DP32(t, DBGDEVID, VIRTEXTNS, 1);
> +    t =3D FIELD_DP32(t, DBGDEVID, DOUBLELOCK, 1);
> +    t =3D FIELD_DP32(t, DBGDEVID, AUXREGS, 0);
> +    t =3D FIELD_DP32(t, DBGDEVID, CIDMASK, 0);
> +    cpu->isar.dbgdevid =3D t;
> +
> +    /* Bits[31:4] are RES0. */
> +    t =3D 0;
> +    t =3D FIELD_DP32(t, DBGDEVID1, PCSROFFSET, 2);
> +    cpu->isar.dbgdevid1 =3D t;
> +
> +    FIELD_DP32_IDREG(isar, ID_DFR1, HPMN0, 1);         /* FEAT_HPMN0 */
> +}
> diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
> index 73d21c6cf7d..919ed8a6cf8 100644
> --- a/target/arm/tcg/cpu32.c
> +++ b/target/arm/tcg/cpu32.c
> @@ -18,102 +18,6 @@
>  #include "cpregs.h"
>
>
> -/* Share AArch32 -cpu max features with AArch64. */
> -void aa32_max_features(ARMCPU *cpu)
> -{
> -    uint32_t t;
> -    ARMISARegisters *isar =3D &cpu->isar;
> -
> -    /* Add additional features supported by QEMU */
> -    t =3D GET_IDREG(isar, ID_ISAR5);
> -    t =3D FIELD_DP32(t, ID_ISAR5, AES, 2);          /* FEAT_PMULL */
> -    t =3D FIELD_DP32(t, ID_ISAR5, SHA1, 1);         /* FEAT_SHA1 */
> -    t =3D FIELD_DP32(t, ID_ISAR5, SHA2, 1);         /* FEAT_SHA256 */
> -    t =3D FIELD_DP32(t, ID_ISAR5, CRC32, 1);
> -    t =3D FIELD_DP32(t, ID_ISAR5, RDM, 1);          /* FEAT_RDM */
> -    t =3D FIELD_DP32(t, ID_ISAR5, VCMA, 1);         /* FEAT_FCMA */
> -    SET_IDREG(isar, ID_ISAR5, t);
> -
> -    t =3D GET_IDREG(isar, ID_ISAR6);
> -    t =3D FIELD_DP32(t, ID_ISAR6, JSCVT, 1);        /* FEAT_JSCVT */
> -    t =3D FIELD_DP32(t, ID_ISAR6, DP, 1);           /* Feat_DotProd */
> -    t =3D FIELD_DP32(t, ID_ISAR6, FHM, 1);          /* FEAT_FHM */
> -    t =3D FIELD_DP32(t, ID_ISAR6, SB, 1);           /* FEAT_SB */
> -    t =3D FIELD_DP32(t, ID_ISAR6, SPECRES, 1);      /* FEAT_SPECRES */
> -    t =3D FIELD_DP32(t, ID_ISAR6, BF16, 1);         /* FEAT_AA32BF16 */
> -    t =3D FIELD_DP32(t, ID_ISAR6, I8MM, 1);         /* FEAT_AA32I8MM */
> -    SET_IDREG(isar, ID_ISAR6, t);
> -
> -    t =3D cpu->isar.mvfr1;
> -    t =3D FIELD_DP32(t, MVFR1, FPHP, 3);            /* FEAT_FP16 */
> -    t =3D FIELD_DP32(t, MVFR1, SIMDHP, 2);          /* FEAT_FP16 */
> -    cpu->isar.mvfr1 =3D t;
> -
> -    t =3D cpu->isar.mvfr2;
> -    t =3D FIELD_DP32(t, MVFR2, SIMDMISC, 3);        /* SIMD MaxNum */
> -    t =3D FIELD_DP32(t, MVFR2, FPMISC, 4);          /* FP MaxNum */
> -    cpu->isar.mvfr2 =3D t;
> -
> -    FIELD_DP32_IDREG(isar, ID_MMFR3, PAN, 2);          /* FEAT_PAN2 */
> -
> -    t =3D GET_IDREG(isar, ID_MMFR4);
> -    t =3D FIELD_DP32(t, ID_MMFR4, HPDS, 2);         /* FEAT_HPDS2 */
> -    t =3D FIELD_DP32(t, ID_MMFR4, AC2, 1);          /* ACTLR2, HACTLR2 *=
/
> -    t =3D FIELD_DP32(t, ID_MMFR4, CNP, 1);          /* FEAT_TTCNP */
> -    t =3D FIELD_DP32(t, ID_MMFR4, XNX, 1);          /* FEAT_XNX */
> -    t =3D FIELD_DP32(t, ID_MMFR4, EVT, 2);          /* FEAT_EVT */
> -    SET_IDREG(isar, ID_MMFR4, t);
> -
> -    FIELD_DP32_IDREG(isar, ID_MMFR5, ETS, 2);          /* FEAT_ETS2 */
> -
> -    t =3D GET_IDREG(isar, ID_PFR0);
> -    t =3D FIELD_DP32(t, ID_PFR0, CSV2, 2);          /* FEAT_CSV2 */
> -    t =3D FIELD_DP32(t, ID_PFR0, DIT, 1);           /* FEAT_DIT */
> -    t =3D FIELD_DP32(t, ID_PFR0, RAS, 1);           /* FEAT_RAS */
> -    SET_IDREG(isar, ID_PFR0, t);
> -
> -    t =3D GET_IDREG(isar, ID_PFR2);
> -    t =3D FIELD_DP32(t, ID_PFR2, CSV3, 1);          /* FEAT_CSV3 */
> -    t =3D FIELD_DP32(t, ID_PFR2, SSBS, 1);          /* FEAT_SSBS */
> -    SET_IDREG(isar, ID_PFR2, t);
> -
> -    t =3D GET_IDREG(isar, ID_DFR0);
> -    t =3D FIELD_DP32(t, ID_DFR0, COPDBG, 10);       /* FEAT_Debugv8p8 */
> -    t =3D FIELD_DP32(t, ID_DFR0, COPSDBG, 10);      /* FEAT_Debugv8p8 */
> -    t =3D FIELD_DP32(t, ID_DFR0, PERFMON, 6);       /* FEAT_PMUv3p5 */
> -    SET_IDREG(isar, ID_DFR0, t);
> -
> -    /* Debug ID registers. */
> -
> -    /* Bit[15] is RES1, Bit[13] and Bits[11:0] are RES0. */
> -    t =3D 0x00008000;
> -    t =3D FIELD_DP32(t, DBGDIDR, SE_IMP, 1);
> -    t =3D FIELD_DP32(t, DBGDIDR, NSUHD_IMP, 1);
> -    t =3D FIELD_DP32(t, DBGDIDR, VERSION, 10);      /* FEAT_Debugv8p8 */
> -    t =3D FIELD_DP32(t, DBGDIDR, CTX_CMPS, 1);
> -    t =3D FIELD_DP32(t, DBGDIDR, BRPS, 5);
> -    t =3D FIELD_DP32(t, DBGDIDR, WRPS, 3);
> -    cpu->isar.dbgdidr =3D t;
> -
> -    t =3D 0;
> -    t =3D FIELD_DP32(t, DBGDEVID, PCSAMPLE, 3);
> -    t =3D FIELD_DP32(t, DBGDEVID, WPADDRMASK, 1);
> -    t =3D FIELD_DP32(t, DBGDEVID, BPADDRMASK, 15);
> -    t =3D FIELD_DP32(t, DBGDEVID, VECTORCATCH, 0);
> -    t =3D FIELD_DP32(t, DBGDEVID, VIRTEXTNS, 1);
> -    t =3D FIELD_DP32(t, DBGDEVID, DOUBLELOCK, 1);
> -    t =3D FIELD_DP32(t, DBGDEVID, AUXREGS, 0);
> -    t =3D FIELD_DP32(t, DBGDEVID, CIDMASK, 0);
> -    cpu->isar.dbgdevid =3D t;
> -
> -    /* Bits[31:4] are RES0. */
> -    t =3D 0;
> -    t =3D FIELD_DP32(t, DBGDEVID1, PCSROFFSET, 2);
> -    cpu->isar.dbgdevid1 =3D t;
> -
> -    FIELD_DP32_IDREG(isar, ID_DFR1, HPMN0, 1);         /* FEAT_HPMN0 */
> -}
> -
>  /* CPU models. These are not needed for the AArch64 linux-user build. */
>  #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
>
> diff --git a/target/arm/meson.build b/target/arm/meson.build
> index 5376be2e3bc..3e02941d0d5 100644
> --- a/target/arm/meson.build
> +++ b/target/arm/meson.build
> @@ -9,6 +9,7 @@ arm_user_ss =3D ss.source_set()
>  arm_common_system_ss.add(files('gdbstub.c'))
>  arm_user_ss.add(files('gdbstub.c'))
>
> +arm_ss.add(files('cpu-max.c'))
>  arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
>    'cpu64.c',
>  ))
> --
> 2.53.0
>

