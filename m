Received: by 10.25.159.19 with SMTP id i19csp759970lfe;
        Tue, 2 Feb 2016 09:01:28 -0800 (PST)
X-Received: by 10.55.41.91 with SMTP id p88mr35866315qkh.86.1454432488619;
        Tue, 02 Feb 2016 09:01:28 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w187si1781759qhw.32.2016.02.02.09.01.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Feb 2016 09:01:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:58250 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aQeKW-0006Qx-6O
	for alex.bennee@linaro.org; Tue, 02 Feb 2016 12:01:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38691)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aQeKT-0006Mc-QD
	for qemu-arm@nongnu.org; Tue, 02 Feb 2016 12:01:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aQeKT-00006D-0L
	for qemu-arm@nongnu.org; Tue, 02 Feb 2016 12:01:25 -0500
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:35585)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aQeKR-00005l-QE
	for qemu-arm@nongnu.org; Tue, 02 Feb 2016 12:01:24 -0500
Received: by mail-vk0-x229.google.com with SMTP id e6so101473296vkh.2
	for <qemu-arm@nongnu.org>; Tue, 02 Feb 2016 09:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=YXAtobllIv8TudjWS3PDy+TmmdymyaFWWdU3MInX13c=;
	b=Glth5nczL9/n206akeUfx1MYLTLh0pgNwUu46mNsG6LDzdoS+SnEIL0fMwRkeFhhVd
	L08oWqXSTfDo/Q1tO4aCaH5ZmJX4ERYYPCD+Cwro8w5JNVNLvT4ThfOBVYPgBSGBjtpp
	o7JB6UvKDgjn4kJoGF/MSlKYxaP/tg55KkuM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=YXAtobllIv8TudjWS3PDy+TmmdymyaFWWdU3MInX13c=;
	b=bnxUwgRJnnd3bq6tze182faEB/gfdk55r35JlvqtDbSEZLOn6Q5X8Buxmx3FTjN8Gw
	KDNI/fk8cB73uBBJ3/oTr8qglOgHAY31g8jSYY1fl3jfe8NXhVBZGVMMPxs8q1K2971Z
	znpk3VkqhCrM4jPjPRHHmDtlOkP8+aoOo5G+CS/SDhqfUWnelGU36ZiBhpzO/Vr8W8F0
	kPa8S1bITIy6d3HUz1om6eRHQlALn62wfSNpIUCPR8yC6b1wLNWosZ79OhpS2uu9NlIC
	n6EUIDeGYa+OBxFOjcLZptvMszy4FSjwHvGpvTgrHT+XqW3oAM3h2Wd4MP9bEuHHC8Ko
	XZ0Q==
X-Gm-Message-State: AG10YOSq3SUuVDdcTSpbo0ZFrEeXUJ892foI6BCKlwT9zww5T2sEh82o3hCaUAwYnDXuQ2PW8oTZmKtm3LAuAgck
X-Received: by 10.31.180.85 with SMTP id d82mr18534166vkf.83.1454432483306;
	Tue, 02 Feb 2016 09:01:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Tue, 2 Feb 2016 09:01:03 -0800 (PST)
In-Reply-To: <56AA6A8C.6030906@tribudubois.net>
References: <1453844678-26279-1-git-send-email-jcd@tribudubois.net>
	<CAFEAcA_xk8ChTA0YppK=mbTZptiL8AGy8RDKQTBS-L0SDaKRXA@mail.gmail.com>
	<56AA6A8C.6030906@tribudubois.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2016 17:01:03 +0000
Message-ID: <CAFEAcA-_Bo1UPfjzOZKT6SJ_xb+rMcPPHJ+GAFuDxAObWX-PJQ@mail.gmail.com>
To: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 0/6] Add i.MX6 (Single/Dual/Quad) support
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tIY88NR8OGjJ

On 28 January 2016 at 19:22, Jean-Christophe DUBOIS <jcd@tribudubois.net> wrote:
> Sabrelite uses uart2 for console but on qemu, this is uart1 that is wired to
> the default stdout. Consequently, I changed stdout-path in "chosen" to
> uart1.

This I find a bit awkward: we'd like to get eventually to the point
where you can run the stock device tree unedited. The other items
on your list are just "we don't emulate something yet", so the path
forward is to (eventually) emulate the missing things. But it's not
clear to me what we need to do to be able to stop editing stdout-path
in the future.

Perhaps the answer is just to use QEMU command line arguments to make
stdout be the uart2 rather than uart1?

> For now i.MX6 SOC code does not emulate SPI controller. During the boot
> Linux was getting stuck trying to access a SPI device that is supposed to be
> there. Therefore I disabled the SPI controller in the device tree.

This is OK for now, though I guess it means the SPI controller is
worth emulating to at least some extent.

> The sabrelite is supposed to have a bunch of push buttons (home, power,
> back, vol up, vol down) wired to various GPIOs. I guess these buttons might
> have pull up or pull down resistors on the real hardware but obviously on
> qemu we have no such things. As a results the GPIOs were triggering a lot of
> interrupts for nothing. So I commented out the GPIO sections were the
> buttons were defined.

This is OK for now, though it would be nice to wire all the GPIOs to 0 or
something if that helps avoid the problem without editing the DT.

thanks
--- PMM
