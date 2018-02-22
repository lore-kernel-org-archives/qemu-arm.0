Received: by 10.28.71.27 with SMTP id u27csp2116280wma;
        Thu, 22 Feb 2018 07:59:29 -0800 (PST)
X-Google-Smtp-Source: AH8x224Gv/msYLotn2Ju/newhWmaaMZoR44jYfHk4MZVajes/CTXfzk7ALZMbCfpP+9fUDo3rM+4
X-Received: by 10.129.161.16 with SMTP id y16mr5007902ywg.168.1519315169895;
        Thu, 22 Feb 2018 07:59:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519315169; cv=none;
        d=google.com; s=arc-20160816;
        b=YFvmsfR7rX+Jtm7ZRq2aOa/XFlUzxOFLBbmoTcPSDoFJ4b+RpH1/lr0n/a7AF1Nb19
         D0os14naYW9huiJPK+GpJdG3tcBggrrI7eTYI0iO7LiqQ3OzyMlTTrR4vAYXxmnBeWsp
         zm4pSztvGmuzRCJKtIuyEl7mvv5sYkcIpoN9RHesn4ghdTuqVCgl0n6jGlfOBmareYVR
         cPLa6l3609awHihDyA+A7NxUtm5ZmSw/2Z+6Kp4AdjY9tBxVgVYTWLo59fTP2Wz4y8WG
         0quWqKV1fEcLVXo4Dvbn/0ICbBXa5Tq+3XOkwWc8pAhDeK6tVobZjP6/A/L7Jzuiz2io
         yLnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Aw320SndNzDtoFy4MSFool9w6uJV2/LA+4Z7s5o0rHY=;
        b=tH+FO0SwHyflxn81ZK3vW9rBjE/DnP+X+FLsTBqnJfAsTRuypi7P+vmLYYxcUPsUV1
         LmOw6twgTw59NXUPp3OxqezDXF6tbScjZ+7Rs0uTr4LI8xEx/TUebp8plva2un7HK2KI
         Dh+CGSrp/UJzJRt31ypISK5Lvg/Ugjjm06VLMd9cxi70YSOV5rRDcclJhoVAq7P/mX7x
         oTC0se87m/NkwuNYrGFCE0oYMljNZe9fqvTbx6b0mt9qcNXL0pMXrJXdKrS0S7Iy4Iim
         A++VKmFOxlQQ9n/np4FR3o+A74OAtHhwweWq1JSby+Z7fuYimmYLuwLHFAr6udZO8plM
         34Dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AonFHePl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c199si60156ywb.155.2018.02.22.07.59.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Feb 2018 07:59:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AonFHePl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39234 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eotHN-0003Hs-CN
	for alex.bennee@linaro.org; Thu, 22 Feb 2018 10:59:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48631)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linus.walleij@linaro.org>) id 1eotDm-0008U0-AC
	for qemu-devel@nongnu.org; Thu, 22 Feb 2018 10:55:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linus.walleij@linaro.org>) id 1eotDl-0008F1-FE
	for qemu-devel@nongnu.org; Thu, 22 Feb 2018 10:55:46 -0500
Received: from mail-it0-x22a.google.com ([2607:f8b0:4001:c0b::22a]:55165)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <linus.walleij@linaro.org>)
	id 1eotDl-0008E9-9N
	for qemu-devel@nongnu.org; Thu, 22 Feb 2018 10:55:45 -0500
Received: by mail-it0-x22a.google.com with SMTP id p204so6741108itc.4
	for <qemu-devel@nongnu.org>; Thu, 22 Feb 2018 07:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Aw320SndNzDtoFy4MSFool9w6uJV2/LA+4Z7s5o0rHY=;
	b=AonFHePlhuqHvl3SDSzraFqOBnYc409TzxNWqihRJYZTePiXOFavj0trCkMDq/oxer
	yoR9/mFGC/KhbM1A/va1EOZ5SSExgMvRZ9idk9dce9UZvu0eLqBmVOGlZ83Nm/bXwM7/
	G0Geu2rNPk5eqGhaxWMrklLqelAo1jryphx8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Aw320SndNzDtoFy4MSFool9w6uJV2/LA+4Z7s5o0rHY=;
	b=ekjIUpMxA0oxnHFjiDWGWfrSgyrX5bvGTWGKq6BSkWUpbzfv4z3XyerqYilWYkwRgc
	UbM3Wgub+JSO9Z7PyllIiffngy3nS1fYp/jiey7cAlcedW2AxccEXYnOFj/4VDdCtxik
	R8FFZRqBVcVO4FwArNeK54ZK8BTSlwNVFuePlhP3q3mTtlp8hJjo8vXfDj6nxKLN1G4k
	TagtedQAg8HjvhQhoaqJCJaigONqzz9x3ACMdu+mSVUdEhxfIQdUsZA396nTe1D/BB5x
	6tgZWZz9RBa7QN368dMTDh1RBmJzO5YO8UfoEwTjol7xJvU/yqrqG9gbiwqrGoLB0DFe
	cunw==
X-Gm-Message-State: APf1xPBH7G6wExxQh4pxRIxP+4MAhqnUhXIpll8W0d2IYVx6PalMqqkB
	R7nbQmKz6X8YEXWo5H30+hL/rRXT4zfk54br4tvFiQ==
X-Received: by 10.36.92.205 with SMTP id q196mr2242920itb.135.1519314944571;
	Thu, 22 Feb 2018 07:55:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.230.25 with HTTP; Thu, 22 Feb 2018 07:55:44 -0800 (PST)
In-Reply-To: <CAFEAcA82fEnt6oGz7O+zPZ2+zoZmhm0J6rAioX6SmJwoSykuGw@mail.gmail.com>
References: <CACRpkda9B=frmS0QF429p-q+KoCKG=5NON-kQ0Rt-nba2powRA@mail.gmail.com>
	<1519053606-9817-1-git-send-email-minyard@acm.org>
	<1519053606-9817-3-git-send-email-minyard@acm.org>
	<CAFEAcA-jTZMDNTF2rPn20DjSxu=z7n9M+2xo-pNfAYoha_LuzQ@mail.gmail.com>
	<03f96a6b-3a52-0d72-e634-8b8f167f2992@acm.org>
	<CACRpkdYMTojtHnafK+kMnm1G7j+9Nj=p65WLZGbrN8MJv+4psQ@mail.gmail.com>
	<CAFEAcA82fEnt6oGz7O+zPZ2+zoZmhm0J6rAioX6SmJwoSykuGw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 22 Feb 2018 16:55:44 +0100
Message-ID: <CACRpkdaYKzQHHxCOZEydL2pa3iX60oCsXvX7FvBZkXbByo6Z5A@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::22a
Subject: Re: [Qemu-devel] [PATCH 2/2] i2c: Move the bus class to i2c.h
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
Cc: Corey Minyard <cminyard@mvista.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Corey Minyard <minyard@acm.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Hwn2OKKAyQ9g

On Thu, Feb 22, 2018 at 4:44 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 22 February 2018 at 15:39, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Tue, Feb 20, 2018 at 2:06 PM, Corey Minyard <minyard@acm.org> wrote:
>>> Linus, Philippe, do you want me to submit this, or do you want
>>> to take it?  You can pull it from:
>>>
>>> https://github.com/cminyard/qemu.git tags/i2c-bus-move
>>
>> I don't have any commit rights, if you can push this to the
>> QEMU master I will happily rebase my stuff and resubmit :)
>
> I suggest you take Corey's 2 patches, add them to the front
> of your patchset and add your signed-off-by line to them.
> That way you don't have to wait for them to go into git master.

OK no problem!

Yours,
Linus Walleij
