Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2349076wrt;
        Thu, 24 Jan 2019 12:19:48 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5kwzk7JqcB8sAIX8x+TGwWjanbS3z+sypqYIhAKwdsJg2TqBDXMlXQLBcA1aW6JMg5OSI2
X-Received: by 2002:a1c:2314:: with SMTP id j20mr4057173wmj.142.1548361188727;
        Thu, 24 Jan 2019 12:19:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548361188; cv=none;
        d=google.com; s=arc-20160816;
        b=HZFY0xyHSQ9mSphXUFdW3+aE4J0/btyX4Vp4vLD3A3Jo873CG7bD7zOa8zdWfQ3MV8
         gDFLBaixP77zIFxx18YDgtDoHxz7rO3qG09MwAHKqoPgVyOmJuy0X7+QhmrsQSPWfzSW
         ASXZ/n2QSj29W/FKNpjhQvggx+UEmsGswsrMVJy7ZtF6m+j1PKCxsQRtY+Bg1XWfpdmr
         zCoM+iPJbM/7zOA0YtsYYQanWX1yGGdvDJXD0ZpuNKq28+1yhERBEm8cK/V6/S4FRSYJ
         bHb0HHn2yBXGEU1bmzEZVXSqOzLemnFGpOkAszTfEF2xhSXvaElS1ml1hsV1BAfcTpSV
         EifA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EzcyCkISZ4mIC8JzK81k2tpuZFAMuDTB8+bXoDtFMko=;
        b=mkjRLms8uO/fGxbrq2/somcU/WuyzjhTkEhuYL80cLXGc8h824R6FrhmPXQ9k9SHYf
         0ieUkbEfIG1KaMiP67EOJjg58AbXTfl8jtJVmwbiR7jKVNOJSeKIXxb+YcOb4qPicDzj
         5oW78djO2xJkamPXMPBvQsxhljPP9J5c4B2L4dwP0l/6lbNGqcJEg3drUEmiOg4Jefvo
         h4cK4b42ApNlpDI51X7LjZTi7+EZBvaE0N17kSdlQ3JNMUb91QxRDuv8pJ1z+JOXX8G0
         +QQuCTtrmhBvPoQDEXE7aRmSmQzzv9ggmSbWWbXMbcE4LS3G/qX5dHfIgWAmt75O2vR2
         4EXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=RY206+C+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k184si39847603wmk.43.2019.01.24.12.19.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Jan 2019 12:19:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=RY206+C+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:60423 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmlTW-0000YT-RL
	for alex.bennee@linaro.org; Thu, 24 Jan 2019 15:19:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52223)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1gmlSo-0000Y4-KF
	for qemu-devel@nongnu.org; Thu, 24 Jan 2019 15:19:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1gmlSn-0005OZ-Ur
	for qemu-devel@nongnu.org; Thu, 24 Jan 2019 15:19:02 -0500
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844]:46471)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1gmlSk-0005NI-Hq; Thu, 24 Jan 2019 15:18:58 -0500
Received: by mail-qt1-x844.google.com with SMTP id y20so8165781qtm.13;
	Thu, 24 Jan 2019 12:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EzcyCkISZ4mIC8JzK81k2tpuZFAMuDTB8+bXoDtFMko=;
	b=RY206+C+n3HsbfMvU9tQR7PaenvdhW9CJTruNjXtBjw5UJY1fz/plrC6/m3pu1738u
	rVuIbE0HpJv+sm3ssspbm1X2weubPgBkXXMx/n20MHJHZHVZ+sZJ8ghz3WjWpTv/YCIs
	Q9QeGTqdaKg0Gl/5vzLbsIHPBOC7DXJclE1mk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EzcyCkISZ4mIC8JzK81k2tpuZFAMuDTB8+bXoDtFMko=;
	b=gHRVkdtHgx12xq4E1EN7kA/3dPg879l8ECc6aAZXsac8V2mz+xzbvDnvmCr4OTLABf
	kC9QlxbHa/VkUBYQbw0YUp2kPSC7BxGM0KFkxuoai3wDbjt1JrjLa+2Ovrn5HxkmqsiO
	+PTLQcWf5bgzryaGYZSdzOzFiarbgGvSAcCNc9oyqlnd1mV3IUSv4SNtIAZf4/5HEHbs
	svUFkVSSMiDvVbfhcHeVoQ9Y4NfU36nkVlFD+xlMfmhQwLHDywNeK/hJ+c37WORG50ov
	IpYOuc7TkSA8lIO7abWNiWtvac3uHXcBoOs4miXBwNPXsCf6Oa8Ve6yACGyEzPSOLJ/h
	yM5g==
X-Gm-Message-State: AJcUukdCZ7HbulHi16VaH6DhO8v4KHf8hy6Z8uw6NzIk3H6/YdtCBbRj
	Zq7Tas95HiXzUJGVpthUFI32XN9xtz+9lthDjIM=
X-Received: by 2002:a0c:e751:: with SMTP id g17mr7599679qvn.160.1548361137935; 
	Thu, 24 Jan 2019 12:18:57 -0800 (PST)
MIME-Version: 1.0
References: <20181211031044.27628-1-joel@jms.id.au>
	<20181211031044.27628-3-joel@jms.id.au>
	<CAFEAcA-KoxgDuWtCfZqzGgMgQrxRiMYfwt31eU12CQOPW_pSMg@mail.gmail.com>
In-Reply-To: <CAFEAcA-KoxgDuWtCfZqzGgMgQrxRiMYfwt31eU12CQOPW_pSMg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 25 Jan 2019 07:18:45 +1100
Message-ID: <CACPK8XeM9c2xFbeXb6kqOJGczL6aW2K0hoEaK=x_AiN_mejPkA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::844
Subject: Re: [Qemu-devel] [PATCH 2/2] aspeed/scu: Implement power off
 register
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hZd1DDeJwPHo

On Fri, 4 Jan 2019 at 03:26, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 11 Dec 2018 at 03:11, Joel Stanley <joel@jms.id.au> wrote:
> >
> > This register does not exist in hardware. It is here to allow the guest
> > code to cause Qemu to exit when required.
> >
> > The register address chosen is unused in the emulated machines
> > datasheets.

> I'm always a bit dubious about adding things to QEMU devices
> which don't exist in the real hardware we're emulating. If we
> do want to do that, I think we should clearly flag them up as
> being QEMU-specific with suitable comments and naming of
> the #define, etc.

Since writing this patch I was made aware of -no-reboot. That flag
solves the problem I had so we can drop these patches for now.

Cheers,

Joel
