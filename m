Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4708CD5BB1
	for <qemu-arm@archiver.kernel.org>; Sat, 23 May 2026 20:58:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQtQh-0001zK-1d; Sat, 23 May 2026 16:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQtQf-0001yc-Ee
 for qemu-arm@nongnu.org; Sat, 23 May 2026 16:58:41 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQtQd-00045e-O4
 for qemu-arm@nongnu.org; Sat, 23 May 2026 16:58:41 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-651c366f7efso8666396d50.1
 for <qemu-arm@nongnu.org>; Sat, 23 May 2026 13:58:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779569918; cv=none;
 d=google.com; s=arc-20240605;
 b=LhQU9uyu3oKh753yZuRRdhWnK48e7d1bXJfd0LuFcpGo5i9nh4cX42MdvNDlKsf8Aj
 1iq5o0x4TtFWEBkYTvy7XUqsTJFwRGuuyx+UKA+bCyP5gLW9ERbJytcKEfH66YWLpq/X
 s2FThI3rrlPbfT0RHbRkTt62VcUdakfegoHZgBpmKkTu6i1xnsN4qQNQQ0GVuM3n6f2L
 hpqdPDP8R5nXqrT4eZwawEvigrZfm4IFeQpTEIuJFeXo8YyCsl/h0QPcmeVnrBNN2gEc
 ao6LB/hxJ4XwbOE/9khkdEs97vl+uEef7qMSHXqk1P5WP/B8zZDZcuuVi1TjN71Qa63E
 j9rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=al+Hae3VUxEZ7Src1Wlod7I1X4P4CfSYv4d4oT/42jM=;
 fh=V7xKNTiTWG9O0R4mxise7T7l0pv9eNt2qQiNY6hORuE=;
 b=GwpwGHCIvXkBsieK0tJVU7VzASFWhk+BJouMpTGlLDu7WiY9PjqfP4IOj3U5+zoemP
 Y/JYT6iz3IiDinkt/Hj+UauZyi9Ms6NcekpNSRLdSwz6pApwJQ1ZeJn0PvjWLdImCqZe
 eEcl8PzatwZCQGuFqxGum/rSMef1iYBm1cQ+7a/O3VRjRzT/XphV2Oo97SfoWnvxKm+A
 Jjfk5Wu8anT/iiQn4UbwfWDf0SSXZUwkF8famtsJ+usxB9jFuweP2t+oOQgow/MkgxX0
 kkIt1TeXSZU7lOcZN949b9IezYYwGBCLfkOdcltDLz0kM8Zm+zUM2MQpyd45jPi4G/ug
 H5iw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779569918; x=1780174718; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=al+Hae3VUxEZ7Src1Wlod7I1X4P4CfSYv4d4oT/42jM=;
 b=mehulGvmUvXn/RUNXBevCOEbL9S1r8Kgq5b6NVarJqk5IXlEbBM4RZYWlQ2HZA1i1y
 Soq5v8Xg0qSanvidHmnBA3YR0h8JXOQy/ZWejhiIGQLBuDJzLf22ADmKmmnW0r4ya2pw
 QBFt7bL5x4dJl5Oi5UPTnIK3RnXaHoUHBuGepi77Bj7lctmjH93HOsRH4H0GeexS8IVs
 YmT9XAWo+8X9ixD/ObPBoXZUwshgHFm34X8L606k+z+sLm3wQ7v50k0xGHf21NxVtlgH
 ecHvPWyPCf180VFEoKo7xnXsNrqmVCIX1zsGYb0CFqw0jvZEm0rdRnu7Nq9mIhpgZ+RT
 xDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779569918; x=1780174718;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=al+Hae3VUxEZ7Src1Wlod7I1X4P4CfSYv4d4oT/42jM=;
 b=O8piRwBMcmBP5NI//WMuhQIh+CVvawvP6mQDaF2UX/8ptNOQGqbl/zykxuBmkc+/MA
 rWmmeDhz/xmnfAmL1hyUiAg/Nty5TKegwiIVtQNAj3NqU5LA81q1q+MivHCxlxdTVzw5
 oiJ3hfZR/01Wdob3pZlyzERqQWX55r+vq3dKVpAFKKTmQfQPxTRtHiDnIA8tjQrPb88l
 GCpzyyxhdQmXUWjTF//usBFqrTnD3g2TpC0Xqkt0mudFMfCpceukFtsZv/il7ZuhhjME
 yWP+wAbJAe1T1LhuUyi4l2JDxYjAXn/AGko4m8ICTZByBvkKAhBjYEtDbG3C40E35HnR
 bmJw==
X-Gm-Message-State: AOJu0Yz4HiNAIWzNjBufYodtuLUjTjeGgln1EbVw7ITa/Gjug/N8vpV8
 Ztmv+qvrXUOzko29W4Coe7YrXlHs2hPTYRR/e61VwMBLinsaqJaqXk4zdcCdR4Bw47L42jgcTdt
 irH9wnZYQ6w4bE87tJCSNkV7qB6i02v8MRSTH7llHtA==
X-Gm-Gg: Acq92OHG6BKZE0eo4aYznMXBnUZNHywRo7rP2/X8T0BmDx/ysATtDh7HRt4mIeZfkvg
 U3nnWqfVteR48C4AHPje0JTYs0sbP1+hh4oz7//Ta1E0jAESS4P7LwQ1Sjgov8jalPHL2iW1Y+u
 F0z6xk61WRufanlbcd/F4FkA17wfA2Mb7Co+e8GiIe313FpcpLJXQM+81jtcG5f5A5rUVRNx1rC
 TJ9P07PX2sMfHgzmy25iDzZoTz4KzmxV/71OLU9B7fqMOvtcPmVG6Hi18//pd8lXbr0VEC6734x
 M+ZnC8bDMNL4T1rTd9BhN2aN1BlHap7CK55TBEk2XN5NKgCx2VNFnkkNIEdiDak7vhg=
X-Received: by 2002:a53:c047:0:20b0:653:60c:a4a8 with SMTP id
 956f58d0204a3-65ec9616d7cmr6971355d50.12.1779569917619; Sat, 23 May 2026
 13:58:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260521180854.1744788-1-peter.maydell@linaro.org>
 <53e498ea-1110-42f5-aef1-b1233677954b@linaro.org>
In-Reply-To: <53e498ea-1110-42f5-aef1-b1233677954b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 23 May 2026 21:58:26 +0100
X-Gm-Features: AVHnY4LSyO5Famn_k4UVxwXZw5UwduYfP0q5sd2HDalJx9o6gCBEUWsxETO0DxM
Message-ID: <CAFEAcA_vRANGSaL0ve06+Xm-s6afXpWUwqTvJyyC+PXXjPi5Mg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: SME BFCVT,
 BFCVTN have "Alternate BFloat16 behaviors"
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
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

On Fri, 22 May 2026 at 22:57, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/21/26 11:08, Peter Maydell wrote:
> > The Arm ARM A1.5.10 notes that some instructions have "Alternate
> > Bfloat16 behaviors" when FPCR.AH == 1.  We implement these using the
> > FPST_AH and FPST_AH_F16 fp_status words.  The list includes the SME
> > BFVCT (single-precision to BFloat16) and BFCVTN, but we forgot to
> > make those use FPST_AH_F16 when we implemented them. (We get the
> > ASIMD and SVE insns on the list right.)
> >
> > Add the missing logic to select the right FPST.
> >
> > Cc: qemu-stable@nongnu.org
> > Fixes: 465d36db0e1 ("target/arm: Implement SME2 BFCVT, BFCVTN, FCVT, FCVTN")
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > (There will be a minor conflict with the rename of BFCVT to
> > BFCVT_hs in RTH's FP8 series.)
> > ---
> >   target/arm/tcg/translate-sme.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
> > index 08254b088e..8e56dedaa3 100644
> > --- a/target/arm/tcg/translate-sme.c
> > +++ b/target/arm/tcg/translate-sme.c
> > @@ -1419,9 +1419,9 @@ static bool do_zz_fpst(DisasContext *s, arg_zz_n *a, int data,
> >   }
> >
> >   TRANS_FEAT(BFCVT, aa64_sme2, do_zz_fpst, a, 0,
> > -           FPST_A64, gen_helper_sme2_bfcvt)
> > +           s->fpcr_ah ? FPST_AH : FPST_A64, gen_helper_sme2_bfcvt)
> >   TRANS_FEAT(BFCVTN, aa64_sme2, do_zz_fpst, a, 0,
> > -           FPST_A64, gen_helper_sme2_bfcvtn)
> > +           s->fpcr_ah ? FPST_AH : FPST_A64, gen_helper_sme2_bfcvtn)
> >   TRANS_FEAT(FCVT_n, aa64_sme2, do_zz_fpst, a, 0,
> >              FPST_A64, gen_helper_sme2_fcvt_n)
> >   TRANS_FEAT(FCVTN, aa64_sme2, do_zz_fpst, a, 0,
>
> What is the difference between FPST_AH and FPST_A64 when AH is set, given that
> vfp_set_fpcr_to_host does the arm_set_*_fp_behaviours dance?

(1) FPST_AH always has flush_to_zero and flush_input_to_zero set,
whereas FPST_A64 sets and clears those based on FPCR.FZ and FPCR.FIZ
(2) FPST_A64 adjusts the rounding mode when the FPCR rounding mode
field changes, and FPST_AH does not
(3) vfp_get_fpsr_from_host() looks at FPST_A64 but ignores FPST_AH

These combined get us the A1.5.10 required behaviour:

- Produce the expected IEEE 754 default result but do not update the
 FPSR cumulative exception flag bits.
- Disable trapped floating-point exceptions, as if
 FPCR.{IDE, IXE, UFE, OFE, DZE, IOE} are all 0.
- Use Round to Nearest Even, ignoring FPCR.RMode.
- Flush denormalized inputs and outputs to zero, as if FPCR.{FZ, FIZ} is {1, 1}.

(since we don't implement trapped fp exceptions).

We use FPST_AH for the A1.5.10 insns, and also for FRECPE, FRECPS,
FRECPX, FRSQRTE, and FRSQRTS, which also want these effects.
(This information is slightly less helpfully located, being
scattered across A1.5.6.1, A1.5.6.2, A1.5.8, A1.5.9.1.)

There might be a clearer name than FPST_AH, but I couldn't
think of one at the time. We do at least document all this
in the comment in cpu.h.

thanks
-- PMM

