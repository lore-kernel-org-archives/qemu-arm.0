Received: by 2002:a17:906:3953:b0:a3d:1c09:7d3d with SMTP id g19csp583823eje;
        Tue, 13 Feb 2024 21:54:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUsdSV3UPqWcJ/kVjuH5Dusq+IOixR/E5lXKIuI8+VxUHuGDlWGgJdx3KxPM3rIcJhVRn4S6+rVtYC8YQIG9hkc5eObFYFM
X-Google-Smtp-Source: AGHT+IH5ySDV+MGkRitUm3POzLfwNb8GdLjBHqJRaL8oNgLhMSLeNNtGgmGoaYR2edYVOFwIjkdA
X-Received: by 2002:ae9:e701:0:b0:784:3a5:1c58 with SMTP id m1-20020ae9e701000000b0078403a51c58mr1862086qka.37.1707890097595;
        Tue, 13 Feb 2024 21:54:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707890097; cv=none;
        d=google.com; s=arc-20160816;
        b=IpcNzsPECk3eZRpwy8+sEerDTmh54gYKaWp0kCa/eGwtGFQ7y4sYQG354yug0gUCan
         Vqn4voDmC6aDpmfGN1bnsZpcOSKWTN9ia6VYj23mZ9X1jCd+PITf6IKaZOu64OiEnQuI
         SAI8FpUVdtmUrBCREvNaJ2V22unaLaLtgC7fqy3mdNbwpmZG5E/28kx8N8hWyXvm1S7E
         2EypRuDefbTFhtawzBKdILoeDszohtxf938HCo+7MqXuoUxSO7lqGuS2wF0DgDg4wvXY
         ZtgzuNDXFXP5pA28vPEOiKUeESHdoetBeGtPC/6PScUj+i/Fdzh1fSgtqo5mwyZdY1K3
         LNPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=R414xVJ5SAz6KLk1XJB0Zl4GPjEHnid7votgXS0hgwA=;
        fh=VlEq6dFuMex8BrnTe9RMTEY2GDI/KW4nfX8gZ3Gwaq4=;
        b=WD/3w09+BsCwalSZzoU4dMOdrzJwf6a2+WYxdRkMFg7+F1rPtXNZ4lbi1H+BLZIVt2
         yzdmNrQAtKeI9uDNC0rArMTasuw4bzZaz1P+d+yY6E+6pS85g3Qu1rLiCEZWsSD6FohT
         2UD2E+mIs9IkVu3O2QnJ1rShRM+/t0Xsh8X5M1TKYqiwnJO/5iz4Ybhc+m4XCh7G5CW9
         52Ng+RH59yyryaOmvOm/vPAHohhM8U9BdIlVPkQektaG/2UOwnEF4KZfFKR2mtF1HNj3
         dmztVI1nL1vuRHdWycVYKr+S1mo5ReHkDZkUR5xdx29Yhf4cAfpEEdgYIrzaMP6YPksn
         xeoA==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@atomide.com header.s=25mailst header.b=kmOQU0I4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
X-Forwarded-Encrypted: i=1; AJvYcCWUvXV4YaI7uq/ibO8ghLHJ0pd6DS6jqCRHmRFpJqjvD02lnDsCXLOQPIvuX2fM+WggqlsBhoVRXwNz7yoycNQ31UIEme3U
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w2-20020a05620a148200b00787286ef019si1104991qkj.714.2024.02.13.21.54.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Feb 2024 21:54:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@atomide.com header.s=25mailst header.b=kmOQU0I4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ra8Dn-0001XR-7q; Wed, 14 Feb 2024 00:54:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tony@atomide.com>)
 id 1ra8Dk-0001Wx-EH; Wed, 14 Feb 2024 00:54:12 -0500
Received: from mail5.25mail.st ([74.50.62.9])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tony@atomide.com>)
 id 1ra8Di-0007pN-TJ; Wed, 14 Feb 2024 00:54:12 -0500
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id 238AC60476;
 Wed, 14 Feb 2024 05:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1707890047;
 bh=Fw5oQJ5HFO1ECMibd3OJwI8fxtVq/TOpOYMhoS5tAZY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kmOQU0I4oJFiUx/7Ocp1oV0U029yuPjmVuTvIgts4mq+VS57ZlO6BiRampfUYIF2f
 lNDfC3pCeowqAzniITV5/dyWDMGtgP9ZpZw4+EynxVsnFG7q1LLSzStNxHAJ4MNWjO
 IpevMOFtYXvP1vglmOOrs3Oh6clkfm7U60Y2r3l/PRpiimTuA7WNB4Z8wcpugUdpFV
 h+VxKH4WkVYSRPaVNnbEIyglrN3Pp/gnS/ZBaA/dOxuqQlnmIB+RjjFPsrv157JAQu
 WGfnXmW/Ym8F6wvxPYR8MM36pvll6f2jI0xrQ7FCvGJyO0qPQplVvXvMsqZ2Ao6Eon
 jDPwoc+ufnKCg==
Date: Wed, 14 Feb 2024 07:53:16 +0200
From: Tony Lindgren <tony@atomide.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Arnd Bergmann <arnd@arndb.de>, Guenter Roeck <linux@roeck-us.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, Daniel Mack <daniel@zonque.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Stefan Lehner <stefan-lehner@aon.at>
Subject: Re: possible deprecation and removal of some old QEMU Arm machine
 types (pxa2xx, omap, sa1110)
Message-ID: <20240214055316.GL52537@atomide.com>
References: <CAFEAcA88UGhjh8-iBvhxx6GdWg74dinYouiguTcz=qEe51L7Ag@mail.gmail.com>
 <fe5476c7-82e0-4353-a943-7f39b14e1b5b@roeck-us.net>
 <CAFEAcA-bqOM4Ptws-tsEwo2HDZ6YSX1Y+xGkR0WueRD_dUd0+Q@mail.gmail.com>
 <7bd858a2-9983-4ddf-8749-09c9b2e261f9@roeck-us.net>
 <fbab8e59-6d2d-4193-a5ca-9fea3c524229@app.fastmail.com>
 <20240214012749.GA203324@darkstar.musicnaut.iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240214012749.GA203324@darkstar.musicnaut.iki.fi>
Received-SPF: permerror client-ip=74.50.62.9; envelope-from=tony@atomide.com;
 helo=mail5.25mail.st
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mFLXI3mVKrBM

* Aaro Koskinen <aaro.koskinen@iki.fi> [240214 01:27]:
> On Tue, Feb 13, 2024 at 09:11:38PM +0100, Arnd Bergmann wrote:
> > I think Tony still tests these on both hardware and qemu.
> > The platform side here is much more modern than any of the
> > others above since it does use DT and it has enough RAM
> > to be somewhat usable.
> 
> I have also these boards (real hardware) and test them frequently with
> mainline Linux. However, QEMU support I haven't used/needed. I recall it
> was a bit buggy, and some changes in mainline made the kernel unbootable.
> Unless Tony needs the support, I guess they are good to go.

I've only used real hardware to test omap1 for at least 10 years, and I
have currently no omap1 devices booting. Still hoping to add n770 and
osk back at some point though for basic boot testing.

I could see qemu being handy for automating boot testing for git bisect,
but as far as I'm concerned no objections to dropping old device support
for qemu.

IMO it's best to concentrate on where there is activity and users, and try
to make thing easier to maintain in the long run. Anything with users and
active development happening we should try to help and encourage :)

Regards,

Tony
