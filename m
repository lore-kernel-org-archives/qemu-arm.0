Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1047520lfp;
        Thu, 23 Jan 2020 11:23:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqzLdmyJZVoZAMXdEI8CczOXLAeVTkjKLj4c8ZPGnY6ss+tHmcTg70DbldT/qalJniTz7/j5
X-Received: by 2002:ac8:5448:: with SMTP id d8mr17525657qtq.205.1579807421192;
        Thu, 23 Jan 2020 11:23:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579807421; cv=none;
        d=google.com; s=arc-20160816;
        b=PDKiIXdsSEOJZW9fz4u7IFnkXd41PwIjtgjC/AoqRTLJPPNiBPcPdzPkH9xuahna1s
         nF/5DZyRmBILkGfD53FNYOlsSsdWJKtmlAd6A/0X9QTkgOlAsA86rO8TlIcG1PJyJqD9
         GtDUZxsBKGh1JbFWKDxo9MJHng9nnxvw3vo/FE+dd/Ap+gKQwFnkHbQRNucmfsARNHcY
         vNFTO4POizyBoOTWnZiGUz7BDhji3TiXvcbcUxrUMdya8hL27HuhIU5+Zrv+n/7p/pzY
         pM7W1PmXoqwEwAst5gf/OUzOpor2q1jEDjovUZLa1WarGjaMauFPG0AcSUGaSm85ihrV
         lMyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=DX9XPLUMx26HScqd/BBt+1dKos1BhNzRsteN/4RmO2g=;
        b=bpeBZEQPSlQcSHJas4BPk0rCY9XzmPLwwPM3+anAoxni/YsnaGkSa52bFnKwJIidnf
         9miM4hPdjUdLmFIKyN4nTbgedbct1mGtfUfieOldoJM9BadD8WQbqVdN/3vAxi0yr73l
         XsdQ8ksV8HFBJ4PmAI8kGPXQpwLXMiVZhKrlIKZQGLiz7/I0c/Qh5ycREXhqf6itFOS2
         zlPSAuYdi+eZjDvOdJog/6BCF5ZsjHzW0dH9IZLNFqnQ0G3fjoNGHdwWX7+KnGP+9hBW
         a4TpNagJ9Q/BYC26KPJniOSBniNPP4AdvK4nOMQSZikbbaCAdJymlCvpnT3V/KePAmgq
         220w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FNIIwcC3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o22si2171787qtm.314.2020.01.23.11.23.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 11:23:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FNIIwcC3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iui4q-0004Ah-2O
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 14:23:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44860)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1iufnM-0006UV-VU
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 11:57:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1iufnL-0006bk-0S
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 11:57:28 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:43257)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1iufnJ-0006Za-7i; Thu, 23 Jan 2020 11:57:25 -0500
Received: by mail-pg1-x543.google.com with SMTP id u131so1652509pgc.10;
 Thu, 23 Jan 2020 08:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DX9XPLUMx26HScqd/BBt+1dKos1BhNzRsteN/4RmO2g=;
 b=FNIIwcC37Uv5CUhA8kKyYV+ee7VZXuIPixuIFl7WWel/TvADRoQtojyOccW1bllX3N
 c5NXOnlm4NOq+0+ytxL/oRtomMh3LTbFuwikiv9sDUUT2OaT4j8ALPQVV8jh/kj8YvDN
 m3QdetRNsz31lgCzLhZu71t06UTLww2msQ/N7nQYRmvcz15ewZF990Zc9NJf/quDwqjJ
 kYiLdAq60tqtus3h73VyOBhLAcGfCyT3tGI2ixIhBEqLEvr5ltlu3bB8bn8wxXCUCCcd
 BXmlBv0oyxt3j+JA6HJd/T/mIoiRBs89ekcP9CbsLbuRT2kboA+7WX9VIRq8xjHdiZhU
 qDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=DX9XPLUMx26HScqd/BBt+1dKos1BhNzRsteN/4RmO2g=;
 b=Pxo7uU4DaKBkavY6IxgN9mBPN5mIT6KZIgM2XORq85h2RRoIWWx+oCw9gY4wCt+4lG
 hGsEImn6YkarndmJ+HoCRcqpp7Qvep4+69tmXxwbSTKg632GroMOVQRbEbVLBsNflDAv
 CbDMaXQ/vxsNLVb1r7FcS2d3WJTJemEeFgTdXaCvzttd+EuR67vR22JdreEUuw2xCTVP
 OJAB7Aq9TAdk6g3saUxJwkh2U3oLLE1+Pp5Z5pQ4gWxU57oo0A1Vd1XKnvJez2NBbPtq
 cF7pvv+dz56RQ1vCe+SJ1EtA2ta9lsUmK6bPFFWnpBiQS7TDP9vVI9SsubY0qg2O801k
 Vxog==
X-Gm-Message-State: APjAAAUGtU8yrSqXPtshh5cULzqdXwE0D3HDpAC0ryNVuHZcYI5k5mTa
 OCiyPHoQw+X8wVPo/rXit3I=
X-Received: by 2002:a65:4047:: with SMTP id h7mr4970926pgp.60.1579798644055;
 Thu, 23 Jan 2020 08:57:24 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id p17sm3212163pfn.31.2020.01.23.08.57.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 Jan 2020 08:57:21 -0800 (PST)
Date: Thu, 23 Jan 2020 08:57:20 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 1/8] dma/pl330: Convert to support tracing
Message-ID: <20200123165720.GA4805@roeck-us.net>
References: <20200123052540.6132-1-linux@roeck-us.net>
 <20200123052540.6132-2-linux@roeck-us.net>
 <CAFEAcA-SPUPEcV4Uw9=8-5EJmLztVorV++ypFp=vYxasncBrZw@mail.gmail.com>
 <CAFEAcA9p7Foko17jTB_GSGLnaQwpJTcf0-qTrJkVWje1jOpq-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9p7Foko17jTB_GSGLnaQwpJTcf0-qTrJkVWje1jOpq-g@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l0ImAraAbOoE

On Thu, Jan 23, 2020 at 04:23:59PM +0000, Peter Maydell wrote:
> On Thu, 23 Jan 2020 at 15:51, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Thu, 23 Jan 2020 at 05:25, Guenter Roeck <linux@roeck-us.net> wrote:
> > >
> > > Replace debug logging code with tracing.
> > >
> > > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> >
> > This turns out not to compile on OSX, which is a bit
> > stricter about format strings:
> >
> > These two:
> >
> > > +pl330_dmald(uint32_t chan, uint32_t addr, uint32_t size, uint32_t num, uint32_t ch) "channel:%"PRId8" address:0x%08"PRIx32" size:0x%"PRIx32" num:%"PRId32"%c"
> >
> > > +pl330_dmast(uint32_t chn, uint32_t addr, uint32_t sz, uint32_t num, uint32_t c) "channel:%"PRId8" address:0x%08"PRIx32" size:0x%"PRIx32" num:%"PRId32" %c"
> >
> > both provoke
> >  error: format specifies type 'char' but the argument has type
> > 'uint32_t' (aka 'unsigned int') [-Werror,-Wformat]
> >
> > because of the last argument.
> >
> > Easy fix would seem to be to change 'uint32_t ch' to 'char ch'
> > (the argument is always a literal constant 'Y' or 'N').
> 
> The 'chan'/'chn' argument is wrong too -- should be uint8_t
> to match the format string and the type of PL330Chan::tag.
> I'll just fix up the pullreq rather than forcing a respin.

Thanks, and sorry for the trouble.

Guenter
