Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1379736lfq;
        Thu, 8 Oct 2020 07:09:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4msusBc/lIxDQYahul97oD7JdqWiuFacqC5+xU1gEY9uTQmSbt3HfeH1kAIInNo8TZ/zo
X-Received: by 2002:a25:4e55:: with SMTP id c82mr11238805ybb.416.1602166198769;
        Thu, 08 Oct 2020 07:09:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602166198; cv=none;
        d=google.com; s=arc-20160816;
        b=Ys7prXCn8tKcWGCiPC3niNuNHpGpwdo66f8rRvmlG1rXXJS2I+4ymZPdkB1wQp4hPw
         /evFFLi+j1VzGeVoio21FVYiV5MK5b78ypnqwqgmXAbhHCQvflCNCncLebjSMcxdy6LB
         mbkgv1I9QreU9wQQsn8BK5Kb3zvrXyr0GucY8WMKQrPlPZiFJq9ou2a3YWdmqsjUtQiV
         V/H3+tIYVH6bFPDuYUWyUstIksxL3yj6A9GO6yO5Ux24U9xqtwI4Lmufs4l00IZe2RKS
         sFFpMLhKPK3BL0wxaB+j6KTPWWciDpvbBuRrSv4rIKQsw15uIdaJP9GvM6I73YLJlYlF
         ZWmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mSm3GGy7mlOOJ0cpmeSKFrGrkfbZZ8dyTn0BC4S1V5s=;
        b=RLwtSgcHjNkdvJTUbZSakboJYOiicKJpFSAprChyn1kgC2RRhLp2vXHzXQ7iBePpFj
         b4BZrLvXyFkPTI7xZcRk2MEQ06GTwDxB3J6bBt09BSVRGLFhtsuAXNKhQgRFCVf7kJBA
         Wzgj47W1zGcaNp408YzmM5xO4GHjjbQ3tsIRUzDtrqzamg7do/jV1ZI2cgocvjB939Rk
         Fgh5vu3CXfoveYO+1m7XI6bVsYqUTdOd0we5b4nkSxyJJFXVA42l69H3ksLGFaxDcKP6
         yzPquo1N11dDd0+allut0RibbBpFywcz7eJtdpPNVqIJt3TSLb+h/f4hB11EcJLHR6Ac
         roJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Fuo4iEJw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e82si5112080ybb.357.2020.10.08.07.09.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Oct 2020 07:09:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Fuo4iEJw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQWcI-0005x3-5r
	for alex.bennee@linaro.org; Thu, 08 Oct 2020 10:09:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQWba-0005Wp-AF
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 10:09:14 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:44428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQWbY-0003Y1-L6
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 10:09:14 -0400
Received: by mail-ej1-x642.google.com with SMTP id a3so8272626ejy.11
 for <qemu-devel@nongnu.org>; Thu, 08 Oct 2020 07:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mSm3GGy7mlOOJ0cpmeSKFrGrkfbZZ8dyTn0BC4S1V5s=;
 b=Fuo4iEJwuMi0kh+z1dagFEg40BBaHJxKAM3wFyW6ZxoV2viPb0EhnzSWeXHvI9Cggj
 2MJW/9nxOkn983NspJnHS5Afs3yA7Ox/noswocBvuxBWajAT+JFngWvlQi+LiiAshDQy
 KeJ8O/c4wjkPUqWVTgKRjnHscggBP6HgBes1bn+AQMMxQGrRmdP62X844agr6dXCyQJS
 6NDjF6DA/AeVZ+eKnvETkZnFDtg9ntxwN7O3d229H8DWh4ba2GdsTziEDJGqsDb0uuWy
 ixCJ2BcmVDPrf/tA5eWkx5TftC4vkM+72XeOpXigtACGtfydfc96QqawtvaRznSW4eBl
 mkgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mSm3GGy7mlOOJ0cpmeSKFrGrkfbZZ8dyTn0BC4S1V5s=;
 b=Hh+fy/wKwPhCgmVcfan2PnnFFxlO42lxrrucFFbRlqG52Xj/8MjOIo8M0C0RdL3Dfn
 9K5/6GmknKgmw6xHOF5KcLEV6R62WPeyxybrLus2QfiT2nJOW+9gb+v7yCbO69o9009R
 YLMOOOo+hKJJyFYVpNv69FoWz61cyXrZlqCc2FwdmCs63Z8FyUviM4r11qgmOv/bHJ/Q
 Q2E1f/VlUcTK+8CHDpPM20ZvnzuJPOdv2oZbqJMinaHlxDMAooJS9Zb0wvXCuZ/6l+XW
 RCRTQFMf1fNlzcgvXAFVobsoDwYqBThK3EOpSGeWJBY8pYcHozAfh2ZkwYLdugIEhF8x
 S1aQ==
X-Gm-Message-State: AOAM533yQQmkjhzc64UyqvnFY8G4Duzev+HeYTo33OAS7UD9MmxytWax
 /YOIGdj/LjKdjoorFayXPlo4Y5HQLziuVrVIcri/rA==
X-Received: by 2002:a17:906:ad87:: with SMTP id
 la7mr8872856ejb.85.1602166150950; 
 Thu, 08 Oct 2020 07:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <20201008024203.112303-1-shashi.mallela@linaro.org>
 <20201008024203.112303-2-shashi.mallela@linaro.org>
 <CAD8XO3ZRGqNbr1GM6jMAdhm=pPXXr6K7m_F0MKRDQMnrDw=yDA@mail.gmail.com>
 <CAFEAcA9QRJhorL1XtWBCQk9uo21OtMHUrH7ipG3tiFbOBGizPQ@mail.gmail.com>
 <CAD8XO3YaavVfz6yaAx2N95B8a87tkp=-GKt814Zou4e7B+cVvg@mail.gmail.com>
In-Reply-To: <CAD8XO3YaavVfz6yaAx2N95B8a87tkp=-GKt814Zou4e7B+cVvg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Oct 2020 15:08:59 +0100
Message-ID: <CAFEAcA__EG5Ou9W0H24oEKFA9Ft11n6pjcSwD-ZG4Bir8=3Xhw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] hw/watchdog: Implement SBSA watchdog device
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Rados=C5=82aw_Biernacki?= <rad@semihalf.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0gg69tZTzRyp

On Thu, 8 Oct 2020 at 11:43, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
>
> On Thu, 8 Oct 2020 at 13:27, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Thu, 8 Oct 2020 at 11:21, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> > > Interesting why gcc does not warn on  64bit signed to 32bit unsigned
> > > truncation here. Looks like it's too smart to understand
> > > that value fits in 32 bits.
> >
> > What truncation? 1000000000 in decimal is 0x3B9ACA00 in hex:
> > the number fits in an 32 bit integer without truncation.

> I meant that LL is an long long int which is 64 bit size type. And
> then you pass it to uint32_t.

Yes, that's fine, because it fits. The LL ensures that if
you do a calculation like:
 uint64_t max_timeout = 16 * NANOSECONDS_PER_SECOND;
it isn't incorrectly done as 32-bit arithmetic.

thanks
-- PMM
