Received: by 10.25.205.13 with SMTP id d13csp9821303lfg;
        Thu, 5 Jan 2017 08:06:45 -0800 (PST)
X-Received: by 10.55.127.129 with SMTP id a123mr69268000qkd.129.1483632405034;
        Thu, 05 Jan 2017 08:06:45 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c6si47996077qtb.27.2017.01.05.08.06.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Jan 2017 08:06:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47183 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cPAYs-0007MV-6L
	for alex.bennee@linaro.org; Thu, 05 Jan 2017 11:06:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40426)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cPAXW-0007Dw-7b
	for qemu-devel@nongnu.org; Thu, 05 Jan 2017 11:05:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cPAXV-0000oV-L1
	for qemu-devel@nongnu.org; Thu, 05 Jan 2017 11:05:18 -0500
Received: from mail-ua0-x229.google.com ([2607:f8b0:400c:c08::229]:36581)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cPAXV-0000oG-FK
	for qemu-devel@nongnu.org; Thu, 05 Jan 2017 11:05:17 -0500
Received: by mail-ua0-x229.google.com with SMTP id 88so376617597uaq.3
	for <qemu-devel@nongnu.org>; Thu, 05 Jan 2017 08:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oeT/tYFGLOse9V8K1c3RBvBZR33lp7jbzo74DLTS5Tw=;
	b=i0I7RwmUDSlsbaxr4hY3y3VizWwapYj5wZPJCGS7ABqaumlTRylTwwVe8NFQZNXkbI
	j4cFb6uXn8YPnYis/7sZJOZIeCCa3s+MCnFnb2/viF/V+GQS0UtS66f/lUZYLpdL2xaX
	hV8Racu88M6FFopGE2uWtAO+AAMN7RhWbnL0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oeT/tYFGLOse9V8K1c3RBvBZR33lp7jbzo74DLTS5Tw=;
	b=juPjj2yyQnNmZaFhsBYS5w/m34wC5sRAokhcC18LC9VPPeGqz8kQlOLwDMO0u/nZ1i
	SsoF5QcyKofsD8OgRe7RU3cY57VLhyT9SmjEZ0h5S7mzwSa8/ZlwelQUSvanmxE4eC81
	T07Nse+OJMvnkzJMnuQnzzirLR22tNW47Zcbx2H6NzhCM6NrdCg3C/WxuXGP/F0QmmgY
	2L0wh2zpygI0hWvFMdAfLdttmk3VdNV1kiwLMPG2MJNRQv0nH/rGZwdsOlEP4Jmkry0C
	JF4WPDzUhDcIom+7d6JRxYtcyzdRqGTQGduWKdfCbRTiPmjCYWg6zl3TJXuH9M0qdy/J
	W5/A==
X-Gm-Message-State: AIkVDXJp/PO8yqzprUr1ebMut4rSIrKBnGsK6e3gZT+W/hD4jwrVIV4OcLFrfdyLWOxJtuL5Il8pkB3m5j3/iOgM
X-Received: by 10.176.3.137 with SMTP id 9mr47148928uau.120.1483632316853;
	Thu, 05 Jan 2017 08:05:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Thu, 5 Jan 2017 08:04:56 -0800 (PST)
In-Reply-To: <20161231011808.4037-2-zxq_yx_007@163.com>
References: <20161231011808.4037-1-zxq_yx_007@163.com>
	<20161231011808.4037-2-zxq_yx_007@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2017 16:04:56 +0000
Message-ID: <CAFEAcA9j8NaHWH+tsr5rqo4Cq2mbe32VsT-=oYmQ9UV8qAnN5w@mail.gmail.com>
To: xiaoqiang zhao <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::229
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 1/2] hw/char: QOM'ify
 exynos4210_uart.c
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Fabien Chouteau <chouteau@adacore.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HT7YO7l6ws/l

On 31 December 2016 at 01:18, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
> Drop the old Sysbus init and use instance_init and
> DeviceClass::realize instead
>
> Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
> ---
>  hw/char/exynos4210_uart.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)

Applied this patch to target-arm.next, thanks.

-- PMM
