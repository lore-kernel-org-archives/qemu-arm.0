Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3431132wrh;
        Mon, 29 Apr 2019 05:07:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwr3mgkHicfamuYiKkyozGKmjMRiLStoW0IY16nuhDesSiUf0jNQ+JMUu/CvqBwLQvMaUse
X-Received: by 2002:adf:f34f:: with SMTP id e15mr3585981wrp.254.1556539650006;
        Mon, 29 Apr 2019 05:07:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556539650; cv=none;
        d=google.com; s=arc-20160816;
        b=F5spxUJAuiO1cgeGklUgpvLuXVxZZO53dy8lfw6ZEjJ/AAPKWEYbPE82sstiWvYuiy
         Bf3GrX2u1uKZlNp2+DLnqlahyKXsjxJwbIMfIuK0wcpOo2vYKu2Rp+YtGcKyPP3ITtN6
         zdWQ/2FV5KfiaMPczj0xIJ/P0BX8gtrCaobjUNtLQb5C27jfauCiNoLZuMUmJwNmkEi3
         dBvrGZPOb5DyYMHkBQYkZ9Jz0ol6jWhVji4HqCjiNk1AOV9tIROqVIKVRpG1u0u57pQE
         KVH3twNM4ww1tygcM9d4n2YdoGnFFqhICBNyM2o8NyNva3pOVNQaOym6wHw4b/Y1qvO5
         trHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=ECDxqSbFCFY9J+bizJ75Z9ywtSsPY7m+UprrYkgIs0w=;
        b=a7nSz3Z/gps9C2OkDPUDdG8p19Ht0wajsnUa30Ir8DXm1Q6XsKul9txnkr9ckYLUTk
         dqog2FB2QHcJJucPjJbe+YkhVqA20689IzpImv357Vw5Jacjs7GUw6t0GfNcALHdV9ll
         6v2+zIMYvtNeOmj2rFK30XG9SnyoDKFfWNvuHwK7+s/OL2ArTIkVL0ZW8B7vF6EFbaW5
         PeNLR/TUNiMlXGN+4JJOw3WgwYXq0CbRu1vKVcqdciaUDDdDiiZ9R9jaECNnso9u8Iy3
         js5TAoor0LG2EbhIwgeUDT5NvL0qVtaQAsDSTAkH791hXFJL6FhmxaUz/X5UbAFlEUts
         WeMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZbsYgRI7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w26si22052613wmc.20.2019.04.29.05.07.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Apr 2019 05:07:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZbsYgRI7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:56755 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hL54D-0002Ee-2V
	for alex.bennee@linaro.org; Mon, 29 Apr 2019 08:07:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40549)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL540-0002ER-Tw
	for qemu-arm@nongnu.org; Mon, 29 Apr 2019 08:07:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL540-0008Ap-4d
	for qemu-arm@nongnu.org; Mon, 29 Apr 2019 08:07:16 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:42673)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hL53z-0008AO-VL
	for qemu-arm@nongnu.org; Mon, 29 Apr 2019 08:07:16 -0400
Received: by mail-oi1-x241.google.com with SMTP id k9so5026234oig.9
	for <qemu-arm@nongnu.org>; Mon, 29 Apr 2019 05:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ECDxqSbFCFY9J+bizJ75Z9ywtSsPY7m+UprrYkgIs0w=;
	b=ZbsYgRI7AIOKhScMBMnK0jP8sDlyfZDtRmlyRb45xRJ4WDJpZn8qH5eR0/wJkZmLQi
	y6b6ZxsptfzychtP1ySp9S9IhKO5G4FcpTyrFl4l5lwQIxk4YKk+izYbtx7XwjTd7VHZ
	aohg3NDBN43HuDhjMrn97gY8D/G8AXpkskFqlVGIXuDhA+YfU3VRSDY5DVOsSuKxoBxf
	cHU6xDLlDEYtS4jWicv0XB5d3osCBDd+wYq8Nyvz97yEkCAcpkaPhsFVA2Mc4AJ6BnxD
	Wawdz/bAZV/5aT7ZRNhH4W1WdPDiEcROfxSgVQEwDpp21rGhSJ9wgZJJviSl8z0BXwcv
	gGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ECDxqSbFCFY9J+bizJ75Z9ywtSsPY7m+UprrYkgIs0w=;
	b=NdJWAe0+iZ/0QNY8R6Q3bQKPCQwvjekYOGeSHtdNicas736XjzlWzz5szZTUNh4Iem
	oixT9S1tuSiwinCiYQafch3iAsiWrm8twpt4OWfXUlEh7ZLvO41WUY4v4VmhuusHArOv
	KwzcL/QGkdzIIpZL6/97gmzjaQ6ouI4yg7Wq/rz+GHFjn8Rq2d9ADtyJpf7pMdvR4DDq
	1LxZuwhP0bH0i9uE8PhwsjiR/+eHgSg7KLl/f/mNwGVr67i+utUz2tO3B32yaRHuc/lZ
	BRKuZLr3GF4DZ/dKeEnX6qSRsGHEiKz8Zn3fgqapy7UvWowv8pFdEQhUNYrGkAe5gVZz
	xNqw==
X-Gm-Message-State: APjAAAU219TMSoydoyPAXANRqELw+qc6nXV7QQhM0VvN+WyOgTTcTnTU
	jj9a+8nIDME4k3jqzCa8ZiXoBFFLSKT4gMF1DQPa8w==
X-Received: by 2002:aca:b3c2:: with SMTP id c185mr16485722oif.98.1556539634668;
	Mon, 29 Apr 2019 05:07:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190411161013.4514-1-clg@kaod.org>
In-Reply-To: <20190411161013.4514-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Apr 2019 13:07:03 +0100
Message-ID: <CAFEAcA-WeTRp0zs5Zu_g3uCjzXaqSf5-G3nyrxMn_n+fQAN08A@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [PATCH 0/3] aspeed: cleanups and extenstions
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +P1klXwssDds

On Thu, 11 Apr 2019 at 17:10, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Hello,
>
> Here is a series adding a couple of cleanups to the Aspeed SoCs to
> prepare ground for extensions and new SoCs.
>
> Thanks,
>
> C.
>
> C=C3=A9dric Le Goater (3):
>   aspeed: add a per SoC mapping for the interrupt space
>   aspeed: add a per SoC mapping for the memory space
>   aspeed: use sysbus_init_child_obj() to initialize children
>



Applied to target-arm.next, thanks.

-- PMM
