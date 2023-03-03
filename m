Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1389189ejc;
        Fri, 3 Mar 2023 10:28:04 -0800 (PST)
X-Google-Smtp-Source: AK7set9Ict72DTU5y3SZ5hAlrDymAGr2fTxlOIyGv+25nfKbaOJ4ip07VZAkXdS8eOUC+qpx9vX2
X-Received: by 2002:a05:6214:21cc:b0:56e:b1d2:9c2a with SMTP id d12-20020a05621421cc00b0056eb1d29c2amr4480253qvh.28.1677868084060;
        Fri, 03 Mar 2023 10:28:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677868084; cv=none;
        d=google.com; s=arc-20160816;
        b=dWevGufLG9/vxaMMtDjmFWQc2qoNMT9XZDGw1lTkSoTgdv0IpSDO9aimYi9+Q9fFPe
         ALIVezZ8vg9ePbwxn1iSt8Rw0TXg58FMoZ64ciLWaiQYW17pcf5cwk3fhtNv4NWymkyD
         n5A2E5+36rIV18AvD7CYtiEAhdxQ4IRSuHalvebF1So1qf0asf6hcOffw3popArgYGXt
         RpCKvcDWS8HZXzMV0N0YAPlhMF/S2jMY3ANJvOfIt3+NBUjf6CTg01LgWxVsfpX+e5NZ
         OYHWfKAbUNGB6QzgbZdaM/V3cyo9MYsWO9dWi3T3cScQIDjGE3pqR76wRa+heSKIms7W
         tPlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=X4VLl2CDxTjXb3LQSI4/pgGmc7rKupnLRH9WiHNF9Gk=;
        b=jhcaG4FAkbvFpjokqcgoxYfYXN0Llejjr74r99yIN+ZcIbxhgTa8VRXcSFQUY5fdsO
         ltPFWWet4oabHYFgZHGVwDRjIbkchFWELKpJekUa2d1fwarbTJljdxTJj+lVITKr2Gl6
         T7QScAk9JES2nhuKn3E7CqvKTJhcQ1cbVaxC+b5KFbDUFdjVtu0qFmPhhQhGCJVP5aLL
         /eMctMZiXkLbk/72rvqcJ+2BEff4udc3EAUUuh3sLAmqoxjCRWP/vsF/J274yEnZW74m
         551CFjcbZyfPxuUGXouYTyU0bh0aF67JPA+R6Vfrm3X80mb5mnm3EWlCNmE0M5lh5MUo
         LAhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PZO92VnW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 194-20020a370acb000000b007061c7f865bsi2125593qkk.5.2023.03.03.10.28.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 10:28:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PZO92VnW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pYA8P-0001P8-HD; Fri, 03 Mar 2023 13:28:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYA8H-0001HO-G8
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 13:27:53 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYA8F-00035C-P7
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 13:27:53 -0500
Received: by mail-pl1-x62c.google.com with SMTP id a2so3662669plm.4
 for <qemu-arm@nongnu.org>; Fri, 03 Mar 2023 10:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677868071;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=X4VLl2CDxTjXb3LQSI4/pgGmc7rKupnLRH9WiHNF9Gk=;
 b=PZO92VnWC5+/GRuNZaOSoKRXuJdx17VekQvN+KnJtsajSF/qNxwNL8ilql7beoz+sI
 jsrr5PqGFjJc0w1GOMYfUcYOa2UzghjdZdNfW9RQaeWTQBVnLstjA1ZlgrTJEfFIoFTj
 AqWmtzShj3AcVjV0rF2jeJbQ9Q1hC7ZPlaD2WqsEstbdp5vVA3aecYqh8wnDSGYWiC9H
 0rBPYDkQ+1BlNzwPimaWKkX4+nmqkSFkZRX/zA9DNw2eQ1OjWm2fnh4jygZm3QDS5yvu
 3NNraci4TFV8D4SEFCRJtsTYeW8czVgI6nmyhtmJAefqMF152Y7Da7XB0TfSTgW+atdm
 jjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677868071;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X4VLl2CDxTjXb3LQSI4/pgGmc7rKupnLRH9WiHNF9Gk=;
 b=E+c1CTcyeRyNYl3d5ArdeSaw0XHYFOHUIICnxppQ1mjEf1dHH0JqJv/bIcAZcatjl3
 XvUqnPtaYDzb7LoOKWxKFTdU84td9Kp0m+T8EnSrCOyWTM9ypcQGnpoAhEN8/SV95P0Y
 EUGKTVewP04fSjPws7Em5/WA54AoAY9G9NJAqL723+YTCtrY84liMv4khOkILMBb/QDa
 eMecVLoEHlxKCL/WPFmbFMYwN+hFgFc3SzvPmpiexW5csR8krWVQMKUDulMYmNaj6oFM
 /bcXtqTFe7JPQrpIwk5iFYEJQv7BGwXxU5sdD7+VpyDuGK1ar/DOWO8AWVteHRzPNu8B
 99vg==
X-Gm-Message-State: AO0yUKVkdG+ZsDuueA2CCmixjTAAOM3wpVU7gtyn0rrB3Mvsbr4VQYB2
 +F74cjE5KK1Vde3pZiVWGqQmXnoTMtUTipPJxnbi0w==
X-Received: by 2002:a17:903:2616:b0:199:4a4f:9d2a with SMTP id
 jd22-20020a170903261600b001994a4f9d2amr1075307plb.13.1677868071039; Fri, 03
 Mar 2023 10:27:51 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-18-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:27:39 +0000
Message-ID: <CAFEAcA8yj3+Kw7ZxZoNrRUbeCdjU6RpVi=t1e4d0yRybNH8_3w@mail.gmail.com>
Subject: Re: [PATCH v2 17/76] target/arm: Drop tcg_temp_free from translator.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62c.google.com
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
X-TUID: J/WRZv6gjBWw

On Mon, 27 Feb 2023 at 05:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.h | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
