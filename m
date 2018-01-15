Received: by 10.28.173.206 with SMTP id w197csp3053039wme;
        Mon, 15 Jan 2018 10:52:28 -0800 (PST)
X-Google-Smtp-Source: ACJfBovKaPx32/uhEi+VkuRoEA86JbTBy4jvzIj921+XLecaPuPmBSO59n1DD3aLlWiGdRHbBRu5
X-Received: by 10.129.47.3 with SMTP id v3mr7284684ywv.490.1516042348445;
        Mon, 15 Jan 2018 10:52:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516042348; cv=none;
        d=google.com; s=arc-20160816;
        b=KVjx80+ZhiyqdPozVBa8QvSkb2aeq6U4U2Lv68LTiJRhahjLn+nI7fgSYs90y1ss78
         G4gcrgqVfbA7FTz9voBDuibThsWEcHhzTsr26NtZNU9RAu4qLZVIW+nbh8xvbXqvuhuc
         8c5dPURjs+1WleTHxJHTwUxvVT2DEKvh2nt7lIlzZV8si0ZNYUIaOdrm+52g/i7MkqGC
         rjwygS1WBmyqV8IC+meZNFCTZITGiZzv3Zm9v7lqSfdVx3kvxZ9xcL2dcrkhCufzE/2O
         p9fr1/adaSB5/4eg2+rtqVWYOTx0R9Ftu4Ye/itk7y9Xp72lHLVyKKO72ygd8YM8D2F7
         /MgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=U06H5r0y6sFz+zI4yOwfChkb1l0Pp9JwjuWZ/1SQlLM=;
        b=CfH+BrPpcbDvRtz6Tb90PiaibQ/DiLGVLH8CktFyFaGjTxSaxjcN6mmMv80Q3TNpf0
         XcwQVbfDAocqvAgacykRf8XTOh32luyPy6Q4bq8oDSuqAg1fY+dLcukd6QewtuRdaefY
         3N8+C6YGDdxHQfccjX8PgbSZUbXWsFhTNiDv3+KS5VFHyTAJ5QkOPPzrxtX47HNwBxjS
         mylwc7krNoU2ktJpnO2DKGYYUXoGwkrKUbQV9/Mj5UCm/owuAjLDJ4g/Fnz8UzQP0zfE
         JRaUJ0A0M0WMThM5z27tlJP90vrYoeksfplwQKt+g16VXGZ84xL+7PuYZ912fEKGPsc/
         lo+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gKaGDsiz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z63si56389ywb.746.2018.01.15.10.52.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 10:52:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gKaGDsiz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54847 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eb9rv-0004yb-Td
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 13:52:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39216)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eb9rE-0004YR-4g
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 13:51:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eb9rD-0000OL-Ao
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 13:51:44 -0500
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:32889)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eb9rD-0000Nq-50
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 13:51:43 -0500
Received: by mail-oi0-x244.google.com with SMTP id y141so8955391oia.0
	for <qemu-arm@nongnu.org>; Mon, 15 Jan 2018 10:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=U06H5r0y6sFz+zI4yOwfChkb1l0Pp9JwjuWZ/1SQlLM=;
	b=gKaGDsizQ3gDWzJGntU8WtQsv6oOdZFOW8iieFarBDCkBjDKy7MWju90BpWUX4vCMf
	bS6utyh2i97X6u46wqlOZzvgIjkFYSfaEGdhm4b2geZYVgXRrXcZvDny9mZGjAj7+ZlD
	LF+7CIxeDOxTE/d8UhzW/tMPUzaZAfH3toOJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=U06H5r0y6sFz+zI4yOwfChkb1l0Pp9JwjuWZ/1SQlLM=;
	b=NAFn4T/JtNYYLo/CGcL+R+4rgGt2olJ4ZRx0RXKworXG0aUzjSEFx8jFX/sJF8VnCA
	JM/+n7l1nuOUIEN777X4MPFQ2KI+JNmCehsepqksDizH3LSdBU9VyTMR62F4xPJmB9fr
	yVOV4TsX9DAIomGiewCxYIufXtCgd2SvWsv0tlKI2tMyb9J4KKO/6gS5gSSzyH7VZqEN
	jx2fzmIqkfHY/650zdE73NI+dXEvMAZIp0cghlQYEinhFcJC92e0HvgwqCoy9KYbFca+
	rgrSQNeCu7gxHPVfVsHig/Uyh/i1fiHdhReAAyD/2CJjHnkbIVx1IaNIYbK2262uOXnE
	2lIg==
X-Gm-Message-State: AKwxytdfBiquworYt4mYwkBkuMKtOscfGtqFBkv4UjdaWh479mH6yQHU
	4sDcDoMJhzXeWoxEi4zfXZrYasje1hwugjf9SArSKg==
X-Received: by 10.202.252.73 with SMTP id a70mr12954894oii.256.1516042302420; 
	Mon, 15 Jan 2018 10:51:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Mon, 15 Jan 2018 10:51:22 -0800 (PST)
In-Reply-To: <20171218172425.18200-12-richard.henderson@linaro.org>
References: <20171218172425.18200-1-richard.henderson@linaro.org>
	<20171218172425.18200-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jan 2018 18:51:22 +0000
Message-ID: <CAFEAcA9ZZYrsjS4q393N4f91-bSia8G-dvB3Di8aSTzDz6Ckdw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH v2 11/11] target/arm: Decode aa32 armv8.3
 2-reg-index
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
X-TUID: a/FrfhPpMSdf

On 18 December 2017 at 17:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 51 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index e57844c019..490e120b0b 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -7721,6 +7721,51 @@ static int disas_neon_insn_cp8_3same(DisasContext *s, uint32_t insn)
>      return 0;
>  }
>
> +/* ARMv8.3 reclaims a portion of the CDP2 coprocessor 8 space.  */
> +
> +static int disas_neon_insn_cp8_index(DisasContext *s, uint32_t insn)
> +{
> +    int rd, rn, rm, rot, size, opr_sz;
> +    TCGv_ptr fpst;
> +    bool q;
> +
> +    /* FIXME: this access check should not take precedence over UNDEF
> +     * for invalid encodings; we will generate incorrect syndrome information
> +     * for attempts to execute invalid vfp/neon encodings with FP disabled.
> +     */

Again, we can push this test down to where it belongs in this new code.

> +    if (s->fp_excp_el) {
> +        gen_exception_insn(s, 4, EXCP_UDEF,
> +                           syn_fp_access_trap(1, 0xe, false), s->fp_excp_el);
> +        return 0;
> +    }
> +    if (!s->vfp_enabled || !arm_dc_feature(s, ARM_FEATURE_V8_FCMA)) {
> +        return 1;
> +    }
> +
> +    q = extract32(insn, 6, 1);
> +    size = extract32(insn, 23, 1);
> +
> +    VFP_DREG_D(rd, insn);
> +    VFP_DREG_N(rn, insn);
> +    VFP_DREG_M(rm, insn);
> +    if ((rd | rn) & q) {
> +        return 1;
> +    }
> +
> +    /* This entire space is VCMLA (indexed).  */
> +    rot = extract32(insn, 20, 2);
> +    opr_sz = (1 + q) * 8;
> +    fpst = get_fpstatus_ptr(1);
> +    tcg_gen_gvec_3_ptr(vfp_reg_offset(1, rd),
> +                       vfp_reg_offset(1, rn),
> +                       vfp_reg_offset(1, rm), fpst,
> +                       opr_sz, opr_sz, rot,
> +                       size ? gen_helper_gvec_fcmlas_idx
> +                       : gen_helper_gvec_fcmlah_idx);
> +    tcg_temp_free_ptr(fpst);
> +    return 0;
> +}
> +
>  static int disas_coproc_insn(DisasContext *s, uint32_t insn)
>  {
>      int cpnum, is64, crn, crm, opc1, opc2, isread, rt, rt2;
> @@ -8471,6 +8516,12 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>                  goto illegal_op;
>              }
>              return;
> +        } else if ((insn & 0x0f000f10) == 0x0e000800) {
> +            /* ARMv8.3 neon cdp2 coprocessor 8 extension.  */
> +            if (disas_neon_insn_cp8_index(s, insn)) {
> +                goto illegal_op;
> +            }
> +            return;
>          } else if ((insn & 0x0fe00000) == 0x0c400000) {
>              /* Coprocessor double register transfer.  */
>              ARCH(5TE);

Similar remarks as for patch 10 about decode, and how we're going
to deal with thumb.

thanks
-- PMM
