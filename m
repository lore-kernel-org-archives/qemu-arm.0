Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp73480njf;
        Tue, 13 Aug 2024 03:42:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWOO07JlcjiQv1sAhE/zefwdXFHZWniHHmWOhQv4d23XfGhAEmdWC0R1Z//g0k6o/Pi3lf3xlUVHTScBjo2MG41ubtpI2J0
X-Google-Smtp-Source: AGHT+IExfzsziY7U/venfWCeVBCgUam5pKZsPHlZnkyKmi8NdGf0LXCijBnMLoNj/0ayXqJrJz0A
X-Received: by 2002:ad4:5d4d:0:b0:6b7:8c94:cd15 with SMTP id 6a1803df08f44-6bf50bebf82mr46576906d6.10.1723545761834;
        Tue, 13 Aug 2024 03:42:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723545761; cv=none;
        d=google.com; s=arc-20160816;
        b=GHPs799DsAqSSl6YdsO2uhSH1ZLg8lObkFFdHhumimkcK3S/ZqdKUfdSjjacX1VeMm
         im0nG3zNouwUxltgV63vnbHJ8IFz/bnqYbc58AeUow8btnZS1coImsipbrouG8xaljYb
         QjPYTztRwh3SW9+Nj1AQscy4b8l7rwTlx6qWYK0PSi8UsbOxwFQVzaSsBBP2GXrw48qR
         wUCUkP1sQjCxNWAczEdJag5ioyW9u9b/Jr3ffirph5GCschZIV7YN6JtKksRw5cveW99
         6Kop35ZvnfIX879QubHL+XsGdSSgwwTjoUWJCmB9VabtqVLXDKcqWesC1CPw04wmhkeo
         mq4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=C5fQ45o2J+U/1zCwYss2nCd9u2Euo0dkvZvhMtBhwz8=;
        fh=8kfzCLg6pJPzG6fx2IT1XmAt58rP+ZhELcn4Irl4q4o=;
        b=XhJmda1B2GLvWcnRSiOwmmZOm6O1Af3JW3pwO7wtybdQDhsrfrG1f2bZkzADDWQnPO
         vm4pOCijBgG5d/RnHzWjH1KL6UdRZochHWcgKGAwz617sAPK8GGQ8Jv+4E2fnDXUJ/Mu
         Vk6v3E2jQRCsjE4YbdLx2SvWM1eqx8wXSy60IHsT9WO/uZRbvqtljX40XVTiZRTHiDC8
         S5wTxdXfDoXGXVUC+0181VWavh6+ShmMUdQtHLUgKeT7kun0Z88Sqm0YPTidh4+J0ysY
         YD0+Fij/4WB9yjTilLVLN+qmCiyhbICdMORv2dtj0yAKRV7x71GeydLQiM+SiJD6ut8b
         OOVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lsFs0TIs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bd82e6fe33si80339196d6.414.2024.08.13.03.42.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Aug 2024 03:42:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lsFs0TIs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sdoz1-0005XG-Hs; Tue, 13 Aug 2024 06:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sdoyz-0005WD-Qy
 for qemu-arm@nongnu.org; Tue, 13 Aug 2024 06:42:30 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sdoyw-000133-Eu
 for qemu-arm@nongnu.org; Tue, 13 Aug 2024 06:42:29 -0400
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2f136e23229so56205041fa.1
 for <qemu-arm@nongnu.org>; Tue, 13 Aug 2024 03:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723545743; x=1724150543; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=C5fQ45o2J+U/1zCwYss2nCd9u2Euo0dkvZvhMtBhwz8=;
 b=lsFs0TIsWjh7e63pWHWA+8NEEBzirnAISl1DCYLYkc8fEUMiA97C0o7yzQOszfIGHy
 DIbwIc3SVOg2qIDOoemgC8Lrdhci+cBDC4zVK+pONm98HvQD+8J1EgMURFjuEmeyARWl
 +O51oqssjxAot3Gwv1IAGnldzhgDvbm8Tt15/GsyuBBNR6405aN/vB1ipHFn0cBRJWA4
 7+WamNT6ZYw1BJdrLBJHeH1rvnUP14IpFy+WMg6tTt7aUVKRhThjjsO/PDKyTotG7m2d
 z1UvD65y3Jyl2BK/GYqraBzyn0hy4HmFUCv5yPYdz/jUdGvQXSvraCx7gX6kQYYroTKV
 /Wfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723545743; x=1724150543;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C5fQ45o2J+U/1zCwYss2nCd9u2Euo0dkvZvhMtBhwz8=;
 b=aIlKbiVtO3rXzEaLTeFLJCD7QuQnjnTB6fiBfwrLbFvRpvljNDtTM+X2lPWr0LXCSW
 4WDFaO7qHLZLXI2ENv9GN4McqEvsqIml124zHDxQTMe/7ny5mSX/unSpMJ3bvrRZghXr
 pcbSxwv8TfxrLjjKY8hrM2vls/FQ5ivbd0wvrI5scj6pE7CBTYcDPuTfe05c7UrR6ncg
 W68WBNmh389rhfrlImsqF93NxE3dLcT9PzNnkWUsdXFo145xJFAPwemq5yGZwwHY1/n/
 nU5JRU8ohTNQVvuh8oEn6RjYgUwK2e1U3Gwipr2IbC4vTp+BwPE7yWyMhiVxUcUZKZCx
 xJKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3fZd4fbsjT92k7iL8DiiV2F94xOJfmpYLF4QhvmHBR6df81AwRt3OgbV7PVjnxXsidKFBfUH/mrIEqt1d/52m23xS
X-Gm-Message-State: AOJu0YwtO9kgRmk5ul9GWYCcS6yXFz8l152nlSfw4VR42cPRdBh65CWJ
 dkE1Vt/xHgJ/JTiN0hnSDsMkqKWWWtkLJdo7vwqTWhi5yKweUqOLsgPqhMyKypHTY6xMGa3Tiq4
 GDogH/cCxbmriGrMVWb4HQ1M8CPdlJt2G+5NzV06RCqnu3Jip
X-Received: by 2002:a2e:9e88:0:b0:2ee:8d04:7689 with SMTP id
 38308e7fff4ca-2f2b7155478mr19797521fa.20.1723545742541; Tue, 13 Aug 2024
 03:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240618135550.3108739-1-zheyuma97@gmail.com>
 <CAFEAcA8uf-hSP7=w3om6XX7u+v_bQs_qvR1k=XhBp2bzF40Z3g@mail.gmail.com>
In-Reply-To: <CAFEAcA8uf-hSP7=w3om6XX7u+v_bQs_qvR1k=XhBp2bzF40Z3g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Aug 2024 11:42:10 +0100
Message-ID: <CAFEAcA8PuqAJX8Dk-6BYxGCNtTRKp50cRU0CUoCTG2wFec7CCA@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/stm32l4x5_rcc: Add validation for MCOPRE and
 MCOSEL values
To: Zheyu Ma <zheyuma97@gmail.com>
Cc: Arnaud Minier <arnaud.minier@telecom-paris.fr>, 
 =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x229.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5JmEHV5YZjHC

On Fri, 21 Jun 2024 at 13:59, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 18 Jun 2024 at 14:56, Zheyu Ma <zheyuma97@gmail.com> wrote:
> >
> > This commit adds validation checks for the MCOPRE and MCOSEL values in
> > the rcc_update_cfgr_register function. If the MCOPRE value exceeds
> > 0b100 or the MCOSEL value exceeds 0b111, an error is logged and the
> > corresponding clock mux is disabled. This helps in identifying and
> > handling invalid configurations in the RCC registers.
> >
> > Reproducer:
> > cat << EOF | qemu-system-aarch64 -display \
> > none -machine accel=qtest, -m 512M -machine b-l475e-iot01a -qtest \
> > stdio
> > writeq 0x40021008 0xffffffff
> > EOF
> >
> > Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
> > ---
> >  hw/misc/stm32l4x5_rcc.c | 28 ++++++++++++++++++++--------
> >  1 file changed, 20 insertions(+), 8 deletions(-)
>
>
> Applied to target-arm.next, thanks. (I added a line
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2356
> to the commit message.)

I've just noticed that although I said I'd applied this
patch it somehow got lost and never made it upstream.
I have applied it to target-arm.next for real this time.
(This is the second patch around this timeframe that I
discovered I'd somehow accidentally dropped, so I just
did a check through all the patches I claimed to have
applied to target-arm.next in the last three months
to see if any others slipped through the net, but it
looks like there weren't any others.)

thanks, and apologies for the delay
-- PMM
