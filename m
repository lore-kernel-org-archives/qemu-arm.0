Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp477805lfg;
        Thu, 13 May 2021 06:07:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRTBVopRkCm6J//mlgz2bheKn+eYeQhCENKXkXakzo2+9f/+EQ45e4n7WMO7VaFzCcDSmW
X-Received: by 2002:a05:6e02:811:: with SMTP id u17mr34746124ilm.206.1620911229822;
        Thu, 13 May 2021 06:07:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620911229; cv=none;
        d=google.com; s=arc-20160816;
        b=KNefkrAn4J1pon3HePbZCiuMHR2EXIYclj3CrzuDG9yf+jDy/RG0bZ/CIH4KOKUqWe
         3ndeCcl9coo5E/bWhdz1btL2bsfElk4RsVSOL1UihGmzBwtpxB4nt6Mhg3WoLQJp1zcE
         itUSa1GMlFA/C5UUWX0P7TePMEBEP5ZPMtS5d/qzq+JC85yyF+IEfCE9Kw53NYnP8/MM
         gv3grDIGk9pBBAhrwGWNmxtoqS4FUESRvbd8mxgFCCAxuZrzhbXRWKrm7TQKbvnveRhA
         XsACPC2QUQ6H/9KlzUXismhsQaYSQj5eWac4gcGt5Be/KRnw4fZj+U+KnQHebruD+tcO
         /Gtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=luGh7nVs+iL6HSzoZACl4JR6Mh1SCt099GB/Wu3Tqhg=;
        b=bOlRaE/5T/5XioAlau9vvXAB30Sf5AzsqiF6FrjsvQiuoidAir4ZR4LC7rF5jm5SF1
         KXeLsJpWqLzl5s+IT7joMZbfPQknGQgabsG/Y0xSCCZG2UWKUgvIxoNXvZL1wFBXvW+I
         kjr5zuUAMwxTGxdU+llSqeCAhK8cxX/XUqhVcoSiiTukEBR50IpbggluciZs13j0gKBo
         oSosW1LqrDI0/DteUbAV7coXAFpFFoFnIHayvhg7ZztkZ3BKZoEVdd44cZgw5Bjb1ukN
         zbOufR3cJXHnABVzwmogd63dArliffjAKuphxsl3Lzt1TVa64MCBMzwrkx2qR0kmYWUZ
         XboA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WaTlXrRW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9si4174904ioa.96.2021.05.13.06.07.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 May 2021 06:07:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WaTlXrRW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhB3V-00063b-4f
	for alex.bennee@linaro.org; Thu, 13 May 2021 09:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhB1k-0003o7-Nc
 for qemu-devel@nongnu.org; Thu, 13 May 2021 09:05:20 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:36381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhB1c-0001j1-LH
 for qemu-devel@nongnu.org; Thu, 13 May 2021 09:05:20 -0400
Received: by mail-ed1-x531.google.com with SMTP id df21so3655269edb.3
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 06:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=luGh7nVs+iL6HSzoZACl4JR6Mh1SCt099GB/Wu3Tqhg=;
 b=WaTlXrRWn0LNzoI8XRwW29MwtxYn89XFWo0umbEEP2s0ZIUG++pTMVGuaahfVjbQVj
 Vkbw+2WGqeyTvFBcycX4MdojmQiRvNPMygXkHUB5XlL0K4sdWu6l46U60KWaut85JGzj
 TAFzSCinlVAB9pvc8WvkLEueUaqo6iXeScUzxcOpwcBV/bx6DvFf+J/Ad9o4ebEHUlG0
 BM0d/6OAE2PdKYvMw7pfzlCI6C/84QtF0/nGR14N0do08sEeGCVRCRfJ+/rr234xZu2b
 ClWcgqPk4DyCxEYpdX17OpCWSQAxboSpm+y4jj6U/xtfQ0O2MKhV4WEJLRRcsoXt2tyz
 Duzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=luGh7nVs+iL6HSzoZACl4JR6Mh1SCt099GB/Wu3Tqhg=;
 b=D97YzCvScxBneYFvO5l7AvTPff/qdV0ag8wepzZY/ZYVVLl3FBHDZCUxH3Do+4vOrx
 mWx73ebsHhVIizsBg8TagWEN7NC2eV5gHfCXPMlvAiesxvB3USE7jd0LlOrCUq9IQ5F8
 2sAO7eXghMbDKKllqssV0AzyTyVsG3tYtlGYZ8GVl8JAYcY+mQDiKwDx40HFlOu6RL8H
 t7kOPJns+FIdZDa7/xX9X0M67zor4qdHkmZ4WDH6bDhpOxc8SL21n6uqs7Tf/5l3bGmC
 dD5DBSNPYPSl16u5bxMPkQxR0q0lRJiomV2VTFgkpWX9+p57U0QSjX19r5XpJfOVJG7e
 3glw==
X-Gm-Message-State: AOAM532xCeyzFfBsb7UqHBdtRIFqdWJqCflmqRht1YqFthLPLJr8X/f5
 fgSJB/loXU8u/NmNZR6lSggLuBhgs3wrYILRBNamIA==
X-Received: by 2002:a05:6402:12d3:: with SMTP id
 k19mr49703996edx.52.1620911108564; 
 Thu, 13 May 2021 06:05:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-63-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-63-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 14:04:57 +0100
Message-ID: <CAFEAcA9Ya7s7ZbnZHkga=TZap0f3=GvDVY5+uJHyNiZY9BcjUA@mail.gmail.com>
Subject: Re: [PATCH v6 62/82] target/arm: Implement SVE2 crypto destructive
 binary operations
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7gPXuGNP0LPp

On Fri, 30 Apr 2021 at 22:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h           |  5 +++++
>  target/arm/sve.decode      |  7 +++++++
>  target/arm/translate-sve.c | 38 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 50 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
