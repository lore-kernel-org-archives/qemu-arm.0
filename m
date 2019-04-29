Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3434832wrh;
        Mon, 29 Apr 2019 05:10:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyVE7PxfZ1081V9H7+tHQg0InfLIrmIqod36RrWIy4D1mRjsKsvQzeeDx1X2FdwSNsAV2g3
X-Received: by 2002:a5d:5383:: with SMTP id d3mr23141657wrv.105.1556539854611;
        Mon, 29 Apr 2019 05:10:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556539854; cv=none;
        d=google.com; s=arc-20160816;
        b=qA0Of7G0ZarDfS54AMYpJjLtfOKaHbYSV1raI+S0yD59pbLBmfqY1JTJdVZM4i5Pch
         q1vorrgsD7URmH0bWoQq6oJw3Zg7yTDLGXDDydzHDb5jYsvE/6GG+dmTgLQbAfj33w68
         9cb570jheDr7bBo4zLWa4dmDF1pOizfrtq7pVK1AViApOcubXnIc/LSHAS92bWzNZPob
         1nk5lLuo0IZNG4X2BFNrrgMww9dn7Wcr2/Z9WKdpltJ4Mq8KX50MM0N9jNe5aD331laV
         40mBuAOTvIFM+ccZ2jk4XaAYNfeIb1PDCRYI4ZW1gkLgpdDNjLaonRqd9o+UyzaM7Ere
         o6Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=SndB+j8luxvSoyoIFGCfGdOwjluHK3QkVJ3Fgdjq0oU=;
        b=pNb0NfrFW/3UoJICTTlivoQ/gDh5+YSyf+sYYaKbQ5LP/QNWb7nQ3s7BVAdr9Ji6G+
         qnyF1Acl5dx54EYrCXyDxmiEYbeXsBDhwNuSuKDUOQKkkHJYMj4TzwTIwewS0pSwOG+Z
         I8AzPXACpDklqyRJy/o8kYaNeS8Rh7GGb/SMDS/wadL79rGMlko6/+WkocxEf0Tqyuhp
         QZM82PpmVUN4zQlAsY4jY3baZ8BOcMZI75ZVyPJEcYoESfSVIsCCr8aYY7PGFeYK/rQg
         Hw5GscwHOUtQnN2eOG+F5oCcouuALcYgDPlst5MNxlzTiOFAmaNVrP4ON2uRAz2jUjYH
         EcrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GRHjlkrY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x9si23755055wrs.25.2019.04.29.05.10.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Apr 2019 05:10:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GRHjlkrY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:56795 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hL57V-00037k-Jz
	for alex.bennee@linaro.org; Mon, 29 Apr 2019 08:10:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41168)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL57J-00037Y-NQ
	for qemu-arm@nongnu.org; Mon, 29 Apr 2019 08:10:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL57I-00029E-Ot
	for qemu-arm@nongnu.org; Mon, 29 Apr 2019 08:10:41 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:42693)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hL57I-000289-KO
	for qemu-arm@nongnu.org; Mon, 29 Apr 2019 08:10:40 -0400
Received: by mail-oi1-x241.google.com with SMTP id k9so5033980oig.9
	for <qemu-arm@nongnu.org>; Mon, 29 Apr 2019 05:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=SndB+j8luxvSoyoIFGCfGdOwjluHK3QkVJ3Fgdjq0oU=;
	b=GRHjlkrYZp9K9xvDgKfjvQ9OYiI6tJ5giL2S0BIPb6cvVR/eeNnV6Kq1nmJkN/xG5B
	CNy0yMlltPkFx7XIiZtBLPWJk3ra+hxLVBHcwPKgWuGOCxCwNjeCh5H39VtyY5MLO/Ww
	nOODpcE3mc69I0j+2UzBSNE6KdBP+PC5amYjFIELYKPDiPaSG51yDDmG2biyTyNqwEVO
	0siU6Y0uTrTrEmqzARKkqMN4MJrGf9NwMNkKWMrQAl/LX1nU5CFSzjbZiCYmNW+s1/ck
	a9m2K90kOVzIbVQAUU7kzKUKeADg0L2I7Y/WC8DPohJgfTUx76u1WSW1H0CpjEg/UCMo
	X0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=SndB+j8luxvSoyoIFGCfGdOwjluHK3QkVJ3Fgdjq0oU=;
	b=XV9Q1RMAk5xlMT24HG7FWJ/o9MN8NuFPPu3Urh2xU6P7Dtu65QEJL2l/JA9Y+AG+pf
	JFpvXzV0mDqF1KHppRZJm/DCDtDDAlEy+6e9Ri0qPw3naYKTv2TkghcekwpZxyw0VBUk
	UJpY1/H7uqIiDJ7xuxYpPElTkNprRG+Q+d/PuAAiiDTQepcO/z1fynqNwV9p4++N4Hsz
	8g2uOAw5SD32R+lQbKgC9gKtVH7Ma2M1Y2gjqyRf2m/zaaIEdeQu9sreHJQ3wlxzW4YI
	CEJtV25vCtfUfNrwWAaNAKKg0Q7WM8GbZ45H0eHnjJQrE+abQyQRToXEO4Ee4UDVDiCO
	5yFw==
X-Gm-Message-State: APjAAAVJmN+DadcIZ9Aa8a5Nnog39ObkdzTdf9l9ErxuSpCfMJRdeqXF
	NYSHsA7a3IMn2UqriD0OpUrAhtr136Uc/ymxP4lG3Q==
X-Received: by 2002:a05:6808:301:: with SMTP id
	i1mr12698319oie.163.1556539839315; 
	Mon, 29 Apr 2019 05:10:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190411161013.4514-1-clg@kaod.org>
	<CAFEAcA-WeTRp0zs5Zu_g3uCjzXaqSf5-G3nyrxMn_n+fQAN08A@mail.gmail.com>
In-Reply-To: <CAFEAcA-WeTRp0zs5Zu_g3uCjzXaqSf5-G3nyrxMn_n+fQAN08A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Apr 2019 13:10:28 +0100
Message-ID: <CAFEAcA-7dLEsyhtyNatVYCpsptOB7ZXUYbxPrdXJwdAnHQ714A@mail.gmail.com>
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
X-TUID: xtF+kgTGzXw8

On Mon, 29 Apr 2019 at 13:07, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Thu, 11 Apr 2019 at 17:10, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> >
> > Hello,
> >
> > Here is a series adding a couple of cleanups to the Aspeed SoCs to
> > prepare ground for extensions and new SoCs.
> >
> > Thanks,
> >
> > C.
> >
> > C=C3=A9dric Le Goater (3):
> >   aspeed: add a per SoC mapping for the interrupt space
> >   aspeed: add a per SoC mapping for the memory space
> >   aspeed: use sysbus_init_child_obj() to initialize children
> >
>
>
>
> Applied to target-arm.next, thanks.

...spoke too soon. Clang doesn't like this:

/home/petmay01/linaro/qemu-from-laptop/qemu/hw/arm/aspeed_soc.c:155:25:
error: initializer element is not a
      compile-time constant
        .sdram_base   =3D aspeed_soc_ast2400_memmap[ASPEED_SDRAM],
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
1 error generated.
/home/petmay01/linaro/qemu-from-laptop/qemu/rules.mak:69: recipe for
target 'hw/arm/aspeed_soc.o' failed

thanks
-- PMM
