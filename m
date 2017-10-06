Received: by 10.223.197.9 with SMTP id q9csp1729785wrf;
        Fri, 6 Oct 2017 07:48:41 -0700 (PDT)
X-Received: by 10.200.37.140 with SMTP id e12mr3400108qte.312.1507301321277;
        Fri, 06 Oct 2017 07:48:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507301321; cv=none;
        d=google.com; s=arc-20160816;
        b=KShkKgJOVObTPAyL5FirdEzU+KpbBlO5PbneiNUL17IsAfKinN1zAbsQRGJqKSkPng
         wVBNFTYzBslU5RTgi9KCsQQLlIE0P9Wm29LFL4qvR5OlVGLKbVKjSdHILfvQumTuEKSX
         GVYHvCOGCJOdK9tJ1PQ9n8tkdShFyEJKLVWTy+sLumKSFNk/3ZLsF0+yi9ux4a7BJn9U
         dkFZtVJ2qufqvEU0k3yJsfdP0jAptUywoqcsG4C+b+jrXfKT8yPqw0V4vI3wNd4fibIi
         0ZRor5Rkf9Pn4H18YRvpb3K87eKqNnJuOpmPmgD/RxeTi1b3SSD9An+1jPGiZQB1HirV
         /i9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=L+EciOgJB1q9e5TJ0lhmnuOITmdhlLBP2G52pU/8bes=;
        b=Yukcx/SCmSuJKFYmSUX44598jrSWYL7fyOlNtgyC//QC8+DjRDJv9mL+xrmxLLh7+O
         T+v0oQX5lCdnZQ8ru/bUlMqseIiJ2m5qHkXF+kknLvRoD92wMV33cmaNvrFl17Kd+IzP
         iFgr6lUjNRz66iX5Yc31G5BzGpgR/WCB7IbuVtQX3B93O0DbBsX+tSF+02MI5YsTjCSH
         5qG9diqbwjxmQNIVZSFu3acHPyfYVneXcurM7fOLtYHgx2vZw57+swD+HcpJQX5ot6JC
         9P08JYsP8Fj2Hdv8ISgQ+4gJWWrAOxiGLns5vGsyg5oop90jInow78MONgBCXmm9AZr1
         zWUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=K+JnAL4Z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b51si1423720qta.377.2017.10.06.07.48.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Oct 2017 07:48:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=K+JnAL4Z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45340 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0Tvc-0002QI-OF
	for alex.bennee@linaro.org; Fri, 06 Oct 2017 10:48:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59582)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0TuI-0001vD-Uw
	for qemu-devel@nongnu.org; Fri, 06 Oct 2017 10:47:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0TuH-00008l-Op
	for qemu-devel@nongnu.org; Fri, 06 Oct 2017 10:47:18 -0400
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233]:52685)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e0TuH-00007A-Hd
	for qemu-devel@nongnu.org; Fri, 06 Oct 2017 10:47:17 -0400
Received: by mail-wm0-x233.google.com with SMTP id k4so8403811wmc.1
	for <qemu-devel@nongnu.org>; Fri, 06 Oct 2017 07:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=L+EciOgJB1q9e5TJ0lhmnuOITmdhlLBP2G52pU/8bes=;
	b=K+JnAL4ZKVf3iN7WQqwUWbZiadG0SKTsUAa3KZwxLWuMejGyuR8cjnVmUa6Zyzm189
	jk1MGqKP+5wKY3Ya9UAKX8IHYP/Q2vbO0PEfCG/7K7f33T6Pvlq11S0dFplDs5PGooFN
	SQL586fmfuUrgtIqMm/9d0lMMcT2vSgoOyk2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=L+EciOgJB1q9e5TJ0lhmnuOITmdhlLBP2G52pU/8bes=;
	b=VPb4IJqIckBCzY0et4yLmFFttcxQpMPM1sILZrp6+nEy3td+DLh9lsISAOohhpa+G2
	GoGK8bbGUJywutVB3xtnoinZEfI4eHdibVjThS6+sxFwXlOLufpsnk8xPGXHoQcxILpt
	czmGvQt9X78AdhBFu+Tnsum3HhrsuB9AuYh+5jbo+fFDjuKk3w0yCiC1Vhf583pNqglk
	Vw83UHiH+d0oumgVmN22CqbGHr8Axw1Tets2Zcp04DV8XIQmmbZtV6TtcJSGB3a58/XW
	M0KCYZu3WfrPr7RJI5j0VZ4lWTKF05jY9ldanFgvxkJ/3Sc4TLXhE8mdXNhQNIWEOAq2
	cmHw==
X-Gm-Message-State: AMCzsaU1b3G2uHaz9JCdzudsLV8BePC8D+tFCosUDKJ4D6ujRfcMyp+3
	nR0ZuigDNSh7Y2Ogr1VTlAzPJo+RGAz0/nn/5SffAg==
X-Google-Smtp-Source: AOwi7QCYtpjBC3mk6aaPXDGJD4IvJv1jFWKGBWmcHHG2lZOZ/0fm7sk0V1zF7+Del10ljGD52tw4AmZj0kz09ehhUa4=
X-Received: by 10.28.113.196 with SMTP id d65mr1867423wmi.151.1507301236400;
	Fri, 06 Oct 2017 07:47:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Fri, 6 Oct 2017 07:46:55 -0700 (PDT)
In-Reply-To: <20170918195100.17593-1-andrew.smirnov@gmail.com>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Oct 2017 15:46:55 +0100
Message-ID: <CAFEAcA9nAK8RJmb5RHpw1xPv6HZp_E-YWztahfNPtg2_yjfY2g@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::233
Subject: Re: [Qemu-devel] [PATCH 00/17] Initial i.MX7 support
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gyAHLpIxovqr

On 18 September 2017 at 20:50, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> Hi everyone,
>
> This patch series contains the work that I've done in order to enable
> support for i.MX7 emulation in QEMU. Majority of the set are just odd
> fixes and small features implementation that I had to do to already
> exisitng code but last 5 commits contain new emulation code.
>
> As the one before last commit in the series states the supported i.MX7
> features are:
>
>     * up to 2 Cortex A9 cores (SMP works with PSCI)
>     * A7 MPCORE (identical to A15 MPCORE)
>     * 7 i.MX UARTs
>     * 1 CCM device
>     * 2 Ethernet controllers (FEC)
>     * 3 SD controllers (USDHC)
>     * 1 SNVS device
>     * 1 WDT device
>
> I also have a follow up series that implements bit needes for PCIe
> emulation support (DesignWare IP emulation + supporting code) which
> I'll be submitting after this series is accepted.

Hi; thanks for these patches. I've now reviewed most of them. Hopefully
somebody else can get to the sdhci patches, as sdhci is not an
area I know much about and I don't think I have the specs.

Please also run your patches through scripts/checkpatch.pl and fix
those issues as necessary (the script does occasionally have false
positives so you need not follow it blindly if it suggests something
ridiculous).

thanks
-- PMM
