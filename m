Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5317743wrq;
        Tue, 26 Jun 2018 11:11:20 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcX2PsApjqDV8nt56xrUaQK/QzI0S5V3gd8k1gXzWnE54ywE0UiuJXTh9EPJ56V+vRxXzdV
X-Received: by 2002:a0c:cdc5:: with SMTP id a5-v6mr2519099qvn.97.1530036680648;
        Tue, 26 Jun 2018 11:11:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530036680; cv=none;
        d=google.com; s=arc-20160816;
        b=dJGOjdc6/Hbhdvj7O3y3HSee7gxzMrfh8kzB9hznxylg7GIeKdHwMgOH2bjClcnCgb
         9jqzsIbdsb8QlnQphLCF3lw5yBRi/TZKk4w3CE/UfaSP3Ym1juJ2zQULO7siBKuhPFtA
         OLbyuREQZms5RrqsNdePsGPvuq7N8RCIDxCaXSpRiOWY3hPUvDWPFnUF2ZAZF+wRayE1
         d7N3WK0FWVoaanLDM8Mu7D54PVqyskiN0JZiXzbCsLjB+ZWJir9L9zfJsjtSpCdrGu9W
         IDky0vTTUCWBvI4aYGVI8OLCowk9MyDApcc9FK534KD3hxGX1wD90HWBqSt//D9B6/yr
         eibg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=cnbaGOQ4dIQKsP1VZYJka8SEADVzwvteZY0sfSE4QkY=;
        b=eq8jtc1YBDiA0AIPH6fderx7fc4yOoeKle7H9slFHz4qRt7yFCmzdGgCZxaXVyF3RG
         UVJ3XJwCSdxFiPU2FL3QeFzBXNDcBypY3VScIrly+Nh8At8E73FVHLl8iX6EDePEoFzq
         tCe9OlFo6neFJ+8L3QXrmm16LQJlLz7sW5hmSZi3cCQqoiEFzcfazNFHud6IczTf5bQC
         T1qmTAXdX7CoBZWhdDAKwGMMyoMvgxfVYcs9yEO4/60SC0Q6FSaXVoRRDftxY+RYv5Xs
         SwoUmyXVmd0D0SNAjkM5URVn/k98FYV2MRj8/NTvTmyocXS8KrnWIbqHOkUwDhqvf+2S
         iqEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GJmkhpvI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c5-v6si2044879qva.149.2018.06.26.11.11.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 11:11:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GJmkhpvI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54404 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXsQy-0000Ih-5x
	for alex.bennee@linaro.org; Tue, 26 Jun 2018 14:11:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50411)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fXsQl-0000Hd-Sq
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 14:11:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fXsQk-0007Ai-PN
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 14:11:07 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:40284)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fXsQk-00079Z-EL
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 14:11:06 -0400
Received: by mail-ot0-x244.google.com with SMTP id f17-v6so3464968otl.7
	for <qemu-arm@nongnu.org>; Tue, 26 Jun 2018 11:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cnbaGOQ4dIQKsP1VZYJka8SEADVzwvteZY0sfSE4QkY=;
	b=GJmkhpvImWf8OJxr0uN0nFzhj5Wd0DqwghNxnP8wKpTS+mlIZ78IdZ7m4/D5ti5ICT
	9S5vJAuUQZzx5Y+6RvwX+wIfmnIlKYXA3o9qDMbA2mqRN1owqiWS0v4nUSrc29LahxsO
	9m9l8V8oGzKOz1dPf1WvWSo2bIVDMJvUyhBp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cnbaGOQ4dIQKsP1VZYJka8SEADVzwvteZY0sfSE4QkY=;
	b=aLLoemW5YBrrVj+a1nseJFhy5qpBXh3ti9Um7OihW9hl9xTS31ZHWMKw5AgzhhZURG
	b0Kf40g4Hc1U4qySWXvUqrXP1Al2QH/4G+yBCi56YnTuFkR33MRyqh8WWgAyxCn9PDSZ
	TnmbLc7mkLlMglNS6E2WstzpjU1qX/VohLbS6l5P0PPQ4x1SyQbug5m/iMzKUOyMYqH7
	syBLrwKg2DZt/QDqnt8CE2JFHh2LDhpyPNcygJIjAzKZqiYt9RM82DPPNbA3TJVi/dPB
	IVZaQC0qv9a0pAUGCuhHoDRZyeoMG3rt8gb5a+qVwSKKTYhtjqtBWaEHJcGLxkse4KXv
	/BrQ==
X-Gm-Message-State: APt69E3Ag44JCD71ooUtrOudbEznJmCBgrodVox1oKQVK374n2kuhKaE
	OiG4LRoX9r+v8Eh9CZQWxOIHqMlvyvDril3XAySNUQ==
X-Received: by 2002:a9d:2909:: with SMTP id
	d9-v6mr1409117otb.258.1530036665606; 
	Tue, 26 Jun 2018 11:11:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:902:0:0:0:0:0 with HTTP;
	Tue, 26 Jun 2018 11:10:45 -0700 (PDT)
In-Reply-To: <20180626175900.GA4307@roeck-us.net>
References: <1529374119-27015-1-git-send-email-linux@roeck-us.net>
	<CAFEAcA_8TAWdkgTzPPE7eggP4UAHjVPmcXiEa_-RCxDBphJ4HA@mail.gmail.com>
	<20180626175900.GA4307@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Jun 2018 19:10:45 +0100
Message-ID: <CAFEAcA8PPF1mDWMGSm0r6NtYijwQQG7QnNEJ3iwaaEZU8GTu7g@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
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
X-TUID: lhNgg6UiO0YH

On 26 June 2018 at 18:59, Guenter Roeck <linux@roeck-us.net> wrote:
> On Tue, Jun 26, 2018 at 06:17:44PM +0100, Peter Maydell wrote:
>> Thanks for this patch. I was wondering whether it would be better
>> just to remove the fprintf message instead. I'll either apply
>> this or send a patch to do that before 3.0, anyway.
>>
>
> If I recall correctly, I tried that, and it did not help.
> The messages don't happen too often, and the message itself
> does not cause a problem. Issue is that the interrupts happen
> at the wrong time or not at all (after a while, ie after the
> configured one-shot time expires), and the kernel really doesn't
> like that.
>
> I think the underlying problem was that the periodic timer counts
> the period down (based on the time set for the one-shot timer),
> stops with the "Timer with delta zero, disabling" message once
> the period reaches 0, and does not fire anymore afterwards.
> As a result, the kernel fails to boot maybe 90% of the time.
> I should probably have mentioned that in more detail in the
> commit log.

Hmm, that's odd, because I don't really see what the difference
between the two is. If you set the thing as a one-shot then we
won't reenable the timer later either with this patch.

Can you provide an image/QEMU command line that repros this,
and I'll see if I can find time to investigate it? (We have
a softfreeze deadline next Tuesday, so I probably won't be
able to get to it until after that, but since this is a bugfix
it doesn't have to be done before freeze.)

>> periodic timer if the reload register is written with a nonzero
>> value before the timer expires (and that if that happens after
>> the timer expired that we restart the timer). Thinking about
>> this is also on my todo list.
>>
>
> I thought that was handled in the Linux driver by disabling
> the timer, updating the period, and then re-enabling it in
> periodic mode, but I may have misinterpreted the code.

Yeah, it would depend what the guest does whether it's affected,
but my reading of the data sheet is that messing with the reload
register with the timer still active isn't prohibited.

thanks
-- PMM
