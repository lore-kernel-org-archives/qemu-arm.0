Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp531810lfb;
        Thu, 9 Jun 2022 08:53:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPCwb6Uk8XTyKSiRnNbHCvGasrmeKTWUyqApashgzl677ht+afVe3wvT3AVG9Bc1drmxcZ
X-Received: by 2002:a37:f90d:0:b0:6a5:b72e:d2c9 with SMTP id l13-20020a37f90d000000b006a5b72ed2c9mr27452012qkj.490.1654790031769;
        Thu, 09 Jun 2022 08:53:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654790031; cv=none;
        d=google.com; s=arc-20160816;
        b=VzD1XD0h+Vuq1YzvUhN+Mr12j4cb/rc/jbah06vFSK9D21e1HjwekhkTDbern0Iyia
         8z8fLqxqH2c7NxbC5cABcnndFSF4mc1lbA09j9KlXTwNyW+hKf8RrUXOEgH4GqzVg8gq
         6w0/uzGCbsWtDPmJOE3O+m25bLbirZ6yapXF31K1OtLvE4+WsgyHuXplHKtGlK1vjCwm
         sWrfgXzLHsLTKy4vihrUHsArLkGSvnK7G0ft4C1wVDbut1UX6f1BIFj/iJCaLSLfFv+q
         2VrkiErpO+TZBQfqq6K98Q0B8w4K5RqG4+NFGoMEjI9diR4ekJ2vvpg1SgPgONaY/VlV
         2HHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Ov63eAVJBglImIR+1yeQbxz+fscXZKeiCnALtLS2WS0=;
        b=k/aL+nSccqL7SyTaO567Tdq++U8qKXAAJHEfwPm/yGI9RPU4ZC1Ptygq7InnQSAZEj
         +fxBeKGdSKdYx/HAzmQ/gDspM9fONpBmqcBfwiA89eZD7lV+DxNczCdZkdkjwvZGlMiB
         J0otSFGqPmImqvQj5Jf3kuze3mT1NaN/FFIAQSFyyZUppCc26wjO+biReKuaNcWeQ1wO
         V9JUX6aXFf43C31O/G+zf/h16BskfRg5GF/i0sKM/2ujl3kWSu3gIXiosIxwY6xG9t5F
         //c46a4RujNFtQ8yDk8uTLz2EOepMuK26SA4bI0KnL7ph0/magxoQ1K5d5uP875mShjC
         Pa+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dfsPE2av;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v4-20020a05622a014400b00305118d30b8si816542qtw.208.2022.06.09.08.53.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 08:53:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dfsPE2av;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzKTn-0001eh-7n
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 11:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzK9i-0007To-0E
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:33:06 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:43673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzK9b-00024L-94
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:33:05 -0400
Received: by mail-yb1-xb31.google.com with SMTP id l204so42358745ybf.10
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 08:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ov63eAVJBglImIR+1yeQbxz+fscXZKeiCnALtLS2WS0=;
 b=dfsPE2avyOhTRWwyeJLOd8baQ+dBNygYH9x3JmkODIVVgfJXs4D4XvbUmPcnHtc6pU
 mYaqR/A1p9M97/F4gsFsDxv2RANEOT9Zjttk7a9ZkR8LyQacOdLKBqMxbyc8k94YVXzc
 AO3nrCQ6EGJ1MAn1Z64XP2A1KorQzaSJwZ4R7TOKXh3aKqjuxpRqitzmFzZtYA0r06ZP
 cGHikpopn8e+5bRfjK1J1NJEdlWTdHMt/E8x9H/XGEXZI0myMJhlXhIKfktoeSvTgWPk
 8O2aOWJeiBSOrU6QI0ZZ1hKW6ZwItNufF5F+kfQrUhfupNgNWdXocXjgTVb5kncBkinL
 hLBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ov63eAVJBglImIR+1yeQbxz+fscXZKeiCnALtLS2WS0=;
 b=bfRFQwAecvYZAH6HBdI/pZ/7UH08iItAmj3Yf27Nwr483en5NkRe1+1/7EC2sxTiNG
 ozkdVpOz/Rvc5Ko6Gw2eAQvdkTO/1IK61s6/8fDfC/mDaH9pQXU3ND1HgXDI7yy9SPsB
 IXyNRMtGb3oLwoN1Mjc5bETFfGKkhV2HDt6iQpQ/47FUYwBna4jgvoBrX+1Yz37H5+8D
 QbgFiwD+wZTFxkCgDRmsWc71ul0v+X57Skpx9EZzU+ndV9JrFCjXygYMWS1dTl3q9XAR
 ymTOOfLUcnGgjAjYKGiEflaIoYdjAspOr6rOrsIexwjqEftanryktnLu88WN6QDBGkX5
 UzwQ==
X-Gm-Message-State: AOAM531AcfXhVvmb6KxTmmGLM+RHErpwf4uNf8UJRecZjs3VXDIufuHH
 LiZzDzs9GcW9F1CyOf5bynQT0U1qGbl6eeH+nT4FDA==
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr40794099ybq.67.1654788777225; Thu, 09
 Jun 2022 08:32:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220607203306.657998-1-richard.henderson@linaro.org>
 <20220607203306.657998-38-richard.henderson@linaro.org>
In-Reply-To: <20220607203306.657998-38-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 16:32:47 +0100
Message-ID: <CAFEAcA99yzYUW8BO3BTwwm5_JSYhcCtZEPJA=V-W9FqChrqY+g@mail.gmail.com>
Subject: Re: [PATCH v2 37/71] target/arm: Add cpu properties for SME
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BW1akU4MTRCz

On Tue, 7 Jun 2022 at 21:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Mirror the properties for SVE.  The main difference is
> that any arbitrary set of powers of 2 may be supported,
> and not the stricter constraints that apply to SVE.
>
> Include a property to control FEAT_SME_FA64, as failing
> to restrict the runtime to the proper subset of insns
> could be a major point for bugs.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Still missing the docs :-)

-- PMM
