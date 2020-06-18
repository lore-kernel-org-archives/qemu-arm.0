Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1523845lfm;
        Thu, 18 Jun 2020 04:02:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8hb3u7W6FcCVcnn/u5wDsGeDxxxdLVPgaLSJbHuY7L08Lk5WQzMF6WDYDboWbY1YJPtIk
X-Received: by 2002:a25:ac1b:: with SMTP id w27mr5803886ybi.378.1592478165575;
        Thu, 18 Jun 2020 04:02:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592478165; cv=none;
        d=google.com; s=arc-20160816;
        b=xLarOpAXsCyZP49LY8+rK0zmkq3XYamTVM5iVJZpIz+xsdyB4MS/GgTSNfwM1vLlDx
         G+gE3PGDaMUElnVEcKlBOEVY2YzElKfyyybnGM4aXL4ttANTgxP5a0fcUVlgqQfH4z9t
         T9VCDxR5PHMkOCefC1FIB+L0eWGOxHllJFpKDaGSYVFAiSyI6CSVueqLS5Xt/1MZrSGA
         a0EwJRIvW/C7KteNj70bAaHGfMyWNV9Rc8zc035Z0Ef0Mi61o6EjC9f3xMPPYWYeEHyA
         BEBrMyGI2ROn66k363IG/97W6/9djoEjzLcUfBIofgXajtaeTyyjr9/Pg2XUTkfH32Zz
         uYnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ivLhvnhRrT9bHWVFX0sgU3qFIW56QB8SCvTpx0SnlDs=;
        b=WYopsYKsZTXl1zeIhPEgSFS3Q+chwYg/pIOR63VTFtQKumJlKFdQmal61lkuoroWFZ
         gzpbQLElJ2p+DF6Mo7eHZ6skT1nrDymrqMTcVXjZ6SPva+o2zMApT0LAgrGCg8pvH3KT
         IjfzIRxrxO0T5xF2mo3g8Iec0/wSYIypgz14iQg5T3ARt5saoHb86vOyxZl5ag6WZNp6
         qRiFCiT5jCSKEwdyrMqvfQrfNLnctMFRdtk31n+9ZyK9XVFtTC6uOcvPHn6a2vOjxTge
         gCsheArOmgswPTV/Uwmgu6AhgV8NSvukjistWJaOqHwNbFaCV1jVxqUi7ZyxpCsV72g0
         KzPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I29cW7OP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w65si2269925ybg.452.2020.06.18.04.02.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 04:02:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I29cW7OP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlsJg-0004GO-Sx
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 07:02:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlsJU-0004Fg-FU
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 07:02:32 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:35894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlsJP-0004Xz-V8
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 07:02:32 -0400
Received: by mail-oi1-x244.google.com with SMTP id a137so4682193oii.3
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2020 04:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ivLhvnhRrT9bHWVFX0sgU3qFIW56QB8SCvTpx0SnlDs=;
 b=I29cW7OPj0Ejx2LGVrpXrhliwurlq/WGHwG8JuMoYCc96Ejd31wmC9rF0foWGmwdYy
 GhjFD2DR6Qs2Ew0QsV5iLx1slKAgcGKvsirSGXPsKqhfJ3C6ADwHJfgjNDUoYhOJCCjX
 a8a7l6axZhoUe6/jw92PUXSwYbkaw0/KnWhJiJyGDaxy7IfXIZgtKS96nCBrSez3UpUz
 or6Sac4blBVX1Mp/OYr6AFBoJhXFN/ahmQso/aDj2I0afSjrwDFdTf7vroHj47wkxj+A
 6vtGQQr8tdbvMk6iTl5f7uasjpzjziVU/a0JFm9asbVtGdjhb8GiHVk1JOYa6nUAwZNi
 vNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ivLhvnhRrT9bHWVFX0sgU3qFIW56QB8SCvTpx0SnlDs=;
 b=MAGigMvkqualTCQGTwMXytwHQUnAQ9Dq8mWAj6BUal5VhlBTgsMIVrDf28rEIj/ABe
 blV+wFY0TGkHOtAGvyK6Ni1tpAYzLm/4vr/PnoXNFP3Q16bqek7hTdb/islEWQXCZVLv
 DqZG+57LFD6NnlSsh1xYe07aaz2UZKdweli+Exvsg5yxLKoWxa90JdnHanWOYuUDdzCQ
 vgp+0cmVWPJ6pZ6co5/QdPtFPOQokB/I5IRA5Msw+1ALeV3E2QxnOBtpYcT0wBsOAx84
 XjXRPuRAMQPHCaqJuwMDRoY1AHFTdj22JcVyjdnFJwgnMc8u3JB7Iw6z8j4czLH0b16h
 GKTw==
X-Gm-Message-State: AOAM53000/8eiivBQP8DD/NXEsRnv7yMGPuWsv3xptMXXAKNTmu1qZTw
 l8dd8eu3UowT9qvhAkDQs9PVpVemm7neMmEMe3Bz/Q==
X-Received: by 2002:aca:5152:: with SMTP id f79mr2299578oib.146.1592478144634; 
 Thu, 18 Jun 2020 04:02:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-5-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2020 12:02:13 +0100
Message-ID: <CAFEAcA_Hur6VJhUB_Xa5TUnRoX=Q55iwrDg_VZ7+tHSh=o96Fg@mail.gmail.com>
Subject: Re: [PATCH v7 04/42] target/arm: Add support for MTE to HCR_EL2 and
 SCR_EL3
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x244.google.com
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
X-TUID: 3dJxBYMLkHGj

On Wed, 3 Jun 2020 at 02:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
