Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp826728wrq;
        Mon, 4 Jun 2018 09:47:33 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJZCdk6N6xE/cRA3Erp5tvAYmipmiISuK3BTpCtsyudlY+N1aG7rolDRkBfpQfde3H49ptJ
X-Received: by 2002:aed:3fc8:: with SMTP id w8-v6mr7600332qth.262.1528130853765;
        Mon, 04 Jun 2018 09:47:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528130853; cv=none;
        d=google.com; s=arc-20160816;
        b=ZbKmuiYetHhXQCQYsn1giTHYqTMuJDW9lWYWv/N2IVZkbKs1bRQkc7FsmnU+ELoHFk
         CzNM5tV+e4DPboR3RyejzHz020dJMfZQCIdXrEWbekVJ2FcR/KYSv9kCwahfwUmZ5mKr
         jWAXeTsxs7jaDBUiCL/Cc3YpMCEHhcbjoGSgbg0wUAik7DKxncou7KBi2/50cWVxB0iC
         4aKMhajaAmxIwug1ektsJr9h33HdnZtMBOlfj6HPWQX62oCkjH2OY/McqS5n4LBCiRmR
         bpXuQW4c6NdHRsHGdXAgJ4UNkptX/yy7mWjoaPb/zXHhmJycVp5zATxc5EwX1hZY3p4c
         Bmeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=bSxbCZLvUnyAm6jvuS4oYRuIOhXkv63XOEubp2QuMeo=;
        b=t4hVBjIpYb0SGO/ajoIbaU3KK0EUCkBAj1wyV7X+xDTghYar0tZAwa2aoAFddsy6bk
         wSUqO/5boP1MrPYF6fE6ezfz1TMWF7OuUec9lK9tJFdGYZP7AuTIi/eK1e+zF3+5wPwR
         Yqr34zE87wK7OZWOIIgv6WC0YhcjubS0bYTk7i8vwCGRQ7YjQfDjsEuAIAv98OYCR0Op
         v/r09Bh9RO+leb6vVgbzawW7K+lZagQevSTue29bXV+qRZYWmeHLjfl66n9KVGlxLB5H
         8JmoxAWAQBS9w/v92xw0rENM77VVK34RenI3RRkvjeh+bukH030F38cJJcqEgGwfnPrp
         9TOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=giL18DLO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x28-v6si4187439qtx.371.2018.06.04.09.47.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jun 2018 09:47:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=giL18DLO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40999 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fPsdp-0002RT-AB
	for alex.bennee@linaro.org; Mon, 04 Jun 2018 12:47:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38354)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fPsde-0002RJ-Ih
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 12:47:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fPsdd-0004DH-Fu
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 12:47:22 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:39983)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fPsdd-0004Cw-9b
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 12:47:21 -0400
Received: by mail-oi0-x244.google.com with SMTP id f79-v6so15076568oib.7
	for <qemu-arm@nongnu.org>; Mon, 04 Jun 2018 09:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bSxbCZLvUnyAm6jvuS4oYRuIOhXkv63XOEubp2QuMeo=;
	b=giL18DLOx/JmiQkCgWFRuSiRdJK5JkTi1h9B9FWHd5IZyjMi5h8VTfTL1PLtAuUqBY
	xEAds/vbAFW0YOvuTMwLppAG6W1oE2z2WQzy600ora995sig4qV8rWilaYedmWSuvKFB
	PjRM8sngOdGlkC9epMQdqq6/LhGZz2MG1/kIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bSxbCZLvUnyAm6jvuS4oYRuIOhXkv63XOEubp2QuMeo=;
	b=YMl26ltVYwMC/pf1PF3F2tXoqcje0zmP2RJedeFJnsM2WoKy24vyz2/yiWC3ywcy02
	I6roU84KH/URZjiu+eG398WJYvRd8q3dWVIr5dHKxjCYbMeTbHl/e3zMXjzTRp21ZQ3f
	BglmZaNwOD0SPTKxyFPaa99PMFNHVruA4s0EcAZ8NWlbZb//vXJpKwAu/ihkmqjf1OQn
	lvugSoFwH4+bMfwEGtVdLkaZ9pYWWRAoLX3Qq9jQXZayGiOycc2yu2Q/kCceYlHlei04
	ub7YKAUSPrW/0tAY/dcycQWcSV5BDz/Gi0hOV86K6rtLeJlkCJhG7wmDya915ilIQ87S
	m0+A==
X-Gm-Message-State: APt69E2aOfRNdM4Mp2nqPKA6xuVMEJZUB4lCXme/hSrKHb660VrQTYP/
	RkMxsoYbnR/X7DOJegToSDWOssE/agJBRvcUpz5whw==
X-Received: by 2002:aca:4ad2:: with SMTP id
	x201-v6mr11336947oia.11.1528130840544; 
	Mon, 04 Jun 2018 09:47:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP;
	Mon, 4 Jun 2018 09:46:59 -0700 (PDT)
In-Reply-To: <20180530180120.13355-7-richard.henderson@linaro.org>
References: <20180530180120.13355-1-richard.henderson@linaro.org>
	<20180530180120.13355-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jun 2018 17:46:59 +0100
Message-ID: <CAFEAcA_z+UmmJcqzqtq7RiPnEZDLwpfESQbP4ajRZLFLsVKmqw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH v3b 06/18] target/arm: Implement SVE
 conditionally broadcast/extract element
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
X-TUID: AtX8t2RqPruW

On 30 May 2018 at 19:01, Richard Henderson <richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |   2 +
>  target/arm/sve_helper.c    |  11 ++
>  target/arm/translate-sve.c | 318 +++++++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      |  20 +++
>  4 files changed, 351 insertions(+)
>
> diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
> index d977aea00d..a58fb4ba01 100644
> --- a/target/arm/helper-sve.h
> +++ b/target/arm/helper-sve.h
> @@ -463,6 +463,8 @@ DEF_HELPER_FLAGS_4(sve_trn_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
>  DEF_HELPER_FLAGS_4(sve_compact_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
>  DEF_HELPER_FLAGS_4(sve_compact_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
>
> +DEF_HELPER_FLAGS_2(sve_last_active_element, TCG_CALL_NO_RWG, s32, ptr, i32)
> +
>  DEF_HELPER_FLAGS_5(sve_and_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
>  DEF_HELPER_FLAGS_5(sve_bic_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
>  DEF_HELPER_FLAGS_5(sve_eor_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index ed3c6d4ca9..941a098234 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -2070,3 +2070,14 @@ void HELPER(sve_compact_d)(void *vd, void *vn, void *vg, uint32_t desc)
>          d[j] = 0;
>      }
>  }
> +
> +/* Similar to the ARM LastActiveElement pseudocode function, except the
> +   result is multiplied by the element size.  This includes the not found
> +   indication; e.g. not found for esz=3 is -8.  */

Non-standard multiline comment form... (I won't bother to note
this in other patches, but please check those too.)

> +int32_t HELPER(sve_last_active_element)(void *vg, uint32_t pred_desc)
> +{
> +    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
> +    intptr_t esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
> +
> +    return last_active_element(vg, DIV_ROUND_UP(oprsz, 8), esz);
> +}
> diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
> index ed0f48a927..edcef277f8 100644

> +/* Compute CLAST for a Zreg.  */
> +static bool do_clast_vector(DisasContext *s, arg_rprr_esz *a, bool before)
> +{
> +    if (!sve_access_check(s)) {
> +        return true;
> +    }
> +
> +    TCGv_i32 last = tcg_temp_local_new_i32();
> +    TCGLabel *over = gen_new_label();
> +    TCGv_i64 ele;
> +    unsigned vsz, esz = a->esz;

Declarations should be at the start of the block. (There's
another instance of this for the sve_access_check() in a
function below; please check other patches too.)


> +/* Compute CLAST for a Xreg.  */
> +static bool do_clast_general(DisasContext *s, arg_rpr_esz *a, bool before)
> +{
> +    if (!sve_access_check(s)) {
> +        return true;
> +    }
> +
> +    TCGv_i64 reg = cpu_reg(s, a->rd);
> +
> +    switch (a->esz) {
> +    case 0:
> +        tcg_gen_ext8u_i64(reg, reg);
> +        break;
> +    case 1:
> +        tcg_gen_ext16u_i64(reg, reg);
> +        break;
> +    case 2:
> +        tcg_gen_ext32u_i64(reg, reg);
> +        break;
> +    case 3:
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    do_clast_scalar(s, a->esz, a->pg, a->rn, before, cpu_reg(s, a->rd));

Why do we use cpu_reg() again here rather than just using 'reg' ?

> +    return true;
> +}
> +

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>


thanks
-- PMM
