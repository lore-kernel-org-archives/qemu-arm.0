Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp577798lfk;
        Thu, 21 Apr 2022 12:06:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHnATl3pJVstUGYW5qSbqrTYJEABekTieTHqnVgj5CG70/771MQXYWb9dBTLeTMYq4ppaN
X-Received: by 2002:a25:bb8c:0:b0:633:93f2:ecf6 with SMTP id y12-20020a25bb8c000000b0063393f2ecf6mr1186301ybg.54.1650567994577;
        Thu, 21 Apr 2022 12:06:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650567994; cv=none;
        d=google.com; s=arc-20160816;
        b=zRCUTb6wUIRJxgIaJVkgbyu19lzFUnxgfsBgzwhefTR957SfcRcXh7O2s5ENNChcpp
         L2kFuC71V2sWV3QRnfeHEePfuCELWIJK5+FyR7OR1WOTl7kn1AgQq7QYjbs8XH1GDV4F
         inUDpPVKnsW7gjg1ePnLESurwmPuJaYIgE8HFDEEx0j2nLduC3ORRbDDCpnwxZsrC67M
         uisMDuUP2RhQbb+44Ebs2MAin7zkPWSgYwDmTOf+nz9bWAAjxkM2cBV/pqPnFPuXrKFn
         Srne7jwEbhJHvhwZs7UjYZL+3ZOvYi/5Ov3UbXgcYON+9VlvecoR8NreBBff2FmDQzgu
         Gn+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dKAqNwSjuF4Jer6ESkumxxdY5oMxfCCe6OlVsGiKvn4=;
        b=br1VQguL7bvH8FeGDzDDg72PLxqnsMhHMNipI0ar6qu1WLuGYBDr4HV04oCwBP/vDo
         ndxOfpmTFfmubxYqGL9sKhYxyCogzSKvwu7Yg0LD8Ep1SJIWwMg1c9ZlO1KF1LklDTC6
         I560S6ObsXQAFSbkgEvLMgtXpFIUan+6zU7nxPxnpj9ENfLmBrJ41dpIN+aLQujfWp0B
         HaeBnP6Ji/nYLVz+tkwNJoQk2SP+PulleZ6ZkAskcM2yBebnWBxSMB76Of/ueYEP/JpZ
         nMlAnlKAi/7N9cBKxFR73EhVgAzB5VCF8db83Y4xeGQU1tlpMQKkOZbkgNgp0BhUhlNr
         m9ug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vf9U9zlU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a6-20020a254d06000000b006339940460asi1553973ybb.628.2022.04.21.12.06.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 12:06:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vf9U9zlU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhc8P-0006pY-Vr
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 15:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhc5Q-0002cb-4R
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:03:28 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:38878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhc5O-00017K-Kp
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:03:27 -0400
Received: by mail-yb1-xb35.google.com with SMTP id v10so1627352ybe.5
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 12:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dKAqNwSjuF4Jer6ESkumxxdY5oMxfCCe6OlVsGiKvn4=;
 b=vf9U9zlUQTzG4l6HX1VCd0mHCg3v+FT8NWmsNG7M1cT+jyA5yiXIQ6oqzVqwBL49Lv
 v6MgHoFn1LLZXVT6tbP2SNq7MNIi/X3YYukzTO1xAtFx0qIy/OG8wT2nDRSY5l/6g+Sa
 ZjPcc/g2vwIPc/lYG2NgNNnlaZl81IQhSOBJq8z1hHh/PeOZNhe47o93ehtOlWr90uOZ
 VvxOjgwJIaEmXhojPCc0FpigoSlM4oeMuGNM0AaFkKHOUk2q0rI36Pvsml2XW/0hWl4M
 6tINRcGVEIYZanK8hTuBlSs/mCNblwez9KxOigt/KZjn13rvzHj4LEP83y8k6Nrxgq6f
 cSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dKAqNwSjuF4Jer6ESkumxxdY5oMxfCCe6OlVsGiKvn4=;
 b=YtBUoEp444l7+oNu3L4nLq1/YKUPghrxdwP2rnqwCjJsmBHlGdANh+egpT1ZOq95nL
 yBDx9A5nCDJ4WXX5mfYIKw1jRNGDjoe0deCjel5iH2R5I2WTaqp8tXRVzJUd9TstfjYs
 VcDrhVDTY9g0yQObzQ2Jd2B2vCsT1eDkqoa581gZaKfTm0DXsRdHvlupP/6a2qThktQ4
 Fp8GH/ruMBxaH5jkkmJiQbkvF/cI8BspGTE68PMJ6PcGOb5PfIZOXqZnG3GJgyfqKOW+
 e5cKfWTgv6aAUA4zsqjZp1PPUuOtFC4QIBpymZuSO/CRqJ9HiYVgAMB3CbjrFHVM8FJe
 8ZeA==
X-Gm-Message-State: AOAM5314POseafqsr+wm2AXogIPaP47ybtnnIFRGc9oMXE3/WjivFkwJ
 kk59YC41SMiHSS5XPCA0fEsTcF4uZdwudgxYNx9LqA==
X-Received: by 2002:a05:6902:390:b0:645:7d46:f1db with SMTP id
 f16-20020a056902039000b006457d46f1dbmr1161896ybs.85.1650567804574; Thu, 21
 Apr 2022 12:03:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-19-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 20:03:13 +0100
Message-ID: <CAFEAcA9VN44x5JwvQTQchixsCz_tG7-bwBGShrEwJRFrU8x-TA@mail.gmail.com>
Subject: Re: [PATCH v3 18/60] target/arm: Use tcg_constant in
 translate-m-nocp.c
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sYcR9DqvBXst

On Sun, 17 Apr 2022 at 19:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use tcg_constant_{i32,i64} as appropriate throughout.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-m-nocp.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/target/arm/translate-m-nocp.c b/target/arm/translate-m-nocp.c
> index d9e144e8eb..27363a7b4e 100644
> --- a/target/arm/translate-m-nocp.c
> +++ b/target/arm/translate-m-nocp.c
> @@ -173,7 +173,7 @@ static bool trans_VSCCLRM(DisasContext *s, arg_VSCCLRM *a)
>      }
>
>      /* Zero the Sregs from btmreg to topreg inclusive. */
> -    zero = tcg_const_i64(0);
> +    zero = tcg_constant_i64(0);
>      if (btmreg & 1) {
>          write_neon_element64(zero, btmreg >> 1, 1, MO_32);
>          btmreg++;

Looks like we were previously leaking the TCGv for this one?

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
