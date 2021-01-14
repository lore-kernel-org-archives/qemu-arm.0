Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp233177lfq;
        Thu, 14 Jan 2021 04:15:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPQ+SwpBXTi1K3uiZFDy+WWSHH+p1UK10fcLvM1yR9Jm1WVeKrwIh7o9rlzU2+oDnBz4ke
X-Received: by 2002:a25:bccf:: with SMTP id l15mr10238830ybm.272.1610626554099;
        Thu, 14 Jan 2021 04:15:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610626554; cv=none;
        d=google.com; s=arc-20160816;
        b=OsFXMf4GJWULpafWEig06KtTTl5GQvAyHfnAK/xosPHuX/rnfTobA88aNQwNlhRLeg
         gZENFLyY85Y3R0243yORGTSSiao4vAPWUUHA1NUZB9bk0y76IYk/BUBEeuE0N5iWr+Y6
         mLABJ+MfewEPZm/I7BveGALgTeR6kTQF10KqLBVXLS12UN1L3QzaRACwLj4m0ChbOuc5
         8N/c2VDqAKsQuSjHu33HP5QGGX1817ioLH5u4LD5GeurEu7aSYnWz1mclZb+/10EqPWq
         cChqlmwm5Iqk2PUl8gL0Wbtws3kvSfJxv2THbpHQ5ckQ8vl/OGVXSNlhXJimLXO9jcDQ
         AaDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7X+lubDSKfk7TLMh1SOru/tY8oaNpbVGrWzp2eEf4w0=;
        b=fGXuFSKdyuPFNW9Q2GJEF/AicoW3/dEbJAibnyvlGp39JUxms0b15vrjaMT6HYSuuI
         lzop9k/MTVM2A8KhlxTBHlt82zbN6P9as0FVJEnJl7WKDviLu+e1hxJi/MDlH07cYK29
         v4kA5wBWmfxGpjvMtx18+uKU/yqrZ83uXWIZbLiazoXhAxj2x2dGLuk/FNypgYq2mJh4
         JzWjgKHRcCudJB81OJqmV2aEs2DD7xaT/fBEzcGeQwOe0Fi4amiW4NdJnJvQSgugLSMA
         IhbQYZxtKeEVBw5H9E4M7qUap6bHEq7zsi5pmbMryLCU4U+fBEfM1pcOoFUcQPj3BpgT
         ooyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n+RnS3VW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z133si5313632ybz.330.2021.01.14.04.15.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jan 2021 04:15:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n+RnS3VW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l01Xd-0001fR-GA
	for alex.bennee@linaro.org; Thu, 14 Jan 2021 07:15:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l01XE-0001d9-U8
 for qemu-arm@nongnu.org; Thu, 14 Jan 2021 07:15:28 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:41051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l01XD-0002xX-7z
 for qemu-arm@nongnu.org; Thu, 14 Jan 2021 07:15:28 -0500
Received: by mail-pf1-x432.google.com with SMTP id q20so3230368pfu.8
 for <qemu-arm@nongnu.org>; Thu, 14 Jan 2021 04:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7X+lubDSKfk7TLMh1SOru/tY8oaNpbVGrWzp2eEf4w0=;
 b=n+RnS3VWXTUwILu6vIoxx+b963jvhsaWN+C9HGRxLjqcEiJklyur8IEF2diYg9UJ5s
 akmKAIYS+8vI/SB/naQBAbwbTptwdn5QqOXmO57jp49ugv4kfp+JXPUDE/stLUOueHrn
 AoR1mOrFYi77U6kYweD3bJu5pd1mNMMZpXBS4Si5+ioLv/PCjcDKa7g0rCMhwU7fohuw
 0WtfloxmVsb9uJ35MOQc+ta8qOW7KcA2tajUkl2ZVacRNN+qLmJoczFadOp5xg9wu+6T
 W8xu24O3nWpXBOzzFcFXb1f3qOlslwcPTIw/ymdn7AUsN2MRNKYtwVrVz2T5iPjLuymG
 UAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7X+lubDSKfk7TLMh1SOru/tY8oaNpbVGrWzp2eEf4w0=;
 b=izZ6EeMich1pTOYEUi3JVRRypFuU2ve/NlCWXIo5GLNNYMSt92hOYIteQoh40QyAuT
 aDn87jCK7NSYQqnq1K9OSSxArtT1aZLRaPpszs+k0jD2eqqJ8YTYcUB/MRHlKH08SzrT
 irRcp53579DfF9RSfuhl9GmJp7fZI53FDqHqaFoa/SXygSds4mdYpZui55Y1BEAEK9yY
 vrXKFkJtBhX11+sMtLNCBOBZqolYLMMnvNcNn+jk2ybsl/ASa1kUDM7NRjNQ83PygPVQ
 yl2ijGB1upfWz3LIORX+vcpmmJ6e7MqBF9Vp1694HlKIGOjOTxydfpXFZx3669G8veuE
 V6UA==
X-Gm-Message-State: AOAM5318jzexnA6WOt7r7Dm0KcIEsjdcJxcOTtUFNQTRiGehOfrCZ8jg
 BhjZsTMjk0dGzERWkAI/bIEAXfvzlqBjOFsebFdFkg==
X-Received: by 2002:a63:2d7:: with SMTP id 206mr7220626pgc.375.1610626525405; 
 Thu, 14 Jan 2021 04:15:25 -0800 (PST)
MIME-Version: 1.0
References: <20210112143058.12159-1-maxim.uvarov@linaro.org>
 <20210112143058.12159-3-maxim.uvarov@linaro.org>
 <20210112153542.oqahdubzeoipyvun@kamzik.brq.redhat.com>
 <CAFEAcA9O2kHpcvoofo0v3ahXNOQtw8cxaVC2hn+AjpH6A9RciA@mail.gmail.com>
 <20210112162526.ob7eroamrdlowfyr@kamzik.brq.redhat.com>
 <20210112162847.wik3h24isg4cmgyq@kamzik.brq.redhat.com>
 <CAD8XO3Y3sgZ3VXh7FhfcvvTckE2EUebivQ1nUnqTud2ApGUh=Q@mail.gmail.com>
 <20210114000445.mg3xq2nq7kccbvjy@kamzik.brq.redhat.com>
 <CAFEAcA96=ZjZyhMcpTSDvrHKXZY-uOUoQSi-jTbOLpFZdnkMuQ@mail.gmail.com>
 <CAD8XO3Yxp6rcNgNRJ3+d8zEsYyS0myYs=rSNKtw849fEmdT+RQ@mail.gmail.com>
 <CAD8XO3YCJjTZBZaP1MOwUzcMQ9t+tbjOAwMT4STqYmp=Lmvdmw@mail.gmail.com>
 <CAFEAcA-A8Q1+0Pu4Csok+QFtw3qX2JZjt1buHeuWuFpqJhjTAg@mail.gmail.com>
In-Reply-To: <CAFEAcA-A8Q1+0Pu4Csok+QFtw3qX2JZjt1buHeuWuFpqJhjTAg@mail.gmail.com>
From: Maxim Uvarov <maxim.uvarov@linaro.org>
Date: Thu, 14 Jan 2021 15:15:14 +0300
Message-ID: <CAD8XO3ad5ggffLVg4YD_Oy2-PP_0egZw-P0qq1H4fN_xB4jfPw@mail.gmail.com>
Subject: Re: [PATCHv4 2/2] arm-virt: add secure pl061 for reset/power down
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: Andrew Jones <drjones@redhat.com>, Jose Marinho <Jose.Marinho@arm.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 tf-a@lists.trustedfirmware.org, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MaBaZE7RsO5B

On Thu, 14 Jan 2021 at 14:48, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 14 Jan 2021 at 11:24, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> >
> > On Thu, 14 Jan 2021 at 14:22, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> > > Does that mean that in that case you need all regions to be 64k
> > > aligned? I mean secure and non-secure.
> > > Has anybody tested 64k pages under qemu?
> > >     [VIRT_GIC_V2M] =            { 0x08020000, 0x00001000 }
> > >     [VIRT_UART] =               { 0x09000000, 0x00001000 },
> > >     [VIRT_RTC] =                { 0x09010000, 0x00001000 },
> > >     [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
> > >     [VIRT_SECURE_GPIO] =        { 0x09031000, 0x00001000 },
> > >     [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
> > >    [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
> > >
> > > Maxim.
> >
> > I.e. I see comment:
> >  * Note that devices should generally be placed at multiples of 0x10000,
> >  * to accommodate guests using 64K pages.
> >  */
> >
> > but it's not clear why UART, RTC and GPIO is not aligned to 64k.
>
> Er, 0x09000000, 0x09010000 and 0x09030000 are all 64K aligned addresses.
>
> thanks
> -- PMM

thanks, will send an updated version.
