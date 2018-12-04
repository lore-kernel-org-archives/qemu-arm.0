Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8035992wrt;
        Tue, 4 Dec 2018 05:00:17 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Wb9jv5YfEJ0iZX/s8twCx4d2POKOlvuChO3uqP2NfBrJTTFgHbdam1IjG3YV2PXxJs5Pws
X-Received: by 2002:ac8:6892:: with SMTP id m18mr18728336qtq.157.1543928417846;
        Tue, 04 Dec 2018 05:00:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543928417; cv=none;
        d=google.com; s=arc-20160816;
        b=OHCMxKkqfUtC+5iSpnv9lTaR8nf1MAPWmt7zr/sQ3FpDebV7N4I9jM3sV+E0+XVeJG
         iTliUf8DK/MyTdrmebhN5cdS140c9BBr2RZi1VkmARL47hRHcycETEhwZL0j6BaWPmBR
         vzXjKTe0Zvjsz6fflIdC9O0UxYK3Xx3Jdr8Km7nuw+ox9nE1NjrvD6vabs37A4lqbBVj
         VTCrzd3gvwdIL4AudwjdD8gYCc/JbQuKFK7R34ka7C4Hgh5SL9IaH46L1EH7hpdUKKMp
         xw7omWCqxmez3rmlYaBOln7wQRWKs5SRKHJqwmvw+LBHIuNUMPd1pa72PCmNsP5ow8Sw
         yORw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=7EEUyC3IOHc4SAK7Nfx+TH26nK54XKVhRJrRw35sT/0=;
        b=VSG9vlfGDNBguyncyJn/EOSNoEC06TVhH7BvA0cnlJ44FLxqk5uhbneYLgnbULdzgq
         VQhj+Z2/+3EGqLord8TqzcOiN2HkQqIpBrzIJjlgyxHi1zpuybVT0mN6xjNKMR0dx6Up
         aEprWyQ8fNI1BC/MgIchzgMP24BX+wqfA1Ao7/cWlEy4s4Q6cNphG/tm+4l7LvKZ8Mlt
         sU1OUsbN8v4dyEoRi/8sABWBX2D5mnI66B4O8VKlLmyTFGpXWxtdG/TeaGxYzU1hAU/k
         kCWWxNU3dJUrO5v2UKp46EkJmethUrzROszkg9LmLe3F/FXq+T5tIWWXbFpN6pYURJLU
         vC1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RVbEYcvn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e7si3008716qvp.159.2018.12.04.05.00.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 05:00:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RVbEYcvn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56470 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUAJE-0003uI-VB
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 08:00:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49213)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gUAJ2-0003qY-F0
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 08:00:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gUAJ1-0003b1-E1
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 08:00:04 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:34227)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gUAJ1-0003a2-8S
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 08:00:03 -0500
Received: by mail-ot1-x343.google.com with SMTP id t5so15087737otk.1
	for <qemu-arm@nongnu.org>; Tue, 04 Dec 2018 05:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=7EEUyC3IOHc4SAK7Nfx+TH26nK54XKVhRJrRw35sT/0=;
	b=RVbEYcvnmFUV09BqXT7jyCnnO8S/wx9vvDwxHjIbJ1Db7ZAyz/iIkh8epEygfb+RIq
	dcfSfyWN6fzLELP/SJCuhgL43hxrqUjziXyi7tGlW+ydwKAamLxCv+iisZFE974Muj5d
	YO1lEXUdlYx8JKZdigE7usmESXxc9ioUgKJ3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=7EEUyC3IOHc4SAK7Nfx+TH26nK54XKVhRJrRw35sT/0=;
	b=Mo/P/59/bTOaL6prwl99TRwoTzc20J1eEZO8Qt4k93oqH6y7p8gwbeDIP45kLMweNu
	A0tjULMq73Md3qmtPZL0/BojbmKM1hMsv90GJMqz8OYlTRQS67Dy2dSZcdsTCyGCnNui
	FCykNb3Uq0wPtyjikxtW8gERpgGCZMKT54UG6qAbFLJCs6PJkd/sS9z0iTrLrx1taNv7
	vrcGH9s9DYE9awZTTpKVjwm46In7NFlka1oCR14RZPMzyhVvyqyP7dvE7su9g294YH3M
	FePO259Wh25B3ybmlfSZU3/fvlNX3bq1UtVymZnwQqAW/1dyl5z76ol+8umWIRN+fc9w
	/dbw==
X-Gm-Message-State: AA+aEWZmPeDgLgzT6NLjbMkjllWNkc2w9RZYS54tAm4CZYFJviZityLm
	a2Kn7S8DTosWIXddjG+8Kb2sQ2AO97AatN0q+pkmZA==
X-Received: by 2002:a9d:3d44:: with SMTP id a62mr11755841otc.363.1543928402505;
	Tue, 04 Dec 2018 05:00:02 -0800 (PST)
MIME-Version: 1.0
References: <1543865209-50994-1-git-send-email-peng.hao2@zte.com.cn>
	<CAFEAcA-oFFz-NtfwHmORxQd4rHsfKa1=tV1kyvPuGQoOZwDB3A@mail.gmail.com>
	<20181204124739.GA17825@redhat.com>
In-Reply-To: <20181204124739.GA17825@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Dec 2018 12:59:51 +0000
Message-ID: <CAFEAcA_ovMgKPPjtYVASFqhzM7MX79EJYMZuFY4-FGRh4oqN8A@mail.gmail.com>
To: "Daniel P. Berrange" <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V11 0/8] add pvpanic mmio support
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
Cc: Andrew Jones <drjones@redhat.com>, Peng Hao <peng.hao2@zte.com.cn>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HEU6NTt3264D

On Tue, 4 Dec 2018 at 12:47, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
> After it had merged there were some changes and the question of turning
> it into a PCI device was raised. Paolo was concerned that the guest OS
> is in an unknown state (arbitrary locks held, data structures corrupt,
> etc) when panic is fired, so simplicity of the I/O port was desirable:
>
>   https://lists.gnu.org/archive/html/qemu-devel/2013-08/msg03309.html
>
> Anthony countered that even a PCI device could simply do an outb() in
> config space:
>
>   https://lists.gnu.org/archive/html/qemu-devel/2013-08/msg03325.html
>
> So it is not clear using a PCI device is in fact a problem in terms of
> reliability at time of firing.

...and if we'd done it that way in the first place for x86 then
we wouldn't be having to do anything at all now for Arm.
That suggests to me that we should do it that way now, and then we
can avoid having to do a bunch of extra development work for the
next architecture, or the next interesting Arm board model.

> Perhaps more relevant is the question of how easily it can be initialized=
,
> as that affects whether it can be used for panics during very early boot,
> or from firmware:
>
>   https://lists.gnu.org/archive/html/qemu-devel/2013-08/msg03296.html

Mmm, firmware and early boot panic is potentially an interesting
use case. Does UEFI actually make use of it, though? A quick look
at the kernel source for the x86 pvpanic driver suggests it doesn't
take any particular steps to ensure that it is initialized early,
though I guess acpi drivers probably init before PCI.

I notice also that there's a mention in that thread that the pvpanic
ACPI table entry on x86 resulted in unhelpful Windows notifications
about new devices it didn't understand. Is that going to be an issue
for Arm with this mmio pvpanic ?

> Finally, there is also the point that PCI slots are precious, and this
> is something to be enabled out of the box on all VMs, so you'd be removin=
g
> one extra PCI slot from general usage. Thus mgmt apps would need to start
> adding PCI bridges sooner. Not a blocker but something to bear in mind
> when weighing up options.

Space in the 'virt' memory map for random MMIO devices is also a limited
resource, especially if you want something in the <4GB space.

thanks
-- PMM
