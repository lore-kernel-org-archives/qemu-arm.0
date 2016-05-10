Received: by 10.25.208.137 with SMTP id h131csp1954129lfg;
        Tue, 10 May 2016 01:10:22 -0700 (PDT)
X-Received: by 10.140.23.37 with SMTP id 34mr40155872qgo.14.1462867822360;
        Tue, 10 May 2016 01:10:22 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j2si638755qhc.13.2016.05.10.01.10.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 May 2016 01:10:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45018 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b02kH-0007PJ-Rf
	for alex.bennee@linaro.org; Tue, 10 May 2016 04:10:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42881)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b02kF-0007My-3v
	for qemu-arm@nongnu.org; Tue, 10 May 2016 04:10:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b02kC-0005jf-HC
	for qemu-arm@nongnu.org; Tue, 10 May 2016 04:10:17 -0400
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:35787)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b02kC-0005jH-DD
	for qemu-arm@nongnu.org; Tue, 10 May 2016 04:10:16 -0400
Received: by mail-vk0-x22c.google.com with SMTP id f66so6321131vkh.2
	for <qemu-arm@nongnu.org>; Tue, 10 May 2016 01:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DMthIPbMhCiGsy7/xXVtlqHVB3SCnpKOvxZpJ60okk4=;
	b=QlT9tGELk4DTnl5B6+r5+AXj+pgkKRC3z9/l0HOuw6FXi6yT3JIwjINs8aZiApU/i2
	sOoPz0Y38Z2gDsdmQP9TM0lKldkbyfmnzspY9TC81hWa9vLrJOOBtsoosRRkkMCE1bnk
	JIeSUdfqxM8pMRgcEyLVuweNIhnq3hfpjhYdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DMthIPbMhCiGsy7/xXVtlqHVB3SCnpKOvxZpJ60okk4=;
	b=acwddQM7NA4Y9uOmTM2BMVKRalhVtcNySZzXrxysUiODetzW/sjN3to2rRlJRViiRU
	csBdpe4orDdhRoKF0TZ9cI/uzdhkY5o/k6Zl/EZVzVcspS3wh4ISWkr7yvU0FLAgL6Hm
	fccOjix1gBwlvKF6f16J7v/HXErzetdJ9JUh3LrJ/2JjBZXGWXk244hjF6oY+QLP9Q6p
	snozVK/BNn/sJxBNUC7L6mWYG5czocgA7RTQo+OoLjuC8Lyezx96wIfpeOdHq/ToDEYb
	Wkygzejg/3rBv2kph4BE5u1MW8JoJGIitS6WXue90ykL+H3CIvasGFZUGxmt9j8VdBBG
	DZHQ==
X-Gm-Message-State: AOPr4FX8BLB1YLAfBEqNnMzAdnVCDfAi/qt42nYYqKYEri16cjDmEb02ZenKR9RRy3v2FqkEF4gXdux09IsbRCMb
X-Received: by 10.31.81.199 with SMTP id f190mr7890589vkb.139.1462867814857;
	Tue, 10 May 2016 01:10:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Tue, 10 May 2016 01:09:55 -0700 (PDT)
In-Reply-To: <CAKmqyKOjOwWOp-6kzOunxf0F8c8r+ua62gxFJ6x2vJR2Yaz_Nw@mail.gmail.com>
References: <cover.1462557987.git.alistair.francis@xilinx.com>
	<6459df5e54365d5dbe8a1b047a85ec65c67e9232.1462557987.git.alistair.francis@xilinx.com>
	<CAFEAcA-G1jfUuK5JDFDnrFG5tKOt_VPnLBj7CD4WGkhrx_zp8w@mail.gmail.com>
	<20160507015121.GF16305@toto>
	<CAKmqyKMNbNoph2s1F4ZnC_Dqc-t_=bRtm5+oAHXnvdF09KHVeg@mail.gmail.com>
	<CAFEAcA9cGbU+LdZD9YzkJ8VMEyt+gKd5+8qi+Q-m+tgtNBg10w@mail.gmail.com>
	<CAKmqyKOjOwWOp-6kzOunxf0F8c8r+ua62gxFJ6x2vJR2Yaz_Nw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 May 2016 09:09:55 +0100
Message-ID: <CAFEAcA84aHCj2ADGkuxEbdx1qy7scu+nXSTU5K70ZPXR2PL1Ng@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 2/2] target-arm: Enable EL2
 for the A53s and A57s
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5hh9UWMObiia

On 10 May 2016 at 01:16, Alistair Francis <alistair.francis@xilinx.com> wrote:
> It is actually a u-boot problem. I originally just assumed it was a
> Linux problem, but it happens before u-boot hands off to Linux.

OK, that makes sense. u-boot tends to be a bit lower level and less
hardware-agnostic. I just wanted to check it wasn't caused by some
problem in QEMU's EL3 support we could easily fix.

> It appears that u-boot won't work at all with EL3 enabled but EL2
> disabled. It always moves to EL2 before moving to EL1 and there is no
> code prepared to handle going from EL3 directly to EL1.
>
> Just for the record, I'm specifically talking about what happens in
> the do_nonsec_virt_switch() function.
>
> It looks like there are three options:
>  1. Add support to u-boot to drop from EL3 to EL1 (I'm assuming this
> is possible, as not all implementations have EL2)
>  2. Just wait until QEMU adds EL2 support
>  3. Allow a QEMU command line option to start in EL1 instead of EL3

I would be OK with any of these three from a QEMU perspective.
Fixing u-boot is probably conceptually the nicest but I've never
looked at u-boot internals so it could be simple or painful...

Edgar, do you have the list of what we're still missing before we
can turn on EL2?

thanks
-- PMM
