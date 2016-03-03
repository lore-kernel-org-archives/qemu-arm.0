Received: by 10.25.208.211 with SMTP id h202csp2727039lfg;
        Thu, 3 Mar 2016 06:29:25 -0800 (PST)
X-Received: by 10.140.168.85 with SMTP id o82mr3624104qho.10.1457015365421;
        Thu, 03 Mar 2016 06:29:25 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 207si41144501qhw.106.2016.03.03.06.29.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 06:29:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:35496 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abUFo-0000Cn-Qv
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 09:29:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38141)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abUFN-0008Ie-21
	for qemu-devel@nongnu.org; Thu, 03 Mar 2016 09:28:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abUFM-0008M0-6h
	for qemu-devel@nongnu.org; Thu, 03 Mar 2016 09:28:56 -0500
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:33897)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abUFM-0008Lu-1n
	for qemu-devel@nongnu.org; Thu, 03 Mar 2016 09:28:56 -0500
Received: by mail-vk0-x22c.google.com with SMTP id e185so22898727vkb.1
	for <qemu-devel@nongnu.org>; Thu, 03 Mar 2016 06:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ycck32k7FCKBNmTQowF0b0xlo8J0HlJQQRSvwg48ZsU=;
	b=WcfAEnduHBlttXssCnv+tBTRzO5GXDbBMPZuY1dI78YyapGM2LMSJbo7hnZtcYc5FU
	inHgWYN7gpgJ3yFs8zI9FCVkcVwrBgiyWfVSTi9TAlL/wJOShF2wiDfOX2VdziWl8U3D
	hUbD4C9emV9LhJokL7LQ/MJUDgRLHGMqqoiFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ycck32k7FCKBNmTQowF0b0xlo8J0HlJQQRSvwg48ZsU=;
	b=Ixwpn6TI1tYfzLenZnvJOcVWsHHlCnckVa4iBObiHVIBQZQfJMnaNVewxWew6WygDe
	8aUjgHgU720qS9G0YsHgqA/q91X0Hn2A7DYnu525NgcSwhKDzRHJBKHv7RFS/uCQLAKo
	ECY/E/gPtrdKxvv5M+tcCLIm67hTmnvUvTKEDIYM002rle4E8q/ciAkMWuIxS1f82lbr
	ep+8CQgYL8Ut5+XW0dDHWQKytoDCpsNPhyPKUjxVnjVsGy0khuyONTuT9c/8jCmwb0O2
	HYulb4pPPD+NVkJmck2FmldDVTfIeAG9vafurgIlM5tHMxXRJEZ4czkUF3W7cvXXE9UI
	PxCg==
X-Gm-Message-State: AD7BkJJX+sSRCUuPVYwHYZhjIvUlXdP3tr4ZpnrLgD9bHHkPguIgK/MwWinZcUhKtUgx5PKeygzeNR4fX1YML4BA
X-Received: by 10.31.107.194 with SMTP id k63mr1825208vki.27.1457015335632;
	Thu, 03 Mar 2016 06:28:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 3 Mar 2016 06:28:36 -0800 (PST)
In-Reply-To: <1456880233-22568-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1456880233-22568-1-git-send-email-Andrew.Baumann@microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Mar 2016 14:28:36 +0000
Message-ID: <CAFEAcA9db2Tnp_FYq3PB4fAqkjvYFiTpR+3S4c06GnQFGy5p=g@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: Re: [Qemu-devel] [PATCH] bcm2835_mbox/property: replace
 ldl_phys/stl_phys with endian-specific accesses
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UtL+JiUvE4uD

On 2 March 2016 at 00:57, Andrew Baumann <Andrew.Baumann@microsoft.com> wrote:
> PMM pointed out that ldl_phys and stl_phys are dependent on the CPU's
> endianness, whereas device model code should be independent of
> it. This changes the relevant Raspberry Pi devices to explicitly call
> the little-endian variants.
>
> Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
> ---
> bcm2835_property will probably have a trivial conflict with my current
> patch series (which to add framebuffer-related properties).

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

and applied to target-arm.next.

thanks
-- PMM
