Received: by 10.223.161.27 with SMTP id o27csp2292719wro;
        Mon, 30 Oct 2017 03:00:12 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+R8pLaDjnOY7FyWmXasXFvaIPnkTvwbMyyQPPsZVHHdol19BIoMQ1yOfkVAkyjQy3h2u8At
X-Received: by 10.37.65.148 with SMTP id o142mr5672667yba.275.1509357612698;
        Mon, 30 Oct 2017 03:00:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509357612; cv=none;
        d=google.com; s=arc-20160816;
        b=JQJcT8fQ3SbPxxd66QH4l+O55LmDnmtDU4LOqIsLkQVWRxUGGEV9e9WS4zNu0FNy5Q
         TFVnuP+skWrQwRZijcJhDkzYf3AOQRL1gqcT1abZHVFz2JpcxfMp5OSv9CfQPxIYfi83
         KtbEziEjt/cuFIvNXAOC91xREdh774Mr5K2fTMrKxa5TWg/9qVptUc9wCeWqVG0viR9G
         xVsRKH02w6RWq+HVvOPNcxPEDihYSkaDMsdCoVa3s5L9mc87MOK6z6+VGPDGPzS0dX70
         eAhHYIWnI3xy7tSxc68jFM19Z+l5YsVIvQjctdjen9DAn1jKBXydgJYbDmbs5ET73Xh0
         Uufw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=1XLWz/Y27+BBgLtjNakb5Qp+4hB6P/fT5NyrtT3KXiM=;
        b=DPJ51zxHeby3jKC2zstua1HpH/eDgEuTbWsHW+fWbwGi5+r1tSxgeV0Wq05x6UUW0v
         rFKkQl1RYDISfyltSKQM4Xinek8u8tRpvyrXHs7pJWH1UUdi5aSOtARF3Rw3HdUf6a8O
         bXmWkWui1bFimcW5rzKGrsfilvqeuTQl5KlEO2xITSMe3V3eRAKcLDFScI/hX6YQoMSF
         mCFtCxlPN7KVc34cKGpzkXPmjDKGy5xvCi86YT7d8Af+IMnhfKJoOBOIg2UiutyOoTJh
         MOm3Iz5xmXOS8YT4Ogkwly+hJSrvRTBIo7BxK5mYa7zBw7t3BAdhIZt/WMmwup8Ebcpf
         xHEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Xt8xvaaM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 126si1495134ybq.81.2017.10.30.03.00.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 30 Oct 2017 03:00:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Xt8xvaaM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39569 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e96rc-0007JD-8R
	for alex.bennee@linaro.org; Mon, 30 Oct 2017 06:00:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35649)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e96qX-0006nM-QI
	for qemu-devel@nongnu.org; Mon, 30 Oct 2017 05:59:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e96qX-0003L6-6U
	for qemu-devel@nongnu.org; Mon, 30 Oct 2017 05:59:05 -0400
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230]:45330)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e96qX-0003K9-00
	for qemu-devel@nongnu.org; Mon, 30 Oct 2017 05:59:05 -0400
Received: by mail-wm0-x230.google.com with SMTP id y80so7777155wmd.0
	for <qemu-devel@nongnu.org>; Mon, 30 Oct 2017 02:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1XLWz/Y27+BBgLtjNakb5Qp+4hB6P/fT5NyrtT3KXiM=;
	b=Xt8xvaaMZO9SVqhBselyzZc5QakmL3UwC7ltbAwaCyc8jrD1eQQpg4wkpcR0QONfs0
	yDjzadaYE1gB1DkUt/gJxONjCrljRh5X3seqQLvTH6R4E0KnLMM3Eu5C6JwmRKVR1/XH
	BFyY4A0J0TtxgJy8b8qJHzcFvG6SB9Hgv6dyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1XLWz/Y27+BBgLtjNakb5Qp+4hB6P/fT5NyrtT3KXiM=;
	b=ip436Rehe1ZMmFQZzgpN43yWhACyYXudCZ4cd25pisCK3VOaDk58mU9w+YlDAzKgSw
	pQKaRPEevOhFNUnkZwXyh9X+qwTIejSnamWOQpcJ/8JI+iAO4cZ92cvnhRQIMn/YJLtA
	4t6iE1b6z1fGLmivFvhRdIjM6LQ7xiwM9C67madnx92+TC6JoTEzFgFwgO/jt/O5ek4e
	fLIQ9gMmRPYgPpGRm5jg4lWuBQn9OOZtAmdQU8+s7B85ifE+ZPd8CitV1vm+gvM45U7y
	1wTeW1qSeJxKdbve5yf4+ZFl+jxfJ2N6ePajLZaogJSftxEWjDioERHW3/R94UseXOz0
	4XVg==
X-Gm-Message-State: AMCzsaWNjhW74zZVDL48dHoDjLB+fBuukNMMReujBkAxssTEumVW2t9J
	a7r1D34tzqw7uKYQFSpe1A/Q8yKrJAtCaN5i557Sig==
X-Received: by 10.28.46.136 with SMTP id u130mr2861123wmu.127.1509357543864;
	Mon, 30 Oct 2017 02:59:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Mon, 30 Oct 2017 02:58:43 -0700 (PDT)
In-Reply-To: <1508898544-10307-1-git-send-email-sundeep.lkml@gmail.com>
References: <1508898544-10307-1-git-send-email-sundeep.lkml@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Oct 2017 09:58:43 +0000
Message-ID: <CAFEAcA8yX6QKngPT8sbssDo+UOsH9cyCshrXigMkwTk2uoNWmw@mail.gmail.com>
To: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::230
Subject: Re: [Qemu-devel] [Qemu devel V4 PATCH] msf2: Remove dead code
 reported by Coverity
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>, darren.kenny@oracle.com,
	qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
	Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o57tQbpckTSA

On 25 October 2017 at 03:29, Subbaraya Sundeep <sundeep.lkml@gmail.com> wrote:
> Fixed incorrect frame size mask, validated maximum frame
> size in spi_write and removed dead code.
>
> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> ---
> v4:
>         changed %d to %u while logging frame size error.
> v3:
>         Added comment that [31:6] bits are reserved in R_SPI_DFSIZE
>         register and logged incorrect value too in guest error(suggested
>         by Darren).
> v2:
>         else if -> else in set_fifodepth
>         log guest error when frame size is more than 32
>
>  hw/ssi/mss-spi.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>



Applied to target-arm.next, thanks.

-- PMM
