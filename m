Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp79949lfb;
        Mon, 11 May 2020 03:48:55 -0700 (PDT)
X-Google-Smtp-Source: APiQypL8Td+vqEEG6dY82cPMkzYr4C8asymNZH/NnOI/y63IHyqclqhSQ40vsG+Tr03vzAN9mTv6
X-Received: by 2002:a37:e104:: with SMTP id c4mr8516887qkm.207.1589194135702;
        Mon, 11 May 2020 03:48:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589194135; cv=none;
        d=google.com; s=arc-20160816;
        b=sU847mS4469l7vz2t+S3AgmLAM9i6XEd0UWAyP5KZh4D/EfbSMNL+mi2jHup9qwVf2
         QHlwLJkj62ZSVr5Je/gGLrgvPCnNoosdaV6LgEBEoPl1htJfRRhT2e2LGeFqDesMcUsf
         6zGMyTciDExf7z1qwWQq1QbqiTZBqI+j7KTGqcvG7MijPrcl3EB6uMJV61Rz7/Rm0Yb6
         xJfBZBFoxkZU5GRSwCsDG7a/Cp4vkyKgFel7Hk+LZAc3gOQj7i1dx2U9VvnEocVrC5ci
         p6lE7Zt+YNRe9fVRhgkEqJY1rY0iA0FE+hmapfrWtb8LjUq94wiLYWZFhoYz1e6VacPr
         jibg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=jLHPBC0H4IGlejcDmPFNjwEn4/1nzZJ4WYBrN4gYvxI=;
        b=bf4ycYtpp1zRXFC+E7DvQjyEI7w+FuaRs1Mekn+3fE8w3YrtthpBYcRo9SX06nsAZ1
         Rr/3OtSUGn8V3y3V5t9B/kWxA3HsTeRg7qZO8tyl2whvHYX3JtX3WJGAarPjaSoYSOQ7
         dUtioafzyV0Q/csNEqFFprPoaEvKD40Rrzs/G/SYoiiyu4Ti7JZ4t3gc28bcxJqsRpUZ
         +gKTkK95EdtN1AgvqiILP4R4eJa5qQaVRrEvEy5TE+4hUeieUekV+JuM7kRwZ4Vq5R+b
         Mmj/3btydTZRRWInwi/H6IjUhuM7AoBy3LLSeRyx9KYUNRqZFSFGG34mvMhnXf8ylMHl
         ri4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bGz95uB4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j26si5179490qtq.288.2020.05.11.03.48.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 May 2020 03:48:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bGz95uB4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jY5zT-00076g-1w
	for alex.bennee@linaro.org; Mon, 11 May 2020 06:48:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jY5zI-00073v-Ng
 for qemu-arm@nongnu.org; Mon, 11 May 2020 06:48:44 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:38962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jY5zG-0000lT-R4
 for qemu-arm@nongnu.org; Mon, 11 May 2020 06:48:44 -0400
Received: by mail-oi1-x241.google.com with SMTP id b18so14681373oic.6
 for <qemu-arm@nongnu.org>; Mon, 11 May 2020 03:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jLHPBC0H4IGlejcDmPFNjwEn4/1nzZJ4WYBrN4gYvxI=;
 b=bGz95uB4d5Eh2741D+h4Mu+83Zkz22IaLbmGFzQ1NGvrFEm0wy21qluAigCqmb485m
 WS0hwWCDZmE0e/2itT16IlGrIOxU2T6EkQMqNnks4diUT6EvKrXxfCOCOh4fSNF19JFn
 RwJNC5DSgVMqpz7zQrcAirryLN0JSL98v1X3Zygtg59PvEhU7Ysg1PTPfPnVJ+rscP9K
 B/oWUlaK6M5hjOC4ZbEfOurEHNtafJG0nk03m8eQd79hRsNNskUczetvg+9UFcL/+CDY
 XVcVgUnm7g68iK7OnasGMlcshYIwG6xzuVV1h6UF34ZCePrJykvWdB2WfTKNn4e5KSO+
 L7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jLHPBC0H4IGlejcDmPFNjwEn4/1nzZJ4WYBrN4gYvxI=;
 b=mQAKxvNLGSgP8nEQ99dKMeN1XtZhL7NGqDjp9shILMA3lLMnodoO5/i9fX+n7Snc5X
 P6WEbbVlAlBVC3v60WaRCEKkGekwPmusU4WUwdEx6SMspXb2ue3DFzQGx6x+rMPm5m/G
 aFlkpwZjO9ga9Su4FYOjT7cP0b4EjzJfSdA1ewTTQbYm/DRg77RS7TJ5K7OqY9fxUPyr
 zTzhRNrNTI/4sWYsbOV3pr5vwc0tfmw6w6YogCLsG2mEdDhOx/+r2EMCd/JD+4MtpYDy
 YghGFVPb5HzTOlJ91blFv87+8d/eP++iL8XmewgGE1Vk9N3zPINZ4Hdblc5br/l7wqbZ
 80ww==
X-Gm-Message-State: AGi0PuYklBi7NMfYWwoCLdmxzrOlIAaeM+m5jefRvum/5mOhUwPAkJCk
 zSwVp4scJ2FPKyjsj6ZGjKMswTInLbxBgNTwQo+GrQ==
X-Received: by 2002:aca:4a45:: with SMTP id x66mr17938204oia.48.1589194121552; 
 Mon, 11 May 2020 03:48:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200504172448.9402-1-philmd@redhat.com>
In-Reply-To: <20200504172448.9402-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 May 2020 11:48:30 +0100
Message-ID: <CAFEAcA_kV8HzHv3xuPRPMKC4JwH8BDfskWqwtDJ=tHMVt0i_Gg@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] target/arm: Restrict TCG cpus to TCG accel
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-TUID: aN6lu8flpC3T

On Mon, 4 May 2020 at 18:24, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> These are the uncontroversial patches from "Support disabling
> TCG on ARM (part 2)"
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg689168.html
>
> The other patches are blocked by the "accel: Allow targets to
> use Kconfig" series:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg689024.html
>
> Patch #4 is new "Restrict v8M IDAU interface to Aarch32 CPUs".
>
> Since v2:
> - Fixed set_feature() clash trying to KISS
>   https://www.mail-archive.com/qemu-devel@nongnu.org/msg697523.html
> - Fixed aarch64-linux-user build failure reported by Peter:
>   https://www.mail-archive.com/qemu-devel@nongnu.org/msg699319.html
>
> Since v1:
> - Dropped 'Make set_feature() available for other files' patch
>   which fails to build with KVM only, see:
> https://lists.gnu.org/archive/html/qemu-devel/2020-04/msg03843.html
>
> Many thanks to Richard Henderson for his patience (again...)!



Applied to target-arm.next, thanks.

-- PMM
