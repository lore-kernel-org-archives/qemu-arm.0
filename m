Received: by 10.28.71.27 with SMTP id u27csp4870144wma;
        Tue, 27 Feb 2018 06:15:36 -0800 (PST)
X-Google-Smtp-Source: AG47ELv5bTjNFkLdz9g1g6ecF1fJNaR+eBnoyxD/zptEHnGqPjqjWai9IFmDdB+GOiRMIlEbx7aU
X-Received: by 2002:a25:6c87:: with SMTP id h129-v6mr9774038ybc.212.1519740935992;
        Tue, 27 Feb 2018 06:15:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519740935; cv=none;
        d=google.com; s=arc-20160816;
        b=W2i7Wxu+bOh7UYy1cbk6h9e3DKJK0QSpRKTmieeSZ/7aj2U5RaPV6wfMN54l3FcdRT
         pxNxDFDMnE69BYSN8Xhz/jXm/7fK3IcgShfePD6Fo86sQ8ol5RomnBeCUaQZifbsfNUR
         JF3enwCdZkX7JDEELBX8l2wccPEDAs7O/Hrfk2e45H4k8QeOuekBCQSFrenIdSZfhRRl
         MhbPYyiuW/F43FuLAZZdpKuho+ktLA0xAkh/yhHa94C7emlHUhUhtMCoUAR/dx3yJ8E+
         JQQtVH43NU7oovl7qw/64F83YTet50OA98NyuwDIoay0TBAd8k8VF7HE5+VDV0es4Gqc
         uVPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=voQqkQnLmco1ZZlf0tnWd7FGfy4qX6nO9YlvTIEat9U=;
        b=lZ5/1Tw6kua2YEhGQbfHngrHeIpIQPD9DeiCGH+GbeN0mkAWIhQCJGTjD3DAtgYPbn
         A+GWnARNsCb39YhC34mFV98d7EV9+W2F9FN0JE/z1gcj8QA2MyXKlY1CmSAjFZXWIPKu
         bVkgQUCSuAdzgSCLSmjV+AuPP9HvvgVUi0/xikX583+nKdw8ji7WVeOaTLyQwPlCgm/7
         c8ZZFDk+6lqswMejlrcStI4Nf8uIBTPAMOUK9uvZPRd3ahzOlbBZcMMD0Pw1qtk57R9z
         9R6VaowjCha4OxsCknD2Mh4NVhLRew9ltEMLgHk9kVAgnIotk5wBAmTd2r1GpJA7ITX/
         0EAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hBw1LbyL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z191si1943635ywg.398.2018.02.27.06.15.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 06:15:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hBw1LbyL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37544 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqg2Z-0001Bq-EI
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 09:15:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48837)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqg2S-0001Bb-KV
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 09:15:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqg2N-0005bj-Ke
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 09:15:28 -0500
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:38498)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eqg2N-0005bB-DP
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 09:15:23 -0500
Received: by mail-ot0-x242.google.com with SMTP id 95so3893203ote.5
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 06:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=voQqkQnLmco1ZZlf0tnWd7FGfy4qX6nO9YlvTIEat9U=;
	b=hBw1LbyLY59C5tEoZesm+iqUrzQSkIpl6aOhyvg+x30jnVib0SwhoTNl6aH7RdAM+Y
	7FJy4Ivi276auzWU7ZCyEGeF9PnOPubDHCJqud0m3NrSiimRRmDHpy+qrJcyCCJe6dBF
	+D+NS/tlNojw2xlCeQCvkC1s5SR3H20g2GwJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=voQqkQnLmco1ZZlf0tnWd7FGfy4qX6nO9YlvTIEat9U=;
	b=mRxvtrXqfLiCm3HObqzwqfoHhQz5iptlE76rvDYriqUXFcjrSk3N2tuShGti1ffa+Y
	50cXUdhYk2Ua1O/K84PMYnxAtrbpoCjPpeIg8P17MLnj/pCaKCabJYY0NIhpL/8Pd13Y
	89OV6fxFDxI6ND/cfs1zMD2B3aBYDOe32D8Fx1Rt3FjWtVgtceQWe8NT2xtVJKalXSFO
	ks9XehgtXaXGYgeXlELLVKM6L1yfQjLe3r409m1nuWSg8K/B7cYSe40QdNWc0cxGbyIE
	TJ/mMOE6iFA0N2Vl2bxvwhgk+lL7jeFHBLkd/nfV16bfOrd2Zx+gc+TeV7awbBQGF156
	nIeA==
X-Gm-Message-State: APf1xPCOKQUuXgFlOZicQPW4lffRV33M2SOFIIsh2x0cMeqx8Z1uB99Y
	jOCxUO1Akh4UA+nG0U417A3mCZBdfLpFwd7KisrJXg==
X-Received: by 10.157.7.227 with SMTP id 90mr9837800oto.126.1519740922615;
	Tue, 27 Feb 2018 06:15:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 27 Feb 2018 06:15:02 -0800 (PST)
In-Reply-To: <20180217182323.25885-52-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-52-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 14:15:02 +0000
Message-ID: <CAFEAcA8EbsNyfefQ05VKhsQ5sDW1PFqjw2pL6_YFm-pPTphSxw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [PATCH v2 51/67] target/arm: Implement SVE load and
 broadcast element
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
X-TUID: Ktx9+eP3HBFS

On 17 February 2018 at 18:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  5 +++++
>  target/arm/sve_helper.c    | 43 ++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 55 +++++++++++++++++++++++++++++++++++++++++++++-
>  target/arm/sve.decode      |  5 +++++
>  4 files changed, 107 insertions(+), 1 deletion(-)
>

>
> +/* Load and broadcast element.  */
> +static void trans_LD1R_zpri(DisasContext *s, arg_rpri_load *a, uint32_t insn)
> +{
> +    unsigned vsz = vec_full_reg_size(s);
> +    unsigned psz = pred_full_reg_size(s);
> +    unsigned esz = dtype_esz[a->dtype];
> +    TCGLabel *over = gen_new_label();
> +    TCGv_i64 temp;
> +
> +    /* If the guarding predicate has no bits set, no load occurs.  */
> +    if (psz <= 8) {
> +        temp = tcg_temp_new_i64();
> +        tcg_gen_ld_i64(temp, cpu_env, pred_full_reg_offset(s, a->pg));
> +        tcg_gen_andi_i64(temp, temp,
> +                         deposit64(0, 0, psz * 8, pred_esz_masks[esz]));
> +        tcg_gen_brcondi_i64(TCG_COND_EQ, temp, 0, over);
> +        tcg_temp_free_i64(temp);
> +    } else {
> +        TCGv_i32 t32 = tcg_temp_new_i32();
> +        find_last_active(s, t32, esz, a->pg);
> +        tcg_gen_brcondi_i32(TCG_COND_LT, t32, 0, over);
> +        tcg_temp_free_i32(t32);
> +    }
> +
> +    /* Load the data.  */
> +    temp = tcg_temp_new_i64();
> +    tcg_gen_addi_i64(temp, cpu_reg_sp(s, a->rn), a->imm);

Isn't the immediate offset supposed to be scaled by mbytes ?

> +    tcg_gen_qemu_ld_i64(temp, temp, get_mem_index(s),
> +                        s->be_data | dtype_mop[a->dtype]);
> +
> +    /* Broadcast to *all* elements.  */
> +    tcg_gen_gvec_dup_i64(esz, vec_full_reg_offset(s, a->rd),
> +                         vsz, vsz, temp);
> +    tcg_temp_free_i64(temp);
> +
> +    /* Zero the inactive elements.  */
> +    gen_set_label(over);
> +    do_clr_inactive_zp(s, a->rd, a->pg, esz);
> +}
> +

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
