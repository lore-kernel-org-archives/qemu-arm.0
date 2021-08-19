Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp350706lfg;
        Thu, 19 Aug 2021 06:56:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPA9rU7OUX/1TBlZ1NTiGIGSgXLbdRC1iDnzSrk2nsZJsO3hz86f8gHjNWg3p2e8urxBCn
X-Received: by 2002:a05:6638:358e:: with SMTP id v14mr13582390jal.0.1629381414581;
        Thu, 19 Aug 2021 06:56:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629381414; cv=none;
        d=google.com; s=arc-20160816;
        b=n4u5Srl12h+BxC6OB0tnw3qHNfXjVxvmrTgO/12IohgSfgS4cE21r7KkSYkT42em4T
         pV1q0sf1Chgbookv8ldUu0rLQde8nHUNQLDKlwXMjgv4NZwNtKVO0oYzcc3oebEqrHU1
         XKAgAxdg8y9Wyty8Ctnk43oYHG4fRipxiplKzrKGd3L3BDv4r9/06G8OY1KJeDKU82NP
         Eg5i3S5FYqmvdAa7ICYgew+Z9Up5cgttwChNDgLKiOf3kLaXRgXegMKs3gwtK8LPrSsq
         6KC/4lJoQsORdkbae3o93j/M4QzvtYmFj/AxgGa8Z/MhjGS/UNL2eXn7gDeJmBxLYVTy
         ky6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JkTN3cANiCoT96mDR4Bg4jj2nYUDJmAAiM1fkolr8Wk=;
        b=XkDpXFWjFzRUwDjJsTipULWExSkgbGpk0QKqzRWbJo0XLmKHL/kyyNIx6VyIJ3cKro
         6lls9AXJX5Oyt3nMAVn9S1LG7YD1sqOpv0KOqumAw0mSBSxdDfTnQnTtvDna+8+/3HMI
         tdTD95OJrzRHuZ7G0CllYc+dElNBPP+6edOlIn/qaHmzAHM0aNI1y87Dp6IdnirJTDly
         YjIC0BfFhwISlPpdelX8+Wdz15C2ngkbkwVt6ppQzw6SKuC224CAYi31V7vuMmjCddmr
         ATw4DYH6bby5CfkZ3ZmiHvwBmxkt+DCBgLmYuf45KugBKYm9ljxjw3ugmQfxeN9EbwV/
         yyVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kB2wvWHw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g2si3221827iob.28.2021.08.19.06.56.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 06:56:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kB2wvWHw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGiXN-0000jL-Up
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 09:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGiXF-0000ie-0p
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 09:56:45 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:41491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGiXA-00025p-Uz
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 09:56:43 -0400
Received: by mail-ej1-x62b.google.com with SMTP id d11so13096308eja.8
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 06:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JkTN3cANiCoT96mDR4Bg4jj2nYUDJmAAiM1fkolr8Wk=;
 b=kB2wvWHw5k9+ZmybXgQOglnNQsXdknib7twOdre5sMDhWV31g1RGepKJI/Cjxuw2CV
 XGoFvawy6wCUTi85y3CzJHaFKJc3+zw4cTPNYpyq20SL3defQX1kdiLnljp3xZ0NvQQs
 r+lDeZgyHCzzUZydQgC932LDkwLX+k3iQkakeZT/dhrbkbjtUrKJSJT/DDqO8FHeMpCW
 +0HKh8ENRZYv2EobmqDI3/vz/6TRWF/yhbeIJ8zV1holbnxzAzLAMDdB6T2NQbTkOrlP
 nuNBSOICIK293khljxf8uiUTAmLdt7HhOsXoLwhfeaubE53IxHgy4lVreKG52hzaKCwt
 mKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JkTN3cANiCoT96mDR4Bg4jj2nYUDJmAAiM1fkolr8Wk=;
 b=TK8NFBHs66zMTilgTlIjeO9AOh5+JiSldd+haFbpdu1VecjULpmwe5+7KbZn8iHpr8
 rsfGfI1SZwxJovWuGRiUVOA+axmXt0N4dIt08yMKcK/ehRgFfzHQkdPDAUFK+odm5fJm
 x24pWW23p/31RDmHA6leo/jCCgnZWZKxx55JtA9R06nYgLUe67AwxSHqgCgqN5jOheNK
 gqxLh1hmjtcYMUxODOMchSZeeeLkXcMXc3P2LkW/Q0bZKoxkpwtAt05WV/6+3ZZRJcVE
 DS4/SRCADKjbOP++7s1L/R+puHFfYhSuDiqD2d53ENIW0dCcgwBOsuEKb3vrs2DqX2bq
 fYAA==
X-Gm-Message-State: AOAM533LWNj3GJe6294hNe43zxC2QlNW4iiFLnqM60ashPVRhlfIZ4iU
 ccoT7Z/RduBNMAFF1Dj1m//w2n/KEQy5rzs7FqaCUg==
X-Received: by 2002:a17:906:584:: with SMTP id 4mr16315931ejn.56.1629381398493; 
 Thu, 19 Aug 2021 06:56:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210813233353.2099459-1-wuhaotsh@google.com>
 <20210813233353.2099459-7-wuhaotsh@google.com>
In-Reply-To: <20210813233353.2099459-7-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 14:55:52 +0100
Message-ID: <CAFEAcA8s4dW3rh+-5Cd9k4tTNRhUqvTaLpprenermJSFUM0mKQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] hw/arm: quanta-gbs-bmc add i2c devices
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Corey Minyard <minyard@acm.org>, Titus Rwantare <titusr@google.com>,
 Patrick Venture <venture@google.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Havard Skinnemoen <hskinnemoen@google.com>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q+mBb6VX9A0c

On Sat, 14 Aug 2021 at 00:34, Hao Wu <wuhaotsh@google.com> wrote:
>
> From: Patrick Venture <venture@google.com>
>
> Adds supported i2c devices to the quanta-gbc-bmc board.
>
> Signed-off-by: Patrick Venture <venture@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> ---
>  hw/arm/npcm7xx_boards.c | 79 +++++++++++++++++++++++------------------
>  1 file changed, 45 insertions(+), 34 deletions(-)
>

Does the documentation need updating to mention these newly supported devices ?

>  static void quanta_gbs_i2c_init(NPCM7xxState *soc)
>  {
> -    /*
> -     * i2c-0:
> -     *     pca9546@71
> -     *
> -     * i2c-1:
> +    I2CSlave *i2c_mux;
> +
> +    /* i2c-0: */
> +    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 0), TYPE_PCA9546, 0x71);
> +
> +    /* i2c-1:
>       *     pca9535@24
>       *     pca9535@20
>       *     pca9535@21

This leaves this multiline block comment with the wrong format: QEMU's
coding style wants the leading "/*" on a line of its own. Similarly
for some others in this patch.

thanks
-- PMM
