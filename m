Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp203716lfp;
        Mon, 20 Jan 2020 05:31:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqybDfShQF+mzvRzlp+X20acuXCzdpejfxO81oMTJU/laiZONUZH/3BASr9w/DZWUY1ZUyIT
X-Received: by 2002:ac8:21ae:: with SMTP id 43mr20712905qty.223.1579527099787;
        Mon, 20 Jan 2020 05:31:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579527099; cv=none;
        d=google.com; s=arc-20160816;
        b=OLAlRW1NYvv+ECphsF+Gcn5wqjcHNeRzZBcIKzk0bxRP9Wrbr4kyAM6aIIdh+5PNWd
         5CmhhmadFNTXmkerYUNTBuqdHBpRCiTe8MCl3BJUk3+9k37PXN9WxDflQURSPtNNOgp+
         QxcVgA7x/kqAG/yav5p/hkdEu2wehNGR1nXrpT0YV69ramjru/Q4jA4Jw+bPFnl0bpRv
         fTHAWJQ9CPClnDhhNdOvMeoh+60y5DYbBQiQzdzPqV3dfCKxTbgd+QLF7hFWGoVPFhno
         67nrw/OcsOAqTIGdVR53tCDmELWBETkVp0lNbQys9sugLHfmjXK+RHNAyftH8QVUCfD7
         WuWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ChVC8epFvp9yroNPOgv7CIpFELSfZf98laZCvjQinEs=;
        b=nFWn0cjF0Cd4+hjQ8Q+tneBO8xQUl+5+03MzroMJF96YTbCEpM+ZFMC+RvGRvNkrw0
         pqz3aPLsFqS1V8T1yG18T3/P1lfWfhwnlaKKaFbQFS1C0OVjVthLdCZT7P8TeZ1zTw1F
         ULVg6QurjDjPuoDml/rWuGdYnbNTpAelGkc6fBpJR7sHJzQwtto2YbLncPE9PuSGpeJU
         rhZ9pe68fr1z4Yb2coAnNJhTCsolpFiPU6rmg1luwtTO+haX+jqwk2xPx6mIXGq2eXkr
         BCHhJBxVdNwrNSK0H2N30L0Z3BF9wTBZX4hs38qCl7vp752glzvyAWWgcHHFcsG/RmH5
         uaUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HwKvzCLs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y91si7153824qtd.233.2020.01.20.05.31.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 05:31:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HwKvzCLs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itX9X-0006XI-3p
	for alex.bennee@linaro.org; Mon, 20 Jan 2020 08:31:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33497)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1itX6z-0003lb-85
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 08:29:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1itX6y-00017g-AX
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 08:29:01 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:40162)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1itX6y-00015S-54
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 08:29:00 -0500
Received: by mail-ot1-x341.google.com with SMTP id w21so28625179otj.7
 for <qemu-arm@nongnu.org>; Mon, 20 Jan 2020 05:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ChVC8epFvp9yroNPOgv7CIpFELSfZf98laZCvjQinEs=;
 b=HwKvzCLsZavrptVD2kwE0XEnTy4M0OHQAtTMuNxHypRWKD44rZGb1LE08n8qaskoz5
 c0kDSswcTSuXZxZ+85uIq+vOCTa9402VlQRCqvD9QbqbZ0xIR5l8hZPV4WxIUyzMiXTQ
 EloxY8D4J7K2Zfcg7NRXx0VXiI/WOK0SgMwaKoHGW6wfzs65WpSt/Hza9BU/OVfxFYDo
 PJw/nbdn/ofGyefxsco8ywAdTCUTahfjNpfZjK8dMM1aLJD6Gf/kmIyRTPswTXJPaz5M
 snMagB81J9ViBHBohVV9jvU7NT9RklwE8bKHEfo4TvHWiC1NVzBWfhU7hqIvz+pigUZl
 g3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ChVC8epFvp9yroNPOgv7CIpFELSfZf98laZCvjQinEs=;
 b=KRyHFesYq1wwsui1LRDblmto/tyNT5HhAinVwjdIjnpDHrQHCBdr/KgsZE/TXx1V1r
 rKsYitGiBn/IMdNT097nI1qPAaFwwu5TfXPvgBWksxtRQux5W15oRW23n/x8ruOQ3R/Z
 Ybu0zseAVAv6iaBpjWmX3unCTjBgMSu0iWGl8286xgEDhmZq0y6wb+ozit4tl442iSSG
 z/Z06Ajff7hBVPKBekd3lxGZUPvw4QxTDSrSjsy4aVmFLPuxBMJbq0MQauiO7UqdaYae
 2CivOuTOGy1s3GKKCV4L/CtiqmWNPur4tViAUsoGrhG9nElKUBBgoQalK8VFUsSfzAsq
 59Iw==
X-Gm-Message-State: APjAAAUJsphsk0ropJwz66RjQVSBuJWRfGogIdSJJSwF/yLCerS+gQvY
 w9Ed7kvhtdtTI9ov7nbp6B7X/6xHDZQgKVGDOpUc1A==
X-Received: by 2002:a05:6830:13d3:: with SMTP id
 e19mr15878523otq.135.1579526935737; 
 Mon, 20 Jan 2020 05:28:55 -0800 (PST)
MIME-Version: 1.0
References: <20200118164229.22539-1-linux@roeck-us.net>
 <20200118164229.22539-2-linux@roeck-us.net>
In-Reply-To: <20200118164229.22539-2-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Jan 2020 13:28:44 +0000
Message-ID: <CAFEAcA9F+SDOGJDb4q44BYBw=0WJZXRGpncdptrNvF5X+Fn8Lw@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] dma/pl330: Convert to support tracing
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bdXbGfprwzY5

On Sat, 18 Jan 2020 at 16:42, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Replace debug logging code with tracing.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
