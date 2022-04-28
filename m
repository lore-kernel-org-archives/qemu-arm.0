Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1636037lfu;
        Thu, 28 Apr 2022 03:56:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxB3XvQIgg0/YRbHj27HTdqYBBjUF1cXgmrPFeI+JVF8FU8Ie4nexP7jcZUgIB9IfQvAlK
X-Received: by 2002:ac8:5dca:0:b0:2f1:fcc6:d85a with SMTP id e10-20020ac85dca000000b002f1fcc6d85amr22937128qtx.72.1651143405458;
        Thu, 28 Apr 2022 03:56:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651143405; cv=none;
        d=google.com; s=arc-20160816;
        b=xnFZtp+dsrNML7qe93H3UWxR4wzM/IJdKURZNx/UXUkauXnnSxCj4CisjUo/qa4aWz
         3JkYDSaRfAb4jPEI5KLTBbQyXQ7zsiqdtG7j7HCo2dMYxBBZje8h3PjEHMFdORv6gdFw
         +kWS7Z99tqpDbaPY0N6sej4UCfsxoNSdoOtSfUntg+9Uwx7H6jsl0AwprsPiIN0ldyfT
         hM2/jWHUJwczXuaOxnXmKJLejrlGZi3YkY69dXtIJDLSOFAvrr+hzpAXmRLFOMPqN2HX
         RiL07aMokah6/hR8NH+NWTPIh51dLDJ8GF+Frf+ihi41sKh6cILru3EOC4DnHbqcjNDA
         8h7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GJlYViVxIXjN1+hVOXmd9bbELYGLDrmcB5v1H6ht3JA=;
        b=WHzW8IQ8satVzIVacsSeaOKz5abVI7xraoCnrNGDhQSs8+MqJBa95tfpk5/wE5oCaY
         HxWR3oEs+/WPZCHq7nOgvZE/aNYvo0/0EPh7h5kT7yJ1VSKptBvYsCeWsP0RXlK3dLSP
         DLq87oQu+VU0F4ivXOGADtT6XrzpkaQgq6FMIePRs9wQJYbXOI4H7gVUKkH4v0PTc0gh
         qDWOTSz2a50Z6eoh4Bu+6cBJ3hpB9P/w7Q1fCSFHgi8m1hCjUnoxMAT8C9cBgOeOKI08
         jiElFJZC1XNnQ57P80q0pjib7OyDKsXrLTy4lZ82XaGecLNeoH6ZWC6Ztes4AJfqWzuG
         Jbvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T8MzkMx1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x4-20020a0cda04000000b0044110d4e889si1481109qvj.26.2022.04.28.03.56.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 03:56:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T8MzkMx1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk1pE-0006mv-TE
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 06:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1Pw-0001FH-Mn
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:30:38 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:33767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1Pu-0007jJ-Jz
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:30:36 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2f863469afbso23626577b3.0
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GJlYViVxIXjN1+hVOXmd9bbELYGLDrmcB5v1H6ht3JA=;
 b=T8MzkMx1Nm2Rk1Ux16kqbTnBR8N4gzkp5NzLJAl/7a+OlqL5HVI5BCfMyjoF3Zzemx
 XW+/pbEfE6VxK4WWo9dsgxDwd/I1o6LQphaMSigJmzlpseP/vKHWAq77dv+1x8zSsqQS
 AdvrXrWC/ICUX0lgOq62F13CgDajIVCF4rn1V1tdczMq+omWVK598gNl3X2W+f487iYp
 4hGs3MVXfoIgwrTyR7pC6qIXLSZ/p6hJlsBxBX4rkP9wOEY7w3RrVJFEeCSlGfBCOXV7
 gtbOOzhgf+0O2nWfuCjle4+rjnCFqOJoSYDhstU29NnjWBMkbHE22eFBfnf5PKuw2kbH
 HYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GJlYViVxIXjN1+hVOXmd9bbELYGLDrmcB5v1H6ht3JA=;
 b=j4REKkjb1ITSUEqMPrbXBHz4FNvCLglPs34i9xCuWEVXmmM8xgqaaLEELR8iebDE2p
 MJKpwt6kk7lUBSAVTfFN2aqxYvwEjYmzMPnbj6N7pUI1cKbUG4YkyLLmcjhqR9p0vflJ
 +CZwZf1rrteP1Oj9uDon17NCyooH01Jl2dRi0JKy0j6Yni9AeqD1zpWNwcTR8C0P/K0d
 jrKjmGHVaRIT/yyZ4XYih9rPRTd0lNYj8KLIbUzlL86U1KDv60K9RlGzMTlpXOmCkpyV
 rZri/PLYQK+FbDW2s1YWoaravnnaS9clk3JzFMvrJw0VoMflK0bQQkiIMIX49uGiMpOY
 TapA==
X-Gm-Message-State: AOAM533UHSZwQydb6giSW4eq7Q1I7jDsPVJTFbseeVnlFUwEPQZ8jPdL
 Fku+ndh72UrG+CNPkvAKwRKKpJfP+d6S8Nlp0r8nx3FaRLY=
X-Received: by 2002:a81:6642:0:b0:2eb:c364:b8e1 with SMTP id
 a63-20020a816642000000b002ebc364b8e1mr31166606ywc.64.1651141833678; Thu, 28
 Apr 2022 03:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-30-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-30-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:30:22 +0100
Message-ID: <CAFEAcA_GZDvX-NCoCVVrRRKHeBXgPG8E1NtaS6Fe609PDNLAuA@mail.gmail.com>
Subject: Re: [PATCH 29/47] target/arm: Use tcg_constant for MOVW, UMAAL, CRC32
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
X-TUID: spRnG2Q2b9iZ

On Tue, 26 Apr 2022 at 18:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
