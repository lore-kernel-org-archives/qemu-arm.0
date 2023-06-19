Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2818842ejt;
        Mon, 19 Jun 2023 06:45:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5hDQpGiFowz8r21hFCpxuN/lkIvYBPiL1u1n7QmtHMhqz5lIjx19xsU3q+xVvhSW7C5xfT
X-Received: by 2002:a05:622a:1c4:b0:3fd:de89:1fb with SMTP id t4-20020a05622a01c400b003fdde8901fbmr12240490qtw.67.1687182322662;
        Mon, 19 Jun 2023 06:45:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687182322; cv=none;
        d=google.com; s=arc-20160816;
        b=FCdOFZtzK2IYD9xZxDW9qtWXq9O/gQkRmfU8REWgHS8N2TBz1SV6rKvVTElmMnhpzj
         lmf13lKhQc5qBDzGfqFURUY8p29ZVf9bB880m0drHG5sCgAYzGNS65lKX4YrD17nmLnX
         A9xSvib2RXw8bvg8l/gXTiqC/OdvHMJFJGvxs4TFBPLY93Lp7k7451O4eDQzDW7rV8l7
         3g4u/PeR2/jkhbheR5Qafu7Idb7zsn0g2or0mpXLZg6hvrvj7+atLrZcATRc4/DWszW4
         8zEF/7Ov0z6OA08KVaz676YKSKX2dlwtf+5PCi3CNQapVOdO9iXyRjRswyhj1yrzXYNp
         uQlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=7yDQnwe+pqE5E+Xpo8oKLCJ4tiyERQoa8z2BYvAWQG0=;
        b=Nbly6+Rg3KBSmoIJU1gaIeuanxCQhDSPWCmwyDWjEFM05gaKY0DmH1+dx9dN83UhBv
         cU3kptqGS/twdnLNfUVBqGKahZ3subH54s8Cz8s5xlgEDLbx95s0oIDd2/7+sPbWyPsv
         r4Kmg3tTEXAhXFfz1lugKQkMeVpe3fW7OaiflyE6SPXrkyOnIOZGX2eYU0HAKtTTRSV7
         eJFv0AExSh2Is6PPOL17hU7UD2LSeFiTC0wRTVbUVuh6QTWIEDc+a6aDTBMFEgbAsp/q
         Yn6COqMu2UvOYGIisIpQjsfTYjbwLsZ7oJYRpz9EIZAhIQAO8vT/wvLEVnw9ptKGYWNi
         YyZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b0osIN35;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h11-20020a05622a170b00b003fddb499f7esi2004742qtk.751.2023.06.19.06.45.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 06:45:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b0osIN35;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBFBd-0000Lz-9p; Mon, 19 Jun 2023 09:44:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qBFBb-0000Kq-E6
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 09:44:51 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qBFBZ-0005fG-Rk
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 09:44:51 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-51a3e7a9127so5967459a12.1
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 06:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687182288; x=1689774288;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7yDQnwe+pqE5E+Xpo8oKLCJ4tiyERQoa8z2BYvAWQG0=;
 b=b0osIN35Qnhk6g3TYupQ1W/u6pQLAUrMnIqvG4dsmfSwevQEWIuHHdQ700zuC09Vpo
 P32Q04XpI0r+XW2h50v8WsgUnV80oifU+D4/gGaDnGRCmRf9t7zbkQb28+hgPZFNtQ8g
 zy/qay45nOnH3xo2R0ZvmWjbIdfVgSRyLId3Ep6Hpn5w3PLUJmAwp+8+t+VFsm94OIcX
 URnFAei4YQ7zvTSQlYO2CNeawK/X3HRIDwIyl2w7OK7UmF/jf585YYJPQT/DDUuHRYY9
 udfw0jLpsXYvRf8ZXUsMj625pIU9bem4nMZ8WEY5M2Xbyunfp8l2cXjmESuvwwyLeF2Y
 SuoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687182288; x=1689774288;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7yDQnwe+pqE5E+Xpo8oKLCJ4tiyERQoa8z2BYvAWQG0=;
 b=ILSOdpj7nhynjZSfRq4TvCW1VFNPDfzOj95bmnfAvUhh+zf1NN503QjGWTim1/iI6P
 a+O7n6gopFCGey1BznWWDOpIA79lkcrTGBmU5gL2jLQO2mh/cB/XYwjgjkgarrKG5qNP
 ws33FjWW2BPtyvxSY08hE1Q865ABfaoYG3y2/nIzVRt1IdR7qFoWSJqLm6Yj1s6GMSkb
 szh5fxJIClTZRDOXImYUhmes9vIJ7skfC3qmKjNt2fJm1p0bIZD/J2tszf0nnRSajOav
 syGs4cw8KIZJTpMfKWUtWkH5Ux7qEeaJdFYgPMhk9VoY+51mb0k99J0FJK2MbTjFC0kx
 6+7g==
X-Gm-Message-State: AC+VfDwUsVJLhMPprFotqsVozauPyykT2st7PpXE21ORuKOGmPcrSyA7
 Q+hJAFDcZuddfNPTPGP9L14NrI/mXpIHR2IuA8gHwg==
X-Received: by 2002:a05:6402:2683:b0:51a:4c1e:c94a with SMTP id
 w3-20020a056402268300b0051a4c1ec94amr4305318edd.2.1687182288129; Mon, 19 Jun
 2023 06:44:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230619132548.400875-1-richard.henderson@linaro.org>
In-Reply-To: <20230619132548.400875-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jun 2023 14:44:37 +0100
Message-ID: <CAFEAcA-TeLU36SqMK27xpPg-NLLvG5+3UmHbUa0SJFWZF1pjZA@mail.gmail.com>
Subject: Re: [PATCH] accel/tcg: Handle MO_ATOM_WITHIN16 in do_st16_leN
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 4tNRbLOMK/Mv

On Mon, 19 Jun 2023 at 14:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Otherwise we hit the default assert not reached.
> Handle it as MO_ATOM_NONE, because of size and misalignment.
> We already handle this correctly in do_ld16_beN.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>
> Fixes an abort booting debian11 with -cpu max.
>
> r~
>
> ---
>  accel/tcg/cputlb.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 5e2ca47243..14ce97c33b 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -2727,6 +2727,7 @@ static uint64_t do_st16_leN(CPUArchState *env, MMULookupPageData *p,
>           * and so neither is atomic.
>           */
>      case MO_ATOM_IFALIGN:
> +    case MO_ATOM_WITHIN16:
>      case MO_ATOM_NONE:
>          stq_le_p(p->haddr, int128_getlo(val_le));
>          return store_bytes_leN(p->haddr + 8, p->size - 8,
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
