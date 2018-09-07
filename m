Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2292014wrd;
        Fri, 7 Sep 2018 16:03:24 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdY40E8Cs060CuOsos+v1h9ZsQLlk/fPDQ7bp1adz7gd7VTLkRdwOUne2FnnyagrpyMljboE
X-Received: by 2002:a0c:eb48:: with SMTP id c8-v6mr7452777qvq.16.1536361404371;
        Fri, 07 Sep 2018 16:03:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1536361404; cv=none;
        d=google.com; s=arc-20160816;
        b=jEDOC/kHf/g/Au9mklaYMQOkDtEA2bgqJEKFLw5T0MvdazXWIukgUqSbz3YnHl6d8H
         BZFaeIXirTVE1ntqEraTtjKRzKLjF92vqJRvXwe5oRna9HIMZxynZdIYl1/Mgh/FZt/e
         ecw2gyOPSca6jMyjdMhbPikVlz9/iR44G4POIQliv6tHgyaUE+ocuUEXWCyNZXVRHHDX
         szLaV1qyVZMsCtWTsPaGJEgAl486+vu6pWjBLZ31niUX5KGYnSibhOWRRYXMBgHsA/xr
         GuNvXMOlU7aR3XTSKM4cupObZPcSmt4B0Lq/xgf7GC3duFJH76Agj9CaplfRRmm/Oomz
         SmAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature;
        bh=sD1oiDRgZkcF/hl2W/Ph8IuZCxw/W1bzuFHc8ojvVt8=;
        b=PfOmGP1W7N9TSaVJpWsQB+wdkEyBIbKgqfdcXTvH4lD2FGPUuRmfn0KwaKsMSsoGm0
         lEUwJfOV+0qHt880UfjfjBekPJrOx/eakPQYws6yZ1cHshIq4yAPVF3aAjbB3hk8ZeUA
         4z6+5igNbvExBOqORNb0rCyRb5fC89ImjkAcFOP6zFj2C47BnUhF7Gn+qPNWGU63GWCX
         kT2iCjiRPQcbwQSUzODpZhYIGeJMyso0wD/mTNqds884uTyJIqd8nxvXHhrj79eyQrW+
         Z//NtNp1miQLvjCQg9VtgV4A8MIvUuBGIyGFmJHBDrb4ksaJ8NvSBTHLHMisBh1aLH0F
         gHwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=q5M0DHSj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g19-v6si47359qvm.195.2018.09.07.16.03.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Sep 2018 16:03:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=q5M0DHSj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40603 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fyPmd-000827-V5
	for alex.bennee@linaro.org; Fri, 07 Sep 2018 19:03:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49994)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fyPmT-000820-4C
	for qemu-arm@nongnu.org; Fri, 07 Sep 2018 19:03:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fyPmM-0002rp-0N
	for qemu-arm@nongnu.org; Fri, 07 Sep 2018 19:03:12 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:38925)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fyPmL-0002pt-JT; Fri, 07 Sep 2018 19:03:05 -0400
Received: by mail-wr1-x443.google.com with SMTP id s14-v6so7407999wrw.6;
	Fri, 07 Sep 2018 16:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=sD1oiDRgZkcF/hl2W/Ph8IuZCxw/W1bzuFHc8ojvVt8=;
	b=q5M0DHSj+rwE+wmngxqFszlz56B8OvQtdB1AWOGPqRoncP2mBgsA0f+GgEtnGyiTj+
	5wPK/RLDgaPqQhkFJTGs+bnkJ+TGNssWTOWaZF1dfIIx4eXmgMum8Ne9L+LvDrT5jVI0
	BJfEOu5o8Aru7S/xSVPiHtTOWAb02iUSRB0FlMFWqnnXnpNKYiBgVNyOzihpsdk8BK1Y
	2RvtBpZHdaUd84Gyr+lgA4ivAX9zutoCRsMxQxjpSTk3wQ2sEyCLwUNR6bA6ORX+lNqH
	HMIgDlz5N/nrE7lAGCW9CRGOmpvNydEecmkgULt7RMHYKj/U5LIYDaxd6PxlRUHwSJhK
	oMRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=sD1oiDRgZkcF/hl2W/Ph8IuZCxw/W1bzuFHc8ojvVt8=;
	b=dm8bUIgZN3E55wbYLVMpLWEpIOlrbfwF8oIZA5twPNzIy1AljthhjF6bN27iM3kOWl
	3pGj3GYaRa+0zrC2uy3kquSbCoBT0U3uVEqTjX/N32dw1QVGNLv7wkxVFEmaR9fMlKsV
	5crYvN25Y8FabKZ0twjWSjwmRqWJAB5/A29To9lndGemq0GVjrh9xo25YRiYgzhUh79u
	pp5KxZ2dkyizivr8RKa1tq3QlQhPo1E+u99fearSDNqvfDZz/p2HSBF/StHTbb0oqq6a
	A3A2r4v5UTzJaERzXO3sMbXX4rkLpJE9yD2ENkFsDFEOlWmkL9XawmvH/MsumSS+txlK
	Cz/w==
X-Gm-Message-State: APzg51AkVPvwQvXlFxDm1ii5/LNrGDvtkPebsyS35+tDI0Oy9EDJ21Pe
	DehJ0OO/xL+qkZkxn2iAUxc=
X-Received: by 2002:adf:9051:: with SMTP id
	h75-v6mr8248978wrh.65.1536361384024; 
	Fri, 07 Sep 2018 16:03:04 -0700 (PDT)
Received: from [192.168.43.186] (dynggepcrak-122-5-66-105.inwitelecom.net.
	[105.66.5.122]) by smtp.gmail.com with ESMTPSA id
	z101-v6sm11546306wrb.55.2018.09.07.16.02.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Sep 2018 16:03:02 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20180831103816.13479-1-clg@kaod.org>
	<20180831111555.15008-1-clg@kaod.org>
	<20180831111555.15008-2-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Autocrypt: addr=f4bug@amsat.org; prefer-encrypt=mutual; keydata=
	mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
	u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
	HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
	YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
	ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
	dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
	ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
	Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
	HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
	Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
	YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBAgA/AhsPBgsJ
	CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJbkphvBQkm
	loU1AAoJEOPjLCzercDeTLIP/3pzTBotxvkddIREaw2j/6RoxN1lj5hnCx/XHGF7QxAlO4uV
	7eB6hcZxAqlt4AyNX5jcsSxNMfVNGnZ+u4ni6VdRRLUOw/QPXKGV8siK2E1zOG1GwZSCJ5zb
	ol7gpXNnOG/+ZXDfvkfSNnpim0ahNIPX8WAaZ/qN7I1qsPGupK2JrlCot561TfIOT7KNZFAZ
	m66Hf8MeNr8HQtn+oDk6j7g6WuIYZiqvF1MladikIZXndDMCsopXsjOikMXtoVuC/df7BlwS
	UaM+DT47onbIfXOtsWQGd2dJhu07Kxphqlz1Uh3YA7IHsFzZkX+S9waPBEzC8YB39dkZKA2E
	XbObk/ZTtCBLb39KTN2L7bv3Agm6wYO/hw3DQJQV3/07vW1EJd4fglQB5IY2A3eQ/ZSuRVm1
	E1GyFszjLXKUQIKx1938zoLrUDDdWQH7bhhSvG7JWk1BKmJrIXDTDx1tvTOW2pYZuO1PNx+p
	EhJraVuu3jtSbEfH+uPeoWtJtqSRkz1fLqp+dbha24ldPeKw4ija/YTviOem5baUlf/iNgS+
	a0s0eoRiJFrGZFCKLGKgZYoJe1rccQR6JKKd8JpoaIQuzptcHZD4+qn8W8FUlkNWGfpTQrsN
	iPLZt2EFOFkbjoZ2EoEByCs9nZ8ro91+lq7QfH9RFcldKLZfPEWwHPrchQ42
Message-ID: <8f6e17c3-6c4d-fa44-234b-a385fe65830b@amsat.org>
Date: Fri, 7 Sep 2018 20:02:53 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180831111555.15008-2-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: Re: [Qemu-arm] [PATCH 11/11] aspeed/smc: Add dummy data register
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zSv6sY5q5rR7

On 8/31/18 8:15 AM, Cédric Le Goater wrote:
> The SMC controllers have a register containing the byte that will be
> used as dummy output. It can be modified by software.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/ssi/aspeed_smc.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index da2fedfcd3cd..f31bbc895caa 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -102,8 +102,8 @@
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
> @@ -548,7 +548,7 @@ static void aspeed_smc_flash_setup(AspeedSMCFlash *fl, uint32_t addr)
>       */
>      if (aspeed_smc_flash_mode(fl) == CTRL_FREADMODE) {
>          for (i = 0; i < aspeed_smc_flash_dummies(fl); i++) {
> -            ssi_transfer(fl->controller->spi, 0xFF);
> +            ssi_transfer(fl->controller->spi, s->regs[R_DUMMY_DATA] & 0xff);

The DUMMY_DATA register always contains a 8-bit value, so this AND
shouldn't be necessary. Regardless:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


>          }
>      }
>  }
> @@ -680,6 +680,7 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr addr, unsigned int size)
>          addr == s->r_timings ||
>          addr == s->r_ce_ctrl ||
>          addr == R_INTR_CTRL ||
> +        addr == R_DUMMY_DATA ||
>          (s->ctrl->has_dma && addr == R_DMA_CTRL) ||
>          (s->ctrl->has_dma && addr == R_DMA_FLASH_ADDR) ||
>          (s->ctrl->has_dma && addr == R_DMA_DRAM_ADDR) ||
> @@ -912,6 +913,8 @@ static void aspeed_smc_write(void *opaque, hwaddr addr, uint64_t data,
>          }
>      } else if (addr == R_INTR_CTRL) {
>          s->regs[addr] = value;
> +    } else if (addr == R_DUMMY_DATA) {
> +        s->regs[addr] = value & 0xff ;
>      } else if (s->ctrl->has_dma && addr == R_DMA_CTRL) {
>          aspeed_smc_dma_ctrl(s, value);
>      } else if (s->ctrl->has_dma && addr == R_DMA_DRAM_ADDR) {
> 
