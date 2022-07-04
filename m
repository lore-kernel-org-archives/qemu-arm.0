Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3250271lft;
        Mon, 4 Jul 2022 07:02:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sfJrOaagc3nl6SP1qTUURwUV0+GI77MiX+/tSssHJobF+PVknijzOXViXL38o8ZVlZOGX8
X-Received: by 2002:a17:906:5047:b0:710:456a:695e with SMTP id e7-20020a170906504700b00710456a695emr29314524ejk.433.1656943363240;
        Mon, 04 Jul 2022 07:02:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656943363; cv=none;
        d=google.com; s=arc-20160816;
        b=E6CLO41ORKcMCreTevnVTvW/LWnDmzJkSU+tra/8c0toWVlybyWm3EKt7U7iQ18ax1
         pHP98+OFUiNsqA1uxk6nKrVTMoKVukDTkNkzpBjwn3IR75vNGE6xL8XC84zkgyVJSTmT
         uzBWR+m7ghlq5Ntl2z//q90QgeKPSDxdLX9+KHwvNUoVgJFueCvYq501ZI+0VhNjzqnL
         pEp8AFYKHwRQq6hN6CVgvBmwVQ9UHzPiLLdXWEkMD5VCx5UQjIAsaaZV1JPXz60RQCFS
         70xwuVPcwqfZHyeC/jzYvGY0jgSFphYpiBXGGimQzl4YErSLzlOAZd9c+Msx7AGzO0Ih
         Tg+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=/33YwOsUT12D9MvhREGuiZb5URHw9En/cIwcGhgw/30=;
        b=SEAzlpAL1gb5449gIoEwTqadAIiy1oXMA3HRYLQ5e7M14wPk+ykxEYWom8rJIIZjps
         6bfDCUm79ngu5r6ZigDFNlxqPmiAsZBv1Z6Q9UOmBddWS844TPUBF9woYAS+bL4yMT2E
         5PitdFOtXpWNrc/f5zipOrmMNk3yskNBtydtlu80tglYVA8slYucvu15vlvG5DOtBRKZ
         OA3ccTpIcW3GCcyfU/sEqvgk0l23zfugbPqjpMjtweagw8/Eg4pRxEInwgvZhyL2V2tU
         ZURTDiU/TROPP0iLEhwYlEQjZiiK4FwLwlZN8mEwB3EGYg9VH1z4vJLE2HPj6S0dwPe2
         +BTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eZKfT0e1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id es8-20020a056402380800b0043a6f83255asi995809edb.40.2022.07.04.07.02.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 07:02:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eZKfT0e1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8Mew-00047f-Eu
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 10:02:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M33-00005N-CB
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:23:36 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:44011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M31-0003BF-TO
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:23:33 -0400
Received: by mail-yb1-xb33.google.com with SMTP id j7so10524613ybj.10
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/33YwOsUT12D9MvhREGuiZb5URHw9En/cIwcGhgw/30=;
 b=eZKfT0e1pChVBpbuJL5OqUFbGuPrqNSNZLb7HfmKQ9uwO2EFTuK6RFNihE7jOIEgY+
 vWoKdwWqQcgd8EUL2Ydx+Dth4ANb2hx9X3YQileK5s0QMj4PHoCjsKTS5yKCKQNfNHla
 9gU6viQHvAb1z0833t3Q1AaDVDi0YenOjruAyIV7MmkPUvoDnaPl1iGjctOu0/Ade0AV
 Hik2JYS5ulrDSBknWl7hHmHOxuVp1p0VtMK6mmiM5jqI3wIJQmdhdmWxCvQT34XU3/0x
 xBZwjglRwm8C0bnn5iU0hNCOzFWzes7O8slkKy2pmRhKH7x6YRbuV+PkkqsY0TYuzPB4
 J5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/33YwOsUT12D9MvhREGuiZb5URHw9En/cIwcGhgw/30=;
 b=klFe6JHEE/l6fB/t1G8sCYE/2kBiuHZP44yxlYUI4oYH6hlUxkHUTx2GqS4pKwDKMU
 55AzEuu1/wo4oBVO6BuEkZyufYcQHXg7gTXcSqx1UlRvYnTIrJzxj54ZSvEZ+UzJu4Nw
 kBS/ItX63TZ4HLkqQ8JgC6gfVQi1i2LgFeDCDgp75B0tlkPsQu34YS5DutY+tgAWQEaV
 77ta6Ven26118rtDpTupKJTjVq/pS8+AZ4ePcPkJxAKtXGiP3MhfHXdtcLgXcWmC58Po
 k0gaDgnfjkaIHBFKHe7A6cu+xOpjgIOvTQnuQplY+96zQzhdIEQLR5QG0GzJmgSdgKkP
 vNOg==
X-Gm-Message-State: AJIora9HxIeqSbJionYSPuepay9iPECSpK23L2nJ7wYEY+fr5L8WiOA/
 rhCxE6ajpa/lBDkchQDAtDiZa6PH8sST+Um+Gb5Ebg==
X-Received: by 2002:a25:d381:0:b0:66e:2943:1c9d with SMTP id
 e123-20020a25d381000000b0066e29431c9dmr12228945ybf.67.1656941010901; Mon, 04
 Jul 2022 06:23:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-17-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-17-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:23:20 +0100
Message-ID: <CAFEAcA_jc65Vx+obtTE-JcVn3Ybk1rawnQW7r+NZqMDVGfYO4w@mail.gmail.com>
Subject: Re: [PATCH 16/40] lasips2: QOMify LASIPS2Port
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cZtUC3yorEWL

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This becomes an abstract QOM type which will be a parent type for separate
> keyboard and mouse port types.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/lasips2.c         |  8 ++++++++
>  include/hw/input/lasips2.h | 14 ++++++++++----
>  2 files changed, 18 insertions(+), 4 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
