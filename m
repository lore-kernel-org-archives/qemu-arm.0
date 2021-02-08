Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1487270lfc;
        Mon, 8 Feb 2021 12:48:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzhCbieKiEZlZYwujTuUV1bNQPWMl4ylvZ8sjU5Vp+C2yWkkahKO3abJms+mmWb3ViLK1O8
X-Received: by 2002:a25:d6c2:: with SMTP id n185mr29133451ybg.71.1612817309134;
        Mon, 08 Feb 2021 12:48:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612817309; cv=none;
        d=google.com; s=arc-20160816;
        b=SkZygB7vMFC7RdhwdkX5BluzieLWFwKJjMqbMIWy3VLUVjIJuG8VRtJaICQD3P7mbu
         j7TiqvS8umFSBFzmtz7TX/2GJ1kposKwdxVT44+4SOK0saGFR/lstDhXICObz+sbS5vW
         +jeAir4/Ygl6Ci8pQ7cNm4joi4CF8GsDPD6w0EwZ6QUd8w22bGdvtQJozL6K1S7f8fz2
         4N8KaXQc+6D91fSsAl0X3jnkJHEP2KSIVqwBmSxPMR5aNzzPZK4QSPiPnIfPzjZN/9Np
         933TaUGpdGxf+Vncq7ablELYj51rYuGm1bHdjFQxnTCLXcGdgIopATnH4ppBdOiE4KNc
         N6QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T7EpOvekMzcS6TcjPqjRFq9f2hrGZAm2fZihh7vwhiI=;
        b=i7O8gizoEgv0h015zgZI0f1ij+czFqBBs7Rzmyz3eOQr+djejHCeLidAQGh3R3xhbM
         NL7M+J0rQAUynYqjQi/kk5ZlvwtsvTPa890fAJuXr9DHPtsx2LNraBoy7mkGPmXhU4Ll
         PawM98apcwujff+w8tJ67+mLDKvzZyTIn+uzpazDcsh0HNem9Nwf75cJXux+DiIKCF3E
         QM2gWS4gXl3kxD7iuNWqzfkc6e9d8zKD9+TlhzSWnMlZYt5zboa+92fAUqfq8ay81e10
         WcAp7AITQxDZUrab4CkCYDDllU5HPEmHg9J17DFsMWYGraUWo9iPigthk0C6OWtx1Obg
         bVJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="tJ/1X19y";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k142si9959543ybf.236.2021.02.08.12.48.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Feb 2021 12:48:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="tJ/1X19y";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9DSO-0006BU-HU
	for alex.bennee@linaro.org; Mon, 08 Feb 2021 15:48:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l99iM-0001C8-Lx
 for qemu-arm@nongnu.org; Mon, 08 Feb 2021 11:48:44 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:41175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l99iJ-0006xn-QE
 for qemu-arm@nongnu.org; Mon, 08 Feb 2021 11:48:42 -0500
Received: by mail-ed1-x534.google.com with SMTP id s5so19111738edw.8
 for <qemu-arm@nongnu.org>; Mon, 08 Feb 2021 08:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T7EpOvekMzcS6TcjPqjRFq9f2hrGZAm2fZihh7vwhiI=;
 b=tJ/1X19yhE2Z2yMoprDToY3zWS3OXuzZMp0N86Ko/na4IZuqFtTFA3rYdfL8zh1agd
 VcqNmLrpVE+d3VGVa9/xrGFtTKl1JrGKurpV9U9j/icwf8cBteEK/jAzIAMZOIBf/eMP
 tNjw8tFKF2KYF/IIrGtsPeL8y+oJ3hFQUWLHTLqn9rLq+DJchRYhitev9ux3i4kvd/Oz
 XBMqrAewwVe/yHIg76mYv4z8ZXcBjutZaEBLOW9QUQwVDwoALayGSnB8CY7FoIPe0axZ
 tMLrzmH7neIUS7la0XgNYnDaTG5GRU/jJ1lFMEuGXHqDybUydzl5EK3eTi4Dr6rFzjqU
 NmVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T7EpOvekMzcS6TcjPqjRFq9f2hrGZAm2fZihh7vwhiI=;
 b=jLz+eB14Alo8qqCWTmRNOsmqakToZAPPeErj20sXu/2snpkCa5jerilCwU/yRMCFLt
 /fBtaeMUPKpiMIkY2qiN0D0dEe4eBzwvNfkoDrJUY0XYd8ajfJXYPl1YnlDMwJrwfGzw
 DaWBBWAh0fIcQB07s0rbto09bc++O+gfJwY9mjFWX8ey+rz9vHRRiQ1D6HcZ+0ttSpZ7
 uu8ZkoGImZnZrwL6wK4I8FqyNnUQS+1VYz7kiOHB2du1KSRQkR01Lx73pKPoo5mDmXOr
 xF3lZwo6WOIVSCI0yt9cyH3W0fLHg3zcbYjHA0DFKKEkRj2Tmg2vAXzyBUmwQxUo0lw7
 ulcg==
X-Gm-Message-State: AOAM5335PYoC+GFVCaCxOJtmabgDsfYyEnNKKnvZhFYOGgtTAx/cqC2q
 5s6QDPoP57hr/f85nzTT99RL9rk3fTZgNYhZGsRCLQ==
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr17893871edd.52.1612802916176; 
 Mon, 08 Feb 2021 08:48:36 -0800 (PST)
MIME-Version: 1.0
References: <20210129005845.416272-1-wuhaotsh@google.com>
 <20210129005845.416272-4-wuhaotsh@google.com>
In-Reply-To: <20210129005845.416272-4-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 16:48:25 +0000
Message-ID: <CAFEAcA9Q3NrOEjf4OqYqC7xV5dtFe0Drvk0AiMctMGaVLkEWTA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] hw/arm: Add I2C sensors for NPCM750 eval board
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: Corey Minyard <cminyard@mvista.com>, Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 Doug Evans <dje@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KxZrG2lEzGO3

On Fri, 29 Jan 2021 at 01:04, Hao Wu <wuhaotsh@google.com> wrote:
>
> Add I2C temperature sensors for NPCM750 eval board.
>
> Reviewed-by: Doug Evans<dje@google.com>
> Reviewed-by: Tyrong Ting<kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  hw/arm/npcm7xx_boards.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
