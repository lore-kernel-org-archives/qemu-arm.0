Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2295329wrd;
        Fri, 7 Sep 2018 16:07:20 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdaVA8v14F3bJ9+GGNWm80RzN6BhFy9bC9AylpEFGzimCUZisMDVWi06Xqi/x5MK+L5Qnk7P
X-Received: by 2002:a0c:89c5:: with SMTP id 5-v6mr7687513qvs.46.1536361640625;
        Fri, 07 Sep 2018 16:07:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1536361640; cv=none;
        d=google.com; s=arc-20160816;
        b=WyVV2NqWurCd5ygrHsb2L7X1eX3Jci7hAusQOqx3+BfRsHfxAdQC99z0C1BTxA5ZzJ
         Of3/pNgT5GPUngqbORSPFofdP9zbQHi4K1LomoinXHVPN70RYtxAUAqUIXIANTyYkPnD
         +9k62CNtxNnrB2veSci3B03N3QEHaVZQw7mHHQaCRC7Vg/uUe3tALNn68JzZMM6SD8oa
         /oBzgdisL5CSQ+Nenv7LTVlHp/rgx4Swq3yNv4rIDOArpG242yqHBqF6xMGk6To/EG55
         akKl6n2fVQaThMzvtpVyS/r1T66Vf7eBqzI2r3btO0Yv/gBbCGz0dzUR8M63c5g7lPRW
         GSDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature;
        bh=vE8AKIonC4gBDyGoijkavCv775stGNUSKLWlzi+lKl0=;
        b=UYedEnLFXwapEPyqu5MTsAsSOY6dJus8Rsq6o98JpKh/D+/s5vDR9nc53sZ2LEoscz
         WV4BI6C7KhhUoE9IsrdEmIPnId5YN7KyADLke2QwqI8cuvdWKlXfdBYwbkIaem6veBVF
         rpWy7lxjAqHlaICYfK8cGGFrgM189vTGSTrvpF7Grx2zKEO5tNO2/G7aPc3XmkxDOq3k
         qXzbBij5qCVXHvzEXdYKuNY4N+nRPH9eoL6IpawYLTejLTKo/axhT2FYbR44Npi0+w8b
         sMDlFVB3iXy2wV05NSGjuo8NyRCqtdTty3MgHSahLFRI/lzDgHL6XCiWHUgThJWow3Xl
         UDqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iAwB9r0X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t3-v6si3259021qkf.202.2018.09.07.16.07.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Sep 2018 16:07:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iAwB9r0X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40616 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fyPqS-0000Yh-4v
	for alex.bennee@linaro.org; Fri, 07 Sep 2018 19:07:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50870)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fyPqG-0000YZ-BD
	for qemu-arm@nongnu.org; Fri, 07 Sep 2018 19:07:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fyPqC-0002Gs-BK
	for qemu-arm@nongnu.org; Fri, 07 Sep 2018 19:07:08 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:40426)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fyPqC-0002G0-2o; Fri, 07 Sep 2018 19:07:04 -0400
Received: by mail-wr1-x442.google.com with SMTP id n2-v6so16390188wrw.7;
	Fri, 07 Sep 2018 16:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=vE8AKIonC4gBDyGoijkavCv775stGNUSKLWlzi+lKl0=;
	b=iAwB9r0XGjUJ2gmwmZWmYrZXDmO3xJwDDyDE2T1doe5CGL8iN0x0Yck998ziQQE+xx
	umTlR+PU9eUs6Wtz4h1DTTia0d2CZMBv3DVDa8WeN4/8sEq6adTRGx4ogRfsFkAGUQ9L
	q7u79ixwtmUvj9xX7Fl7vErXCpVpL3SPyWw/o+l7w6baiEHljzAce5qxtb7RkzFAPUgG
	Wq1gpqXsWQG4V/szOc0SPKrV7teDqGDmg/aMz2mk06yl2MW5J6B92aDBYcbgQUCkPRXu
	LO79h73kGkWOUydWkFY/BtS25nQEOay52x4BGTDAiLunrpC5wIVBERGJu3kjxxfnkA+q
	FrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=vE8AKIonC4gBDyGoijkavCv775stGNUSKLWlzi+lKl0=;
	b=pUXbMljz1bI37UCZ5lhmu42O0YpTBEYYxDPfEWlCA83+EMfaqtBqlUH75AMfrCyC29
	YHkY/pmj9kroIfR9tVilTnVn+qvfwfrBvcX8rUXwuEG5UgKipSLVZW6wzcIIasKTqr3N
	4yAnDoNuDcrqjA1VT00RDz4jrR5WxlPBJG3Nrp2xz8HvktemZrP9tcB3ZpctNph60h1+
	LCUXqlQbmrkL5XMXltR1ripMU1iGcLkbNb4vzKguBKTi+z7lW4pZY9Dka2KbYthT2/gV
	90X7zCsOIekimUL2i9cBTQRw5UuNvrVdeaqCqzE22ELF/K6N4fvnJ1yAwfIfliGNUPni
	ekHA==
X-Gm-Message-State: APzg51D2+FdyECO9Vo16ixBa5r/bOa9M1PCbbN4A1n+LvJ3BGomLP42e
	HEgcY3MoTElHCQ3tI48x1oc=
X-Received: by 2002:adf:9306:: with SMTP id 6-v6mr8118920wro.211.1536361623076;
	Fri, 07 Sep 2018 16:07:03 -0700 (PDT)
Received: from [192.168.43.186] (dynggepcrak-122-5-66-105.inwitelecom.net.
	[105.66.5.122]) by smtp.gmail.com with ESMTPSA id
	z184-v6sm697073wmz.0.2018.09.07.16.06.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Sep 2018 16:07:02 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20180831103816.13479-1-clg@kaod.org>
	<20180831103816.13479-7-clg@kaod.org>
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
Message-ID: <c9bc4c3d-c7cc-389c-12e7-3255383543c1@amsat.org>
Date: Fri, 7 Sep 2018 20:06:46 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180831103816.13479-7-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 06/11] aspeed/smc: fix default
 read value
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
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /H58I6F5sY0L

Hi Cédric,

On 8/31/18 7:38 AM, Cédric Le Goater wrote:
> 0xFFFFFFFF should be returned for non implemented registers.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/ssi/aspeed_smc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 1270842dcf0c..6045ca11b969 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -665,12 +665,12 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr addr, unsigned int size)
>          addr == s->r_ce_ctrl ||
>          addr == R_INTR_CTRL ||
>          (addr >= R_SEG_ADDR0 && addr < R_SEG_ADDR0 + s->ctrl->max_slaves) ||
> -        (addr >= s->r_ctrl0 && addr < s->r_ctrl0 + s->num_cs)) {
> +        (addr >= s->r_ctrl0 && addr < s->r_ctrl0 + s->ctrl->max_slaves)) {

This change seems unrelated to this commit.

>          return s->regs[addr];
>      } else {
>          qemu_log_mask(LOG_UNIMP, "%s: not implemented: 0x%" HWADDR_PRIx "\n",
>                        __func__, addr);
> -        return 0;
> +        return -1;
>      }
>  }
>  
> 
