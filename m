Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp258095lfg;
        Fri, 5 Mar 2021 03:34:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLzVLncchHJdv7N4Drov7mU5M8InoYgZRIwCehCF6FX+96MzVncsYrLQb1fEcA1VcoD7KN
X-Received: by 2002:a05:620a:15d6:: with SMTP id o22mr8692082qkm.181.1614944062310;
        Fri, 05 Mar 2021 03:34:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614944062; cv=none;
        d=google.com; s=arc-20160816;
        b=sysgENr8FgNZLrHOtxVAbngFNhTSt1/ie+U+YlmIRcbNh+59SZ4PFvwOiNfodeXsYG
         Q+A9Qp3PvOrWEeWyuxrY3tTFBCkiCVHjR2QGwSRbPuvoIPWCmoBMqtVwnei0I/JmqSKX
         4gxKIlGnk2RWcc/lp/7imWKOhldA6T3oBrqD8Qc875PcQY0Gx1W1XkUUXJv/3UdoDUZw
         /TP9Zpj/JbuUeZrUfcayLvARw2sG3cU4Vk0jHAE07OEXj6+tk8XEmimHPlVapCBJqiOk
         7/vOp/tKbLCHnxo4ks5/CWTIGkrggalfgCWY1S4e9eE2oHKXOO1CwWIHO9KnD3rh5rgx
         EXXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ZtZ7Ryo+/dzTYxD9daQmFc/Jm1BA0ESUiL0rfejY0sY=;
        b=1KjsFsFQrF3y1dE03xyO7JPblwIdXNuDRF0LdNWMIxPqIbt/tm8e3+m4ZsGDyOrQn6
         ULGJYEBCU2Tu+7orrl99LO+ahSYFlaH4tnC1X6ZhyQY0Hn7ZWsD9H95T/p1qL60lrWlX
         7f3NbJc+hGAdMsBfe+0P+7gCvTIUWrtL2FrNvIXiK6Hbenwu1r0GogQ3NhqLVhla0XsB
         sCpI0U0J63xH2UsKwra6tdMmvOMCVX8/UaqMisRkbZqUvUl72sENFT60UPTih7y6ILMp
         qT+jl5RywyaIwlOL9U0TB8SO2o2Z8HMSkfgFS0uyQx0f40pdBCNSNP0pjWCQ7qlExKNx
         45zQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=o4c5iBau;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iu5si1052825qvb.188.2021.03.05.03.34.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Mar 2021 03:34:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=o4c5iBau;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lI8ir-0003yB-JF
	for alex.bennee@linaro.org; Fri, 05 Mar 2021 06:34:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lI8ia-0003wl-CD
 for qemu-arm@nongnu.org; Fri, 05 Mar 2021 06:34:04 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:41739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lI8iY-0001Mh-Vs
 for qemu-arm@nongnu.org; Fri, 05 Mar 2021 06:34:04 -0500
Received: by mail-ed1-x532.google.com with SMTP id b7so2097620edz.8
 for <qemu-arm@nongnu.org>; Fri, 05 Mar 2021 03:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZtZ7Ryo+/dzTYxD9daQmFc/Jm1BA0ESUiL0rfejY0sY=;
 b=o4c5iBauHI1CyVUIxjOdFXC7aaVjgSiBBON2/9azc5SKILV9k3fBCc3Ryuk763Vonw
 83VUfCtoy2pZf3Z4P07v4VE/tFIxwIgBEu6a1bANgTCHXmKdShClG8YuvRFJns7GTlm7
 hgbpuAJARJR905zPVQBd04PmZ50ARtYxCkn/iAOngORv2xDfNM1orrwTM8osYsxo8zqq
 f7/Yux8IqbGESLy1JLwXjKM+1OTY6uH7z1kKII/lIrQhSVGdchosySV2m88x0to74TPN
 +UMtHBABI3PMBzcxrFPBa6hxvMHiRI+kDXk1OiElEkP+p5YIC5/fXiFTLaVRPTDMRGD4
 uRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZtZ7Ryo+/dzTYxD9daQmFc/Jm1BA0ESUiL0rfejY0sY=;
 b=AgOh9VHg7zlEf0bX6xe41W66dX3vnpbrjJ1dcpwBvmTy3XwIl5zYTIpH6ufifLi8mZ
 fnmv+ltBRyefB6ThY/KDFwM501LJnSHskUpKeb3DMKzb187hm4slpBCpTmPiDIDr4EqQ
 GXgjgKEXBJyp4NUN5bItlARHMGr0GOdQBuXUsfdz3W2yQa1NZgkiKOEIuU79s/hoT+Vl
 yQyWDVOV3XxogTmp4LOCvFcUSEiDqG7OLRACgyewXyEikgupaz6IZ1Hh6ujpt+3WXCAd
 LO91goxry3IFQmuy7veA4Y2SbQu73nZ3lGnH+OWcGmXYObCBqz29NhFhbQTqoKfAXEUF
 EFKw==
X-Gm-Message-State: AOAM533kpdouxBEZgMQpr0ZPliHL4aXEimNGvfuSK8ochAbOm878ScCI
 eAhl751aY3P4jbI3xKOesVpXQloxix+HroRUAmh9Vg==
X-Received: by 2002:aa7:c804:: with SMTP id a4mr8494937edt.251.1614944041554; 
 Fri, 05 Mar 2021 03:34:01 -0800 (PST)
MIME-Version: 1.0
References: <20210228224813.312532-1-f4bug@amsat.org>
In-Reply-To: <20210228224813.312532-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Mar 2021 11:33:45 +0000
Message-ID: <CAFEAcA-5=AuN1n-i5AaDeiJ2M_vOJDQCaWaX+AN=scQTQzo79Q@mail.gmail.com>
Subject: Re: [PATCH] hw/i2c/npcm7xx_smbus: Simplify npcm7xx_smbus_init()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: Tyrone Ting <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Havard Skinnemoen <hskinnemoen@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UaZD9Zh26F7k

On Sun, 28 Feb 2021 at 22:50, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> The STATUS register will be reset to IDLE in
> cnpcm7xx_smbus_enter_reset(), no need to preset
> it in instance_init().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/i2c/npcm7xx_smbus.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/i2c/npcm7xx_smbus.c b/hw/i2c/npcm7xx_smbus.c
> index 6b2f9e1aaad..e7e0ba66fe7 100644
> --- a/hw/i2c/npcm7xx_smbus.c
> +++ b/hw/i2c/npcm7xx_smbus.c
> @@ -1040,7 +1040,6 @@ static void npcm7xx_smbus_init(Object *obj)
>      sysbus_init_mmio(sbd, &s->iomem);
>
>      s->bus =3D i2c_init_bus(DEVICE(s), "i2c-bus");
> -    s->status =3D NPCM7XX_SMBUS_STATUS_IDLE;
>  }
>
>  static const VMStateDescription vmstate_npcm7xx_smbus =3D



Applied to target-arm.next, thanks.

-- PMM
