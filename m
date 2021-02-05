Received: by 2002:a0c:aac5:0:0:0:0:0 with SMTP id g5csp577888qvb;
        Fri, 5 Feb 2021 11:19:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCX0Wynt0aY6jPTaEJYL+BWsFqWbfg3iUMu1JAotputRzVsBferd6EHqbO0zZeIxLRO8ap
X-Received: by 2002:a5b:745:: with SMTP id s5mr8398195ybq.265.1612552777220;
        Fri, 05 Feb 2021 11:19:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612552777; cv=none;
        d=google.com; s=arc-20160816;
        b=p8sQMLWA4jEn8pcnbF37+Wf2lEmMqU5NmAoAMD6KJpFBj9BxMtwTQYJl+rIb2E25b9
         OsLc+g3hkiktNw8bx0DvwghuNgx1cZz2SyLKrQ35Ncdk3UC8XcpwP57dIPJ8rY99Fp92
         vg1he6OZT/RGBaHDKT9sTiZmUEvgkPr7sgb3BjMrbnCGShIIc2t+pVgdCGvSSifm7Uiy
         n7kt3F8hUbp8oFiorN9QfsHAYC3p3tCAVw3s3hnmEKebnqVD9nBbM76NrcTjji76cS5i
         ZDuMbY0fmqQ05GoEY7gYhZE5jZGW7QWWvaMW/iuBbd2gl4jUq7tbYRJpL9Y2KEHXkyeS
         s4VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=HeWsoYBhhyRLwWx5le8ykpB5q/SXrdRFZywWUTxH3mU=;
        b=HtAlab+uRmpn8iZH1/xeDutAMnSGh82t6LxTyv9nMeLntGcidxNw2e/GZ0q7dHSqw+
         dCaDuxFObjEr+cAu/i5EAbVbRi+l6h9ezeha4733rQ/bdA3X0Nq2uS//KZ41+FMN0l0R
         cz3VFylNHsIaWUsQvyWIU8vQync7OBCPso8aFPJFvH3omgsi4AWpHrnScU2QXWbIsuQ9
         nDYU2D2epd5s71tWIGbI+/sKeRUwsCpJt08il+PRqNbcu2yY4KPYz1ioUfJqVu5sw5Ia
         XZ2u/8lqOZUH0uuu9bSNdqjiATqCFR6VQ0XdKb9vMXOAZ1lUkeQV0YGNl8MDUEO9AZff
         vPYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qNgAHVM5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x3si9678287ybn.333.2021.02.05.11.19.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Feb 2021 11:19:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qNgAHVM5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l86dk-00026z-Pk
	for alex.bennee@linaro.org; Fri, 05 Feb 2021 14:19:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l86dc-00026t-RG
 for qemu-arm@nongnu.org; Fri, 05 Feb 2021 14:19:28 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:41730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l86da-0004Wd-E2
 for qemu-arm@nongnu.org; Fri, 05 Feb 2021 14:19:28 -0500
Received: by mail-ej1-x630.google.com with SMTP id f14so13630193ejc.8
 for <qemu-arm@nongnu.org>; Fri, 05 Feb 2021 11:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HeWsoYBhhyRLwWx5le8ykpB5q/SXrdRFZywWUTxH3mU=;
 b=qNgAHVM5qJaV0pOTgb4tlY8HVadYPnNLqHQhcJ+3IwfxuVueIXemV1eV9jhSuP+JF4
 hIeNQZ3bg/lmGqe7QwUKx2g89ElOMW3PqICEXIcDGexorwFRpNcaG9KCHEpLGpM/ay/S
 mrNqH/6FyoJHh6zQy6znuz5caLNSnAHNT9Kp8HTQHtqiHu7X0uhxV8fg7+RUa3s5ejYv
 KLffWATs9UXIohD35tlY9bJcpud/4asvwFfgDI6FvUdo8tEwAMM7ElT6+3x32jRXm0sa
 nqWkeeJDyOgjzdx9tcoReZv2RWzTIYp93CvvW1yUQqS1uB7APqWVE4FeQg+YmCWG9C6M
 gbzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HeWsoYBhhyRLwWx5le8ykpB5q/SXrdRFZywWUTxH3mU=;
 b=BhhtHid/LaCyFMT2MZYEAxA6cki5iKha+G6+4tvYG+68sV1XkNqvl3SZjjgSI9GwUd
 O2jiUyWBfn9Bv9LPSmTrM10ZfhtPYoiCBricwHOiFCPx2tYB9O/9bymkHQ19KDRGP9DP
 adVRWbez/MV/vogw57nf9vBkj0qZ9vWzxt2DW2oa+zx04ywAP6LqHuKNyyhKOwb64w6g
 gfHx05xvEC70u7nQNcuGevhXNFzsVH21+auhLClIDER06Zz0aNWmNg4M4vf+VCK7fKPc
 b74Yf5BImDFeUkjyn9g8QxxHDPwQXk5jwZV5h8rTz/3bl371gDnSbYc1A5ULNKCr3yD0
 xmwg==
X-Gm-Message-State: AOAM531X6UDc68feNbLm+W6JJ/TyJbeYFg2p0d+BHHslK/Y51AraD2ZX
 y8+eVhO2RKCFl4jqV6iM9t0HWRAjaWNAciXWp6yV7A==
X-Received: by 2002:a17:906:494c:: with SMTP id
 f12mr5531021ejt.56.1612552764917; 
 Fri, 05 Feb 2021 11:19:24 -0800 (PST)
MIME-Version: 1.0
References: <20210205171456.19939-1-peter.maydell@linaro.org>
 <0ddf77dc-35c6-6955-9433-abd3898c3ee7@amsat.org>
In-Reply-To: <0ddf77dc-35c6-6955-9433-abd3898c3ee7@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Feb 2021 19:19:13 +0000
Message-ID: <CAFEAcA8kUQR3tK+gNFOkZu0GMkvBnKw3WvPN3_JvEmXembrQTw@mail.gmail.com>
Subject: Re: [PATCH] arm: Update infocenter.arm.com URLs
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
X-TUID: EdmjeFy2cHTS

On Fri, 5 Feb 2021 at 18:07, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> On 2/5/21 6:14 PM, Peter Maydell wrote:
> > -/* This is a model of the Arm PrimeCell PL080/PL081 DMA controller:
> > +/*
> > + * This is a model of the Arm PrimeCell PL080/PL081 DMA controller:
> >   * The PL080 TRM is:
> > - * http://infocenter.arm.com/help/topic/com.arm.doc.ddi0196g/DDI0196.p=
df
> > + * https://developer.arm.com/documentation/ddi0196/latest
>
> Oh, /latest :)

Yeah. developer will do link-to-specific-revision-of-document
if you want them, but I figured /latest was probably the more
generally useful URL. Not that the PL080 TRM is likely to
ever get another revision :-)

-- PMM
