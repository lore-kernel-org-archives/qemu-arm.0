Received: by 2002:a17:906:bc5a:b0:a46:bbde:2c08 with SMTP id s26csp1350977ejv;
        Fri, 22 Mar 2024 11:02:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXxUMitnoUk+j9+xGd9QITk/T0yGb2efk4WYRe1Lu+aB/uKr75dT9oXtv5FCxzim2BsLuWr1457Z2dGlwXHN0ALvQJ1/m1w
X-Google-Smtp-Source: AGHT+IEOWA8gJCGftsaOOYvga29vT+bk+O/qD0ZobFC1AcRL5rrztHskm7q4kc3yBA/qM5t2xW8q
X-Received: by 2002:ae9:e401:0:b0:78a:2d4b:3b06 with SMTP id q1-20020ae9e401000000b0078a2d4b3b06mr162052qkc.76.1711130564170;
        Fri, 22 Mar 2024 11:02:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711130564; cv=none;
        d=google.com; s=arc-20160816;
        b=M3iP9MlKEh1ueTbHDlfPTp4MKqzlPr4XJxbRYRT+El4vRypmA9wTpQuR2a+0UfIhgO
         DXQC8zc8ygEI4YHs2Ztemy2c1gGOEsqIGdSfkk7zJhDqTgPHxSrGyQLi33HojGGeI6tT
         J8q1woAwVHLkHhBj/36baytK1l+HCQ0V/T0f0MCpllJ4/ITdxw4DmBUlpA6p1+i7pK5+
         yCzYsnZuK64twHpTEUZFJKJ91A+tWdR0WhlfDkSDnUWXRO+oj93/M5kVhxHOpi5kJZT3
         MGNJvCUSreVnf6e5zLSdJq4VB/Bw8RPI4eYSQbsWdzORoKUcoz1ElDIJhrHPtJz7DG2w
         HP3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Hwfo9mgfzP6086vlEWZX2HXWEfngeTxbC3n9gzuEQ2Q=;
        fh=3aIIqMwDVw73LrTihRo2E+B3uqWoLxy683JcBJjPv2I=;
        b=CwPe447hoqNAnRA8UVJQqxikTBkjEvkTQdNQzhbr93+jOlH05lDMQtqlLoovGXbIyM
         rCtmzBCg4E5lk89DOGEIkvrG3aO5coVPHx3qVxbuR5O5G4Oyp2IFkYrQRnJa4BKaXFF+
         Q/Rkba/rJMwaYdJvAdns6I4HiQVIzWFfcozJOAPhd4QaXXixeoaMvYCvL5qhg4Rypenu
         /FldjFvItkg81CEHd9KUC4lOC/l2h/nwYSa/lHOgKwPwRPoTJ+Fpj9UV62tA6pQwdDkI
         MoAMlmdW18aVqsttLFCpeCJYh8iDFEA5d8y3EJAR5BNNIY+Pmfg7JaC5/Ndq6re4VwRS
         uvdw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rcLsR2Fd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v19-20020a05620a0a9300b00789e7b33bc1si72038qkg.592.2024.03.22.11.02.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Mar 2024 11:02:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rcLsR2Fd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rnjDe-0003Mq-9A; Fri, 22 Mar 2024 14:02:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rnjDc-0003MU-Su
 for qemu-arm@nongnu.org; Fri, 22 Mar 2024 14:02:16 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rnjDa-0004h4-Bz
 for qemu-arm@nongnu.org; Fri, 22 Mar 2024 14:02:16 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-56a2bb1d84eso4341195a12.1
 for <qemu-arm@nongnu.org>; Fri, 22 Mar 2024 11:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711130532; x=1711735332; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hwfo9mgfzP6086vlEWZX2HXWEfngeTxbC3n9gzuEQ2Q=;
 b=rcLsR2FdrC7Cu6HcEUq+7N0wYkKs+8ht5mo/qiygGwENFtbwwOg07BBETyEJMONSPW
 P94qf6TcDGZVePzm+Yz1nCM+m1A7zRi7XmCXjKK/qMu6hlHRmowCQUV3QfWhaLQxzXj9
 0qV2HgVwD69VM0S57GsAlTGMc+Z9ncJr2f/aoeCjn4/jXur3UQonMh6syQ8lfDm2ZjTE
 NEClx6SIqphpgR/X/V3lOEh/SzxIir1L0ximfxoUWUDykSSrE99y9W+1xEFYPZDeIx5j
 JBfSgW3RHqbI0aKMdDtCE0VgLaiEUtRCuvZ4vR3dtwSnRM/f7xLQjMjZ+cxDr7bEduDL
 /nZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711130532; x=1711735332;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hwfo9mgfzP6086vlEWZX2HXWEfngeTxbC3n9gzuEQ2Q=;
 b=mrbLZooItDHGgB8ErkodJgB1Iw1jKeIjmMg8sKcq5QicYg2HchpG9Ne/VuALXk/P8y
 /JCHhQc3CCGHpQ6L7t2LKyW51MPD5u+gKz9d+dCqB7nI0L1iXrd4Ee7eiTCZa5oXIZRV
 4bBpvswpXOgpUdxsBKosaV3z49/SH4Kw2+htVMX0EuKUPvy2Y6lAiC5EebKyUdCdgY/E
 QOabk0Yjf1TThiSCrt/xo7kAXVLiC035osxJUc5Q/yR4rmyPZ1CgbQA4hgCpNSeqSjAc
 r1rlwQOqwr9jN45jfLewRtuoCYk3zaZdb7UkSa3xe8tnnxLArfNaT+mtmR3IoL7wYIJq
 xVkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXd+pJaxT5/e3QFpW5Mo5AHRe7BmlmulybURcc+p032123QpghN4Nh3e81C4KDwq6QV4bTmGKAkNg05+0TvFmqA7HBC
X-Gm-Message-State: AOJu0YzXC7FFTiY7oE4gUMKNfxpUoBQK37APMrEzzbAoASvrND+m7EKd
 enqYISNVezITxWFXKYtkK5R5jj46KTVhw2Cf14bA/JIiBB38f5UNqSA1jjTs+2fIlf0sqtIuGWR
 g87ZHoSgPES3sP/UD2b5IhKFDQxPRJmtvhWRYiA==
X-Received: by 2002:a50:ab11:0:b0:566:624a:9e3f with SMTP id
 s17-20020a50ab11000000b00566624a9e3fmr2287448edc.3.1711130532131; Fri, 22 Mar
 2024 11:02:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240317103918.44375-1-arnaud.minier@telecom-paris.fr>
 <20240317103918.44375-4-arnaud.minier@telecom-paris.fr>
In-Reply-To: <20240317103918.44375-4-arnaud.minier@telecom-paris.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Mar 2024 18:02:00 +0000
Message-ID: <CAFEAcA901b4OZiy=WVk0ggVQ1TF4mCQgoK8c9gES5uW7NX=0Kw@mail.gmail.com>
Subject: Re: [PATCH 3/7] hw/char/stm32l4x5_usart: Add USART, UART, LPUART types
To: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, Samuel Tardieu <samuel.tardieu@telecom-paris.fr>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>, 
 qemu-arm@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
X-TUID: uIDg7M/85Y3o

On Sun, 17 Mar 2024 at 10:41, Arnaud Minier
<arnaud.minier@telecom-paris.fr> wrote:
>
> Create different types for the USART, UART and LPUART of the STM32L4x5
> to deduplicate code and enable the implementation of different
> behaviors depending on the type.
>
> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
> ---
>  hw/char/stm32l4x5_usart.c         | 113 +++++++++++++++++++-----------
>  include/hw/char/stm32l4x5_usart.h |  21 +++++-
>  2 files changed, 92 insertions(+), 42 deletions(-)
>
> diff --git a/hw/char/stm32l4x5_usart.c b/hw/char/stm32l4x5_usart.c
> index b56fee5b3a..f58bd56875 100644
> --- a/hw/char/stm32l4x5_usart.c
> +++ b/hw/char/stm32l4x5_usart.c
> @@ -154,9 +154,9 @@ REG32(RDR, 0x24)
>  REG32(TDR, 0x28)
>      FIELD(TDR, TDR, 0, 8)
>
> -static void stm32l4x5_usart_reset_hold(Object *obj)
> +static void stm32l4x5_usart_base_reset_hold(Object *obj)
>  {
> -    STM32L4X5UsartState *s =3D STM32L4X5_USART(obj);
> +    Stm32l4x5UsartBaseState *s =3D STM32L4X5_USART_BASE(obj);

Could you avoid this kind of "add function/type/etc in
one patch and then rename it in a following patch", please?
Give things the right name from the start.

This probably looks something like "squash this patch into
the previous one" in practice.

thanks
-- PMM
