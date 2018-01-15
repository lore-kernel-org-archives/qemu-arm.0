Received: by 10.28.173.206 with SMTP id w197csp3048693wme;
        Mon, 15 Jan 2018 10:47:13 -0800 (PST)
X-Google-Smtp-Source: ACJfBosqb0WORdVZD7EItS9wmmUowoT+nr9Q4/EObKAqJA71LmZ52r6dOGLRAuX63/9UpytkGAMs
X-Received: by 10.37.189.79 with SMTP id p15mr17874433ybm.513.1516042033077;
        Mon, 15 Jan 2018 10:47:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516042033; cv=none;
        d=google.com; s=arc-20160816;
        b=snnU1DK9+9UQWx1SunwdBOSZDs/kAog7S0LRfhlgDD/+eJssUOgpB2Q8gdluc0S3iY
         pRiXjb42W5NjJwEynRulyaGNps3dzH+ydRo8ZpFgfAWbm1v1SrC7LqSF9XsAMi6jPwMC
         N3w4aSahtw6vLO9pITwaaaOmCd/f/fXbcABt2r3yZwI4NojIFOsYKNZWKBTh2rKZ3++b
         1EiVrXusEhG+TOGr45NPmGjoVu53+ro9UDn/kZ1AA4B5QTdsgvOVnqSuFXC2XGlNyDvr
         NfImyAKUwCiuRtyMfEXfwwQpkpnIi//TCnJrs+8O0nD6Vp3UYWJmFm2cO5DgT17v4i8v
         Wo+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=nx6zEUKVo6NvHIyfsvrUdiFsxhJh2SBX8L+kBS8cIv4=;
        b=Gp9uxF37agnHzl/IXYzSzsXprIHYhd7G+MUnH2BLTe6j9U6ohyPw3qjquEY8GaF5YC
         G9rE8GjeA1LdD2Fcrgjp0Ok+x1MzyvVCF3DxALBHtHFZtNhhV4EdI4elvigZ0NkLBPm4
         K1O7uhj/mMpsVT6elI7aoSuIgG+6NVEvzAUWjMbIvw/7XntPBaekKBX+nKqJ7aDZUl94
         65mNQo/fK4l0F1y4flbCAvgDn1hlNj+J687seEs1E4P7hwauu0FyA/07xiUedlrHv4G5
         rEDZDxHLJpsX7zsXJVMVt3N5KSrnk54VzJERcAJIHHCZ1P5tyLF66BkqucLb5NkuGPX1
         Nghw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OZT92z5t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b7si59640ywc.103.2018.01.15.10.47.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 10:47:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OZT92z5t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54578 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eb9mq-0001oJ-HS
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 13:47:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37923)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eb9mg-0001o5-94
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 13:47:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eb9mf-0006kY-8L
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 13:47:02 -0500
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:32862)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eb9mf-0006k3-4L
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 13:47:01 -0500
Received: by mail-oi0-x244.google.com with SMTP id y141so8946079oia.0
	for <qemu-arm@nongnu.org>; Mon, 15 Jan 2018 10:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nx6zEUKVo6NvHIyfsvrUdiFsxhJh2SBX8L+kBS8cIv4=;
	b=OZT92z5tfsiDGnYi165oStUcvCzBSkEYMxiy/a+RdnjndYeZY4e1vk7qX9GsHp5FJF
	W7t8Z1CeK7om3i1z2ZcaI8XkgSPPJZH+QyqfsDUrHOxMycyzcHjnSwDzvVnpIz52DUQR
	Ouwyr9WaZ08k/x9T0bChiwfqGJHzVSubzXW4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nx6zEUKVo6NvHIyfsvrUdiFsxhJh2SBX8L+kBS8cIv4=;
	b=Ne9dWf4nl/Ou4SJt6b4EHx7oD1kQhBTOu6jPnKk17MEJz/zMhW7OVnWipmXoQ23opo
	zMTBTzhsKRkgb8sHemyudWkqxbEoJyxzMX4G4TfUayTOCNmwn5t7iXrGmX+nir0A1hKr
	Q5zpH5n19fNzJ8Vl79peolBgWVndENCvlAhmoAOOdEv2WtLsO4EXtJUcxkbtavW1tu8q
	sRfuETkbGNmU0dfztRvV+/ySRxPwbwDM4OBseOwDmQse6GxKeuzocSmWZ/Pfk8NJN2cH
	kSZVHTN7lqvIx1+J6/K97MJH/+YPylxIYLG79mDtG33BkaglRCwa2F+osd3EDTbnoQIZ
	KcFw==
X-Gm-Message-State: AKwxytfiJ4VxSqPsxHmwRLGXahwmS0EWs/FyJgJu0RxfEvqtHvfbn9VH
	XWq5sx1azaPn0BQE/399N0vD8fEOyCPofDFZu9ksjw==
X-Received: by 10.202.244.131 with SMTP id s125mr12128035oih.327.1516042019897;
	Mon, 15 Jan 2018 10:46:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Mon, 15 Jan 2018 10:46:39 -0800 (PST)
In-Reply-To: <20171218172425.18200-11-richard.henderson@linaro.org>
References: <20171218172425.18200-1-richard.henderson@linaro.org>
	<20171218172425.18200-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jan 2018 18:46:39 +0000
Message-ID: <CAFEAcA_bU-LWqtXL=2y_ztF4fCmr6WY0ruxFucXvUruQdKKtyA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH v2 10/11] target/arm: Decode aa32 armv8.3
 3-same
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wcJlhad6gb8N

On 18 December 2017 at 17:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 1a0b0eaced..e57844c019 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -7662,6 +7662,65 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
>      return 0;
>  }
>
> +/* ARMv8.3 reclaims a portion of the LDC2/STC2 coprocessor 8 space.  */
> +
> +static int disas_neon_insn_cp8_3same(DisasContext *s, uint32_t insn)
> +{
> +    void (*fn_gvec_ptr)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
> +    int rd, rn, rm, rot, size, opr_sz;
> +    TCGv_ptr fpst;
> +    bool q;
> +
> +    /* FIXME: this access check should not take precedence over UNDEF
> +     * for invalid encodings; we will generate incorrect syndrome information
> +     * for attempts to execute invalid vfp/neon encodings with FP disabled.
> +     */
> +    if (s->fp_excp_el) {
> +        gen_exception_insn(s, 4, EXCP_UDEF,
> +                           syn_fp_access_trap(1, 0xe, false), s->fp_excp_el);
> +        return 0;
> +    }
> +    if (!s->vfp_enabled) {
> +        return 1;
> +    }
> +    if (!arm_dc_feature(s, ARM_FEATURE_V8_FCMA)) {
> +        return 1;
> +    }
> +
> +    q = extract32(insn, 6, 1);
> +    size = extract32(insn, 20, 1);
> +    VFP_DREG_D(rd, insn);
> +    VFP_DREG_N(rn, insn);
> +    VFP_DREG_M(rm, insn);
> +    if ((rd | rn | rm) & q) {
> +        return 1;
> +    }
> +
> +    if (extract32(insn, 21, 1)) {
> +        /* VCMLA */
> +        rot = extract32(insn, 23, 2);
> +        fn_gvec_ptr = size ? gen_helper_gvec_fcmlas : gen_helper_gvec_fcmlah;
> +    } else if (extract32(insn, 23, 1)) {
> +        /* VCADD */
> +        rot = extract32(insn, 24, 1);
> +        fn_gvec_ptr = size ? gen_helper_gvec_fcadds : gen_helper_gvec_fcaddh;
> +    } else {
> +        /* Assuming the register fields remain, only bit 24 remains undecoded:
> +         * 1111_110x_0d0s_nnnn_dddd_1000_nqm0_mmmm
> +         */
> +        return 1;
> +    }
> +
> +    opr_sz = (1 + q) * 8;
> +    fpst = get_fpstatus_ptr(1);
> +    tcg_gen_gvec_3_ptr(vfp_reg_offset(1, rd),
> +                       vfp_reg_offset(1, rn),
> +                       vfp_reg_offset(1, rm), fpst,
> +                       opr_sz, opr_sz, rot, fn_gvec_ptr);
> +    tcg_temp_free_ptr(fpst);
> +    return 0;
> +}
> +
>  static int disas_coproc_insn(DisasContext *s, uint32_t insn)
>  {
>      int cpnum, is64, crn, crm, opc1, opc2, isread, rt, rt2;
> @@ -8406,6 +8465,12 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>                      }
>                  }
>              }
> +        } else if ((insn & 0x0e000f10) == 0x0c000800) {

I think we should guard this with an ARM_FEATURE_V8 check, so
that for pre-v8 CPUs we fall back to the usual "treat it as a
coprocessor" codepath. (In theory it should work out the same
either way, but specifically limiting this to v8 makes it easier
to be sure that it's not changing the behaviour where it shouldn't.)

> +            /* ARMv8.3 neon ldc2/stc2 coprocessor 8 extension.  */
> +            if (disas_neon_insn_cp8_3same(s, insn)) {
> +                goto illegal_op;
> +            }

This doesn't seem to line up with the Arm ARM decode. Your
pattern and mask give
  op0 = 0x, op1 = 100, op2 = 0 and also bit 8 = 0.
The ARM has 3reg-same decoded with
  op0 = 0x, op1 = 1x0, op2 = x

(and some insns in the 3reg-same group have bit 8 == 1, like
VSDOT and VUDOT.)

> +            return;
>          } else if ((insn & 0x0fe00000) == 0x0c400000) {
>              /* Coprocessor double register transfer.  */
>              ARCH(5TE);

How are you proposing to do the Thumb decoding? Try to share
some of the 3same-vs-2reg+scalar decode part, or just have
them both do a similar kind of decode and call the
disas_neon_insn_cp8_3same/cp8_index functions?

thanks
-- PMM
