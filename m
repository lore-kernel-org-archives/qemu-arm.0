Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp466978lfg;
        Thu, 13 May 2021 05:56:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw75ERY3De1ehAACCbgx+mfwfA5qPglT2j89Z9EGWhkvPycx9Ymtl8w5ajqX8W9S01dqA2e
X-Received: by 2002:a5e:c00e:: with SMTP id u14mr27515610iol.106.1620910560573;
        Thu, 13 May 2021 05:56:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620910560; cv=none;
        d=google.com; s=arc-20160816;
        b=n7YUDQT8IbLPyZ3g1wpuT4yhBFyHirABJ/B+BD8Ivqwm/ayosjp2mCo2yVBkZlhWu/
         Xisav281Ck/wDudfM9m8TxESsB0Mes166JBq/z39NRJF+HAVACYnb9FNgm5M9PC1Xd5f
         Vf3daYD4yXOAStwgQCssC+UAdElUyEEmtOErfw62hBKuFYWvpr0y25JmnUw/hsNRJty3
         vqT3PJIIHp6RP1L1R5o91x2ExjJNrwIk6u/muWcWRt0pt2TSxXfLvu+Tz1JTQW8qTPWC
         p8v7ctiz8hZ6qeyKN7u+DlOi3RWwkUm0USTyo7dhkiST1YU0RThovmHfa6E4/tpK1VE8
         P+IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bjGwETyRrcaxYXQpUQGpvNb02HUmdWjyeRqGBHhiYqc=;
        b=zR8RfLF4TJRFbDwSgI61CrjzfhJ/Q8VUWlwsQzIVLuNcq+S4lKrC9DU9RffXksytWi
         G20U1f12p96lMZ3gyRQ8vkq2um3fhKFI//wOxcpguWMZxK1y5pWEuOTVHvoc+OFhazit
         1fCE0Sh1TyOsFrzLWxMCnK67OoHJPLsd7TI3qPrZ2amy/e7EJP7wrjqZpziD03VuBoSf
         prlnFIjYYg3k7ylK9NKlBzeSgrTTLDOZYfpuFObhtuHjT7Qr9hEo4Dl12/YFeddH6eek
         VWRY5FmVKXj597+GGuBumP9OtyMrfKGArhh5EE6T0n3eN2/s87cKfnkC8b3m7zLNOetd
         qtVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BTKhNuLQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y16si3941433jad.62.2021.05.13.05.56.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 May 2021 05:56:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BTKhNuLQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhAsh-0000An-Sr
	for alex.bennee@linaro.org; Thu, 13 May 2021 08:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhAoJ-0004aZ-Lr
 for qemu-arm@nongnu.org; Thu, 13 May 2021 08:51:28 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:35333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhAoH-0001zo-0P
 for qemu-arm@nongnu.org; Thu, 13 May 2021 08:51:27 -0400
Received: by mail-ej1-x632.google.com with SMTP id m12so39739844eja.2
 for <qemu-arm@nongnu.org>; Thu, 13 May 2021 05:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bjGwETyRrcaxYXQpUQGpvNb02HUmdWjyeRqGBHhiYqc=;
 b=BTKhNuLQqC2TRdoSsrCilZbTslePSG3L+9tdwJteZda3Al73ukH3Zw605ouQSCn8Yn
 oM3E7bcOx8kq3xLp1OKJzshbXCy2SwgTifk+8P+omYap3+ciPsix5bx+SzWHU23hbmbY
 xuL7MQMXtm2nXlz8SocoPfxdgu5Zrb7INunJwU93Gtc2q9XI6zdyqUVwL3sBoAcm9iJ4
 T9hZ3dopT2q+Y2pBhX+DTH92r43qTm94nf0QcT2AiFrPgM8uIaPHx8XmzC/uALcjkv4q
 IdohdnUDvqDc0GEDwxdN7yj7aiCb7DYNEr8jkfWartgk9P3tt5LEEeRMbMotKUp3IFy9
 gnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bjGwETyRrcaxYXQpUQGpvNb02HUmdWjyeRqGBHhiYqc=;
 b=TmtllgvX5OjzqBDm49uHbQUYipnc6pDOtwb8TUsYSmIxTIvMdJ+ELDgTy1fS1S/lY0
 prCIx6HFfNh2k/WID4HZfoj/lGQY3ZilujVk7jbxt5r+0hC670ROqOpIWfTPI2mzngiF
 w+Am6N7YDmSoMgS1X5fkWJhnZhdyJm2mvy/RLo6QYLOoBQ3/iBFwFM5x+4lczvX/LKr8
 J++s7DJ4Q+ThtdyM5/X62yiG+37driHT21xc+oodkXnneau37q/6O0ND0BXhMGFQRF3g
 0XI4SWMSPeHzSC2jUImt0nVkRcoU8eAr4rU3hMoja6nkZsuZ7tnqtrXWxlPShCcy0B/O
 Gi0Q==
X-Gm-Message-State: AOAM530L+lRN0h0W0j8kvm/4jZLGvl3ZYhNaldUHgldvunzwi1L0FN74
 z/BqIGoBHyFqAl1cQkRfi0+eyGvaaKizm37fS/2lWPD0sXQ=
X-Received: by 2002:a17:906:d1d2:: with SMTP id
 bs18mr21574981ejb.56.1620910283161; 
 Thu, 13 May 2021 05:51:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-59-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-59-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 13:51:11 +0100
Message-ID: <CAFEAcA-m4zxP38sn+TCsFFy1=u1D38UFzateqkvpFiR2Q0-HdQ@mail.gmail.com>
Subject: Re: [PATCH v6 58/82] target/arm: Implement SVE2 saturating multiply
 high (indexed)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Gj+RrhuXH8RY

On Fri, 30 Apr 2021 at 22:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h        | 14 ++++++
>  target/arm/sve.decode      |  8 ++++
>  target/arm/translate-sve.c |  8 ++++
>  target/arm/vec_helper.c    | 88 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 118 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
