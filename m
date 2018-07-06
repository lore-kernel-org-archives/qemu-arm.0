Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp2727641wrq;
        Fri, 6 Jul 2018 06:48:37 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfNO2GjQV9vLaTUbsO0OXRTORtjkz0jgulYFegXEkx6Vg8S5AdlddcQ612AN5sEZVqLHJK4
X-Received: by 2002:a0c:9448:: with SMTP id i8-v6mr8723702qvi.231.1530884917854;
        Fri, 06 Jul 2018 06:48:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530884917; cv=none;
        d=google.com; s=arc-20160816;
        b=aYmooNYXEIe50ErO4qk/ohmRwv73bxu3y+hGOYsTuhkHDxfuUdLjweCJ2EzKyOlkyM
         DqtKpoqmuR8vaS0QoBsq9qwrX730sSclKux4Q1FxXoO+qoLlTny9bWg0E/KAd8Fk/9tK
         UcOHSJ1FvkGcxnX4VGe1Y1W1FOnF5VREqnGpLCzG45BXePnoEHYw+M1bVqZ5hX+RyZw9
         4OqTmyh4GUngLLSb5XyNL0PFY1kscZKf/2e1xQ2pxffURe8WDDTyGL/oyJ1WD7bEif1f
         vMqIHOUFJZADyfISdwCIscDL9HX6phwgcx9OytSyG9UUJ2TOCER6pB60ijCLfvZl1lzA
         Iz1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=txBMw5g2GyuU3w+YDRp87igptZOXpfGKh4MZJv1XiqU=;
        b=WTZTCwbwPMwoC2JCVEtSy6HLBJuN2zx8Dlo3aWS8FwAL9y7m1OR4zoJAwJMNDKUQhs
         8NQheVjCbtj2s4fAGd/R1NiJBjiGXS7U5jO6y9/9qUBUo8iMWQVUrNhcXaUC+eO9op8y
         Trq3Z7uielwAXpV02Vs+8zoMTFK7ZOc5tFJspAziCPCJb7xxsn5LVpv+mCFnqDDqUk1i
         Um4Wt/yPq+BP7kRGJucqwNBPp39vqHhgscU7uZBCmmBpFBG41y+dIiljV097Cv/oRZKG
         SZDdXO0N/soRdm2Q0sSGgdrFSgUNgWS9EMlu6rPu02ueWQc/SYkZOwGPNR0vVJKUuc77
         9vcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="YGs/tvXC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s62-v6si1020151qke.13.2018.07.06.06.48.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Jul 2018 06:48:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="YGs/tvXC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58157 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fbR6D-0000Yz-8Q
	for alex.bennee@linaro.org; Fri, 06 Jul 2018 09:48:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38938)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fbR65-0000Yq-HZ
	for qemu-arm@nongnu.org; Fri, 06 Jul 2018 09:48:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fbR64-0007Vj-KM
	for qemu-arm@nongnu.org; Fri, 06 Jul 2018 09:48:29 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:37549)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fbR64-0007V2-6Y
	for qemu-arm@nongnu.org; Fri, 06 Jul 2018 09:48:28 -0400
Received: by mail-oi0-x243.google.com with SMTP id k81-v6so23572819oib.4
	for <qemu-arm@nongnu.org>; Fri, 06 Jul 2018 06:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=txBMw5g2GyuU3w+YDRp87igptZOXpfGKh4MZJv1XiqU=;
	b=YGs/tvXCaMuvvGLnYtHSbCw2twfN0m/6UjRudnxBzKR7hSJBXfHYeV9G8i6OOR0oGN
	BOuFEsXDF4HnBV4DfOgDe94k2njLQCObQMWc0cLXdsXEQ9mL9SikEV1i++T7eaw8wyrf
	dYLugz+0cFzTxFyj9NSPclEujvo3JPT0cRJb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=txBMw5g2GyuU3w+YDRp87igptZOXpfGKh4MZJv1XiqU=;
	b=jiLqqLvZi4RsUXyi9SBPtmuu5eNCR+0MWY7b/aOGvgRIaIgVTCl35qzcJtPo35yd29
	13tyJUjuJwqz5V7CBU7UeczBC5B6Dg0kYe+NCQJCPR9ux1+LD/yLwZY4h3F/n8LYzIQO
	wV9WdjGgIDGsIdlwCR7M7yMdI+GU7/rKCfc/nz1N0iNilc41aaEk0qSGG8xUl6WBdxfJ
	cGM+ybjjhJW8p53gBUJTD3eABPSh/hf1ooXjjzjdybk/jZxQ0rLYvBnURAAeXHtS/yO4
	D310n7f7P11WCevGjNWd57XXAF8q0QJvlHsYVqSpsVrd0b09gZKmcW063C85aFWGmUTa
	G71g==
X-Gm-Message-State: APt69E2MqVItzJD8qxmEC6PCzsz9Mav7Q3Hf2uYUdyqHoOur0Gv7fvWn
	r6Ph/WDmX4HxwTlGE+QQZWcfsG+NGAs8JSRYJAgqtA==
X-Received: by 2002:aca:ce0f:: with SMTP id
	e15-v6mr12079570oig.13.1530884907180; 
	Fri, 06 Jul 2018 06:48:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:554d:0:0:0:0:0 with HTTP;
	Fri, 6 Jul 2018 06:48:06 -0700 (PDT)
In-Reply-To: <CAHmQWvBxTaX9f+xH3zue5w5s-eiLo00jmHq2OZ4gXTAJg0XLjA@mail.gmail.com>
References: <1529663827-28854-1-git-send-email-hongbo.zhang@linaro.org>
	<CAFEAcA8Bx7b_0zUxbdxFgtANFycVkUiSiemAwHpr0wpyxuLKmw@mail.gmail.com>
	<CAHmQWvCczwh0Yto=9s2j7d00ULokZ0=VrxykAyXBvvHzQaUEMA@mail.gmail.com>
	<CAFEAcA90hDS17L64YZ5H_B-kYkMaMV+ofBtdD=TEKgsnT+wUqA@mail.gmail.com>
	<CAHmQWvBxTaX9f+xH3zue5w5s-eiLo00jmHq2OZ4gXTAJg0XLjA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jul 2018 14:48:06 +0100
Message-ID: <CAFEAcA-+rATXynVRkFsgz58kvz+Vpfi-uE_NHf9PagdDO8pe+g@mail.gmail.com>
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH] hw/arm/virt: fix psci conduit in acpi when
 el3 enabled
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
X-TUID: 7Qhj2kSOnEZs

On 25 June 2018 at 10:56, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> On 25 June 2018 at 17:06, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 25 June 2018 at 05:06, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>>> Hi Peter,
>>> Yes, your considerations reasonable.
>>> But in practice of hardware platforms, programmer checks that Arm TF
>>> is using SMC for PSCI call conduit, then fix it manually in the ACPI
>>> table, reason may be that Arm TF is lack of ACPI support, if device
>>> tree used, there should be no such thing because Arm TF can support
>>> it.
>>> On QEMU, I just mimic the situation, if a complete reasonable
>>> solution, further efforts are needed to figure it out.
>>
>> I'm afraid I don't really understand what you're saying
>> here. Could you try rephrasing it?
>>
> Sorry, I say in the real hardware platforms, in practice programmer
> has to write a fixed PSCI conduit value in ACPI. then on the qemu
> platform, I did the similar thing -- write a fixed value too.
> I know it is not a perfect solution for it, I have no better one for now.
>
>> If we're running at EL3 and booting firmware, then QEMU doesn't
>> provide PSCI. The firmware we're booting is the only thing that
>> can know if that firmware has implemented PSCI. So only it can
>> decide whether the ACPI tables and DTB should say that PSCI is
>> present.
>
> Agree with your comments, I hope ACPI's psci conduit node can reflect
> firmware's implementation, even when firmware PSCI conduit changes,
> ACPI node changes accordingly.
> But for ACPI and DTB, there are different situations now.
>
> If DTB is used, firmware(with psci implementation) can generate DTB
> nodes, saying which PSCI conduit is used - smc or hvc, then uboot or
> uefi can get this DTB add more DTB nodes before transfer it to kernel.
> That is, using DTB, we can achieve the goal.
>
> But when ACPI used, there is no codes in firmware to generate ACPI
> node to show which PSCI conduit is used, then uefi or later stage
> cannot get this info dynamically from any codes as far as I know.
> (this is why programmer manually check that firmware is using smc,
> then write a fixed value in ACPI FADT).
> So, if we want to fix this neatly, adding ACPI support in Arm trusted
> firmware may be the solution, but it should be a big feature for
> firmware, not QEMU.

I think my view here remains the same. QEMU does not and cannot
know what the EL3 firmware is providing for a PSCI conduit. So
it can't put anything in the ACPI table fragments. It has to be
up to the guest code at EL3 to determine the right answer and
put it in the ACPI table or DT that gets used at EL1 or EL2.

thanks
-- PMM
