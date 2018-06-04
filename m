Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp922614wrq;
        Mon, 4 Jun 2018 11:23:04 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKbwRAeisfdDWrOYrUOJ41EWqtCuQ70aRcV6PRpf1M0EIUO3VO6IIwZCb+XJKf6xOkaWbF5
X-Received: by 2002:a37:4643:: with SMTP id t64-v6mr19638764qka.260.1528136583991;
        Mon, 04 Jun 2018 11:23:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528136583; cv=none;
        d=google.com; s=arc-20160816;
        b=u47MZdNHsFzM/gCFVwCDX6Rq0i9Ih0Km9TfIRqT1oV/3M8HolpyTNHXeMLBwRjTVLL
         87vpEbnACs2Nt+QlHVc2hc04I2yMjmTkoYoZkr/ogEXU6VaGp1mr/lwpGQH7nlcFbKoB
         jzI1i2pHdJSHoSawzLpNeQbdxKQXia4WWIyWQIIRVlvfgOAKLBZ3a9RqWCimzpMKOmDx
         oZIlweuCLliQ7q5jLH86JZydBr6fn6/wV2IntkmJY3zB7KlxfF0nB9sJFPf/59yUDhX9
         owHvH1XmdsF5BjU95FCBaa42hdOKf4b3oyVLPYNF5xMfqcQFaWX7glO9wTlLhG6SpWrl
         y5oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=1579fv5ChAPK4aO2oyJgp920s0XWkjNCY1ywp1BM4Pw=;
        b=wISPKwxy7kvIpyglwbrWiaDHGxqq5mmyprcDD4pcgejnddQGWtuhOwrUDKbKR7mL7W
         2+5CGC+jP03XNOtuEgfCrG+iFsWKHVmfUFrAY/dDFL9uKwOVHfHWzuHASxII7mNeOLOS
         9GRG6WE5ZUzweu4GBXYgzZ8EXDiimnAb06VCg3lQfl/O7//4xOhidR3XwuhjjY2OvgJ4
         0h2dpkCovRWlo2hjjGTROpYaOMTVBgDvPMzRiGAnAH3MUT61XKL2PYBo1mm6oaaAv1bU
         h5SH4n4Ws/7J37LmNfJe2CfkHiz7NP0h7T9kNhRM6KnO+WcTbvKJY17c0mQ3kD3Le1JW
         Yc1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=i9OinfT6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w66-v6si6097520qkb.343.2018.06.04.11.23.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jun 2018 11:23:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=i9OinfT6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41396 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fPu8F-0006TR-FB
	for alex.bennee@linaro.org; Mon, 04 Jun 2018 14:23:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32898)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fPu7l-0006SA-Hd
	for qemu-devel@nongnu.org; Mon, 04 Jun 2018 14:22:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fPu7k-00081G-FE
	for qemu-devel@nongnu.org; Mon, 04 Jun 2018 14:22:33 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:34976)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1fPu7i-0007zR-6Q; Mon, 04 Jun 2018 14:22:30 -0400
Received: by mail-lf0-x243.google.com with SMTP id y72-v6so26707980lfd.2;
	Mon, 04 Jun 2018 11:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=1579fv5ChAPK4aO2oyJgp920s0XWkjNCY1ywp1BM4Pw=;
	b=i9OinfT6AFUJcX2cWF790G+98R9EPc8rtdeHowVXJDQNmFLxRoeiPN7hOS1/Ri9xkg
	sE1/TMYoFHFCKWm6KcxUsI5J6/xB3VFkIq5DFrHsI1y7Z7/mNXuRSdomZ4jhnfTiHl7Z
	OiC1G/YHuSUFstnXHVAdiQxp8nWqb+AMzicI0XXtogq3b6Rzs2TJ8ooiDRSnIDTCdIxW
	m2lTkLjXdBnI0EvMhIfvCJGlL0Km5obmjvAm9PhUSf9TwcDkCQ9W//LfgKPv8Gyfv3bH
	l65a15kQN75GW7fw+S+lJZI07gvkTYqXmi5XIE89U7TkJYI1gKjB1pljROino8gQqFz9
	X1hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=1579fv5ChAPK4aO2oyJgp920s0XWkjNCY1ywp1BM4Pw=;
	b=n2yTJbMDKZn6Sdob8M0i7YEHq5frpNL8bHdcVVSW8wJI0l8fu9yjUzm+mKIi07T5tA
	AdCoHPJzYbrmPhkjbs0io13NedyEveo2NzKILd7q9ufrnHswOBeirzKy0v11ufMDOj+j
	/GVA5Sg7zRKU0eAk4ZTU8MNZD/BLsTKhjuE5kXy/mTeIxgQCXawwQelx0zqWkNltYiyx
	8uXTz/B8AE5vateXkvY0oMHqJQrIlN/EZzk6MmcGnJwnvdhwZTijrNxTDlNbG1+Kj3BW
	kib0ZQ6IiyavS/XZa6LL7YhPoLWrCz6Yp6pet2zNoI+3P7HSXYIQgWLrXp+uI6HYpV+O
	1+Mg==
X-Gm-Message-State: ALKqPwdVKORDs/cH/ObJY18MCmy6gf6DaIhy4oWIY8EkZi7eghpQPakT
	llVrQhLUxVvNTlbXfvChdgQ7jCYlAPFr0Ven2lU=
X-Received: by 2002:a2e:63db:: with SMTP id
	s88-v6mr12893673lje.78.1528136549026; 
	Mon, 04 Jun 2018 11:22:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:98c6:0:0:0:0:0 with HTTP;
	Mon, 4 Jun 2018 11:21:58 -0700 (PDT)
In-Reply-To: <20180603000827.30872-4-f4bug@amsat.org>
References: <20180603000827.30872-1-f4bug@amsat.org>
	<20180603000827.30872-4-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 4 Jun 2018 11:21:58 -0700
Message-ID: <CAKmqyKPaUQH1pORVV5Lb_+iv6_GGu=4L-Z9Q2segEjHSrR_XLw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::243
Subject: Re: [Qemu-devel] [PATCH 3/8] sdcard: Add a 'spec_version' property
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wt3+lHyoWHz6

On Sat, Jun 2, 2018 at 5:08 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/sd/sd.h |  4 ++++
>  hw/sd/sd.c         | 11 +++++++++++
>  2 files changed, 15 insertions(+)
>
> diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
> index 9bdb3c9285..49f22b0b89 100644
> --- a/include/hw/sd/sd.h
> +++ b/include/hw/sd/sd.h
> @@ -54,6 +54,10 @@
>  #define APP_CMD                        (1 << 5)
>  #define AKE_SEQ_ERROR          (1 << 3)
>
> +enum SDPhySpecificationVersion {
> +    SD_PHY_SPECv1_10_VERS     =3D 1,
> +};
> +
>  typedef enum {
>      SD_VOLTAGE_0_4V     =3D 400,  /* currently not supported */
>      SD_VOLTAGE_1_8V     =3D 1800,
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 80e70dd93e..5ddd211114 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -91,6 +91,7 @@ struct SDState {
>      uint8_t sd_status[64];
>
>      /* Configurable properties */
> +    uint8_t spec_version;
>      BlockBackend *blk;
>      bool spi;
>
> @@ -2058,6 +2059,14 @@ static void sd_realize(DeviceState *dev, Error **e=
rrp)
>
>      sd->proto_name =3D sd->spi ? "SPI" : "SD";
>
> +    switch (sd->spec_version) {
> +    case SD_PHY_SPECv1_10_VERS:
> +        break;
> +    default:
> +        error_setg(errp, "Invalid SD card Spec version: %u", sd->spec_ve=
rsion);
> +        return;
> +    }
> +
>      if (sd->blk && blk_is_read_only(sd->blk)) {
>          error_setg(errp, "Cannot use read-only drive as SD card");
>          return;
> @@ -2074,6 +2083,8 @@ static void sd_realize(DeviceState *dev, Error **er=
rp)
>  }
>
>  static Property sd_properties[] =3D {
> +    DEFINE_PROP_UINT8("spec_version", SDState,
> +                      spec_version, SD_PHY_SPECv1_10_VERS),
>      DEFINE_PROP_DRIVE("drive", SDState, blk),
>      /* We do not model the chip select pin, so allow the board to select
>       * whether card should be in SSI or MMC/SD mode.  It is also up to t=
he
> --
> 2.17.1
>
>
