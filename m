Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1425214njb;
        Wed, 19 Feb 2025 07:27:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXE27MscsMIwYWcYURFHAJVyMfjbezyPVU5nUXAK858rVaKc4PBJWMYEZo4RnYo0YnATbAyJj1rBa2U7w==@linaro.org
X-Google-Smtp-Source: AGHT+IGPsXEVX/123havk7Z1ve2EQhVZ8zmGM2exjiqcLTijAcXevG6nF9tV9/uVs6EnAnP4gqv+
X-Received: by 2002:a05:622a:5c13:b0:472:1275:6967 with SMTP id d75a77b69052e-47212756cb8mr14013851cf.21.1739978830603;
        Wed, 19 Feb 2025 07:27:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739978830; cv=none;
        d=google.com; s=arc-20240605;
        b=XHhpSytbp60Wwogr3n8Nfn/ATEA2Ed7l1os06HL1YdnNaSvwyndqWd4Mz8FjxarLKt
         aKUk1rSU8rOyBIvkQfKgxO2lYksbh9tWsMRZcaC+HplrsmeA0vKLgg46BOA4d23WmkUB
         wgiemWrj2XhbYxj8+WNNqs7uTASMMEbb1IBngPiDG7+X2RuIhPTWdLP8TvPs+UL4NvsJ
         2cwtb7O4qdsNzbchih5oG73mS5anyPalGn41UxI58nH4OK1U/jtR8Ctkhas3A4a67Dsq
         C9zsjPdQjfL5XguJOM25Iiwp1l51nKmwaqKGv4fKWQBG6BeOwshjBHJqoDXu2ojPulC6
         VJ5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=F80fi1jt5GRI5yMXWRjFy6Mi+aTowS7IkpzYw+VLrVM=;
        fh=FbZQQ3YghMb00qFx599qj/1VPlrUdzJmBexK+/4LYuo=;
        b=aLsx/jzu18LXf11IMg6WwFLJewVpj76aRm70ruw7hHBuXrL7Oh2bQMXFES+TWxDbKi
         TM+48m948P5fhfQL8AzTuv44fu9PVEKX518XZHneKJuCfETHC3mnwSL+HgM7mZCj/7tW
         A8HGmEXTuM4aCOKKhKJUy/K+/AVmMtHmWa2MGM9xGEdAa2qZBRfG9tRM7pb1ewPsx45h
         HtgrcGYpyqei4nCXwHUjCT9lNnHxgnn8AQkH8kgfoV8ir7iwLz5JY4NzZXm0mfeq7SB8
         mspHhmIv8T49qkum3yqdWInp8LlltvQmkCiuXViP0rL/1g9vrdGAM9FUgBBp3JdkT4OU
         DnIQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NzeOuJC1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4720eac6a95si7506241cf.210.2025.02.19.07.27.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Feb 2025 07:27:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NzeOuJC1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tklyY-0007in-5i; Wed, 19 Feb 2025 10:27:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tklyW-0007hh-Id
 for qemu-arm@nongnu.org; Wed, 19 Feb 2025 10:27:00 -0500
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tklyQ-0007hA-BI
 for qemu-arm@nongnu.org; Wed, 19 Feb 2025 10:27:00 -0500
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-e549be93d5eso7411551276.1
 for <qemu-arm@nongnu.org>; Wed, 19 Feb 2025 07:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739978812; x=1740583612; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=F80fi1jt5GRI5yMXWRjFy6Mi+aTowS7IkpzYw+VLrVM=;
 b=NzeOuJC1VPfkE0t5QYziAi3oUDbFfacRkHKWgitjUh/h6RXwkPOjItZ30iN6dWhmCd
 eL1OLzgPQfTgKgofm4Oqt4p+GzWYvQFIojFKI9bIpoNvDVsp59Ra3vxZoXN8Kee+NinQ
 ZWXqe/1icofrKjY8/v24fe2gMHMixEf/4Mxci7EIKiIL22qgkfxOT/idhzysc4mrLAUZ
 SvBOsAtx6Lu9bkhKWx4CKIJkrbsB3r/EEla8jGSFqOGpagj5dGrLpKHtvZOsNa/Z8lhw
 yCkNaBwqlg2ctnSlGpQSIYlOrh1c7heJycPN72+UaeLFJ+WcfsccJJMfE02J3pbT9DEU
 dnYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739978812; x=1740583612;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F80fi1jt5GRI5yMXWRjFy6Mi+aTowS7IkpzYw+VLrVM=;
 b=SJu3vWPgKV16DzRrzPRGvdO1MVJKDLMwgdrD1oWFeqrRC31SFvISMV63qNtwosEc9r
 UIqFXSaBDMU9UG2Sew564YTEHR8eD5SDkhBlH7dNyvtjD8FDIkFbXvO8YQ4oeeMptCRD
 IGh3KoolNW7CyC0Mx/598sIxp0WTXgdCYj2wonIv+4f73fGIaRqg61TqW2A9Fd2ZoFyk
 J3V9efrGhRTClXgHEETL8azqj4efW09z5EQHOKWy1uJPnXEhRt9BUbq+o2JLVdbuos4j
 1oU6nnzDcSMdVDBgdS+yeV266JgUxkafl9ntdlZ0R1LOZ/gSaI6wMOIVssrGluhuNyjB
 U0iA==
X-Gm-Message-State: AOJu0Yz5qF0R/ltRaVI8rD1SepTg6Hza36jBkPt81X2dUNjQGdRfNYVn
 ABB3wKwZmhGC0sJFMf0PO8HrYcHTbyUxNQCZGUiMunPald8Glz4FxxbrtTRnZSdoN3Q9QyqtsFH
 FOg/CnXrgNs8lWn/85czddeQKvu5hXKKdB0cXHg==
X-Gm-Gg: ASbGncu+9M/59v2RBAuAQy2geLcy2AzZ5ZRbAA2wT7ZQiTpqIe4hmzGoKEkvACiCV+n
 ePUtlFxszIDnoReckDNvu6gNoFE4YCYTu4KmEqmWu6kTHbMKMs4eGZNz/WQEUKZ/D12680cuO9g
 ==
X-Received: by 2002:a05:6902:707:b0:e5e:1062:bcc6 with SMTP id
 3f1490d57ef6-e5e1062bf7bmr1578432276.6.1739978812480; Wed, 19 Feb 2025
 07:26:52 -0800 (PST)
MIME-Version: 1.0
References: <20250218222211.1092072-1-slongfield@google.com>
In-Reply-To: <20250218222211.1092072-1-slongfield@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 19 Feb 2025 15:26:41 +0000
X-Gm-Features: AWEUYZlJOwrYZGC1FKxmrqvtZZH3mwLnKnkEL44TsRMoy3-yljNfUHs31eAO6kE
Message-ID: <CAFEAcA8yrLnyc-CHtiKeXa817qReW0yoJF--Dx=aA-+e0_8Y+g@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix signed integer overflow undefined
 behavior.
To: Stephen Longfield <slongfield@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, roqueh@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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
X-TUID: eD3Y9U41/wR1

On Tue, 18 Feb 2025 at 22:22, Stephen Longfield <slongfield@google.com> wrote:
>
> The problem is internal to t32_expandimm_imm, the imm intermediate
> immediate value. This value is sourced from x, which always comes from
> the return of a deposit32 call, which returns uint32_t already.
>
> It's extracted via: int imm = extract32(x, 0, 8);, so the value will be
> between 0-255
>
> It is then multiplied by one of 1, 0x00010001, 0x01000100, 0x01010101,
> or 0x80.
>
> Values between 128-255 multiplied by 0x01000100 or 0x01010101 will cause
> the upper bit to get set, which is a signed integer overflow. From
> Chapter 6.5, paragraph 5 of the C11 spec:
> https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1548.pdf this is
> undefined behavior.

QEMU always compiles with -fwrapv. This means that this integer
overflow is not undefined behaviour in our dialect of C.

> Though this is a minor undefined behavior, I'd like to see this fixed,
> since the error is showing up when I enable clang's sanitizers while
> looking for other issues.

If clang's sanitizer reports the overflow as UB when built with
-fwrapv, that is a bug in the sanitizer and you should get
it fixed in clang.

We use and rely on 2s complement handling of signed integers
in a lot of places, so if you try to find and fix them
all you're going to be playing a pointless game of whackamole.

> Signed-off-by: Stephen Longfield <slongfield@google.com>
> Signed-off-by: Roque Arcudia Hernandez <roqueh@google.com>
> ---
>  target/arm/tcg/translate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
> index 68ac393415..8770f0ce1c 100644
> --- a/target/arm/tcg/translate.c
> +++ b/target/arm/tcg/translate.c
> @@ -3508,9 +3508,9 @@ static int t32_expandimm_rot(DisasContext *s, int x)
>  }
>
>  /* Return the unrotated immediate from T32ExpandImm.  */
> -static int t32_expandimm_imm(DisasContext *s, int x)
> +static uint32_t t32_expandimm_imm(DisasContext *s, uint32_t x)

This function is following the API for decodetree !function
filters, which return 'int', not 'uint32_t'.

>  {
> -    int imm = extract32(x, 0, 8);
> +    uint32_t imm = extract32(x, 0, 8);

Given what we're doing in the function, it is reasonable
to make this a uint32_t, though.

>
>      switch (extract32(x, 8, 4)) {
>      case 0: /* XY */

thanks
-- PMM
