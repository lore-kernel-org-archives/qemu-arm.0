Received: by 10.28.173.206 with SMTP id w197csp3051460wme;
        Mon, 15 Jan 2018 10:50:35 -0800 (PST)
X-Google-Smtp-Source: ACJfBotb+F6+w3iwGjqJIgMHtgS345Ouvl3q+5Qpg9dSC8BNwC4c+bxC0+SPGGn3SnJF/iqV0tzY
X-Received: by 10.37.5.150 with SMTP id 144mr28634658ybf.318.1516042235318;
        Mon, 15 Jan 2018 10:50:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516042235; cv=none;
        d=google.com; s=arc-20160816;
        b=MFjrGI5Bw25T4noXbye24NemD1D2xKRPg96z0eda7nVp47cGMnb3Azi26z3hLBhsA8
         pry+9O8o2wf1DNyyABggB0npiJ1HFCWZchZRIOloxLKAjheUEMLwlczLfUlRPXRGXHAK
         TWAx6N8+xsGx3D8eveMAmOpQeFh5EuHgvk/9SPCQHTK+J+dylJ5nB3YYYszzF7BigkZA
         zFgWm6msVqK4045+0rAgs4hD06CHFXRBoSquOvHCPpehmjXQ1D48ZRq31JiuyWgH9p79
         PVru5UEvVS7Bjpx65h6rM2Niza5Dq5PT0q2KEWJlCsRKKyTGjmqtvd4SMrs3xxElUaGT
         u7BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Mo/2JoNF3mqxe4XoiviHDRNEkOKX8E3ti7vpdu4fztQ=;
        b=GC6GpEEyCJOupUiLFF/QtPOX4kLfAARLJs+AWBh0kiP7b9j/SGOGF4ErXetHcxi894
         fo/DFP/VfPGZT0GZDpod/RVbYYF2m0z9Sl2VxugxWm29OVogT4M4HIDTm0kfafIR4B4a
         y0aMlezcpDD/LunANN16qpFNI4Gjq6E7mO8wnwJ3l1EzbXko/sEQVCKxTB+m45N02K5f
         qkvSFEfDMvo66TACMuOhyLOtDtV2OGnod3yXCY4iD6Y7Ruol4MV0nGuk2h1Up1oDayOp
         S3IkYeiRsGKlJcgoCumOxAJlKv2zNnt96nsLyt4/3jpepp182txdJHVjNDF1e4EWeWhn
         sAEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BKv/eJSF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p8si61520yba.504.2018.01.15.10.50.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 10:50:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BKv/eJSF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54774 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eb9q6-0003gD-Po
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 13:50:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38813)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eb9pW-0003Im-JI
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 13:49:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eb9pV-0007sQ-JK
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 13:49:58 -0500
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:44684)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eb9pV-0007s8-D5
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 13:49:57 -0500
Received: by mail-ot0-x244.google.com with SMTP id t20so2133834ote.11
	for <qemu-arm@nongnu.org>; Mon, 15 Jan 2018 10:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Mo/2JoNF3mqxe4XoiviHDRNEkOKX8E3ti7vpdu4fztQ=;
	b=BKv/eJSFEZy6c4FnKHl8uuAfImsakrMOGVmQ5Qa63TtYZcVcHbV8NFAM9BMUyV3dUV
	KIq4+m5zRq0eGDuoPWHynAaRcCLejG3RqhqTpiW9wtgeesq1j2/6Qpyabw06hBIyN2KU
	cTLKUdkkI3KrnUliwHZvUgH3yPGUAP03c0jP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Mo/2JoNF3mqxe4XoiviHDRNEkOKX8E3ti7vpdu4fztQ=;
	b=oEekIwLvYqKAAz2em29qpHhmQoaJxT2UXX8o+QxQyYIn0SCEI76/NodFrZDpm3CAEA
	9jss75WmrvLE7Lhi1fNX5CsYC1hBqcNmc78GbDi5ngxh2Y7XO6vojkiDc8ThT57ICUXK
	i/iepPPIgAi7vLJoTmMuW+W0gjS9sIeHRgh4YhTcSaMsvXyKnSxAv2mNFMoEXjHeDUCF
	vAZdZjBQ0bdSY5M5FA8b+UH7mmH9N8xFPtWggKOeAbiw2bnJFWHEKMR253y4OtUf1Lah
	lsbmB52o7JpqfrrPfHJQcbTx+Xhm/XVslL7ksi+9YEf4QmrSJsQsZY5G790v+jCv2AR6
	DcpA==
X-Gm-Message-State: AKwxytctNtuDE0aSyAiCe8mqF5hKwWsrCPa+Qgx4mgrEqoVXtOnjrAxR
	0tiFIsFmMvGehASeILpsC1dkM4KV2f5QGu2Rltb3Hw==
X-Received: by 10.157.29.73 with SMTP id m67mr21653096otm.91.1516042196471;
	Mon, 15 Jan 2018 10:49:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Mon, 15 Jan 2018 10:49:36 -0800 (PST)
In-Reply-To: <20171218172425.18200-11-richard.henderson@linaro.org>
References: <20171218172425.18200-1-richard.henderson@linaro.org>
	<20171218172425.18200-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jan 2018 18:49:36 +0000
Message-ID: <CAFEAcA9TEUfY3oDzWxouG5J5AKBWPoHwfcY+yuO0K+X_K_u7wQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
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
X-TUID: lsqrwZPtjfTP

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

(Forgot this bit before hitting send on the other email...)

Unlike the sprawling disas_vfp_insn(), we're in a position to get the
order of checks right here. Just move it and the vfp_enabled test a
bit further down...

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

...to here.

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

thanks
-- PMM
