Received: by 10.28.4.212 with SMTP id 203csp1686049wme;
        Thu, 3 May 2018 02:38:53 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqJ2tYo1J71jvH8sEn0SzBwKwnIWWyh7JMVonOTMQTX0m6yTPBrV0dZqmDUBpVrsmT//ibe
X-Received: by 2002:ac8:3431:: with SMTP id u46-v6mr18908867qtb.193.1525340333486;
        Thu, 03 May 2018 02:38:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525340333; cv=none;
        d=google.com; s=arc-20160816;
        b=AfLffj+q80B0L1qQ+DsgEP57myOpFD+pS9EoDVFIG6gDLTMUoC/uSpLjBPzZZoIEnV
         pTayE8eHpqWqKRVUMrg6adx42R2GB5vqvYSuKnkLqnE+TISMlFYxpcVCy58aKszEGBKW
         vm/7Y4bhToJmMdSw2F5itV828vA94oOBbJ8/BYE1fEjLAe7xEEEWxaL/WQiQ0DAenniu
         6rtE6p//pwwKFBkKQnvgZ0nB7raJHKbG4+ca1MSFnhgfMHIT68ttfHaJ0psb+O04XprK
         7vGs01HfC//8aEVs6X6486S42nI/D42Dq7tAN8G+ZY3Py2g0CMnwxeg2DzssrMNlveDn
         PZ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=J+zuZUyPIfhdXW0AOjnOGdlG9jtWdI3TNPQzNXOxzhw=;
        b=MJY6a7byihc2PwWR/NIr4L2TYneGTq2r02yvZ353ORHeaAriH6BidkNNitrENsHY2B
         9GzXaIu7md/3yojvYVpAoZ3d430msIUcVBvxe5jvgbPsWJ6k3j6did05uG+IMGJI+JDZ
         kLwmMcO9NKsDvVp24cpfzgcPtHXDBiaPy7pNphCyRc4VbVXIspD9uGqZ37LijUOwhOtL
         O7cfu0I5ASoy44YlkMQzN/zsMW/AZ0Sjq52k92V0VFuasWc2XRJZbZ2Fg25XVajjeMEA
         hsKB04nkSIJmeckVy2AgElpiiuvSCMmFPUth7Vj/RmV9uIwkO15kWOLDEXtx+Pdo0Hd3
         IG8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aickkpvv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b29-v6si2147848qvf.142.2018.05.03.02.38.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 May 2018 02:38:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aickkpvv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54934 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEAhQ-0008Ri-T6
	for alex.bennee@linaro.org; Thu, 03 May 2018 05:38:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56606)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEATk-0004zP-Gy
	for qemu-devel@nongnu.org; Thu, 03 May 2018 05:24:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEATj-00073z-Ev
	for qemu-devel@nongnu.org; Thu, 03 May 2018 05:24:44 -0400
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:43277)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fEATj-00073l-AA
	for qemu-devel@nongnu.org; Thu, 03 May 2018 05:24:43 -0400
Received: by mail-ot0-x242.google.com with SMTP id y10-v6so19826235otg.10
	for <qemu-devel@nongnu.org>; Thu, 03 May 2018 02:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=J+zuZUyPIfhdXW0AOjnOGdlG9jtWdI3TNPQzNXOxzhw=;
	b=aickkpvvvGVUaAIJzJw3WPgyR1CiL+DEwONgPSTmtS8VVFRZni4WdQHEUEFHhXFo9G
	kp8KbwX7lieYMgkvG7ekocymenhoel9zXuHUw18MBTv4sDQWMz1HFSZJLO+Uqc61Fasm
	27hS2jSN1G3jKkD04wKj9ftE2nwJFEk/RLjZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=J+zuZUyPIfhdXW0AOjnOGdlG9jtWdI3TNPQzNXOxzhw=;
	b=A6V3OOuwfkk/B09REJEIHKZynZsFZtzg3TL/0siVu7uxSCvH8ecAzbCZXKzA1vQYNR
	oAqXm6fwFzb6E0MFOdEDgq8pYndTnTF593FsaSGgHKo/Y+ilPH5ZUu1A8avyFTsu0R+l
	FlSOyUeIHGCl07vk61oYL7MHGxVsqojylIv0DiP/Tg74qhmhqtY7yP4Qpb8+jpNrl7fp
	m8rfHnDYmfcNFjBb9wtk1MkmfCWYc6BnEpuDe+oeLcR0R1gV4RM5h/qIP8vSMVkhucPU
	sYjaVIlZSLblA3qRVx7dijQp8GqP+V4HsXpeQDDgDRLQIPgB9mnn9kwdqaHySdg5bd3Q
	I8gg==
X-Gm-Message-State: ALQs6tBUKHr9PVHNVZLhhTTF8smlBEm5LWNmefa8dQMsauQfTO36HplG
	2/w/T9tEB/+beT2GSaVR1MuPlmI5EbVC2l7xkgTcmw==
X-Received: by 2002:a9d:2013:: with SMTP id
	n19-v6mr15203808ota.258.1525339482555; 
	Thu, 03 May 2018 02:24:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP;
	Thu, 3 May 2018 02:24:22 -0700 (PDT)
In-Reply-To: <20180503090532.3113-1-joel@jms.id.au>
References: <20180503090532.3113-1-joel@jms.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 May 2018 10:24:22 +0100
Message-ID: <CAFEAcA_dP5QRrZoX8P67xjNVpv7QssnMP9yd5sXqAEu2tQ5Lww@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-devel] [PATCH 0/2] arm: Add nRF51 SoC and micro:bit
 machine
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Stefan Hajnoczi <stefanha@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Jim Mussared <jim.mussared@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IyNCsUX0zdYA

On 3 May 2018 at 10:05, Joel Stanley <joel@jms.id.au> wrote:
> Hello,
>
> This short series implements a minimal definition of the Nordic
> Semiconductor nRF51, a Cortex-M0 ARM SoC, and the BBC micro:bit, a
> machine that will use this SoC.
>
> This work will serve as the base for our Google Summer of Code and
> Outreachy interns who will work on implementing a number of features on
> top of this base.
>
> I've tested this with a microbit micropython firmware, and checked that
> it starts running by looking at it with gdb.
>
> I chose to keep the nrf51 and the microbit seperate, to not confuse the
> peripherals that are on the microbit but are not part of the nrf51, and
> vice versa.
>
> Please review!

Hi; thanks for this patchset. I've done some quick overview review.
It looks broadly ok but there are some details which don't follow
our current preferences/practices for board and SoC models (we have
a lot of legacy code in the codebase that follows older approaches
or is just buggy, so it can be hard to get those right. The mps2
boards and the iotkit SoC are the most recent I've written so
probably not a bad pattern to look at.)
We should probably not put this into master until we've got at least
the cortex-m0 model, though.

thanks
-- PMM
