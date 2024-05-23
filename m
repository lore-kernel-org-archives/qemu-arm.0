Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1092352ejb;
        Thu, 23 May 2024 07:15:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUqaAf/aqLgiJSr6jbXVBv7O+00guWmf5IiTWwmjCTahDu2wn14qDY2+YDpUCl6kpHCd6HbqQESx2wDmgF/W1wn7l/JotKj
X-Google-Smtp-Source: AGHT+IFI/jSHu+Pbs2jN+xK2hzE7V4+/tZELC8HC7ATwj7UCufyvcvOqZnPz9hdTg6Z12rLjLw16
X-Received: by 2002:a05:6102:d93:b0:47b:fe0b:a92e with SMTP id ada2fe7eead31-48904d99b48mr5663693137.16.1716473741259;
        Thu, 23 May 2024 07:15:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716473741; cv=none;
        d=google.com; s=arc-20160816;
        b=lihnyieafAbFKaXxuwkT5WYIJ8XG6HcpYBAPpypYITlCp5tW4uKf3pdpPSYPUN9Fyt
         IxPi48/JzwBJBbvEEUgYA4afx2zJBm+EEbQPWZLrgAHCucTdHfcHw/K1nkfw4zcJO6Ra
         ZnvJm8owMU10WsVAKt+jN27nlaXYUZvJqYVoAsRguvd92t3LShTaGfrNknr1gqKATWHp
         xsOOvRfQSCOfYtYP0sVmsMmhJtA34lTW6v58w43DL6Ve9DjspNLch86WT4ZLRIshQ2L0
         sWkC5dFQHAk5ZZP1E+C17A3vgELXl9yX/4qgsdHHaSVz5MUms5Nl3ArXwvnGttQTeSMM
         YZ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=V5OOuRgXvHNipC+r1MzlWTh5qtBQmboK+WnzB/sfMMc=;
        fh=uYwFskyq0TyI4A5MEhfWhAFVlVwZzm3zL8AgMckqbN8=;
        b=FQXtqX9YNP+15JNbJne193faGsVZpYOXInizmYVuRSL+vHnJ1xudWmwXhZdndhs6kD
         bIJOGbPjcjzFQJlJurK70v1HdhwW9LeAnQV5BwmFW7uQb95zaQA5IYwTvekiKxRq9wuy
         oMuAnes571+kV50+iUiEFyhGPGtWRoM4iPxpXX8033p7OmiJ33PCRsF9FRpXLLW+srpD
         Ux4FT+g2lmVb5c+bygx3Jp8MaFRqc6MwyDKr+o/UNwgOn1Z9RSeAupCiracTVM+JwL9s
         OW5IezDTzcH70ApQC/6EmFytaIvkjm7E778pX/RgBFoa4t6BY8oSD/wjtGOWdNnyoLjd
         6fvA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qGg236bG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4806cc9b78csi5088370137.687.2024.05.23.07.15.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2024 07:15:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qGg236bG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sA9E5-0005Xp-Ax; Thu, 23 May 2024 10:15:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA9Dq-0005OW-5B
 for qemu-arm@nongnu.org; Thu, 23 May 2024 10:15:15 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA9Dk-0003YQ-S4
 for qemu-arm@nongnu.org; Thu, 23 May 2024 10:15:08 -0400
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2e576057c06so74247771fa.0
 for <qemu-arm@nongnu.org>; Thu, 23 May 2024 07:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716473701; x=1717078501; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=V5OOuRgXvHNipC+r1MzlWTh5qtBQmboK+WnzB/sfMMc=;
 b=qGg236bGnYmUT/v8redXcff67frKNoi2ACHSCE/Rmod/HRZcvlf37PBtcbY/SSx0Rw
 CcwpOr2GRtMUhXCE58+GmkjIglaTZkVMbdpxkwc/GJBITzIIE4O65WgThe/1zxGrksDn
 cFO40dGw8RPwoubcq3X8ohl0k0ELCBG4Qz3MviYGhtAx46FxF9v9suo9pMJxMT1FYuPt
 cI6UTG5FGRXpSgodBoK2YCjCBfum0ygkKA7tW2AETqenpYzdpTnNnAVGx8oXda8OQYHo
 iT9StC5uGVLtMHp632H9mh54QR4xa0bMOYaGkhgaF5CCViX74q5QD7QMl/S3fZP3vnov
 svqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716473701; x=1717078501;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V5OOuRgXvHNipC+r1MzlWTh5qtBQmboK+WnzB/sfMMc=;
 b=wNgNmP4QiLm6Rdvs/0U+xuphPe+8VI/J3yZJZzY+QiOfXkwv5RFhW2uEGGBXZRkjAT
 KkCh98HYJcmTtaWBN+1uSP/cP5tZ9F7hL6BOcmGuIQ14OKk62UMDB2qSyy1yOVCNQ54W
 em9amEChZ01e9kggZGoGKIrbadP5EpNFHALtA6qkGOenx39RjR4pWTZazyCo1SAKRuvY
 GCsJGUIcdtP/kDMI62l4vN8bwqEZI/cb7nL/83CCTadtyfpMlxqtqkQprxO7e1avX4Vy
 bQnzFoduzQ2kMx8CYiIy3wyVu0hYCwEj2D/KjlvkBjUNPeyKNg7eDGXnbnrX1goXp0fY
 nIWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUgbZg77XJTq2zw2UYM7Y6SUrAwHRdapWpl13kKJhcnyfirgBo5Valhw+AqMu2Gt0GuOR2B7i4UTK+kupPOZgiAx23
X-Gm-Message-State: AOJu0YxQGEje8lfU5IOlAUXQCpopFTqJyRLeU7mUifVJL6a6rgIW+Sfr
 Fb3q5Vo3IF/46U1nOMGcqPQdr6blL7q1KGQJ49CSayH7tSxLZZczmOuBSdsASXziZ6jx+PgeWVo
 YTVwNt9Df8+l56aV6LYVpxRflf6MbSn8Zj0fV3QCpNbqoXODF
X-Received: by 2002:a2e:90ca:0:b0:2dc:bf5c:9648 with SMTP id
 38308e7fff4ca-2e9494cb7bbmr32642171fa.19.1716473700689; Thu, 23 May 2024
 07:15:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240506010403.6204-1-richard.henderson@linaro.org>
 <20240506010403.6204-31-richard.henderson@linaro.org>
In-Reply-To: <20240506010403.6204-31-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 May 2024 15:14:49 +0100
Message-ID: <CAFEAcA8t=f15=FQeb4ZVKBDRfcUSS-=YqHETNFrF9U=TnFiBfA@mail.gmail.com>
Subject: Re: [PATCH 30/57] target/arm: Improve vector UQADD, UQSUB, SQADD,
 SQSUB
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x230.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wSJnc7qm3f25

On Mon, 6 May 2024 at 02:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> No need for a full comparison; xor produces non-zero bits
> for QC just fine.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/gengvec.c | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/target/arm/tcg/gengvec.c b/target/arm/tcg/gengvec.c
> index 22c9d17dce..bfe6885a01 100644
> --- a/target/arm/tcg/gengvec.c
> +++ b/target/arm/tcg/gengvec.c
> @@ -1217,21 +1217,21 @@ void gen_gvec_sshl(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
>      tcg_gen_gvec_3(rd_ofs, rn_ofs, rm_ofs, opr_sz, max_sz, &ops[vece]);
>  }
>
> -static void gen_uqadd_vec(unsigned vece, TCGv_vec t, TCGv_vec sat,
> +static void gen_uqadd_vec(unsigned vece, TCGv_vec t, TCGv_vec qc,
>                            TCGv_vec a, TCGv_vec b)
>  {
>      TCGv_vec x = tcg_temp_new_vec_matching(t);
>      tcg_gen_add_vec(vece, x, a, b);
>      tcg_gen_usadd_vec(vece, t, a, b);
> -    tcg_gen_cmp_vec(TCG_COND_NE, vece, x, x, t);
> -    tcg_gen_or_vec(vece, sat, sat, x);
> +    tcg_gen_xor_vec(vece, x, x, t);
> +    tcg_gen_or_vec(vece, qc, qc, x);
>  }
>
>  void gen_gvec_uqadd_qc(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
>                         uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz)
>  {
>      static const TCGOpcode vecop_list[] = {
> -        INDEX_op_usadd_vec, INDEX_op_cmp_vec, INDEX_op_add_vec, 0
> +        INDEX_op_usadd_vec, INDEX_op_add_vec, 0
>      };

Why don't we need to add XOR to this list? Is it because we can
assume we have XOR-of-vector on all vector-capable hosts?

thanks
-- PMM
