Received: by 10.25.150.194 with SMTP id y185csp1702645lfd;
        Mon, 28 Nov 2016 03:47:04 -0800 (PST)
X-Received: by 10.55.74.1 with SMTP id x1mr19435037qka.316.1480333624895;
        Mon, 28 Nov 2016 03:47:04 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u75si31783039qki.308.2016.11.28.03.47.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Nov 2016 03:47:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58066 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBKOl-0001pJ-LU
	for alex.bennee@linaro.org; Mon, 28 Nov 2016 06:47:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cBKOg-0001oZ-GO
	for qemu-arm@nongnu.org; Mon, 28 Nov 2016 06:46:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cBKOf-0003BF-I1
	for qemu-arm@nongnu.org; Mon, 28 Nov 2016 06:46:58 -0500
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:32855)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cBKOf-0003B4-CC
	for qemu-arm@nongnu.org; Mon, 28 Nov 2016 06:46:57 -0500
Received: by mail-vk0-x236.google.com with SMTP id 137so71841535vkl.0
	for <qemu-arm@nongnu.org>; Mon, 28 Nov 2016 03:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+eJ6nIaTFl/ZigBd0eZfe08AUmAND2dH+yfEW9TXOok=;
	b=CCtNMdl6C6U7ZAbAJPZ8dpSPXS3V1jWqwzGiFG9OV7i/N2H00OMj/rrtYjZHkMt5iI
	vGn7/c3YCaZTF/PhEtkwnvnzLT7rNXw5z65rQzDrFV4ZhzHVmSn7kmC5GVFbIcfyf3fN
	S0A8U+IlyUhNlPRovt4NwDDOhTya0Vhn3bPns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+eJ6nIaTFl/ZigBd0eZfe08AUmAND2dH+yfEW9TXOok=;
	b=fzFsqXD6qiAgo+L8ziA971J4+DaDBw/kuB6cKTDRN51AMvCRy1oQHLj6kF4mZxrhU4
	NEMTM7KgG2qqN+nlyKQ3kq8LGkmBv2x8r/a2U2XWr6dKuJPh9dWjcLEaHXt8rx7bWEMj
	Pohnp2dRvJsA0Stybey5yPqb8ry7Mjb2DvohgPPeggeUij3JHZx1O2YD/C2bNHTONaPL
	Tz+kepRYDmkmgv4JqPqy3uvl5xPl1HcO31EpJjLRYFytxOCNjc4b9wY61fL7uK9YDjEU
	qq3cS3QhQvIfh3cvfrH69LdOdh4FJIPuGW41utue6Jbx21zBJjee+yUbwhGG8cIWpKkZ
	zP6g==
X-Gm-Message-State: AKaTC02bamCnDfz5igpFoybR/DlZyBcQ5Nns4Wu193KJ/3CeZxwfxG2sYxl8n38pMzYHToDxujxTDLo9k/F3Ltws
X-Received: by 10.31.16.36 with SMTP id g36mr6026131vki.170.1480333616007;
	Mon, 28 Nov 2016 03:46:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.185.4 with HTTP; Mon, 28 Nov 2016 03:46:35 -0800 (PST)
In-Reply-To: <1479346221-18474-1-git-send-email-linux@roeck-us.net>
References: <1479346221-18474-1-git-send-email-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Nov 2016 11:46:35 +0000
Message-ID: <CAFEAcA_APzbMcUfzm9B-qde5gtNJWSJMTLHVRa0tJyy3Hz0M3w@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Subject: Re: [Qemu-arm] [PATCH] arm: Create /chosen and /memory devicetree
 nodes if necessary
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Alexander Graf <agraf@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u9qfxIQ1al8Z

On 17 November 2016 at 01:30, Guenter Roeck <linux@roeck-us.net> wrote:
> While customary, the /chosen and /memory devicetree nodes do not have to
> exist. Create if necessary. Also create the /memory/device_type property
> if needed.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> The problem is seen with the latest version of the Linux kernel in
> linux-next (next-20161116), where many of the /chosen and /memory nodes
> in arm devicetree files have been removed. This results in a kernel hang
> (sabrelite) or qemu abort (imx25-pdk).

The lack of a memory node sounds to me like a bug in the Linux device
trees. The 0.1 specification at http://www.devicetree.org/specifications/
says on page 21 "the following nodes shall be present at the root of all
devicetrees: [...] At least one memory node".

There's no harm in QEMU being robust against bogus input, though,
especially if the dtbs are common in the wild, so this patch is
worth having. (And 'chosen' is definitely optional.)

I've applied this patch to target-arm.next.

thanks
-- PMM
