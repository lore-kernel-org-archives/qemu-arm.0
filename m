Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp279363lfo;
        Thu, 28 Jan 2021 06:42:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztcRIZuA49lEi1m+Y3E6t3KYKfHCqZx+FBKJ/xNOLaPMoDozj8Fx5IH41RJk4DTdAypSti
X-Received: by 2002:a25:ae49:: with SMTP id g9mr25981982ybe.381.1611844929256;
        Thu, 28 Jan 2021 06:42:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611844929; cv=none;
        d=google.com; s=arc-20160816;
        b=BUuoC968QhuRqB88eZlFZs+YTcDt6an3tIcYcU593NGpMru5ycaXEBxZ0DUH+kf/Qe
         nD+FnKYFaOifoXz2pA4eZqzLrs2DqFWxrSZYNkiiwN3IGQxUM14JEp3RvKSPnYnTu36k
         NbulgaTWYAoJHEQe1z+SOsP8AVQUkzcBdmAyUQcWZlw2qTQE22cST0BVyonAaT0q+jsS
         35zmsMP2cyeE79C/2L39LNweQ+VNsThpzfQZfpL9VwWKmSem9ocZ/tU7X9XZzPbya9pp
         8/E8F93h4iDV8QY8M6vCtIPDH8a//7HVtIvBequDMxvDbh3EkRKSsyd86MB6+Cw8BrIL
         xslg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=6HIVzNVqs8si5zhdqS4qhDfVW8FvAwhegS35T9JqgpE=;
        b=HjymDB3ewCVHxNWupDi/XXBBEyRLvTh3T046epqCAefJoUcTO8RcOqZ51W3sBsP0MX
         m3vTf3xWSAnuX0DINDCv4PpyimwjQgjb0FCWKI5xBcbcgwwR0UWirgPAZGGOWsslpiyt
         BNygqXamcDWalfHo/zzFeFs2p+kP1kUbdU3KqLGY1CK0cmuXCR/OyOU6AH6uzqvGpc9A
         t7ImZMZE3rPnpD/mJ/5uiVYN0l/lIw/UxrpMyQsK3Avrl83Ko/GCs9dp5KsXk/gBCeds
         eDSq9c3yBTXuvpzaIUh0cbpn7kVj/WV2QWOgZ9CH0VaYnd7f392RfHjnFL2+29zvOlvF
         6ZDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vn0COtHb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3si5792111ybp.64.2021.01.28.06.42.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 06:42:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vn0COtHb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l58Uq-0000Z8-Ix
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 09:42:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l58UZ-0000Wb-5F
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 09:41:51 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:33715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l58UV-0007HT-EM
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 09:41:50 -0500
Received: by mail-ej1-x635.google.com with SMTP id by1so8168377ejc.0
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 06:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6HIVzNVqs8si5zhdqS4qhDfVW8FvAwhegS35T9JqgpE=;
 b=vn0COtHbqCX//3Jyne5pmBN7AbiywrY2BdjPoYDOnuHLWGPsP6i8yV7EJ840G8Q3Wd
 E9gs1bTIjhGb8oRTuXCHTBxZbTdvlN+9ZtZNtcDifir7OLUmF/hnnocPTZrw82rfLc63
 s5J0qlq1utLixiY3CrFhkF6l8BcdaqAs0HHHS3WZBo1n0QLnLttPabmHVvjRMDbP8PVn
 ZHrON4NThmpLQAHOv74qu5Xa0S1nqcXjZv3plOn+krp6eQrtb7igxV0MivBT6Pl0tnxF
 x+whjAisN+5KQT7nb+HZxG4wuDzpIlfkxo40ObnmFoNi+PwcJ6fVtAw8X35s9t81FWh7
 aF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6HIVzNVqs8si5zhdqS4qhDfVW8FvAwhegS35T9JqgpE=;
 b=mFpUkE0a/roA6bYz2grTSYVl8jJEY1d5PRnP+VJwi+sMnf1BSrBCYPrJmxDBTjMiNZ
 zlg3lX+9rM7DJFoJOA9F9UndyllhJ49DRuM+Id96ZNyT6392xnF5wWP4QaSssEKPZpsR
 hkO9sBev8eHQP2Ji/2VP/c6zDvivwkBCqu12kdhpdD8d2We3WnS6pvnh+QsuoASPxp5G
 YOlyIhRUhshXdNynF3Q+WTV8/3W63xmM6gbisK4OlzOLLasWjFvq9QDW4s3hI+Q/FuiA
 ft5NiQ03uReq8jVvfu0oKlLBG8XpYx/5NOixDAg5/3ptE+NXEdI5Q6YbhG/1e/DF4S1b
 //lA==
X-Gm-Message-State: AOAM532LZAYsB2jhXAFBTafg/VL9Uww+0SzkQVz1i7vUh4Aj8XsfGFQL
 MQo2htGb2lz/TgsYZMN2cp9B3vIhiPbC30/mPph6kA==
X-Received: by 2002:a17:906:494c:: with SMTP id
 f12mr11681040ejt.56.1611844902345; 
 Thu, 28 Jan 2021 06:41:42 -0800 (PST)
MIME-Version: 1.0
References: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
 <1611063546-20278-5-git-send-email-bmeng.cn@gmail.com>
 <CAFEAcA-SG1nJ3g1dDSvZ99Wgduz+Wd0p483keCvd-oQNb0DO0A@mail.gmail.com>
 <CAEUhbmVTPnPBO-8qY1UoZ_4HR4d-GcMLcwCf-Hm20rhD9pSi5w@mail.gmail.com>
 <CAFEAcA_cE=fHmegAjs0Sefk4p1Fhi34ohjFcuxYFQUviBtRszQ@mail.gmail.com>
 <34c45d74-adec-2734-830b-612b5e2f6083@amsat.org>
 <CAFEAcA8=t6pxsvSt3FrPbAPXKT6y4t4hqjU8CXfbsw=RbbXK_w@mail.gmail.com>
 <9a8312d7-d3b3-b896-a669-8ce8efc66bf0@amsat.org>
In-Reply-To: <9a8312d7-d3b3-b896-a669-8ce8efc66bf0@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 14:41:31 +0000
Message-ID: <CAFEAcA9LbKUZPhDfqQjHGfF9s-Se2drWYmKkn6pHY3gQit=BcA@mail.gmail.com>
Subject: Re: [PATCH v8 04/10] hw/ssi: imx_spi: Rework imx_spi_reset() to keep
 CONREG register value
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZU1aKGn1uLfZ

On Thu, 28 Jan 2021 at 14:32, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
> Oh I totally missed that :S
>
> Bin, I'd correct this as:
>
> - extract imx_spi_soft_reset(IMXSPIState *s) from imx_spi_reset()
> - zero-initialize CONREG in imx_spi_reset().
>
> static void imx_spi_soft_reset(IMXSPIState *s)
> {
>  ...
> }
>
> static void imx_spi_reset(DeviceState *dev)
> {
>     IMXSPIState *s =3D IMX_SPI(dev);
>
>     s->regs[ECSPI_CONREG] =3D 0;
>     imx_spi_soft_reset(s);
> }
>
> What do you think?

That doesn't give you anywhere to put the imx_spi_update_irq()
call, which must happen only on soft reset and not on DeviceState
reset. You could do one of:
 * have a 'common reset' function that does most of this,
   plus an imx_spi_reset which clears CONREG and calls
   common reset and an imx_spi_soft_reset which calls
   common reset and imx_spi_update_irq()
 * have imx_spi_soft_reset save the old CONREG in a local
   variable before calling imx_spi_reset and then restore it
   to s->regs

thanks
-- PMM
