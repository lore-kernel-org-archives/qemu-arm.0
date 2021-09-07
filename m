Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4516326lfb;
        Tue, 7 Sep 2021 01:59:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtAbcl+EJpyshTV5UYtpujRVa48WNqlZ912LKQ4rcR0NFNB83SbDRSTJrmaqgjGCOHTEZr
X-Received: by 2002:a25:ef46:: with SMTP id w6mr21450708ybm.546.1631005196466;
        Tue, 07 Sep 2021 01:59:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631005196; cv=none;
        d=google.com; s=arc-20160816;
        b=L/DHutY04L+SPi8GzB1eKRTtgh/Ui8TJSuR/Txwy+waX466c1UeCMy1+sBxh99gXug
         mXhauQxwNNNijwPn9N3hhVVR8Q5dVTDLYpgGRsoMkVPNnsH54BA1ClnXyMHpvR/jPnlX
         setg03xvtaTRPszGANT4Og1fDkIOC4/jC8+7qJ2AfdCN/3E+KthXa+kK5+2BQCOPkDmW
         4U7TUiEZ7Rx1RJ27JwyymofRXGv65k7ZJnQ4fFXbg4Iihe2snIdyVS1+FXX7whlMwHyV
         OVxHRl0WWS87UOQPgsN3HXySe53J4vc7HYfbeffFD0Jn+K85cPbeQnn0gzro2jmNWBz9
         kZzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CQTyvCtnDaAPGiV4Gm3wvQ0nVPyZV73ZjUNQOmaKquI=;
        b=I8H8cdcu9i/gsPvgHRXCthS0ldl8m7TsOwd+Y3scDQsKVHL3ymGI0gB5Xa/rshc8aQ
         4ko4hUPbqsCxnGQ+QfqT0j0Q2etrGhOrKoZXFTwOOkOkeNG/s96lS7J0ft0bjXnCio+a
         QqjOUx1nmoi5I/zblQTi8J3ip0U8KY3r0bUAEVyK+FmQRjy550Vr/DmNNE/jE08GidUi
         lxxiYNeAnvFhFp/OEME7QUV0nRChK2dwRhmpET26TbQKVElMEMIgiarU/juFmi+tqYiG
         nfmP72h/Y9Ot+LnEVXu4gCITnmrL2IuVOC/0QJl37vObM4ktWV8YCPkgOmJpM7RwV1y9
         ks/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=lCVcAduD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7si10176028ybf.21.2021.09.07.01.59.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Sep 2021 01:59:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=lCVcAduD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNWxP-0006hy-LX
	for alex.bennee@linaro.org; Tue, 07 Sep 2021 04:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mNWwy-0006hl-HB; Tue, 07 Sep 2021 04:59:28 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:37859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mNWwu-00019o-Vu; Tue, 07 Sep 2021 04:59:28 -0400
Received: by mail-qk1-x733.google.com with SMTP id w78so9350946qkb.4;
 Tue, 07 Sep 2021 01:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CQTyvCtnDaAPGiV4Gm3wvQ0nVPyZV73ZjUNQOmaKquI=;
 b=lCVcAduD++/dKbVmf5slwb7XzrH80KNNmovftpyunNCxCL7lgI6WVx4uqVEceDfzwF
 lvDrhOufk/jwJsC+iIfN3JpD8GFssKa7bWA3LUTNpKvetIUWTOz/2BISw98YxlS7uAoZ
 bse3hgeIaNQ2xLTa4rVu8JaOQD8/6mfebdlB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CQTyvCtnDaAPGiV4Gm3wvQ0nVPyZV73ZjUNQOmaKquI=;
 b=iEoWM5PPmMTQYgDE8naVVt9J45MDGtTPA6seMDfzhO5RElvRW6qyglmOcdNDn1oIsc
 uVyXYdZUAu+tQwiOLW8yluzLsOMjxX2D+FB62iV87COnPJSJXjC3R0b9Tu1/VyP6NIUc
 HKeGi1kjTzF5VOuzmqnjv+n5+lc3LdsU268kMU6IomPzttH8KdE2AqoAGPGV9OybrlS6
 +V3PMNCNmOCRL6ZgKMMxNnDe4eW/R5PQo9qjayt1RPpsvXSSjTtXNFRFIrYTE3WDsrfz
 rRLeGL9WA/tDz4r6iB52mYtMThTnqe7M9SyF85C7nSxcwfHq5q5zoB5L5Xrm3J76x6ay
 RPZw==
X-Gm-Message-State: AOAM533s12c98/IbW7J+OPPpVU9RcL1zu75/hrkSW1nuBXxK1aqH5cI3
 bQNaPgeCStxP5U2fazsY5x0GniQLZ7axq6z9zL8=
X-Received: by 2002:ae9:f201:: with SMTP id m1mr14284170qkg.381.1631005163414; 
 Tue, 07 Sep 2021 01:59:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210906133124.3674661-1-pdel@fb.com>
In-Reply-To: <20210906133124.3674661-1-pdel@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 Sep 2021 08:59:11 +0000
Message-ID: <CACPK8Xdmc3i8C7gkVxsuBcPuHKzDsTZ1tKcx5R7qVAHYN=uhwQ@mail.gmail.com>
Subject: Re: [PATCH v4] hw/arm/aspeed: Add Fuji machine type
To: pdel@fb.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=joel.stan@gmail.com; helo=mail-qk1-x733.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YT/4j4gTcpyv

On Mon, 6 Sept 2021 at 13:31, <pdel@fb.com> wrote:
>
> From: Peter Delevoryas <pdel@fb.com>
>
> This adds a new machine type "fuji-bmc" based on the following device tree:
>
> https://github.com/torvalds/linux/blob/40cb6373b46/arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dts
>
> Most of the i2c devices are not there, they're added here:
>
> https://github.com/facebook/openbmc/blob/fb2ed12002fb/meta-facebook/meta-fuji/recipes-utils/openbmc-utils/files/setup_i2c.sh
>
> I tested this by building a Fuji image from Facebook's OpenBMC repo,
> booting, and ssh'ing from host-to-guest.
>
> Signed-off-by: Peter Delevoryas <pdel@fb.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> +static void fuji_bmc_i2c_init(AspeedMachineState *bmc)
> +{
> +    AspeedSoCState *soc = &bmc->soc;
> +    I2CBus *i2c[144] = {};
> +
> +    for (int i = 0; i < 16; i++) {
> +        i2c[i] = aspeed_i2c_get_bus(&soc->i2c, i);
> +    }
> +    I2CBus *i2c180 = i2c[2];
> +    I2CBus *i2c480 = i2c[8];
> +    I2CBus *i2c600 = i2c[11];
> +
> +    get_pca9548_channels(i2c180, 0x70, &i2c[16]);

Wow, this is interesting. How did you go about testing it? Are you
sure you didn't overwrite any of the pointers?

It might be worth coming up with a better way of describing all of the
i2c buses for future machines.

Cheers,

Joel

> +    get_pca9548_channels(i2c480, 0x70, &i2c[24]);
> +    /* NOTE: The device tree skips [32, 40) in the alias numbering */
> +    get_pca9548_channels(i2c600, 0x77, &i2c[40]);
> +    get_pca9548_channels(i2c[24], 0x71, &i2c[48]);
> +    get_pca9548_channels(i2c[25], 0x72, &i2c[56]);
> +    get_pca9548_channels(i2c[26], 0x76, &i2c[64]);
> +    get_pca9548_channels(i2c[27], 0x76, &i2c[72]);
> +    for (int i = 0; i < 8; i++) {
> +        get_pca9548_channels(i2c[40 + i], 0x76, &i2c[80 + i * 8]);
> +    }
