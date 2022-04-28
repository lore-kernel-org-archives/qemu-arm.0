Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1651774lfu;
        Thu, 28 Apr 2022 04:22:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMxbkoet8MT9A6uDtoh0SiKfNP9z/bwxCkYfggnuprVtejRnlcaMTNe3NYbPp2qtezSscm
X-Received: by 2002:a05:620a:858:b0:69f:9bc4:1db5 with SMTP id u24-20020a05620a085800b0069f9bc41db5mr3156620qku.206.1651144972203;
        Thu, 28 Apr 2022 04:22:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651144972; cv=none;
        d=google.com; s=arc-20160816;
        b=whiCsKCctf3psgsjZpwCgQdBMqKl2P3soahYgE0oTZX4dMIXNAQDO5OhH3xt6Y8lOj
         v41KLCpTAIylfUpiLLxnxseRZ0+2VROM+cCO7zU+Y5yv4itw7cquSnXYZznqPpFB3pHb
         ihq7M67PLLibdLv8d33Id5A7nmTPsG7KepO4Leu5QkF20BPn09hm0hPDo/Ad6h7/s4ES
         JFU9y3LQwQ/T5Tc5FMh10+H8Or+Amd8uT1p1Nsu+xmwS0cJymg8QmeP1cq0EeEmarP/b
         GWI21ZFYM3a/JuEqJPkPNFmuErpzOfiXlDzpnbDW8cp8Fp1YlkwWUodU3yq2rUx0kDfP
         lmiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kz+HdiI0QfviNhMY6kKXjpnlLpPvpgsn/wVsUMjvGEM=;
        b=z3Gj9jOg2vuYX3iQv2RVdS0y5Fvv1ICmHhIu0ZOOo6LZoCfFSZaeBWuyv/1b4HBD4l
         h2XMGL7jq0PKBUV2GYwShcdTim65Gx2+TuEsd2Pd3M1vJInm+sV1THNQZZ6QOQcH5G2j
         lPnyZW1A80aCgOjIyX2my0DtuY4zWTnzkJ5I3oZEBrko3IrqHCuMsmL6KlcXAPGcGMwP
         kngr3rdiv/FZJU8arydQ/02hwHLjjSKYYLuumueZ6vwKfSKgRj0OknD3QOZrQIZ+FhvO
         MtpdehJknl0Z/rb660GHkmoWvgnaGyrqXJyOy5nbAPl5vC7eefllTRB29E6N+y6LQC/F
         6pig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cMZGanEi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b12-20020ac85bcc000000b002f386e70d37si1248626qtb.153.2022.04.28.04.22.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 04:22:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cMZGanEi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk2EV-0006yP-5c
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 07:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1X2-0007TO-0U
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:37:56 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:41091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1X0-0000Lh-Fo
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:37:55 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2ebf4b91212so47910637b3.8
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kz+HdiI0QfviNhMY6kKXjpnlLpPvpgsn/wVsUMjvGEM=;
 b=cMZGanEigkbXh7cAmuEyG3OTwsJbdfx9/GG2/XTxmpfDiGPvCEL/8KaXCeGU86Kaax
 7bHrreWw22gfabbmZ8wPXQbEzqpqaSDIE30Vv+remOwDSnASjw7RdGdc5coV5YELEdxw
 O/kPS8kH/F9U57fki6xCNhZmbpdURgHwNAcJj4fQ6BSEwNalejZA8CZraDKdPkJmlIVy
 /9B1lsCApERPOyF/YwEUmbZcKn0kT40ZEqsSDXLibohMcfINsvJWLkoX6kJG5jTYRC1D
 u1yBYCbDk4wTr4iiTzBvi9+zLplZCrdM6hvMUJXwZrE/PPZsLPcQiTdqFbGI1l8RILaq
 jnHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kz+HdiI0QfviNhMY6kKXjpnlLpPvpgsn/wVsUMjvGEM=;
 b=XjmEbjyh44B+skZfepGmzWJS0zUqjL6lwXilV782ZL1VH9x+/d5b+qmEjj86Qu6ymK
 ggsRJMGlsvU66kMNFFlKqxbs9F79PZkeFnFCi+MqgigU5qoYtS9B/DKkWjWKDqCD+eck
 FFAE8ORYPVK51+kLwndxHPYelQU2y0QkEuHjiip0hANEnevQrJImKkQZulxmuwpRsomN
 wBG5sW+1DAGaIDwW3HDK55rtjRMB9m4SkVumviu53KnyDBjMI723iQCs/N7Tx5VMK6UK
 +MzoaMB2zXurR1mnYs/5M5sJFQShaCES1eFC5/LI11+GkEKpaUTokFqylDYxwJnK4y/A
 qb9w==
X-Gm-Message-State: AOAM533XbnVoiN96TKwi699+fPuPs+N9Y81b63OB+/zN87tIbQoMR/YA
 XGhe8ApvGxmgNCy4fyGJMcqYkop7dLI2MIVcDxSDAA==
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr31817056ywj.329.1651142273676; Thu, 28
 Apr 2022 03:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-33-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-33-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:37:41 +0100
Message-ID: <CAFEAcA9tRcXCUMvBaxLKB5L9J2wE0aQyuLMFjQngO2jraK__qg@mail.gmail.com>
Subject: Re: [PATCH 32/47] target/arm: Use tcg_constant in LDM, STM
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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
X-TUID: rAUVTbv2axpi

On Tue, 26 Apr 2022 at 17:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
