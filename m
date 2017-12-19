Received: by 10.223.159.74 with SMTP id f10csp3316317wrg;
        Mon, 18 Dec 2017 17:17:00 -0800 (PST)
X-Google-Smtp-Source: ACJfBoskbdSxKKXx2IZ0ckH9dlKqFRsrgnxgF7PMF78myOnQa0MiUMPy/gJLKL+fM4Ivc4ZVnYrO
X-Received: by 10.129.87.2 with SMTP id l2mr1341725ywb.228.1513646220163;
        Mon, 18 Dec 2017 17:17:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513646220; cv=none;
        d=google.com; s=arc-20160816;
        b=BSP4h+QjV9zhZBkyHdG5VrJI0+1BotLrZJv5etIPs3+xXAT8EzqH42WHBZ1evcOpss
         Vial5hpZUvlDcUJ3ToTWxFKCLrATmumqA3wK/JMxvMV67Zqq5II+2pEwCRS3KkGzTXkf
         PNU9rpvBYEFVA2Pp1q2JoM4gcsPy2RGrTxKe3tEvYGL+Td0lCKZcQ9q3i0Avp+qb3Zkd
         95hLXQdvTAjL1jTQR0cfbyDefAcZjei7Rtxk5jGsvxvSsUr641sWssglAYXI56X6mbrW
         dyOxMv/KjMIzY5W/lTy6W0wMV3LPA0xS+L4UpP2DmDh8PKwMmmNWvrRCLWS7Q8hDO0vo
         +7rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=zFA2zc6GEaO6WxKnN8gTNBFRnfQ5Shim7glvw+c0+8o=;
        b=mUpa2/wagH2AZ0LU3oww7+kSE+fxU+xl2zJMmkSeEjdnnyCyMBn6wWQMDuNxitSUtL
         ecFOQd0eMLa+SLMjGQKDszr/fu+SsSm0/D3r2OGeYKKirNDdbJJUpED10pVtB6Dx1Rwg
         kKAYx8Zb6eWjYu1XGE+VtCHbHtrl25raxDFmx3qq9Brck4jp7cSofM+eUw5kHOeF3Qz2
         YEDhjCEN4L1pRMntpienCG0TEZK8qqvh7NIy1KCtM1kA0iqNFEmIXtWHK9jheW8xZjBD
         NZAp+ln1oR9bzrbHCrog8Br8M4ojfQJGa7UlZ+h4B/b7YWOCtSah/fpRtrzEE0IYsUOY
         drPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oUaWCgyB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a7si2474263ybm.696.2017.12.18.17.17.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 17:17:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oUaWCgyB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33096 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eR6Wh-0007xB-KS
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 20:16:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50336)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eR6WY-0007vT-Iv
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 20:16:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eR6WX-0000Qn-Il
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 20:16:50 -0500
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:40189)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eR6WV-0000PL-7r; Mon, 18 Dec 2017 20:16:47 -0500
Received: by mail-wm0-x244.google.com with SMTP id f206so923428wmf.5;
	Mon, 18 Dec 2017 17:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=zFA2zc6GEaO6WxKnN8gTNBFRnfQ5Shim7glvw+c0+8o=;
	b=oUaWCgyBKkJUzYoFZrG0mpxV7I49einTAw7FuvbMcAR+lN4X7IabSMfcd3HNR+BtxR
	2XiM8pS5WwbDuYCkqizVrCYh4u8kp3XaMSIU/eNFn30azPog4glj0Wr+A15Q9BfIVJ4o
	lyaZyuv4UGug2vbtdbvkA3lwy8dST4+gII92o+sPbYRajSDMJ62ReEcoEhh0r+2V+gQ6
	E7kxs1cQeSnu8ibBBN3AsTrtCeXpzuakTNQZlhOiaNInsi9lMVCKEMMUNiiIH2XnsRXJ
	70zCC5hLcX8K36MSKVgS1T5A2xZgB4giEmVB8lsEcTsoJWa+Tdv7mCGmXSfwZTx7/Ei9
	x/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=zFA2zc6GEaO6WxKnN8gTNBFRnfQ5Shim7glvw+c0+8o=;
	b=ZsUMZCwf1KXPi8QzEPSeSV9o66YFISJ45bzZfPO2a5TZ2JUBOdQo8N4xQWT6KPqLk+
	VyFjtBNcg6WaZBFGf6uvN9GCOrapHFiZzW0MgMyoiog9LDlagYIMA4ggIx2/jQL5MUd7
	21JFZsI1kBPAXzuzVcAREQfo/9ADs5n4hlbsGszuXewSeX1enhuuAd9M1MgDkLdbhHl9
	sLRuetlYslKqjLZvl23vEnZcPUXjRJKSUXCo0bOXAwJNnHVlR0uDbHuvOsNOkraSBU4q
	CMQkgO8xuBnESgfdfzZ5Macqj96FCG7cZvecw1fBe1mb1uG0gfYe0F8rX+m0h9NH+X5y
	IiSA==
X-Gm-Message-State: AKGB3mLpV1bfqADrbefChisMwz7yxOthk6FP/YxUImGX6ln0e5k1WqeF
	1MsWxDbP8k79JTp96AX8C1wqrQr+gO/XKZjIYLw=
X-Received: by 10.28.227.136 with SMTP id a130mr1339639wmh.104.1513646206270; 
	Mon, 18 Dec 2017 17:16:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Mon, 18 Dec 2017 17:16:15 -0800 (PST)
In-Reply-To: <20171215031547.31006-3-f4bug@amsat.org>
References: <20171215031547.31006-1-f4bug@amsat.org>
	<20171215031547.31006-3-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 18 Dec 2017 17:16:15 -0800
X-Google-Sender-Auth: E6juNabpO4J0nchEP2yeafIvvf0
Message-ID: <CAKmqyKPF-t9F9dhu-uagHq68DSODgqHqEE6=fGbbqLWR9MRV5Q@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 02/20] sdhci: use deposit64()
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N3JHZQo0LYkh

On Thu, Dec 14, 2017 at 7:15 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> This makes the code slightly safer, also easier to review.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

I just looked at the surrounding code and realised what mask actually
is set to. Now I understand what you mean.

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair


> ---
>  hw/sd/sdhci.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index b7d2a20985..3c78033d49 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -1132,12 +1132,10 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t=
 val, unsigned size)
>          MASKED_WRITE(s->admaerr, mask, value);
>          break;
>      case SDHC_ADMASYSADDR:
> -        s->admasysaddr =3D (s->admasysaddr & (0xFFFFFFFF00000000ULL |
> -                (uint64_t)mask)) | (uint64_t)value;
> +        s->admasysaddr =3D deposit64(s->admasysaddr, 0, 32, value);
>          break;
>      case SDHC_ADMASYSADDR + 4:
> -        s->admasysaddr =3D (s->admasysaddr & (0x00000000FFFFFFFFULL |
> -                ((uint64_t)mask << 32))) | ((uint64_t)value << 32);
> +        s->admasysaddr =3D deposit64(s->admasysaddr, 32, 32, value);
>          break;
>      case SDHC_FEAER:
>          s->acmd12errsts |=3D value;
> --
> 2.15.1
>
>
