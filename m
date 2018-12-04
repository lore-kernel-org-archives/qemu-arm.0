Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp7851521wrt;
        Tue, 4 Dec 2018 01:40:35 -0800 (PST)
X-Google-Smtp-Source: AFSGD/U6i7Sk6JRzCkyEKH2zWAt3xHe3737Jz2SUzO4OzUVsrVHXk+T2gFZuJfj5b4O6sEzCufAV
X-Received: by 2002:ae9:df02:: with SMTP id t2mr18134360qkf.230.1543916435208;
        Tue, 04 Dec 2018 01:40:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543916435; cv=none;
        d=google.com; s=arc-20160816;
        b=XSxkaPwZ/7lnNxicSg/LMaCPgv+BXQNdP6hkYzozc6o/WIWhEYcaK9WIRepht31sjE
         LiRGZiRVW7a0GI+pARYgq27OFXqUErFmNgpa5uGpycpya8CJxdKtNwIEOkelirWZv6Tk
         s1wn0Vu2+WvsUAVC+uVQbtTN42wuS6LxrhYoqNHQ+a/dVPAggjao7FfwTyLPD2FuavF7
         SO/H/S87FMJX8Ujo9T6A7XIKFqrDqqVQPuhmUx7oBVZtBFMpGZy+wZjPvXODo6T6IRAZ
         udgfWNw+weUtXXn3CoLoXi1brW4cpx4aAt86hdWhN4yRcWETHJzh2Q29oENxemNRbYLz
         2JDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h9ZAlR8z9rvjeXoeFBKdrT7HAztS5pmnAhn++SfDLwk=;
        b=s7YMOAKaShBDj7TX2o2xKyYwDPXSQ2h8MA7jWJp1Al3RV/NeKUk2Ye/1dkTOtPrQWG
         BDCYmdjWmnMnBQSj9fi1kRaO8MtPSVymhijWpKoxztCwTSp4ndmfMZRuKZL2vLjXThN5
         +Ol4XAnuEXI8h8vRYk0Dw8KS2ys47erl7y/do0lQzE3MqlzSkh4kBae/fH15m5IdLx/0
         Vj6Do9lneVQRcWR1uh4ROCFlx1Wdg2s5BO+wSokhbEyVFjWL7SNPzaZrRu8j767AEwfF
         V9dQ8qbKC7OaNMSfi+VacEZb/SyEmiPRKjkVIpRlu3Kg5J+3h9oakqHyu8g2rLG1gwb9
         EARg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=D1lyIALH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q11si6428883qvb.83.2018.12.04.01.40.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 01:40:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=D1lyIALH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55207 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gU7By-0002cd-NH
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 04:40:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39148)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gU7Bk-0002cF-JI
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 04:40:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gU7Bj-0003h8-D9
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 04:40:20 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:43952)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gU7Bj-0003gg-67
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 04:40:19 -0500
Received: by mail-ot1-x343.google.com with SMTP id a11so14524870otr.10
	for <qemu-arm@nongnu.org>; Tue, 04 Dec 2018 01:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=h9ZAlR8z9rvjeXoeFBKdrT7HAztS5pmnAhn++SfDLwk=;
	b=D1lyIALHrOmqFa9eHZ6KdEjWtxkwwdhnXjJW73A/NhYcMd9KPSAajZnZt+I2Xz3r+f
	ir7zoGnTajKgn49M2hW/riMBmGQG0MYwUtC7dTluxjlpX0ixd13iuSkdIB717yAEvbgS
	rI5zI6I4I5oE7AX2BaGON5OpB4wY0cAW4CtEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=h9ZAlR8z9rvjeXoeFBKdrT7HAztS5pmnAhn++SfDLwk=;
	b=UbGCcljxs1TvObkKvQgej8Fg4Rep3jIUZy0viWzOGu1NqTD6yvoX/V84lCm9hf6LzO
	lyXyniiBvm0O9zQd8ZHAs9Q4LYZ8fCg8Q0KZ/awqJiFzhKpdO7yIhgRImquouOVfFb3R
	qdauItwBVPKlOfIUjjXAhgySz8m8ol4cAYfYqaQjs07gBJfbXqiT19MC24Xn01+C0xR5
	up+OughwkvztBUH8fWKEh70kkv94tfCu+LMjiStiZocXJXqb8hqaHG8jhdSKLq//nmVR
	2LWqEcgOJqwc4Fl9+GzYfwM7t0C+5X8+9pzOrb311nLo4KualbXT/2xmpD3LeVz8jNQn
	Fipw==
X-Gm-Message-State: AA+aEWY2q2x9g/Cf9vrbhAl0QrVHTmt+ZYwKNnUoCB8mIgimhl9nT1Fq
	EEASQWAdQV0356lrmCkUUaaj2JgTmmAopfI9tTJn0w==
X-Received: by 2002:a9d:bf7:: with SMTP id 110mr12820577oth.201.1543916418564; 
	Tue, 04 Dec 2018 01:40:18 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA-oFFz-NtfwHmORxQd4rHsfKa1=tV1kyvPuGQoOZwDB3A@mail.gmail.com>
	<201812040841510784684@zte.com.cn>
In-Reply-To: <201812040841510784684@zte.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Dec 2018 09:40:07 +0000
Message-ID: <CAFEAcA8hw_PHrBTC+v9rr8VoeU5uiV3Z6nMRknDM7WWdG1Ti5g@mail.gmail.com>
To: Peng Hao <peng.hao2@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH V11 0/8] add pvpanic mmio support
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ldCifa07yXxT

On Tue, 4 Dec 2018 at 00:41, <peng.hao2@zte.com.cn> wrote:
>
> >I would still prefer to see a more detailed examination of whether
> >we can do this with a PCI device before we commit to taking the
> >MMIO version into the virt board.
>
> I'm sorry I thought I had sent an email. yesterday when I wrote an email to
> explain the reason, I was interrupted and forgot to send it out.
>
> Now the pvpanic device is implemented as a mmio device or an ACPI device in the kernel,
> and only one device can be seen at the same time. If the kernel parses FDT first, then pvpanic
> is a mmio device. The kernel parses ACPI table first(and virtual machine is configured with ACPI),
> and pvpanic  is an ACPI device.
> If pvpanic is implemented as a PCI device, then the PCI device must still be seen when the ACPI table
> is first parsed by the kernel, because ACPI device relies on the mmio space of the PCI device.
> Mmio devices can be thought of as just an address space rather than a device in the strict sense.

I'm afraid I don't understand. If it's a PCI device then
it does not need to be listed in the device tree or the
ACPI tables at all, because it is probeable by the guest.
This also significantly simplifies the changes needed in QEMU.

> Secondly, I don't want it to be a pluggable device. If the user
> deletes the device by mistake, it may lead to unpredictable results.

If the user deletes the PCI device they're using for their
disk or networking this will also lead to unpredictable
results. We expect users not to randomly unplug things from
their system if they want it to continue to work. In any
case your guest driver can easily handle the unplug: the
guest would then just lose the ability to notify on panic,
falling back to as if the pvpanic device had never been
present.

thanks
-- PMM
