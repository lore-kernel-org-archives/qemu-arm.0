Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1678830lfm;
        Thu, 9 Jul 2020 11:25:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaU2aYRC9veoHiTmWO2gAMsqHK9Q/0P4vhQ+aymXE5+B+OA8xpsXaXthrqCzQn6c+qjBZv
X-Received: by 2002:a25:1f82:: with SMTP id f124mr104162321ybf.439.1594319121551;
        Thu, 09 Jul 2020 11:25:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594319121; cv=none;
        d=google.com; s=arc-20160816;
        b=esceiFGTW/tNYnadxZ2UDSB01u+wqf0IS0Tq7pMlz68Pj1xC/M4M4EN2ttsNHxRSKS
         kIwNeaQsKHwMB1I78vzHf1fA2zN9w95JOmNYl6mKrZ1v/mhv12mf3UUHBC6AyCYJ67D3
         4a2hOyq9BZ8px8SXh/h8VQ+f1+Ava8FiRXtnz7b8APSGfdUvTcZDPA/VQsfwNNl4ghky
         DtEtmfpzo4q4N51ux1yCOo+9n5a0yKT56c5Gx/rt0+saGP/8delgEvpuqAGCTsn1mpvv
         swWlq0x0XqiWCuHpF7Vs/PZWArZ4MbRn9FelrINhsYm99GoEoc8pRFqgWBTSQSlYt5su
         7iDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=TwE4/5g6BhhiF9NwVqNiFgWkPQe6TS0JnKm85vwKVak=;
        b=fabc01ca8safHWC8FjQiua6DwRcVzJ/uU+jLDVG+mH0MaBqeHO+R27Xhz+XtfTco6V
         4JApyI/US9tTm7L+t8PdX7heYVXWu26GtCQgVCTHFVRbQ+i1UrH1BxGoNoHZhcTAywm/
         /WAF126CJfgauR9cpn7qW9HYDCyLOk/1VjjQ3X2olX6ZTz2i+MeXzM+eAUF3bI1O4jzV
         S5GoW6UBp4C5gMSpt5u5XWILemAPl2DxmYG/e7S5RQqGDIaTwUCBOpwZU0CjqSqHTTMX
         WHcMwfBA1Lgx0UgA4XNhMOXyrFZFRgGWwyR6P6G8QR6j2jQQQ6Vp8QU8jBDl9nMC8/DF
         jxdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=D4l4qXaA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b125si3034936yba.89.2020.07.09.11.25.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jul 2020 11:25:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=D4l4qXaA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtbEW-0006CD-TZ
	for alex.bennee@linaro.org; Thu, 09 Jul 2020 14:25:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtbEN-0006AO-PO
 for qemu-arm@nongnu.org; Thu, 09 Jul 2020 14:25:11 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:44126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtbEM-0004gR-1t
 for qemu-arm@nongnu.org; Thu, 09 Jul 2020 14:25:11 -0400
Received: by mail-ot1-x342.google.com with SMTP id 5so2344585oty.11
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2020 11:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TwE4/5g6BhhiF9NwVqNiFgWkPQe6TS0JnKm85vwKVak=;
 b=D4l4qXaAJN40wcqAAHhh5cXKLsfvdu3nikJQK8qVTGoi7/C1bnZaK9LXx+8CJ+H7K4
 VSEaDty94eOw1Cp0YBt3RhxwiGt9ZkV9a9nwYw+9bQmcbylitT9zcL2tZCbJxqpiZ2yF
 SchdkyiZXTUfm+pkStViHgd7Bs2BWhdzPwL5RNmIiMyHyGfHkmtVAb4L5SIOgrPogHcx
 8PbzrId68eFBALXEhOgv3rGVBYmaZbdArY3SxrNFAXxz33/znJFHtijaUxh3Q7j70/oZ
 xCdETCvFcysuli3pjmsIWK6LiAsesOI5VphJCWWoFzhcoTmO8Vz+tv8Rzqd64tcc1ItH
 IDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TwE4/5g6BhhiF9NwVqNiFgWkPQe6TS0JnKm85vwKVak=;
 b=rDjaMnv9dNOUGoEEWd2n6M/fJe+BlpoQZAEvl6M01l18/+B4veM+ANmgsRxCDD7ird
 jTYj1zypn/XwnCaBsMWIEOzDOhAGFWEwCmNQTuQbMiB1OUrZkvcaAGLoPwVhomki9Vhs
 0Dhhk9EJ6lHAn1hGYOy6oH0+rhyHoz/CcFjtA89jTgKBzHBkLez97Wx4FM71kU/26R5g
 X/EpDFf/Cw9njrwPnFVig7rlTxmyaf2KRKSp07AvPow3zevfJUAV9rTFk71KLwkYIVqf
 2aNv4WEawZhuBD8KJ95lq9HzU2hwinjCZUDdZX4hfjYQ9bUhy7Kcep7J69iFJM+t91Ym
 Rf6w==
X-Gm-Message-State: AOAM530Gwz85JsoUJyINsTcQ+bOidRIgaakSU8ATKzfGkW7EjpMAjsx7
 H3/g/F00oJrXMnT16aGJm00pZoTRl1BXDfvagz+E5g==
X-Received: by 2002:a9d:7303:: with SMTP id e3mr47423557otk.221.1594319108787; 
 Thu, 09 Jul 2020 11:25:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200705204630.4133-1-f4bug@amsat.org>
In-Reply-To: <20200705204630.4133-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jul 2020 19:24:57 +0100
Message-ID: <CAFEAcA8nxstjcY+fGnLXdBFSeDRBjL2mDv66bBDUrudc9hJLSQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] hw/sd: convert legacy SDHCI devices to the SDBus
 API
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h61CJdcUyDDQ

On Sun, 5 Jul 2020 at 21:46, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> Hi,
>
> Since v3:
> - rebased (was from Feb 2018)
> - use named GPIOs
> - addressed Peter review comment (adding TYPE_PL181_BUS object)
> - convert DPRINF to trace events
>
> Since v2:
> - pl181: remove legacy sd_set_cb() (Peter)
>
> Since v1:
> - rebased on /master (Peter sdcard reset() patches)
> - fix milkymist-mmc from previous seris using instance_init (Michael Wall=
e)
>
> This series convert 3 devices using the legacy SDCard API to the SDBus AP=
I:
> - milkymist-mmc
> - pl181
> - ssi-sd
>
> Then move the legacy API to a separate header "sdcard_legacy.h".

Hi; I had a couple of minor comments on a few patches. Alistair
has reviewed the rest. This is all for-5.2 material now, but did
you want to take it via your sd queue or should I take it via
target-arm.next ? I don't mind either way.

If you prefer the former you can have an
Acked-by: Peter Maydell <peter.maydell@linaro.org>
for the series.

thanks
-- PMM
