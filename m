Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3785661lfg;
        Tue, 11 May 2021 02:06:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoj8yxHaqdfcMPu+8E5Ettmb8GRbU6IMNiZs1xKlzeYBBK/dRxBnWzwnpszuhSWkt6+P2S
X-Received: by 2002:ab0:2712:: with SMTP id s18mr24078433uao.88.1620723995066;
        Tue, 11 May 2021 02:06:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620723995; cv=none;
        d=google.com; s=arc-20160816;
        b=fOILD+xrSd9r/yGug11oppmRnMWUXFRhoYmi1DLQtaIM9ozDZor6nN9GUSE4HOm1aa
         zyQfrgXE7/gWcTSs50AQcHkzNpB4KzLcjzmHZHLSCubqG89TnLG8BwWU8LklOWlMRsfE
         uwdRyer2XSXYDarWUSlAHxAHbiA0AuJV4ENrj9CJ84IXJ883WEffG8he/GMxqR8+EQL2
         WNuohmJwkjl0WbU5ZL6v5fOwgqN4DJGP2Eqh5z2Pzc+GEdKK8wV+vJaAY6aajr7lmz90
         g76ez8WZNLQ0foGWdaXA9O6eVVp02NHEoVCNvNeZtSqpnpA84yXUct9I3Uzky0TZg5Xt
         wUeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=COT1W1g2vBNFAz9botDYPIDiRTdJxx+YApaOX4ZYy4U=;
        b=FnKUp7XwMXSM6c5yFo6a7otxXhohBam9joEeXDv0G2B6hWsXGlZAtEZII5IK2E0abf
         JJ0cKJ+VbOSv6RkuHlGHXxQ/6wxGrfCIqz70lNNUgTxxWiuB8J2Y4JXI1kBoJie81m3+
         gABoLGSSx4vcFpwwCuiafIE2Ug4yiGLaKD6mqG/vBK1EOCNO1rM+VoRKRw08zzq+lj6G
         Mx4OojOFEJ64PUqps4x+Gr5YqXDRGPfreZTUDrSXB5WAtogDjmHBHHVVb0Vu2xjqv7jM
         dvL1T0CqULppwC84pwr9YBB7GX+OucXChPNKTYdJGxm9u9fTTV6UHOaBeZ1xG3qGWFuG
         uRiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iXRF4XPA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s14si6296445vsj.26.2021.05.11.02.06.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 May 2021 02:06:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iXRF4XPA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgOLa-0001Sm-A6
	for alex.bennee@linaro.org; Tue, 11 May 2021 05:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgOEr-0001xG-4l
 for qemu-arm@nongnu.org; Tue, 11 May 2021 04:59:37 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:44001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgOEo-0000xz-Cn
 for qemu-arm@nongnu.org; Tue, 11 May 2021 04:59:36 -0400
Received: by mail-ej1-x62e.google.com with SMTP id l4so28610294ejc.10
 for <qemu-arm@nongnu.org>; Tue, 11 May 2021 01:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=COT1W1g2vBNFAz9botDYPIDiRTdJxx+YApaOX4ZYy4U=;
 b=iXRF4XPATd9i0Wdl8TwDUW+ScnLmZqTmQZfJwEcf1oJ62K7IkvSUv9mE8eONgM9jie
 kIMPBA6w2A3BEoIsAWzMiYyV7tIz9tBOZn/ujxJD/2XjQDvpVqZ9K68rjHaDx58r9mTg
 l9EhuDhtnJRXGbUYYY5doDgoFKHAKX9OIRebQiBRHRiy1I+3A8vaXEqzpujxvnNnGqjP
 89lnp/UNfzwH+lyx2iSeFCYasb3/sgWSmb+HSsNBhF90C1XskcolraXL7fqt1BH1mVbx
 q46E8Jkwxt/rc1+Iwz9gDMl+UrV9G+c4ldBpIKmfAqE3HKFw44o4dP0hafQKA/iVV8PS
 ZePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=COT1W1g2vBNFAz9botDYPIDiRTdJxx+YApaOX4ZYy4U=;
 b=eAItkOKjhxKatn65kU4a07iTasT9pMSojl0C5YlNCKd/BtJlFUoSyIIlNghvsXUF0G
 4q9S4QWGlfGLizd0QP/KbEXIxBzgXnX4dDU9Tr8ObLWTQ3YsIDzq46V19o53WPHhnkTz
 OqGZ1Wf2aSBNzGRapO5nsekZSXbG9irTu2PlFYTSrryUfcIGU0rle19y/zuaFfdB9mDp
 /b41RqG6qCnhVbPiwjpa3xE3DQYHS2OFvpBLHNQUAEecSt49ad1+2UT4pw79V1yqlzHY
 jTTalzfHPN4YkD02vHgSBURbN/b2M7aBHz3NoWZZcK8NS0kX33kpIlgNLft2yTcu25z6
 f02w==
X-Gm-Message-State: AOAM533UN9XpWHhzDwgKdxORl8WkLnn2rHa1d2joT9vqMYKaQKzwtt4i
 mqg0NaucqOvre0qfIGe9/pJZbsDO6+aztfqxdHUYZQ==
X-Received: by 2002:a17:906:d1d2:: with SMTP id
 bs18mr8407143ejb.56.1620723572656; 
 Tue, 11 May 2021 01:59:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-9-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 09:58:20 +0100
Message-ID: <CAFEAcA-OvV6gQSTuGYfLk1G6430TEZ-DOYn76NwnARzb4NcZhg@mail.gmail.com>
Subject: Re: [PATCH v6 08/82] target/arm: Implement SVE2 integer pairwise
 arithmetic
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
X-TUID: aIYswUEWmNxx

On Fri, 30 Apr 2021 at 21:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Load all inputs before writing any output (laurent desnogues)
> ---
>  target/arm/helper-sve.h    | 45 ++++++++++++++++++++++
>  target/arm/sve.decode      |  8 ++++
>  target/arm/sve_helper.c    | 76 ++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c |  6 +++
>  4 files changed, 135 insertions(+)


> +DO_ZPZZ_PAIR(sve2_addp_zpzz_b, uint8_t, H1_2, DO_ADD)

H1_2 again;
otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
