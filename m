Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1392158lfc;
        Tue, 3 Dec 2019 03:49:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqwGhzY676X/uFspyXM4meXgFZomsBNQkl0zpzOZr5gRU95Kk0beOPqcsVIPueJ95lz0D9c0
X-Received: by 2002:a05:620a:1486:: with SMTP id w6mr738674qkj.454.1575373760647;
        Tue, 03 Dec 2019 03:49:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575373760; cv=none;
        d=google.com; s=arc-20160816;
        b=ZP9ROfwQcTH6VHJCb2jVMhdI2M5+b01mtDToFJqNePTOFtkRHEre88CUFENt2CYL+U
         CzTKR2naee0yZjCpJYAHlsJY7cpgq+MHFZGHIXfmtQM9l/qljvnzhq/ugvj5yNpW7eCB
         uAD8hj33eH8QpcPjJaDmDUX6+MJA/+s9/m9ymxbK1U7GUxa+mvaaz5WmQcEiq+EUChxI
         svDGkPqUhTRHjt9JzhDb4H+suvERLG/o2NJ9etrC0vc+2MD21VzpWrleU8KxubxGzJQT
         UAikGyjRNbr4WPAdgOtiPTRjFl5n/GmRgc22ucxAbJ4s15eAOALNtpQZHc+FB5i5dvnG
         Vu3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J9a9Q25g3Pw3d8B2XWQ6fSo3JvscZVrNGGE/LmkOG4U=;
        b=fIGBBajU9iy3VnCiiV4m0olmpK5NsVDLh5wPQG/jX5JglBbvrqayeCbzTpw2fgJ1gj
         dmM9vZEGXGYSrPzIPA5ZHqjsF6M4KmjhOEjSxyYCuJ07cfJHGYG/rK+Mz9abKaF1DuTk
         pry34rkx21wzJuC5aBdXS6K2VNAg+N0vU041O7DmzOTskfV5HBN7zh3KsIA2Si7I4psx
         N05/T0C9+G+bOaumjHL+E+1x4/v3r4hXTZYHlyCXJBVdBquqDh54BdSTQVHvs0u8S3GP
         XvTd8T8L9lMWCf0Hlqb+OHgCc9v0IsLiRC/elrKidv2PCEinqZXSVP+lyN8RVjFMekoo
         sTJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e78gdWVp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u13si1917042qkk.225.2019.12.03.03.49.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2019 03:49:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e78gdWVp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ic6gC-00063Z-0u
	for alex.bennee@linaro.org; Tue, 03 Dec 2019 06:49:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53270)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ic6fy-0005zj-TB
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 06:49:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ic6fw-0000UE-An
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 06:49:06 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:43690)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ic6fv-0000QT-T6
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 06:49:04 -0500
Received: by mail-oi1-x242.google.com with SMTP id t25so713816oij.10
 for <qemu-arm@nongnu.org>; Tue, 03 Dec 2019 03:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J9a9Q25g3Pw3d8B2XWQ6fSo3JvscZVrNGGE/LmkOG4U=;
 b=e78gdWVplLjIhNu/AMecMmugJ37cfElNi4nZQ+auDgqzXWKfTKcP1e/vdTAzmge50y
 P2EW9SgCi43AXrcRvIuM+L45DLOzK83HOKlaCSNRmUoGn00+5S8kPjUBzIWC8Jm02mKt
 Wl7ejaJTVqkQvK3JK/ZEaXXCugrO77bUSRyveZxKPzgodz+3ypCD9uY/QD5qyGgQaUu1
 NOmW7u9R4AB/GWPdZvPsz8/pGK4o0ccofLbG1K7CQBq0RZhxKFqhrAVPph5IufrqTyCo
 nIPfvmX3M33lM0G/85H3q2Wdi31Vm1LyXoG94w6qwkP/BHWHJ2RKTnwUbmSSBejchftA
 +SFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J9a9Q25g3Pw3d8B2XWQ6fSo3JvscZVrNGGE/LmkOG4U=;
 b=WsEuVXLctLHAWYDpvK83bALwZzITD8VV2NJw2/+ur2Qb+rpHyJLucEJe7rLR6v2cr7
 v54eVRMhqi5AY38GHAxWJwwfZZ2xyQ/Slz/AS+Zgtfx+Q9n5tpXPozhnNzFRZhNf0hbk
 JdeYrSY8UjJApKsrztvATeHbiSPCb1ezmv5hpomZ72dOzE0MGrbORC270g1Tdzy1/vYv
 +z3kn4H5jUkoSE5UX1MKG11Y7hs56BFANKWn718ViE7sQLu1aAJTrpS4coguw8Uljoii
 0EvH+PwodMtZwMnXCifuvW4IZuw0z5EYXVEElXWksnV4/r+RaWLT6FEcUG4BjCSpNv6l
 Z2gA==
X-Gm-Message-State: APjAAAWuMuiz2pEiFJiCkg3qI25hfgZPOhtnFtXwi4TxKyLqRCOiidqz
 4fxJn6fi7yaGGCk90jcCXWPltOzomqykGx8Z1r6zbQ==
X-Received: by 2002:aca:3182:: with SMTP id x124mr3275663oix.170.1575373742707; 
 Tue, 03 Dec 2019 03:49:02 -0800 (PST)
MIME-Version: 1.0
References: <20191011134744.2477-1-richard.henderson@linaro.org>
 <20191011134744.2477-4-richard.henderson@linaro.org>
In-Reply-To: <20191011134744.2477-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Dec 2019 11:48:51 +0000
Message-ID: <CAFEAcA8_SQ6ugs360PJD58547mmZY1yu5xb=Fq0P006HJ1yGRA@mail.gmail.com>
Subject: Re: [PATCH v5 03/22] target/arm: Add MTE system registers
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EE+VeuURQbB+

On Fri, 11 Oct 2019 at 14:48, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is TFSRE0_EL1, TFSR_EL1, TFSR_EL2, TFSR_EL3,
> RGSR_EL1, GCR_EL1, GMID_EL1, and PSTATE.TCO.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v3: Add GMID; add access_mte.
> v4: Define only TCO at mte_insn_reg.
> ---
>  target/arm/cpu.h           |  3 ++
>  target/arm/internals.h     |  6 ++++
>  target/arm/helper.c        | 73 ++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-a64.c | 11 ++++++
>  4 files changed, 93 insertions(+)


> +    { .name = "GMID_EL1", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 1, .crn = 0, .crm = 0, .opc2 = 4,
> +      .access = PL1_R, .type = ARM_CP_CONST, .resetvalue = GMID_EL1_BS },

This should trap if HCR_EL2.TID5 is 1 (since we're adding
support for the TID* ID reg trap bits now).

> +    REGINFO_SENTINEL
> +};
> +
> +static const ARMCPRegInfo mte_tco_reginfo[] = {
> +    { .name = "TCO", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 3, .crn = 4, .crm = 2, .opc2 = 7,
> +      .type = ARM_CP_NO_RAW,
> +      .access = PL0_RW, .readfn = tco_read, .writefn = tco_write },
> +    REGINFO_SENTINEL
> +};
>  #endif
>
>  static CPAccessResult access_predinv(CPUARMState *env, const ARMCPRegInfo *ri,
> @@ -6881,6 +6948,12 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>      if (cpu_isar_feature(aa64_rndr, cpu)) {
>          define_arm_cp_regs(cpu, rndr_reginfo);
>      }

So, aa64_mte_insn_reg here is checking for ID_AA64PFR1_EL1 != 0
("instructions accessible at EL0 are implemented")
and aa64_mte is checking for >= 2 ("full implementation").
I think a couple of brief comments would clarify:

> +    if (cpu_isar_feature(aa64_mte_insn_reg, cpu)) {
           /* EL0-visible MTE registers, present even for dummy
implementation */
> +        define_arm_cp_regs(cpu, mte_tco_reginfo);
> +    }
> +    if (cpu_isar_feature(aa64_mte, cpu)) {
           /* MTE registers present for a full implementation */
> +        define_arm_cp_regs(cpu, mte_reginfo);
> +    }

(The other way to arrange this would be to have the 'real'
TCO regdef in mte_reginfo, and separately have "reginfo
if we only have the dummy visible-from-EL0-parts-only
which defines a constant 0 TCO" (and also make the MSR_i
code implement a RAZ/WI for this case, for consistency).
An implementation that allows the guest to toggle the PSTATE.TCO
bit to no visible effect is architecturally valid, though.)

>  #endif
>
>      /*
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index c85db69db4..62bdf50796 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -1611,6 +1611,17 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
>          s->base.is_jmp = DISAS_UPDATE;
>          break;
>
> +    case 0x1c: /* TCO */
> +        if (!dc_isar_feature(aa64_mte_insn_reg, s)) {
> +            goto do_unallocated;
> +        }
> +        if (crm & 1) {
> +            set_pstate_bits(PSTATE_TCO);
> +        } else {
> +            clear_pstate_bits(PSTATE_TCO);
> +        }
> +        break;
> +
>      default:
>      do_unallocated:
>          unallocated_encoding(s);
> --
> 2.17.1

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>


thanks
-- PMM
