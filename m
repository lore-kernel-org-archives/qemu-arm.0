Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp12578wrq;
        Mon, 2 Jul 2018 08:41:17 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeTKBFryBwVX9SYnmg3C2G4uZ9q3zDV0d70mQwYtSseQ10vk3Woj5vf7Qn3bos9DJfPth44
X-Received: by 2002:ac8:25c6:: with SMTP id f6-v6mr9294547qtf.270.1530546077254;
        Mon, 02 Jul 2018 08:41:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530546077; cv=none;
        d=google.com; s=arc-20160816;
        b=Z/TbFkhYUc0zbeezzqPovsr2F1pHYQMzvRcqceJGbVa89OfF3ZAd4qivaSKsHdVcwi
         nzhz8DTWeRH74nH1kiJ59P6gGDYCLT1IDHYxMmfDwUircQNcLl3RbIpgqPtWF0go9uw9
         csS4+THc2kadM39qlWfWcAhmHoXacJ+Nw3uSGlq9jnNugzghjxUr5jAWtZ3Hc7BNONP1
         vXu8JDW8XeVI9DFzij69KEHRoNyBPX+wyB1oOXRnr9m85EaezEAQ18YuRT6rI9Mlo0W5
         5VElnNjrsy5Uz7pVShnhOgEdJHraaZAAT+4exOzalVmj3SpTiAcHjaywcrKfFLTMawI2
         NyeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=xvyga+TDwvGalOhw1KI1oZoyaGKpV6ZQsyyR2du7x28=;
        b=x+tdPRtuFxf0nI4jaDsAp0RFeh/E1zJ0lkuI9gOMr/bqW8YbMlwQfET7KW/Ijz7p5C
         BUuOfTqCKE40XDD1dTZsD0ocsJC5RgRp6DtERXWkVnibwKFp8X9aL5whM+9gcG5mqIN1
         WxBzC0wdle0G+eZd4wcB8g1NT4lycYnFChZMubIklOlps6L1Ej6JV/FLwU0JrKS5aHSk
         kei8HQKtJT23PQm88GOXDmksT+SZTTwwui8PiB8Xvnhyvn/fuEcJMZNLOjCaA+fCu8Is
         lQomJItX+ibdNfnUWjFL/kzc0op3rdgv0mxdXDh3nQrwxnx7uZvOU2edjM7VMNdnUnlx
         mmYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AETpqE3o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m54-v6si1724790qvh.220.2018.07.02.08.41.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Jul 2018 08:41:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AETpqE3o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33666 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fa0x2-0003TC-M9
	for alex.bennee@linaro.org; Mon, 02 Jul 2018 11:41:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54351)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fa0lc-00028A-3u
	for qemu-arm@nongnu.org; Mon, 02 Jul 2018 11:29:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fa0la-0008AS-Tt
	for qemu-arm@nongnu.org; Mon, 02 Jul 2018 11:29:28 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:36364)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fa0la-00089y-GY
	for qemu-arm@nongnu.org; Mon, 02 Jul 2018 11:29:26 -0400
Received: by mail-oi0-x242.google.com with SMTP id r16-v6so16617329oie.3
	for <qemu-arm@nongnu.org>; Mon, 02 Jul 2018 08:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xvyga+TDwvGalOhw1KI1oZoyaGKpV6ZQsyyR2du7x28=;
	b=AETpqE3o9hXR8/ES8VjpACmfdCbyS2FXzX1txEV+PHkyTzF+Ruf4XC4fh9wpoqENG4
	/QI/lx/n8L+9nuiHjyAnnPF2R0N2yl+ZOH83YYHJybXVAX0d1XUtUGYqtQ5oGBw3sD6A
	A99nmBUi3SWiM6fr9uKMXsUEQkp6bTGkDC4Zk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xvyga+TDwvGalOhw1KI1oZoyaGKpV6ZQsyyR2du7x28=;
	b=QhtOds6u3tdR4dOQEsEe2YKh7IPn2GloO//NFizQlL7RgOU66anXw+swUhtZzpKvSp
	sjzAkFDVWbiwuXMwPdpQiZKF3Qdb/8pYY85dy+w/lSs9bSq/xT4oMxqJD5re62tVjsHX
	9GDjNGKOO4X4Ei+DNwvHWWxDjrL4OxhIUyNy+wjzA+JF77ZFyYqFRqpWAq6oqKPkT3Fa
	Wjk6KqdAdkwVpl8h6xXnGyVrb2fZa+fSJ01s8S6z5hVjjo30VQ/mVUHam40iIw7xXOw5
	Cc3eabg4zUDNFkGO82SyPXh5kvdR9prUh1TXqOl0OtMAW7cTz6XOWVnFKVFekDDWFWwR
	pshA==
X-Gm-Message-State: APt69E1m3K7NRgu2usLubNAizwKEKeP+kpup2m+euxA7Lrd1QqsGRbJm
	uON8WMLHsqjno65bOuDb7p7fr4CD3gfTSFdHEmwtEQ==
X-Received: by 2002:aca:7247:: with SMTP id
	p68-v6mr16302086oic.252.1530545365829; 
	Mon, 02 Jul 2018 08:29:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:902:0:0:0:0:0 with HTTP;
	Mon, 2 Jul 2018 08:29:05 -0700 (PDT)
In-Reply-To: <CAFEAcA_non89OR_-W3Fhr6gG0v0kkgg-ffJx-9K_h=U-Hz_wbg@mail.gmail.com>
References: <1529374119-27015-1-git-send-email-linux@roeck-us.net>
	<CAFEAcA_8TAWdkgTzPPE7eggP4UAHjVPmcXiEa_-RCxDBphJ4HA@mail.gmail.com>
	<20180626175900.GA4307@roeck-us.net>
	<CAFEAcA8PPF1mDWMGSm0r6NtYijwQQG7QnNEJ3iwaaEZU8GTu7g@mail.gmail.com>
	<20180626200008.GA680@roeck-us.net>
	<CAFEAcA_non89OR_-W3Fhr6gG0v0kkgg-ffJx-9K_h=U-Hz_wbg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Jul 2018 16:29:05 +0100
Message-ID: <CAFEAcA_LPE+qgEWVdYLyHPvD97i3aAqFLzS3qn4_RJ8hLfxtdQ@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH] hw/char/cmsdk-apb-timer: Correctly identify
 and set one-shot mode
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UJjF2mkxvQlD

On 2 July 2018 at 16:05, Peter Maydell <peter.maydell@linaro.org> wrote:
> One thing I do notice reading the code is that we don't
> actually do anything to re-enable the timer on a write to
> the VALUE register. We call ptimer_set_count(), but that will
> not reenable the timer if it was disabled -- the cmsdk timer
> code needs to call ptimer_run() if necessary, I think. But
> that bug should manifest whether we're setting the timer up
> as a one-shot or as a periodic with a 0 limit, because
> ptimer_tick() will disable the timer when it fires whichever
> way we do that.

...but as it happens the Linux driver doesn't rely on this:
https://elixir.bootlin.com/linux/v4.18-rc3/source/drivers/clocksource/mps2-timer.c#L66
mps2_timer_set_next_event() always writes both VALUE and
the CTRL register, so it will re-enable the timer anyway
and avoid this QEMU bug.

thanks
-- PMM
