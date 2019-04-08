Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3302921wrx;
        Mon, 8 Apr 2019 02:44:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx80Nf7Qu/vBurjefbkb+nyXFBoY9KMdirPBmJersSjfs4yTEws6pMvxiVjLdhpybGm4SmM
X-Received: by 2002:a1c:2d45:: with SMTP id t66mr17254001wmt.106.1554716672740;
        Mon, 08 Apr 2019 02:44:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554716672; cv=none;
        d=google.com; s=arc-20160816;
        b=f+1k67M/3i5Sbd5iLIr28uxQiwhHO5CBtKx+EjiME6hKzj13mXoXPugxQ1F51vrz1X
         r21Il7riBnoWQLnm9UFFhDLca5tBNYr3tYPBvryfl/bDvlx4+jf6VbwO+e99/w2Qyhng
         ykDKFNt38B+qof7p5GsBrLMP/QlCISFQv6rJ4rrIyDt9HGe0YMqYel59Yeq3hZWNWvwX
         nJpSTZmMgrY2PXCzhzyjo2kwL7CkF+qTvMquE7VFhON7mXWCxaWCx1suOLU6adLf8ecX
         q2JvrZANXO+MavOyhvJHjOB6lRcpka4FuGUM1y/M8hvwE3lATxQilcMGuRDrD6LBPXOt
         OCfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PEsWYR7q7GCRV0rDY4IjVdUNENI8piFrJ3/uOWByDZw=;
        b=vMQ+xAq3CXtBBWUsMIHb9FpJWeQxRSmcA/x2VFx4BpZeReFxeoM8YOZ4elLQVHCgDO
         KkSS3xYzBrFuDR8y4lqlFXh04HuzvJl0s1zXkBZKJweHcHjSV2S0b9jYlxgvq9xMx37/
         XcGuW8NUr8nsr476koMk6VTEhTEBfbnhxYmkDKmmTbdp8T1qludersRGkn86LaXtaj3U
         Okc1OFYZBpzxWrZ/ZMzo4nhuJDmuW5m/zG3kQpzL28URokrtAAQ72/uXnC0XE9hhGeaT
         kg4LsPiMwltmZyUVq0Il4EGmynPLOUVaZO1znuqc/Nb/XHoLL2cRI9G8gVDiauwYmOZd
         BxmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=b13J3YEY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q12si18896054wrm.156.2019.04.08.02.44.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Apr 2019 02:44:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=b13J3YEY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:50203 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hDQpL-0003Tv-Rg
	for alex.bennee@linaro.org; Mon, 08 Apr 2019 05:44:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45731)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hDQoj-0003Ru-Tl
	for qemu-devel@nongnu.org; Mon, 08 Apr 2019 05:43:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hDQoh-0007Rc-5o
	for qemu-devel@nongnu.org; Mon, 08 Apr 2019 05:43:53 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:40777)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hDQog-0007Qi-PX
	for qemu-devel@nongnu.org; Mon, 08 Apr 2019 05:43:51 -0400
Received: by mail-ot1-x342.google.com with SMTP id t8so11393258otp.7
	for <qemu-devel@nongnu.org>; Mon, 08 Apr 2019 02:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PEsWYR7q7GCRV0rDY4IjVdUNENI8piFrJ3/uOWByDZw=;
	b=b13J3YEY0pTBgbvWZeKn31y+72rnXbEtx2WzXncQooN7ixv8CBjuyZJW1tf+LIXD+Q
	YjFhDtF1KFy0tD6wIDkg3cFVBtLnWI/oFOE4QlpOjAHU3ybgxuWd/VtkdqmOnrtob+J3
	bgx659bkPqX+Y6Qrc2IKCvMlEpKCD+XBXES5Tg26UJcskdd0Oeom8RKTXrYcggbAs2yz
	pkkMssw8vOHZyjqbkn05Ie0KxYhLEG3JBJwxSvbNJSdvk2YIukptTcmJx4wHwTudHblz
	2QtuvNmOQ9MQMS8SKrBHmlHjQQn9ANheWs3wE9gmoS1TCuuqKE9rdJ4+XT/WeWRHXPO0
	dQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PEsWYR7q7GCRV0rDY4IjVdUNENI8piFrJ3/uOWByDZw=;
	b=oI7RD7dTYK2BrJVbGblCFejEtXqLJumf3usvzp7sWZj7Dbs5ZVu+nv2wsu4ryPWnLv
	dMon+qXR5uBsZXpxaRHnRstX51dWyIsC8fKsgOwJB2QeBAqGMcqC289xsTGyCYTkkRZ2
	qdc55kZ5KZx/thn8MrZSRt6pR/2BnJqKfZdyIfOvMCsLIc4glpx4vtz184OB63XaDRav
	96RNb9saPz7F2xb+/tu/1QEfZiXiAocJbEthMsOkDVYNpbAeBvSYuTGwIBVCIBI1+qSE
	56RXuF4nRPw5S9RXUVc+cQadS5gtefF5YwtLuhZf0v14xjAwjjjCJ8jvHfRAneuKos3J
	pvaw==
X-Gm-Message-State: APjAAAVjUXhUsDPrqC/8cGxmug4npqxBkPn8pQDg13bKWXG8wPSmE+SN
	peeH1KqnUOKShRySrdzlY6HxWLeICrnDLK6adDwXRA==
X-Received: by 2002:a05:6830:164a:: with SMTP id
	h10mr19313412otr.323.1554716628848; 
	Mon, 08 Apr 2019 02:43:48 -0700 (PDT)
MIME-Version: 1.0
References: <1554624893-8363-1-git-send-email-guoheyi@huawei.com>
	<CAFEAcA-N=y3k41oexvYaQ+tKj1d2tCZh8MhPvdq8Uz7dh-eWWA@mail.gmail.com>
	<cb3534ef-2bd0-0518-c6ca-01c1f6511199@huawei.com>
In-Reply-To: <cb3534ef-2bd0-0518-c6ca-01c1f6511199@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Apr 2019 10:43:37 +0100
Message-ID: <CAFEAcA_7GVwQfiyJi-dRkCaoyGrGJQtCd6DdF1dgJcGPcCDTRw@mail.gmail.com>
To: Heyi Guo <guoheyi@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [RFC] arm/virt: add one more uart for UEFI runtime
 debug
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
Cc: wanghaibin.wang@huawei.com, qemu-arm <qemu-arm@nongnu.org>,
	Laszlo Ersek <lersek@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B3p1bT31GaoJ

On Mon, 8 Apr 2019 at 02:45, Heyi Guo <guoheyi@huawei.com> wrote:
> On 2019/4/7 21:16, Peter Maydell wrote:
> > I don't think it makes much sense to keep adding UARTs for every
> > bit of the system software stack. We don't have an infinite
> > supply of UARTs on real hardware either -- how is this handled
> > there ?
> As you were in the edk2 mail thread, I supposed you also agreed to add one more UART. What did you mean by "I do still have a todo list item to add a 2nd UART"? How shall we do that?

That would be a simple second UART available to both secure
and non-secure and advertised in the device tree. It would
only be created if the user specifically asked for it on
the QEMU command line. I still need to investigate exactly
how that ought to work, though.

thanks
-- PMM
