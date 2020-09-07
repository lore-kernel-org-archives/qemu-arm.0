Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp3718480lfc;
        Mon, 7 Sep 2020 05:45:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyC0XjETlyCvtdcfeeo4PIH6b+MdVUeGXVa1KnxIb6Sxrz+7ZFd1KqCCvTmUGM0mPr7KE+S
X-Received: by 2002:a25:85:: with SMTP id 127mr26115725yba.345.1599482750264;
        Mon, 07 Sep 2020 05:45:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599482750; cv=none;
        d=google.com; s=arc-20160816;
        b=VHhg0q9nTdMbQ0tmfACWo7hLBym1Vvqy4olv1DZwe+VD4Rchi8zTbVG52WEwk2MOPz
         wxgE54hJIqhsP2NksIMyghbxcvz2ax3FF62kMysdbFBxqxgDftSboK4ZId65cMrAe8Bp
         d6gvv8N2ioORor3XIPr0l4Ih9+wvfUkI8RwqZ/FLbcCR/4HckAJluaWaJn3RPS6r7/rX
         akS5QofO6Boy/nVhVNXf+vX6zGP5YsjjtuwZU4hkVraeNwQ3kze9n9bdsGwjkd3xFbq1
         C53gdew1PdR2k6hveenOjxaRVkEkFD3VungEn9gcYuNEwuWe7fhIpyOGYUPwj7/LgEpL
         x54Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M326HST8rus/b5ogCHKy67qhC78OQtkbH3pk/VV9p5g=;
        b=bZwi8OOmYPsNUqie5e+ZT2HxxMUwX4U6Or6sLaI2RFUO1K+Z0nQ55wdBy7WV4Mt491
         oimu9jy7slxj6GmPRu2jzmPh1y5yA+TYMT8Ep0Q30R2+Jhy0HgAz1x6XM2Z0ElPtc9HS
         A4wpKdZuni1eKkP/AodDFOIbJsml8KUEk92YIDjmArA2dX3NVHT2Bhi6btWrWTRJ01xF
         HtQSclrvrlaMQsxiu6OhANU/8mcidLSp1kHqte6hFS8Zh7tyXE2ZruZD+O2ZuDE1Y4b9
         O2WvgO+jn2A/TfAAnDl6mTSI+0GMisT6CKAKYjMfqFC34B9rUX5YC2SMM4UmeugDKdDy
         0GtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sv4gHFde;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d194si12451577ybc.8.2020.09.07.05.45.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Sep 2020 05:45:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sv4gHFde;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFGWr-00035A-MD
	for alex.bennee@linaro.org; Mon, 07 Sep 2020 08:45:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kFGWa-00034H-Jg
 for qemu-arm@nongnu.org; Mon, 07 Sep 2020 08:45:33 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:33051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kFGWZ-0003LL-4y
 for qemu-arm@nongnu.org; Mon, 07 Sep 2020 08:45:32 -0400
Received: by mail-ej1-x62c.google.com with SMTP id j11so18132724ejk.0
 for <qemu-arm@nongnu.org>; Mon, 07 Sep 2020 05:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M326HST8rus/b5ogCHKy67qhC78OQtkbH3pk/VV9p5g=;
 b=sv4gHFdelU8tKt/FQE0/Yqi77oE18/SyQc/zNHNxGOFP0+VmA5EsDL30v0eggrvMx0
 +Q3+0xLKxYG3w5nzRPl1SktZ8HsLPv4a3KIcVXopKPqa3fDr3tF/CsfC8rxwcRXbOxZ+
 pMmxBZjpfP4/Ps35ZaUW1w6KyJklQ0JgxHwojAMt7X+CMTdiQOniu3ZJTSjPzmK7pCzN
 BjWBH4BX1+WfsqhtYeszvi1qSAlr7+iXCb5Qjcx2itP7KqmpbGUbQr/29skbE74PmzPK
 w7RadjA0IRAmyC8zNN1gZXNU6i0uJR2NGYZr9DS+hUPxX69FzkpPnVX+0L0wBcTnWJhW
 lRJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M326HST8rus/b5ogCHKy67qhC78OQtkbH3pk/VV9p5g=;
 b=V7afTDwmKsW+HHRjvki2uWXIrtbJulEF238oSW/01/vlu/nos8Zj0yI5iOrU3m+0/4
 c1V0sh/rGHnxXFSzHLE7DHbfFwqtbZNriDhUj0PbJ1qLV2iF7k/GcEvycswATeNI/FCM
 vrYi6Bz5X0Lw+0+FqDkh2lhSucuxDJ+fWnzt0XpzdR+l4gm30KBQJ/Z+F5GT/3w/puA/
 vpaWj8rax5GCf8jxLBYIJO9iEIy/IAuySdHgx1jxZmoawv1sZ5tRVZyVgsiAu0hhlVk+
 UTxSrJR0/JcEHVQB6P6uSGw1WmcYWgtLckXAPybBE7HwGvtHuPwEjmq9Q5qndI2Xokji
 6zXQ==
X-Gm-Message-State: AOAM530w9EJyWicXnGTm2cd8brT5Lxg+t0nkefXnlM1Nqg+5lWJMe+m6
 rY7b1bgo10vzQ41XZ9xoFhBzYW+ti4PasU9Re5xXGQ==
X-Received: by 2002:a17:906:1f42:: with SMTP id
 d2mr10294423ejk.407.1599482729158; 
 Mon, 07 Sep 2020 05:45:29 -0700 (PDT)
MIME-Version: 1.0
References: <247800382.3961587.1599480937300.ref@mail.yahoo.com>
 <247800382.3961587.1599480937300@mail.yahoo.com>
In-Reply-To: <247800382.3961587.1599480937300@mail.yahoo.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Sep 2020 13:45:18 +0100
Message-ID: <CAFEAcA-e6xQjhKBHMehzjryFE-i+Who4ZQJDWp6PYFeFo-qENA@mail.gmail.com>
Subject: Re: extend machine memory
To: Mircea Cociuba <cociuba_mircea@yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vy/xTTnRmyl5

On Mon, 7 Sep 2020 at 13:16, Mircea Cociuba <cociuba_mircea@yahoo.com> wrote:
> Currently emulating a cortex m4f on a LM3s6965 device.
> The problem, the device only has 256k flash and 64k sram.
> Can I extend it somehow?

No (well, in theory you could edit the QEMU sources and rebuild).
QEMU models what the real hardware provides, which in the case
of these dev boards is a very small amount of RAM.

> Is that Reserved stuff actualy used?

It's empty space, effectively; there's no device and no RAM there.

> From a periferal point of view, all I want to use if the Core(m4f)
> and the Uart.

The netduinoplus2 probably has more RAM and a Cortex-M4. QEMU
5.2 will also have an mps2-an386 model which will have 16MB
of RAM and a Cortex-M4.

thanks
- PMM
