Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2055325wrd;
        Fri, 7 Sep 2018 11:28:32 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZ8c0y4W4EImXOLBydmaOF4lsYeh7R2K4vo9VEnWSieAVFI0+9NxIvNZ8/xTqy9R+bAj4oW
X-Received: by 2002:ac8:3479:: with SMTP id v54-v6mr7068234qtb.231.1536344912583;
        Fri, 07 Sep 2018 11:28:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1536344912; cv=none;
        d=google.com; s=arc-20160816;
        b=p+BIMbLfT0pdL/haDtfn2ngXbdcnmbGR1NWjALxu3r7Q+MYQYDw/e033Xmb5VpNpDS
         IGfzojXDN2HeGDMVsctZExMeS0fkyfpgtdYma/rmIWbxBIcvsRhgLoCF0mrG5rsD6bH4
         sI75Un5I8kqN5kaDjUZPeTbCJ2XIlVP+KUmaqY+/NgydtEpQOhy7T7zBcF1qGJ7D1RSI
         r0GAJx3viyT4SQ+PQSsudKRff1mU4OcwwfNDGhEEwDkmJLRlg89By7EgqTa/jHY5owEy
         pNF8BvyFtMu0QZi0Pn/vBDKhkne2nfIIFZWT+HDYRQlYRO7n2Z2Qafv/YvHFKavw2hmj
         S5Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature;
        bh=CYdWUiFds/bFlO0qr20vM8wHbEqZwyxm8sv1UUWATrk=;
        b=mjevMRy5IaliMYU+Vb1Yimyf4tTN7efALkVkr/dglP2LEomPJ5TjfWuIGSRnoS6GQ6
         EV32PTlDC6iLwaBbEr9ZPKQtaxdAkAh36jz0gZLtQKzzEdkkunScrhA7TY4sM+M9/hCh
         cWz0iKJ4b/v+c+CU5vS0qFxlnqNQ1wGuVTVKrNALUGGMAjAI3d14hAb2Z1AKR+w65e79
         JPPTs0QUzpj/3/UdbRH46t07LmSPi99BahOvw1B1imvlllYQ7mlRa7JATHy6cM2OnHAW
         Y8CzQr9vn/uklETRRBarxl2s8gOqsd2V8HxY14ijK9kNYSYnCXocYhl3XTAyC1KL9sAj
         U/aQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vKdfM5bo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i17-v6si6318513qvj.89.2018.09.07.11.28.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Sep 2018 11:28:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vKdfM5bo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39865 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fyLUe-0006Q7-3j
	for alex.bennee@linaro.org; Fri, 07 Sep 2018 14:28:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34023)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fyLUT-0006NC-4K
	for qemu-arm@nongnu.org; Fri, 07 Sep 2018 14:28:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fyLUP-0003P2-2C
	for qemu-arm@nongnu.org; Fri, 07 Sep 2018 14:28:21 -0400
Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229]:33711)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fyLUO-0003Kz-LN; Fri, 07 Sep 2018 14:28:16 -0400
Received: by mail-wm0-x229.google.com with SMTP id r1-v6so234021wmh.0;
	Fri, 07 Sep 2018 11:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=CYdWUiFds/bFlO0qr20vM8wHbEqZwyxm8sv1UUWATrk=;
	b=vKdfM5boOb6nFI9QfDJgmoMHLhsRA5ItKUMpAEicUQ5e3fFZP7U9A378oOfseXj0+L
	oqzviiP6O4a0Qkrmjk5yUkl0dxquA2HMhaNtUF6IYrBdvn0xQetVh89NNJ0SicWOfwOx
	dehNT3RpaBQ4zReHlWR1LKjAQ7KOdzP7X3erCkq0Ks6SU7ASV6KtaO8Ul+gsO4FQo1ep
	2hyhwOA+FkPR0bAq/md+LKuoztb91DM+RjVtxbtLNuOj+eTWgylASo+GmEJOS1FHpcYd
	5ZRRpGF9Hqp2t9RwEP0kN2KUlxfwJJw8j2c/mOtI6Cl9xBMiE0cHo+eUJigJvJhODdnX
	6cEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=CYdWUiFds/bFlO0qr20vM8wHbEqZwyxm8sv1UUWATrk=;
	b=kwp8NZK2RLRYb+o5Aza9D67HYfQ0eFqLWwvLIrEufXcG5KE4iYU/BmIwFCsA7lKWjS
	SdXWgT7Yxpo5WAnu1hzp1kFhgVH6qxVGmJWvxMDLUha033u2ZgLhnxGcMJUQBoJBQyQi
	Vn+B4v9Dnx0ZK19qLcvaP+QXNmcANCES00HWEAHHks2riKPYPeQZHlvfbhw/c8bLOytr
	uPq625qMXKrPOPwKhSr0yDTsPfSEMcF5+Hvjdfq/o7y/ztMgstAdPPIAozar2PN1qGFV
	vovvyN8J+6ZsoSeNYbqi/lAjMftMl+fvLxhceG8d9o0SoRRYdk45zwPcWqLHoZAV5HT8
	zaHw==
X-Gm-Message-State: APzg51CWJe+xdgZ2DOG/gh8wvC5+UrCOfPwXKVrp0Y4HqZzaJ4tdC0SQ
	JBCzfghNHa41WBGvJoi+2Go=
X-Received: by 2002:a1c:c345:: with SMTP id
	t66-v6mr6508914wmf.100.1536344894212; 
	Fri, 07 Sep 2018 11:28:14 -0700 (PDT)
Received: from [192.168.1.26] ([160.176.58.255])
	by smtp.gmail.com with ESMTPSA id
	q3-v6sm11305472wma.45.2018.09.07.11.28.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Sep 2018 11:28:13 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20180831103816.13479-1-clg@kaod.org>
	<20180831103816.13479-6-clg@kaod.org>
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
Message-ID: <dd089705-b87f-625d-a5f3-e2aff3daf9f3@amsat.org>
Date: Fri, 7 Sep 2018 15:28:10 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180831103816.13479-6-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::229
Subject: Re: [Qemu-arm] [PATCH 05/11] aspeed/smc: fix some alignment issues
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
X-TUID: 6GQ1vKAfUBjv

On 8/31/18 7:38 AM, Cédric Le Goater wrote:
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/ssi/aspeed_smc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index b29bfd3124a9..1270842dcf0c 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -388,8 +388,8 @@ static uint64_t aspeed_smc_flash_default_read(void *opaque, hwaddr addr,
>  static void aspeed_smc_flash_default_write(void *opaque, hwaddr addr,
>                                             uint64_t data, unsigned size)
>  {
> -   qemu_log_mask(LOG_GUEST_ERROR, "%s: To 0x%" HWADDR_PRIx " of size %u: 0x%"
> -                 PRIx64 "\n", __func__, addr, size, data);
> +    qemu_log_mask(LOG_GUEST_ERROR, "%s: To 0x%" HWADDR_PRIx " of size %u: 0x%"
> +                  PRIx64 "\n", __func__, addr, size, data);
>  }
>  
>  static const MemoryRegionOps aspeed_smc_flash_default_ops = {
> @@ -529,7 +529,7 @@ static void aspeed_smc_flash_setup(AspeedSMCFlash *fl, uint32_t addr)
>       */
>      if (aspeed_smc_flash_mode(fl) == CTRL_FREADMODE) {
>          for (i = 0; i < aspeed_smc_flash_dummies(fl); i++) {
> -                ssi_transfer(fl->controller->spi, 0xFF);
> +            ssi_transfer(fl->controller->spi, 0xFF);
>          }
>      }
>  }
> @@ -567,7 +567,7 @@ static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsigned size)
>  }
>  
>  static void aspeed_smc_flash_write(void *opaque, hwaddr addr, uint64_t data,
> -                           unsigned size)
> +                                   unsigned size)
>  {
>      AspeedSMCFlash *fl = opaque;
>      AspeedSMCState *s = fl->controller;
> 
