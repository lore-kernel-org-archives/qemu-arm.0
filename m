Received: by 10.28.71.27 with SMTP id u27csp2028674wma;
        Thu, 22 Feb 2018 06:37:14 -0800 (PST)
X-Google-Smtp-Source: AH8x225cK+X6QJSbfo7jcJWFlMOeV6kri3knF24b+j8gdOdl5iPsZDmQXUc8IxpuQ5/RPSF9+Rlr
X-Received: by 10.129.125.139 with SMTP id y133mr4657232ywc.463.1519310234260;
        Thu, 22 Feb 2018 06:37:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519310234; cv=none;
        d=google.com; s=arc-20160816;
        b=u+hFWg3A4nfJ0ClolVWIVA8sc7htWg26n9h3yHtpIj6Car7O8Dzh/L5PWhTFnlWYvU
         kXIXw5DSinh8soVAxBwiWbytUkCNiuli6pcaZigo2qzN2dKgdrisSs07Kp3yMoSI5IBr
         v6LGT7LoNwsOYoMZ0AK5jYcLJIVqRqAZnu2EaZEynaCLAb0m28jAR1WIqJHiGjp6q/9X
         pMT8EK35+1xCFCPeOCYBZd1FChvFSrm4NubcRxwXD82lLfPi873sHNRQ84HNSzNG9/ep
         iaijY6Snf8VygUvKKb8fCGJxwkSwYtGQ0Ui8fk8CtuvC4y59FzjPzj+PgF5WmBgvOYXi
         /ETA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=14wHwB1qNdCfScXJjZXpNqUwDoSc55k3xVtGKxPZcY4=;
        b=a8KZ6/UwZTAKQrr59yWStGVX9fieBTVQL9HW7K5auy2HnZAI/tcw6DX1Z52hlbe2v2
         Se6IGt3vghwA8uxLFR3oVM0ZYoP+V/+pw7RduAw5hphU7Ms3nOQDOfJjS9P0FosZxh+5
         ROMqOY4H1cRh4jTSYfENSRA8WiWZJWk6X1ShwKchMNyRQNaYiujPuinVyy1kcMbWB/CV
         ARKAcyOZHNtTqyoYScPhaBpbR0nvzmcVJf/dSvUOQpWcqOS8RWpiQQmH4WHi+DSOuIED
         Lfq3bqpKZuHERTWbU2XudNAIgdKfuIL2YLdaw+T6efBySoUB0mJbGoBxtZd7TxfWl9po
         zxZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=adnApPtk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x205si33414ywa.243.2018.02.22.06.37.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Feb 2018 06:37:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=adnApPtk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38624 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eorzl-0005GB-Mb
	for alex.bennee@linaro.org; Thu, 22 Feb 2018 09:37:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53638)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eorzP-0005Ft-AY
	for qemu-devel@nongnu.org; Thu, 22 Feb 2018 09:36:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eorzO-00048Y-Ci
	for qemu-devel@nongnu.org; Thu, 22 Feb 2018 09:36:51 -0500
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:44454)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eorzO-00047O-85
	for qemu-devel@nongnu.org; Thu, 22 Feb 2018 09:36:50 -0500
Received: by mail-ot0-x243.google.com with SMTP id 79so4763098oth.11
	for <qemu-devel@nongnu.org>; Thu, 22 Feb 2018 06:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=14wHwB1qNdCfScXJjZXpNqUwDoSc55k3xVtGKxPZcY4=;
	b=adnApPtkiS0dWQHu9GZ8yQ4OhtWodN1iWugT7Gug9VDThvvTZKKLDSDKuiEYiX2nrL
	e0+ohFtXQcqg3sf6XTJGX1ge/ccMdEzWjmlABYO/xO7MFoiZnNcbq/CxCxdc11oE7IaL
	NZ7vPabdrKZQnwzK26SkBnLav3cQLeX1WB7vo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=14wHwB1qNdCfScXJjZXpNqUwDoSc55k3xVtGKxPZcY4=;
	b=SEtbtiUx6LaiIvKQZGqz27+fFJlkTxImCmmMOgyWo41ByDwvu+vu7iXW0j/eb/4dnH
	w/4mWLWFGeNtcoYaE74KQglLNuq97+WUKwaZm4aPHHoxKrVwo3uaX9/ewW6gAq1WuRP9
	4VlxUXOiv2/o5Dw+KtXLsFzDOSGQMK5z0DNc+hcz6faEarZT3YJ6/mWgVEm1GKx/vJX5
	0f7VFYgI6yTOgU4ojkDUatJIKOMicY9VfQFriPYmGmIHXEFTw/y7Bgl1hkabEnL+59uQ
	1yR24V2dBhNxmBEr+FBIYWK3t7Uv1M6/5ztxLhMdLHVqeO64mPuyck98HkNDSZ4uvZR2
	bSWQ==
X-Gm-Message-State: APf1xPDEm16WSPy31C4YToYD53CJBDPJLqxp6CfyfqV2BWkFW0QR22Ql
	zO/pgy3kWg//D5idH0GnHmiu4VN1Nyg63dOjncOq4w==
X-Received: by 10.157.7.227 with SMTP id 90mr4983743oto.126.1519310209475;
	Thu, 22 Feb 2018 06:36:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 22 Feb 2018 06:36:29 -0800 (PST)
In-Reply-To: <20180217140051.22731-1-linus.walleij@linaro.org>
References: <20180217140051.22731-1-linus.walleij@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Feb 2018 14:36:29 +0000
Message-ID: <CAFEAcA_RX7fmbAZX75pCJVPBEbN4im_W2BOH6m=ghgm6e-JtdA@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 1/3] hw/i2c-ddc: Do not fail
 writes
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
X-TUID: YO457LZEKd2y

On 17 February 2018 at 14:00, Linus Walleij <linus.walleij@linaro.org> wrote:
> The tx function of the DDC I2C slave emulation was returning 1
> on all writes resulting in NACK in the I2C bus. Changing it to
> 0 makes the DDC I2C work fine with bit-banged I2C such as the
> versatile I2C.
>
> I guess it was not affecting whatever I2C controller this was
> used with until now, but with the Versatile I2C it surely
> does not work.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  hw/i2c/i2c-ddc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/i2c/i2c-ddc.c b/hw/i2c/i2c-ddc.c
> index 199dac9e41c1..bec0c91e2dd0 100644
> --- a/hw/i2c/i2c-ddc.c
> +++ b/hw/i2c/i2c-ddc.c
> @@ -259,12 +259,12 @@ static int i2c_ddc_tx(I2CSlave *i2c, uint8_t data)
>          s->reg = data;
>          s->firstbyte = false;
>          DPRINTF("[EDID] Written new pointer: %u\n", data);
> -        return 1;
> +        return 0;
>      }
>
>      /* Ignore all writes */
>      s->reg++;
> -    return 1;
> +    return 0;
>  }
>
>  static void i2c_ddc_init(Object *obj)
> --
> 2.14.3

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Does the guest attempting writes mean that we're missing functionality
that the hardware has? Is it interesting?

PS: I didn't see a cover letter email with this patchset --
if you can send a cover letter with multi-email patchsets that makes
our automated tooling much happier.

thanks
-- PMM
