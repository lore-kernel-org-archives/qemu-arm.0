Received: by 10.25.27.66 with SMTP id b63csp379954lfb;
        Fri, 3 Jun 2016 11:00:01 -0700 (PDT)
X-Received: by 10.200.51.165 with SMTP id c34mr4472522qtb.48.1464976801209;
        Fri, 03 Jun 2016 11:00:01 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d6si3065241qkb.119.2016.06.03.11.00.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Jun 2016 11:00:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57005 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8tO4-0005vz-Mn
	for alex.bennee@linaro.org; Fri, 03 Jun 2016 14:00:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55445)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b8tNJ-0005W9-Aj
	for qemu-devel@nongnu.org; Fri, 03 Jun 2016 13:59:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b8tNH-0007MR-JW
	for qemu-devel@nongnu.org; Fri, 03 Jun 2016 13:59:12 -0400
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:36406)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b8tNH-0007MK-91
	for qemu-devel@nongnu.org; Fri, 03 Jun 2016 13:59:11 -0400
Received: by mail-vk0-x22e.google.com with SMTP id a6so124768100vkg.3
	for <qemu-devel@nongnu.org>; Fri, 03 Jun 2016 10:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HKWCJ7Da7tBq0z0j/y/BvWuyENAFFuiDlYo7z/fT9oA=;
	b=ic+Z+H7pPwqPfCTuWlesIScLrhuq7SblnMi7y9H1tmWn8K6BjnRbQboCXSrkdUnNXX
	XgBi+LZikGeaT3NnN3mBKRF3HngoEs1p993KAaUsvEPoY5ZK7DBQ1Zq2Bxsv69MdQ+A5
	VHKOPmfcEZxzoN7JrLA7Jl3ndoFHRZdglKHRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HKWCJ7Da7tBq0z0j/y/BvWuyENAFFuiDlYo7z/fT9oA=;
	b=hwwsCDDaeKH6b28/Ukc5y/hxg9SblLbD8vq5X+IaBXM+M06Ubq5ppMYAMukK0SNr21
	9ovGDlVGShRMIYdpGcOqJObYE6XgCYbSsILXwbe+XV8401jzZcFUzzLwjqoWMNb6/A9/
	z9V6HXdGfjc1vLY7eJzVFvx+N9JX8Udyy38UcGnGKSOXgCK8WNZd5VrzvfOfIYulnyfZ
	xVyfUDIKUMguKokw6/cInhQWdx0GwKkJYPnz+et6K/Zq8LbNstb5qt1ZUTouFJuDFbjM
	y+fIOsSR6dtdaXLCv65alyXa+qUhkUcoxqmW4haDrpg1ru8ww5zkPdxz3BIIjQ9aAYsK
	2pyQ==
X-Gm-Message-State: ALyK8tLLsK2hKBLhDhoto6B5CXZUfOnpy+7Y4eMLdpr1AUdwPwixyujJRB/1rgZ6r2majOECU1B7qXdmm8Q/8pjT
X-Received: by 10.159.33.68 with SMTP id 62mr2346476uab.26.1464976750604; Fri,
	03 Jun 2016 10:59:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.69.66 with HTTP; Fri, 3 Jun 2016 10:58:51 -0700 (PDT)
In-Reply-To: <1464273945-2055-1-git-send-email-jens.wiklander@linaro.org>
References: <1464273945-2055-1-git-send-email-jens.wiklander@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Jun 2016 18:58:51 +0100
Message-ID: <CAFEAcA_7JQeQd7M5PyUBz7SUBb+8eq595osx6vTx8jAusQGfyQ@mail.gmail.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
Subject: Re: [Qemu-devel] [PATCH] hw/intc/gic: RAZ/WI non-sec access to sec
 interrupts
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bjJcgeUYmgjB

On 26 May 2016 at 15:45, Jens Wiklander <jens.wiklander@linaro.org> wrote:
> Treat non-secure accesses to registers and bits in registers of secure
> interrupts as RAZ/WI.
>
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  hw/intc/arm_gic.c | 68 ++++++++++++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 62 insertions(+), 6 deletions(-)
>



Applied to target-arm.next, thanks.

-- PMM
