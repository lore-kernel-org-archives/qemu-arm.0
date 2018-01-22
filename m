Received: by 10.28.71.27 with SMTP id u27csp2705994wma;
        Mon, 22 Jan 2018 03:49:12 -0800 (PST)
X-Google-Smtp-Source: AH8x227RXaIEps4WQDM0UVgMzhpx0lFOnRz0sTw1C21bi5p2TDcXSXBRlJjL42ZOk58X/p00eFbt
X-Received: by 10.37.85.134 with SMTP id j128mr7180787ybb.172.1516621752715;
        Mon, 22 Jan 2018 03:49:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516621752; cv=none;
        d=google.com; s=arc-20160816;
        b=XvJdGmMYJHogZlRDpgxgHqW1uAotpOZImdynQsCQ6hSxCZZa3EIrXKIo7LwCfMrfJ7
         4ZL041ICxyPssqfTPW2d2qBk2q4C7oaygdaZAucpfQ2eVk01ueF0kPjIG6S+FGwVwGtO
         Mw4gg3mSc8Qzz4QDBNEcHxGapXJNBP1HLRR8mJtU+K+8tp9ZeBKg+ShWcnB5P7kobmya
         tGQHwk1PBJXY7iny0aCAoHSUyjS53/f0bCSN/N0bWGBDKSP14J7Zq6+Qnuext5CU9QeU
         xRJwhzjzwYUapeXFL+miauVsphyXdiviAzQYeFCl7NIIWG8dmy257q6n0kc7/UZ8V2vx
         rsYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=rcangwXgdzXn5W6WzXn1iB1+S92C2ti/lb0uGfhZQ50=;
        b=O46K8iFV5uq9r/MFA3h6Q0K60VSfdeHsQDqrJGNDdDYgX7oKkfmY50rjpdbuL43Llv
         eGdH+qcYQliYgBw1Fcf46UNOUxc+D9RNo7q37jJDIzeo+p1Wzqz8+EPbAfJR7ZEir1cz
         xXElc9dg8PUdlx1JY9kV88ZA6VvJY3n/bjkjWMkgFGoFGwhO3v7Oki1vbACfrgPCLTpO
         qJtIaH8nJmS8s3fAfu/qmVRZccqznodqUiVZRGUEeD+/VvrWocZcjEUzExGbhXrw/yPU
         nEfg166/iUD8j3gol/Cp9JWFw9hggfvzhgcx93OtYC2ooDQYO76bf3hZDRE9V6xR1ofh
         XUqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eIztG0Wa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v125si1956624ybe.572.2018.01.22.03.49.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Jan 2018 03:49:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eIztG0Wa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37414 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edabA-0005uk-4J
	for alex.bennee@linaro.org; Mon, 22 Jan 2018 06:49:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48857)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1edaaz-0005u6-4f
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 06:49:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1edaay-0007Iq-8q
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 06:49:01 -0500
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:46830)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1edaay-0007Ha-2l
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 06:49:00 -0500
Received: by mail-oi0-x243.google.com with SMTP id d124so5705041oib.13
	for <qemu-arm@nongnu.org>; Mon, 22 Jan 2018 03:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rcangwXgdzXn5W6WzXn1iB1+S92C2ti/lb0uGfhZQ50=;
	b=eIztG0WaDfQUEXRq8AJEI9vRa3IJvmrMIlCBDCF4MLU3bawkAvZk8403YpptY2pJow
	wT6slKpHCRYxOJNHprYQb7TYqfHNLqh8jqxYiHVGGhbcqHHduN753ZQT4FBM3j5YqqDU
	KiASL6EuCintmsyrSN8AyqMTeZ6FM+yfpqCEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rcangwXgdzXn5W6WzXn1iB1+S92C2ti/lb0uGfhZQ50=;
	b=f//SZ3IWchHbtF+NP10Lj5XUOajfGNgKW6IjqK8TuupHw8R9YN7i8DjJ6xVpIokCO+
	h+QOGUCVKhzkNl9FM9c5M/a1xvzGleJLpIxMHjGikpeKNH/78gbiWbbnLfXuEaQQdJ+u
	r1X5JdfGa/+u2suX1uMg74sgKhuzImEof4GZhFkJib3wtggVNqth7biKats4RJqOXKhs
	slOEHoxkt+w8PFg6kTx+VbexAWCV43pRXtLJpodxCWnfCCSy18yPUmWcw2lRvGAAYjyj
	bHP1cbeIC91lKMDblpD8QUNYC4Lt26sCZAQyce9o/NxLvkvYQrDpC0niqFhWydnbOiQJ
	yr8g==
X-Gm-Message-State: AKwxyteJYkb+IvUHiQvjLocg2JRuQYwF+WIX5riUnNbYmoEIvsPRuahV
	z6BD3+TujmsOHhp5EoLcIfI2DZKaijjiZVbzlS3+/w==
X-Received: by 10.202.180.133 with SMTP id d127mr3681681oif.328.1516621739064; 
	Mon, 22 Jan 2018 03:48:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.61.133 with HTTP; Mon, 22 Jan 2018 03:48:38 -0800 (PST)
In-Reply-To: <20180113113445.2705-1-jcd@tribudubois.net>
References: <20180113113445.2705-1-jcd@tribudubois.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Jan 2018 11:48:38 +0000
Message-ID: <CAFEAcA_epX=BOj5sxNVB2z-k3wQ+RRAry=OQi2b=i0d9pJaSeA@mail.gmail.com>
To: Jean-Christophe Dubois <jcd@tribudubois.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH v2] i.MX: Fix FEC/ENET receive funtions
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
Cc: fyleo45@gmail.com, Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9E068Ov38RJ1

On 13 January 2018 at 11:34, Jean-Christophe Dubois <jcd@tribudubois.net> wrote:
> The actual imx_eth_enable_rx() function is buggy.
>
> It updates s->regs[ENET_RDAR] after calling qemu_flush_queued_packets().
>
> qemu_flush_queued_packets() is going to call imx_XXX_receive() which itself
> is going to call imx_eth_enable_rx().
>
> By updating s->regs[ENET_RDAR] after calling qemu_flush_queued_packets()
> we end up updating the register with an outdated value which might
> lead to disabling the receive function in the i.MX FEC/ENET device.
>
> This patch change the place where the register update is done so that the
> register value stays up to date and the receive function can keep
> running.
>
> Reported-by: Fyleo <fyleo45@gmail.com>
> Tested-by: Fyleo  <fyleo45@gmail.com>
> Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
> ---

Andrey, do you have an opinion on this patch, since you've been
looking at i.MX code recently?

> Change since v1:
> 1. Rebase the patch on the updated master branch
>
>  hw/net/imx_fec.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index 4fb48f62ba..9506f9b69f 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -595,19 +595,16 @@ static void imx_eth_do_tx(IMXFECState *s, uint32_t index)
>  static void imx_eth_enable_rx(IMXFECState *s, bool flush)
>  {
>      IMXFECBufDesc bd;
> -    bool rx_ring_full;
>
>      imx_fec_read_bd(&bd, s->rx_descriptor);
>
> -    rx_ring_full = !(bd.flags & ENET_BD_E);
> +    s->regs[ENET_RDAR] = (bd.flags & ENET_BD_E) ? ENET_RDAR_RDAR : 0;
>
> -    if (rx_ring_full) {
> +    if (!s->regs[ENET_RDAR]) {
>          FEC_PRINTF("RX buffer full\n");
>      } else if (flush) {
>          qemu_flush_queued_packets(qemu_get_queue(s->nic));
>      }
> -
> -    s->regs[ENET_RDAR] = rx_ring_full ? 0 : ENET_RDAR_RDAR;
>  }
>
>  static void imx_eth_reset(DeviceState *d)
> @@ -866,7 +863,6 @@ static void imx_eth_write(void *opaque, hwaddr offset, uint64_t value,
>      case ENET_RDAR:
>          if (s->regs[ENET_ECR] & ENET_ECR_ETHEREN) {
>              if (!s->regs[index]) {
> -                s->regs[index] = ENET_RDAR_RDAR;
>                  imx_eth_enable_rx(s, true);
>              }
>          } else {
> --
> 2.14.1

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
