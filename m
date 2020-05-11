Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp46186lfb;
        Mon, 11 May 2020 03:01:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQuhGC/WZ0eBmyOjnKZnbwrhncd8g5slPR2Qtt11MWZ8tjO9yC9/M7v4PjnYyOfXm5QfuQ
X-Received: by 2002:a0c:8b99:: with SMTP id r25mr999498qva.174.1589191306043;
        Mon, 11 May 2020 03:01:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589191306; cv=none;
        d=google.com; s=arc-20160816;
        b=0pQZBcyH6pIBgkKp6kswrdEnAGe8bz4EMMC+qumlgEhXxpxkGhFL1CG6iEM614tkOG
         uoEUfRXtxV0rwxWvh8AvEEAfauBkwkVLwgHU9OEsr4B+U8Ca2oiJmMRZJsSJj33k51OL
         ctZxTnhKAj6ovwCqLj/9M2cBphOAxvo8CCBPxnXfhPBHtNRhomClPkUx4LNTdOij2L7v
         uUlkJKbJkJX8a37DmgV8AYJgqG6K9w8q28IdqsZoSFZ9fIL8IY/Cqfs/Bh8WSE2KJJdd
         t4iqu4E1A2iVJI8CXeAYKzRezNGaBfxNZAWBZEWXAj7Mpu3QLmpQpn2GshAHchak9Mhn
         bHPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/DiWneqlXuxXo6nMkYvuc7Yj2MM/2MTUcrxrR8pBB+U=;
        b=pTqjmXQrI2NbqWKYO1qijrywEVxLFo1HblrWPcdaQnoSqY2SFHXeGMalvRKWR2zSsr
         ya6/68UNkt7jdfTni6pEu/SdVsS/LDpBKPG4bEQljIR4DqzvVjtL8tGY0meGGJWL5sVy
         yKyEkSOtjVv0voqYQeUrBLQ5gzs4viQptXstIV25M/pAX76RTZFker/RuVCLweQVJy9u
         SlBIV1x39WvXLzsjCf9X59cCb0xxUMUA+loq/8c88WCeSlTMYWXBlKxUm8n5baq/okN1
         0OM+xChlHZLV+RuzHx7Fjk/tBcUSH3Br1dA5Q7/25HfVoFNayMtcGSrKlpQM3OvBlNMM
         gNbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="KN9/8d/J";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l16si5432499qvk.208.2020.05.11.03.01.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 May 2020 03:01:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="KN9/8d/J";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jY5Fp-0001il-CU
	for alex.bennee@linaro.org; Mon, 11 May 2020 06:01:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jY5Fd-0001hK-Vy
 for qemu-arm@nongnu.org; Mon, 11 May 2020 06:01:35 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:41665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jY5Fb-0006My-MX
 for qemu-arm@nongnu.org; Mon, 11 May 2020 06:01:33 -0400
Received: by mail-oi1-x243.google.com with SMTP id 19so14580045oiy.8
 for <qemu-arm@nongnu.org>; Mon, 11 May 2020 03:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/DiWneqlXuxXo6nMkYvuc7Yj2MM/2MTUcrxrR8pBB+U=;
 b=KN9/8d/J3FFYkjNlfmRPSD0fWeyNlY6gDsep9prJrlyH4yXOLe0yyyEtV5T9Tav2+G
 xPYlMO4g6h6cykBc/e+GFgYJeHVD/oZ9ElXs7PltnGOZWADg+TRxG5fSDE4xAMROd7s4
 v3bcAycE5FHXTifpCdJpqhOGyuDnhs5/g2R3DAzT6KpUa0/XC4UsPdpKO6FvPt8um1Ij
 O21hBAU8yf5SI/1YEBTIHGnJP0faMR11YkStpOPqSimIqq0xuXJxv2FjVUYwAe22ggwm
 Uh/bleQM8u2r1itcv5jrTsvck5jtuFJalfhG7SlcUbbAKYgDQ3DxQYHSVOOvUwhq2kkx
 7VPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/DiWneqlXuxXo6nMkYvuc7Yj2MM/2MTUcrxrR8pBB+U=;
 b=lX1pmpMwhC8jgMFwWWw2c7X1LAbgHv0+iU+XgPbb4rWnY4hsTR5vvVFyWHRyCCnFeB
 NPLxshrUAeiaB0C4wUh1PDbbrHRMJ1sfsg9Ku7SotuGosXbVSDzqo+8KcTfVK7Hwfw+5
 /OHn68MoArhr72JLL6aOHGeJMHdxM9TEvrAHX/0AHFuHgw3tRYBTK5/tlCZgqBU7BFJo
 Dn+32dtxps2LwaNhUkK5DCHrpfLRFyQOCEyrzZ666x7FUr5sF9FE0RoLzPMG8OF9Smz5
 azk2HbRgrXoroJfhSZEyt8cHbGtqF2RzG7WaU8CwHadIbRZROWoIiPvp4uDgHPOZ7n5T
 hdfQ==
X-Gm-Message-State: AGi0PuaThj6sUEPEO4P1+PACtY0KF0tTIgy1inecGWWFdD1n2B0p+hvG
 henCKGKdcqLPGwNUCb0mirM09m+y//qOt34VmoSdaw==
X-Received: by 2002:a54:400c:: with SMTP id x12mr18388321oie.146.1589191289386; 
 Mon, 11 May 2020 03:01:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200504093703.261135-1-joel@jms.id.au>
In-Reply-To: <20200504093703.261135-1-joel@jms.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 May 2020 11:01:18 +0100
Message-ID: <CAFEAcA9kGXBqdaig3g77JMLZ+pQ4WwZvpKVY-bbzKCXGch4O5A@mail.gmail.com>
Subject: Re: [PATCH] aspeed: Support AST2600A1 silicon revision
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /cUtikVmcMKw

On Mon, 4 May 2020 at 10:37, Joel Stanley <joel@jms.id.au> wrote:
>
> There are minimal differences from Qemu's point of view between the A0
> and A1 silicon revisions.
>
> As the A1 exercises different code paths in u-boot it is desirable to
> emulate that instead.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>



Applied to target-arm.next, thanks.

-- PMM
