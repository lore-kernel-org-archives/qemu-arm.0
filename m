Received: by 10.25.221.202 with SMTP id w71csp1135207lfi;
        Thu, 3 Aug 2017 13:45:13 -0700 (PDT)
X-Received: by 10.55.79.209 with SMTP id d200mr129442qkb.336.1501793113411;
        Thu, 03 Aug 2017 13:45:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501793113; cv=none;
        d=google.com; s=arc-20160816;
        b=OndZyDC5HMMqLmgowJI0OVpzffBYVjebTjrnpFcqo+aIsN+d7GsMrWWkxn9/gLWNgq
         cfMJ7cS1UzZ7muA4p0LztKeoEm75koDwiHmD86qRlZOiXY76YxGaaabtBq9Vw9rimiSm
         mUpyxRqnLZxyKpfnJX6ck79VQKDotqBrsy3OW3v5LxCd4N2+abO7gyKSSsApEK4s1n0G
         StjROANko8hZHxeWE9o4tfhtmgqZd2RA6fWL7BjCmfFyg0BPKo8VAUgTQU+EGYlN/uz7
         f/ew0gwN64tr2aFpV726Xd8eELyy7nD/X8oYBDh8RckQytWFjBRlfAoePkeqUs4u8iLk
         Pz0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=hDO236pVuqQR4aAUeWmB3boycnnstKAKdj0nAOfB4sg=;
        b=0WX0ij93fEmRXSJ57NJZ0ESsWpVmS7ns9HUIUUxpIJtSRD7bDHGk1yCYtgjegxE+u/
         rPpSvLv+JDBpd5/QunzDrNz8Yrrx9/Fvu6yzWtgno96bERJQLr6f7tVixQ7pYyt/FWqX
         OkNMr58/HUTOKT3961du2JehYKggEhGL0gGOk3h7MlugAcY7IfCn6+/o3kiwDdvcTZg2
         NU4ZaA191VUjpQ0AV+l66Wci4FwEbPeuJWXlwt2b2PL86CpF9HrdX1p8WIw9iaKPOHcd
         vnwxW6nNte3cXcQ7tKt3GJtAmXqbH7YK2A64rVqrF9BOIkaxaXr1mVq1rs/5xhW5mSar
         HHMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=b640FU2x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n28si32399654qkl.181.2017.08.03.13.45.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Aug 2017 13:45:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=b640FU2x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50407 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddMzW-0006dq-SJ
	for alex.bennee@linaro.org; Thu, 03 Aug 2017 16:45:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38291)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ddMzP-0006cj-Vs
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 16:45:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ddMzO-0001E5-VV
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 16:45:03 -0400
Received: from mail-wr0-x232.google.com ([2a00:1450:400c:c0c::232]:34360)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ddMzO-00018b-Mx
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 16:45:02 -0400
Received: by mail-wr0-x232.google.com with SMTP id 12so9899875wrb.1
	for <qemu-arm@nongnu.org>; Thu, 03 Aug 2017 13:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hDO236pVuqQR4aAUeWmB3boycnnstKAKdj0nAOfB4sg=;
	b=b640FU2xd01bgwPH8vEgb377Yz2/plBZOU1HWkqBctZ2wvFfn7r/37v/spNyYVyiSk
	tVsiIF9ZnWPczOIfwZGY7audSAYGsWs44reISF2DfCVswF1lVQxiKiHY8FXs1XONuKCc
	DsSDbAUJZ3/sNN5MIGbmqyZRhV0wvjw9mh+X0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hDO236pVuqQR4aAUeWmB3boycnnstKAKdj0nAOfB4sg=;
	b=LsR7sZknuCa577NTLXI1wv4cj9w6UH77txVpTnxY9t4vVqy1S+gro643q+AnzCJF4H
	OHvU5b0ol3U8VZnAAoFGNA9HfYNM2FAyNNof+h5jKjmxQ3JgTHr1Bz3brjLbyTH66t41
	Q7mHVzqemmEfbbKmXxPXNLL/8ghONGylYs/7B7sJ/Ydqg7yW4F2ACWGXWcre2MaIoDjg
	Tx0fyc6yHyIvj6tLm7X8nFHJGmUmHKukJr1DAuFSux+YUHTXvpP8CvJFd+NdHWT5HG/T
	vlSjco2i1Tbm7H3UwQ7r7VdsAYXRU/UKLT/ORLdOPbZfOxTwqoKGjON4ns0C8zZMb47v
	faSA==
X-Gm-Message-State: AIVw113uAJjk+rgjYzhzcxOy3e8mmEE0yH06MLsnlU+9kHZrvUOkW0ry
	ETnatuRsX1cYrSa3f7yvXX8PpxVcf5EB
X-Received: by 10.223.174.242 with SMTP id y105mr65162wrc.262.1501793099909;
	Thu, 03 Aug 2017 13:44:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Thu, 3 Aug 2017 13:44:39 -0700 (PDT)
In-Reply-To: <3f6ee028-b7f9-fbe0-1aea-eb1e6faab5a3@twiddle.net>
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-3-git-send-email-peter.maydell@linaro.org>
	<3f6ee028-b7f9-fbe0-1aea-eb1e6faab5a3@twiddle.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Aug 2017 21:44:39 +0100
Message-ID: <CAFEAcA-n=72QB_mpJjOvk88o1brC_udhdBKZwgTtSDa+ZB2dhw@mail.gmail.com>
To: Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::232
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 02/15] target/arm: Don't trap
 WFI/WFE for M profile
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
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p/He5jV4k/+W

On 3 August 2017 at 21:28, Richard Henderson <rth@twiddle.net> wrote:
> While looking at this, I think there's an error in helper_wfi.  The early exit
> for cpu_has_work should happen after the exception check.

No, that's deliberate; as Edgar says, the trap only
happens "if the instruction would otherwise have caused the
PE to enter a low-power state".
The rationale AIUI is that the traps to EL2 are there so
that when an EL guest does a WFI in its idle loop the EL2
hypervisor can gain control and give the CPU to
something else. This obviously imposes overhead, so if
the WFI wouldn't actually halt (because there's already
a condition that will cause it to wake up) it's more
efficient just to let the guest continue to execute.
(It also means that NOP is a valid WFI implementation,
though I think that's just a coincidental bonus.)

In fact the architecture gives even more flexibility
in that it only requires the trap to be taken "if the
instruction does not complete in finite time in the
absence of a Wakeup event", so you can do more complicated
things like "just pause for a short period of time to
see if an interrupt might come in and wake us up,
before giving up and taking the trap to EL2".

thanks
-- PMM
