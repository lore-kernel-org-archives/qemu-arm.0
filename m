Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp504228wrd;
        Wed, 19 Sep 2018 03:40:22 -0700 (PDT)
X-Google-Smtp-Source: ANB0Vdb2bh7UMkodEzIhXahckHqT/39XQkcSLlkaaA0UVaMqUhI2+iIPKtsK5JAFn4K3RkmfwMG6
X-Received: by 2002:ad4:4251:: with SMTP id l17-v6mr23448060qvq.70.1537353622812;
        Wed, 19 Sep 2018 03:40:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537353622; cv=none;
        d=google.com; s=arc-20160816;
        b=pHsLF0KVWWlFtPX3o8ymHtHyH30Ok3HP4HbwKIje6v45tkfAULew0QpjBMEurFX8MS
         9nVUeBcRbnC+IRwY0rHcuZTgOnBvQSqwz/mOE5kvgNt4Hte1TFp6FOnh8apxfj9kS5S/
         zKYqEqR3+uCUgABWEy+QYB4sUJrVMus5WwKY4pbmN8dwDW2heRUt2RQ0x+iq60zog8Ik
         V6tFGBVVtqTTuKUe7OIclHtWclNhVKqA3FMcLpB3Rzd1qqcG/im2DHO3HkWCG1kAFrFc
         1OLU3yxaclt1gqRyqkszzx2HWjUhe7qRx4mskNcMqeUYcaql28auWp8zofQzefDM6vWa
         v1GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature;
        bh=A9uMWAYxH3dgUy63REj5XMjKqHueIU5FC2NAmnDSzUE=;
        b=JHbOQTdKVDhlTVqWe+LmlaCSUWDkoiAadL96zwkjbk4GVrHh88SsOIOdlnthB6D7dx
         tJWPUJKBaL//faeKSmUoC2POkUVTlnruFQj+2NZRFgkAD0J8RP1PhqopmRDyZxDE89vj
         7XUgPuedcW/Gnoi1tvcHwGJTnvVoih/QWojD3QqJIVXfHY1/ZrOrxpJd7uNRCZbonO3N
         FMAz8uNE0A+i9xRSbkg/WTJ8rudR8UkvLtocUwTLkwZkq6jULKGZIGp0fHKPXMHljZXM
         9jRgZyu7apQzfMqE8k4ZB8cRfKKfWXq4ZUMeZxJFyhZ6fcCkAF8Aia3iTc9UuOnDUSWE
         I2NQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ojIzKQS9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z74-v6si3429360qkg.148.2018.09.19.03.40.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 19 Sep 2018 03:40:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ojIzKQS9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44681 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g2ZuA-00029Z-BF
	for alex.bennee@linaro.org; Wed, 19 Sep 2018 06:40:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54598)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1g2Zu1-00028u-5K
	for qemu-arm@nongnu.org; Wed, 19 Sep 2018 06:40:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1g2Zty-0006Rv-E1
	for qemu-arm@nongnu.org; Wed, 19 Sep 2018 06:40:13 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:36034)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1g2Zty-0006PC-6S; Wed, 19 Sep 2018 06:40:10 -0400
Received: by mail-wm1-x342.google.com with SMTP id j192-v6so6361733wmj.1;
	Wed, 19 Sep 2018 03:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=A9uMWAYxH3dgUy63REj5XMjKqHueIU5FC2NAmnDSzUE=;
	b=ojIzKQS9LbVNiViFsJi84LtyGX9n7fyhBIK4AtU68SVYRK2NrMZ2gZ1SR7OIDb7uhh
	M+TzdzQchxxUDmPcfT5VcRJN9bEvl52x+3WHb6JGxAvTRj1z+wqN6NNLO37ZCiDWWYCd
	NMq1weLgFIxKJRSLiRrClifuoLp+eghSbkqSCZxq3/8nAPUihA8uICfGmPxN4P+ZxVem
	naVaTmQsRQUc+CMxGmil9aDpQ4y/U7EDobCeNDAHHxpRYtxPe0TfJLt8F8ou8WB94w5v
	bznWY+GhbJqBEQVIN1m8aFkIqyiOyA9JmlL98IsSA6tIH5eVf6Sd/Xb66gzfv+kWHiIa
	K3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=A9uMWAYxH3dgUy63REj5XMjKqHueIU5FC2NAmnDSzUE=;
	b=bPCOCh19vGv6+8YMYMjzKucFPQfWmN7cflcG8Ptf01lf/LH8E7LOTcMMhvtLYIBgYZ
	Og1I2eFDEUcayJq04VsCcYSprHxg0N4hbFKTboD7k9X0fOn5o3awa/K4P4ATTr1Onn75
	chqGORNT5j3ZSB+E24T9Z4GlGrhPoRw6MkjHvw+u3IaFQ9LWa5/NqUSQkn4Opna/TydT
	pMK58PVSeaVFMYmr05yoiU/9NScmASK5Th0ibNGBlDENSOAeZGUq4GBVz6vsiBr3e1gq
	7mVFmjEjwtbolhnOhZ1pr9p8Jh1KE0GnRazu/K5iex62Pip2KFFC8Jf6RSHQKIkeTGS8
	Vbsg==
X-Gm-Message-State: APzg51CG1TYjgYajI8HmkWy6nTvUnpxSBA/K82xyEF7EXa5qkcrIsV7B
	k/smAsFyg/q2wuGFDeYreYo=
X-Received: by 2002:a1c:8b13:: with SMTP id
	n19-v6mr20074942wmd.118.1537353609103; 
	Wed, 19 Sep 2018 03:40:09 -0700 (PDT)
Received: from [192.168.2.36] (106.red-88-7-90.staticip.rima-tde.net.
	[88.7.90.106]) by smtp.gmail.com with ESMTPSA id
	i125-v6sm6140716wmd.23.2018.09.19.03.40.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Sep 2018 03:40:08 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20180831103816.13479-1-clg@kaod.org>
	<20180831103816.13479-2-clg@kaod.org>
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
Message-ID: <199c0acb-2ee3-bd26-51f7-9b78b4712ebc@amsat.org>
Date: Wed, 19 Sep 2018 12:40:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180831103816.13479-2-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: Re: [Qemu-arm] [PATCH 01/11] aspeed/timer: fix compile breakage
 with clang 3.4.2
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
X-TUID: C3W59AW/pp3W

On 8/31/18 12:38 PM, Cédric Le Goater wrote:
> In file included from /home/thuth/devel/qemu/hw/timer/aspeed_timer.c:16:
> /home/thuth/devel/qemu/include/hw/misc/aspeed_scu.h:37:3: error:
> redefinition of typedef 'AspeedSCUState' is a C11 feature
>       [-Werror,-Wtypedef-redefinition]
> } AspeedSCUState;
>   ^
> /home/thuth/devel/qemu/include/hw/timer/aspeed_timer.h:27:31: note:
> previous definition is here
> typedef struct AspeedSCUState AspeedSCUState;
> 
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  include/hw/timer/aspeed_timer.h | 3 +--
>  hw/timer/aspeed_timer.c         | 1 -
>  2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/include/hw/timer/aspeed_timer.h b/include/hw/timer/aspeed_timer.h
> index 040a08873432..1fb949e16710 100644
> --- a/include/hw/timer/aspeed_timer.h
> +++ b/include/hw/timer/aspeed_timer.h
> @@ -23,8 +23,7 @@
>  #define ASPEED_TIMER_H
>  
>  #include "qemu/timer.h"
> -
> -typedef struct AspeedSCUState AspeedSCUState;
> +#include "hw/misc/aspeed_scu.h"
>  
>  #define ASPEED_TIMER(obj) \
>      OBJECT_CHECK(AspeedTimerCtrlState, (obj), TYPE_ASPEED_TIMER);
> diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
> index 5e3f51b66b43..54b400b94aa9 100644
> --- a/hw/timer/aspeed_timer.c
> +++ b/hw/timer/aspeed_timer.c
> @@ -13,7 +13,6 @@
>  #include "qapi/error.h"
>  #include "hw/sysbus.h"
>  #include "hw/timer/aspeed_timer.h"
> -#include "hw/misc/aspeed_scu.h"
>  #include "qemu-common.h"
>  #include "qemu/bitops.h"
>  #include "qemu/timer.h"
> 
