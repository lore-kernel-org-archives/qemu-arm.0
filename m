Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp626652lfm;
        Fri, 19 Jun 2020 07:11:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAhUsgELFq2WkqcOlgjjrHZ3vrtMxxJONXI3/8v51UVsKyQ/+aS9U2pFbypOxMk+/FanQ5
X-Received: by 2002:ae9:e217:: with SMTP id c23mr3640879qkc.280.1592575894898;
        Fri, 19 Jun 2020 07:11:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592575894; cv=none;
        d=google.com; s=arc-20160816;
        b=KMeMVVz4HsM+agu+9IgmC6fyLkwr6akLKlOx2gJ+I8Qqji3ZZzif85Ye/a2FURLdun
         NvKf097Rkuvmv3dY7O9QnhQ3IU6MUY3RnMAIvHkJLXTYWGNiyFnilYYxn06g2NQKwiLE
         HI7afVzDZPFJVx6XsBqpdRJebVzPNm3ItpWPiv/nY23Fr5yS2nsthvGgKP21urr1E2dJ
         e91yCaOCIfhohM82eutqYmaYKFfpvwQlb/Ka5lPMFYycGLJxSUQoK0XG4YH2+AhdqXP3
         ez1QH8705h3YTq9aEd4IaFgmuuDVUwrB58V5nRZxMogUSh7vTkba9GHxZ0tlCprXbrsi
         M76A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kxX6D25DP1qhl3L5DvyUmj1JP4N/xtsAYz3XJRknY7Q=;
        b=gqLzFYdvGxQCoHMh5Gx6ZgcYDqoa9SchEUwMlmSm9qw1p4UIKgG4VIM0gMtgCje0uN
         E4YhfLIGuu7bgYY3fDwIm8iX/RN0tu9g/2NYHd0zRAMUOQtinnaHJuo9h4YRo3B/FDFR
         Ck3p1TY3r6nMfD7eWu1qVvhOSGQmnvA2HsTswYOZUO2LokimGvFy/S6CpoQvJFLeWWw6
         /Jjsw6mB3QTHETx2yFjEVq3FMx6sEyZKvJIODQBxi2Pr0uMR9IcDVaWKuHCKVKiLiL78
         UTbfn2nApitOlByLBh1rkTNO1GITutFy/dhdiwOlpBXb1n6+E+qiwKW2IPQrR8or+RJI
         o5Vw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aOECG+Ot;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b14si1379478qkn.116.2020.06.19.07.11.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 07:11:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aOECG+Ot;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmHjy-0002sh-9F
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 10:11:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmHjq-0002sM-Nt
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 10:11:26 -0400
Received: from mail-oo1-xc41.google.com ([2607:f8b0:4864:20::c41]:40158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmHjp-0004Zg-3K
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 10:11:26 -0400
Received: by mail-oo1-xc41.google.com with SMTP id v26so1916367oof.7
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2020 07:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kxX6D25DP1qhl3L5DvyUmj1JP4N/xtsAYz3XJRknY7Q=;
 b=aOECG+OtyvMfUqaCZiXAHAbVUw8nKcWgoCpNj6pQE29EKxWwkfGuxFAH0xDRhYaUyn
 FOwk9FNq5elBwwGY4qGBwh4qa3PuAKOpXasHuFNpY7bLJkvgCA5IkzHpY5jeWZEmhAat
 8PiHvPejYZGe5DdFkWcU4FNlPw8No3Rm+Fh1in6bMaVvZBuvx271oJIv43ikdpepQA3j
 is3kPYg0bPcB1dZfkAbJP049N88FxOfca0S0O+FHki8ZcnFkly3f+Yr2iPh67H++3bcH
 A1ej5vpR1Y5lekx1RXeVzcH0bIYtRX0kpBb30ng8ZZdQEYfF6THYq4ED+seSeNcc1zOd
 1tTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kxX6D25DP1qhl3L5DvyUmj1JP4N/xtsAYz3XJRknY7Q=;
 b=DKcGxUg2m8xymTx6NdmCRTDk7VmfBKgJAjBhJT7GJkQPAyP6SQDaK5Da0LAP/cPj1D
 4gBEKZPNjhEPn6hG7c0g69P8hRL8FRVHxM4B0EnDXNJcLEudwMOVVuZlseXwx4KGrpK5
 jW+6ciqdBleFX3AWtP/5nqwVvtaE8vR0iKqxUqE3o0SBAUwbCcwgk6/6xikk0NKBzOKa
 Ms3SR6qolQwJcMSLdgw4jceuAxQTt5r+CzRPQLwJ5Dci+ouKgz94lgjUOa+ikR43/pOk
 2jHQvSKKAbiNGQEfzW3wKPkSSlp3TsaOcHHr/SZb5WCAi/R2UYBPmbMst71ijadmbYKq
 G+ww==
X-Gm-Message-State: AOAM532Ye9mubpm3cuaOR4b1AVDIUSzK4BCe6RhKDteNR3zMNUh6qEhy
 dNaP2fiWiFMy6XdH5f0Pe4/isZp3KDIO5FcrKZGBkw==
X-Received: by 2002:a4a:a20b:: with SMTP id m11mr3438334ool.20.1592575882388; 
 Fri, 19 Jun 2020 07:11:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-38-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-38-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2020 15:11:11 +0100
Message-ID: <CAFEAcA_X6_UX8a+G08zQG4Vc=6vdRairHCwZ_yWRS1ZZr9_crA@mail.gmail.com>
Subject: Re: [PATCH v7 37/42] target/arm: Implement data cache set allocation
 tags
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c41;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dSPkrCNMxcGB

On Wed, 3 Jun 2020 at 02:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is DC GVA and DC GZVA, and the tag check for DC ZVA.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
