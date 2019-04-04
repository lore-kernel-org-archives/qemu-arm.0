Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1229432wrx;
        Thu, 4 Apr 2019 01:54:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzjEzlSfB/nD7tvFg/vPX+pIdYoQsUgA/TClrA0xUoJacc4Rlmjg+qBycHmBjG4ZgbNXrbp
X-Received: by 2002:a5b:343:: with SMTP id q3mr1439980ybp.244.1554368055913;
        Thu, 04 Apr 2019 01:54:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554368055; cv=none;
        d=google.com; s=arc-20160816;
        b=pZ5uhLJ883Z6R3Wa+FpIuhZTwuhwgi+yIMqrQeRVykxnHmjNIsFh19Ph5VFgXKQn6n
         2MYXXNIbNHeH/5vsacf6kNH4MADsFCZFhdwzgE9OzHEQLI+fIP6ppdLezquoeSAjPmgd
         yhnMkc1X48beUBhIaLPWBOslonuuHlZWdksAMtZmDSiV9i5ekT2xW2yk2cVIQAdL6VbQ
         XxHOiPuaWpf9U3KzqAosqcwBIRaSfeJ3UwR//aMzUM3LI4yMmcP8+DmaRpNp+JF5+0Tg
         VsVLtyGTBd0vLRzxPvQ5itX8U9g2sAsHs89EUBybkYoG3hE6tc/lhhV9wUYyHmUho2cO
         z2xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QKqjy8Cm7Y48HQsfCSMB3tUPOIZ31G5EK1ilVdzTDEw=;
        b=nVcYeoG5XIC2BL0Ft49ptdBeLNZFTQaPc+rmrp7sdC4uzjWwnkfhvOSIUT2SWA2Pr9
         4Q4Vceg6Ni0EwRRl5GZ/cHw4vVHaco+lLgi/7u2xtDUEk2JlJCLzvs3cOapxP/vP7Qif
         H4a4JeyWZBvZECz6FEaH6o5udD0dMnvMAFRradTm8YDnC7uIOC8Nm+yTnrf9ZRsiG2Ay
         uHe+C+nezdKWb7wbtiVpASGwLgQ8eo1KYSwXrc9f/Vpc7KiaxcKaA5fkdaxgYG6247zG
         IZzyuny4AVXKAKokDiFLJDBJPytMrTvEvMaaR3B2CHVu05wGzlSyYMNFsPhyIxnB7Pq9
         1WVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bM1uNLwh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 189si11473045ywh.272.2019.04.04.01.54.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Apr 2019 01:54:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bM1uNLwh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48617 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hBy8V-0004n7-E1
	for alex.bennee@linaro.org; Thu, 04 Apr 2019 04:54:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33325)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hongbo.zhang@linaro.org>) id 1hBy8K-0004kV-D5
	for qemu-arm@nongnu.org; Thu, 04 Apr 2019 04:54:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hongbo.zhang@linaro.org>) id 1hBy8J-000754-Dx
	for qemu-arm@nongnu.org; Thu, 04 Apr 2019 04:54:04 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:41352)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hongbo.zhang@linaro.org>)
	id 1hBy8J-00070e-1Z
	for qemu-arm@nongnu.org; Thu, 04 Apr 2019 04:54:03 -0400
Received: by mail-lf1-x142.google.com with SMTP id 10so1169670lfr.8
	for <qemu-arm@nongnu.org>; Thu, 04 Apr 2019 01:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QKqjy8Cm7Y48HQsfCSMB3tUPOIZ31G5EK1ilVdzTDEw=;
	b=bM1uNLwhkCTd0l/41eVzo7FEiTDtOvRKVKZvQlfswGf16qr1/e5IXBuqzcpiZ1NEbF
	GUdgQHzlKlS1fEW8QcVVrMRDIbg6Lske7qpTS29O2ns/PxgzdB9pM1QuO630TlXS8O1Z
	kUkppOstm7o29C4krqq2qP30CjwFTG9p289Mordo3kSv+edk0x9sN0Cnpk9sy2FS/OJ+
	XoNxN/fLyvNVI94QoCI5+zVVcnYFv+gPISojsYl4L295yX5X9n2dQfMFADmsL/DGS9/L
	9jYOZiUBygcrrjefG40CssQSvZnIuVoRX2to1H5BxY5huxU9Wn0dBJmt5oR47+ASEqqv
	LFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QKqjy8Cm7Y48HQsfCSMB3tUPOIZ31G5EK1ilVdzTDEw=;
	b=e8SoqqArUXntFmv+NZnlEEIheH9rijzs9JpFwjGOOZU8J0PfxI0hBlGrZ0quzKkocP
	xdrWN2K5AC0oB2PFn4go/T/pH1tvcEgjaOl/fSEqfxYlL5vF/9EAmA3xoawPPLs/0R4n
	7YiNyvR35CyfEm1cWN9I8tdszQLOGQdMFo3Efan/sXqzrVNXgJDSTkCiYdDT6iQOa3to
	dQaeFzCQq3Otqnx9MOnNoVxFxfC8Da39Zsc8OIGhemhzQCkt4M5OtznLjI+bsJIpEj4I
	3tYARdZoHmKZm2QxQCFGXqPKCWdQg3vtIFDzMkhwt+rUZmiQVKk3FgejCAiIDjpD1XAw
	Nbzg==
X-Gm-Message-State: APjAAAX1Qz+o7lc2QbsOvN58ScP8jb61buIuPj+ImPwBkY7Ec62uA0+D
	wTkSUiG4ecvnd+FxZ0EgZvy7s1fU5IpNw4Gq16yfPQ==
X-Received: by 2002:a19:c303:: with SMTP id t3mr2511305lff.134.1554368040703; 
	Thu, 04 Apr 2019 01:54:00 -0700 (PDT)
MIME-Version: 1.0
References: <1552644466-24625-1-git-send-email-hongbo.zhang@linaro.org>
	<1552644466-24625-2-git-send-email-hongbo.zhang@linaro.org>
	<CAKv+Gu-aZeYwegzFQ7pPqvm28ySR5xC6rZh8FBvQaWiNykgPEg@mail.gmail.com>
	<CAHmQWvD8byf+4=J7+rnU9CiGRKnuA4NnRPHRw1Zki4-m4anwOA@mail.gmail.com>
	<CAKv+Gu9cWgkH-ZTDQ42_HnN-LfAMoL-k7ysd1Hz07RrP+Pp94g@mail.gmail.com>
	<CAHmQWvArKFj9WPwaLjHs11x75iD0Rk9PBsTRq8mXrhm-LZt7=A@mail.gmail.com>
	<CAFEAcA_gA0Z1+K=TiPHbNz2XaCexujYvuqWBm3BBXHTtip_2Kg@mail.gmail.com>
In-Reply-To: <CAFEAcA_gA0Z1+K=TiPHbNz2XaCexujYvuqWBm3BBXHTtip_2Kg@mail.gmail.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Thu, 4 Apr 2019 16:53:46 +0800
Message-ID: <CAHmQWvDfpz2bRYfg9Ww-hYGhK-M1Tm2HTcg=ZAnsGKaE1w4+bA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::142
Subject: Re: [Qemu-arm] [PATCH v6 1/2] hw/arm: Add arm SBSA reference
 machine, skeleton part
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Leif Lindholm <leif.lindholm@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J5QoXPZRhq7Y

On Thu, 4 Apr 2019 at 16:47, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 4 Apr 2019 at 15:27, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> > I would like to wait for more days to see if there are any further
> > comments, and if no I will send another iteration with memory map
> > slightly changed.
>
> This is on my to-review list, but I've been a bit busy with work for
> the 4.0 release -- sorry I haven't been able to get to this yet. I'll
> try to have at least a first look over the next day or so, but I can't
> promise I'll manage that, so please go ahead and send out your next
> iteration whenever you're ready to do that.
>
Understand, thanks.

> thanks
> -- PMM
