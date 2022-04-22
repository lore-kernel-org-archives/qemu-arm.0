Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp385123lfk;
        Fri, 22 Apr 2022 04:53:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkQvSttLZyVse4foCRcXX8v6T02/ZE0tOohQfcZU7OCF3EgOgcp9A9pc/h+NdbT8sZSJ/k
X-Received: by 2002:a37:40d7:0:b0:69c:8c7c:bf64 with SMTP id n206-20020a3740d7000000b0069c8c7cbf64mr2293966qka.417.1650628415411;
        Fri, 22 Apr 2022 04:53:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650628415; cv=none;
        d=google.com; s=arc-20160816;
        b=pTSTZPWvJnehcJgtQjaPanA6/sJzRX556o2CFr7Bn+JlctBI5o/BLvv2Sox+gLw3wQ
         hZWwQUYWxj6C8CbFKT+cILO9SNrd7p/2dfxTp3OtyKW9BUe4FGtSuUdDATmoBBWMK905
         UC/zaAvtOEUPIt7ilNv432K23nk6IveE4O6nQr7NeuhwMujwgkdzdDCIm0tgwTmyIIAq
         vf2PfA9F+dNXQaVVTO5FsH8S2sWtFAuJrlf4/+kthrUTASFeP0A7bCn9XxhjtXMrrvOI
         6tRDd0KdYiowOfiQL7+gEDbrxrceON+ohxBFYGLCPabca+yesCfLsPxSEITixiqjm+zv
         TAtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=15HCelTn89GVoVii42oJ7MIkT0EjpcUkRB6PWE5ANNw=;
        b=CTnAoJGxCOYxcUr05PJfFpNBiv9s0s5CGWUBXcXOcvz1fZ761AEAB8dhPX0qEqPivb
         qmOAHSATCXq/fiGKONrxoj4g0JXfgy+o5zDvzyQ2ps9hpqJ6nMs2qVXPsUzMWXzAji0q
         QSu43+m6fEQNl/Ghq3B0lqN1zm5Xtf7/VI+OysRssM3EmtEu1cH3NUqF7VEBfciQgc3V
         OtFcyZzJ6XfX4bgjWxEV/dbdh/rT/AWZvmqoq8aeIisE8k8HRRkV/HE8sEKqVcT4XYtC
         qODgrtyQz65y9LVi5RG4XGePcmkololqvYRcv65UlDij/KCa1EMgNsu/xPwkX52oagJr
         iapA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yLdII270;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l10-20020ac848ca000000b002f1f3bf4985si1932452qtr.610.2022.04.22.04.53.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Apr 2022 04:53:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yLdII270;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhrqw-0000jX-MP
	for alex.bennee@linaro.org; Fri, 22 Apr 2022 07:53:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhr2o-0002Gi-CT
 for qemu-arm@nongnu.org; Fri, 22 Apr 2022 07:01:46 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:44916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhr2l-0002za-Vw
 for qemu-arm@nongnu.org; Fri, 22 Apr 2022 07:01:45 -0400
Received: by mail-yb1-xb31.google.com with SMTP id x9so6715486ybe.11
 for <qemu-arm@nongnu.org>; Fri, 22 Apr 2022 04:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=15HCelTn89GVoVii42oJ7MIkT0EjpcUkRB6PWE5ANNw=;
 b=yLdII2706Vg8E38zWXXIustwedqgEx0q2slumtmRrKVNqy8T0/+6E51dQnB0uhiuRm
 FkeXW0xzRFcNXwbZw17OHLe/A3WMTPU8KcNKbyt+3ObQXkGQ2Sw8oYrEeDotBflnIt1M
 MXHrRcyEHHbfSiszgKXoI57sLVsQwzJ7APw9FYRM75TGGZo7GtypOG4Dh00N4N/SW6o2
 hLPikBOZqotCcJf+h4+jgpJnvDJeU5J5f2/sd9b6ZNnsgPWJ0JuKswU0UHNEBMAUGBrf
 t9gRZzwjG2p/u1/w05KljklCJfF9/0ZvRKob6xK5sACcITjYjzWHZk8K7Pmqb+hzTkz0
 NTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=15HCelTn89GVoVii42oJ7MIkT0EjpcUkRB6PWE5ANNw=;
 b=Mu1ybhY4dsJGGObW+0w57GYWnC6WbnTeI0yYhZRHtKls0inxc3bQnkHKu7eQ7eaocT
 1P98esT/kwJDIFoxbAYSt4xzzKKumeHzhGeOylPmLLvnH0vv5pnK9J1qn1AJResTP5I3
 TpFvGL68ZoIHooG8ACkkW5lww/q15+hnQO0n0x+ZrOXkVNAMRyb25mDdmgp84XDR7MQ8
 ryCQrf73jq2sBaE5nxnPS+MzyM4IFCa+rVOnJD5Z/Ljp5smQ23s8fYqgJEI7XcDk+WqV
 g2x4Dsy8BfPIBhxHV+jMlkpQE6+6jvGDW4D5+0tc5u/cs8JcMPY1cCpxUZ3l+pMXXlCK
 +nnw==
X-Gm-Message-State: AOAM5313jVftVWUp70Ey8Fo51cwsAAFqLBqWBaykBBc0fKtLMf7chruO
 /Z3WA5Q7CkzN/9PzHqMQEgogVp3QXtd4q2ER4Go93g==
X-Received: by 2002:a05:6902:390:b0:645:7d46:f1db with SMTP id
 f16-20020a056902039000b006457d46f1dbmr3772484ybs.85.1650625302791; Fri, 22
 Apr 2022 04:01:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-41-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-41-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 12:01:31 +0100
Message-ID: <CAFEAcA-SkzLtj-8rj5xZgfxUW7QpYyPBymzuq5DYBsUazPKyOQ@mail.gmail.com>
Subject: Re: [PATCH v3 40/60] target/arm: Move cortex impdef sysregs to
 cpu_tcg.c
To: Richard Henderson <richard.henderson@linaro.org>
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
X-TUID: OW4cb2oKAOP+

On Sun, 17 Apr 2022 at 19:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Previously we were defining some of these in user-only mode,
> but none of them are accessible from user-only, therefore
> define them only in system mode.
>
> This will shortly be used from cpu_tcg.c also.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: New patch.
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
