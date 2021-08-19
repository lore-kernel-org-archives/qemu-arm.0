Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp354568lfg;
        Thu, 19 Aug 2021 07:01:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkVABb95gsPdSxmTqFcpiUI3lJKIdT6QfMYx5CzHXeE1MJ6rtBTHOX977gOSGaWt3NeDLV
X-Received: by 2002:a05:6512:3d22:: with SMTP id d34mr10956229lfv.326.1629381704963;
        Thu, 19 Aug 2021 07:01:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629381704; cv=none;
        d=google.com; s=arc-20160816;
        b=goDsObSxhQxWYqaNKrlDnvqlTcPF9rthAaSSCetOtKWBmkHe+WHhYk0id1KKMNFjX5
         7n259wjHJPBZmwDYoOL2rE0kxBmcZi44E7x4qwodZMCJLQOlOE0p6TF2cbIfpZ1VGl+d
         ukkGxK+1NSGYGuOSlMotR3P5mtqCYbrG/uzKj27lIKZv3xxzpPl1I4IZqpc9trRK+V9/
         asVDo+J0V6nM+KtBqXM5sCRGc6jcqR4Lp2EaCFkNcctBG2KrcanE7j4pyUsI+GCkm9N6
         4Dm6kYkEi1KmzluT/Y15hh2ogV3/BpIjbKL8+9QvMZbF29RI7WDcRZik6zNtQ/C+L6G8
         hFDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qOWPiMEJ7RRw9LZJ7LOpCvTvwBQ3CiQLaFjnVf5nx8E=;
        b=TLbiqDnk+cSbnT4Ku5Q5qgFQJyszjVQ7SLewYsJNh3NX1QGpw+K56BAqVaLRXIXtYR
         v4397XWPClJ70xiXhNDQZjlcdfwxbfh3biT0xSNchEuzJGFBNoOCsEtD/r1tK6ipCVS4
         MwxLXZ1zuDmbvbfJJ3VzwETbUU30ZCB4wHn5TJBEhcgD5ftST5IhU5wmago5291dNmoP
         dvuwEFdCT7E1tSZL8kYi5fpGTmmFoStOEcEukiCqb3xvE8y1E4CYcwSubtJpjiSh/D6r
         c/1WGDcBKcrFQ6/JwbnvAqa0+QJCKZH3u+2YUkPTJcbi2pIL7tlPAfmddkpF62qhSe2Y
         0a1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AApYSL5N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x16si5293671ljp.153.2021.08.19.07.01.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 07:01:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AApYSL5N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGic2-000090-KG
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 10:01:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGibh-00007E-La
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 10:01:22 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:44923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGibf-00061w-0f
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 10:01:21 -0400
Received: by mail-ed1-x52d.google.com with SMTP id i22so8985129edq.11
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 07:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qOWPiMEJ7RRw9LZJ7LOpCvTvwBQ3CiQLaFjnVf5nx8E=;
 b=AApYSL5NAG38IxeJq0/fe5iXJsaMTnSZh6w6WrfwOBhj/8iN5vc42wNCaNFPP8DLgE
 HYko4HA/mlPls44xMWJ4LAIxgV47R/Q0jQB/rmFCwZBRykeTZLcN33+nN/pChBqcOGWX
 g04Gu1pNyU8HFaU66UXH5TBQq396FLErlJOobJCDa5PH7VgHVfi68KXqIiM6n+X0M5t6
 wFKl1bl4jFq9J4/ENVyrI5PMNAmKMACRqaGRs5sJvptkt48TTGqlkWm4bN4hrbNpRs9v
 9XwAowtREL1Nea423i+83U2RSq3z2SCbPGsXSC28EBMEOUMdfG3jUJqPkxm7RVPyol13
 JtKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qOWPiMEJ7RRw9LZJ7LOpCvTvwBQ3CiQLaFjnVf5nx8E=;
 b=DRzBs377BFeVQmyLy+y8NdKVc33p5G1kh+VRTi9aaTKI4AR+sS9nTIGki8KkdKJ3zq
 BYmkdBhw2iB17FrZWuansxr3uAyPoWf3Ub86ITAy488mgUOPYFDXnwmsmug4sKskrwEI
 LedTti1vTEjpi3tKUI+aDCU13jGC+nf6ScmsmeuXp7RhbTK6Ly3+2nDGBe/lU39ptVnv
 5TwB3LVOMAlAVBFLESiNAd1zu0SJwSVHekigxphqiBruMz0PMCah2reyg+CXtLFsnDZ4
 HxkokAHUQJsBEXlKjQ3wWV/7onqjrKXFJmznwgg0lH3O9Av9g2mBrkMV1GfMHtDubEER
 BDfQ==
X-Gm-Message-State: AOAM531u2tuv13srJ/Ns4OwOBL79lspYvF/sWkJMY1PpwGosk5IfosEU
 P8l0pVwUx4mRjSNOfgBK+HMqeU6jgH2PanDG0dW1gw==
X-Received: by 2002:aa7:dd48:: with SMTP id o8mr13203139edw.44.1629381677472; 
 Thu, 19 Aug 2021 07:01:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210813233353.2099459-1-wuhaotsh@google.com>
In-Reply-To: <20210813233353.2099459-1-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 15:00:31 +0100
Message-ID: <CAFEAcA9OtK-CEUEdGVdktSJntFL1nArhp+_n5DekfZ4gy-PZ0w@mail.gmail.com>
Subject: Re: [PATCH 0/7] Misc NPCM7XX patches
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
X-TUID: DfK3Dm8Dnk5O

On Sat, 14 Aug 2021 at 00:34, Hao Wu <wuhaotsh@google.com> wrote:
>
> This patch set contains a few bug fixes and I2C devices for some
> NPCM7XX boards.
>
> Patch 1~2 fix a problem that causes the SMBus module to behave
> incorrectly when it's in FIFO mode and trying to receive more than
> 16 bytes at a time.
>
> Patch 3 fixes a error in a register for ADC module.
>
> Patch 4 makes the ADC input to be R/W instead of write only. It allows
> a test system to read these via QMP and has no negative effect.
>
> Patch 5 adds a new aux function for at24c EEPROM. It allows us to attach
> a drive to an at24c EEPROM device that is used as the initialized content
> of that device.
>
> Patch 6 uses the function defined in patch 5 to add the EEPROM and other
> I2C devices for Quanta GBS board.
>
> Patch 7 modifies the Quanta GSJ board to use the new function defined in
> patch 5.

I've left review comments on a few of the patches. The first 4 look
fine; I just haven't left r-by tags because I didn't go and look
up the specs for the hardware.

thanks
-- PMM
