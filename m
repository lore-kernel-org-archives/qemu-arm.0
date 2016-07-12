Received: by 10.25.21.156 with SMTP id 28csp400948lfv;
        Tue, 12 Jul 2016 07:12:03 -0700 (PDT)
X-Received: by 10.55.200.137 with SMTP id t9mr3397874qkl.128.1468332723610;
        Tue, 12 Jul 2016 07:12:03 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q188si2322696qkf.300.2016.07.12.07.12.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Jul 2016 07:12:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40749 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bMyPr-0004bn-3y
	for alex.bennee@linaro.org; Tue, 12 Jul 2016 10:12:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38704)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bMyPl-0004Tp-3U
	for qemu-arm@nongnu.org; Tue, 12 Jul 2016 10:12:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bMyPj-0006Ax-4o
	for qemu-arm@nongnu.org; Tue, 12 Jul 2016 10:11:55 -0400
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:33214)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bMyPi-0006AT-AR
	for qemu-arm@nongnu.org; Tue, 12 Jul 2016 10:11:55 -0400
Received: by mail-vk0-x22a.google.com with SMTP id x130so23393013vkc.0
	for <qemu-arm@nongnu.org>; Tue, 12 Jul 2016 07:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yX+ChywTaD6QTyctJOtzUDjl+B7FTXywUjk752KjzKs=;
	b=Yz+xobZIWHTAcE4g5SJBNKB0lZvI5V1VslDG3AzAlPVYoodA7kuYOW4bL9xjEVEzdS
	X6PGvgKSkLKVddLF5ooJ8C0g7Q7XNxHFrFtM75Y1TNKRdwdpKuCXOVDR9S/gv9XMu9IS
	AIYfrz3GDDfzWOdNyJtGpIaVWbGEETZ9M9VyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yX+ChywTaD6QTyctJOtzUDjl+B7FTXywUjk752KjzKs=;
	b=mnIMmx1qHNtqBBgX68oBBjRD9VG/xmLxj5Ox7cKsMPk5tTfZdBZG35Re7pN42CeSLI
	uJbRIt1OUrjC9AVe92bwNNVVawdsD3JeQyAox956ol9r2t1cA2RZqHvArS5byxb8zS7T
	3YEviQpFjmpnC5rtg+3AQpRBo1dUxNrnI/e6Syp4fU9tc6DiahZlKUwGVz85eHk45Dfc
	7Mlsv7MF2sYGRV59Ci8AseM4mTgGAuaBW1qc5MyAqy22NJY0XYHSFBsxLpWdOM/Igrd/
	jgErZKhphfSSpdXwbYavxmj2a4Lq6+EyU4pT7qsdkNxQLd4bKadUJjfIwhJS3XLlrw9p
	reXw==
X-Gm-Message-State: ALyK8tITkpKTKsy7nI0C4s81O878sPoKac27ehKJOltWfQTzJ7X9mWZn3P41I5wRy7Chz5O6lgw1FWKx/2eQrDDt
X-Received: by 10.176.5.138 with SMTP id e10mr1010230uae.38.1468332713856;
	Tue, 12 Jul 2016 07:11:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.69 with HTTP; Tue, 12 Jul 2016 07:11:34 -0700 (PDT)
In-Reply-To: <1468328885-3217862-1-git-send-email-afarallax@yandex.ru>
References: <1468328885-3217862-1-git-send-email-afarallax@yandex.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Jul 2016 15:11:34 +0100
Message-ID: <CAFEAcA8W11OvZTm0mn=XEeC_RPZae76o4rBZubiwiaEfhU4YLA@mail.gmail.com>
To: Sergey Sorokin <afarallax@yandex.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Subject: Re: [Qemu-arm] [PATCH v2] target-arm: Add missed AArch32 TLBI sytem
 registers
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
X-TUID: 99AU+EQcvSVT

On 12 July 2016 at 14:08, Sergey Sorokin <afarallax@yandex.ru> wrote:
> Some PL2 related TLBI system registers are missed in AArch32
> implementation. The patch fixes it.
>
> Signed-off-by: Sergey Sorokin <afarallax@yandex.ru>
> ---



Applied to target-arm.next, thanks.

-- PMM
