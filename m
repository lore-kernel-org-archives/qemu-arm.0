Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2031981wru;
        Thu, 16 Aug 2018 09:15:32 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwAhSp1/jECWbe5H14cvGwMqQ6ErO19Wxfm7nbALIuJgvXKeMhF6fsKAbtBzP91yEM/EZCP
X-Received: by 2002:a0c:f7d2:: with SMTP id f18-v6mr27267346qvo.175.1534436132328;
        Thu, 16 Aug 2018 09:15:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534436132; cv=none;
        d=google.com; s=arc-20160816;
        b=I6+E9uyhIiqeGw/A6Or+Q6EetejzZSvILkaHErV11nuZmxUF3GXvs2Kh1R8wWV6TTe
         mO0IQL4C4vVwSRq50yTP5zEYt3N4LomGnj5hrn1InVry1Gp3ySIUWWl6D5tlJd95f9s3
         wuBkme4gu11b7SQXjShriHadXehD+18t064AUxUYyhkN1w7hrtuR1vsbJLm8FqDVyad2
         r7y58e1C495l/NNzA6ngjM8h0AF3WQ9tnMWkB+j7t+yunARPYJpVPiMU/v/85fmE1pyG
         ISxVLOkNLU43RXFRvIRLyrdmrHL3JfKATJYP1llNzGo/z24M166a4kfzsq+9lPKSLRoF
         plgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=R3fmu0dHdc7rK39vSP40iB1Q7be/rztnvfq0m4r5PO0=;
        b=qu1fwSls2IrM38PNc9foX1DkybraDUZXezmPoUIHYm9m9sbJRTv8IgCDMLpAl2Xu5x
         ZRuk36Vebn4cqm2bISP9yQ7Z2WstLcHtMqUHQPNyKNFxNK1L3bXgFV4HWQm03OtCsbh6
         9+UUq+4SnEZ4t+3J4If5fuN+uyJVcLclNvA+Kf6u+ohNIF7fzXjvG4LhnL9oqINL8dZB
         JAIQyHHdDKWuD8vDJloYxYmSxQhM2qljdQqUylcoqo1yMflQ9yHBTsB9eHxhBdaIk/7x
         cDpfxEsqkZGPxgwDnWdXRvecyiUKT+ezBetV6pmAp+KyPBV13jZWFIz01oPLnXvge33g
         AFiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZmhOS2YV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y51-v6si7589215qth.95.2018.08.16.09.15.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 09:15:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZmhOS2YV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56682 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqKvr-0003P4-LR
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 12:15:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59547)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqJt1-0007yy-Kh
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 11:08:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqJt0-00064t-NB
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 11:08:31 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:46272)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fqJt0-00064W-FZ
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 11:08:30 -0400
Received: by mail-oi0-x241.google.com with SMTP id y207-v6so8557740oie.13
	for <qemu-arm@nongnu.org>; Thu, 16 Aug 2018 08:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=R3fmu0dHdc7rK39vSP40iB1Q7be/rztnvfq0m4r5PO0=;
	b=ZmhOS2YVcioT48Hhnn57co2CSZwOHeWuLxkQ3xL1D9U7J+RfxRt2wNtqzRBJmrU0Dn
	3ggnxcjoC5+/8pGNlHngM+TjTbYcMIbHM4X8zndivd2SjcWCXy4w7zAkeeC8ZMoAPhv3
	B2Nj1ISy1WwUnnPn2xtjpHJivJHDqvPhfKbTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=R3fmu0dHdc7rK39vSP40iB1Q7be/rztnvfq0m4r5PO0=;
	b=KcuMzBu2FtsCVWcbpHVIUXtDmhmCGRmJtKfral9X6R5v2CUMfJa1eXY3lfbx0AmGUs
	faGyNPvHI322bpn/xaA5uBeyEGOasmCvVfTzssLl1q8NeN/N9e2il9gSe984W5IT7RuK
	Fwo3ki4e8adW2bG2GXvzJ9UJ5wO4kHh9h6eee+2g0A8upCwhrGeFLTW2L9MoQsh/AVdN
	z90Kb7DhmFQSZFP9QHg7pxc6lBQini4zWT+dHPa5xCMqtkqiZ9v6DOeLyT38/DO4KZEO
	JQK6sXmSgq6r0N2EDmd+BnHMtkyok9wUI0i6R+8ord1wiuV6OnnJZJ5SxoVnXUJ4sdRl
	+FgA==
X-Gm-Message-State: AOUpUlH4njUaZvuZuDtG4VnMqmK5b4CYuJHAvg/ZSvqa3QDlvx8hfoWk
	1oOOz8qGve4OnPo4n33+we7XqWtRMCawRlPmlDWupw==
X-Received: by 2002:aca:6142:: with SMTP id
	v63-v6mr34191528oib.137.1534432109840; 
	Thu, 16 Aug 2018 08:08:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 16 Aug 2018 08:08:09
	-0700 (PDT)
In-Reply-To: <20180811090836.4024-5-contrib@steffen-goertz.de>
References: <20180811090836.4024-1-contrib@steffen-goertz.de>
	<20180811090836.4024-5-contrib@steffen-goertz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Aug 2018 16:08:09 +0100
Message-ID: <CAFEAcA_FADcGb576hb7hoa0HrO0=pQQyTSh_+pQiEFuDz11gAw@mail.gmail.com>
To: =?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH 4/7] arm: Add additional datasheets and
 copyright lines
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
Cc: Jim Mussared <jim@groklearning.com>, Stefan Hajnoczi <stefanha@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yLybG2ENnm0S

On 11 August 2018 at 10:08, Steffen G=C3=B6rtz <contrib@steffen-goertz.de> =
wrote:
> This patch adds a link to the product specification
> which contain additional information about the
> Nordic Semiconductor nRF51 SOC series.
>
> Furthermore it adds a copyright line to all
> files that get changed significantly.
>
> Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
> ---
>  hw/arm/microbit.c          | 1 +
>  hw/arm/nrf51_soc.c         | 4 +++-
>  include/hw/arm/nrf51_soc.h | 1 +
>  3 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/microbit.c b/hw/arm/microbit.c
> index d6776dea0a..bb6ddb6a79 100644
> --- a/hw/arm/microbit.c
> +++ b/hw/arm/microbit.c
> @@ -3,6 +3,7 @@
>   * http://tech.microbit.org/hardware/
>   *
>   * Copyright 2018 Joel Stanley <joel@jms.id.au>
> + * Copyright 2018 Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
>   *
>   * This code is licensed under the GPL version 2 or later.  See
>   * the COPYING file in the top-level directory.
> diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
> index 85bce2c1e0..2265d30352 100644
> --- a/hw/arm/nrf51_soc.c
> +++ b/hw/arm/nrf51_soc.c
> @@ -1,8 +1,10 @@
>  /*
>   * Nordic Semiconductor nRF51 SoC
> - * http://infocenter.nordicsemi.com/pdf/nRF51_RM_v3.0.1.pdf
> + * Reference Manual: http://infocenter.nordicsemi.com/pdf/nRF51_RM_v3.0.=
pdf

This is downgrading from the 3.0.1 reference manual to the older
3.0. Is that intentional?

> + * Product Spec: http://infocenter.nordicsemi.com/pdf/nRF51822_PS_v3.1.p=
df
>   *
>   * Copyright 2018 Joel Stanley <joel@jms.id.au>
> + * Copyright 2018 Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
>   *
>   * This code is licensed under the GPL version 2 or later.  See
>   * the COPYING file in the top-level directory.
> diff --git a/include/hw/arm/nrf51_soc.h b/include/hw/arm/nrf51_soc.h
> index 24212f9174..45d9671dc3 100644
> --- a/include/hw/arm/nrf51_soc.h
> +++ b/include/hw/arm/nrf51_soc.h
> @@ -2,6 +2,7 @@
>   * Nordic Semiconductor nRF51  SoC
>   *
>   * Copyright 2018 Joel Stanley <joel@jms.id.au>
> + * Copyright 2018 Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
>   *
>   * This code is licensed under the GPL version 2 or later.  See
>   * the COPYING file in the top-level directory.

It probably makes more sense to put the copyright line in the
same patch where you add enough code to the file for it to be
a substantive change.

thanks
-- PMM
