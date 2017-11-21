Received: by 10.223.159.82 with SMTP id f18csp966722wrg;
        Tue, 21 Nov 2017 09:46:31 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbc0oE0nv1jYMsUMiJfUDqk0p2TiRlGhNQ9M1F3+XB8nLnz/TkGaO6akgqxmrydn7TqrvJ+
X-Received: by 10.129.117.11 with SMTP id q11mr11462931ywc.146.1511286391493;
        Tue, 21 Nov 2017 09:46:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511286391; cv=none;
        d=google.com; s=arc-20160816;
        b=tfcLaC2zWLcj3aMwjnjt07k7AUdpLH0M9MBAxzXFGr0nkjjhLxOC96FesAeiV9fQ2z
         m4L9Ta7LQZ95Hsrb3RMsd8b3LL4ARiNWw9qKWZoJ7xvBesTADrMvYg9yJSPHrjiIAOWQ
         HlnAr/cMuh9Pz+hDCNcflYhV8zgHE4BTO+pFIOf08UeflbdEr0RNqTYIYn2/ekXIePD0
         gqt1BzKAimXf0yYeHCL5JDdLwynH9cnb9cY5cOcvJ7LBAKmwtDiwePvw6fQn42u2Rhtj
         NZW/SJ/2Tg22LdbAsyy636RPm6vCZ132FV8jlATLU7cLpCfc5AMoo/X6d6zCng7+V7kz
         pwew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=6yc0AidWU4vQ1bBv/9RR0wHIgLXLWcq8hPx+sQh3i/k=;
        b=an7mMf16tIXHp4n9MC18KX5BDEzXAQ/x8e0Fjk19ck/p1Rp5cF/Yr6+i6jgwO9u96H
         5j+6Qkgtxmzt0WDgzEczJjCdma0kQMD+dTkFKUf6sOVetw8c4sLAfLqzE+Az46E88lQo
         U+OCrMn1/lHqYJX1M4af477KmCXGmTLJdTDMpWnt4S0erP0MAh7erLv48Ch7sjqYxSJb
         84i/3vqjUdncbrJmrMFA0cutIDbhrn3+/CAR5gZ0H4POSgu5Zj8UhnOAvWgKbzCttgoW
         lUapqKT+BTw5byc8Robt46eK91soLhqOUTYvfX9EegDM9tkol0inx/Ds2fLnF0OLoy2c
         OmeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z9joCvsi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h21si2972434ywc.684.2017.11.21.09.46.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Nov 2017 09:46:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z9joCvsi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35762 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eHCcw-0005XZ-Uv
	for alex.bennee@linaro.org; Tue, 21 Nov 2017 12:46:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHCbe-0004ka-P7
	for qemu-devel@nongnu.org; Tue, 21 Nov 2017 12:45:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHCba-0006I9-TN
	for qemu-devel@nongnu.org; Tue, 21 Nov 2017 12:45:10 -0500
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:37080)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eHCba-0006Hv-Os
	for qemu-devel@nongnu.org; Tue, 21 Nov 2017 12:45:06 -0500
Received: by mail-oi0-x242.google.com with SMTP id d93so1392572oic.4
	for <qemu-devel@nongnu.org>; Tue, 21 Nov 2017 09:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=6yc0AidWU4vQ1bBv/9RR0wHIgLXLWcq8hPx+sQh3i/k=;
	b=Z9joCvsiJI7KU+h04pS27IXGSiQEdi8ANMtHIry+IifWyaYyfPH2CXBYpCSRoWkn7t
	lj1KuVoqzv3/26CyiZjmCPQ6BOspfCJEXYFY8c29VdPgs7+a9wlogrcggfcJqVdvtof6
	C+2hjjwcpfc2uPSYKLFRj2LAgaI0L0O6SvOTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=6yc0AidWU4vQ1bBv/9RR0wHIgLXLWcq8hPx+sQh3i/k=;
	b=me78N2mlOxQeav+3XqMOOM0P9qg7wh77fuWIQIajPcpim9B7nLZjy5jYqNYpoUuqiU
	WssU0/SHbJjgY1IWiilWkWtdLm0PzZKS5cXM++UX46O9RGFhE7kidQTmNrnM4w5FdmgM
	993r2SAW8Nvuj7jWHPAbtebcWa1Z2It/rVMHXM1bT3ic9o+/fltxkIJQW/Ypz8vgwEVK
	KOJFZks6KWHM7yk/8Ly2krd8CjVA2rg9Ah7gJc3x/YmLwc5kuAj+1v+2b1QSnCsmUPbn
	swV+DXFHyffcknaoqskYhndAut+c3jxA2EJ15JX3hn9yKlzDoKAnamqTokYSytJ3ugJk
	Uzxg==
X-Gm-Message-State: AJaThX7gisu8lU/tORYkwO2QS8ZXu01ydUpHqNEpzjhXiRCIQxrP/Mgy
	ehQJpKfFry/iwtLsorC6VUmQI+FaDMzDNKM1JYx6Cg==
X-Received: by 10.202.108.66 with SMTP id h63mr1750609oic.305.1511286306045;
	Tue, 21 Nov 2017 09:45:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Tue, 21 Nov 2017 09:44:45 -0800 (PST)
In-Reply-To: <20171106154813.19936-10-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
	<20171106154813.19936-10-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Nov 2017 17:44:45 +0000
Message-ID: <CAFEAcA-pwZBVgGHHFttjST=0VvCasEx-eZccBG=3VfLKzerxHQ@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-devel] [PATCH v3 09/30] imx_fec: Fix a typo in
 imx_enet_receive()
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V+Vvr7L9XFa4

On 6 November 2017 at 15:47, Andrey Smirnov <andrew.smirnov@gmail.com> wrot=
e:
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  hw/net/imx_fec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index eefb3b2c62..48d012cad6 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -1121,7 +1121,7 @@ static ssize_t imx_enet_receive(NetClientState *nc,=
 const uint8_t *buf,
>          size +=3D 2;
>      }
>
> -    /* Huge frames are truncted.  */
> +    /* Huge frames are truncated. */
>      if (size > s->regs[ENET_FTRL]) {
>          size =3D s->regs[ENET_FTRL];
>          flags |=3D ENET_BD_TR | ENET_BD_LG;
> --
> 2.13.6
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
