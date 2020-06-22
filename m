Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3367440lfm;
        Mon, 22 Jun 2020 10:09:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoRJAXg1aBuh30UdRStWyi7x7ptt8YhxDBE4kIm23JEjc7QSppm9KqYVwg5Lco1Yh/9pPC
X-Received: by 2002:a25:4901:: with SMTP id w1mr30334817yba.31.1592845746733;
        Mon, 22 Jun 2020 10:09:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592845746; cv=none;
        d=google.com; s=arc-20160816;
        b=Wfn+3AHtjyfO1hklJzw85WqYu2mlpm/FXw4eqx6Na6uAXud68bnF9AP3DvxoSHb3PZ
         Y41CJHY4OzgWFhHbkBSXn5yGgmXYLgCUV1c7zF6QSXwGYd8QDp8i3I/7pozkVFzaQuHx
         fs8Rbvct/MWuSjIl28U72+KJS0PXzKeGlcW4B7PCOFdvztGu9Esx803CxF5390JCiaD8
         hTVgHEDeiqaM1GUZZhwbYECDezTeT6TYfWAISfE+oGM/OIuirf5KoPnqh1e3llT6HaxS
         GOB+LwURNo4CmpR4B8DPTKNqcwZ2rXGQHG5oq6HXDjnVduGqPfOGxeZiRSQPWGlOD4TG
         4D/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=WQQfFDoYq40CfiHUhwwPkezB8UxyGnyyo1IvcMyHd9A=;
        b=Svv7+QytyEJQowu2npPkygaMS7hUfldNFuROmjA0mSbyIMfT1H+BUAPGScfBiNgNmS
         LEW37Z1KDC+KiDklDQHQ1NcNvOE4IKtYx3ZBCKN5myVoaqWFd6OFC6jXfU6RHSBla7+F
         lRmKho0r5yqFkG7R0/7WTN3kpJGV9mKD1gutLgDgDLESzGmjJP2+vvhyMUKjxPcifc9k
         qb4TVpY43l/AVsE4yPD4zD0gXGuU4wT3YcIHQCosRCd21mzShKuR4WsijwYOncAsIeOp
         3V31KF/cJ5oZf492gFKnoPZWeYuYUrBaBsycQOeqEgqJw4GPOxvYQxdn7ws27Xohx6QY
         N9Fw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=z2cWwuug;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m9si13167828ybt.420.2020.06.22.10.09.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jun 2020 10:09:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=z2cWwuug;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnPwQ-0000VE-2i
	for alex.bennee@linaro.org; Mon, 22 Jun 2020 13:09:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jnPwI-0000Tw-82
 for qemu-arm@nongnu.org; Mon, 22 Jun 2020 13:08:58 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:34001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jnPwF-0003bn-LV
 for qemu-arm@nongnu.org; Mon, 22 Jun 2020 13:08:57 -0400
Received: by mail-ot1-x344.google.com with SMTP id n5so13679865otj.1
 for <qemu-arm@nongnu.org>; Mon, 22 Jun 2020 10:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WQQfFDoYq40CfiHUhwwPkezB8UxyGnyyo1IvcMyHd9A=;
 b=z2cWwuugy1ElolpS7kA2UA4ngNVvaxb4o6HZrSY7JrAXq9H6iNgnW1B+WV0VKTTXau
 fXsUSSZ/oWuAP1v/S+fTJB2stPDuk9T3WcNHJVCy6gZ5ANnSu7n8lpx62wO8xATjeoLo
 sDgMMGasMwTqscNbtRLj83fIK0jsP+QvD/I6ROyFWiClLHUTFSSMW0GtqBakpk6EuYsP
 CAPGAkTFIyk73iiWhk+bXmJ0pr+shn5NYl4OavrAoiUDo9vH7AYpKBhGhc1lSOVW8L/9
 Q5tBHs+M3W1eesdnlO/Nzmdvj+VUUNZH67F5l/nlMgeoNfXhuIuMNeu2v4Vf2SJE3z19
 1liQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WQQfFDoYq40CfiHUhwwPkezB8UxyGnyyo1IvcMyHd9A=;
 b=YqWRXs483H5gq1wSLomdCHHkraMslSC48HD064lPi0QWmIavC/cky/EbCfM5sq9Qrm
 4+JBjYWlyo2sHGHMG/5ekPZIlvR3t+QtuUw/cn+AC1UiSqgm0KaXwLG25wcMuvcEGCAX
 4YCOJde4GfkjySZtFs8h42eN0SwEsXFqFWTqOolOs1CNu/znnmoXxawpNkSJQgHpnngB
 iw5cPQV0q/QEwpfxNl+DJ0Od4bfoTyThwSmfKGPfIh1+wxMmwGYH5Xl5D4Er8kY5TMUa
 sOEGBCfKLS7ueI1Wrk4NM94hkkQ7fSxHJHuOKMhLhxUV8xtpwm+s0lovlSC7PlEBy01x
 oAIg==
X-Gm-Message-State: AOAM532xIICwQYiylLIgubfFjZBYbyddPrgNgY+S5EhzGBRMVd/IK9Yp
 O+EnyjEWB5niKoUbj/y1fsflWOD1KRPZxHsVV7kITA==
X-Received: by 2002:a9d:67d6:: with SMTP id c22mr14128153otn.221.1592845734224; 
 Mon, 22 Jun 2020 10:08:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200617072539.32686-1-f4bug@amsat.org>
In-Reply-To: <20200617072539.32686-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Jun 2020 18:08:43 +0100
Message-ID: <CAFEAcA9-RkKd0EQ=hzkt6C=ZVOaQtybmt5uVkPiK35SuQZZi0g@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] mps2: Add few more peripherals
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
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
Cc: Esteban Bosse <estebanbosse@gmail.com>,
 Joaquin de Andres <me@xcancerberox.com.ar>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cx0293nWESIW

On Wed, 17 Jun 2020 at 08:25, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Few patches while playing with Zephyr on the MPS2:
>
> - clean 'versatile_i2c' a bit,
> - describe it as 'ARM SBCon two-wire serial bus interface'
>   which is common on the ARM documentation,
> - add watchdog
> - added fpgaio with correct prescale clk
> - added i2c and spi
> - added gpio/i2s as unimp
> - dropped the fpgaio push-button patch
>
> Since v2:
> - added missing Kconfig select
> Since v1:
> - addressed Peter review comments



Applied to target-arm.next, thanks.

-- PMM
