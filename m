Received: by 2002:a05:6214:3f4:0:0:0:0 with SMTP id cf20csp1788495qvb;
        Thu, 16 Dec 2021 12:22:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzrMyGp4gMQVy26fONV10P9GKxsRmVX6Wv1km9hEZVzN5o1BDL0hS7TW7R1LdkiTiWirsi/
X-Received: by 2002:a05:6602:1549:: with SMTP id h9mr10370938iow.30.1639686168423;
        Thu, 16 Dec 2021 12:22:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639686168; cv=none;
        d=google.com; s=arc-20160816;
        b=uXUfAXutaqXOddHQycKQnQSgMjRd8lXTArr/R50v2b7AJTLdN0V8Eq+r/nax0Ptdu2
         BlvKUE0stCvzsR8WXAJzf6uNPEVaOQ4flO2dvli3DGbL5uvr8aJ3Z6whgQ+WVDVYLvxL
         /9IaRIrNxqwmz7v/9vO8Ff1crjgnUI7DOa7rK7uRZICoruDg4A1GmVmdmEm1Xc+h1BLV
         NpBqPoafKQmlYSKQ+gAa2EXyizjpNDCVV/xvyJ+a8qmB6URMFwIEi26UCjqYcne1FEh0
         AKusRR0DN4JVUPmJs+tFGdLIr/e8JgemVerhItanDipgnm6oXGYd9fFp1U8xW8Um0K/M
         n0Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ieq9EUBE5XMyU7or/TU0iN0xepuITx8+wHEFB88jEik=;
        b=eLJGi61AfPsZPGVm39sE5LLqglnSPMKTHpR2wMKOLR0oOTDFcyq/xvhjVHQSGJ6/dT
         4Q6fGt/5NyyG8j5UDaaCbv0sodEhEUTTyocp9U2Jw9EDj4g0twXzQdhYzXC1BgRMI3gb
         skzS63f3P1cPIPg5oeeuV4nPvlp96Fbq5+FtyG29jyMFKsmLu57v4IVlILnrF0xPckyO
         ZMVcyrSFG+8eDPxKQ6FCsQHFdqf8GEamCKR1J6g4S9sWoea1Xj9MokfdTHilbyZ/bUH8
         GNgJnMbWRfUpcpoQvEdZd5qCIV2u5CwbHo7op3xUQIaZJoAH50p6cwtkkZzzg8Ndewj3
         Emaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CAISfMMd;
       spf=pass (google.com: domain of qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g7si2485259ilf.36.2021.12.16.12.22.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Dec 2021 12:22:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CAISfMMd;
       spf=pass (google.com: domain of qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mxxH5-0007rC-V5
	for alex.bennee@linaro.org; Thu, 16 Dec 2021 15:22:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxxFn-0006TH-I3
 for qemu-discuss@nongnu.org; Thu, 16 Dec 2021 15:21:27 -0500
Received: from [2a00:1450:4864:20::431] (port=39768
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxxFm-0005nq-3j
 for qemu-discuss@nongnu.org; Thu, 16 Dec 2021 15:21:27 -0500
Received: by mail-wr1-x431.google.com with SMTP id a18so148127wrn.6
 for <qemu-discuss@nongnu.org>; Thu, 16 Dec 2021 12:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ieq9EUBE5XMyU7or/TU0iN0xepuITx8+wHEFB88jEik=;
 b=CAISfMMdncYFS9dqpqu2yLN/OK0WDYyjro5xpLxwmm3IPXTLzgGwtJrWv/KqpjAKqm
 OdKpvKRYOxVZcLzsjOSH4Jyk9fT6b43oy4BPMtkIWYQr8+LkXvmYowR/LpA3YMOfm9ZU
 mr19VBJzP8+PxQWVmR/qy+yuTbVPw9hPXb6JsDWa3SiumOcLjHlWtJv6W+t2h8uTo9Ig
 +gbsu66kjNlJjwFgiS/OL93TwclYHeNmFIRYft0Hdb0uPdRGBWfX38hQNWSMrrELJh0+
 DFbWioH1pHr3mtTWaJEryer5a370QP3aYUWEstFxUAJp9HjvZgJ98Gcs/eQ5MmPNjcy/
 skLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ieq9EUBE5XMyU7or/TU0iN0xepuITx8+wHEFB88jEik=;
 b=tO6izxZgNi2A24OR46cfqUChkS3yuOs19pXo+aeLdvlof+NQccMW6C70aF5WLzDDr0
 h2oKadLIfrVn+gLZVhn+I2LLjzrzpucSDGWA0zaSCl8sXYzYR0/3uFuOIym9JYrlzyW3
 2Xdvp0td8G/0ituEVy3a9MdBjPJ53BxHC9mCb/zmJhJ/6n+cABDbpfxFJYLWQcBqIbrh
 TN9WW+vki2nNBX/WXjEloyhLPMSnMokdx/rm+NFbiZNMgHkgkish+6U+tu2vonklyON4
 HoxiDeoNS0+wcyrEc9yiaZg7/nfogikpdSDDl8l4QJafRjGm6MreSiG4P75kSiAN3wWC
 /7Iw==
X-Gm-Message-State: AOAM5320RlJexSMWbcrjRhbKMGeDKUptrkH2bzbQzbhmasBqFqwtMfHk
 /SL0Zh6IMXZT35DqBRjLx4KRRg+g1Xg4Z9ohHyB+ww==
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr825038wri.295.1639686081477;
 Thu, 16 Dec 2021 12:21:21 -0800 (PST)
MIME-Version: 1.0
References: <CAP4GjT1x=9z9jwRxUg-J_nyGQKiga=xcDddWzG5a9HCkiC2Tog@mail.gmail.com>
 <6b16b0e4-c0db-02de-1d95-ec831fdff938@amsat.org>
 <CAFEAcA9v6JQD3OR1tKL7yJaY+=-ohhvMCzF4xpSRAATXAB59vA@mail.gmail.com>
 <CAP4GjT1dhNPhHgNWJFH1CJg4zkZU0zkGr-rAqTZE1-HzqG=ahw@mail.gmail.com>
 <CAP4GjT3uOQgqc6pGDEKJjALSgjpHKYUaiZEHMtnYKWxV9oxfZQ@mail.gmail.com>
In-Reply-To: <CAP4GjT3uOQgqc6pGDEKJjALSgjpHKYUaiZEHMtnYKWxV9oxfZQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Dec 2021 20:21:10 +0000
Message-ID: <CAFEAcA-OEKx9OKPK97Tx0=RuVV8KPGnA1OimKj47y5EcDDVseA@mail.gmail.com>
Subject: Re: Exception return
To: abhijeet inamdar <abhijeetinamdar3005@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-discuss@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-discuss.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-discuss>,
 <mailto:qemu-discuss-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-discuss>
List-Post: <mailto:qemu-discuss@nongnu.org>
List-Help: <mailto:qemu-discuss-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-discuss>,
 <mailto:qemu-discuss-request@nongnu.org?subject=subscribe>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-discuss <qemu-discuss@nongnu.org>
Errors-To: qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-discuss" <qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Oh4YTV5QIgmi

On Thu, 16 Dec 2021 at 20:07, abhijeet inamdar
<abhijeetinamdar3005@gmail.com> wrote:
>
> If I won't make that change it gives me immediate error as follows:
>
> Taking exception 18 [v7M INVSTATE UsageFault]
> ...BusFault with BFSR.STKERR
> ...taking pending nonsecure exception 3
> qemu: fatal: Lockup: can't take terminal derived exception (original exception priority -1)

We've been round this one before. I told you the right way to
set the reset VTOR value if your SoC has something different
from the default, and it isn't by changing that bit of code.

Regardless, that doesn't seem related to the problem you're
having at the moment.

-- PMM
