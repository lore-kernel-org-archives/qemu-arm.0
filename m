Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4366CD5BAC
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 15:45:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ5aJ-000120-UR; Thu, 21 May 2026 11:45:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ5aI-00011h-7C
 for qemu-arm@nongnu.org; Thu, 21 May 2026 11:45:18 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ5aG-000618-HL
 for qemu-arm@nongnu.org; Thu, 21 May 2026 11:45:17 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-65c21049dafso5651471d50.2
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 08:45:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779378315; cv=none;
 d=google.com; s=arc-20240605;
 b=JtQ0c5UYhAuMVMaih8GAMrCJ3VjBNopkX4aAGHybPFZHPt+pewcnOmillshmD1a4y5
 MeJgo/Esu2u/kZgIOi9CxAYjGKiLwIYZH4Nq1XyTKBdBR7AFo8f+UDyct9Mq3XWyZ/gL
 2z4nAulDB+tEoCpuXPwE++s0x2bZLTQmS00ZM4juAP01tI9wA1mD5s0vmSkiJYDxKjY5
 MGi0NSIW9eqL1ia3mMl6FjFFKltluHXBpHvdsTRJZh/7Vlk0at74sYfLGM3ejhcn6quW
 vHOKOxPXmUL1+ZyG/fDLSwR1OYwoNUYZqtC1W3GOjUxFv5AbykdtH8/34aL8xnhnAftg
 eDJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=np6MfwVNRi1F2S5o/BMQc+ARaZat+BgxJcILbYuMVgU=;
 fh=dDKmaGDS8BqKfD0ZMYCIZmfuV+1AhBiz3bPYVYP26PU=;
 b=MpjUMfbujMaYtOlGg+cLjbxKheai/+A2m+U4tPpAdP3JhoAvE4DtmdmX7fkMx6Wac/
 Kt1lkLuwhyqK6ilPXZQLF4zdauib0apO6EEISBaYEBt/wYmfHQbvqytMfFeNMkDmAg3i
 wAwHcsWG9O5BMMqAdwlwyOC97xaYznRx3LBOW9YDI2mo8nKQL9sTcJkZ393dru8P/qa4
 ol7HIILShZESA/hLE6vgUkHBoebx7sPlUn3X59yA0fE1INJotkw+wLriNai/b/MTmF8r
 6UOK0Zamd63Euz+uhoh44xcwKvRMOklcZtekY0Wni30ezxug54liF19wQsiWuKqCHJRg
 gDcw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779378315; x=1779983115; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=np6MfwVNRi1F2S5o/BMQc+ARaZat+BgxJcILbYuMVgU=;
 b=H+8mgGk8E0R22+ZyPihdzPSI4e2hRrXRjI/x4JGoRwgnYYR55Z10RFNorsntDJFFHP
 /7Tyr2LRNAHxdPTyxupfBnNxfDns8hFomMT4Jsie/sorMd5yo7BmcEdH/biBJ26eyQ+z
 NT1Y0cvbD/RWWsqLE/jGjiJ0QS0F8T1s6p4Jx3UiwPnibDM73yhdKo7Ifr5J1FSjMKgn
 v95zjuYTtwZlwyj6TvskgjvQTp9KOFlk06yMAyvR98wySeWsazKkG5gyLgc3/kluetOB
 xA/xWLNMtWi0ZSIOOgWl/6yBx1YkJTpZi0ZGWc3A18hhdlvFRUA9T3Qv/OVhhk6hmTxF
 l8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779378315; x=1779983115;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=np6MfwVNRi1F2S5o/BMQc+ARaZat+BgxJcILbYuMVgU=;
 b=VngoPpttG5FH7ZvB3oNN/lfAMt0vIRvoJbWmzgGfWpy8sb7Md+A3N4ykwlQHbXnQ8d
 iEc2aAPiDBin29aGB5p51kOxlpnuknKcNUUGCDUc2UEp07moI5ELklg/+T8k4xsDPxOH
 SyrgSK12gkK/WC4v36XCEKBw2jSWT6xVsB1OPJ/JYACihqvqL8LE2hun2wZddp2+5zL2
 e5j86sp2RAxZvwLixUae/GUb4AlkPb2dctXaWhzSUBhbgrObo40Du6cMWfrtc0kWaixO
 TswMCbDw0P96JozqOO1hE9Llu7FDlQds2pck1/2eyAaHyBSQDZrJ3SvwzDWcTArvSwHt
 /6Gw==
X-Forwarded-Encrypted: i=1;
 AFNElJ95vF9dF9n45MjTAUuhKIgowjQC5E0VXmElhK6nOAXqJICibdFt8dWUzhmWoroZIo+4ALupFKQwzA==@nongnu.org
X-Gm-Message-State: AOJu0Yz8xSp/yQq5THwliGt0mfA61Ioep/UjJkmH2uKc1V+hJVA2Sq1j
 vRE7QNp0TkNOw+whscLMmAzMi6y8aaA5Dg2S0usrfvBrlMrB42gkPcv8xoOOCslJVvPHhJXwF8W
 xmQmD3eNA6Oq1pPl+ajQz0ZyAV+/Mt8A42j+EwEmekA==
X-Gm-Gg: Acq92OF9h/nH0MYrMgehUhcYwM1Y2rSHooyj7XOzN1Tcdf7HZjhCZuLJqJrHpQuRCW6
 gWmfOABuXcmVqylZVsGhVcJe3+8GPWj2kGlt7KRtR9xnq7vcrXzNlFVoZxU73f2aACJCFmPQFrp
 eYNHNcfGFwoCLtueGFsm4Ns6mIueVjZAwiokmAQy/UYlf2np/5XZckNflHrI3LhM7a9RnGSxfSj
 VXshCAL8K+hlbLOUnAZi7vvuVQUACj2gkGwO7D87qTbif/SRUbv55abF2USAoKvXXMGZ+WG5rOj
 cTRhlyY5FFbjkpvWeBeUh0yUEXSJwS8wZe8op/3xW+6a1iPP+nbeAROCBNNcLHH/w3I=
X-Received: by 2002:a53:d048:0:20b0:650:1aa5:8594 with SMTP id
 956f58d0204a3-65eae1525bfmr2400890d50.49.1779378314809; Thu, 21 May 2026
 08:45:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260520182213.872945-1-richard.henderson@linaro.org>
 <20260520182213.872945-2-richard.henderson@linaro.org>
 <874ik0okia.fsf@draig.linaro.org>
In-Reply-To: <874ik0okia.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2026 16:45:03 +0100
X-Gm-Features: AVHnY4LhWPxynQ0F9w0MW-e15CvJd7aKM3WKX2KWR9l4HgVjox8ZxDcd3ZSqVT0
Message-ID: <CAFEAcA_tJm2FmpYsMM0ThooPk82PORNNavPzUt-1DgUS=KC=ow@mail.gmail.com>
Subject: Re: [PATCH v6 01/64] target/arm: Implement ID_AA64ISAR3
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
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

On Thu, 21 May 2026 at 16:33, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Richard Henderson <richard.henderson@linaro.org> writes:
>
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >  target/arm/cpu-features.h    | 9 +++++++++
> >  target/arm/helper.c          | 8 ++++++--
> >  target/arm/cpu-sysregs.h.inc | 1 +
> >  3 files changed, 16 insertions(+), 2 deletions(-)
> >
> > diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
> > index 4e44245a8b..50776347a5 100644
> > --- a/target/arm/cpu-features.h
> > +++ b/target/arm/cpu-features.h
> > @@ -244,6 +244,15 @@ FIELD(ID_AA64ISAR2, CSSC, 52, 4)
> >  FIELD(ID_AA64ISAR2, LUT, 56, 4)
> >  FIELD(ID_AA64ISAR2, ATS1A, 60, 4)
> >
> > +FIELD(ID_AA64ISAR3, CPA, 0, 4)
> > +FIELD(ID_AA64ISAR3, FAMINMAX, 4, 4)
> > +FIELD(ID_AA64ISAR3, TLBIW, 8, 4)
> > +FIELD(ID_AA64ISAR3, PACM, 12, 4)
> > +FIELD(ID_AA64ISAR3, LSFE, 16, 4)
> > +FIELD(ID_AA64ISAR3, OCCMO, 20, 4)
> > +FIELD(ID_AA64ISAR3, LSUI, 24, 4)
> > +FIELD(ID_AA64ISAR3, FPRCVT, 28, 4)
> > +
> >  FIELD(ID_AA64PFR0, EL0, 0, 4)
> >  FIELD(ID_AA64PFR0, EL1, 4, 4)
> >  FIELD(ID_AA64PFR0, EL2, 8, 4)
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index 8240f1b384..6ad01b345f 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -6519,11 +6519,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
> >                .access =3D PL1_R, .type =3D ARM_CP_CONST,
> >                .accessfn =3D access_tid3,
> >                .resetvalue =3D GET_IDREG(isar, ID_AA64ISAR2)},
> > -            { .name =3D "ID_AA64ISAR3_EL1_RESERVED", .state =3D ARM_CP=
_STATE_AA64,
> > +            { .name =3D "ID_AA64ISAR3_EL1", .state =3D ARM_CP_STATE_AA=
64,
> >                .opc0 =3D 3, .opc1 =3D 0, .crn =3D 0, .crm =3D 6, .opc2 =
=3D 3,
> >                .access =3D PL1_R, .type =3D ARM_CP_CONST,
> >                .accessfn =3D access_tid3,
> > -              .resetvalue =3D 0 },
> > +              .resetvalue =3D GET_IDREG(isar, ID_AA64ISAR3) },
> >              { .name =3D "ID_AA64ISAR4_EL1_RESERVED", .state =3D ARM_CP=
_STATE_AA64,
> >                .opc0 =3D 3, .opc1 =3D 0, .crn =3D 0, .crm =3D 6, .opc2 =
=3D 4,
> >                .access =3D PL1_R, .type =3D ARM_CP_CONST,
> > @@ -6752,6 +6752,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
> >                                 R_ID_AA64ISAR2_BC_MASK |
> >                                 R_ID_AA64ISAR2_RPRFM_MASK |
> >                                 R_ID_AA64ISAR2_CSSC_MASK },
> > +            { .name =3D "ID_AA64ISAR3_EL1",
> > +              .exported_bits =3D R_ID_AA64ISAR3_FAMINMAX_MASK |
> > +                               R_ID_AA64ISAR3_LSFE_MASK |
> > +                               R_ID_AA64ISAR3_FPRCVT_MASK },
>
> With this definition should we also add it to arm_clear_aarch64_idregs()
> which clears the other ISARs with aarch64=3Doff?

Yes. I wonder if there's some way to get the new cpu-sysregs.h.inc
machinery to automatically produce code to zero any
ARMISARegisters::idregs[] element whose index is for
a register whose encoding is an AA64 idreg (which I think
means "CRm >=3D 4")...

-- PMM

