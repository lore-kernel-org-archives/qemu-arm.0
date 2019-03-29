Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1892320wrx;
        Fri, 29 Mar 2019 06:50:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqynquE05SduuYCPjtfQaCRaXZp7LrzJRIZ18KVUgprK6YCVWkoB6yCU4J9v/8lvr+Ri6zTj
X-Received: by 2002:a6b:d913:: with SMTP id r19mr26771225ioc.76.1553867427838;
        Fri, 29 Mar 2019 06:50:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553867427; cv=none;
        d=google.com; s=arc-20160816;
        b=Xx02FCWHcsj72bQ0nL2oUbcNQbNvEyq1rWzXGm8eAZG6sn7fOczKat46Hd8zx5LmYh
         erV+Ka8Va57/fjz/u7Im2Uiq0Sy1ZYEG9UYwBc2A31xwkxEsBSOlrXcum9hw4spPWu3x
         5cGGAMJuC5jEQjZ3E5lyuUfxhXk7USlupSWUOqM/Wagglsx94JmrHKfECNAwRkcAl/0F
         1q+GLTpay//ud8jDuefxAAa6RqqRKtEiBEuZTPEdNgeAZrs/3REw7QPEc0/5kSOxfFLA
         lAafwv3dXSMFOeQd1rH2X/IpRZkF07tb8ejB54s72aPkIPwaia3vMoC+xaRvnzccr/HV
         4xKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AUFF+cPx8lBh9PLB8gDOw92QcSkWV5ROFJpsKYEfhWU=;
        b=CeWjn/YZncycAcyVt04L4NANFG73m5HQeCs3W9QnVNylsMnG2r1RgIv9PAaZjJQ7ES
         Xm6kNnAjSTSI1EjgFAeZBAi9KjVT9CA8b/xIAenWAVilJi1DS37Qis8arShBhtlMzRMj
         f3UR5ez7KVyj1SiKgeXfhduc4yQt48RpkHgRAXiWWyVcSrAXET2WvCLtiged/7PzFHlF
         6r+ncV/Pw8Pf7YIK3pzf6I1pERtWq5OEyQqQ94ReHmb2aRN92DYHniVXZNn9+WDu1K3v
         4awCJ6hfJSUiioWGtFU8k+MS8m2jLkOnVboq7NQ1OPc48BLHU6/TwclPnjX531DZDCnl
         rHjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h7p8NfUV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j5si1097117jac.120.2019.03.29.06.50.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Mar 2019 06:50:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h7p8NfUV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:53216 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9rtp-0004Bc-Kf
	for alex.bennee@linaro.org; Fri, 29 Mar 2019 09:50:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51686)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h9rti-0004BH-1n
	for qemu-arm@nongnu.org; Fri, 29 Mar 2019 09:50:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h9rtg-0006gd-TF
	for qemu-arm@nongnu.org; Fri, 29 Mar 2019 09:50:17 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:43665)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h9rtg-0006ek-M4
	for qemu-arm@nongnu.org; Fri, 29 Mar 2019 09:50:16 -0400
Received: by mail-ot1-x343.google.com with SMTP id u15so2039196otq.10
	for <qemu-arm@nongnu.org>; Fri, 29 Mar 2019 06:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=AUFF+cPx8lBh9PLB8gDOw92QcSkWV5ROFJpsKYEfhWU=;
	b=h7p8NfUVowfT4knSBSSjLorygl47BRQ3mwRWPwtKR7Ioi6W9rPVq4yIUiwhw1T8wIL
	uegbAbGVCBi4LiOCCV4FUOd5M0rwB2gvh4/2XWYdLWRnX1mo5sidHeCf3lvEI8M/D0li
	ArEsUDEAh5ztOKw0GJ6kR1NG+WzyPCWfxkv9FKDrw30o5SbTeB/oknl22iUmst6/ZqBn
	RlKNow0CMfZCXGghV7QujVdHwEwJ8cDZp821pK/RQ55aTqtNVfyS+E1FR28Kz9EftFWv
	iV9/Sgwlrylc6FlVXYrq8lOC7PxCx/Vw6VTFjBQRFxiF64zz6oa+rbBX5xGrHsLXsEfZ
	Lq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AUFF+cPx8lBh9PLB8gDOw92QcSkWV5ROFJpsKYEfhWU=;
	b=VmrdL7zOjzJGQPa9rhPVi568ySaswdHneI/7XpZs/dtF2MapCyeWd0DGmIPR93EpUs
	tpwwXyLlcan5UvXTSDdcUQC6LiziWDya87zCsJUUH4AgZxvtz9je1z6mVK90jtui0lPB
	smpo2GrHtHfE4IzHpFk640UxR0HJk8bRDqyY2awgmxOPK87kwcxiEeGpKG3lu9V3QURg
	boSoxeYJOjEBagFTooipeuxb7VcGfZKdbKXP0JR1E74W7YCJs6w8cK/m5fjc+zZWXTWp
	kpQNsOvcQX7monTETOtf8ARftU/1AsYqFVE6XetXN+aMYFWYoF0vhub89ZT0Jkth/jUK
	HDSw==
X-Gm-Message-State: APjAAAV/32GyrP87pqtivIAgD4e4hKOuZ10U1I8QZkjnioAjwmLE1IBW
	cWUY8zHTF4CXW2BNFHlKFIAgQHvEQaC2MZY/h9LkEA==
X-Received: by 2002:a9d:7f18:: with SMTP id j24mr32897420otq.151.1553867415338;
	Fri, 29 Mar 2019 06:50:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190328152635.2794-1-peter.maydell@linaro.org>
	<20190329131304.fnh4fjyhtw2eji7t@steredhat>
In-Reply-To: <20190329131304.fnh4fjyhtw2eji7t@steredhat>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Mar 2019 13:50:04 +0000
Message-ID: <CAFEAcA89948Voc8vC2CUuPMMiuVFz7QxU7FMQzNPEwtLBD4ULg@mail.gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-4.1] hw/ssi/xilinx_spips:
 Avoid variable length array
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair@alistair23.me>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sP2eVQyMmWRv

On Fri, 29 Mar 2019 at 13:13, Stefano Garzarella <sgarzare@redhat.com> wrote:
>
> On Thu, Mar 28, 2019 at 03:26:35PM +0000, Peter Maydell wrote:
> > In the stripe8() function we use a variable length array; however
> > we know that the maximum length required is MAX_NUM_BUSSES. Use
> > a fixed-length array and an assert instead.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  hw/ssi/xilinx_spips.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
>
> I really think is a good idea to remove variable length arrays!
>
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Yeah; we have some but not a vast number, so I thought I'd
whittle down a few easy candidates. Feel free to have a
look at some yourself :-)

thanks
-- PMM
