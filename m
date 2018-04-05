Received: by 10.28.71.155 with SMTP id m27csp5990843wmi;
        Thu, 5 Apr 2018 05:35:34 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48dMu9STZU4CkXIqz+G2AnPa+92bJ2M+WcpPJ+ntjRvn+BJkVcq+xvy+GrVzuE8tmepKLUa
X-Received: by 10.200.22.229 with SMTP id y34mr31657214qtk.236.1522931734686;
        Thu, 05 Apr 2018 05:35:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522931734; cv=none;
        d=google.com; s=arc-20160816;
        b=wmS8REugkbQ8vs6zXfUGQkswNPHifL2pA2zLTFTw+pZQ0tgF2Z9Co8S7D6c79Mwfo4
         yRWSmF68HavPUrLaFhTo+ecEZzcU7HZ3i9sR2ILQcyz4Sre6GQbApHna52x0hy59ySsh
         giZ32hrKV11J4TvHk9yObSOFlSPEOxddMOtr3wFs1Zhwx8eZxAYpxJuN5t0yChzFCmfi
         jUdg4OC8iKXWs4EelTExvXRMHunr49IBDqoQOIgZ/MF4ccnPFBn7UdKFfWqZDLpKGNW0
         0D6a3JTdzKSjyLc4HecZoYcm1dTs7IbsnZ9G49mW27KffJ5r4IwVgIqgUQ7O3+lUmvdt
         GJ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=V/OuH6WLk7gsUnqPbpthRz8kk6Q6lo6vS61IIDFR2AE=;
        b=p5l596kXMWIadLKXYZTicVcqbC+NuKxLzp4mgNEwJYjqJuzZ/khKuJmYeAwZkLZ/lw
         nKLKeHWNQ2GjxJBMCwBJBHoSgP/O3PqDqahnT/oSapWG+SfjE5GBzeF7PKy7YWn+IQ3s
         FDhXWEGkbzKKW9csHCuNtRsXkhcBWvknZFf0CcHaO2lk9G4Ap+RVnMZQG2GCPLgGDnZJ
         w2CEzr1fb2/9oE0DvzHMLTKTOd9UVap4EKypqOAEjgFzy59p/PC56Du3P9UuVkasth29
         qrTHv9Jd+q9jfCshwX3QzkHWZq19XVB4fKh7xZbmfGFLcCa835fzzAb8m76RQq0R+uE+
         qj1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QNzZLXqr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v140si5686168qka.110.2018.04.05.05.35.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Apr 2018 05:35:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QNzZLXqr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54731 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f4474-0006GK-7d
	for alex.bennee@linaro.org; Thu, 05 Apr 2018 08:35:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52720)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f446s-0006DP-AW
	for qemu-arm@nongnu.org; Thu, 05 Apr 2018 08:35:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f446o-0005wq-C1
	for qemu-arm@nongnu.org; Thu, 05 Apr 2018 08:35:22 -0400
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:34578)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f446o-0005wc-5y
	for qemu-arm@nongnu.org; Thu, 05 Apr 2018 08:35:18 -0400
Received: by mail-ot0-x241.google.com with SMTP id m7-v6so27017691otd.1
	for <qemu-arm@nongnu.org>; Thu, 05 Apr 2018 05:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=V/OuH6WLk7gsUnqPbpthRz8kk6Q6lo6vS61IIDFR2AE=;
	b=QNzZLXqrpF2Tk+YcjrHSaHbgfVWL0+fw91TFqcN8JgGhzOvmPlC4sAMWrWQ+k2VwPO
	rsTqzL73XRJkeQtcTB+g53T7QXi+sx80j6mHceQq37D1cU/1qW01J4qPOMS2RtQoa4n9
	zIFxWHdqSYEZvS1Gmcjq/17Ya+zKpIl5aKCA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=V/OuH6WLk7gsUnqPbpthRz8kk6Q6lo6vS61IIDFR2AE=;
	b=llUIn4RTm7TQMZAHi4yj+M1BTQQ08a3gB/VZLcquwPf6qzEp3w4B5gk0y/kcOlIOjt
	TUWQ5TxpswB+mIiCwA5Zh4ECN8yQlJGOZ4jXZ8tJlvwrVgOoSfJKT8uS62bsKCpl7iB7
	yY1EL3TNPNBqvS1AfZUA/pXKQV9Hyf7Rni24edk7MrV8fwW6kZM7RLlqFWT/+dZmYfRI
	a0pXGQ65ir7jpf8w/9EOgjJ29P62tfQEV+kGltctVmrAcOr1JCEL5GQR6ZAscLd3DIv8
	jDL72c8fFaMp6dNP/bLZ+Wdd2byr7uyH8KZvOg2Vp3KnI1o9zk0eVAXPv2T72A2Cmulp
	WLuQ==
X-Gm-Message-State: ALQs6tBsNLZSngaWZqH/6oAfn6HUhphgAdDFTMbom9uro50mzA0vCteJ
	a9yo6sQzIwSb8FATD8gQUHbNZJwhaZbwCIP4ew5uOA==
X-Received: by 2002:a9d:2129:: with SMTP id
	i38-v6mr14585043otb.210.1522931717470; 
	Thu, 05 Apr 2018 05:35:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP;
	Thu, 5 Apr 2018 05:34:57 -0700 (PDT)
In-Reply-To: <20180404142505.4mpvautvlqemjlpp@sirius.home.kraxel.org>
References: <20180319161556.16446-1-peter.maydell@linaro.org>
	<CAFEAcA8trs8tMKBqbOLaNx4OR9H9+xO4jJQjY2+yeCNdsdCBCA@mail.gmail.com>
	<20180404142505.4mpvautvlqemjlpp@sirius.home.kraxel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Apr 2018 13:34:57 +0100
Message-ID: <CAFEAcA_psOOs6f+hgdcB0qT1M+O+X2P1aBKysPfdAqSc6nAMyA@mail.gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-arm] [PATCH for-2.12 0/2] bcm2835_sdhost: fix interrupt
 handling
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
Cc: "patches@linaro.org" <patches@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Pekka Enberg <penberg@iki.fi>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x+kXXVxP06oG

On 4 April 2018 at 15:25, Gerd Hoffmann <kraxel@redhat.com> wrote:
> On Wed, Apr 04, 2018 at 11:18:23AM +0100, Peter Maydell wrote:
>> Ping for code review, please? It would be nice if our 'raspi3'
>> model for 2.12 was one we could say actually booted a known
>> Linux image...
>
> The Fedora 27 image kernel (aarch64, 4.13) boots and mounts the root
> filesystem.  This is an improvement, so:
>
> Tested-by: Gerd Hoffmann <kraxel@redhat.com>
>
> It doesn't finish boot though, at some point the kernel starts to
> complain about timeouts and xfs throws io errors, so things are not
> perfect yet.
>
> raspi2 doesn't boot the fedora 27 armhfp kernel.  Looks unrelated
> though, it fails with "Division by zero in kernel" before even loading
> the sdhost driver.  I suspect the kernel tries to access some hardware
> not emulated by qemu ...
>
> Trying to run u-boot as boot-loader (so I don't have to copy the kernel
> from the image) doesn't work too.

Thanks for the testing. I've applied this series to target-arm.next
for 2.12 (with minor tweaks as per code review).

I have a blog post pending which describes how to boot a Debian
image on the raspi3 model, which I'll publish once this hits
master.

thanks
-- PMM
