Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2867725lft;
        Thu, 23 Jun 2022 04:26:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s1sNR08ynwsUasBo711Oh+UfveWvhDKQD7PcHYB0u8g9UJkz03FTSJMaaON8HsGFwUqv71
X-Received: by 2002:a0c:f28b:0:b0:470:605b:1c2c with SMTP id k11-20020a0cf28b000000b00470605b1c2cmr7033926qvl.123.1655983561831;
        Thu, 23 Jun 2022 04:26:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655983561; cv=none;
        d=google.com; s=arc-20160816;
        b=nRbT4oLTtiRHbrZZaOufD8Ps5guB3HGurNuccvlmUdBxtLjVAdMhfwzuPMr/3H2oby
         zGGv7s1yuQp06Bz4HDTF8pk2kSQWVch5jFx9pbXXARTzfch5GCA0M9zy4RTWAlZgh144
         sQsBmYcKYeVh81/oFQO5iWNv6vQnBX/qYx8H9KWpiqjw+rSB1RPwN3hG2wAlV7Jwvow1
         hxDFrJzJRdOAxc0wTb3Z31TWJa4fbJk3inzuB+5JmAms0yD05P53ocOEUVcFuysjg6Tr
         K2cHvTGkIQjGee/JulWBmuSRRRq+SaxJyUYCRzKg1JY65OJa3MfmeGKWCUVV7V9Dif05
         bjlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=AOH6eIuL0aIpPL+ItqXK2B9mSn8bjv/xgbmvR4pYTiU=;
        b=Gp+zL/L6QWc9Zcl0mXKx8j/+CCCTEOsJ22m1F8/09NEW9Xp/2ikanRqPhsGTFrroAo
         akeuK/5byJJq3YCLy7Q6jGqQ32Fsv1QvAb24lZKu+k8aEwfnAW3f3XgqeCyPu1Oy2N5w
         dwr8G4B/4rUjFwNoR/2Ww3ujbKT5HdeMUgaUINj6VW3PFI1NTocIArOPmVApxjZrnqm1
         /kaYiTG4FmiTT6V3c7NKD8huo3AxLDGZSZ9RLXnVQa/Yt9W0kzu5Y/OzQFj+EKvmC2KN
         uER0LAXhHF0pEPMKms5ltAkzHL6diFFUIcTRfy4E6CYziJnLadC1aAvvq8yaDrU1CDo9
         JKOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WkRznGrv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d20-20020a05622a101400b00307cbf812f1si12141134qte.214.2022.06.23.04.26.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jun 2022 04:26:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WkRznGrv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4KyH-00035A-3y
	for alex.bennee@linaro.org; Thu, 23 Jun 2022 07:26:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4KxN-000348-D0
 for qemu-arm@nongnu.org; Thu, 23 Jun 2022 07:25:07 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:33739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4KxJ-0008BP-2i
 for qemu-arm@nongnu.org; Thu, 23 Jun 2022 07:25:03 -0400
Received: by mail-yb1-xb30.google.com with SMTP id v81so35310205ybe.0
 for <qemu-arm@nongnu.org>; Thu, 23 Jun 2022 04:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AOH6eIuL0aIpPL+ItqXK2B9mSn8bjv/xgbmvR4pYTiU=;
 b=WkRznGrv59P/wrtQR62iESf/26lcWdObJsnXgSz9a81vytwuU1zDuLU+VHzOz9vE20
 fiQhOWU+21aClmxpLcufpjaBL95LPx4zCJdgHyAFDUpza+ry95I4qnpny52SMT/ZKYhi
 AVU9/nOM3rJ6eIh98HWY7gvUag8FPnG6or60gyHi2FaGj3QKxd1UDE5dBWE3bblu3L31
 xD2hbciIjBFtzUvg7JElRXJ0rvPhYXqPDgzXL1MnTGkYEminvdk5neupgbMtI6DyuMYA
 b6PwnoMPN3/nxXxFSWlvqOm5LjYHADx5gYtHfTHHMKzoosAaiORdyrldWu+p41H/TuuL
 swaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AOH6eIuL0aIpPL+ItqXK2B9mSn8bjv/xgbmvR4pYTiU=;
 b=erioV3YtzMv+3NLer9Xcq6xVeOcomsIvnVsaUYiL8RDBfwJBZ0CtQwsZ9B5rbL9YT5
 kmLSQrIGyUvykNB5rO7eUof7ykgsjlPsrJi5JR90BLGoKDh8sQs71vwGoqpgl3QcWzbF
 zYpydj9rzA1w3nMryhe2edtJp8hppS/uA3qRnXDg4cOb1SnCSWURtH+A4uhUZ3o8DpmT
 wDSKjJVHB2ZAxP93382COMoSRL8q3b+VPn9Iq8eE1VAumgdvU9ncSIN8vlrzCksM7P47
 w2oH4+yaQr88NXCC2D1ENsfMt3Uk1fR4ThoYl3eqGWFjmC4T9VDbCSqDE6pbsgcZ/Psb
 sdcw==
X-Gm-Message-State: AJIora+CWbCTnvsu2cn+D782Ad/zwSm9o9t0KVOS+LTpCRY9w7oyd8Os
 B6xoFMN+p+UR1OotNqBQliORTOPHRQUtrcC7tUVwAQ==
X-Received: by 2002:a05:6902:1505:b0:668:c93b:d1d0 with SMTP id
 q5-20020a056902150500b00668c93bd1d0mr8764321ybu.140.1655983499639; Thu, 23
 Jun 2022 04:24:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-26-richard.henderson@linaro.org>
In-Reply-To: <20220620175235.60881-26-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2022 12:24:48 +0100
Message-ID: <CAFEAcA-_Cof12Oe=4HTJx_4Nmtfq1Oj7BRdFmzv989H13kUVTg@mail.gmail.com>
Subject: Re: [PATCH v3 25/51] target/arm: Implement SME MOVA
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5A0qPusrcsIC

On Mon, 20 Jun 2022 at 19:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We can reuse the SVE functions for implementing moves to/from
> horizontal tile slices, but we need new ones for moves to/from
> vertical tile slices.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sme.h    |  11 ++++
>  target/arm/helper-sve.h    |   2 +
>  target/arm/translate-a64.h |   9 +++
>  target/arm/translate.h     |   5 ++
>  target/arm/sme.decode      |  15 +++++
>  target/arm/sme_helper.c    | 110 ++++++++++++++++++++++++++++++++++++-
>  target/arm/sve_helper.c    |  12 ++++
>  target/arm/translate-a64.c |  19 +++++++
>  target/arm/translate-sme.c | 105 +++++++++++++++++++++++++++++++++++
>  9 files changed, 287 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
> index c4ee1f09e4..600346e08c 100644
> --- a/target/arm/helper-sme.h
> +++ b/target/arm/helper-sme.h
> @@ -21,3 +21,14 @@ DEF_HELPER_FLAGS_2(set_pstate_sm, TCG_CALL_NO_RWG, void, env, i32)
>  DEF_HELPER_FLAGS_2(set_pstate_za, TCG_CALL_NO_RWG, void, env, i32)
>
>  DEF_HELPER_FLAGS_3(sme_zero, TCG_CALL_NO_RWG, void, env, i32, i32)
> +
> +DEF_HELPER_FLAGS_4(sme_mova_avz_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_4(sme_mova_zav_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)

What do the 'avz' and 'zav' stand for here? I thought that
'zav' might mean "from the ZA storage to a Vector", but
then what is 'avz' ?


> +static TCGv_ptr get_tile_rowcol(DisasContext *s, int esz, int rs,
> +                                int tile_index, bool vertical)
> +{
> +    int tile = tile_index >> (4 - esz);
> +    int index = esz == MO_128 ? 0 : extract32(tile_index, 0, 4 - esz);
> +    int pos, len, offset;
> +    TCGv_i32 t_index;
> +    TCGv_ptr addr;
> +
> +    /* Resolve tile.size[index] to an untyped ZA slice index. */
> +    t_index = tcg_temp_new_i32();
> +    tcg_gen_trunc_tl_i32(t_index, cpu_reg(s, rs));
> +    tcg_gen_addi_i32(t_index, t_index, index);
> +
> +    len = ctz32(s->svl) - esz;
> +    pos = esz;
> +    offset = tile;
> +
> +    /*
> +     * Horizontal slice.  Index row N, column 0.
> +     * The helper will iterate by the element size.
> +     */
> +    if (!vertical) {
> +        pos += ctz32(sizeof(ARMVectorReg));
> +        offset *= sizeof(ARMVectorReg);
> +    }
> +    offset += offsetof(CPUARMState, zarray);
> +
> +    tcg_gen_deposit_z_i32(t_index, t_index, pos, len);
> +    tcg_gen_addi_i32(t_index, t_index, offset);
> +
> +    /*
> +     * Vertical tile slice.  Index row 0, column N.
> +     * The helper will iterate by the row spacing in the array.
> +     * Need to adjust addressing for elements smaller than uint64_t for BE.
> +     */
> +    if (HOST_BIG_ENDIAN && vertical && esz < MO_64) {
> +        tcg_gen_xori_i32(t_index, t_index, 8 - (1 << esz));
> +    }
> +
> +    addr = tcg_temp_new_ptr();
> +    tcg_gen_ext_i32_ptr(addr, t_index);
> +    tcg_temp_free_i32(t_index);
> +    tcg_gen_add_ptr(addr, addr, cpu_env);
> +
> +    return addr;
> +}

This is too confusing -- I spent half an hour looking at it and
couldn't figure out if it was correct or not. I can see roughly
what it's supposed to be doing but I don't really want to try
to reverse engineer the details from the sequence of operations.
Eg the way we sometimes just add in the tile number and sometimes
add in the tile number * the size of a vector reg looks very
strange; I figured out that the deposit op is doing the equivalent
of the pseudocode's "MOD dim" on the slice index but it doesn't
say so and the calculation of len and pos is kind of obscure to me.

Perhaps (a) more commentary and (b) separating out the
horizontal and vertical cases would help ?

thanks
-- PMM
