Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp309271lfk;
        Fri, 22 Apr 2022 02:39:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPAWSr1/l0OURwmDUavOzyktyxog8Rdx0sGcUF7+NnMb0v4qMa+JgOM9EgPbq9D+1c/PJ5
X-Received: by 2002:a05:622a:1a21:b0:2f1:f29e:40a with SMTP id f33-20020a05622a1a2100b002f1f29e040amr2390362qtb.235.1650620353342;
        Fri, 22 Apr 2022 02:39:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650620353; cv=none;
        d=google.com; s=arc-20160816;
        b=1GmcCbnO8ix5UNvBhZYqlPoKiCNCUHM8hXIn9phHhwKYaTj3IrAgZ/XxN0NRXl/SS3
         SLsvBPrzDAZetjddYUWzahqqorH9kTOch+AnOgud1W6YWciqQp6f0C6ySDVkkJ+5795n
         CThQmdWTzZdGXan6tFQdliSgyz246LhOrGmK/0u7twTjOcTVuWTW8ihkU0bFU8viH3/p
         c1s0I84hGjzfWAHE0GlBncayP1fyX/mi7kx1meblJ4J+VkBwSTpCxYH1FHXx3tmbUACI
         642/lgj1/DNCknbN6QkVT00Xw5HgMVl7+0VrqD4qEkNOQ/cAim7lkO9qwby4J1gveZ4Y
         pVgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+CP6keH7/+9xKiUbRH0Lx60A8S1DsT9zTHXVPKGIe3U=;
        b=QBd3FP/dq0tQIrTW8cSIzs/sdszpinjqJb+TlT/UKoJUfBbxKj/62PYkv3HmrrB680
         ioTsTbhZmXATTI4e/5RSc32rGFZwJnhfxJcydyJ6HkYsgBTEJVVuo9xPsYlSEL5werxe
         OLrQbxqDGfYrHR9Sy17oNbZN3vYtiTU3v9lOBXPIia0SKqziVN1UokTF1tYOlOgTlrKA
         QtWg84+zMAMxDqJYjueWRRia0t6pxTgtOE4bAUXlfgM6GubG4b+DzfE5s8npM0+bGFJ0
         AGoaiGJlF+T+jlCKXRa8s9oSXBuANgn9x0YSTcEd9ywn+DUG9VnOBqARu0YmeQkmJmtM
         r5qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=y56ZXQU3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q6-20020a05620a0d8600b00699a7b4950dsi2257105qkl.166.2022.04.22.02.39.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Apr 2022 02:39:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=y56ZXQU3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhpku-0006rd-RW
	for alex.bennee@linaro.org; Fri, 22 Apr 2022 05:39:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhpkQ-0006oU-MI
 for qemu-arm@nongnu.org; Fri, 22 Apr 2022 05:38:42 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:39615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhpkO-0007KR-6G
 for qemu-arm@nongnu.org; Fri, 22 Apr 2022 05:38:42 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2f7b90e8b37so1897407b3.6
 for <qemu-arm@nongnu.org>; Fri, 22 Apr 2022 02:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+CP6keH7/+9xKiUbRH0Lx60A8S1DsT9zTHXVPKGIe3U=;
 b=y56ZXQU3/5nUjUUDMhMP9YPPJfGAIxvy5dLLYtLuA0VI9es03DIIFxFANqvYDR1xum
 CkaPzP8cVPzqjyVb2Cd5DrY0Hw6EdEGQVpkzm2Kl0yGGEQt4XbGNTHKitIbz3mzv/ctl
 ClsL0LSRjg40ynKCkD+AAHGuWLpb+yuB2onGlJy/L6q+ytynMO/uLYMXQnspWzzmhxJX
 7/j4C1PVkrUDX1ch10nIrjXTHQWUuzQGRp6y8KHThCo8TQnxhH7LmKNXphRczIhBEXvf
 TJ6nZgj3NanHUyYwodq8wv7RMtkTHyq9zhC+kDcDAdBvf9icPdmaHQIQ6WggjVRseb2X
 3adw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+CP6keH7/+9xKiUbRH0Lx60A8S1DsT9zTHXVPKGIe3U=;
 b=FJdCtd3cY1ZGGisVifaqLGptSQ0BiS9QW2rg3W6oeyBx9KkAdU+yY+B8oTKZSvc5Nh
 I1EVtfpJpyzB8rgLm/cNJ+cTI3EN8BhDut/nKgorv77RCm7YAB3czSDpq6DM2XPagual
 tnSiF4GETL/alXeBIu1lrwjBCcoFO8eeBsZytlzz6mbTAdrr20VSQtvU+6rILHPXi8DO
 0QxdRtN2rivTmFplkBE22Xt1pZN4Bu2IUnqapmFzSwUjzNSVt0AWA/ZZj7oQj8eZajE6
 n3I2Pn6WR2aBe5ExLyMhR/zkKRQayaFl+6FdoijRzW2U4ONRnl2MA25nXSZqWsgl79CD
 Oa+A==
X-Gm-Message-State: AOAM5329IAiW+ZpmWoqx0LPsBOICdTMCgg3hbUY+xd5gi8hF7T1+UqVQ
 tL12Kp8ibB1IQUJSvfczXKUrQ4hjXIzDXsy7TaQTrwrfX1o=
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr3783753ywj.329.1650620319315; Fri, 22
 Apr 2022 02:38:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-28-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-28-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 10:38:28 +0100
Message-ID: <CAFEAcA-Vi6ugRvve7yE0TLOVuPgxX-PaXGNC9GX8=tSSs44bFQ@mail.gmail.com>
Subject: Re: [PATCH v3 27/60] target/arm: Make some more cpreg data static
 const
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: raU3DOtq+dVK

On Sun, 17 Apr 2022 at 19:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These particular data structures are not modified at runtime.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
