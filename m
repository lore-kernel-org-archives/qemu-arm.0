Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp5695616wru;
        Mon, 23 Jul 2018 07:05:12 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpe7Ht7ztm+o973Q1XpPXsACDkqhDsyY2KSgO3dikmjvZRuxu01+BXIjZdelkV9KViCnFq/H
X-Received: by 2002:a37:1f53:: with SMTP id f80-v6mr11043592qkf.1.1532354712595;
        Mon, 23 Jul 2018 07:05:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532354712; cv=none;
        d=google.com; s=arc-20160816;
        b=diPkiGy7tSclCbfidsIGStB402tHhL/CA0I598Y8C2O6VTT0Bb9Z3xMiTIXU0CRDAT
         umXtcCp/lJmYHymLCNfzeP5//neS8LWa8qqqe2CqTPshJUTHzxcJGcCn3MuJ3LqMhRtG
         wMn4oiFLsAm+IIX9SucMYxDRLhFj/0KAHQadtN35T2tNget+OyzEvJ6ah1YeYHv+z9Pa
         p2lmVhfqE2H4ylnHZwYbOqxUpwiHdL2haOLpbU+L0TzqBtWvR6yWt0mre0lOM7S7HtqF
         AVVJksIJg3D1P/ISybkzGNufK8iXB7K+Rdc9ejU/VAawk6wBY49aBkno1kyu0qwKr1Kq
         fEPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=0NQI60yKoEYb9/EUCKMDgSCFsDM5GRmWRtWtvt/AqFQ=;
        b=tzjn92klX4irfBmA+TArxPlSqq1hNQH77AyCiCx4KThH+KK+7gaUe0f4LKZL5MH/VQ
         gvnEsmeltomyRCJrz5Y8/FPXmkZKsguNgRnYczxAE+TkVGc3QGrBSbH57SxdljPwLvnJ
         lvp9hHnOPMhxK0tk+6G5RFGYDGyGcKie4O0miqrPIwk8b9reWq8Yp20C6fOxiNZe0IEB
         d2GzDpCMUnwCMQKzQVB0axQj829zSGoLGKVHPqQ5azRVW44DHxAItnZJ16i9G3RKEBdz
         kte1SZoOyz6VDjYFebfjnjPvvoU3vDTnMEmjgpurfgiYw7NayNQSG0cneoGvJpUIHWV0
         6pPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="LNr/cGIj";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a125-v6si6075912qkb.47.2018.07.23.07.05.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Jul 2018 07:05:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="LNr/cGIj";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34803 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fhbSa-0004T4-6U
	for alex.bennee@linaro.org; Mon, 23 Jul 2018 10:05:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33346)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fhbSH-0004Ss-9x
	for qemu-devel@nongnu.org; Mon, 23 Jul 2018 10:04:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fhbSG-0006Gd-He
	for qemu-devel@nongnu.org; Mon, 23 Jul 2018 10:04:53 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:37150)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fhbSG-0006F9-9k
	for qemu-devel@nongnu.org; Mon, 23 Jul 2018 10:04:52 -0400
Received: by mail-oi0-x243.google.com with SMTP id k81-v6so1302920oib.4
	for <qemu-devel@nongnu.org>; Mon, 23 Jul 2018 07:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0NQI60yKoEYb9/EUCKMDgSCFsDM5GRmWRtWtvt/AqFQ=;
	b=LNr/cGIjlp3j8hLmo1Oy1elzkCx8gAcJp18NtbPiZMqmlu/9dfnOWx9I2Y2nxfXJ1O
	4orAa1nFKXuQlJro7NlOc1oNJkaCx941i5cUPrYOyLtyZYSWmwPBbi78o5L+PVsfVEcT
	UJuKysgoZQC47EtAyDMnGgzROPl6JCao059ak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0NQI60yKoEYb9/EUCKMDgSCFsDM5GRmWRtWtvt/AqFQ=;
	b=UcdXAhar9bc56xOXWp4P9WENjs22HzsEEeQvMALc43G2MGfiEKZiPJy62vzy6ny++j
	cp/2RNW8R1oGUJ32x9JiaGeK7vnjMCaXUYlNFQnw6vYTPihRRHe0fOOCgf6UPRuHWWMM
	riVeLI9O1hP5ARJtPHTaTSw003yOQ7EOJVR/iIt13XrswkbQyhh+zK5b5hhTunTZ7YkK
	f73piZU8+rVmxGkLoqd6VXhjSSkkUlapkaR2eBrVGE61LpbSFuUEJd7Borm42ZCG2buo
	tCo2BZNlj22ckE2WdVvuCtRn3oQM3nhjP3dUCSFD/BePHtefUg/VqEHAC9aYd0vtu2W0
	TwKg==
X-Gm-Message-State: AOUpUlFcqK/fn06Soo9X7JQqA1GuKK92MBY6A2tM9UrhWqki1uXK/K5y
	09KlhGUrfms+PkOlKJbVjqD4WwZ5x/Rxm7miSic/yg==
X-Received: by 2002:aca:7247:: with SMTP id
	p68-v6mr9197144oic.252.1532354691456; 
	Mon, 23 Jul 2018 07:04:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Mon, 23 Jul 2018 07:04:31
	-0700 (PDT)
In-Reply-To: <1532337784-334-1-git-send-email-thuth@redhat.com>
References: <1532337784-334-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Jul 2018 15:04:31 +0100
Message-ID: <CAFEAcA96Wz09jbbSSB5kRkGKSz+FkHUxd5McGqXEXkyuhyqF1w@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-devel] [PATCH] hw/intc/exynos4210_gic: Turn instance_init
 into realize function
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: blr/xBpWoHmJ

On 23 July 2018 at 10:23, Thomas Huth <thuth@redhat.com> wrote:
> The instance_init function of the "exynos4210.gic" device creates a
> new "arm_gic" device and immediately realizes it with qdev_init_nofail().
> This will leave a lot of object in the QOM tree during introspection of
> the "exynos4210.gic" device, e.g. reproducible by starting QEMU like this:
>
> qemu-system-aarch64 -M none -nodefaults -nographic -monitor stdio
>
> And then by running "info qom-tree" at the HMP monitor, followed by
> "device_add exynos4210.gic,help" and finally checking "info qom-tree"
> again.
>
> Also note that qdev_init_nofail() can exit QEMU in case of errors - and
> this must never happen during an instance_init function, otherwise QEMU
> could terminate unexpectedly during introspection of a device.
>
> Since most of the code that follows the qdev_init_nofail() depends on
> the realized "gicbusdev", the easiest solution to the problem is to
> turn the whole instance_init function into a realize function instead.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>



Applied to target-arm.next, thanks.

-- PMM
