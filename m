Received: by 10.28.4.212 with SMTP id 203csp237506wme;
        Fri, 4 May 2018 09:51:31 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrY7St52zETMkkMfs+ediJPvTXlEevqnrs3Z+2THMVQyMwQAx7pcWesuYvdV6Hzqut+Xiyj
X-Received: by 2002:ac8:2947:: with SMTP id z7-v6mr23323005qtz.251.1525452691537;
        Fri, 04 May 2018 09:51:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525452691; cv=none;
        d=google.com; s=arc-20160816;
        b=X55gTKVqBxfiezlCQlEb3QbTCCgJaR1F/jsH6nfjgBFzd2pYxiU2d0WFnuHDc8Xn7Q
         eJC9UbWV5S7uJRDXlYPMAeJ2oRJdtz3udNzktb5XdrCry2e8YURGRfYWx/KOupIN0QxR
         n7AdsaiP+qoITA++2IOQEY6GEP8YPX8yXnM63Aik95+KsIv+tyN6ZOj9DgY2e79/7NMq
         USwCu18tKgS7CG92cX8JS9PcrWlizW8E5wG2K1q5sxo/Jq9mxlBwce/8zJGXaZbAhZQM
         aRDysPC80xxalZlxVmntWCF7dAnGaaT6lUSqOpVJAUXQTlIBKFo66wNSYaHfpyxxGD5M
         4FfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=DYYt0hGetKOXM1FqYk+fmHsIdYb8IsD/YlKtw7Ie2u0=;
        b=heaNoWr1Rk+Wg4Nub1bRB8l3QsdoPArusRBATe9dkItbGhoZUWYRIOWFvZK+5S70QZ
         NazS6VG3C6I71qzsHXfOoWZLz2crguEkvHfRMPGr+DL0QQRPC9MaanrFZ4JNiyYVXoXD
         s/7fs/SiJJDbuWw5WMQfbjfd8DkekmIscMkqZ8IYa6lkOcZTFgI7SrfSoWSciklZEL0O
         UW6RLq5Hx/w/4eyHakStxG8p1DgiCW13scQsHetpKIe59Lm9tbObsUAGH16zrIGVBMns
         nRuRmH4stSs6I+UzbC5Z/PP54RO5hM5lxTibeCyccKiiWJYwGonLEobjXS5uYLOOwWk0
         AOWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B0P5gsP0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p85si1670528qkl.174.2018.05.04.09.51.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 May 2018 09:51:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B0P5gsP0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35467 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEdvf-0000Pi-4t
	for alex.bennee@linaro.org; Fri, 04 May 2018 12:51:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43791)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEdvY-0000P4-Eh
	for qemu-arm@nongnu.org; Fri, 04 May 2018 12:51:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEdvX-0006nz-O7
	for qemu-arm@nongnu.org; Fri, 04 May 2018 12:51:24 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:33651)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fEdvX-0006nh-I8
	for qemu-arm@nongnu.org; Fri, 04 May 2018 12:51:23 -0400
Received: by mail-oi0-x241.google.com with SMTP id k5-v6so12905346oiw.0
	for <qemu-arm@nongnu.org>; Fri, 04 May 2018 09:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DYYt0hGetKOXM1FqYk+fmHsIdYb8IsD/YlKtw7Ie2u0=;
	b=B0P5gsP0ly65b93KJXmAZPTCByTy7YFtwCZ+QjSggAwmVMnejZKgrf46ZGaIaAe+dE
	1IjrhpSWZy1HC5QsJKlakjCqEwVvL+dC7jtxpJV5Pxzpe3/ruShvvOLfYertTZeN5xME
	avD6L8OAnQy04p9rkTYnovVH/fv/TTdJZgiF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DYYt0hGetKOXM1FqYk+fmHsIdYb8IsD/YlKtw7Ie2u0=;
	b=RnHog2iJR+6949G7i1sbiSaPgBIMxpO4OhseU07NFFjUqdkPr6N/GhmoN5FF+ycKC6
	gko8ygK7hWBUHyQyIuMOsDM6SPpnXlA3/7FTqtLzqu7n1Rdnujzm/XImx6rDNW/9cP9/
	K4q7+h8xryY+nElVhsJhXv2NQsLZUaYqNC6V+rwSftRl3qThnAPJ/dtq/nmtS662els0
	XRCthnWyxX6B9zIyAn19QrIoqhAUlfM8Q8k245/es7rNDWT7aSuc7LhHW/AldEaXDWb6
	3Y/ONZO2nFKJxkwoC7Xu9Tm4L6ISDz7QQIDZpzUtrCdMUURrm3zKERH1rIpsUvt9Psax
	v8lA==
X-Gm-Message-State: ALQs6tD67fJVyi0ripUwcunc6qZpASG+E6Ssrddac9z5Ao04amPkn/2Y
	+YvbLn3twlmvD+2H29YbJJq6RBuLDMYC7hPOhjnaWQ==
X-Received: by 2002:aca:f141:: with SMTP id
	p62-v6mr15469450oih.80.1525452682601; 
	Fri, 04 May 2018 09:51:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP;
	Fri, 4 May 2018 09:51:02 -0700 (PDT)
In-Reply-To: <1524665762-31355-1-git-send-email-eric.auger@redhat.com>
References: <1524665762-31355-1-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 May 2018 17:51:02 +0100
Message-ID: <CAFEAcA9SyY=1eVdXkHpxyES004T5WAx_h9axDSSo-vk440sfiA@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH v12 00/17] ARM SMMUv3 Emulation Support
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
Cc: Christoffer Dall <cdall@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, linuc.decode@gmail.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Jintack Lim <jintack@cs.columbia.edu>,
	Prem Mallappa <prem.mallappa@gmail.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sA2cMHTssM1/

On 25 April 2018 at 15:15, Eric Auger <eric.auger@redhat.com> wrote:
> This series implements the emulation code for ARM SMMUv3.
>
> SMMUv3 gets instantiated by adding ",iommu=smmuv3" to the virt
> machine option.
>
> Only stage 1 and AArch64 PTW are supported. [1 - 14] bring the core
> emulation code. [15, 16] bring optimizations and 17 brings the vhost
> integration.
>
> Important Note:
> I added the last 3 patches for consistency but I would be happy
> if [1 - 14] could land upstream first, without waiting for the last
> 3 patch additional review cycles.

I have applied 1-14 to target-arm.next; haven't looked at 15-17,
so I suggest you repost those as their own series once 1-14 are
in master.

thanks
-- PMM
