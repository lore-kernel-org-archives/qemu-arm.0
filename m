Received: by 10.28.71.27 with SMTP id u27csp9245wma;
        Tue, 23 Jan 2018 14:47:14 -0800 (PST)
X-Google-Smtp-Source: AH8x226t469xZGt8ObJzKdBqZhHdxGhcHGBmPetUZTAOlBNsuZGsoQQTBLM/uWu+0WH8Io7769Kw
X-Received: by 10.13.223.12 with SMTP id i12mr3935813ywe.385.1516747633977;
        Tue, 23 Jan 2018 14:47:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516747633; cv=none;
        d=google.com; s=arc-20160816;
        b=0dJey2jhpSxB1ntAx4X26FkyIqj+ba2QYCpijPddnULphpaZi/dh54vWritMqjcEFe
         O9v3u+QTbuMuG3vcr8TJO5B050zLgaUV2MfJjDLUIOSvcVcLf5pSQL6fRgG7DFjaJ/rZ
         95nEienjk93j23Ytmt2UuSJvPspMupeLYkh8+ETTnnG7MBNBdXftvAqs2//iAm2kjopu
         reMw4U+SCFw068FG+9VGFgsy9EipTU4a3lVTp6le+/D0ZdmcuCNlhXA3lBX6VkCbPfRf
         pbKdN8qPYmCQEY9NtphEk+N5DkrMRmV9z0fjieyqnAuC23sKV6tE4fNZWhuugpeJx9Nq
         5mlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=ePnqqx0bAA1mfOu9H4xevraMp/eX8AVdyEJ/2q/fYyg=;
        b=e5YBB6UwbD3xQazstSnr4DHHzomHxjZxwmzRFDEJmZdNVLBwt91jnGuqR8PEZ8OdN0
         9cF3ijycTkKXvb7KtbhX3U0hk1mfRgikZR3nBa0KF+Wcb14+7eUeAVICO6IEQw2b2mQt
         uoSPLpQSTxzGmwQVA1seu1BCKIY4HF/gI020vE7e3Wl6cllazwkGVCa2aWvrfS7pjS6t
         /S1tsWMmu5XhI7A31XZ0pIjvIIT7nPN0LuaoZ9zzx5iQqh795KE+UCtXdIIw3/7Tx1kr
         3EclqPnOiW0aBcgVl0PnZ4I0ajcS+LhMuF5KFYXWN/68P0vZ2wWCOaIl5dTChq7AM0l1
         FweQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=edNtAsBX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q36si2280943ywa.318.2018.01.23.14.47.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 14:47:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=edNtAsBX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58676 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ee7LV-0004OE-Dg
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 17:47:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40237)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ee7Kl-0004JC-MN
	for qemu-devel@nongnu.org; Tue, 23 Jan 2018 17:46:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ee7Kj-0003Y0-U1
	for qemu-devel@nongnu.org; Tue, 23 Jan 2018 17:46:27 -0500
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:38264)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ee7Kj-0003WT-KZ; Tue, 23 Jan 2018 17:46:25 -0500
Received: by mail-lf0-x244.google.com with SMTP id g72so2685412lfg.5;
	Tue, 23 Jan 2018 14:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=ePnqqx0bAA1mfOu9H4xevraMp/eX8AVdyEJ/2q/fYyg=;
	b=edNtAsBXR8Mf4I215lMa5Q8CEVwFmJwzEVWdMNG7V7vHtVqDC0YwbnJDOPKtm7ooaS
	DhbTCSQz9C4Dhy4Gs4v3M71dyPjnXll/VAVyeumgQXG88ei4+whbGKnVdVILrywh+1ps
	vuMeuT/S5kPtspbH3I40tNqWWtV7ll4umLM+FfH/1mJc2a3hDX5UWvHxvm3zJFHRlNbL
	JAK7mxBzpzmwaXLpWKRqXGuNjYcU9AzMjMGRiOLsnVAv95e+JIdrKCZ/PcYyOjwnTKiI
	HJkKVtZV56oZg8noimi+Jy/zLAe01M4OIokS3dxZbINermkO5MRcjsOPrKCtegcYwxPq
	GA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=ePnqqx0bAA1mfOu9H4xevraMp/eX8AVdyEJ/2q/fYyg=;
	b=IKfIbTR9PhiaZWsQMszw1YQHs2UOFgHvFmb0vZlVc1M030lt19yydqXH5793g8xh3W
	v0c+/QwQfl9KB33otGj2EFHAXr5YN9mzbj+H9N6bfJVCK6/bIyywY66lz5H01HZnzFgP
	cJkkCD+eHRvRCeoNu8XU/cWYp9bN9Du3e0zcO4Tj3wlFHUZeW24Yt87B5Zg611d0ywR7
	GFoD8kLkZRFj7xpyaJZuqT6VVwxe4f3PQdvypn7tEWRZb5vT5bT23gKVXA0+f2OLveMa
	oB3WK391plGRBvm5nshf23HLgWrD5cXema+AmvJAcihqrC2HLmevJj2+EjncLhPMoYmg
	RmqA==
X-Gm-Message-State: AKwxytcOQmMobCaUeHXmWFpPZSMa0asFO0wJ03su7BKg23IZP0ruKSKg
	mld/zuKpWGWuQVS//Xgtlvg3jwj0nY6iopJ7864=
X-Received: by 10.46.54.19 with SMTP id d19mr2000715lja.72.1516747584346; Tue,
	23 Jan 2018 14:46:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.45.10 with HTTP; Tue, 23 Jan 2018 14:45:53 -0800 (PST)
In-Reply-To: <20180123030630.26613-9-f4bug@amsat.org>
References: <20180123030630.26613-1-f4bug@amsat.org>
	<20180123030630.26613-9-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 23 Jan 2018 14:45:53 -0800
X-Google-Sender-Auth: FAHMbn_jyxBKgdxHUnKNOsXpbhE
Message-ID: <CAKmqyKMBYoNqUVALJzpg8b=LtXr7wrOkMLiMeqhoe8rrMq0sNw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::244
Subject: Re: [Qemu-devel] [PATCH v8 08/14] hw/arm/bcm2835_peripherals:
 change maximum block size to 1kB
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Sai Pavan Boddu <saipava@xilinx.com>, "open list:ARM" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NuEclbtCRioB

On Mon, Jan 22, 2018 at 7:06 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> following the datasheet.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Acked-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  hw/arm/bcm2835_peripherals.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
> index 0570cc4ad3..6b86a99b14 100644
> --- a/hw/arm/bcm2835_peripherals.c
> +++ b/hw/arm/bcm2835_peripherals.c
> @@ -19,7 +19,7 @@
>  #define BCM2835_VC_PERI_BASE 0x7e000000
>
>  /* Capabilities for SD controller: no DMA, high-speed, default clocks et=
c. */
> -#define BCM2835_SDHC_CAPAREG 0x52034b4
> +#define BCM2835_SDHC_CAPAREG 0x52134b4
>
>  static void bcm2835_peripherals_init(Object *obj)
>  {
> --
> 2.15.1
>
>
