Received: by 10.28.71.27 with SMTP id u27csp763007wma;
        Fri, 23 Feb 2018 08:05:39 -0800 (PST)
X-Google-Smtp-Source: AG47ELvdlDB9yoUFQu+BbUql9wARPHtsyet83DToTMVWiaU3zqSUUjH8yww0CW/oWsxptdC4T8cC
X-Received: by 2002:a25:d94a:: with SMTP id q71-v6mr1370409ybg.146.1519401939561;
        Fri, 23 Feb 2018 08:05:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519401939; cv=none;
        d=google.com; s=arc-20160816;
        b=iDmIIAwgurS5XaKPAUGtr9/L+DO8XKjXeSy+eVsyx/1P0LrmEoNUhAJPU142GfOisC
         0SHs4DH31Mj2lrmoNhUMeTcfK59vb07CyfKewB1ZE0nIPRcVGdKo5GF/dOgsjyuNe+mz
         PQQmjxxd3vHBfcs6YbJqbMyWxzNBdPHmgBdE1JjzsvrtFCWXsi5/xnJH+CnOh7jqXsk5
         G1jXhvOB8r2KijgRDbk8WRHLbk4Rn//FgNJ4ECNw/BwEPI+56GkqyJMvewDL5Oto2J3L
         BX6rjGi7Kn95eM08j0+wLPDQ7A9sEiSOQ07PEFrqatRX535tH+MvgFwYWhOLebCBLlOm
         ivng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=wehI9jm1QJByu2L027kPwvOIjUCi1Ly+J6Y339ORrc4=;
        b=v4RH7upn8Tqn7pRgbUfXDD06/t/5KHglxOfaym9YM1hzjcj34lcRbM2NtDanF0g4tl
         hrY1sRNqWP3Nb9w/glphixMlls7zPZZmAkKIdK9OMr2/WAjr3BJwA4QN+wqW7lJQhq6x
         xHjUyUSdS4R6RodyZdhmDboua8SW6nTqt2kvXFYhUlN4M7uvIklZKk3/jHYa1Jru6PWp
         u2ztKHU3lDJx5QegP2JMtsDWm3rLDLrKdSvX+LtaMaX/4CzEtcbePGTjzNpTVbqz5IvE
         A8DgV646z7utPlHAurNdD2I/JM2f9C2a1R/PInmysTAFqMjXSY1ImVF6RVg1rA7ScmUC
         aH3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ec8hCgHW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t203si443248ywt.436.2018.02.23.08.05.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 08:05:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ec8hCgHW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45426 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epFqs-0003Uu-T5
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 11:05:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47285)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epFWL-0001om-Se
	for qemu-devel@nongnu.org; Fri, 23 Feb 2018 10:44:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epFWK-00008m-RH
	for qemu-devel@nongnu.org; Fri, 23 Feb 2018 10:44:25 -0500
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:44262)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1epFWK-00006l-Kh
	for qemu-devel@nongnu.org; Fri, 23 Feb 2018 10:44:24 -0500
Received: by mail-pg0-x242.google.com with SMTP id l4so3489098pgp.11
	for <qemu-devel@nongnu.org>; Fri, 23 Feb 2018 07:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wehI9jm1QJByu2L027kPwvOIjUCi1Ly+J6Y339ORrc4=;
	b=ec8hCgHWdcBKwh771FETsKOA3dGwD1eWBLbcGackkiBSiyR89lWOngZMrSm9iP/7un
	0P2yg/fAPoMtHYHDau0GtyQdSCF3SO25cQELyoDWKVeSxUSDCLzh+3orSYa05dvP6+Kv
	LU4XWV5WdNbsTctr7Xew3Co0vN4Pd/PjD9qw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wehI9jm1QJByu2L027kPwvOIjUCi1Ly+J6Y339ORrc4=;
	b=dmAaS94dytkYjhGBunazx2lwNMKaQ+SHwRHFC0Wnyom+9Gv3mqpe/2s+uSsi1FRDqU
	izSsbOer06cbDcuYhWJc6QDJNGkf4ndInMzD7o/Pb1GyOxB8hrptk7f45+PAxhJd2srn
	JM6vsMUj+RUMjocQnfVN+BWta3QOpbiRKZirAkHfyl1x3jGnE40AF0HWXpmNQf6pBNOW
	3CPAkKoE/VoeD1pxs1gQE8x/8d9bkor+N2YTOSy8Ld3xAJ8/fJ7L2Ku4SvgR/3+GSMC2
	UA2B7ydbvAQJBo8KbsabDpJ9Q4FrNS1UwQGOUdjH+3pZqMbI6N/dS5qnpxwXGeeFqUR+
	qenQ==
X-Gm-Message-State: APf1xPDhpf1bq9dooNvdbtP9cJ6bdW3g8dfA47aMfuzwAf/dyFPJlWR1
	zRYAM+OdBxqeJiJ+b5WkoKD4ejcbGthkQwm2rB8gAA==
X-Received: by 10.98.98.194 with SMTP id w185mr2197540pfb.9.1519400663523;
	Fri, 23 Feb 2018 07:44:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 07:44:03 -0800 (PST)
In-Reply-To: <20180217182323.25885-32-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-32-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 15:44:03 +0000
Message-ID: <CAFEAcA9kSgYNVQ6L6b94Gnz2ZnD4RKfeBqJintfgVqW47zq-qA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v2 31/67] target/arm: Implement
 SVE conditionally broadcast/extract element
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eSEMeEwKTz/A

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |   2 +
>  target/arm/sve_helper.c    |  11 ++
>  target/arm/translate-sve.c | 299 +++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      |  20 +++
>  4 files changed, 332 insertions(+)
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
> index 87a1a32232..ee289be642 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -2050,3 +2050,14 @@ void HELPER(sve_compact_d)(void *vd, void *vn, void *vg, uint32_t desc)
>          d[j] = 0;
>      }
>  }
> +
> +/* Similar to the ARM LastActiveElement pseudocode function, except the
> +   result is multiplied by the element size.  This includes the not found
> +   indication; e.g. not found for esz=3 is -8.  */
> +int32_t HELPER(sve_last_active_element)(void *vg, uint32_t pred_desc)
> +{
> +    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
> +    intptr_t esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);

pred_desc is obviously an encoding of some stuff, so the comment would
be a good place to mention what it is.


> +/* Compute CLAST for a scalar.  */
> +static void do_clast_scalar(DisasContext *s, int esz, int pg, int rm,
> +                            bool before, TCGv_i64 reg_val)
> +{
> +    TCGv_i32 last = tcg_temp_new_i32();
> +    TCGv_i64 ele, cmp, zero;
> +
> +    find_last_active(s, last, esz, pg);
> +
> +    /* Extend the original value of last prior to incrementing.  */
> +    cmp = tcg_temp_new_i64();
> +    tcg_gen_ext_i32_i64(cmp, last);
> +
> +    if (!before) {
> +        incr_last_active(s, last, esz);
> +    }
> +
> +    /* The conceit here is that while last < 0 indicates not found, after
> +       adjusting for cpu_env->vfp.zregs[rm], it is still a valid address
> +       from which we can load garbage.  We then discard the garbage with
> +       a conditional move.  */

That's a bit ugly. Can we at least do a compile time assert that the
worst case (which I guess is offset of zregs[0] minus largest-element-size)
is still positive ? That way if for some reason we reshuffle fields
in CPUARMState we'll notice if it's going to fall off the beginning
of the struct.

> +    ele = load_last_active(s, last, rm, esz);
> +    tcg_temp_free_i32(last);
> +
> +    zero = tcg_const_i64(0);
> +    tcg_gen_movcond_i64(TCG_COND_GE, reg_val, cmp, zero, ele, reg_val);
> +
> +    tcg_temp_free_i64(zero);
> +    tcg_temp_free_i64(cmp);
> +    tcg_temp_free_i64(ele);
> +}

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
