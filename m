Received: by 2002:a19:f24a:0:0:0:0:0 with SMTP id d10csp271900lfk;
        Sat, 14 Aug 2021 03:12:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6tIA3xNGbL8xYQA3EVBkFYDRqp7Do1ueJ1CxWccR3O86oXiFL2pZqBrrjGyJT+WnJlRTs
X-Received: by 2002:a25:1546:: with SMTP id 67mr8586391ybv.331.1628935973979;
        Sat, 14 Aug 2021 03:12:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628935973; cv=none;
        d=google.com; s=arc-20160816;
        b=NeJZ77mdfoKyFcM1zWY53VwtUIpkEQOn79cYQ5f9IruxRYQsJLU+8Hz/MxR58TsG34
         4YLKerYqZe7lyb0vkdfOzrJ6vqMzA75Xc2E6/a9qPaky1Wmw+x3xv1D95LlDL5gmDPzQ
         z0boXWkARGBz+yG+5ySkaaXl+qcKL3leoxbfFxCs1jn+p0pEBzKR4m5XJsux4U3Xsfgn
         9KlrhWZ4jpLqg3wnOwztf5Jho2TNZXzeSYul6KWzMitzT1SkeibpqJo0Tz0t5wJloBwA
         fIkW7wIJy0c/1lhME4+izC3yMTJgB/lqiV7bZSdcf/Yh8z0zxUN/DzasRpMWW7qaMdvv
         CDmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wpgIkZjJO+lMhdFQh9t2dEkZ0bnLDW/oEauAxawUiQg=;
        b=j5aBozkD+FCO4SNCvr7mdtdqDdLc4ou4B3ohU+3bcva77t0fPtnwg+UiZqPbFQ1oLV
         GJ5FkOSU2lLid65TfpcnlVRKK56VUJwmBLz/FQGKqpI9yUEIcZfAInkRQOyCg9W6smQM
         EX/ui3n25GpknDiFCsYoS4YUqfollytdFHWoR3QUr3XUSWwN4IbhQwGQnWIvrqhnP2pM
         c3kl/7Q0dRjw5xvVKHqZNti4FuPxnS2rKLvlnoP8hiniCI65jvcYJPoRISNQ0B0Hogz7
         u3340xd8+6epgaOdwtx84UC8WD+8ylGIXzwlqZtht2TZkENVVkbpc/43UT2xQccJSkHK
         XPlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZxpZcUlr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r11si4527484ybb.372.2021.08.14.03.12.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 14 Aug 2021 03:12:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZxpZcUlr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mEqer-0003tO-Bh
	for alex.bennee@linaro.org; Sat, 14 Aug 2021 06:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEqeh-0003rN-F2
 for qemu-arm@nongnu.org; Sat, 14 Aug 2021 06:12:43 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:37547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEqee-0002lo-Ho
 for qemu-arm@nongnu.org; Sat, 14 Aug 2021 06:12:43 -0400
Received: by mail-ej1-x62f.google.com with SMTP id h9so22918345ejs.4
 for <qemu-arm@nongnu.org>; Sat, 14 Aug 2021 03:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wpgIkZjJO+lMhdFQh9t2dEkZ0bnLDW/oEauAxawUiQg=;
 b=ZxpZcUlr2yHzL2EJrBbLpJI+pY0KpSXJgLmjA+22ffqsLM5Nmu+akm9q5mCSmb9GnS
 SMnF0jvp1hGEcpdMTUg4qz0CekRRvmWKP5iFyBMFpJL/+H/EOvfNtTemFNrdAXLHSD1Q
 dbJaA/A9/lpZDDfrdoRI2NEComXtWxo4ifoQmjS/5Ip0SCKI1Uyi2XY+y6J97gURsHpz
 6MHzFPOGBPKexw7YMKa33zEXm0IWIRlsf8KV2kZGLW1NGkzotljooModIJJU3SXmkzgG
 DzxZkpWuNAudkIvbKWDWjT35ijmtDtcZmbRAEMXGYQIBPSzPiqrcyyxzgEzY5qBlrPH1
 +tXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wpgIkZjJO+lMhdFQh9t2dEkZ0bnLDW/oEauAxawUiQg=;
 b=PKekwShS2ZT0gslJDt6jVqSQZOrnctmjnyvGHvNrT9X2gLk8e7lpIQTkxVT9W0mfvT
 Cw+C1Txx44sDi7wdGSBbfoBP7ql6iSMWU+8WjC4AQXSQdk5HVsq/7CjG+deqIMhE05OB
 61AjmcZ7oYS1KSHxuR0xQH+dlG8p8z8fGEnj42iDBQxYE7ZJn66A3VagqlcF3xSy3cQV
 O8bYiB6WBJU7UljU/3o2Mp3HmS80pvnS3Vl1tyV0LqVOquCJ65ETXlwHHv6CNz5w+GFd
 vcjmTCE6UGL7Oj7GIERNkfMbmjQ1KkgMudy6xuDNA2OawtHn8dKA9jyvgpiSmruBFtGJ
 gYZQ==
X-Gm-Message-State: AOAM531cnv66rANxNAGCRbjVPTmyUefd4kFrENW2iyhPoi9TObF4hrIc
 fauWZoBVHMnmkNU/Ozzmkn5J3S/Iz1LDiZfAz1lKHg==
X-Received: by 2002:a17:906:e8d:: with SMTP id
 p13mr3219119ejf.85.1628935958342; 
 Sat, 14 Aug 2021 03:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-20-peter.maydell@linaro.org>
 <df2e95e5-3898-7dd9-a571-34326bb799b1@crans.org>
In-Reply-To: <df2e95e5-3898-7dd9-a571-34326bb799b1@crans.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 14 Aug 2021 11:11:53 +0100
Message-ID: <CAFEAcA_fFHpxo5Oscj0a-_xOd9+WM0Ea79Zt3e1VFWAd4EwP3A@mail.gmail.com>
Subject: Re: [PATCH for-6.2 19/25] hw/arm/msf2: Use Clock input to MSF2_SOC
 instead of m3clk property
To: Alexandre IOOSS <erdnaxe@crans.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RaUhgiQBJDst

On Sat, 14 Aug 2021 at 10:20, Alexandre IOOSS <erdnaxe@crans.org> wrote:
>
>
> On 8/12/21 11:33 AM, Peter Maydell wrote:
> > Instead of passing the MSF2 SoC an integer property specifying the
> > CPU clock rate, pass it a Clock instead.  This lets us wire that
> > clock up to the armv7m object.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

> > @@ -72,7 +74,10 @@ static void emcraft_sf2_s2s010_init(MachineState *machine)
> >        * in Libero. CPU clock is divided by APB0 and APB1 divisors for
> >        * peripherals. Emcraft's SoM kit comes with these settings by default.
> >        */
> > -    qdev_prop_set_uint32(dev, "m3clk", 142 * 1000000);
> > +    /* This clock doesn't need migration because it is fixed-frequency */
> > +    m3clk = clock_new(OBJECT(machine), "m3clk");
> > +    clock_set_hz(m3clk, 142 * 1000000);
>
> Maybe something could be added in the commit message to say that M3_CLK
> is changed from 100MHz to 142MHz.

I'm not sure what you mean here? This commit doesn't change the frequency:
we previously set the m3clk property to "142 * 1000000" and now we set the
clock's hz setting to the same thing.

The old m3clk property had a default value of 100 * 1000000, but nothing
ever used that because the only user of the device (this board code)
set the property explicitly to some value. With the new Clock-based
setup there is no default value at all, because the board code must
always connect a clock, and will set its frequency to whatever is
right for that board.

-- PMM
