Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2411847wrt;
        Thu, 24 Jan 2019 13:30:17 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6Z/Qhy3PvWVaGOB5shwxeQI2qVfbtK9i1THavh5AdSzMGPCnAkT3pN7Xdgz9e2Jojn43DY
X-Received: by 2002:a5d:6549:: with SMTP id z9mr8530493wrv.116.1548365417404;
        Thu, 24 Jan 2019 13:30:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548365417; cv=none;
        d=google.com; s=arc-20160816;
        b=oGF+NE2+LOklyVlU6sBrhz09jFcaeOP1WN+ELAnqES3RwofHpYg4fxsRFcWNzTCTrB
         eKpdKJBr9nbRO966CC9n3MfiPolc322lc7KIWw09LxK1Vv+7LlA2OLl/rRcqhjjzUyDb
         sVD3IdugIPGROTQCBmwuvtwrFALVYqCtp6OVJplDXpPLV9+CJY2mp+/fkojIZsUjyH3W
         NwPTmpiP/Vi8hKgjVewmfKxb2HaeCt7pG+BICWVGDTWvMf5xq0sIK+gIG0soJ3/DwS+r
         R8H+/mgggn+/eC1GCAj91RmF0oHIJXiWc/sqPpe0vuILUQIng4T6otPv9oQDgnvmKT0+
         EF9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=xubx3qxGS3ZD0cCV+7QhE6zHjUBd2O44uVNg9IsaNro=;
        b=jTP5ZiPP2nDcfVRDNewdmoaylotKM7NHI3tVxwTFQ/cDuzlc0dtqaxcMgCExfTUTYH
         1JmYNVRiAuvyMLdktkf0rqATc6xrT7xaMIJnW3wvZAJifM8rpafMclTYOlmXK8ZqYKl1
         o/f9CkfXEx9/Fvvg8u34xfCKZnKeHFuA3zrgaiGFnsIXZUElA8uPtXikL2UgU5dQwxbA
         0sQr58FN4KWiPpnEKIqZWcO3BUjUq/FKmy6MKM4W23AMbOvlJG1ulHAoVEbTxI7BvVMZ
         u3D85qJ0i/ihEGYdP+TqPUrgyBqyxop7J6V31ubtmDuRzeLxvuDheix01ANNnrY1osHy
         /cXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=I5aaY93+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p2si42847784wrm.14.2019.01.24.13.30.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Jan 2019 13:30:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=I5aaY93+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:32857 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmmZk-0000ct-Es
	for alex.bennee@linaro.org; Thu, 24 Jan 2019 16:30:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39021)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gmmZY-0000bD-4k
	for qemu-arm@nongnu.org; Thu, 24 Jan 2019 16:30:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gmmZX-0001Aw-Da
	for qemu-arm@nongnu.org; Thu, 24 Jan 2019 16:30:04 -0500
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:40188)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gmmZV-00018l-FZ; Thu, 24 Jan 2019 16:30:01 -0500
Received: by mail-lj1-x243.google.com with SMTP id n18-v6so6577049lji.7;
	Thu, 24 Jan 2019 13:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=xubx3qxGS3ZD0cCV+7QhE6zHjUBd2O44uVNg9IsaNro=;
	b=I5aaY93+1nBs2Cn69T3t3quAmiyXUojPOVZt8JHbet4sN45/DqJ3rm1eXqPUodN9qY
	LaRA+KqGwDsLK5X5fyUi1+I84tCDDLlP0Q5uTt1/nLv4uh2oXQJI70+3VFi+AhjZr1Sk
	1zhEw+QkZcR6eDnAL30MALZDA0ylamaRIq0MYlkeFRVEP9aegDVYV0Vw7hGtYIejfVri
	1OnB00b9SFcXqmZ/4mqjt/prLhdDG2uoeaDC7heCkAHq5BStgU9cg1cBTMWL2QvhttDu
	Y7yznnJRtAzAAlZBIMSM32qCD+Dt1slT7+XH8Beb29M/lBXTX/600nQFpibPiGHlZrjI
	J9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=xubx3qxGS3ZD0cCV+7QhE6zHjUBd2O44uVNg9IsaNro=;
	b=d0rPQVKqyf2xYxDWfGjxSI5KUmdTK0tixWhtjVpep0SM8w/a3wj84GXGIkjtohrirE
	wdKDdzlH/Lq5M53hl3aUOOUHkO9FjZALxX75sy6WCmTif6zvBf9E86vOVDmLwIWSZvag
	vRDOuIGlDiBTfnYbnvIzULS7rUpkJ8bpwnPCUAodKZgv8GmKwuuBGLe1pccjTaE3Ze36
	8JE4hyrtPBBWyd/CyYxf6VYRBUnyUVPH+CAv3nDLkSjQhbz4iEbwTH8Dj+Zn7ZGnWvPJ
	aRiBb/ZKtEBE5aPzweKiJmf5gFNbGhda1W7lICFScoRuO0uU9E3RR1xxLoRLDja4TNYx
	m06g==
X-Gm-Message-State: AHQUAubUY6Fais86Zmb7zNoMjzndgAaB1fW+DlZZgsKlfdA79yntclPA
	klvq6mH3E0Mo+YFKjF1ihgjcc1jYpitscJi440A=
X-Received: by 2002:a2e:5747:: with SMTP id r7-v6mr964552ljd.141.1548365399933;
	Thu, 24 Jan 2019 13:29:59 -0800 (PST)
MIME-Version: 1.0
References: <20190124140519.13838-1-clg@kaod.org>
	<20190124140519.13838-4-clg@kaod.org>
In-Reply-To: <20190124140519.13838-4-clg@kaod.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 24 Jan 2019 13:29:31 -0800
Message-ID: <CAKmqyKN3xpBkB5C52RcQOvs-Ra8hmcUETP3FgGRyCntgtp_0Pg@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/4] aspeed/smc: Add dummy data
 register
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WzxJ/o7Uicye

On Thu, Jan 24, 2019 at 6:06 AM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The SMC controllers have a register containing the byte that will be
> used as dummy output. It can be modified by software.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/ssi/aspeed_smc.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 6045ca11b969..9f3b6f4b4501 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -98,8 +98,8 @@
>  /* Misc Control Register #1 */
>  #define R_MISC_CTRL1      (0x50 / 4)
>
> -/* Misc Control Register #2 */
> -#define R_MISC_CTRL2      (0x54 / 4)
> +/* SPI dummy cycle data */
> +#define R_DUMMY_DATA      (0x54 / 4)
>
>  /* DMA Control/Status Register */
>  #define R_DMA_CTRL        (0x80 / 4)
> @@ -529,7 +529,7 @@ static void aspeed_smc_flash_setup(AspeedSMCFlash *fl=
, uint32_t addr)
>       */
>      if (aspeed_smc_flash_mode(fl) =3D=3D CTRL_FREADMODE) {
>          for (i =3D 0; i < aspeed_smc_flash_dummies(fl); i++) {
> -            ssi_transfer(fl->controller->spi, 0xFF);
> +            ssi_transfer(fl->controller->spi, s->regs[R_DUMMY_DATA] & 0x=
ff);
>          }
>      }
>  }
> @@ -664,6 +664,7 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr =
addr, unsigned int size)
>          addr =3D=3D s->r_timings ||
>          addr =3D=3D s->r_ce_ctrl ||
>          addr =3D=3D R_INTR_CTRL ||
> +        addr =3D=3D R_DUMMY_DATA ||
>          (addr >=3D R_SEG_ADDR0 && addr < R_SEG_ADDR0 + s->ctrl->max_slav=
es) ||
>          (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + s->ctrl->max_slaves=
)) {
>          return s->regs[addr];
> @@ -697,6 +698,8 @@ static void aspeed_smc_write(void *opaque, hwaddr add=
r, uint64_t data,
>          if (value !=3D s->regs[R_SEG_ADDR0 + cs]) {
>              aspeed_smc_flash_set_segment(s, cs, value);
>          }
> +    } else if (addr =3D=3D R_DUMMY_DATA) {
> +        s->regs[addr] =3D value & 0xff;
>      } else {
>          qemu_log_mask(LOG_UNIMP, "%s: not implemented: 0x%" HWADDR_PRIx =
"\n",
>                        __func__, addr);
> --
> 2.20.1
>
>
