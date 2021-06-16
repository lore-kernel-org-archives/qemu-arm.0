Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp144lff;
        Wed, 16 Jun 2021 16:43:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNnim5HF9ok4l7868CusmUJope0OtrGuYkZroAulgn0jbbbUh3M12HzOVeIGmgwYjQdEke
X-Received: by 2002:a05:620a:1a88:: with SMTP id bl8mr283022qkb.480.1623886984356;
        Wed, 16 Jun 2021 16:43:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623886984; cv=none;
        d=google.com; s=arc-20160816;
        b=VsGBGnOSQ1EAAGjegxXu06Q6VEm8f/8IbBxGmnbS+acP+IvLeyTEOaD5CdC9Vs8cpy
         xLr27FLeeq9vMgMu6HQCJ/V9T7LZTtgNCbUwupAHRaFNDqW3Z/yK+eW7Ib2wFpIb0RLp
         Vw8Ncoep9Pfcv3KEnEfKZo+QIUh5efzUTTrJ3bfXm03ckaS0N5c23Y3sjZtk4QoYrbfd
         +JIqw7XEPv4q3LbQJ9qN8lPA1em3EKqvV/ugpB8Y+KRgCVrPVvnyk/0rEeJDRTaMtpgP
         YtONMLTji6MVCkQ9bLAfCSVMpyz1uwYSPVuQ2WA2bn4j+xGLzJ/9zaN014YnW6P8SUmJ
         wCcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=bR4ewnBHzBXuJFKb1Boiyr+uV14IRTid/72oMTxZk+k=;
        b=dS2cxvf40/f1AmiMTJqsThW3yLHj7Hn41hY4baDhzJgtPewYskltoCF8o32magv0iI
         jHtGyziM/RxBESQNz4PXoZuIn1rDVmY0pmocKVN12imLfmyaXQwiq3xVK3qWGuuosXfw
         ta2WpfdJp4t1taGdg4y8tjIwnFlQlD+s+kP6EXJ09Vwrz4DpimhOyaton696Y0/KCeJP
         FL+qdh3vpvPvnArH1Yq1WKNMW+VbyIqrW/E60etikfHiHmTdTGJ0Z0h7imwy4XsSyZxF
         +FtHp9csGTW1O3qIlgmzxewg5kITmv3rlCpWoQx1BHj8fGJAR4zLA1gE8LkfxKQrenY5
         XvqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=CXv2Rjpl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3si3463242qtr.318.2021.06.16.16.43.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jun 2021 16:43:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=CXv2Rjpl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltfBW-0000w2-FG
	for alex.bennee@linaro.org; Wed, 16 Jun 2021 19:43:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1ltfBG-0000mQ-Iz
 for qemu-arm@nongnu.org; Wed, 16 Jun 2021 19:42:46 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:40842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1ltfBC-0005vZ-RE
 for qemu-arm@nongnu.org; Wed, 16 Jun 2021 19:42:46 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 b18-20020a0568301052b0290449ba7eff3cso2504379otp.7
 for <qemu-arm@nongnu.org>; Wed, 16 Jun 2021 16:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=bR4ewnBHzBXuJFKb1Boiyr+uV14IRTid/72oMTxZk+k=;
 b=CXv2RjplE7tGnLI4JWI67QFc5jtQRFAEsROaeOwICcLw5fYwkcwZ2o70h98uCAXZVw
 4DTMRD8EoFGQIrkI8im9uVDszGsrBNIlYrin+UjZb5IyypTTIGgL8Usjjo/TnpfX2m0Y
 vrjfpj9BgyLq9zhqNGc8H4e6lEWVHKdWmv2gUrMouftokgxhPOU2CJh1lNQzXsr8XJ67
 /3MFURqPYv4AZji+ujjPj7xW0MaVSf7NqNk5UrPWnFYqhhnkFrmPSOyCbmmvD3pcjXiE
 tR4j6K7lXVGP3j4zwAvcbKRQ4mbyhBLehhHlGn78gA6ABvMNxlIFXl87Ylhm2+Mp2KQH
 7uBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=bR4ewnBHzBXuJFKb1Boiyr+uV14IRTid/72oMTxZk+k=;
 b=tKL35/qxxzwz4UOP1uU7TviK+HZ08p/jTW4rkzt7wHjsppdWEmr7xVAEsoYHIkDGzl
 6Fa+1WqnEjnrUoQFCXuNahWd1Rr/QZyhTlCJn/dnnqRTYXkB9UFXuFqzde5bB2UxS5So
 5kpeHYxIaRUIpu8RaI9fxM1sQrwV3nzD02T/TkNQ0865w8Heb1DShsx5q0STXQBK1Aci
 oMSKYtHM3KmNL8YdesFZ6+9l1tQoS/vIiQ9gxyODw0Un1DVn/RSdGIQR0OYI76lZkE+Q
 TcLBvJy+JvA+KdZzJrFkWgmzaeCH2MTq1imyaPbwjgvpGULr74P15ETdWWUpXwYsLNmU
 syXA==
X-Gm-Message-State: AOAM533hd8j6hRILG0tXuqK5cHJBY2g6aQqjnY5B8e0k7HmjaUlxZSHu
 wuViQKhYbawyQI8WivVZPBuXeQ==
X-Received: by 2002:a9d:5916:: with SMTP id t22mr1988595oth.269.1623886961164; 
 Wed, 16 Jun 2021 16:42:41 -0700 (PDT)
Received: from minyard.net ([2001:470:b8f6:1b:ede8:ade8:da1:e1cc])
 by smtp.gmail.com with ESMTPSA id f36sm663916otf.12.2021.06.16.16.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 16:42:40 -0700 (PDT)
Date: Wed, 16 Jun 2021 18:42:39 -0500
From: Corey Minyard <cminyard@mvista.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v3 06/13] hw/i2c/ppc4xx_i2c: Replace i2c_send_recv() by
 i2c_recv() & i2c_send()
Message-ID: <20210616234239.GH11196@minyard.net>
References: <20210616161418.2514095-1-f4bug@amsat.org>
 <20210616161418.2514095-7-f4bug@amsat.org>
 <20210616191637.GF11196@minyard.net>
 <59fb23da-ddad-0436-6935-89712fbddf0f@amsat.org>
 <7bf42f64-b6dd-1e1d-dec9-f710cc94cb2@eik.bme.hu>
 <416b4c36-b838-a5f4-6575-74685627b9c3@amsat.org>
 <9ecae65d-e554-3e95-2ecf-3e2c866d718@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ecae65d-e554-3e95-2ecf-3e2c866d718@eik.bme.hu>
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=cminyard@mvista.com; helo=mail-ot1-x329.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: cminyard@mvista.com
Cc: "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f2g+OegnOLPG

On Thu, Jun 17, 2021 at 01:09:05AM +0200, BALATON Zoltan wrote:
> On Wed, 16 Jun 2021, Philippe Mathieu-Daudé wrote:
> > On 6/16/21 10:01 PM, BALATON Zoltan wrote:
> > > On Wed, 16 Jun 2021, Philippe Mathieu-Daudé wrote:
> > > > On 6/16/21 9:16 PM, Corey Minyard wrote:
> > > > > On Wed, Jun 16, 2021 at 06:14:11PM +0200, Philippe Mathieu-Daudé wrote:
> > > > > > Instead of using the confuse i2c_send_recv(), rewrite to directly
> > > > > > call i2c_recv() & i2c_send(), resulting in code easire to review.
> > > > > > 
> > > > > > Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> > > > > > ---
> > > > > >  hw/i2c/ppc4xx_i2c.c | 13 ++++++++-----
> > > > > >  1 file changed, 8 insertions(+), 5 deletions(-)
> > > > > > 
> > > > > > diff --git a/hw/i2c/ppc4xx_i2c.c b/hw/i2c/ppc4xx_i2c.c
> > > > > > index f4c5bc12d36..b3d3da56e38 100644
> > > > > > --- a/hw/i2c/ppc4xx_i2c.c
> > > > > > +++ b/hw/i2c/ppc4xx_i2c.c
> > > > > > @@ -240,11 +240,14 @@ static void ppc4xx_i2c_writeb(void *opaque,
> > > > > > hwaddr addr, uint64_t value,
> > > > > >                          i2c->sts &= ~IIC_STS_ERR;
> > > > > >                      }
> > > > > >                  }
> > > > > > -                if (!(i2c->sts & IIC_STS_ERR) &&
> > > > > > -                    i2c_send_recv(i2c->bus, &i2c->mdata[i], !recv)) {
> > > > > > -                    i2c->sts |= IIC_STS_ERR;
> > > > > > -                    i2c->extsts |= IIC_EXTSTS_XFRA;
> > > > > > -                    break;
> > > > > > +                if (!(i2c->sts & IIC_STS_ERR)) {
> > > > > > +                    if (recv) {
> > > > > > +                        i2c->mdata[i] = i2c_recv(i2c->bus);
> > > > > > +                    } else if (i2c_send(i2c->bus, i2c->mdata[i])) {
> > > > > 
> > > > > In the previous patch you checked < 0, it would be nice to be
> > > > > consistent.
> > > > 
> > > > I did that first but thought Zoltan wouldn't be happy, then went back :)
> > > > 
> > > > I'll fix for the next iteration, thanks.
> > > 
> > > I generally had no problem with i2c_send_recv only that its argument
> > > that decides which operation to do was inverted compared to other
> > > similar i2c functions so my original patch just corrected that for
> > > consistency and I was happy with that.
> > 
> > But we have to make the maintainer happy too to get patch merged ;)
> 
> Getting this series in actually means more work for me as I have to rewrite
> my unfinfshed patch to not use send_recv so just leaving it as it is would
> be less work. I mean this patch:
> 
> https://lists.nongnu.org/archive/html/qemu-ppc/2020-06/msg00682.html
> 
> Where having send_recv is actually nice as I can write it without too much
> if-else clauses but having send_recv and start_transfer with opposite sense
> recv argument is confusing. This is where the orignal patch comes from and
> the point was to just correct this inconsistency between start_transfer and
> send_recv because I got it wrong first but it went overboard now removing
> the whole function instead of just correcting it so I'll have to rewrite
> this patch and make it longer and also have to rethink what can fail and
> how. I also have to review and test all other places I've used send_recv
> before so at this point I would not mind if it was left as it is now, then I
> could just drop my original patch and reverse the last argument of send_recv
> in the above WIP patch and be done with it. Much less work than going
> through this series so I almost regret bringing this up again. But if it
> makes you happy so be it.

I understand your concern, but these sorts of interfaces are really just
asking for trouble, as you experienced and as seen by the other patch
that fixed an error using the same interface.  It's better to have a
clear interface that takes a little more code than one that is easy to
make a mistake with.  That's my opinion, anyway.

I'm also not a big fan of i2c_start_transfer(); it's confused me more
than once.  But that would be harder to fix :-(.

-corey

> 
> > > Having a send_recv in one func
> > > allowed to avoid if-else in some places like these but if you think it's
> > > better without this function at all I can work with that too. I'll have
> > > to check if these changes could break anything. At first sight I'm not
> > > sure errors are handled as before if recv fails but it was years ago I
> > > did the sm501 and ati parts and I forgot how they work so I need to
> > > check again. I'll wait for the final version of the series then and test
> > > that.
> > 
> > Thanks, that would be great!
> > 
> > > I remember I had to tweak these a lot because each guest OS had
> > > drivers that did things slightly differently so if I've fixed one,
> > > another broke until I've found a way that worked for all.
> > 
> > I wish Avocado (or any other testing framework) could help you with
> > your testing, and you could contribute your tests even if you can not
> > contribute your firmware blob due to incompatible license.
> > That would help us understand how you use your firmware, and save you
> > time while testing.
> 
> Unfortunately it's not only firmware but there's also AmigaOS which is not
> freely available so that would be hard to automate. Other than that testing
> sam460ex and pegasos2 with Linux and MorphOS could be done but I'm more
> comfortable with running a few commands that I already have than setting up
> and learning a testing framework for this so it won't be me who makes these
> test cases. It's not that many boards and OSes that I care about to need it
> automated but I've shared the commands before, they are on my web pages
> about these boards.
> 
> Regards,
> BALATON Zoltan

