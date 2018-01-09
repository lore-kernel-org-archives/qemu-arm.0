Received: by 10.28.173.206 with SMTP id w197csp4246757wme;
        Tue, 9 Jan 2018 15:19:01 -0800 (PST)
X-Google-Smtp-Source: ACJfBossfHWMnknOmD+pnXsOGQy5wUq6zMXj8wlcqYJBqlqnrwbagaoLWOHEBEOWpcqAGR7EALri
X-Received: by 10.129.70.130 with SMTP id t124mr15017119ywa.366.1515539941580;
        Tue, 09 Jan 2018 15:19:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515539941; cv=none;
        d=google.com; s=arc-20160816;
        b=hIJZM20QQ0mdIwVI+GBwV4TTPr38+c4PTWLth2S1xsZCcvpPnEVvul0Ixh124h3/zp
         duC593Eykly+xScre1fWSrCO/lebpUsV9zGQ2W52/0eAQ1aebk+YDYDtnJFPqGsEeTmh
         aIP+MaU7Ne9dY4tAyqMYzXw5QhVKwEZJWoPw5YhHzMfGJ95nBAApw8a8tYTi7U9CRTKs
         LnzHhiD6o/sC0F87RDCXTzhM7Duzb21eJ71qtNVnk5djkvZTUHArbnSnLtrQZw62Rv/o
         JUvGq65zG98XBZsq41nafihem+jiP8nl2ZU6+Q29o59umtjGBXXqvZvVb/u901y1wGjY
         ChXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=S6pv9o2quMyZJIEj8ihQZKYPdr56FYMIw9+CmrGZbBI=;
        b=BQnNAcDbSLXg3Kv3131/FpitmVKcK7790hAeBDd2p1SD3IImy+s80aycFt20H+0p/4
         tGvexxQC/LKCEYbqamHobJ96/W9FWzfj86qP4XNy151wFHIWHAvFqpA70bl40H0K2qt/
         6nTWfaHJp12QFNoGcHmgs0rug46B4Y5cEl+0CQRJK3GNaYCbET8cU39QL8Q3lAwN5cFF
         Bw7gurgnSORlAicnU43fl7eBtotJJqFZ2E8e/oI4YVvHNUURvNbPD7XwsMdj9sXwrvVP
         1Eeks4nib7j+5ShOQQtmCLZCFW/loUo7Uw2FSlv/rOVtEqFwv4gb9oZevA7vSSjuuirE
         /PVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TSCEfoNS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d11si3158062ywh.235.2018.01.09.15.19.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Jan 2018 15:19:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TSCEfoNS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55145 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZ3Ab-0008OL-2e
	for alex.bennee@linaro.org; Tue, 09 Jan 2018 18:19:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41512)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eZ3AR-0008Mr-NO
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 18:18:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eZ3AQ-0001IN-Q9
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 18:18:51 -0500
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:34872)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eZ3AO-0001GU-L1; Tue, 09 Jan 2018 18:18:48 -0500
Received: by mail-wr0-x242.google.com with SMTP id n9so5879177wrg.2;
	Tue, 09 Jan 2018 15:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=S6pv9o2quMyZJIEj8ihQZKYPdr56FYMIw9+CmrGZbBI=;
	b=TSCEfoNS8S8dUdoZdoJbZg33Yr6C7UtjMzbHR0O1ho70qeO3Zn8USCTOa419eQc8s+
	CYTyDicE63vl67MEWHM04qxn2UfNp2QhbD+yIsLTZQ1WrTnj3aScCFJpehCV0GQn1mwe
	VFTW/Csel1EbXOTvjabmxvXyTwU2Ij9dSu5QhkGTzTakOGdRNKFx3TMEMziE3kCPmb9U
	LNFnY49N4Sy5pVhYqT3b04DbYr3m76tl9JQ0sRSXDIlOm/dlgUyLPHH9/ie9tjjWRiSr
	xRuS8QF1Hv7fVs0vfhDa+E34wg1LyumXebJj5qD8oT7DqVhq0bV/hnUSBCdk9FmFPihR
	OzFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=S6pv9o2quMyZJIEj8ihQZKYPdr56FYMIw9+CmrGZbBI=;
	b=kAcUlFk3fL+hjr89xsuRzRbFVd3qEsAmtyET1KLhHf8xOZ8FjFllSiz0For/9EQatY
	PgIAcpCsb9drnn0V3RKFZjguk8u3+tqhnYuO27QHvB587PFDs3M89qSkH7ROhqzRQtto
	QcThWT642rYN6UIHWEBAW0JNugiJXa6DhcJ3lY8fMlC1DxSjvr2fWaKT2lycC3nNz8uQ
	s2HbH78HbNJ+9xsmL7T7NtWy7umOi7ZcVjxjAFk2RTbAwKRIeLgZRla3NbxJAbH5azc0
	YCCPhWV0uc3HcNC5VgpAO6Uov24o2c6aaqzpEN9SWKYsg2XEYjAyCqvTa///BIAAXI7C
	/Sfg==
X-Gm-Message-State: AKGB3mLocvfOIK3fqc2jMwqsbxVdAUqo2+6AnlwPqUHtuZJc0gQBqaVp
	bDL3fIiCjDp6pDysl9bwyLg9L54Y98uWgtYjkZY=
X-Received: by 10.223.132.165 with SMTP id 34mr9321925wrg.219.1515539927670;
	Tue, 09 Jan 2018 15:18:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Tue, 9 Jan 2018 15:18:17 -0800 (PST)
In-Reply-To: <20180108154303.6522-12-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
	<20180108154303.6522-12-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 9 Jan 2018 15:18:17 -0800
X-Google-Sender-Auth: jfEt4821WboiDeAx4n9gROFHVCs
Message-ID: <CAKmqyKOOnwp6ExPCy+ZxcjrLUUMmfyaWex6CuyQJ6Urt97xBWw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 11/31] hw/arm/exynos4210: use
 the "samsung, exynos4210-dw-mshc" device
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
	=?UTF-8?Q?Gr=C3=A9gory_Estrade?= <gregory.estrade@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QGnBrY6//1I3

On Mon, Jan 8, 2018 at 7:42 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/exynos4210.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
> index e8e1d81e62..eb95131221 100644
> --- a/hw/arm/exynos4210.c
> +++ b/hw/arm/exynos4210.c
> @@ -75,7 +75,6 @@
>  #define EXYNOS4210_INT_COMBINER_BASE_ADDR   0x10448000
>
>  /* SD/MMC host controllers */
> -#define EXYNOS4210_SDHCI_CAPABILITIES       0x05E80080
>  #define EXYNOS4210_SDHCI_BASE_ADDR          0x12510000
>  #define EXYNOS4210_SDHCI_ADDR(n)            (EXYNOS4210_SDHCI_BASE_ADDR =
+ \
>                                                  0x00010000 * (n))
> @@ -377,13 +376,10 @@ Exynos4210State *exynos4210_init(MemoryRegion *syst=
em_mem)
>          BlockBackend *blk;
>          DriveInfo *di;
>
> -        dev =3D qdev_create(NULL, TYPE_SYSBUS_SDHCI);
> -        qdev_prop_set_uint32(dev, "capareg", EXYNOS4210_SDHCI_CAPABILITI=
ES);
> -        qdev_init_nofail(dev);
> -
> -        busdev =3D SYS_BUS_DEVICE(dev);
> -        sysbus_mmio_map(busdev, 0, EXYNOS4210_SDHCI_ADDR(n));
> -        sysbus_connect_irq(busdev, 0, s->irq_table[exynos4210_get_irq(29=
, n)]);
> +        dev =3D sysbus_create_varargs("samsung,exynos4210-dw-mshc",

Isn't this a legacy function, shouldn't we be moving away from it?

Alistair

> +                                    EXYNOS4210_SDHCI_ADDR(n),
> +                                    s->irq_table[exynos4210_get_irq(29, =
n)],
> +                                    NULL);
>
>          di =3D drive_get(IF_SD, 0, n);
>          blk =3D di ? blk_by_legacy_dinfo(di) : NULL;
> --
> 2.15.1
>
>
