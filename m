Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1598413lfu;
        Thu, 28 Apr 2022 02:39:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHC89vcvjXL0DztIiA99qsABWcQVIOjwVjF4aQSZwrJCx3xUOPNXkoTXBjFW1GcYrEhjL5
X-Received: by 2002:a0c:8151:0:b0:42c:2329:91a0 with SMTP id 75-20020a0c8151000000b0042c232991a0mr23450993qvc.107.1651138751261;
        Thu, 28 Apr 2022 02:39:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651138751; cv=none;
        d=google.com; s=arc-20160816;
        b=WpvlQjnqu7yAAmpYM6sSSDqJwoQJZ2Ln5aik2hhtyXxF0RvVfudmkvuE0lItj5o7Gl
         agqgKf1HXmhD4HC3AfhdKJL1J/WPw+3CoqjerrzULxVGQ1s/9W5mtTL2C4Zjvfy9ovLQ
         0niTS4w5R0E/P7EfmW46CyJM3afORXqRP27Ettj1Lp23NlK+cqS2RP2SyzYe9C6S9Bhz
         vPv75dNVOqpPKbUtpmwhpwwCN2ZR+UCBGi+eYlOg1kL0+8nFz/tCt0G6pRSKAzogJH/Q
         ZS6m3B0V47gLvu5ltb1w2rdAT21MgYcnjU67ZmgLsPB5XNZA50PeuAEnHa5d5crF121I
         CqIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=moyXODMe1Ia2De6nxT3cgL1euDBOHHq4varns68EEaQ=;
        b=BhH0iQ5x5jAif0WkhHebuUEx+eSRA53tERY68q8nCc6dCjCgrB1vRIhawVq+Faja0S
         6VvRQU3ix2FNjDnvVG14bE3OG4qU9XE8e6t1QbCTom5oxTLGekxJk8ZB1OGykwhKwnEu
         1KMtCyMW+108G5ZaT45PMAcPIUD1YDcZY8lrnY5qNhROEfXr5jYIYqwDyPOfpvOgRW7I
         YRkyM9SQ3JweGfwcWi9P1F6oCMRs/GCt6hbSh13qiqKZZAv70n2vDPGy7D8KZaJdoSoX
         jEhc9GFnyivrSNCZqgMsNyOgy8N4iLB/qXKf8hQVBQrcZ5S2Alfns0Yox8AywNRWoa6s
         tVew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hOdW3olR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y3-20020a37f603000000b0069d5e7c53c7si1408522qkj.453.2022.04.28.02.39.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 02:39:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hOdW3olR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk0cA-0002lp-PZ
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 05:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0ab-000051-Rr
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 05:37:34 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:35446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0aW-0006Zj-PP
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 05:37:33 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2f7c57ee6feso46446007b3.2
 for <qemu-arm@nongnu.org>; Thu, 28 Apr 2022 02:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=moyXODMe1Ia2De6nxT3cgL1euDBOHHq4varns68EEaQ=;
 b=hOdW3olRRYGWb5N8JVBn2DTQyxv0J6vvKzhs6sYH9br7ID/H0O3cpz4WcVTv2SEJ2+
 bkUWfy28iGl3+eLxIcN4GOSnezPCg/yzMH7slpTYizWaFEGYTcTjkm1qXxmnu9NUFMD5
 o4H8eJaGVPVSyF2nBlv4kPMwzRiNJ47kzPw5FccbtqLpa/lNt6besqWa4cf4FpxDUMtk
 ejKviG+/988Z6Ekk2bdWRXqx0vY8Y5C9IC0wrS3tZIAnHWunMuQ9K+NM+OVHUt6lBP9c
 CW2iFS503Pe7GJM3dWymtILK/rJdzENYA/umWiYBdT60RX7YpJuayPdyp0/oOi8ttyPe
 C2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=moyXODMe1Ia2De6nxT3cgL1euDBOHHq4varns68EEaQ=;
 b=AI/u59PmRHRr3czfvvp4uovKOQgTmirtZ/dIV+zN8VPzA013Cx6BZbZoZJ9ve0m4qe
 hWr6joYE0LXm7IdHpbOlAfsFdfYENojEc0A7EMe1drvAhnPzD6dRnA+L8Ey5+vToLJdZ
 Kwb8rR9UVsy4t+1Bcz1gE8GdjRQccAozRSNlA5PoTH6jVx2vRAvfNZX8wjViPJA/0W47
 Yr/tgSTL2g9jHmOwfmN73fCD6+wfNTEFYLWT9rqEzZr+glqmCvqEo10fp+5KGmQ0uIKp
 GA2c4oLkroD9NtCSzqU54+bvzqPuI9FyRx0hyS47RyLLaptRnBr3PAWb4g+X9NdD08s7
 Kbyw==
X-Gm-Message-State: AOAM532L8TH/MxObI3F/vYvT3GN8PNzNRwmFzKYFoMjtbfgTUph7YCN3
 oH4rjrLn/T5f87zFBg7mBdyXCSFbPP1tqUGL3Ef5HQ==
X-Received: by 2002:a81:5584:0:b0:2f7:d7b6:d910 with SMTP id
 j126-20020a815584000000b002f7d7b6d910mr22902387ywb.469.1651138647826; Thu, 28
 Apr 2022 02:37:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-4-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 10:37:16 +0100
Message-ID: <CAFEAcA9QGbUWK4jCiB_rROQ5kJ-Sx20gC1dnwEwEy82KcgFmyA@mail.gmail.com>
Subject: Re: [PATCH 03/47] target/arm: Use tcg_constant in gen_exception*
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eSlBsNGvVr5d

On Tue, 26 Apr 2022 at 17:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
